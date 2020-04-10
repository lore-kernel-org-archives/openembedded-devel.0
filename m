Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.8013.1586522103708869500
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 05:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=WOtWmO+c;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.66, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f66.google.com with SMTP id c15so2128181wro.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2020 05:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jPO5/g8q2AHA1wEUgwHzigOYSaYmdWfwY3J/VYgSSsg=;
        b=WOtWmO+cRs6ImZqtkM0IRJtL3yn42VkvRBAQzPC5BHbFaIyZ2nq3A4YQl2bEDZrvJ+
         1AKBWJw2x41NUlxVeHFz2iR+KxuKVnwp+I7xjR6dtKhh0AK9KuzjaIqZ3VZuNK19zI2C
         prkSTS7jcGr6ONZWjpCNgu1URlKy+9QopuYRAHg8HVlk8mH4jG9fIcMEU9NQ1gKQphcS
         22pBOV8J9Ac7pEiwKJM7Uab9VRCZFLD0yWTyo0lJVEwEkN9VZ0i7qV7GUuSyttCSaXgv
         SMoA2lXuQGiZqPnT8o2N3V1eELd7GL14nk/2KPYxY2PpIqLet2GXRgn5M/cIo/Arh2wW
         7zYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jPO5/g8q2AHA1wEUgwHzigOYSaYmdWfwY3J/VYgSSsg=;
        b=O/O5d7cw2gSUWhlXefy+MwOx1fuoRogtVG+ELQGGc7aKwErFGECQu+Vh68z+Y5JQzu
         lXmzD5sxXHm72YeXblIoCbUxoVnNpGzYq9zmbBNsNaf77BiAiA2cfoRshGJRQCdzhhoY
         eJHVDrwKHvS49lZA47g7YcMKCtIdXplCyprDCH8tzmn1DVntYcYK9XMK1Cdrv4hZbvN7
         CtlZ2uF+ZR/v054FHiA0VNL597dmOBKGnTykBb0pCzC/Lo2ODFd9x92jLtPV7NjRaOTj
         jIJTZPUccIfEmgmOyRe8kzUm1ZEb0WQCTNSKRChJ4uqGDjaGQdME6Qd9dtiSNVbXtjFy
         r7ew==
X-Gm-Message-State: AGi0Puaf1XGyNopfIvy7XQRI7TjS7PuWK94WyGoY21f5Tocs0Jlczqv8
	G6FV2uFdY46CdiyZXW5qF2l0fw==
X-Google-Smtp-Source: APiQypL5KyIb2oa3EnHNJKCjU7o6vWZXg53HcNbFrr04qpdXiY1UyeOKgvT91ZRv8WT8GMw+qWk97A==
X-Received: by 2002:adf:90ea:: with SMTP id i97mr4342824wri.123.1586522102130;
        Fri, 10 Apr 2020 05:35:02 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id d7sm2685062wrr.77.2020.04.10.05.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 05:35:01 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-devel@lists.openembedded.org,
	yocto@lists.yoctoproject.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [OE-core][PATCH v2 2/2] dm-verity: add a working example for BeagleBone Black
Date: Fri, 10 Apr 2020 14:34:49 +0200
Message-Id: <20200410123449.9624-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200410123449.9624-1-brgl@bgdev.pl>
References: <20200410123449.9624-1-brgl@bgdev.pl>
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

