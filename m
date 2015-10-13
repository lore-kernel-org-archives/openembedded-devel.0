Return-Path: <eduardo@monkey.io>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id D43C177046
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 20:18:23 +0000 (UTC)
Received: by ykoo7 with SMTP id o7so28468009yko.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 13:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jRP8fx1cvuxpnnnCSCVn+thFtld9vj4NKRBB9IC7zME=;
	b=cbkTanZU5ZHrHi76fcxvtaxbYjTzsgvKju4DcGCR7oRZ2g9PBxuzvdn8fcUS875f3C
	imVLMZWKUEbN0HioV53j4swEZAaGVTk/qc/U+Y/vHsiMyVIbUGLSzccIhjzvPIofrRHx
	SRIAyYfGWDB8II4XcWk1NmGXy9xGXsFI4YL86iZJydhm327QzQyLWeMZ4+xaU/Fwksiu
	IvKyHMowlHt0ACai+Os80fX0ujKB6aQ69WHFDhXxxni2LNl5czSbHd4qvfzSAevz49LN
	P35YKe1NzoEwl8Vl4hnriAbJJ7ED0XEMf/jYS4I44kJMtgW36uW5kmV18ZFWRGBAkR6C
	2jjA==
X-Gm-Message-State: ALoCoQluog1y+J1hf61sldCp5F3Kl3llBlt5UrOlst1U9rox5Ze6YPU4o8swlUwUHfVDRVqHwgpC
X-Received: by 10.13.234.2 with SMTP id t2mr25626345ywe.89.1444767503982;
	Tue, 13 Oct 2015 13:18:23 -0700 (PDT)
Received: from monotop.cabletica.com (ip81-31-15-186.ct.co.cr. [186.15.31.81])
	by smtp.gmail.com with ESMTPSA id
	q62sm3140330ywe.49.2015.10.13.13.18.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Oct 2015 13:18:23 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Oct 2015 14:18:10 -0600
Message-Id: <1444767490-6833-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 2.1.4
Subject: [meta-webserver][PATCH] monkey: new v1.6.3 release.
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
X-List-Received-Date: Tue, 13 Oct 2015 20:18:27 -0000

This patch add the new Monkey HTTP Server v1.6.3.

For more details about software changes please visit:

  http://monkey-project.com/Announcements/v1.6.3

=== Build Tests ==

This version have been tested on Yocto/Fido being packaged and
deployed on images based on RPM successfully.

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../recipes-httpd/monkey/files/monkey.init         | 34 ------------
 .../recipes-httpd/monkey/files/monkey.service      | 12 ----
 .../recipes-httpd/monkey/monkey_1.5.6.bb           | 64 ----------------------
 .../recipes-httpd/monkey/monkey_1.6.3.bb           | 44 +++++++++++++++
 4 files changed, 44 insertions(+), 110 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/monkey/files/monkey.init
 delete mode 100644 meta-webserver/recipes-httpd/monkey/files/monkey.service
 delete mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
 create mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.6.3.bb

