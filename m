Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 00B666CE55
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 23:04:50 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so2541976eae.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 16:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VGIw+JbybxsjlV4b/AlJiCeqdQKJVLsGFsPdl3gfiqw=;
	b=RSKlejm79k3BcLVGLyxKsKXa9thL+LG6a29QMqiNBGIjgLdv0I2xtCvDckZ9Bow4hi
	qLUyGUvyGF5t8Ns0YmMFXaS865SFnpkyvjsapxH3l23Idq71rEcVTH7io9/gzYzVOlr9
	w6f0cdX16rkaC+OstKVCV9D3qZYowqeLYhArckN5i4z3t9Zx1d8tHQGo5FNPN/vuUkUY
	0xlxy4gV94uXNp0tod08lXf1jnHCEhGchQ1QHcHS8k7/VZjf7wb1sdJjvmtcJsXbgzEB
	cBl5iEOqpQ8ym2Wnct+l7H0Aa5S7oTAqCmQ+8u8bvq9o4ucqTU2QNAuJIGPBim98yVme
	vbYQ==
X-Received: by 10.14.32.196 with SMTP id o44mr24635034eea.43.1383001492148;
	Mon, 28 Oct 2013 16:04:52 -0700 (PDT)
Received: from mizar.localdomain
	(host234-252-dynamic.45-79-r.retail.telecomitalia.it.
	[79.45.252.234])
	by mx.google.com with ESMTPSA id a6sm62710461eei.10.2013.10.28.16.04.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 16:04:51 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2013 00:04:48 +0100
Message-Id: <1383001488-4947-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] meta-handheld: adjust EXTRA_IMAGECMD_jffs2 after oe-core changes
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
X-List-Received-Date: Mon, 28 Oct 2013 23:04:51 -0000

The machine configuration file must specify a customized
EXTRA_IMAGECMD_jffs2 to override the defaults of image_types.bbclass.
Images for NOR flashes should be built with cleanmarkers.

Fix the declaration of padding for collie:
the short form doesn't accept <size> arument

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/collie.conf     | 2 +-
 conf/machine/h3600.conf      | 2 ++
 conf/machine/jornada56x.conf | 2 ++
 conf/machine/jornada7xx.conf | 4 ++++
 conf/machine/simpad.conf     | 2 ++
 5 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/conf/machine/collie.conf b/conf/machine/collie.conf
index 8d1042e..bec8842 100644
--- a/conf/machine/collie.conf
+++ b/conf/machine/collie.conf
@@ -7,7 +7,7 @@ require conf/machine/include/tune-strongarm1100.inc
 
 JFFS2_ERASEBLOCK = "0x20000"
 
-EXTRA_IMAGECMD_jffs2 = "-p 14680064 -l -e ${JFFS2_ERASEBLOCK}"
+EXTRA_IMAGECMD_jffs2 = "--pad=14680064 -l -e ${JFFS2_ERASEBLOCK}"
 
 # UBI: max collie (14.125 = 113 PEBs)
 # 14.125 x 1024 : 128 = 113 PEBs
diff --git a/conf/machine/h3600.conf b/conf/machine/h3600.conf
index 53e10cd..6e9941b 100644
--- a/conf/machine/h3600.conf
+++ b/conf/machine/h3600.conf
@@ -31,6 +31,8 @@ MACHINE_EXTRA_RDEPENDS = "mtd-utils mtd-utils-jffs2"
 MACHINE_EXTRA_RRECOMMENDS = ""
 
 JFFS2_ERASEBLOCK = "0x40000"
+# For NOR flash we need the cleanmarkers so override the defaults
+EXTRA_IMAGECMD_jffs2 = "-p -l -e ${JFFS2_ERASEBLOCK}"
 EXTRA_IMAGECMD_jffs2_append = " ; echo '${IMAGE_NAME}  ${IMAGE_NAME}.rootfs.jffs2 - root' >> ${DEPLOY_DIR_IMAGE}/reflash.ctl"
 
 #
diff --git a/conf/machine/jornada56x.conf b/conf/machine/jornada56x.conf
index 746e1eb..645f128 100644
--- a/conf/machine/jornada56x.conf
+++ b/conf/machine/jornada56x.conf
@@ -7,6 +7,8 @@ PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}depmod:module-init-tools-cross"
 BOOTSTRAP_EXTRA_RDEPENDS = "kernel kernel-modules module-init-tools" 
 
 JFFS2_ERASEBLOCK = "0x40000"
+# For NOR flash we need the cleanmarkers so override the defaults
+EXTRA_IMAGECMD_jffs2 = "-p -l -e ${JFFS2_ERASEBLOCK}"
 
 SERIAL_CONSOLE = "115200 ttySA0"
 
diff --git a/conf/machine/jornada7xx.conf b/conf/machine/jornada7xx.conf
index d9f05df..c988694 100644
--- a/conf/machine/jornada7xx.conf
+++ b/conf/machine/jornada7xx.conf
@@ -8,6 +8,10 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-jornada7xx"
 MACHINE_FEATURES = "apm alsa pcmcia irda keyboard touchscreen screen vfat"
 MACHINE_EXTRA_RDEPENDS = "kernel-modules bluez-dtl1-workaround"
 
+JFFS2_ERASEBLOCK = "0x40000"
+# For NOR flash we need the cleanmarkers so override the defaults
+EXTRA_IMAGECMD_jffs2 = "-p -l -e ${JFFS2_ERASEBLOCK}"
+
 #screeninfo
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "640"
diff --git a/conf/machine/simpad.conf b/conf/machine/simpad.conf
index d5ee19c..a6d49a5 100644
--- a/conf/machine/simpad.conf
+++ b/conf/machine/simpad.conf
@@ -9,6 +9,8 @@ MACHINE_FEATURES = "apm pcmcia irda screen touchscreen vfat"
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 
 JFFS2_ERASEBLOCK = "0x20000"
+# For NOR flash we need the cleanmarkers so override the defaults
+EXTRA_IMAGECMD.jffs2 = "-p -l -e ${JFFS2_ERASEBLOCK}"
 
 MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "800"
-- 
1.8.1.5


