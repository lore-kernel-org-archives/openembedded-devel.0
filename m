Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A1DE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 12:32:59 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.9291.1733833969036343809
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Dec 2024 04:32:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=cF00j5VM;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434fe0a8cceso14895315e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 04:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733833967; x=1734438767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8TQba4Qc/3sD7E0WlO/88F06+JlPNVZZTzQVSDiYLeA=;
        b=cF00j5VMDeKK1M0gAKmgP/kSj1y4fK76Xngk/QiUa8CHPKj5kmA80/XTHbCBbHhOJ4
         17184pbamiaoCfPXFRq3bkjaZ6nQGP09K4RBBvH/qHZdD62aROuvSZP8y8VYJGy1mQ/f
         zq14/A0njBJPmhSUNNiak784jV/wHEawcAkcCTilc3NMqBmgPR8C9guG6LXqdk5ROzev
         6pm+fjhyNJkJ8lrh5JWmGWtL/r5yH5HKfSP0J8k1x5ODhQCqE54jFWPr5h+0A6Y5TSYC
         SeWt86jZQmb4UmMp/cU1VYqiig3bkG7iB1ItJNbny2OvzQnXzzh8TUCKo+gbbE4FYHgt
         oy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733833967; x=1734438767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TQba4Qc/3sD7E0WlO/88F06+JlPNVZZTzQVSDiYLeA=;
        b=NtNVKxT3esnyApPvnjiio92Pylx60cusMDnl0aDMGDUVP1SLEWT3qc11EZ+W7x6nlB
         gpU9+s4QQoL/4HG4E5QZBKTYcHSiHwaq5Jc4JFMRowH9vsTWYcwi6R8RsVoJBhRC+9AX
         VxkleEESVNzgm5rj7hfZyFnUnc8Xpofl3EUemNN9Oa/M+d2lff57iTJq1wkprjc/Cr8Q
         qzR05xNKsWLCw6AiBerR0arKoQ9SPAsjAsb5EgnOOr3EMe7XZQoAXRxYEtClRRfM+DEN
         Ygyk73aVkyFJQb5uddcNTcIcILHww8fwcvjy0Bu47AvDLbznlkx7ibjMLQIWN7KZhHiO
         cXAA==
X-Forwarded-Encrypted: i=1; AJvYcCWOXiu2FeeR25cHTd+n9DEIQon+pT2yRGDk68IFSIgk90nXDgJjNpqohaRDt6Xzf1FQW5ffST/nliEMBukrIgySkCI=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy8tDM7vJ4+FycfaHLjaWHqzEpBZ/+IYTHGUWf9CyYrY/lXhK9u
	874+4CTL77OrabiaG1LhcpespRMtvpKlpfCZMO1R9Z4oo53ROD4SyRrEOHNVVeA=
X-Gm-Gg: ASbGncvwq4db3WDt0hyLL+GkUc8Gc9DhAcRpfemnPzffr4HcOmbEDU2VQvcPEx/Vlkj
	E2Skq1nboGy1Fj03Ki55lyy9RJmV60IxxrZPCQXsxuxS0YvHyxR2s27UlICuA24GixPAoAq+C5L
	UMCuNus45stjcjaFovjH3ZHxk6yfQQuSUuiFqHfZhm5lXbXwOir4p9zSJkN7z3+zhOZb+NNdqIJ
	gXsyhVZrenSSQf0cf2jf+MGMdOuvMu674DiMG2NYG9KRojJLlq6Hg==
X-Google-Smtp-Source: AGHT+IGMem0V5HPVWRv2tcIEJDjDrxc85w+gnFYYE4g2kQVY3vKRPuxViTI8P94Mokj12jpRgO0+iQ==
X-Received: by 2002:a5d:47a1:0:b0:385:f7ea:eb86 with SMTP id ffacd0b85a97d-3862b333779mr12635899f8f.7.1733833967020;
        Tue, 10 Dec 2024 04:32:47 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4c2b:c454:658c:f771])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386366efb6bsm10016957f8f.51.2024.12.10.04.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 04:32:46 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-filesystems][PATCH] gpiod-sysfs-proxy: new recipe
