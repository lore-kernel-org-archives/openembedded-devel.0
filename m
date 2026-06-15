Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF01ACD98CF
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 13:02:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128850.1781528545317736151
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 06:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=aURo7IHO;
 spf=pass (domain: snapchat.com, ip: 209.85.128.43, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b613a17bso29877835e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 06:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1781528543; x=1782133343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hcteQlwsbSgGv28ggandqw/0opwN6VUebYvkzM84UP0=;
        b=aURo7IHOaTLBaQZFuSplSIdlT6HI6RUSyYypLfnkVhcGczL2ZuaML4q4snwa251R9A
         Jt1m/kEwCsaZj/YmBJJz5w3Lso97634Y/faSJ9CQy07xflOmvTJqeD2a+kz4AdXDJMZS
         Qv/sQK1DWAxuHyg/Cn3ex/KaVhdgUjURQQAQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781528543; x=1782133343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcteQlwsbSgGv28ggandqw/0opwN6VUebYvkzM84UP0=;
        b=SUF7gOS41qk81SMRuOQe11Q5neKkocdQFx6aHXuMbpThZB3zMVDvF0twR/H9gY/rnj
         WO2dAiFHmy0CG8rbb2sTRDJmOcfVDxeTuPUGNsM77iwdpoE9EoHJWDRibYWzYQtweVt1
         cbu50naEZb2WCfbZrpNjssy+R276pFlWFOXqpK9EwBxILDku3eSrpJZ+PfTF1wTLJ68p
         XeCIJviK391Ml2Vbi8Ra5gWmH5Hbw7y5E4I5NPlIchZrp31B/KR4o53JnI99J9xWZC7A
         kEJDjDwtkEc1wcvNb00gcPaSJs9i+W4bbMh7wBQMBArdD9KUpFKb6LOR5yB3ElQNzFKb
         G3sQ==
X-Gm-Message-State: AOJu0YyV4craraQV4zNkcKp0QI7mFAqyeWEV5iv7proeqknkgJ2vEKdB
	m6YdwKHVeCOaAGp9GsSSndFZ23DhnbZ1HD3uVdboxzMfisOeFsYmfCcL3OHWwdaF64uQVyNpmgu
	5Ncx1KVE=
X-Gm-Gg: Acq92OEYh9tGdDPFQ/Lj/TiMwSiLFTxINtrkS/s5As9wx1C/3BI4px4iQyhoEMK38jR
	jazOsU/T6M1qC1qK+nQ5K8N71zrotm4pJQfCCyVfQuHN2HuaLgXcJ75QMPy+y2XQWwxccb9jkK8
	mWKsOpxt279e6AOaPt5L+DZ44Wmd9UeM5YFT+uGmJsJ0pyWucUvDVXcbzPq34m9rNXw1JCgCkrM
	yInEf4dn/6h2cyOK3lRDnqJXDrXNr1FISf3UCspDW8ym5gE4+47tL8IfX9U9guqhVH2avFlJ4mK
	X3+6H8sEIVBj/lpyzKamSmxSsA5be5aidEWDYR5WS92f/b+3fBneml+nppl1v6S/Om1QoQkx9JY
	Sxx8DDTE0RPZOF95o37+bwkjsWOS2GfD07CI4FsrIqsf63kKqZ6Zj48ACKrVVqV9/2qWtwDFvUw
	8HfyXBctKDuwLeWVt9v+mxAr7xoeTAO1x+nUHgZH+WjQfwnIP59poz03ptEMVkhVEy9KEq
X-Received: by 2002:a05:600c:8b56:b0:490:b8c0:d471 with SMTP id 5b1f17b1804b1-490ec507e3cmr170255625e9.23.1781528542801;
        Mon, 15 Jun 2026 06:02:22 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edc23sm255919575e9.2.2026.06.15.06.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 06:02:22 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH] android-tools-conf: replace sysfs implementation with configfs
Date: Mon, 15 Jun 2026 15:02:11 +0200
Message-ID: <20260615130211.185694-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 13:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127583

From: Etienne Cordonnier <ecordonnier@snap.com>

The android-tools-conf recipe used /sys/class/android_usb/android0/,
an interface exported by the out-of-tree android.c USB gadget driver
that Google carried in Android kernels but never submitted to mainline
Linux. It was never part of any upstream kernel release.

The configfs-based USB gadget framework (CONFIG_USB_CONFIGFS) was
merged into mainline Linux with kernel 3.10 (June 2013) and is the
correct interface for all upstream kernels since then. Additionally,
Google's Generic Kernel Image (GKI) initiative dropped android.c from
Android common kernels starting with kernel 5.10 (Android 12, 2021),
so even custom BSPs targeting modern Android cannot use this interface.

Remove android-tools-conf and rename android-tools-conf-configfs to
android-tools-conf, since the configfs-based implementation is the
only correct one for any modern kernel. Backward compatibility is
preserved via PROVIDES/RPROVIDES retaining the old
android-tools-conf-configfs name.

