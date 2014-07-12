Return-Path: <eduardo@monkey.io>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id B1E4C6AC69
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jul 2014 06:38:26 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id ik5so3767634vcb.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 23:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gbGmBftdLCIzXGAOX7KcpDXOf9jeRt56uMIjiZg3Fb0=;
	b=U8yx5p7RVmOff6E7oiI4jRwS2Nr0Lnm/gFGrGYEY/Po78xR2bXOi096lhjw0rT+Zzc
	2/eRKNomNDU2IPva56+ljc7NYPPkTRvt24Ziz/8N5ZaxCV3m4oWAlTJBZJhq0uaO3JZh
	nCbSiIbWp1HZwOK7tLT52zZS66hYMsfPXux89Xtez5Jisbr261TjSRf0+eRjDqD7aW9l
	CK/GBGDd6swIlFKP7R3+bjOrDNCoDBBnXPC2zf/qUCBwIuLsybJDHsrHpYjGanjB2M+r
	lpnJpq5MSa+DIandf0kIQodrM9zF/6heFwBWFSqDfYB+okPGm7JIr8wkRWxVX06dKT/D
	3YFg==
X-Gm-Message-State: ALoCoQkVN1rrs2XiZzCYJF7jZ2MKmYpoqkD2SIeiG0LNZRt5oCZU54WKhdEG2m+p3ZbmiqwADBVX
X-Received: by 10.220.163.3 with SMTP id y3mr3854140vcx.7.1405147106885;
	Fri, 11 Jul 2014 23:38:26 -0700 (PDT)
Received: from localhost.localdomain ([186.32.221.184])
	by mx.google.com with ESMTPSA id
	sx10sm7787983vdb.16.2014.07.11.23.38.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Jul 2014 23:38:26 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Jul 2014 00:37:57 -0600
Message-Id: <1405147077-22498-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCHv4] monkey: new v1.5.1 release.
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
X-List-Received-Date: Sat, 12 Jul 2014 06:38:30 -0000

This patch add the minor release fix of Monkey HTTP Server v1.5.1. It fixes
some problems when switching user when started as root.

monkey/yocto: 941ce3a55496d42164164877735db6c8def63265

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../recipes-httpd/monkey/files/monkey.init         | 34 ++++++++++++++++++++++
 .../recipes-httpd/monkey/files/monkey.service      | 12 ++++++++
 .../monkey/{monkey_1.5.0.bb => monkey_1.5.1.bb}    | 25 ++++++++++++----
 3 files changed, 65 insertions(+), 6 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/monkey/files/monkey.init
 create mode 100644 meta-webserver/recipes-httpd/monkey/files/monkey.service
 rename meta-webserver/recipes-httpd/monkey/{monkey_1.5.0.bb => monkey_1.5.1.bb} (59%)

diff --git a/meta-webserver/recipes-httpd/monkey/files/monkey.init b/meta-webserver/recipes-httpd/monkey/files/monkey.init
new file mode 100644
index 0000000..40b2118
--- /dev/null
+++ b/meta-webserver/recipes-httpd/monkey/files/monkey.init
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=/usr/bin/monkey
+NAME=monkey
+DESC="Monkey HTTP Server"
+OPTS="--daemon"
+
+case "$1" in
+  start)
+	echo -n "Starting $DESC: "
+	start-stop-daemon --start -x "$DAEMON" -- $OPTS
+	echo "$NAME."
+	;;
+  stop)
+	echo -n "Stopping $DESC: "
+	start-stop-daemon --stop -x "$DAEMON"
+	echo "$NAME."
+	;;
+  restart|force-reload)
+	echo -n "Restarting $DESC: "
+	start-stop-daemon --stop -x "$DAEMON"
+	sleep 1
+	start-stop-daemon --start -x "$DAEMON" -- $OPTS
+	echo "$NAME."
+	;;
+  *)
+	N=/etc/init.d/$NAME
+	echo "Usage: $N {start|stop|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-webserver/recipes-httpd/monkey/files/monkey.service b/meta-webserver/recipes-httpd/monkey/files/monkey.service
new file mode 100644
index 0000000..f9aa57f
--- /dev/null
+++ b/meta-webserver/recipes-httpd/monkey/files/monkey.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Monkey HTTP Server
+After=network.target remote-fs.target
+
+[Service]
+Type=forking
+ExecStart=/usr/bin/monkey --daemon
+PIDFile=/var/run/monkey.pid.2001
+TimeoutSec=10
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
similarity index 59%
rename from meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
rename to meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
index 6fa1b77..7d0239e 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
@@ -7,22 +7,24 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 
 SECTION = "net"
 
-SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz"
-SRC_URI[md5sum] = "9123fc371334621fde1c060ab17adcd3"
-SRC_URI[sha256sum] = "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b3637bd8bab5b1d098a7"
+SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz \
+           file://monkey.service \
+           file://monkey.init"
+
+SRC_URI[md5sum] = "2fe04135728f5c3a86c3a412059e0da3"
+SRC_URI[sha256sum] = "28dfc5e57bbcd305727e7af6a1a0587868db1c1286498757bfeb72edddf457e7"
 
 EXTRA_OECONF = " \
              --plugdir=${libdir}/monkey/ \
              --logdir=${localstatedir}/log/monkey/ \
              --pidfile=${localstatedir}/run/monkey.pid \
              --default-user=www-data \
-             --datadir= ${localstatedir}/www/monkey/ \
+             --datadir=${localstatedir}/www/monkey/ \
              --sysconfdir=${sysconfdir}/monkey/ \
              --enable-plugins=* \
              --disable-plugins=polarssl \
              --debug \
-             --malloc-libc \
-"
+             --malloc-libc"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd
 
@@ -34,3 +36,14 @@ SYSTEMD_SERVICE_${PN} = "monkey.service"
 FILES_${PN} += "${localstatedir}/www/monkey/"
 
 CONFFILES_${PN} = "${sysconfdir}/monkey/"
+
+do_install_append() {
+
+    mkdir -p ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/monkey.init ${D}${sysconfdir}/init.d/monkey
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/monkey.service ${D}/${systemd_unitdir}/system
+    fi
+}
-- 
1.9.1


