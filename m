Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9TA-00053y-No
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:46:20 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so871094fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=yau+gDMygv/m18tFBtt4dP+rf8aoJMei5yrFakcCat4=;
	b=M608QKydfDRqoiqgae4ah1yr7BODxX7ZEYMvxSPtBF2F5BtoQyQ5znM0yDlL0gDwJM
	6S3b3dYiqyhXyOj7pwtcWzF4G9OaqFs15zcA4tIdpMTFvv2QCgYrQHu2QDeVVNv1/azH
	fXJOi6hm32PJ51eNXQXjTGNHSsBq3JJPgW44A=
Received: by 10.223.48.208 with SMTP id s16mr503121faf.75.1314891686824;
	Thu, 01 Sep 2011 08:41:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w20sm131006fah.3.2011.09.01.08.41.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:41:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:39:14 +0200
Message-Id: <39dbfa440bf1f63e6729bc143cb8fe3a44d66a94.1314891222.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
References: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314891222.git.Martin.Jansa@gmail.com>
References: <cover.1314891222.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 07/10] conf/machine: unify MACHINE_GUI_CLASS/GUI_MACHINE_CLASS to MACHINE_GUI_CLASS in all configs
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
X-List-Received-Date: Thu, 01 Sep 2011 15:46:21 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/machine/include/zaurus.inc |    2 +-
 conf/machine/palmt650.conf      |    2 +-
 conf/machine/palmt680.conf      |    2 +-
 conf/machine/palmtc.conf        |    2 +-
 conf/machine/palmtt5.conf       |    2 +-
 conf/machine/simpad.conf        |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 6ff1470..416978f 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -52,7 +52,7 @@ KERNEL_IMAGETYPE = "${ZAURUS_KERNEL_IMAGETYPE}"
 XZ_COMPRESSION_LEVEL = "-e -7"
 
 # kernel bootlogo
-LOGO_SIZE = '${@base_conditional("GUI_MACHINE_CLASS", "bigscreen", "vga", "qvga", d)}'
+LOGO_SIZE = '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen", "vga", "qvga", d)}'
 
 ################
 # machine tuning
diff --git a/conf/machine/palmt650.conf b/conf/machine/palmt650.conf
index f81ade3..8deb3e5 100644
--- a/conf/machine/palmt650.conf
+++ b/conf/machine/palmt650.conf
@@ -8,7 +8,7 @@ ROOT_FLASH_SIZE = "100"
 
 SERIAL_CONSOLE = "115200 ttyS1"
 
-GUI_MACHINE_CLASS = "bigscreen"
+MACHINE_GUI_CLASS = "bigscreen"
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-module-snd-pxa2xx-ac97 \
                            kernel-module-pxa27x-keyboard \
diff --git a/conf/machine/palmt680.conf b/conf/machine/palmt680.conf
index b984667..a17aea3 100644
--- a/conf/machine/palmt680.conf
+++ b/conf/machine/palmt680.conf
@@ -8,7 +8,7 @@ ROOT_FLASH_SIZE = "100"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
-GUI_MACHINE_CLASS = "bigscreen"
+MACHINE_GUI_CLASS = "bigscreen"
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-module-pxa27x-keyboard \
                            kernel-module-wm97xx-ts"
diff --git a/conf/machine/palmtc.conf b/conf/machine/palmtc.conf
index 28db830..515ce4c 100644
--- a/conf/machine/palmtc.conf
+++ b/conf/machine/palmtc.conf
@@ -10,5 +10,5 @@ ROOT_FLASH_SIZE = "100"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
-GUI_MACHINE_CLASS = "bigscreen"
+MACHINE_GUI_CLASS = "bigscreen"
 
diff --git a/conf/machine/palmtt5.conf b/conf/machine/palmtt5.conf
index 997c157..fbf225a 100644
--- a/conf/machine/palmtt5.conf
+++ b/conf/machine/palmtt5.conf
@@ -8,7 +8,7 @@ ROOT_FLASH_SIZE = "100"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
-GUI_MACHINE_CLASS = "bigscreen"
+MACHINE_GUI_CLASS = "bigscreen"
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-module-pxa27x-keyboard \
                            kernel-module-wm97xx-ts \
diff --git a/conf/machine/simpad.conf b/conf/machine/simpad.conf
index 6073d33..fbb2c67 100644
--- a/conf/machine/simpad.conf
+++ b/conf/machine/simpad.conf
@@ -14,7 +14,7 @@ require conf/machine/include/tune-strongarm1100.inc
 ROOT_FLASH_SIZE = "16"
 EXTRA_IMAGECMD_jffs2 = "--little-endian --eraseblock=0x20000"
 
-GUI_MACHINE_CLASS = "bigscreen"
+MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "800" 
 MACHINE_DISPLAY_HEIGHT_PIXELS= "600"
 SERIAL_CONSOLE = "ttySA0 115200 vt100"
-- 
1.7.6.1



