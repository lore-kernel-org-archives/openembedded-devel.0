Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6049260F15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 23:54:14 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so3735851eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 16:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2I0BUjeqi0/18Jlmbk7HEzMsDuy4/t3gqupTg3MhWtk=;
	b=wmIMZXusGCBxSIRdOyOmoh+t1NCurYlbj9YcFKpj4exDoHA9KsmGkhZqF6VQatIGTm
	SsgwrSVa5QIw3C4b64T9qoDiRXrBmyA6Ha6H0VYrLCoK3JvQPO43DuP6Uwpo5P880V2R
	+5bHEBwsKzpyboJrz+GklyEazeRle077UqBdEdG8Qe2N7ALYh6RDkrML0gnVRGgALiav
	hX8h7XUZzDD0rIC7hQIupTTJsuEuhhfEDkGwLp0CdrS55A712VDFB4UrX4AnD139LhWV
	WpzirTXTjtdFDl8oTJXHnHoZCMAPWL6jlN/vx7ZmoWtXD//o9tpFezBjVytlPt2dtVJk
	epZA==
X-Received: by 10.14.102.66 with SMTP id c42mr8728427eeg.47.1381794855704;
	Mon, 14 Oct 2013 16:54:15 -0700 (PDT)
Received: from mizar.localdomain ([95.237.174.211])
	by mx.google.com with ESMTPSA id
	j7sm159385714eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 16:54:15 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 01:54:11 +0200
Message-Id: <1381794851-12671-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] meta-handheld: use code in image_types.bbclass for JFFS2
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
X-List-Received-Date: Mon, 14 Oct 2013 23:54:16 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/h1910.conf                    | 2 +-
 conf/machine/h2200.conf                    | 2 +-
 conf/machine/h3600.conf                    | 3 ++-
 conf/machine/h5000.conf                    | 5 ++++-
 conf/machine/hx4700.conf                   | 7 +++----
 conf/machine/include/motorola-ezx-base.inc | 3 ++-
 conf/machine/jornada56x.conf               | 2 +-
 conf/machine/palmtt.conf                   | 3 ++-
 conf/machine/palmz71.conf                  | 3 ++-
 conf/machine/simpad.conf                   | 6 +++---
 10 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/conf/machine/h1910.conf b/conf/machine/h1910.conf
index 56c560e..012b2e5 100644
--- a/conf/machine/h1910.conf
+++ b/conf/machine/h1910.conf
@@ -14,7 +14,7 @@ MACHINE_FEATURES = "touchscreen apm alsa irda usbgadget screen vfat qvga"
 #
 PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
 
-EXTRA_IMAGECMD_h1910_jffs2 = "-e 0x4000 -p -n"
+JFFS2_ERASEBLOCK = "0x4000"
 
 #
 # Modules autoload and other boot properties
diff --git a/conf/machine/h2200.conf b/conf/machine/h2200.conf
index 30c8a81..97cfbb7 100644
--- a/conf/machine/h2200.conf
+++ b/conf/machine/h2200.conf
@@ -23,7 +23,7 @@ MACHINE_EXTRA_RRECOMMENDS = "\
     kernel-module-i2c-pxa \
     "
 
-EXTRA_IMAGECMD_jffs2 = "--pad --eraseblock=0x4000"
+JFFS2_ERASEBLOCK = "0x4000"
 
 #
 # Modules autoload and other boot properties
diff --git a/conf/machine/h3600.conf b/conf/machine/h3600.conf
index 78e11be..70d31d6 100644
--- a/conf/machine/h3600.conf
+++ b/conf/machine/h3600.conf
@@ -27,7 +27,8 @@ MACHINE_EXTRA_RDEPENDS = "mtd-utils mtd-utils-jffs2"
 
 MACHINE_EXTRA_RRECOMMENDS = ""
 
-EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x40000"
+JFFS2_ERASEBLOCK = "0x40000"
+EXTRA_IMAGECMD_jffs2_append = " ; echo '${IMAGE_NAME}  ${IMAGE_NAME}.rootfs.jffs2 - root' >> ${DEPLOY_DIR_IMAGE}/reflash.ctl"
 
 #
 # Modules autoload and other boot properties
diff --git a/conf/machine/h5000.conf b/conf/machine/h5000.conf
index 2197520..a01393b 100644
--- a/conf/machine/h5000.conf
+++ b/conf/machine/h5000.conf
@@ -13,7 +13,10 @@ MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda wifi usbgadget us
 # Software/packages selection
 #
 PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
-EXTRA_IMAGECMD_jffs2 = "-e 0x40000 -p ; echo '${IMAGE_NAME}  ${IMAGE_NAME}.rootfs.jffs2 - root' >> ${DEPLOY_DIR_IMAGE}/reflash.ctl"
+
+JFFS2_ERASEBLOCK = "0x40000"
+EXTRA_IMAGECMD_jffs2_append = " ; echo '${IMAGE_NAME}  ${IMAGE_NAME}.rootfs.jffs2 - root' >> ${DEPLOY_DIR_IMAGE}/reflash.ctl"
+
 
 # Ship complete set of modules ('kernel-modules') for easier debug purposes 
 MACHINE_EXTRA_RDEPENDS = "kernel ipaq-boot-params"
