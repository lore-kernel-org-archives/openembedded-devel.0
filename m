Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id AE5D56CF14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 20:57:29 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so2613766eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 13:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5SRPXj0PhZMkHN/x5pbupTOlsFaBxKAyDvPQYtIWESI=;
	b=ltg1JgeA/5VGqeSs2D9bzMARaXUo9wJJodwfCAeUBg5HMFWgNxlZ4MzSPxF5YXPxA4
	hdhwy9eCRN37ERBsYGXWPzdSuWcT0nO57VW+UAU8rS3inHI1Ie8iaWgo7HXIkFoIixWz
	Q/z0rGRqq7Si3xyKCkO/k+ABRsWM4yaEJVskJBDBljWeZunm9sXHC36GVf2s4I/funhS
	hKr4gxVijZbbLGgnC1mjSRKVCu4kpkRhnxvjY4EQK1ZByOBgYfgE1bsfIg5xRmQFiYlg
	TYTN1wq1iXChrRy/EjtIJ6wFyfWsCrX4RLazz68bEfav5K7+EDMXouOYXS4RMZ9fI9sR
	UVig==
X-Received: by 10.14.5.3 with SMTP id 3mr7360710eek.49.1381611451140;
	Sat, 12 Oct 2013 13:57:31 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	r48sm131989092eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 12 Oct 2013 13:57:30 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Oct 2013 22:57:21 +0200
Message-Id: <1381611443-16395-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381611443-16395-1-git-send-email-andrea.adami@gmail.com>
References: <1381611443-16395-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/4] formfactor: add configuration for IPAQ with 3.8" screen
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
X-List-Received-Date: Sat, 12 Oct 2013 20:57:30 -0000

IPAQ
h3600
h3700
h3800
h3900
h5100
h5400
h5500
Aero 1500

3.8" diagonal
2.25"x3" (57x76 mm)
Area: 4332 mm2
pixels: 240x320

Real display DPI: 105.26 set to 100

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/h3600/machconfig | 15 +++++++++++++++
 recipes-bsp/formfactor/files/h3800/machconfig | 15 +++++++++++++++
 recipes-bsp/formfactor/files/h3900/machconfig | 15 +++++++++++++++
 recipes-bsp/formfactor/files/h5000/machconfig | 15 +++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100755 recipes-bsp/formfactor/files/h3600/machconfig
 create mode 100755 recipes-bsp/formfactor/files/h3800/machconfig
 create mode 100755 recipes-bsp/formfactor/files/h3900/machconfig
 create mode 100755 recipes-bsp/formfactor/files/h5000/machconfig

diff --git a/recipes-bsp/formfactor/files/h3600/machconfig b/recipes-bsp/formfactor/files/h3600/machconfig
new file mode 100755
index 0000000..8cdb2d0
--- /dev/null
+++ b/recipes-bsp/formfactor/files/h3600/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=270
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=57
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=76
+DISPLAY_BPP=12
+# Real DISPLAY_DPI=105
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=vrgb
diff --git a/recipes-bsp/formfactor/files/h3800/machconfig b/recipes-bsp/formfactor/files/h3800/machconfig
new file mode 100755
index 0000000..d9e59b6
--- /dev/null
+++ b/recipes-bsp/formfactor/files/h3800/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=90
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=57
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=76
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=105
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=vrgb
diff --git a/recipes-bsp/formfactor/files/h3900/machconfig b/recipes-bsp/formfactor/files/h3900/machconfig
new file mode 100755
index 0000000..45d6c54
--- /dev/null
+++ b/recipes-bsp/formfactor/files/h3900/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=270
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=57
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=76
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=105
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=vrgb
diff --git a/recipes-bsp/formfactor/files/h5000/machconfig b/recipes-bsp/formfactor/files/h5000/machconfig
new file mode 100755
index 0000000..dab76db
--- /dev/null
+++ b/recipes-bsp/formfactor/files/h5000/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=57
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=76
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=105
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
-- 
1.8.1.5