diff --git a/meta-webserver/recipes-httpd/monkey/files/monkey.init b/meta-webserver/recipes-httpd/monkey/files/monkey.init
deleted file mode 100644
index 40b2118..0000000
--- a/meta-webserver/recipes-httpd/monkey/files/monkey.init
+++ /dev/null
@@ -1,34 +0,0 @@
-#!/bin/sh
-
-PATH=/sbin:/bin:/usr/sbin:/usr/bin
-DAEMON=/usr/bin/monkey
-NAME=monkey
-DESC="Monkey HTTP Server"
-OPTS="--daemon"
-
-case "$1" in
-  start)
-	echo -n "Starting $DESC: "
-	start-stop-daemon --start -x "$DAEMON" -- $OPTS
-	echo "$NAME."
-	;;
-  stop)
-	echo -n "Stopping $DESC: "
-	start-stop-daemon --stop -x "$DAEMON"
-	echo "$NAME."
-	;;
-  restart|force-reload)
-	echo -n "Restarting $DESC: "
-	start-stop-daemon --stop -x "$DAEMON"
-	sleep 1
-	start-stop-daemon --start -x "$DAEMON" -- $OPTS
-	echo "$NAME."
-	;;
-  *)
-	N=/etc/init.d/$NAME
-	echo "Usage: $N {start|stop|restart|force-reload}" >&2
-	exit 1
-	;;
-esac
-
-exit 0
diff --git a/meta-webserver/recipes-httpd/monkey/files/monkey.service b/meta-webserver/recipes-httpd/monkey/files/monkey.service
deleted file mode 100644
index f9aa57f..0000000
--- a/meta-webserver/recipes-httpd/monkey/files/monkey.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=Monkey HTTP Server
-After=network.target remote-fs.target
-
-[Service]
-Type=forking
-ExecStart=/usr/bin/monkey --daemon
-PIDFile=/var/run/monkey.pid.2001
-TimeoutSec=10
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
deleted file mode 100644
index d7330a1..0000000
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
+++ /dev/null
@@ -1,64 +0,0 @@
-SUMMARY = "Fast and Lightweight HTTP Server for Linux"
-HOMEPAGE = "http://monkey-project.com"
-BUGTRACKER = "https://github.com/monkey/monkey/issues"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
-
-SECTION = "net"
-
-SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
-           file://monkey.service \
-           file://monkey.init"
-
-SRC_URI[md5sum] = "9699e4c9ea6ce6b989907c252ae80254"
-SRC_URI[sha256sum] = "7c3d845306aa74ee6effd7ab6169d16ac4e6450e564954d0d0baa2d1e9be1a22"
-
-EXTRA_OECONF = "--plugdir=${libdir}/monkey/ \
-                --logdir=${localstatedir}/log/monkey/ \
-                --pidfile=${localstatedir}/run/monkey.pid \
-                --default-user=www-data \
-                --datadir=${localstatedir}/www/monkey/ \
-                --sysconfdir=${sysconfdir}/monkey/ \
-                --enable-plugins=* \
-                --disable-plugins=mbedtls \
-                --debug \
-                --malloc-libc"
-
-inherit autotools-brokensep pkgconfig update-rc.d systemd
-
-INITSCRIPT_NAME = "monkey"
-INITSCRIPT_PARAMS = "defaults 70"
-
-SYSTEMD_SERVICE_${PN} = "monkey.service"
-
-FILES_${PN} += "${localstatedir}/www/monkey/"
-
-CONFFILES_${PN} = "${sysconfdir}/monkey/monkey.conf \
-                   ${sysconfdir}/monkey/sites/default \
-                   ${sysconfdir}/monkey/monkey.mime \
-                   ${sysconfdir}/monkey/plugins.load \
-                   ${sysconfdir}/monkey/plugins/proxy_reverse/proxy_reverse.conf \
-                   ${sysconfdir}/monkey/plugins/mandril/mandril.conf \
-                   ${sysconfdir}/monkey/plugins/fastcgi/fastcgi.conf \
-                   ${sysconfdir}/monkey/plugins/logger/logger.conf \
-                   ${sysconfdir}/monkey/plugins/cgi/cgi.conf \
-                   ${sysconfdir}/monkey/plugins/cheetah/cheetah.conf \
-                   ${sysconfdir}/monkey/plugins/dirlisting/dirhtml.conf \
-                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo/header.theme \
-                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo/footer.theme \
-                   ${sysconfdir}/monkey/plugins/dirlisting/themes/guineo/entry.theme \
-                   ${sysconfdir}/monkey/plugins/auth/README \
-                   ${sysconfdir}/monkey/plugins/auth/monkey.users \
-                   "
-
-do_install_append() {
-
-    mkdir -p ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monkey
-
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}/system
-    fi
-}
diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.3.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.3.bb
new file mode 100644
index 0000000..b6f78aa
--- /dev/null
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.3.bb
@@ -0,0 +1,44 @@
+SUMMARY = "Fast and Lightweight HTTP Server for Linux"
+HOMEPAGE = "http://monkey-project.com"
+BUGTRACKER = "https://github.com/monkey/monkey/issues"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+SECTION = "net"
+
+SRC_URI = "http://monkey-project.com/releases/1.6/monkey-${PV}.tar.gz"
+SRC_URI[md5sum] = "35a915a20d5bdc5a9338316107a37557"
+SRC_URI[sha256sum] = "47973b12cc45c185b054e251a6c3d8a36cae70301f614b4132bb1ef504f01cfa"
+
+EXTRA_OECMAKE = "-DCMAKE_INSTALL_LIBDIR=${libdir}/monkey/          \
+                 -DINSTALL_LOGDIR=${localstatedir}/log/monkey/     \
+                 -DPID_PATH=${localstatedir}/run                   \
+                 -DPID_FILE=monkey.pid                             \
+                 -DDEFAULT_USER=www-data                           \
+                 -DDEFAULT_PORT=80                                 \
+                 -DINSTALL_WEBROOTDIR=${localstatedir}/www/monkey/ \
+                 -DINSTALL_SYSCONFDIR=${sysconfdir}/monkey/        \
+                 -DWITH_SYSTEM_MALLOC=1                            \
+                 -DWITH_PLUGIN_TLS=1                               \
+                 -DSTATIC_PLUGINS=tls                              \
+                "
+
+inherit cmake update-rc.d systemd
+
+INITSCRIPT_NAME = "monkey"
+INITSCRIPT_PARAMS = "defaults 70"
+
+SYSTEMD_SERVICE_${PN} = "monkey.service"
+
+FILES_${PN} += "${localstatedir}/www/monkey/"
+
+do_install_append() {
+    install -m 0755 -d ${D}${sysconfdir}/init.d
+    install -m 755 ${S}/monkey.init ${D}${sysconfdir}/init.d/monkey
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}/system
+    fi
+}
-- 
2.1.4


