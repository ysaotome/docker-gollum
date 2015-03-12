FROM ysaotome/ubuntu

MAINTAINER Yuichi Saotome <y@sotm.jp>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
#RUN apt-get install -y -q build-essential ruby1.9.3 python2.7 ruby-bundler libicu-dev libreadline-dev libssl-dev zlib1g-dev 
RUN apt-get install -y -q build-essential ruby python ruby-bundler libicu-dev libreadline-dev libssl-dev zlib1g-dev 
RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Install gollum
RUN gem install gollum redcarpet github-markdown

# Initialize wiki data
RUN mkdir /root/wikidata
RUN git init /root/wikidata
WORKDIR /root/wikidata

# Expose default gollum port 4567
EXPOSE 4567

ENTRYPOINT ["/usr/local/bin/gollum", "/root/wikidata"]
