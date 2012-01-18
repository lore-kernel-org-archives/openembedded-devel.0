Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RnfRs-0004St-9U
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 01:01:48 +0100
Received: from mizar.localdomain (87.0.248.69) by smtp207.alice.it (8.6.023.02)
	id 4F05A6650162CFDE; Thu, 19 Jan 2012 00:54:11 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Jan 2012 00:52:59 +0100
Message-Id: <1326930779-21885-4-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1326930779-21885-1-git-send-email-andrea.adami@gmail.com>
References: <1326930779-21885-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld] [PATCH 3/3] zaurus.inc: decouple build of zaurus-installer (and linux-kexecboot)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2012 00:01:48 -0000

* Once flashed on device there isn't any advantage rebuilding
* initramfs images for linux-kexecboot on each image build.
*
* One would bitbake zaurus-installer only when needed.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/initramfs-kexecboot.inc |   18 ------------------
 conf/machine/include/zaurus.inc              |   14 +++++++++-----
 2 files changed, 9 insertions(+), 23 deletions(-)
 delete mode 100644 conf/machine/include/initramfs-kexecboot.inc

diff --git a/conf/machine/include/initramfs-kexecboot.inc b/conf/machine/include/initramfs-kexecboot.inc
deleted file mode 100644
index bc9cd51..0000000
--- a/conf/machine/include/initramfs-kexecboot.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-# Initramfs-kexecboot extra config
-
-
-# If set here, each image will also build linux-kexecboot.
-# Usually the machine-installer recipe already DEPENDS on it
-#
-EXTRA_IMAGEDEPENDS += "linux-kexecboot"
-
-
-# Force inclusion of kernel in target images
-# (done by default)
-#
-RDEPENDS_kernel-base = "kernel-image"
-
-
-# Install /boot/boot.cfg in target images
-#
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS_append = " kexecboot-cfg "
diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index b42799f..e833ecc 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -16,8 +16,6 @@ INITRAMFS_FSTYPES ?= "cpio.gz cpio.lzma"
 EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
-EXTRA_IMAGEDEPENDS += "zaurus-installer"
-
 IMAGE_DEVICE_TABLES = ""
 
 #########
@@ -74,11 +72,17 @@ MACHINE_EXTRA_RDEPENDS_collie = "zaurusd"
 # MACHINE_EXTRA_RRECOMMENDS_tosa = "apm-tosa-suspendfix"
 
 ##################################
-# build kexecboot kernel while
-# making sure rootfs is compatible
+# Zaurus rootfs are booted by
+# linux-kexecboot
 ##################################
 
-require conf/machine/include/initramfs-kexecboot.inc
+# If set here, each image will also build linux-kexecboot and the updater
+# EXTRA_IMAGEDEPENDS += "zaurus-installer"
+
+# Install /boot/boot.cfg in target images
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS_append = " kexecboot-cfg "
+
+
 
 # FIXME
 # blindly import from linux-rp.inc (2.6.2x)
-- 
1.7.3.4



