Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web09.9156.1608805890144299407
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Dec 2020 02:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VSmjUkAs;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id h22so3888012lfu.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Dec 2020 02:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oDKBdPcfzWFE20DmtLYRmx7/GPE6tznU9O7p9frmgKY=;
        b=VSmjUkAsLvpJMr9rQ3uFgZXNgOIyACuUy5U35K0WyW7Ce+Dua1DPlw6s+aOD5Kiuec
         zBjnf9ATR/ln5GVBWQrNke6Cx2Da0ELYvJz+7LmYHNHiiACa794qO/E9w0QXo6xsl5Ap
         5UQgcm6JFxFD4FN7J2aZREVbNE4zv+kWnO1d8babMu47BEa+264gDCoF0cBbS/pNiOb8
         RITHQ6mZGTjH1rudyOV+thy9ImWBYU/nHGC4/zDOFDyiehieOIV/2U2tujjehz2n2I1Q
         m7VjQiC4Gvz29C+/fPwCy3/xMh1AY4M3izozzt28skMISeonMCBbqGlOvUT6EDKAp7Z6
         +Y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oDKBdPcfzWFE20DmtLYRmx7/GPE6tznU9O7p9frmgKY=;
        b=YYCCoeGX6I6Lw4Tn4BZ1AOUXkV2JBJc7S/9U2F27zJvS9YuvmtBTgZzotxVJ+7Drbx
         M1Nxq2gewinNk9f7fCdPTeB/+VkG1MNJsOFkPbfj3YFLwQAAHmq5frl700wZzEsMu0DX
         yJCmjE8z4+w6pS2nRZg/lvyb7s+/RScJvBZQWgDB6dO83msA9Leo/tU6i0xwrFH272IH
         iGnO/pKdB02vemHqOAxFmZxl0cvto0aOba0Str1ZNv4HDfsuBUH6g/IeB7oIignP6cld
         ieCFKqJCorUjlIqRpOipnA9CbKfX1c4RGNV4nAv/WWTdyRnPJqOyDzOaSgm+0KwWJqBf
         /Q5w==
X-Gm-Message-State: AOAM531ARVgtA6wCDElDaMizR1wygCeE4H0aLdIXki4c46My49wgwCKz
	eYs7lWhaADvPuy0ZAssGD/iFh4vNTNDhvw==
X-Google-Smtp-Source: ABdhPJyEPvrbqIlKUiCccpxxXb2/IqC9ktJrDAKHuVqM/uscwNFDurMXwaftjYnfu4iT1cdo3NG/kw==
X-Received: by 2002:a2e:9747:: with SMTP id f7mr14431853ljj.262.1608805887186;
        Thu, 24 Dec 2020 02:31:27 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.59])
        by smtp.gmail.com with ESMTPSA id l84sm3552553lfd.75.2020.12.24.02.31.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 02:31:26 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 1/2] android-tools-conf-configfs: add an alternative to anrdoid-tools-conf
Date: Thu, 24 Dec 2020 13:31:23 +0300
Message-Id: <20201224103124.3387695-1-dmitry.baryshkov@linaro.org>
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
 .../android-gadget-setup                      | 35 +++++++++++++++++++
 .../android-gadget-start                      |  7 ++++
 .../android-tools-conf-configfs_1.0.bb        | 35 +++++++++++++++++++
 5 files changed, 105 insertions(+)
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
index 000000000000..01dc1bea98d4
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "Different utilities from Android - corressponding configuration files for using ConfigFS"
+SECTION = "console/utils"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = " \
+    file://android-gadget-setup \
+    file://android-gadget-start \
+    file://android-gadget-cleanup \
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