diff --git a/conf/machine/hx4700.conf b/conf/machine/hx4700.conf
index 0099f8a..3be0628 100644
--- a/conf/machine/hx4700.conf
+++ b/conf/machine/hx4700.conf
@@ -32,11 +32,10 @@ MACHINE_EXTRA_RRECOMMENDS = "\
 	kernel-module-snd-hx4700-audio \
         keymaps"
 
-#write out a reflash.ctl with the appriate entries for the rootfs, the ones for the kernel should already be there
-EXTRA_IMAGECMD_jffs2 = "; sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
-			  -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs-summary.jffs2 \
-			  -e 256KiB -p ; echo '${IMAGE_NAME}  ${IMAGE_NAME}.rootfs.jffs2 - root' >> ${DEPLOY_DIR_IMAGE}/reflash.ctl"
+JFFS2_ERASEBLOCK = "0x40000"
 
+#write out a reflash.ctl with the appriate entries for the rootfs, the ones for the kernel should already be there
+EXTRA_IMAGECMD_jffs2_append = " ; echo '${IMAGE_NAME}  ${IMAGE_NAME}.rootfs.jffs2 - root' >> ${DEPLOY_DIR_IMAGE}/reflash.ctl"
 
 #
 # Modules autoload and other boot properties
diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
index f5d11a5..a84e189 100644
--- a/conf/machine/include/motorola-ezx-base.inc
+++ b/conf/machine/include/motorola-ezx-base.inc
@@ -29,7 +29,8 @@ PREFERRED_PROVIDER_virtual/kernel ?= "openezx-kernel"
 MODUTILS = "26"
 
 IMAGE_FSTYPES ?= "jffs2"
-EXTRA_IMAGECMD_jffs2 = "--pad=14680064 --little-endian --eraseblock=0x20000 -n"
+JFFS2_ERASEBLOCK = "0x20000"
+EXTRA_IMAGECMD_jffs2 = "--pad=14680064 --little-endian --eraseblock=${JFFS2_ERASEBLOCK} -n"
 
 # In order to enable UIBIFS add "uibi and ubifs"
 #IMAGE_FSTYPES += "ubi ubifs"
diff --git a/conf/machine/jornada56x.conf b/conf/machine/jornada56x.conf
index 4a0d2e6..746e1eb 100644
--- a/conf/machine/jornada56x.conf
+++ b/conf/machine/jornada56x.conf
@@ -6,7 +6,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
 PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}depmod:module-init-tools-cross"
 BOOTSTRAP_EXTRA_RDEPENDS = "kernel kernel-modules module-init-tools" 
 
-EXTRA_IMAGECMD_jornada56x_jffs2 = "-e 0x40000 -p"
+JFFS2_ERASEBLOCK = "0x40000"
 
 SERIAL_CONSOLE = "115200 ttySA0"
 
diff --git a/conf/machine/palmtt.conf b/conf/machine/palmtt.conf
index 0965c0e..8db4a66 100644
--- a/conf/machine/palmtt.conf
+++ b/conf/machine/palmtt.conf
@@ -5,6 +5,7 @@
 PREFERRED_PROVIDER_virtual/kernel = "linux-palm-omap1"
 
 SERIAL_CONSOLE ?= "115200 ttyS0"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x40000"
+
+JFFS2_ERASEBLOCK = "0x40000"
 
 require conf/machine/include/tune-arm926ejs.inc
diff --git a/conf/machine/palmz71.conf b/conf/machine/palmz71.conf
index aa820c7..2f39832 100644
--- a/conf/machine/palmz71.conf
+++ b/conf/machine/palmz71.conf
@@ -6,6 +6,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-palm-omap1"
 PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}depmod:module-init-tools-cross"
 
 SERIAL_CONSOLE ?= "115200 ttyS0"
-EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x40000"
+
+JFFS2_ERASEBLOCK = "0x40000"
 
 require conf/machine/include/tune-arm926ejs.inc
diff --git a/conf/machine/simpad.conf b/conf/machine/simpad.conf
index 390c1c6..1e12ec4 100644
--- a/conf/machine/simpad.conf
+++ b/conf/machine/simpad.conf
@@ -2,13 +2,13 @@
 #@NAME: SIEMENS SIMpad SL4, SIEMENS SIMpad CL4, SIEMENS SIMpad SLC, Telekom T-Sinus PAD
 #@DESCRIPTION: Machine configuration for the SA1100 based SIEMENS SIMpad and Telekom T-Sinus PAD devices
 
+require conf/machine/include/tune-strongarm1100.inc
+
 MACHINE_FEATURES = "apm pcmcia irda screen touchscreen vfat"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 
-require conf/machine/include/tune-strongarm1100.inc
-
-EXTRA_IMAGECMD_jffs2 = "--little-endian --eraseblock=0x20000"
+JFFS2_ERASEBLOCK = "0x20000"
 
 SERIAL_CONSOLE = "ttySA0 115200 vt100"
 USE_VT = "0"
-- 
1.8.1.5


