Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.8125.1586522504966275044
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 05:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=ZkY8/33N;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.65, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f65.google.com with SMTP id w10so2183014wrm.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2020 05:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jPO5/g8q2AHA1wEUgwHzigOYSaYmdWfwY3J/VYgSSsg=;
        b=ZkY8/33N0dME3SWtUNXAgK01fz0UXWSxWEw1hgH4KWPYC0qtIOunAgwYWGjwe2F86Q
         kd2r/PhmF+vtZQgf2hKQMhNdmmPMBuOO8pp9Ji89/qVnRJulfwikMMCXjNQ9ScbXMxT/
         s5Vb09gAPv80LtICOlvGBhW7vfi6SY1oaYIxMH38tl5EM+T2kBlWItITmHXolFmORxkV
         I4s2Bk1pI4jvoJHw4KHy1bH+zXGWywnZo2chEjIyf0ctaAYoQJqr9ts7CdOIg4b6MhVF
         wn6AWToJQ6Vz3gAowostjFpQxRxEHg5QmqWu5ve6MtoebFSSexu44rCygVnW6a6vBDOa
         1tkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jPO5/g8q2AHA1wEUgwHzigOYSaYmdWfwY3J/VYgSSsg=;
        b=RXzl2Ak5GYzvSt8lh4yHFVZKb0gI/W/WBFm++KNHI/6THSpnAqDPsE1w/2ThAPF5kd
         tBv/r4jOS51i/p6D4d2zKI7yBm0ebVk67t3R03yzn68kG+yENRPTbHA1mSLKIRbETumB
         k0+XZhz5S3ZPiURAsm0fDsx2IYbyqzMOLl1uGiRi6KyZl47EscPI/O/VSX3UglPOzGhZ
         VEE8KNs6+hRX4J7cP/IZAJNI+tNDuVlYr641i+SBmUrbBliGqMRRxu0J/GjrdeMNWZbv
         OeFwgoCGCim3CTdqrFcOcIoxtnzeFGJnSyV8oLqbHX5sJaIhHYWdYJVXwNGv/GQZMgBw
         KG/w==
X-Gm-Message-State: AGi0PuZq4u/z+pwB19Ah0Zb/HmF2ZCCgt3V5qCnx3pRRWu1FD4GI5Hqz
	jDW3ad32CEm3zkKXQ5DjmI0YDA==
X-Google-Smtp-Source: APiQypKHTQt14TinSH4KRBcAIbNP5zw9OkWiw9Giv+6/gSJJuDH/Y8bTvg9UsrfAUqhZAtNoaIo5dg==
X-Received: by 2002:adf:ee12:: with SMTP id y18mr4238410wrn.289.1586522503524;
        Fri, 10 Apr 2020 05:41:43 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id d10sm2663747wrp.9.2020.04.10.05.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 05:41:42 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-devel@lists.openembedded.org,
	yocto@lists.yoctoproject.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-security][RFC 2/2] dm-verity: add a working example for BeagleBone Black
Date: Fri, 10 Apr 2020 14:41:35 +0200
Message-Id: <20200410124135.24217-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200410124135.24217-1-brgl@bgdev.pl>
References: <20200410124135.24217-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds various bits and pieces to enable generating a working example
of a full chain of trust up to dm-verity-protected rootfs level on Beagle
Bone Black.

The new initramfs is quite generic and should work for other SoCs as well
when using fitImage.

The following config can be used with current master poky,
meta-openembedded & meta-security to generate a BBB image using verified
boot and dm-verity.

  UBOOT_SIGN_KEYDIR = "/tmp/test-keys/"
  UBOOT_SIGN_KEYNAME = "dev"
  UBOOT_SIGN_ENABLE = "1"
  UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
  UBOOT_MACHINE_beaglebone-yocto = "am335x_boneblack_vboot_config"

  IMAGE_CLASSES += "dm-verity-img"
  IMAGE_FSTYPES += "wic.xz ext4"

  DM_VERITY_IMAGE = "core-image-full-cmdline"
  DM_VERITY_IMAGE_TYPE = "ext4"

  KERNEL_CLASSES += "kernel-fitimage"
  KERNEL_IMAGETYPE_beaglebone-yocto = "fitImage"

  IMAGE_INSTALL_remove = " kernel-image-zimage"
  IMAGE_BOOT_FILES_remove = " zImage"
  IMAGE_BOOT_FILES_append = " fitImage-${INITRAMFS_IMAGE}-${MACHINE}-${MACHINE};fitImage"

  # Using systemd is not strictly needed but deals nicely with read-only
  # filesystem by default.
  DISTRO_FEATURES_append = " systemd"
  DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
  VIRTUAL-RUNTIME_init_manager = "systemd"
  VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"

  INITRAMFS_IMAGE = "dm-verity-image-initramfs"
  INITRAMFS_FSTYPES = "cpio.gz"
  INITRAMFS_IMAGE_BUNDLE = "1"

  WKS_FILE = "beaglebone-yocto-verity.wks.in"

  KERNEL_FEATURES_append = " features/device-mapper/dm-verity.scc"

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../images/dm-verity-image-initramfs.bb       | 26 +++++++++++
 .../initrdscripts/initramfs-dm-verity.bb      | 13 ++++++
 .../initramfs-dm-verity/init-dm-verity.sh     | 46 +++++++++++++++++++
 wic/beaglebone-yocto-verity.wks.in            | 15 ++++++
 4 files changed, 100 insertions(+)
 create mode 100644 recipes-core/images/dm-verity-image-initramfs.bb
 create mode 100644 recipes-core/initrdscripts/initramfs-dm-verity.bb
 create mode 100644 recipes-core/initrdscripts/initramfs-dm-verity/init-dm-verity.sh
 create mode 100644 wic/beaglebone-yocto-verity.wks.in

