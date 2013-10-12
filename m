Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id C0C7C6CF40
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 20:57:34 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so2596575eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 13:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=szzT9+ukB513A31A3zpcPl6q/Zi2HsaqoPa4rvlxLak=;
	b=sC7yjcUBAAfcDBSdz94mVX3F1CcfC7K7ta+RcIRcfD4V+eWcHuAY0eec0A73BaQIEF
	U5GBktyQniCbAjdLdgEocyYbOcXI8X2udVb5JlPFZVhNnAO04S+/Emb0Si/6HqnZLZan
	P6zuGV/fBRsO1i9xMNXrCOjAgp+4SsH+AX9YFOmQOEKJl4yYzmjLVnpxzHr/1JZGVNR9
	78nI2AALCm/34Ck/YVN8KQBuyQnnBnafWlDgG23pzt1FCVEfvYeCCv/o+wTgt29Zub9T
	YsVWCGCUYivN0On2H0FDhGQ4VI7WQ8QyvyQlOgr/JLSluSAXlS4lwJxYcQ/RcB9mtF+I
	bQFg==
X-Received: by 10.14.5.3 with SMTP id 3mr7361304eek.49.1381611456402;
	Sat, 12 Oct 2013 13:57:36 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	r48sm131989092eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 12 Oct 2013 13:57:36 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Oct 2013 22:57:23 +0200
Message-Id: <1381611443-16395-4-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381611443-16395-1-git-send-email-andrea.adami@gmail.com>
References: <1381611443-16395-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 4/4] formfactor: refresh machconfig for Zaurus devices
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
X-List-Received-Date: Sat, 12 Oct 2013 20:57:35 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/akita/machconfig  | 10 +++++-----
 recipes-bsp/formfactor/files/c7x0/machconfig   |  8 ++++----
 recipes-bsp/formfactor/files/collie/machconfig | 10 +++++-----
 recipes-bsp/formfactor/files/poodle/machconfig | 10 +++++-----
 recipes-bsp/formfactor/files/spitz/machconfig  | 10 +++++-----
 recipes-bsp/formfactor/files/tosa/machconfig   |  8 ++++----
 6 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/recipes-bsp/formfactor/files/akita/machconfig b/recipes-bsp/formfactor/files/akita/machconfig
index a9649e0..437974a 100755
--- a/recipes-bsp/formfactor/files/akita/machconfig
+++ b/recipes-bsp/formfactor/files/akita/machconfig
@@ -2,14 +2,14 @@ HAVE_TOUCHSCREEN=1
 HAVE_KEYBOARD=1
 HAVE_KEYBOARD_PORTRAIT=0
 HAVE_KEYBOARD_LANDSCAPE=1
- 
+
 DISPLAY_CAN_ROTATE=1
 DISPLAY_ORIENTATION=270
 DISPLAY_WIDTH_PIXELS=480
 DISPLAY_WIDTH_MM=56
 DISPLAY_HEIGHT_PIXELS=640
-DISPLAY_HEIGHT_MM=74
+DISPLAY_HEIGHT_MM=75
 DISPLAY_BPP=16
-#DISPLAY_DPI=220
-DISPLAY_DPI=150
-DISPLAY_SUBPIXEL_ORDER=rgb
+# Real DISPLAY_DPI=216
+DISPLAY_DPI=200
+DISPLAY_SUBPIXEL_ORDER=vrgb
diff --git a/recipes-bsp/formfactor/files/c7x0/machconfig b/recipes-bsp/formfactor/files/c7x0/machconfig
index ad3620f..b93e2e7 100755
--- a/recipes-bsp/formfactor/files/c7x0/machconfig
+++ b/recipes-bsp/formfactor/files/c7x0/machconfig
@@ -2,14 +2,14 @@ HAVE_TOUCHSCREEN=1
 HAVE_KEYBOARD=1
 HAVE_KEYBOARD_PORTRAIT=0
 HAVE_KEYBOARD_LANDSCAPE=1
- 
+
 DISPLAY_CAN_ROTATE=1
 DISPLAY_ORIENTATION=0
 DISPLAY_WIDTH_PIXELS=640
-DISPLAY_WIDTH_MM=74
+DISPLAY_WIDTH_MM=75
 DISPLAY_HEIGHT_PIXELS=480
 DISPLAY_HEIGHT_MM=56
 DISPLAY_BPP=16
-#DISPLAY_DPI=220
-DISPLAY_DPI=150
+# Real DISPLAY_DPI=216
+DISPLAY_DPI=200
 DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/collie/machconfig b/recipes-bsp/formfactor/files/collie/machconfig
