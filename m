Return-Path: <>
Received: from mail-wi0-f182.google.com (unknown [209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 328386FA42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 21:59:21 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id r20so622555wiv.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 14:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=c3ipq4J+vzDzWDO7PbCTYzenUcf4ORrPdLTsaLXKAWY=;
	b=jy7sin2Om3a44tzX5Rpr3d+WZjypeh+TxQi5zi09hyZDBJpMXaH1QrWlG4E8U4H/Cn
	aF024hsP7YrITKrku5Fl93vi/1tDV6SqKN3zTErsdJ7v2LqnwhEv81vrf/B5CahWZCQF
	zt0DA0R1w7okF4wz6ilAwc6QCNaObSknV4njyEJw+F88nHEHpDTtOSND2IilS4bTOmme
	94EHU49PgpbuOLlM7I2DNc8A4u2Slgqn8uDz5NSur/d1uGmDlERSvq2E1jyLTtuwrjj4
	v3o2ObEBMsb/kqb2T2LTUEStKIU00mF93jBUbAnHOyZ7ySGIA0os5iKCE6llrWzMo6p8
	06NQ==
X-Received: by 10.194.63.46 with SMTP id d14mr34532355wjs.24.1401141562643;
	Mon, 26 May 2014 14:59:22 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host160-222-dynamic.7-79-r.retail.telecomitalia.it. [79.7.222.160])
	by mx.google.com with ESMTPSA id l2sm3043077wix.13.2014.05.26.14.59.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 May 2014 14:59:21 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
X-Google-Original-From: Andrea Adami <andrea.adami@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 23:56:50 +0200
Message-Id: <1401141410-29057-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] gcw0: improve compatibility with kexecboot
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
X-List-Received-Date: Mon, 26 May 2014 21:59:24 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Alternative images to be booted by kexecboot
require to have an elf vmlinuz in /boot (kexec
on mips expects elf).
The bootloader however needs raw data (vmlinuz.bin) so
we customize KERNEL_IMAGETYPE in the recipe.
Finally, kexec is added to the main kernel recipe for
easier testing and the watchdog timer is increased in
the configuration for the kexecboot kernel.

At the moment linux-kexecboot detects just fine
partitions on external SD but freezes on kexec.
Tests done from shell reveal that both kexec
binaries (2.06 glibc and 2.02 klibc) load the new kernel
but freeze on kexec -e.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/gcw0.conf                                        | 7 ++++++-
 recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig           | 1 +
 recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig | 2 +-
 recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb             | 3 +++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/conf/machine/gcw0.conf b/conf/machine/gcw0.conf
index 801f634..da54112 100644
--- a/conf/machine/gcw0.conf
+++ b/conf/machine/gcw0.conf
@@ -9,9 +9,14 @@ require conf/machine/include/tune-mips32r2.inc
 # IMAGE_FEATURES += "read-only-rootfs"
 IMAGE_FSTYPES ?= "tar.gz squashfs squashfs-xz"
 
+INITRAMFS_FSTYPES = "cpio.gz cpio.xz"
+
 PREFERRED_PROVIDER_virtual/kernel = "linux-gcw0"
 
-KERNEL_IMAGETYPE = "vmlinuz.bin"
+# ELF for kexec (kernel to be put in /boot)
+KERNEL_IMAGETYPE = "vmlinuz"
+# RAW for ubiboot (only for linux-gcw0-kexecboot)
+#KERNEL_IMAGETYPE = "vmlinuz.bin"
 KERNEL_OUTPUT = "${KERNEL_IMAGETYPE}"
 
 MACHINE_GUI_CLASS = "smallscreen"
diff --git a/recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig b/recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig
index a2a0db4..70f6f41 100644
--- a/recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig
+++ b/recipes-kernel/linux/linux-gcw0-3.12/gcw0/defconfig
@@ -4,6 +4,7 @@ CONFIG_HIGHMEM=y
 # CONFIG_COMPACTION is not set
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_PREEMPT_VOLUNTARY=y
+CONFIG_KEXEC=y
 # CONFIG_SECCOMP is not set
 CONFIG_LOCALVERSION="-dingux"
 CONFIG_DEFAULT_HOSTNAME="gcw-zero"
diff --git a/recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig b/recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig
index ca4b4be..e5c5d7e 100644
--- a/recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig
+++ b/recipes-kernel/linux/linux-gcw0-kexecboot-3.12/gcw0/defconfig
@@ -203,7 +203,7 @@ CONFIG_NLS_UTF8=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
 CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="panic=5 rdinit=/usr/bin/kexecboot console=ttyS2,57600 console=tty0 rfkill.default_state=0"
+CONFIG_CMDLINE="panic=55 rdinit=/usr/bin/kexecboot console=ttyS2,57600 console=tty0 rfkill.default_state=0"
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
 # CONFIG_CRYPTO_HW is not set
 CONFIG_FONTS=y
diff --git a/recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb b/recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb
index 5094035..45a18c0 100644
--- a/recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb
+++ b/recipes-kernel/linux/linux-gcw0-kexecboot_3.12.bb
@@ -7,6 +7,9 @@ PROVIDES = ""
 KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-gcw0-kexecboot-${PV}-${MACHINE}"
 KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-gcw0-kexecboot-${MACHINE}"
 
+# RAW for ubiboot
+KERNEL_IMAGETYPE = "vmlinuz.bin"
+
 INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
 INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
 
-- 
1.9.1


