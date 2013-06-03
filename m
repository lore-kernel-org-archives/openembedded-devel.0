Return-Path: <danismostlikely@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6475E61EBD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2013 22:15:36 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id h1so1407266oag.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jun 2013 15:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Cy6BLWYJ2j7ye6L0c4zDNuIUL+LkrbljTOxYDUZwjyg=;
	b=R7/wWdxa86XdGjzWRIOxCnbY1Ypq1WXL4iA3kbCdf7ZGtspWpjupS129/6iBz7NOMC
	UyeV65t4sAMNo2QWptQVCUjUGDECVGRdjMy3dtsqDnb3XA9RXlFM3kw3zETpPxev/t8k
	2IDrVmPumGP3R9zfsnJVxfAItnKcpvaDuKNyP5RWSll1ecXFOPJeeWWoQVnqrYu2MRNd
	mA8oY1Z1H2winZ7XSJJfuY4hTMfGtKLvC8DKZMyYUuiUWNgH01JZu9EyDh/CPFnE4roq
	EaRrakiCyIqIkjZq9Rfc3gain1V+oGB6T+u3LMMQchbPAdPv+8sCcZW3wqq+aqIPeUeM
	FCMg==
X-Received: by 10.182.125.164 with SMTP id mr4mr11047588obb.94.1370297736891; 
	Mon, 03 Jun 2013 15:15:36 -0700 (PDT)
Received: from mediabox.gateway.2wire.net
	(71-17-188-15.sktn.hsdb.sasknet.sk.ca. [71.17.188.15])
	by mx.google.com with ESMTPSA id n5sm47737883obi.8.2013.06.03.15.15.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 03 Jun 2013 15:15:36 -0700 (PDT)
From: Dan McGregor <dan.mcgregor@usask.ca>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jun 2013 16:15:20 -0600
Message-Id: <1370297720-9983-1-git-send-email-dan.mcgregor@usask.ca>
X-Mailer: git-send-email 1.8.1.4
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [meta-oe][PATCH] Add sysv init script for gateone.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jun 2013 22:15:37 -0000

---
 .../gateone/gateone/gateone-init                   | 47 ++++++++++++++++++++++
 .../recipes-connectivity/gateone/gateone_git.bb    |  7 +++-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/gateone/gateone/gateone-init

diff --git a/meta-oe/recipes-connectivity/gateone/gateone/gateone-init b/meta-oe/recipes-connectivity/gateone/gateone/gateone-init
new file mode 100644
index 0000000..a1cf5ce
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gateone/gateone/gateone-init
@@ -0,0 +1,47 @@
+#!/bin/sh -e
+### BEGIN INIT INFO
+# Provides:          gateone
+# Required-Start:    networking
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Gateone HTML5 ssh client
+# Description:       Gateone HTML5 terminal emulator and SSH client.
+### END INIT INFO
+
+. /etc/init.d/functions
+
+NAME=gateone
+DAEMON=/var/lib/gateone/gateone.py
+PIDFILE=/var/run/gateone.pid
+WORKDIR=/var/lib/gateone
+
+do_start() {
+    cd $WORKDIR
+    /usr/bin/python $DAEMON > /dev/null 2>&1 &
+    cd $OLDPWD
+}
+
+do_stop() {
+    kill -TERM `cat $PIDFILE`
+}
+
+case "$1" in
+    start)
+        echo "Starting gateone"
+        do_start
+        ;;
+    stop)
+        echo "Stopping gateone"
+        do_stop
+        ;;
+    restart|force-reload)
+        echo "Restart gateone"
+        do_stop
+        sleep 1
+        do_start
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart|force-reload}" >&2
+        exit 1
+        ;;
+esac
diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index e5b8527..85c32cc 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -10,11 +10,12 @@ SRC_URI = "git://github.com/liftoff/GateOne.git \
            file://gateone-avahi.service \
            file://server.conf \
            file://gateone.service \
+           file://gateone-init \
 "
 
 S = "${WORKDIR}/git"
 
-inherit distutils allarch python-dir systemd
+inherit distutils allarch python-dir systemd update-rc.d
 
 export prefix = "${localstatedir}/lib"
 
@@ -28,6 +29,9 @@ do_install_append() {
     
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system
+
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/gateone-init ${D}${sysconfdir}/init.d/gateone
 }
 
 FILES_${PN} = "${localstatedir}/lib ${localstatedir}/log ${localstatedir}/volatile/log ${base_libdir} ${sysconfdir} ${PYTHON_SITEPACKAGES_DIR}"
@@ -63,3 +67,4 @@ RDEPENDS_${PN} = "file \
 "
 
 SYSTEMD_SERVICE_${PN} = "gateone.service"
+INITSCRIPT_NAME = "gateone"
-- 
1.8.1.4


