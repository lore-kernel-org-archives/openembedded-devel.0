Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SHMrQ-00032t-Sv
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 00:14:57 +0200
Received: from mizar.localdomain (79.17.249.93) by smtp207.alice.it
	(8.6.023.02) id 4F05A6650B003A05; Tue, 10 Apr 2012 00:05:39 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2012 00:05:34 +0200
Message-Id: <1334009136-7557-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH 1/3] linux(-kexecboot)_3.1: add CC_OPTIMIZE_FOR_SIZE=y
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
 recipes-kernel/linux/linux-3.1/akita/defconfig     |    1 +
 recipes-kernel/linux/linux-3.1/c7x0/defconfig      |    1 +
 recipes-kernel/linux/linux-3.1/collie/defconfig    |    1 +
 recipes-kernel/linux/linux-3.1/poodle/defconfig    |    1 +
 recipes-kernel/linux/linux-3.1/spitz/defconfig     |    1 +
 recipes-kernel/linux/linux-3.1/tosa/defconfig      |    1 +
 .../linux/linux-kexecboot-3.1/akita/defconfig      |    2 +-
 .../linux/linux-kexecboot-3.1/c7x0/defconfig       |    1 +
 .../linux/linux-kexecboot-3.1/collie/defconfig     |    1 +
 .../linux/linux-kexecboot-3.1/poodle/defconfig     |    1 +
 .../linux/linux-kexecboot-3.1/spitz/defconfig      |    1 +
 .../linux/linux-kexecboot-3.1/tosa/defconfig       |    1 +
 recipes-kernel/linux/linux-kexecboot_3.1.bbappend  |    1 +
 recipes-kernel/linux/linux_3.1.bb                  |    2 +-
 14 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-3.1/akita/defconfig b/recipes-kernel/linux/linux-3.1/akita/defconfig
index 3dc0ee3..0f08d40 100644
--- a/recipes-kernel/linux/linux-3.1/akita/defconfig
+++ b/recipes-kernel/linux/linux-3.1/akita/defconfig
@@ -11,6 +11,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 CONFIG_PROFILING=y
diff --git a/recipes-kernel/linux/linux-3.1/c7x0/defconfig b/recipes-kernel/linux/linux-3.1/c7x0/defconfig
index 025008b..1889e09 100644
--- a/recipes-kernel/linux/linux-3.1/c7x0/defconfig
+++ b/recipes-kernel/linux/linux-3.1/c7x0/defconfig
@@ -11,6 +11,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 CONFIG_PROFILING=y
diff --git a/recipes-kernel/linux/linux-3.1/collie/defconfig b/recipes-kernel/linux/linux-3.1/collie/defconfig
index 679532b..1af2dc8 100644
--- a/recipes-kernel/linux/linux-3.1/collie/defconfig
+++ b/recipes-kernel/linux/linux-3.1/collie/defconfig
@@ -12,6 +12,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 CONFIG_PROFILING=y
diff --git a/recipes-kernel/linux/linux-3.1/poodle/defconfig b/recipes-kernel/linux/linux-3.1/poodle/defconfig
index 0124824..5419365 100644
--- a/recipes-kernel/linux/linux-3.1/poodle/defconfig
+++ b/recipes-kernel/linux/linux-3.1/poodle/defconfig
@@ -11,6 +11,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 CONFIG_PROFILING=y
diff --git a/recipes-kernel/linux/linux-3.1/spitz/defconfig b/recipes-kernel/linux/linux-3.1/spitz/defconfig
index dfab582..4b8d8bc 100644
--- a/recipes-kernel/linux/linux-3.1/spitz/defconfig
+++ b/recipes-kernel/linux/linux-3.1/spitz/defconfig
@@ -11,6 +11,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 CONFIG_PROFILING=y
diff --git a/recipes-kernel/linux/linux-3.1/tosa/defconfig b/recipes-kernel/linux/linux-3.1/tosa/defconfig
index 187bab2..9056e6d 100644
--- a/recipes-kernel/linux/linux-3.1/tosa/defconfig
+++ b/recipes-kernel/linux/linux-3.1/tosa/defconfig
@@ -11,6 +11,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 CONFIG_PROFILING=y
diff --git a/recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig b/recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig
index 32530a3..098042d 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig
@@ -6,6 +6,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
 CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_INITRAMFS_COMPRESSION_LZMA=y
 # CONFIG_UID16 is not set
 # CONFIG_SYSCTL_SYSCALL is not set
