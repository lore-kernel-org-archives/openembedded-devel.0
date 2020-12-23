Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.4257.1608693051723054184
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Dec 2020 19:10:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=m2vrkASv;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id h205so36817028lfd.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Dec 2020 19:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i9uRz4sYRmb5udJhpH79X38nXCSBpeZjhtPgJyFpRdU=;
        b=m2vrkASvgywW9wsUxd9MSVKDuKbudnHqq/wY8OW+KiGOuoy76vYArHwVnqSlGvGd1m
         jdOuHELiz55oVbZsLPpvJprmQ9LPdtND+UzTMGUBfEmzTcwomZWh0h8TlpOSRive5H+h
         aqH9Ku+fZLWPEef/PES+XGelr/U7pXWAns8c4pGb8twvKet7NpE3eTrvxoxDrfua8BtT
         CuuWTdGiFlkCT1bBErHgM6wrGo+VgxzDYFJoKoBDpkq9pq0GTfTgI8GwTzZs/r0kFwnS
         z368ln/Ngkzj1HUB5R8hMOAA8g2ryXNu/vVHnEwVPK9anwE7Ig9Y3dTk7QXEaDD7sprR
         BURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i9uRz4sYRmb5udJhpH79X38nXCSBpeZjhtPgJyFpRdU=;
        b=mOprHUzk2p1WWkMxbOMSy8PzBl0OtLpUgxpay84sCc1KhXXdo7oTB8JcPtgv5wEqYa
         RcYCL18IXkWmdv1T7dvr8jJWMPnFw/UrDGKx7TwhXtwgTNq45Wn58rcTCUcd8w97JrAu
         ySAcTbZghkmQ3EE8npHQUegeiQiaQLyLmbvn/s2wgrwHJsq1qGQA7Dycqina5zn0EHnU
         fAsyUZ2vqAEHd0Cjd3MyvQmyMzFma7TmicpnQDecYRIetvC26xjNdJWa6W+cAvzi1kV6
         4w4u9rUNva5IXAWW2LGZMCBk6fHZPPCdwlP63Q8qBNioc3DEedAPdUIt2CEpdMcS3s90
         S2qg==
X-Gm-Message-State: AOAM531oo0GAy9i3e2hrowD3zNuVF6F/z+Ih58woD5cjzHi0JQAWkAkf
	I/zXYf+OWmSomLbNNGURZIMZ1u7s+9SjzA==
X-Google-Smtp-Source: ABdhPJyUEBCd1EoRvetNt/kuRJIfqUqTYOQTwf+766O6AOfvkod0m+7rNvze4+jtxA7YQMiUb7HiWA==
X-Received: by 2002:a05:6512:308c:: with SMTP id z12mr10528932lfd.138.1608693048476;
        Tue, 22 Dec 2020 19:10:48 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.224])
        by smtp.gmail.com with ESMTPSA id x2sm2963035lff.207.2020.12.22.19.10.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 19:10:47 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] android-tools-conf-configfs: add an alternative to anrdoid-tools-conf
Date: Wed, 23 Dec 2020 06:10:45 +0300
Message-Id: <20201223031046.513846-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The package android-tools-conf depends on presence of
/sys/class/android_usb, which is not present in default (mainline)
kernels. Add a set of scripts that will use ConfigFS to configure USB
gadget rather than using non-standard device class.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../10-adbd-configfs.conf                     |  4 +++
 .../android-gadget-cleanup                    | 24 +++++++++++++
 .../android-gadget-setup                      | 35 ++++++++++++++++++
 .../android-gadget-start                      |  7 ++++
 .../android-tools-conf-configfs_1.0.bb        | 36 +++++++++++++++++++
 5 files changed, 106 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
new file mode 100644
index 000000000000..ddf155a907bc
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/10-adbd-configfs.conf
@@ -0,0 +1,4 @@
+[Service]
+ExecStartPre=/usr/bin/android-gadget-setup
+ExecStartPost=/usr/bin/android-gadget-start
+ExecStopPost=/usr/bin/android-gadget-cleanup
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
new file mode 100644
index 000000000000..517227d4a636
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+[ -d /sys/kernel/config/usb_gadget ] || exit 0
+
+cd /sys/kernel/config/usb_gadget
+
+cd adb
+
+echo "" > UDC || true
+
+killall adbd || true
+
+umount /dev/usb-ffs/adb
+
+rm configs/c.1/ffs.usb0
+
+rmdir configs/c.1/strings/0x409
+rmdir configs/c.1
+
+rmdir functions/ffs.usb0
+rmdir strings/0x409
+
+cd ..
+rmdir adb
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
new file mode 100644
index 000000000000..e44d1bacbe3a
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+set -e
+
+manufacturer=RPB
+model="Android device"
+serial=0123456789ABCDEF
+
+if [ -r /etc/android-gadget-setup.machine ] ; then
+	. /etc/android-gadget-setup.machine
+fi
+
+[ -d /sys/kernel/config/usb_gadget ] || modprobe libcomposite
+
+cd /sys/kernel/config/usb_gadget
+
+[ -d adb ] && /usr/bin/android-gadget-cleanup || true
+
+mkdir adb
+cd adb
+
+mkdir configs/c.1
+mkdir functions/ffs.usb0
+mkdir strings/0x409
+mkdir configs/c.1/strings/0x409
+echo 0x18d1 > idVendor
+echo 0xd002 > idProduct
+echo "$serial" > strings/0x409/serialnumber
+echo "$manufacturer" > strings/0x409/manufacturer
+echo "$model" > strings/0x409/product
+echo "Conf 1" > configs/c.1/strings/0x409/configuration
+ln -s functions/ffs.usb0 configs/c.1
+
+mkdir -p /dev/usb-ffs/adb
+mount -t functionfs usb0 /dev/usb-ffs/adb
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
new file mode 100644
index 000000000000..ca6c3df27536
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+set -e
+
+sleep 3
+
+ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
new file mode 100644
index 000000000000..a38a8ce90226
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Different utilities from Android - corressponding configuration files for using ConfigFS"
+SECTION = "console/utils"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = " \
+    file://android-gadget-setup \
+    file://android-gadget-start \
+    file://android-gadget-cleanup \
+    file://android-gadget-setup.machine \
+    file://10-adbd-configfs.conf \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${WORKDIR}/android-gadget-setup ${D}${bindir}
+    install -m 0755 ${WORKDIR}/android-gadget-start ${D}${bindir}
+    install -m 0755 ${WORKDIR}/android-gadget-cleanup ${D}${bindir}
+
+    if [ -r ${WORKDIR}/android-gadget-setup.machine ] ; then
+	install -d ${D}${sysconfdir}
+	install -m 0644 ${WORKDIR}/android-gadget-setup.machine ${D}${sysconfdir}
+    fi
+
+    install -d ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
+    install -m 0644 ${WORKDIR}/10-adbd-configfs.conf ${D}${systemd_unitdir}/system/android-tools-adbd.service.d
+}
+
+FILES_${PN} += " \
+    ${systemd_unitdir}/system/ \
+"
+
+PROVIDES += "android-tools-conf"
+RPROVIDES_${PN} = "android-tools-conf"
-- 
2.29.2

