Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2079B70392
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 20:42:08 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id f8so2206402wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 13:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Gb0y4ldOWPmqL6dDXl7ykqcbv90irduqiZy1kYRDAQE=;
	b=Ittok7Jh4FTyAz+AfPAyYeLlCkKQ+psbxZFArUUHHAzw4s/FzaETfTi5UQYWUY4WTT
	ZxzAQc3aHxDk0fPnW1CBpSu+YM8TJGvVDlyCOOiE/HJhPhUVyVhOw5qKJlF8b4p+3RXZ
	xLis9nUZG4mQm6+r9kUdMxN0bTWKYDNXqmm6YiW9/mDfTvgDNyKe+NK2fxQfKqoeeSnT
	O/jC1HVOYkhCGNxUgic9ICnPQd4QrnyYjv/8699SQuQtrStcdrCM/R8UrqFFL0heV9Y/
	P4R6xn1j1Ju+W6RRcz3hRic+BymjYDSiFrvKh1M5wJfZqMKn0hwICOyICRe77A4mSwe5
	1DaQ==
X-Received: by 10.194.174.35 with SMTP id bp3mr21039631wjc.33.1405370529518;
	Mon, 14 Jul 2014 13:42:09 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host8-88-dynamic.45-79-r.retail.telecomitalia.it. [79.45.88.8])
	by mx.google.com with ESMTPSA id
	nc19sm35152810wic.4.2014.07.14.13.42.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Jul 2014 13:42:08 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Jul 2014 22:42:04 +0200
Message-Id: <1405370524-30307-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] linux-yocto_3.14: zaurus: config serial 8250 as module
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
X-List-Received-Date: Mon, 14 Jul 2014 20:42:10 -0000

Zaurus is using pxa/sa1100 serial so we only need the
pcmcia serial cs for i.e. bluetooth cf cards.
Avoid device address conflict on pxa (fix pending upstream).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-3.14/akita/defconfig  | 4 ++--
 recipes-kernel/linux/linux-yocto-3.14/c7x0/defconfig   | 4 ++--
 recipes-kernel/linux/linux-yocto-3.14/collie/defconfig | 4 ++--
 recipes-kernel/linux/linux-yocto-3.14/poodle/defconfig | 4 ++--
 recipes-kernel/linux/linux-yocto-3.14/spitz/defconfig  | 4 ++--
 recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig   | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.14/akita/defconfig b/recipes-kernel/linux/linux-yocto-3.14/akita/defconfig
index 8e58216..7d7046a 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/akita/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/akita/defconfig
@@ -242,8 +242,8 @@ CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ADS7846=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_UINPUT=m
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250=m
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
diff --git a/recipes-kernel/linux/linux-yocto-3.14/c7x0/defconfig b/recipes-kernel/linux/linux-yocto-3.14/c7x0/defconfig
index 3a112db..2714fd7 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/c7x0/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/c7x0/defconfig
@@ -223,8 +223,8 @@ CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ADS7846=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_UINPUT=m
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250=m
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
diff --git a/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig b/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig
index 8c84b6c..55cbd91 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig
@@ -226,8 +226,8 @@ CONFIG_KEYBOARD_LOCOMO=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_UINPUT=m
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250=m
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_SA1100=y
 CONFIG_SERIAL_SA1100_CONSOLE=y
diff --git a/recipes-kernel/linux/linux-yocto-3.14/poodle/defconfig b/recipes-kernel/linux/linux-yocto-3.14/poodle/defconfig
index 3e76043..1805246 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/poodle/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/poodle/defconfig
@@ -221,8 +221,8 @@ CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ADS7846=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_UINPUT=m
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250=m
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
diff --git a/recipes-kernel/linux/linux-yocto-3.14/spitz/defconfig b/recipes-kernel/linux/linux-yocto-3.14/spitz/defconfig
index 56db157..bece3f9 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/spitz/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/spitz/defconfig
@@ -241,8 +241,8 @@ CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ADS7846=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_UINPUT=m
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250=m
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
diff --git a/recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig b/recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig
index 799be1f..dc8f2ba 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig
@@ -242,8 +242,8 @@ CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_WM97XX=m
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_UINPUT=m
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250=m
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 CONFIG_SERIAL_8250_CS=m
 CONFIG_SERIAL_PXA=y
 CONFIG_SERIAL_PXA_CONSOLE=y
-- 
1.9.1


