FROM rabbitmq:3.7-management

RUN apt-get update && \
    apt-get -y --no-install-recommends --no-install-suggests install ca-certificates curl unzip && \
    rm -rf /var/lib/apt/lists/*
    
RUN curl https://dl.bintray.com/rabbitmq/community-plugins/3.7.x/rabbitmq_delayed_message_exchange/rabbitmq_delayed_message_exchange-20171201-3.7.x.zip > /tmp/delayed_plugin.zip
RUN cd /tmp && \
    unzip delayed_plugin.zip && \
    rm delayed_plugin.zip && \
    mv rabbitmq_delayed_message_exchange-20171201-3.7.x.ez $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-20171201-3.7.x.ez

RUN rabbitmq-plugins enable --offline rabbitmq_management rabbitmq_delayed_message_exchange