index c5b1aca..f21587a 100755
--- a/recipes-bsp/formfactor/files/collie/machconfig
+++ b/recipes-bsp/formfactor/files/collie/machconfig
@@ -2,14 +2,14 @@ HAVE_TOUCHSCREEN=1
 HAVE_KEYBOARD=1
 HAVE_KEYBOARD_PORTRAIT=1
 HAVE_KEYBOARD_LANDSCAPE=0
- 
+
 DISPLAY_CAN_ROTATE=0
 DISPLAY_ORIENTATION=270
 DISPLAY_WIDTH_PIXELS=240
-DISPLAY_WIDTH_MM=54
+DISPLAY_WIDTH_MM=53
 DISPLAY_HEIGHT_PIXELS=320
 DISPLAY_HEIGHT_MM=71
 DISPLAY_BPP=16
-#DISPLAY_DPI=114
-DISPLAY_DPI=96
-DISPLAY_SUBPIXEL_ORDER=rgb
+# Real DISPLAY_DPI=114
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=vrgb
diff --git a/recipes-bsp/formfactor/files/poodle/machconfig b/recipes-bsp/formfactor/files/poodle/machconfig
index c5b1aca..f21587a 100755
--- a/recipes-bsp/formfactor/files/poodle/machconfig
+++ b/recipes-bsp/formfactor/files/poodle/machconfig
@@ -2,14 +2,14 @@ HAVE_TOUCHSCREEN=1
 HAVE_KEYBOARD=1
 HAVE_KEYBOARD_PORTRAIT=1
 HAVE_KEYBOARD_LANDSCAPE=0
- 
+
 DISPLAY_CAN_ROTATE=0
 DISPLAY_ORIENTATION=270
 DISPLAY_WIDTH_PIXELS=240
-DISPLAY_WIDTH_MM=54
+DISPLAY_WIDTH_MM=53
 DISPLAY_HEIGHT_PIXELS=320
 DISPLAY_HEIGHT_MM=71
 DISPLAY_BPP=16
-#DISPLAY_DPI=114
-DISPLAY_DPI=96
-DISPLAY_SUBPIXEL_ORDER=rgb
+# Real DISPLAY_DPI=114
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=vrgb
diff --git a/recipes-bsp/formfactor/files/spitz/machconfig b/recipes-bsp/formfactor/files/spitz/machconfig
index a9649e0..437974a 100755
--- a/recipes-bsp/formfactor/files/spitz/machconfig
+++ b/recipes-bsp/formfactor/files/spitz/machconfig
@@ -2,14 +2,14 @@ HAVE_TOUCHSCREEN=1
 HAVE_KEYBOARD=1
 HAVE_KEYBOARD_PORTRAIT=0
 HAVE_KEYBOARD_LANDSCAPE=1
- 
+
 DISPLAY_CAN_ROTATE=1
 DISPLAY_ORIENTATION=270
 DISPLAY_WIDTH_PIXELS=480
 DISPLAY_WIDTH_MM=56
 DISPLAY_HEIGHT_PIXELS=640
-DISPLAY_HEIGHT_MM=74
+DISPLAY_HEIGHT_MM=75
 DISPLAY_BPP=16
-#DISPLAY_DPI=220
-DISPLAY_DPI=150
-DISPLAY_SUBPIXEL_ORDER=rgb
+# Real DISPLAY_DPI=216
+DISPLAY_DPI=200
+DISPLAY_SUBPIXEL_ORDER=vrgb
diff --git a/recipes-bsp/formfactor/files/tosa/machconfig b/recipes-bsp/formfactor/files/tosa/machconfig
index a7cf68d..fe47600 100755
--- a/recipes-bsp/formfactor/files/tosa/machconfig
+++ b/recipes-bsp/formfactor/files/tosa/machconfig
@@ -2,14 +2,14 @@ HAVE_TOUCHSCREEN=1
 HAVE_KEYBOARD=1
 HAVE_KEYBOARD_PORTRAIT=1
 HAVE_KEYBOARD_LANDSCAPE=0
- 
+
 DISPLAY_CAN_ROTATE=0
 DISPLAY_ORIENTATION=0
 DISPLAY_WIDTH_PIXELS=480
-DISPLAY_WIDTH_MM=61
+DISPLAY_WIDTH_MM=60
 DISPLAY_HEIGHT_PIXELS=640
 DISPLAY_HEIGHT_MM=80
 DISPLAY_BPP=16
-#DISPLAY_DPI=200
-DISPLAY_DPI=150
+# Real DISPLAY_DPI=200
+DISPLAY_DPI=200
 DISPLAY_SUBPIXEL_ORDER=rgb
-- 
1.8.1.5


