###########################################################
#
# Dockerfile for using unoconv through a webservice
#
###########################################################

# Setting the base to docker-node-unoconv
FROM zrrrzzt/docker-node-unoconv:4.7.3

# Maintainer
MAINTAINER Geir Gåsodden

# Clone the repo
RUN git clone https://github.com/zrrrzzt/tfk-api-unoconv.git unoconvservice

# Change working directory
WORKDIR /unoconvservice

# Install dependencies
RUN npm install --production

# Env variables
ENV SERVER_PORT 3000
ENV PAYLOAD_MAX_SIZE 1048576

# Expose 3000
EXPOSE 3000

# Startup
ENTRYPOINT /usr/bin/unoconv --listener --server=0.0.0.0 --port=2002 & node standalone.js
