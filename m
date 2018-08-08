Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 7799 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Aug 2018 22:51:27 UTC
Received: from 2.mo2.mail-out.ovh.net (2.mo2.mail-out.ovh.net [188.165.53.149])
	by mail.openembedded.org (Postfix) with ESMTP id AF24278BF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Aug 2018 22:51:27 +0000 (UTC)
Received: from player699.ha.ovh.net (unknown [10.109.143.145])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 1DA2514727D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Aug 2018 22:24:24 +0200 (CEST)
Received: from localhost.localdomain (89-66-157-179.dynamic.chello.pl
	[89.66.157.179]) (Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id 6DBEA240097;
	Wed,  8 Aug 2018 22:24:23 +0200 (CEST)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Aug 2018 22:24:11 +0200
Message-Id: <20180808202411.9293-1-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.17.1
X-Ovh-Tracer-Id: 5870442118375747144
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrtddvgddugeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenuc
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Subject: [meta-yocto][PATCH] meta-yocto-bsp: replace deprecated "SERIAL_CONSOLE"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2018 22:51:27 -0000

SERIAL_CONSOLE was already deprecated in 2013, yet still some
machine configuration files were using it. This patch replaces
it with SERIAL_CONSOLES, which is the successor.

The documentation seems to be already up do date.
beaglebone-yocto.conf in the bsp-guide already uses
SERIAL_CONSOLES. The ref-manual redirects from SERIAL_CONSOLE
to SERIAL_CONSOLES.

[YOCTO #12653]

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 meta-yocto-bsp/conf/machine/beaglebone-yocto.conf | 2 +-
 meta-yocto-bsp/conf/machine/edgerouter.conf       | 2 +-
 meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf     | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
index ae682a47d31b..44c7a1af8d97 100644
--- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
+++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
@@ -20,7 +20,7 @@ WKS_FILE ?= "beaglebone-yocto.wks"
 IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
 
-SERIAL_CONSOLE = "115200 ttyO0"
+SERIAL_CONSOLES = "115200;ttyO0"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "4.15%"
diff --git a/meta-yocto-bsp/conf/machine/edgerouter.conf b/meta-yocto-bsp/conf/machine/edgerouter.conf
index 61f2145fd59a..a3eeebf2f66a 100644
--- a/meta-yocto-bsp/conf/machine/edgerouter.conf
+++ b/meta-yocto-bsp/conf/machine/edgerouter.conf
@@ -13,7 +13,7 @@ KERNEL_IMAGE_STRIP_EXTRA_SECTIONS  = ".comment"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "4.15%"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0"
 USE_VT ?= "0"
 
 MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"
diff --git a/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf b/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
index eae8157eab4a..441987a78e92 100644
--- a/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
+++ b/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
@@ -1,5 +1,5 @@
 #@TYPE: Machine
-#@DESCRIPTION: Machine configuration for running 
+#@DESCRIPTION: Machine configuration for running
 
 TARGET_FPU = ""
 
@@ -10,7 +10,7 @@ KERNEL_IMAGETYPE = "uImage"
 EXTRA_IMAGEDEPENDS += "u-boot"
 UBOOT_MACHINE = "MPC8315ERDB_config"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0"
 
 MACHINE_FEATURES = "keyboard pci ext2 ext3 serial"
 
-- 
2.17.1


