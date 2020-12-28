Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.45262.1609161135051827531
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Dec 2020 05:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: thomas.perrot@bootlin.com)
X-Originating-IP: 88.162.151.131
Received: from localhost.localdomain (unknown [88.162.151.131])
	(Authenticated sender: thomas.perrot@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2952E40003;
	Mon, 28 Dec 2020 13:12:11 +0000 (UTC)
From: "Thomas Perrot" <thomas.perrot@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-erlang][PATCH] rabbitmq-server: the initscrit creates the log dir if doesn't exist
Date: Mon, 28 Dec 2020 14:12:00 +0100
Message-Id: <20201228131200.732313-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting : FAILED - check /var/log/rabbitmq/startup_{log, _err}
/etc/rc5.d/S20rabbitmq-server: line 77: can't create /var/log/rabbitmq/startup_err: nonexistent directory

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 recipes-connectivity/rabbitmq/files/rabbitmq-server | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-connectivity/rabbitmq/files/rabbitmq-server b/recipes-connectivity/rabbitmq/files/rabbitmq-server
index bffd4ce..2694c6c 100644
--- a/recipes-connectivity/rabbitmq/files/rabbitmq-server
+++ b/recipes-connectivity/rabbitmq/files/rabbitmq-server
@@ -44,6 +44,12 @@ ensure_pid_dir () {
     fi
 }
 
+ensure_log_dir () {
+    if [ ! -d "$INIT_LOG_DIR" ] ; then
+        mkdir -p $INIT_LOG_DIR
+    fi
+}
+
 remove_pid () {
     rm -f ${PID_FILE}
     rmdir `dirname ${PID_FILE}` || :
@@ -56,6 +62,7 @@ start_rabbitmq () {
     else
         RETVAL=0
         ensure_pid_dir
+        ensure_log_dir
         set +e
         RABBITMQ_PID_FILE=$PID_FILE start-stop-daemon --pidfile=$PID_FILE --exec $DAEMON --background --start
         $CONTROL wait $PID_FILE >/dev/null 2>&1
-- 
2.29.2