diff --git a/recipes-core/images/dm-verity-image-initramfs.bb b/recipes-core/images/dm-verity-image-initramfs.bb
new file mode 100644
index 0000000..f9ea376
--- /dev/null
+++ b/recipes-core/images/dm-verity-image-initramfs.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Simple initramfs image for mounting the rootfs over the verity device mapper."
+
+# We want a clean, minimal image.
+IMAGE_FEATURES = ""
+
+PACKAGE_INSTALL = " \
+    initramfs-dm-verity \
+    base-files \
+    busybox \
+    util-linux-mount \
+    udev \
+    cryptsetup \
+    lvm2-udevrules \
+"
+
+# Can we somehow inspect reverse dependencies to avoid these variables?
+do_rootfs[depends] += "${DM_VERITY_IMAGE}:do_image_${DM_VERITY_IMAGE_TYPE}"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+
+inherit core-image
+
+deploy_verity_hash() {
+    install -D -m 0644 ${DEPLOY_DIR_IMAGE}/${DM_VERITY_IMAGE}-${MACHINE}.${DM_VERITY_IMAGE_TYPE}.verity.env ${IMAGE_ROOTFS}/${datadir}/dm-verity.env
+}
+ROOTFS_POSTPROCESS_COMMAND += "deploy_verity_hash;"
diff --git a/recipes-core/initrdscripts/initramfs-dm-verity.bb b/recipes-core/initrdscripts/initramfs-dm-verity.bb
new file mode 100644
index 0000000..b614956
--- /dev/null
+++ b/recipes-core/initrdscripts/initramfs-dm-verity.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Simple init script that uses devmapper to mount the rootfs in read-only mode protected by dm-verity"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://init-dm-verity.sh"
+
+do_install() {
+    install -m 0755 ${WORKDIR}/init-dm-verity.sh ${D}/init
+    install -d ${D}/dev
+    mknod -m 622 ${D}/dev/console c 5 1
+}
+
+FILES_${PN} = "/init /dev/console"
diff --git a/recipes-core/initrdscripts/initramfs-dm-verity/init-dm-verity.sh b/recipes-core/initrdscripts/initramfs-dm-verity/init-dm-verity.sh
new file mode 100644
index 0000000..307d2c7
--- /dev/null
+++ b/recipes-core/initrdscripts/initramfs-dm-verity/init-dm-verity.sh
@@ -0,0 +1,46 @@
+#!/bin/sh
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+RDEV=""
+ROOT_DIR="/new_root"
+
+mkdir -p /proc
+mkdir -p /sys
+mkdir -p /run
+mkdir -p /tmp
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+mount -t devtmpfs none /dev
+
+udevd --daemon
+udevadm trigger --type=subsystems --action=add
+udevadm trigger --type=devices --action=add
+udevadm settle --timeout=10
+
+for PARAM in $(cat /proc/cmdline); do
+	case $PARAM in
+		root=*)
+			RDEV=${PARAM#root=}
+			;;
+	esac
+done
+
+if ! [ -b $RDEV ]; then
+	echo "Missing root command line argument!"
+	exit 1
+fi
+
+case $RDEV in
+	UUID=*)
+		RDEV=$(realpath /dev/disk/by-uuid/${RDEV#UUID=})
+		;;
+esac
+
+. /usr/share/dm-verity.env
+
+echo "Mounting $RDEV over dm-verity as the root filesystem"
+
+veritysetup --data-block-size=1024 --hash-offset=$DATA_SIZE create rootfs $RDEV $RDEV $ROOT_HASH
+mkdir -p $ROOT_DIR
+mount -o ro /dev/mapper/rootfs $ROOT_DIR
+exec switch_root $ROOT_DIR /sbin/init
diff --git a/wic/beaglebone-yocto-verity.wks.in b/wic/beaglebone-yocto-verity.wks.in
new file mode 100644
index 0000000..cd1702e
--- /dev/null
+++ b/wic/beaglebone-yocto-verity.wks.in
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright (C) 2020 BayLibre SAS
+# Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+#
+# A dm-verity variant of the regular wks for beaglebone black. We need to fetch
+# the partition images from the DEPLOY_DIR_IMAGE as the rootfs source plugin will
+# not recreate the exact block device corresponding with the hash tree. We must
+# not alter the label or any other setting on the image.
+#
+# This .wks only works with the dm-verity-img class.
+
+part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4 --size 16 --sourceparams="loader=u-boot" --use-uuid
+part / --source rawcopy --ondisk mmcblk0 --sourceparams="file=${DEPLOY_DIR_IMAGE}/${DM_VERITY_IMAGE}-${MACHINE}.${DM_VERITY_IMAGE_TYPE}.verity"
+bootloader --append="console=ttyS0,115200"
-- 
2.25.0

