Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RtoXr-0005Ci-4j
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 23:57:23 +0100
Received: from mizar.localdomain (87.14.255.111) by smtp209.alice.it
	(8.6.023.02) id 4EF08A6304A9DBA7; Sat, 4 Feb 2012 23:49:24 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat,  4 Feb 2012 23:49:21 +0100
Message-Id: <1328395761-19018-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH] zaurus.inc: remove remnant of kernel26 from MACHINE_FEATURES
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
X-List-Received-Date: Sat, 04 Feb 2012 22:57:23 -0000

* and do some minor cleanings, removing unneeded var for kernel type
* remove outdated comments about tosa suspend as well

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 099bb3e..a43db8b 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -35,8 +35,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux"
 
 # Default bootloader expects "zImage", use "uImage" for u-boot
 # Note: kexecboot can boot both kind of images
-ZAURUS_KERNEL_IMAGETYPE ?= "zImage"
-KERNEL_IMAGETYPE = "${ZAURUS_KERNEL_IMAGETYPE}"
+KERNEL_IMAGETYPE ?= "zImage"
 
 # sane defaults for devices with only 32Mb RAM (see man xz)
 XZ_COMPRESSION_LEVEL = "-e -7"
@@ -60,7 +59,7 @@ CMDLINE_poodle = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
 CMDLINE_spitz = "console=ttyS0,115200n8 console=tty1 fbcon=rotate:1"
 CMDLINE_tosa = "console=ttyS0,115200n8 console=tty1"
 
-MACHINE_FEATURES = "kernel26 apm alsa pcmcia irda usbgadget keyboard touchscreen screen vfat ext2"
+MACHINE_FEATURES = "apm alsa pcmcia irda usbgadget keyboard touchscreen screen vfat ext2"
 MACHINE_FEATURES_append_akita = " usbhost"
 MACHINE_FEATURES_append_spitz = " usbhost"
 MACHINE_FEATURES_append_tosa  = " usbhost wifi "
@@ -68,9 +67,6 @@ MACHINE_FEATURES_append_tosa  = " usbhost wifi "
 MACHINE_EXTRA_RDEPENDS = "zaurusd mtd-utils nandlogical"
 MACHINE_EXTRA_RDEPENDS_collie = "zaurusd"
 
-# Still actual? OHCI suspend/resume fixup
-# MACHINE_EXTRA_RRECOMMENDS_tosa = "apm-tosa-suspendfix"
-
 ##################################
 # Zaurus rootfs are booted by
 # linux-kexecboot
-- 
1.7.3.4