AI-Generated: Uses GitHub Copilot (Claude Sonnet 4.6)
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta-oe/conf/layer.conf                       |  1 -
 .../android-gadget-setup                      | 40 ------------
 .../android-tools-conf-configfs_1.0.bb        | 38 -----------
 .../10-adbd-configfs.conf                     |  0
 .../android-gadget-cleanup                    |  0
 .../android-tools-conf/android-gadget-setup   | 63 ++++++++++---------
 .../android-gadget-start                      |  0
 .../android-tools/android-tools-conf_1.0.bb   | 38 ++++++++---
 8 files changed, 62 insertions(+), 118 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
 rename meta-oe/recipes-devtools/android-tools/{android-tools-conf-configfs => android-tools-conf}/10-adbd-configfs.conf (100%)
 rename meta-oe/recipes-devtools/android-tools/{android-tools-conf-configfs => android-tools-conf}/android-gadget-cleanup (100%)
 rename meta-oe/recipes-devtools/android-tools/{android-tools-conf-configfs => android-tools-conf}/android-gadget-start (100%)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 357cca8cc6..1d7e6cbe57 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -53,7 +53,6 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 PREFERRED_RPROVIDER_libdevmapper = "lvm2"
 PREFERRED_RPROVIDER_libdevmapper-native = "lvm2-native"
 PREFERRED_RPROVIDER_nativesdk-libdevmapper = "nativesdk-lvm2"
-PREFERRED_PROVIDER_android-tools-conf ?= "android-tools-conf"
 # Those lines configure whether coreutils or uutils-coreutils is used.
 PREFERRED_PROVIDER_coreutils = "coreutils"
 PREFERRED_PROVIDER_coreutils-native = "coreutils-native"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
deleted file mode 100644
index 2744d1e98e..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
+++ /dev/null
@@ -1,40 +0,0 @@
-#!/bin/sh
-
-set -e
-
-conf="Conf 1"
-manufacturer=RPB
-model="Android device"
-product=0xd002
-serial=0123456789ABCDEF
-vendor=0x18d1
-
-if [ -r /etc/android-gadget-setup.machine ] ; then
-	. /etc/android-gadget-setup.machine
-fi
-
-[ -d /sys/kernel/config/usb_gadget ] || modprobe libcomposite
-
-cd /sys/kernel/config/usb_gadget
-
-[ -d adb ] && /usr/bin/android-gadget-cleanup || true
-
-mkdir adb
-cd adb
-
-mkdir configs/c.1
-mkdir functions/ffs.usb0
-mkdir strings/0x409
-mkdir configs/c.1/strings/0x409
-echo -n "$vendor"  > idVendor
-echo -n "$product" > idProduct
-echo "$serial" > strings/0x409/serialnumber
-echo "$manufacturer" > strings/0x409/manufacturer
-echo "$model" > strings/0x409/product
-echo "$conf" > configs/c.1/strings/0x409/configuration
-ln -s functions/ffs.usb0 configs/c.1
-
-mkdir -p /dev/usb-ffs/adb
-ADB_UID=$(id -u adb)
-ADB_GID=$(id -g adb)
-mount -t functionfs usb0 /dev/usb-ffs/adb -o "uid=$ADB_UID,gid=$ADB_GID"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
deleted file mode 100644
index 342e7fd1a5..0000000000
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION = "Different utilities from Android - corressponding configuration files for using ConfigFS"
-SECTION = "console/utils"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-S = "${UNPACKDIR}"
-
-SRC_URI = " \
-    file://android-gadget-setup \
-    file://android-gadget-start \
-    file://android-gadget-cleanup \
-    file://10-adbd-configfs.conf \
-"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/android-gadget-setup ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/android-gadget-start ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/android-gadget-cleanup ${D}${bindir}
-
-    if [ -r ${UNPACKDIR}/android-gadget-setup.machine ] ; then
-	install -d ${D}${sysconfdir}
-	install -m 0644 ${UNPACKDIR}/android-gadget-setup.machine ${D}${sysconfdir}
-    fi
-
-    install -d ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
-    install -m 0644 ${UNPACKDIR}/10-adbd-configfs.conf ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
-}
-
-FILES:${PN} += " \
-    ${systemd_unitdir}/system/ \
-"
-
-PROVIDES += "android-tools-conf"
-RPROVIDES:${PN} = "android-tools-conf"
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf b/meta-oe/recipes-devtools/android-tools/android-tools-conf/10-adbd-configfs.conf
similarity index 100%
rename from meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
rename to meta-oe/recipes-devtools/android-tools/android-tools-conf/10-adbd-configfs.conf
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-cleanup
similarity index 100%
rename from meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
rename to meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-cleanup
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
index 26cf30eddd..2744d1e98e 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
@@ -1,37 +1,40 @@
 #!/bin/sh
 
