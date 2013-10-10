Return-Path: <n.s.glynn@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 905466CE93
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 21:45:32 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id x55so3255969wes.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 14:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vY9qARYGJYC/akFiWJUEVGtnI1+y+no5PdUe8rTcUeQ=;
	b=JuFUNLqA6fvJZ8/exl70YV0Lbeid2poQ65fBCZ25szXIiTyQQWNreYPTuugyxKcU0o
	rwBVgeqFgQLrUTcshVmPhaGKUPuLJZ/6tOC8MtB8ysCamz0+U5n+gEWhoAA7kGafzuha
	w9+9D24yOgdtrQKaMXtVu5dL+gQqgratcrBJbI1W4Oq2J9YGiIDVkmhLZatF2IKUGZmV
	hX8Sa45u78Ascnc+WMcdI9je9joVCda6w6ACxECUC4MdRbcA7KCq2TE++Db4pvtoTwOa
	aHsDt44lZUajTqoPUkjqFVjuREgMt6GNG70im8Y5gS7MRO0rYnlDKvnPKJeo5y0rqpiK
	GtmA==
X-Received: by 10.180.107.99 with SMTP id hb3mr365303wib.34.1381441533971;
	Thu, 10 Oct 2013 14:45:33 -0700 (PDT)
Received: from zeus.default ([2.26.95.140])
	by mx.google.com with ESMTPSA id j5sm29559726wia.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 14:45:33 -0700 (PDT)
From: Nick Glynn <n.s.glynn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2013 22:45:07 +0100
Message-Id: <1381441508-4287-1-git-send-email-n.s.glynn@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-webserver][PATCH 1/2] sthttpd: Added missing recipe
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
X-List-Received-Date: Thu, 10 Oct 2013 21:45:33 -0000

Recipe backport for sthttpd into angstrom/meta-openembedded from meta-oe.

Signed-off-by: Nick Glynn <n.s.glynn@gmail.com>
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd/init  | 52 ++++++++++++++++++++++
 .../recipes-httpd/sthttpd/sthttpd_2.26.4.bb        | 31 +++++++++++++
 2 files changed, 83 insertions(+)
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
index 0000000..ba2f047
--- /dev/null
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
@@ -0,0 +1,31 @@
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
+
-- 
1.8.3.1


