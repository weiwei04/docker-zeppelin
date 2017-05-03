FROM       gettyimages/spark:2.1.0-hadoop-2.7
MAINTAINER Wei Wei <weiwei.inf@gmail.com>
ARG        DIST_MIRROR=http://archive.apache.org/dist/zeppelin
ARG        VERSION=0.7.1
ENV        ZEPPELIN_HOME=/opt/zeppelin
ENV        zeppelin_ver=zeppelin-0.7.1-bin-all
ENV        ZEPPELIN_CONF_DIR $ZEPPELIN_HOME/conf
ENV        ZEPPELIN_NOTEBOOK_DIR $ZEPPELIN_HOME/notebook
RUN        mkdir -p ${ZEPPELIN_HOME} && \
           curl ${DIST_MIRROR}/zeppelin-${VERSION}/zeppelin-${VERSION}-bin-all.tgz | tar xvz -C ${ZEPPELIN_HOME} && \
           mv ${ZEPPELIN_HOME}/zeppelin-${VERSION}-bin-all/* ${ZEPPELIN_HOME} && \
           rm -rf ${ZEPPELIN_HOME}/zeppelin-${VERSION}-bin-all && \
           rm -rf *.tgz
RUN        cp ${ZEPPELIN_HOME}/conf/shiro.ini.template ${ZEPPELIN_HOME}/conf/shiro.ini
WORKDIR    ${ZEPPELIN_HOME}
CMD        ["./bin/zeppelin.sh"]