-[ ! -e /dev/pts ] && mkdir -p /dev/pts
-[ ! -e /dev/pts/0 ] && mount devpts /dev/pts -t devpts
-
-# TODO enable the lines below once we have support for getprop
-# retrieve the product info from Android
-# manufacturer=$(getprop ro.product.manufacturer Android)
-# model=$(getprop ro.product.model Android)
-# serial=$(getprop ro.serialno 0123456789ABCDEF)
-
-#below are now needed in order to use FunctionFS for ADB, tested to work with 3.4+ kernels
-if grep -q functionfs /proc/filesystems; then
-    mkdir -p /dev/usb-ffs/adb
-    mount -t functionfs adb /dev/usb-ffs/adb
-    #android-gadget-setup doesn't provide below 2 and without them it won't work, so we provide them here.
-    echo adb > /sys/class/android_usb/android0/f_ffs/aliases
-    echo ffs > /sys/class/android_usb/android0/functions
+set -e
+
+conf="Conf 1"
+manufacturer=RPB
+model="Android device"
+product=0xd002
+serial=0123456789ABCDEF
+vendor=0x18d1
+
+if [ -r /etc/android-gadget-setup.machine ] ; then
+	. /etc/android-gadget-setup.machine
 fi
 
-manufacturer="$(cat /system/build.prop | grep -o 'ro.product.manufacturer=.*' | cut -d'=' -f 2)"
-model="$(cat /system/build.prop | grep -o 'ro.product.model=.*' | cut -d'=' -f 2)"
-# get the device serial number from /proc/cmdline directly(since we have no getprop on
-# GNU/Linux)
-serial="$(cat /proc/cmdline | sed 's/.*androidboot.serialno=//' | sed 's/ .*//')"
+[ -d /sys/kernel/config/usb_gadget ] || modprobe libcomposite
+
+cd /sys/kernel/config/usb_gadget
+
+[ -d adb ] && /usr/bin/android-gadget-cleanup || true
 
-echo $serial > /sys/class/android_usb/android0/iSerial
-echo $manufacturer > /sys/class/android_usb/android0/iManufacturer
-echo $model > /sys/class/android_usb/android0/iProduct
+mkdir adb
+cd adb
 
-echo "0" > /sys/class/android_usb/android0/enable
-echo "18d1" > /sys/class/android_usb/android0/idVendor
-echo "D002" > /sys/class/android_usb/android0/idProduct
-echo "adb" > /sys/class/android_usb/android0/functions
-echo "1" >  /sys/class/android_usb/android0/enable
+mkdir configs/c.1
+mkdir functions/ffs.usb0
+mkdir strings/0x409
+mkdir configs/c.1/strings/0x409
+echo -n "$vendor"  > idVendor
+echo -n "$product" > idProduct
+echo "$serial" > strings/0x409/serialnumber
+echo "$manufacturer" > strings/0x409/manufacturer
+echo "$model" > strings/0x409/product
+echo "$conf" > configs/c.1/strings/0x409/configuration
+ln -s functions/ffs.usb0 configs/c.1
 
-sleep 4
+mkdir -p /dev/usb-ffs/adb
+ADB_UID=$(id -u adb)
+ADB_GID=$(id -g adb)
+mount -t functionfs usb0 /dev/usb-ffs/adb -o "uid=$ADB_UID,gid=$ADB_GID"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-start
similarity index 100%
rename from meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
rename to meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-start
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
index 7bbac1db75..bb55b3599f 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
@@ -1,20 +1,40 @@
-DESCRIPTION = "Different utilities from Android - corresponding configuration files"
+DESCRIPTION = "Different utilities from Android - corresponding configuration files for using ConfigFS"
 SECTION = "console/utils"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI = "file://android-gadget-setup"
-
 S = "${UNPACKDIR}"
 
+SRC_URI = " \
+    file://android-gadget-setup \
+    file://android-gadget-start \
+    file://android-gadget-cleanup \
+    file://10-adbd-configfs.conf \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 ${UNPACKDIR}/android-gadget-setup ${D}${bindir}
-}
+    install -m 0755 ${UNPACKDIR}/android-gadget-start ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/android-gadget-cleanup ${D}${bindir}
 
-python () {
-    pn = d.getVar('PN')
-    profprov = d.getVar("PREFERRED_PROVIDER_" + pn)
-    if profprov and pn != profprov:
-        raise bb.parse.SkipRecipe("PREFERRED_PROVIDER_%s set to %s, not %s" % (pn, profprov, pn))
+    if [ -r ${UNPACKDIR}/android-gadget-setup.machine ] ; then
+	install -d ${D}${sysconfdir}
+	install -m 0644 ${UNPACKDIR}/android-gadget-setup.machine ${D}${sysconfdir}
+    fi
+
+    install -d ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
+    install -m 0644 ${UNPACKDIR}/10-adbd-configfs.conf ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
 }
+
+FILES:${PN} += " \
+    ${systemd_unitdir}/system/ \
+"
+
+PROVIDES += "android-tools-conf-configfs"
+RPROVIDES:${PN} = "android-tools-conf-configfs"
+RREPLACES:${PN} = "android-tools-conf-configfs"
+RCONFLICTS:${PN} = "android-tools-conf-configfs"
+BBCLASSEXTEND = "native"
-- 
2.43.0