@@ -21,7 +22,6 @@ CONFIG_SLOB=y
 # CONFIG_LBDAF is not set
 # CONFIG_IOSCHED_CFQ is not set
 CONFIG_ARCH_PXA=y
-CONFIG_GPIO_PCA953X=y
 CONFIG_PXA_SHARPSL=y
 CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
 CONFIG_MACH_AKITA=y
diff --git a/recipes-kernel/linux/linux-kexecboot-3.1/c7x0/defconfig b/recipes-kernel/linux/linux-kexecboot-3.1/c7x0/defconfig
index b08e27e..58132cb 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.1/c7x0/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.1/c7x0/defconfig
@@ -6,6 +6,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
 CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_INITRAMFS_COMPRESSION_LZMA=y
 # CONFIG_UID16 is not set
 # CONFIG_SYSCTL_SYSCALL is not set
diff --git a/recipes-kernel/linux/linux-kexecboot-3.1/collie/defconfig b/recipes-kernel/linux/linux-kexecboot-3.1/collie/defconfig
index ce1299d..7f371ff 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.1/collie/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.1/collie/defconfig
@@ -6,6 +6,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
 CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_INITRAMFS_COMPRESSION_LZMA=y
 # CONFIG_UID16 is not set
 # CONFIG_SYSCTL_SYSCALL is not set
diff --git a/recipes-kernel/linux/linux-kexecboot-3.1/poodle/defconfig b/recipes-kernel/linux/linux-kexecboot-3.1/poodle/defconfig
index 68c37e6..e6e9481 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.1/poodle/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.1/poodle/defconfig
@@ -6,6 +6,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
 CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_INITRAMFS_COMPRESSION_LZMA=y
 # CONFIG_UID16 is not set
 # CONFIG_SYSCTL_SYSCALL is not set
diff --git a/recipes-kernel/linux/linux-kexecboot-3.1/spitz/defconfig b/recipes-kernel/linux/linux-kexecboot-3.1/spitz/defconfig
index b066839..098042d 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.1/spitz/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.1/spitz/defconfig
@@ -6,6 +6,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
 CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_INITRAMFS_COMPRESSION_LZMA=y
 # CONFIG_UID16 is not set
 # CONFIG_SYSCTL_SYSCALL is not set
diff --git a/recipes-kernel/linux/linux-kexecboot-3.1/tosa/defconfig b/recipes-kernel/linux/linux-kexecboot-3.1/tosa/defconfig
index 59cf640..8109ecd 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.1/tosa/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.1/tosa/defconfig
@@ -6,6 +6,7 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="initramfs.cpio.lzma"
 CONFIG_RD_LZMA=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_INITRAMFS_COMPRESSION_LZMA=y
 # CONFIG_UID16 is not set
 # CONFIG_SYSCTL_SYSCALL is not set
diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bbappend b/recipes-kernel/linux/linux-kexecboot_3.1.bbappend
index 74d63bb..d4911b6 100644
--- a/recipes-kernel/linux/linux-kexecboot_3.1.bbappend
+++ b/recipes-kernel/linux/linux-kexecboot_3.1.bbappend
@@ -1,5 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/linux-kexecboot-${PV}:${THISDIR}/files:"
 
+PR = "${INC_PR}.1"
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
 
 # Note we set loglevel=3 and master console on serial to protect bootlogo.
diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/linux_3.1.bb
index 5e9a714..40487d1 100644
--- a/recipes-kernel/linux/linux_3.1.bb
+++ b/recipes-kernel/linux/linux_3.1.bb
@@ -1,6 +1,6 @@
 require linux.inc
 
-PR = "${INC_PR}.9"
+PR = "${INC_PR}.10"
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz|h1940)"
 
 SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
-- 
1.7.3.4



