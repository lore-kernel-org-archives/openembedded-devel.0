Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TgPDg-0002GR-5N
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Dec 2012 01:21:40 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2228206eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 16:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8FaPAjEMCGsbzgaYt85x8mznhWLnTqivdPifqtuHA8A=;
	b=POCm+JFP3KQuqEoDKqOBBdmcCTbxHc/iVtZKMfve16QQLIfQUikztsfszkbCMckE1v
	W41qxq/GRgtnGtR2eQwLJtT9FxXExDRSzB3dn2prnKQcdE7Xvu253YEVmUuM0/ykuNOV
	DNIUt58twlRuEABhV64DvqSFagOo+lRBrol5u+cpbeOfz+McnJMojvQaEjiYutvHL7Uk
	aJIp0fMPFfaomm2dsj8ghdFrbVJOZUu31IRrhZb/KyOWSBDJ8LlOC7zE9xpX30tMUtFR
	wgRhg/WyD8gEKjzQvcF/fb/Sh6vqcO12K39+/eVocXmLI/IoCwnqnGSGLeoNWAfO749d
	GYNQ==
Received: by 10.14.203.8 with SMTP id e8mr63583425eeo.2.1354752435675;
	Wed, 05 Dec 2012 16:07:15 -0800 (PST)
Received: from mizar.localdomain
	(host81-51-dynamic.5-87-r.retail.telecomitalia.it. [87.5.51.81])
	by mx.google.com with ESMTPS id i49sm12406067eem.6.2012.12.05.16.07.13
	(version=SSLv3 cipher=OTHER); Wed, 05 Dec 2012 16:07:14 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Dec 2012 01:07:08 +0100
Message-Id: <1354752430-14139-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-handheld][PATCH 1/3] linux-yocto_3.4: move MTD common options to zaurus-hardware.cfg
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
X-List-Received-Date: Thu, 06 Dec 2012 00:21:40 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.4/akita/akita.cfg          |    6 ------
 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg |    6 ------
 .../linux/linux-yocto-3.4/collie/collie.cfg        |    6 ------
 .../linux/linux-yocto-3.4/poodle/poodle.cfg        |    6 ------
 .../linux/linux-yocto-3.4/spitz/spitz.cfg          |    6 ------
 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg |    6 ------
 .../linux/linux-yocto-3.4/zaurus-hardware.cfg      |    6 ++++++
 7 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg b/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
index 6abee5d..59feb2d 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
@@ -28,12 +28,6 @@ CONFIG_SHARPSL_PM_MAX1111=y
 CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 fbcon=rotate:1 loglevel=3"
 
 #
-# Mapping drivers for chip access
-#
-CONFIG_MTD_COMPLEX_MAPPINGS=y
-CONFIG_MTD_PHYSMAP=y
-
-#
 # Disk-On-Chip Device Drivers
 #
 CONFIG_MTD_NAND_SHARPSL=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg b/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
index 4898aa3..2d12380 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
@@ -22,12 +22,6 @@ CONFIG_SHARPSL_PM_MAX1111=y
 CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 loglevel=3"
 
 #
-# Mapping drivers for chip access
-#
-CONFIG_MTD_COMPLEX_MAPPINGS=y
-CONFIG_MTD_PHYSMAP=y
-
-#
 # Disk-On-Chip Device Drivers
 #
 CONFIG_MTD_NAND_SHARPSL=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg b/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg
index d223b35..ed3d507 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg
@@ -36,12 +36,6 @@ CONFIG_SPARSEMEM_EXTREME=y
 CONFIG_CMDLINE="console=ttySA0,115200n8 console=tty1 mem=64M fbcon=rotate:1 loglevel=3"
 
 #
-# Mapping drivers for chip access
-#
-CONFIG_MTD_COMPLEX_MAPPINGS=y
-CONFIG_MTD_PHYSMAP=y
-
-#
 # Multimedia Capabilities Port drivers
 #
 CONFIG_MCP=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg b/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
index 5b983ef..0da402d 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
@@ -22,12 +22,6 @@ CONFIG_PXA25x=y
 CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 fbcon=rotate:1 loglevel=3"
 
 #
-# Mapping drivers for chip access
-#
-CONFIG_MTD_COMPLEX_MAPPINGS=y
-CONFIG_MTD_PHYSMAP=y
-
-#
 # Disk-On-Chip Device Drivers
 #
 CONFIG_MTD_NAND_SHARPSL=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg b/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
index a7173f0..be1f9a0 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
@@ -27,12 +27,6 @@ CONFIG_SHARPSL_PM_MAX1111=y
 CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 fbcon=rotate:1 loglevel=3"
 
 #
-# Mapping drivers for chip access
-#
-CONFIG_MTD_COMPLEX_MAPPINGS=y
-CONFIG_MTD_PHYSMAP=y
-
-#
 # Disk-On-Chip Device Drivers
 #
 CONFIG_MTD_NAND_SHARPSL=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg b/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
index e339e91..75786b6 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
@@ -25,12 +25,6 @@ CONFIG_MFD_TMIO=y
 CONFIG_MFD_TC6393XB=y
 
 #
-# Mapping drivers for chip access
-#
-CONFIG_MTD_COMPLEX_MAPPINGS=y
-CONFIG_MTD_PHYSMAP=y
-
-#
 # Disk-On-Chip Device Drivers
 #
 CONFIG_MTD_NAND_TMIO=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg b/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
index 09c900c..554faa8 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
@@ -58,6 +58,12 @@ CONFIG_MTD_BLKDEVS=y
 CONFIG_MTD_BLOCK=y
 
 #
+# Mapping drivers for chip access
+#
+CONFIG_MTD_COMPLEX_MAPPINGS=y
+CONFIG_MTD_PHYSMAP=y
+
+#
 # Disk-On-Chip Device Drivers
 #
 CONFIG_MTD_NAND_ECC=y
-- 
1.7.8.6



