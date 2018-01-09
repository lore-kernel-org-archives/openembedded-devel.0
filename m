Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA6378557
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jan 2018 10:43:12 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id e3so8256410pfi.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jan 2018 02:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=D91H7VMcuKBNzneDa+rYgN6rUN8QwyxTE89Jiu6vmuQ=;
	b=SuK4tI+4umbqEMPoeErvhQQpWrn5MhkNU06CzctsHebaPo3shE5FfERxiFuUzY3yVz
	yy4G8THAbANdOQ5rDjXIc9XOfYIa8hnxNulZeW9FtRktI5xPTj1UiNbir+RzEzxIkAs1
	IdrtQkZZRfYsb0iTE9+cFDxpH/eq9UdGt0Gn5PirJscbSy8St3CgjM9NxW7wgtsL3Ssk
	OnMU269T4ZuZrwwJbH6bkNVX3tvx3r99HNun0xEe+/RpfqmeFyMLugd9PXAXra4vSiIv
	VvIKQsgNmjG8tezb5zCHuoGpoaXG0V9EGdj1yL5dZ1ici5Z6uLT6Z5rXmD/BBwg8N6bJ
	oKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D91H7VMcuKBNzneDa+rYgN6rUN8QwyxTE89Jiu6vmuQ=;
	b=NopeEHvuQ/GkPuttpQDa1+s9PiOwg9YPA62FKWKRZVRXpG5GbWiiGOlhvdiMGAHqMW
	SE2YcFKbrR8UmmnMEBxpHHoLpNhLI4onbRw0gdL5R6nlxBG3S+9emiR6Jr88pRwuV/TZ
	G9p+nfUuxXxPCmKY5v5+Db4ebp6Fz1ozx0gytvUGV4PnUkLxJTWh3OgyGfq5sJRegZrL
	Q6C2geHY/bvWFER/r1wWsnyczgpyDEaBIS2+tdlCUsPPui2ydpZtim6qWO4FQY5unS5h
	B2uAMZoxmd7jepgjKjBtWbPfrYhV/HNk9TjtiEoe3fMfF7ZVctTVZ4IrNU/T3mi7B/hO
	8vJw==
X-Gm-Message-State: AKGB3mKU4fqRtrSnP3Ga7eZ8Pr3+e2BMw9ZZ9qHWPZsDYsae97otqg91
	jxQDzqIZHHyv8Io1XP54k/0bu2bA
X-Google-Smtp-Source: ACJfBovoMbw32QXTYcb05plKZh7ZHAhtxoJ22vGq1LbYuZi114OuciovLGErgheSJqzFMuGCfnIYlA==
X-Received: by 10.84.217.13 with SMTP id o13mr7385724pli.136.1515494594183;
	Tue, 09 Jan 2018 02:43:14 -0800 (PST)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	p24sm28839419pfh.170.2018.01.09.02.43.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jan 2018 02:43:13 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Jan 2018 16:13:09 +0530
Message-Id: <1515494589-11986-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] open-vm-tools: add sysvinit script to start vmtoolsd daemon at boot time
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2018 10:43:13 -0000

It adds support to start vmtoolsd daemon during system startup,
when init manager is SysVinit.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../open-vm-tools/files/vmtoolsd.init              | 66 ++++++++++++++++++++++
 .../open-vm-tools/open-vm-tools_10.1.5.bb          | 17 +++++-
 2 files changed, 80 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.init

diff --git a/meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.init b/meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.init
new file mode 100644
index 0000000..b78b9f5
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.init
@@ -0,0 +1,66 @@
+#!/bin/sh
+#
+#   vmtoolsd          Start/stop the vmware tools daemon
+#
+# chkconfig:  2345 90 60
+# description: vmtoolsd is a daemon that starts up.  for some reason, it
+#              doesn't include a sysv init startup file in the latest release.
+#              so i have to write this
+#
+
+### BEGIN INIT INFO
+# Provides: vmtoolsd
+# Required-Start: $local_fs $syslog
+# Required-Stop: $local_fs $syslog
+# Default-Start: 2345
+# Default-Stop: 90
+# Short-Description: Run vmware tools daemon
+### END INIT INFO
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=/usr/bin/vmtoolsd
+NAME=vmtoolsd
+DESC="vmware tools daemon"
+VMTOOLSDARGS=""
+RETVAL="1"
+
+# source function library
+. /etc/init.d/functions
+
+test -f $DAEMON || exit 0
+
+
+case "$1" in
+  start)
+    echo -n "Starting vmware tools daemon: "
+    start-stop-daemon --start --quiet --exec $DAEMON -- $VMTOOLSDARGS
+    RETVAL=$?
+    if [ $RETVAL -eq 0 ] ; then
+        echo "OK"
+    else
+        echo "FAIL"
+    fi
+    ;;
+  stop)
+    echo -n "Stopping vmware tools daemon: "
+    start-stop-daemon --stop --quiet --pidfile /var/run/vmtoolsd.pid
+    RETVAL=$?
+    if [ $RETVAL -eq 0 ] ; then
+        echo "OK"
+    else
+        echo "FAIL"
+    fi
+    ;;
+  status)
+    status vmtoolsd
+    exit $?
+    ;;
+  restart)
+    $0 stop && sleep 1 && $0 start
+    ;;
+  *)
+    echo "Usage: /etc/init.d/vmtoolsd {start|stop|status|restart}"
+    exit 1
+esac
+
+exit $RETVAL
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index 81e8e96..e9e0f92 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -24,6 +24,7 @@ LICENSE_modules/solaris = "CDDL-1.0"
 SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
            file://tools.conf \
            file://vmtoolsd.service \
+           file://vmtoolsd.init \
            file://0001-configure.ac-don-t-use-dnet-config.patch \
            file://0002-add-include-sys-sysmacros.h.patch \
            file://0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch \
@@ -50,7 +51,7 @@ DEPENDS_append_libc-musl = " libtirpc"
 # open-vm-tools is supported only on x86.
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
 
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig systemd update-rc.d
 
 SYSTEMD_SERVICE_${PN} = "vmtoolsd.service"
 
@@ -85,8 +86,14 @@ RDEPENDS_${PN} = "util-linux libdnet fuse"
 
 do_install_append() {
     ln -sf ${sbindir}/mount.vmhgfs ${D}/sbin/mount.vmhgfs
-    install -d ${D}${systemd_unitdir}/system ${D}${sysconfdir}/vmware-tools
-    install -m 644 ${WORKDIR}/*.service ${D}${systemd_unitdir}/system
+    install -d ${D}${sysconfdir}/vmware-tools
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/*.service ${D}${systemd_unitdir}/system
+    else
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/vmtoolsd.init ${D}${sysconfdir}/init.d/vmtoolsd
+    fi
     install -m 0644 ${WORKDIR}/tools.conf ${D}${sysconfdir}/vmware-tools/tools.conf
 }
 
@@ -95,6 +102,10 @@ do_configure_prepend() {
     export CUSTOM_DNET_LIBS=-L${STAGING_LIBDIR}/libdnet.so
 }
 
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME_${PN} = "vmtoolsd"
+INITSCRIPT_PARAMS_${PN} = "start 90 2 3 4 5 . stop 60 0 1 6 ."
+
 python() {
     if 'networking-layer' not in d.getVar('BBFILE_COLLECTIONS').split() or \
 	'filesystems-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
-- 
2.7.4


