Return-Path: <n.s.glynn@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id C2F0A6CE92
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 13:53:01 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so7154347wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4x47SSHs82xXwWw0T8sdTQji6mXHTWVY+6sGdpV3Z34=;
	b=EBhFOemDoGLDJi7pwCNHwIcIrHt9Qvk70xz4Aw/oTBf6Ffp4yL/07FJG93GNoXUxyi
	BlzaPrWWuTfX07E86eqfxA2nFgw3sLWTbE9MsbFfTUdp/w5W7jxqLSnhWO5XZCzLRpw5
	yd7TN4TLz74+z9YiHfMekHNd/lO+gWWyTb/9wzHpBCI49xp5hvFiOuejraIf++YROv9U
	APfToyBvbJXwkXNlYOBVpvDSQLkNvgcLLYsJT4P5CcOmZZWIP5WahY1nfYPtLgYhaqtW
	rjIqP80JpQiAoHvAYJZFrMHNF5CZn7pEcfWFRx9Zb7Q50bZPdk9EP/HvwRz1OOK7PY0H
	fXAg==
X-Received: by 10.180.187.236 with SMTP id fv12mr14966379wic.20.1381758782403; 
	Mon, 14 Oct 2013 06:53:02 -0700 (PDT)
Received: from zeus.default ([2.26.95.140])
	by mx.google.com with ESMTPSA id e5sm34501421wiy.2.2013.10.14.06.53.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Oct 2013 06:53:01 -0700 (PDT)
From: Nick Glynn <n.s.glynn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 14:52:21 +0100
Message-Id: <1381758741-18744-1-git-send-email-n.s.glynn@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-webserver][PATCH] Backport for dylan of sthttpd
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
X-List-Received-Date: Mon, 14 Oct 2013 13:53:03 -0000

Signed-off-by: Nick Glynn <n.s.glynn@gmail.com>
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd/init  | 52 ++++++++++++++++++++++
 .../recipes-httpd/sthttpd/sthttpd_2.26.4.bb        | 30 +++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/sthttpd/sthttpd/init
 create mode 100644 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd/init b/meta-webserver/recipes-httpd/sthttpd/sthttpd/init
new file mode 100644
index 0000000..70f6797
--- /dev/null
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd/init
@@ -0,0 +1,52 @@
+#!/bin/sh
+
+### BEGIN INIT INFO
+# Provides:          thttpd
+# Required-Start:    $remote_fs $syslog
+# Required-Stop:     $remote_fs $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Small http server
+# Description:       thttpd is a simple, small, portable, fast, and secure HTTP server.
+### END INIT INFO
+
+
+thttpd=/usr/sbin/thttpd
+test -x "$thttpd" || exit 0
+
+
+case "$1" in
+  start)
+    echo -n "Starting thttpd"
+    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping thttpd"
+    start-stop-daemon --stop --quiet --exec $thttpd
+    echo "."
+    ;;
+  reload|force-reload)
+    start-stop-daemon --stop --quiet --signal 1 --exec $thttpd
+    ;;
+  restart)
+    echo -n "Stopping thttpd"
+    start-stop-daemon --stop --quiet --exec $thttpd -- -d @@SRVDIR
+    echo "."
+    echo -n "Waiting for thttpd to die off"
+    for i in 1 2 3 ;
+    do
+        sleep 1
+        echo -n "."
+    done
+    echo ""
+    echo -n "Starting thttpd"
+    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/thttpd {start|stop|reload|restart|force-reload}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
new file mode 100644
index 0000000..b720314
--- /dev/null
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
@@ -0,0 +1,30 @@
+SUMMARY = "A simple, small, portable, fast, and secure HTTP server"
+DESCRIPTION = "A simple, small, portable, fast, and secure HTTP server (supported fork of thttpd)."
+HOMEPAGE = "http://opensource.dyc.edu/sthttpd"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://src/thttpd.c;beginline=1;endline=26;md5=0c5762c2c34dcbe9eb18815516502872"
+
+SRC_URI = "http://opensource.dyc.edu/pub/sthttpd/sthttpd-${PV}.tar.gz \
+           file://init"
+
+SRC_URI[md5sum] = "e645a85a97d3cb883011a35bc2211815"
+SRC_URI[sha256sum] = "78e87979140cbda123c81b4051552242dbbffb5dec1a17e5f95ec4826b1eaddb"
+
+S = "${WORKDIR}/sthttpd-${PV}"
+
+inherit autotools update-rc.d
+
+EXTRA_OEMAKE += "'WEBDIR=${servicedir}/www'"
+
+do_install_append () {
+    install -d ${D}${sysconfdir}/init.d
+    install -c -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/thttpd
+    sed -i -e 's,@@SRVDIR,${servicedir}/www,g' ${D}${sysconfdir}/init.d/thttpd
+    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/thttpd
+}
+
+INITSCRIPT_NAME = "thttpd"
+INITSCRIPT_PARAMS = "defaults"
+
+FILES_${PN} += "${servicedir}"
+FILES_${PN}-dbg += "${servicedir}/www/cgi-bin/.debug"
-- 
1.8.3.1


