Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SHMrR-00032t-Ci
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 00:14:57 +0200
Received: from mizar.localdomain (79.17.249.93) by smtp207.alice.it
	(8.6.023.02) id 4F05A6650B003A46; Tue, 10 Apr 2012 00:05:42 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2012 00:05:35 +0200
Message-Id: <1334009136-7557-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1334009136-7557-1-git-send-email-andrea.adami@gmail.com>
References: <1334009136-7557-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] linux(kexecboot)_3.2: add CC_OPTIMIZE_FOR_SIZE=y
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
X-List-Received-Date: Mon, 09 Apr 2012 22:14:57 -0000

* to Zaurus kernels
* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-3.2/akita/defconfig     |    1 +
 recipes-kernel/linux/linux-3.2/c7x0/defconfig      |    1 +
 recipes-kernel/linux/linux-3.2/collie/defconfig    |    1 +
 recipes-kernel/linux/linux-3.2/poodle/defconfig    |    1 +
 recipes-kernel/linux/linux-3.2/spitz/defconfig     |    1 +
 recipes-kernel/linux/linux-3.2/tosa/defconfig      |    1 +
 .../linux/linux-kexecboot-3.2/akita/defconfig      |    2 +-
 .../linux/linux-kexecboot-3.2/c7x0/defconfig       |    1 +
 .../linux/linux-kexecboot-3.2/collie/defconfig     |    1 +
 .../linux/linux-kexecboot-3.2/poodle/defconfig     |    1 +
 .../linux/linux-kexecboot-3.2/spitz/defconfig      |    1 +
 .../linux/linux-kexecboot-3.2/tosa/defconfig       |    1 +
 recipes-kernel/linux/linux-kexecboot_3.2.bbappend  |    1 +
 recipes-kernel/linux/linux_3.2.bb                  |    2 +-
 14 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-3.2/akita/defconfig b/recipes-kernel/linux/linux-3.2/akita/defconfig
index 8e9ce4f..96f0b58 100644
--- a/recipes-kernel/linux/linux-3.2/akita/defconfig
+++ b/recipes-kernel/linux/linux-3.2/akita/defconfig
@@ -11,6 +11,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 CONFIG_PROFILING=y
diff --git a/recipes-kernel/linux/linux-3.2/c7x0/defconfig b/recipes-kernel/linux/linux-3.2/c7x0/defconfig
index 20d4399..92d69f4 100644
--- a/recipes-kernel/linux/linux-3.2/c7x0/defconfig
+++ b/recipes-kernel/linux/linux-3.2/c7x0/defconfig
@@ -11,6 +11,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 CONFIG_PROFILING=y
diff --git a/recipes-kernel/linux/linux-3.2/collie/defconfig b/recipes-kernel/linux/linux-3.2/collie/defconfig
index 0bc9633..3cc4642 100644
--- a/recipes-kernel/linux/linux-3.2/collie/defconfig
+++ b/recipes-kernel/linux/linux-3.2/collie/defconfig
@@ -12,6 +12,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 CONFIG_PROFILING=y
diff --git a/recipes-kernel/linux/linux-3.2/poodle/defconfig b/recipes-kernel/linux/linux-3.2/poodle/defconfig
index 27729af..0b03dda 100644
--- a/recipes-kernel/linux/linux-3.2/poodle/defconfig
+++ b/recipes-kernel/linux/linux-3.2/poodle/defconfig
@@ -11,6 +11,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 CONFIG_PROFILING=y
diff --git a/recipes-kernel/linux/linux-3.2/spitz/defconfig b/recipes-kernel/linux/linux-3.2/spitz/defconfig
index f2e32de..dd790e3 100644
--- a/recipes-kernel/linux/linux-3.2/spitz/defconfig
+++ b/recipes-kernel/linux/linux-3.2/spitz/defconfig
@@ -11,6 +11,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 CONFIG_PROFILING=y
diff --git a/recipes-kernel/linux/linux-3.2/tosa/defconfig b/recipes-kernel/linux/linux-3.2/tosa/defconfig
index 8ce424b..b01a366 100644
--- a/recipes-kernel/linux/linux-3.2/tosa/defconfig
+++ b/recipes-kernel/linux/linux-3.2/tosa/defconfig
@@ -11,6 +11,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 CONFIG_PROFILING=y
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig b/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig
index a25331b..cf430c8 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig
@@ -6,6 +6,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
 CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_INITRAMFS_COMPRESSION_LZMA=y
 # CONFIG_UID16 is not set
 # CONFIG_KALLSYMS is not set