Date: Tue, 10 Dec 2024 13:32:43 +0100
Message-ID: <20241210123243.58809-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 12:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114261

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Many users are reluctant to use libgpiod instead of the deprecated
/sys/class/gpio interface. The gpiod-sysfs-proxy project aims at making
the transition easier by implementing a compatibility layer in
user-space using FUSE and python3-gpiod. This way we can eat the cookie
by disabling the sysfs ABI and have the users have it too by sticking to
their existing scripts.

The project itself is a very simple setuptools-based python package but
the recipe is quite complex due to comprehensive distro integration.

By default we use /run/gpio as mountpoint. For full backward
compatibility with the kernel interface, the user must explicitly add
the 'sys-class-mount' switch to PACKAGECONFIG. We do this because,
depending on whether CONFIG_GPIO_SYSFS Kconfig option is enabled,
/sys/class/gpio will either be non-empty or not exist at all. In the
latter case, we need to somehow create the /sys/class/gpio and, since
user-space is not allowed to mkdir() inside sysfs, we use overlayfs for
that. As this is rather non-standard, we want the user to be aware of
this.

We support both systemd and sys V init managers.

We also provide a ptest package which uses an external
gpio-sysfs-compat-tests script.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-filesystems/conf/layer.conf              |  4 +
 .../gpiod-sysfs-proxy.init.in                 | 84 ++++++++++++++++++
 .../gpiod-sysfs-proxy.service.in              | 15 ++++
 .../gpiod-sysfs-proxy/run-gpio-sys.mount      | 13 +++
 .../gpiod-sysfs-proxy/run-ptest.in            | 21 +++++
 .../gpiod-sysfs-proxy/sys-class.mount         | 16 ++++
 .../gpiod-sysfs-proxy_0.1.1.bb                | 85 +++++++++++++++++++
 7 files changed, 238 insertions(+)
 create mode 100644 meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in
 create mode 100644 meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.service.in
 create mode 100644 meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-gpio-sys.mount
 create mode 100644 meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-ptest.in
 create mode 100644 meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/sys-class.mount
 create mode 100644 meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.1.bb

diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
index 8a0c831e2..5323913d5 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -16,3 +16,7 @@ LAYERVERSION_filesystems-layer = "1"
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer networking-layer"
 
 LAYERSERIES_COMPAT_filesystems-layer = "styhead walnascar"
