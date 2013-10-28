Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 292B76CEB9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 23:20:22 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id e52so1993812eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 16:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0xcrLfw3W7OwumPKd21VUgSuv8Lv1aSnquHGibrMJoA=;
	b=PUF8dShzaEkIv1l/pkiqa2jdku9gfWSEylaK7oDCJFk+ygbmrLSl0IOXaytxNT1+PS
	M0zvjigAckVs1tKrCDhVRTXjKi6GJTWphyniNRnIOVxOoKAXvEYdYpk/oNjElg1aJWIk
	sgA+Xw5dS/5XS6d50ehks757fp/2N2U96oJPlSQDPc9U5JAZtDNr+mCFxl9g7P1j+jTC
	Lf+gt6Lncs/lDTKopf+7fBxyPbe3xnN2s94qatA+2E0+UAoIW8uFkuK8J/DNgtC2iMG+
	fAaosfJkyHoRXzjNEf8VWktGWCUDbGLIF9dWZLYE0krfzzhIFIrWMUunvdhtuN+KuoxV
	YboA==
X-Received: by 10.14.219.4 with SMTP id l4mr24390197eep.37.1383002423301;
	Mon, 28 Oct 2013 16:20:23 -0700 (PDT)
Received: from mizar.localdomain
	(host234-252-dynamic.45-79-r.retail.telecomitalia.it.
	[79.45.252.234])
	by mx.google.com with ESMTPSA id w6sm62831947eeo.12.2013.10.28.16.20.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 16:20:22 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2013 00:20:20 +0100
Message-Id: <1383002420-5073-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH v2] meta-handheld: adjust EXTRA_IMAGECMD_jffs2 after oe-core changes
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
X-List-Received-Date: Mon, 28 Oct 2013 23:20:24 -0000

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
+EXTRA_IMAGECMD_jffs2 = "-p -l -e ${JFFS2_ERASEBLOCK}"
 
 MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "800"
-- 
1.8.1.5