@@ -20,7 +21,6 @@ CONFIG_SLOB=y
 # CONFIG_LBDAF is not set
 # CONFIG_IOSCHED_CFQ is not set
 CONFIG_ARCH_PXA=y
-CONFIG_GPIO_PCA953X=y
 CONFIG_PXA_SHARPSL=y
 CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
 CONFIG_MACH_AKITA=y
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/c7x0/defconfig b/recipes-kernel/linux/linux-kexecboot-3.2/c7x0/defconfig
index d869fdd..4d6a4c7 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.2/c7x0/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/c7x0/defconfig
@@ -6,6 +6,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
 CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_INITRAMFS_COMPRESSION_LZMA=y
 # CONFIG_UID16 is not set
 # CONFIG_KALLSYMS is not set
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/collie/defconfig b/recipes-kernel/linux/linux-kexecboot-3.2/collie/defconfig
index b690f25..cf50716 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.2/collie/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/collie/defconfig
@@ -6,6 +6,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
 CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_INITRAMFS_COMPRESSION_LZMA=y
 # CONFIG_UID16 is not set
 # CONFIG_KALLSYMS is not set
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/poodle/defconfig b/recipes-kernel/linux/linux-kexecboot-3.2/poodle/defconfig
index 141abd7..081282a 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.2/poodle/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/poodle/defconfig
@@ -6,6 +6,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
 CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_INITRAMFS_COMPRESSION_LZMA=y
 # CONFIG_UID16 is not set
 # CONFIG_KALLSYMS is not set
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/spitz/defconfig b/recipes-kernel/linux/linux-kexecboot-3.2/spitz/defconfig
index 6c579fa..cf430c8 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.2/spitz/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/spitz/defconfig
@@ -6,6 +6,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
 CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_INITRAMFS_COMPRESSION_LZMA=y
 # CONFIG_UID16 is not set
 # CONFIG_KALLSYMS is not set
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/tosa/defconfig b/recipes-kernel/linux/linux-kexecboot-3.2/tosa/defconfig
index 971c49a..40ea183 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.2/tosa/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/tosa/defconfig
@@ -6,6 +6,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
 CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_INITRAMFS_COMPRESSION_LZMA=y
 # CONFIG_UID16 is not set
 # CONFIG_KALLSYMS is not set
diff --git a/recipes-kernel/linux/linux-kexecboot_3.2.bbappend b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
index 779deb9..b3f98b1 100644
--- a/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
+++ b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
@@ -3,6 +3,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/linux-kexecboot-${PV}:${THISDIR}/files:"
 # wait until klibc_2.0 is out (march/april 2012)
 DEFAULT_PREFERENCE = "-1"
 
+PR = "${INC_PR}.1"
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
 
 # Note we set loglevel=3 and master console on serial to protect bootlogo.
diff --git a/recipes-kernel/linux/linux_3.2.bb b/recipes-kernel/linux/linux_3.2.bb
index 5379870..eb9cc34 100644
--- a/recipes-kernel/linux/linux_3.2.bb
+++ b/recipes-kernel/linux/linux_3.2.bb
@@ -1,6 +1,6 @@
 require linux.inc
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
 
 SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-- 
1.7.3.4



