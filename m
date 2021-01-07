Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.5995.1610011598277891800
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jan 2021 01:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: thomas.perrot@bootlin.com)
X-Originating-IP: 88.162.151.131
Received: from localhost.localdomain (unknown [88.162.151.131])
	(Authenticated sender: thomas.perrot@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E139B60002;
	Thu,  7 Jan 2021 09:26:35 +0000 (UTC)
From: "Thomas Perrot" <thomas.perrot@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-erlang][PATCH] rabbitmq-server: correct some sysvinit issues
Date: Thu,  7 Jan 2021 10:26:31 +0100
Message-Id: <20210107092631.1180950-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- When the sysvinit distro feature is used, if the log directory doesn’t exist
  the script “rabbitmq-server-setup” is called, as for the systemd’s service.
- When the rabbitmq-sercer process is started successfully the return code is 69
  instead of 0.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 recipes-connectivity/rabbitmq/files/rabbitmq-server    | 9 ++++-----
 recipes-connectivity/rabbitmq/rabbitmq-server_3.8.3.bb | 6 +++---
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/recipes-connectivity/rabbitmq/files/rabbitmq-server b/recipes-connectivity/rabbitmq/files/rabbitmq-server
index bffd4ce..2540fc1 100644
--- a/recipes-connectivity/rabbitmq/files/rabbitmq-server
+++ b/recipes-connectivity/rabbitmq/files/rabbitmq-server
@@ -16,10 +16,7 @@
 # Short-Description: Enable AMQP service provided by RabbitMQ broker
 ### END INIT INFO
 
-# Ensure that HOME is set, since the erlang ookie file must be written
-# somewhere
-export HOME=%ROOT_HOME%
-
+SETUP=/usr/bin/rabbitmq-server-setup
 DAEMON=/usr/bin/rabbitmq-server
 CONTROL=/usr/bin/rabbitmqctl
 USER=rabbitmq
@@ -62,7 +59,7 @@ start_rabbitmq () {
         RETVAL=$?
         set -e
         case "$RETVAL" in
-            0)
+            69)
                 echo SUCCESS
                 if [ -n "$LOCK_FILE" ] ; then
                     touch $LOCK_FILE
@@ -141,6 +138,8 @@ restart_rabbitmq() {
     start_rabbitmq
 }
 
+source $SETUP
+
 case "$1" in
     start)
         echo -n "Starting $DESC: "
diff --git a/recipes-connectivity/rabbitmq/rabbitmq-server_3.8.3.bb b/recipes-connectivity/rabbitmq/rabbitmq-server_3.8.3.bb
index 864810b..6ca11bb 100644
--- a/recipes-connectivity/rabbitmq/rabbitmq-server_3.8.3.bb
+++ b/recipes-connectivity/rabbitmq/rabbitmq-server_3.8.3.bb
@@ -87,17 +87,17 @@ do_install() {
     install -m 644 ${WORKDIR}/rabbitmq.conf ${D}/${sysconfdir}/rabbitmq/rabbitmq.conf
     chown root.rabbitmq ${D}/${sysconfdir}/rabbitmq/rabbitmq.conf
 
+    install -d ${D}${bindir}
+    install -m 0755 ${WORKDIR}/rabbitmq-server-setup ${D}${bindir}
+
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 ${WORKDIR}/rabbitmq-server ${D}${sysconfdir}/init.d/rabbitmq-server
-        sed -e "s:%ROOT_HOME%:/var/lib/rabbitmq:" -i ${D}${sysconfdir}/init.d/rabbitmq-server
     fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${WORKDIR}/rabbitmq-server.service ${D}${systemd_unitdir}/system
-	install -d ${D}${bindir}
-	install -m 0755 ${WORKDIR}/rabbitmq-server-setup ${D}${bindir}
     fi
 }
 
-- 
2.29.2