+
+BBFILES_DYNAMIC += " \
+    meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
+"
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in
new file mode 100644
index 000000000..a9cf5e407
--- /dev/null
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in
@@ -0,0 +1,84 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:             gpiod-sysfs-proxy
+# Required-Start:       $remote_fs $syslog
+# Required-Stop:        $remote_fs $syslog
+# Default-Start:        2 3 4 5
+# Default-Stop:         1
+# Short-Description:    User-space, libgpiod-based compatibility layer for linux GPIO sysfs interface.
+### END INIT INFO
+#
+# -*- coding: utf-8 -*-
+# Debian init.d script for gpiod-sysfs-proxy
+# Copyright (c) 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+# set -e
+
+# Source function library.
+. /etc/init.d/functions
+
+PROG="/usr/bin/gpiod-sysfs-proxy"
+NAME="gpiod-sysfs-proxy"
+DESC="/sys/class/gpio compatibility layer"
+MOUNTPOINT="@mountpoint@"
+
+test -x $PROG || exit 0
+
+do_start()
+{
+	echo -n "Starting $DESC: "
+
+	if [ "$MOUNTPOINT" = "/sys/class/gpio" ] && [ ! -e /sys/class/gpio ]; then
+		mkdir -p /run/gpio/sys /run/gpio/class/gpio /run/gpio/work
+		mount -t sysfs sysfs /run/gpio/sys -o nosuid,nodev,noexec
+		# Bail out if overlayfs is not available
+		set -e
+		mount -t overlay overlay /sys/class \
+-o upperdir=/run/gpio/class,lowerdir=/run/gpio/sys/class,workdir=/run/gpio/work,nosuid,nodev,noexec,relatime,ro
+		set +e
+	else
+		mkdir -p $MOUNTPOINT
+	fi
+
+	$PROG $MOUNTPOINT -o nonempty -o allow_other -o default_permissions -o entry_timeout=0 -f | logger -i $NAME &
+	echo "done"
+}
+
+do_stop()
+{
+	echo -n "Stopping $DESC: "
+
+	umount $MOUNTPOINT
+
+	mountpoint -q /sys/class
+	if [ "$?" = "0" ]; then
+		umount /sys/class
+		umount /run/gpio/sys
+		rm -rf /run/gpio
+	fi
+	echo "done"
+}
+
+case "$1" in
+	start)
+		do_start
+	;;
+	stop)
+		do_stop
+	;;
+	status)
+		status $PROG
+		exit $?
+	;;
+	restart)
+		do_stop
+		sleep 1
+		do_start
+	;;
+	*)
+		echo "Usage: /etc/init.d/$NAME {start|stop|status|restart}" >&2
+		exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.service.in b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.service.in
new file mode 100644
index 000000000..313523268
--- /dev/null
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/gpiod-sysfs-proxy.service.in
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+[Unit]
+Description=User-space, libgpiod-based compatibility layer for linux GPIO sysfs interface
+
+[Service]
+RuntimeDirectory=gpio
+Type=simple
+ExecStart=/usr/bin/gpiod-sysfs-proxy @mountpoint@ -f -o nonempty -o allow_other -o default_permissions -o entry_timeout=0
+ExecStop=/bin/umount @mountpoint@
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-gpio-sys.mount b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-gpio-sys.mount
new file mode 100644
index 000000000..a924cb9b6
--- /dev/null
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-gpio-sys.mount
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+[Unit]
+Description=Remount of sysfs for gpiod-sysfs-proxy
+ConditionPathExists=!/sys/class/gpio
+
+[Mount]
+DirectoryMode=0700
+What=sysfs
+Where=/run/gpio/sys
+Type=sysfs
+Options=nosuid,nodev,noexec
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-ptest.in b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-ptest.in
new file mode 100644
index 000000000..aab3a5ce3
--- /dev/null
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/run-ptest.in
@@ -0,0 +1,21 @@
+#!/bin/sh
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+testbin="gpio-sysfs-compat-tests"
+
+modprobe gpio-sim
+modprobe configfs
+
+mountpoint -q /sys/kernel/config
+if [ "$?" -ne "0" ]; then
+	mount -t configfs configfs /sys/kernel/config
+fi
+
+cd $ptestdir/tests
+
+./$testbin -v --gpio-class @mountpoint@ --chown-user gpio-test > ./$testbin.out 2>&1
+if [ $? -ne 0 ]; then
+	echo "FAIL: $testbin"
+else
+	echo "PASS: $testbin"
+fi
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/sys-class.mount b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/sys-class.mount
new file mode 100644
index 000000000..e3e3ce8e7
--- /dev/null
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy/sys-class.mount
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+[Unit]
+Description=Overlay on top of /sys/class adding the gpio class directory
+Before=gpiod-sysfs-proxy.service
+After=run-gpio-sys.mount
+ConditionPathExists=!/sys/class/gpio
+
+[Mount]
+RuntimeDirectory=gpio/class/gpio
+DirectoryMode=0755
+What=overlay
+Where=/sys/class
+Type=overlay
+Options=upperdir=/run/gpio/class,lowerdir=/run/gpio/sys/class,workdir=/run/gpio/work,ro,nosuid,nodev,noexec,relatime
diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.1.bb b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.1.bb
new file mode 100644
index 000000000..4d466d30f
--- /dev/null
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.1.bb
@@ -0,0 +1,85 @@
+SUMMARY = "User-space, libgpiod-based compatibility layer for linux GPIO sysfs interface."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0dcf8b702b5c96178978c7223f64a73b"
+
+inherit systemd update-rc.d ptest pypi python_pep517 python_setuptools_build_meta useradd
+
+PYPI_PACKAGE = "gpiod_sysfs_proxy"
+
+SRC_URI += " \
+    file://gpiod-sysfs-proxy.service.in \
+    file://run-gpio-sys.mount \
+    file://sys-class.mount \
+    file://gpiod-sysfs-proxy.init.in \
+    file://run-ptest.in \
+"
+
+SRC_URI[sha256sum] = "c7830cb6a2c01914df2bc0549aef2dcfcb955520d400f65b3b50fb7a6f77f1b4"
+
+# For full backward compatibility with the kernel sysfs interface, this option
+# must be selected. However, we don't make it the default as - with kernel sysfs
+# disabled - it plays a silly game with /sys/class, where it mounts a read-only
+# overlay containing the missing /sys/class/gpio directory. This is a rather
+# non-standard behavior so make sure the user actually wants it.
+PACKAGECONFIG[sys-class-mount] = ""
+
+export MOUNTPOINT="${@bb.utils.contains('PACKAGECONFIG', 'sys-class-mount', '\/sys\/class\/gpio', '\/run\/gpio', d)}"
+
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/gpiod-sysfs-proxy.service.in ${D}${systemd_system_unitdir}/gpiod-sysfs-proxy.service
+
+        if ${@bb.utils.contains('PACKAGECONFIG', 'sys-class-mount', 'true', 'false', d)}; then
+            install -d ${D}${systemd_system_unitdir}/sysinit.target.wants/
+
+            install -m 0644 ${UNPACKDIR}/run-gpio-sys.mount ${D}${systemd_system_unitdir}/run-gpio-sys.mount
+            install -m 0644 ${UNPACKDIR}/sys-class.mount ${D}${systemd_system_unitdir}/sys-class.mount
+
+            ln -sf ../run-gpio-sys.mount ${D}${systemd_system_unitdir}/sysinit.target.wants/run-gpio-sys.mount
+            ln -sf ../sys-class.mount ${D}${systemd_system_unitdir}/sysinit.target.wants/sys-class.mount
+        fi
+
+        sed -i "s/@mountpoint@/$MOUNTPOINT/g" ${D}${systemd_system_unitdir}/gpiod-sysfs-proxy.service
+    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${UNPACKDIR}/gpiod-sysfs-proxy.init.in ${D}${sysconfdir}/init.d/gpiod-sysfs-proxy
+        sed -i "s/@mountpoint@/$MOUNTPOINT/g" ${D}${sysconfdir}/init.d/gpiod-sysfs-proxy
+    fi
+}
+
+SYSTEMD_SERVICE:${PN} = "gpiod-sysfs-proxy.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+INITSCRIPT_NAME = "gpiod-sysfs-proxy"
+INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 20 0 1 6 ."
+
+FILES:${PN} += "/usr/lib/systemd/system"
+
+RDEPENDS:${PN} += " \
+    python3-fuse \
+    python3-gpiod \
+    python3-pyudev \
+"
+
+python __anonymous() {
+    if d.getVar("PTEST_ENABLED") == "1":
+        d.appendVar("SRC_URI", "git://github.com/brgl/gpio-sysfs-compat-tests;protocol=https;branch=main;destsuffix=tests;name=tests")
+        d.setVar("SRCREV_tests", "a3c9daa4650dd1e8d7fd8972db68d9c2c204263d")
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${UNPACKDIR}/run-ptest.in ${D}${PTEST_PATH}/run-ptest
+    sed -i "s/@mountpoint@/$MOUNTPOINT/g" ${D}${PTEST_PATH}/run-ptest
+    install -m 0755 ${UNPACKDIR}/tests/gpio-sysfs-compat-tests ${D}${PTEST_PATH}/tests/gpio-sysfs-compat-tests
+}
+
+# Test user is created for verifying chown() and chmod() operations.
+USERADD_PACKAGES = "${PN}-ptest"
+GROUPADD_PARAM:${PN}-ptest = "--system gpio-test"
+USERADD_PARAM:${PN}-ptest = "--system -M -s /bin/nologin -g gpio-test gpio-test"
+
+RDEPENDS:${PN}-ptest += "kmod"
+RRECOMMENDS:${PN}-ptest += "kernel-module-gpio-sim kernel-module-configfs"
-- 
2.45.2


