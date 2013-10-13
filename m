Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 90DB56CCC9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 21:55:41 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so3010169eaj.40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 14:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EKbAyMA6A6MNai+MBXeVEDimSf46a/f4GzCZZtODrRQ=;
	b=LnEJbAnUdjbkb5XLTR0emLnuHxoL/Gyabim/MLDV5oLS6OX0x06b59D1qCdwyNxHmO
	W5RjGNL462nfQkdM9H8Q5mqx887zLEUleZWhplWKW4PD0K0XR+D9jybLXbGneqguSTj8
	p2AOEDj+PMDjanGi/WtjJlABO+ovQlMBn20HYpmY+1VrRvB5hXzNLPXSU6htknqyrlVe
	tVbokNGPoW4vIllCaKlBUK7ADqjXdIzzN7JklDk3e6T737h6hyIE1CrsrBzP+qu6EaGI
	JkeK3wMkr+/qIZT0zpznDLkN8rEWLkc2jU3hdoCJ2DPYAvPWstiEZ66BBAJZvMxLbO6E
	C+hQ==
X-Received: by 10.14.184.132 with SMTP id s4mr51307981eem.13.1381701343092;
	Sun, 13 Oct 2013 14:55:43 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	a43sm145216556eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 14:55:42 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 23:55:39 +0200
Message-Id: <1381701339-4532-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] formfactor: standardize the comments about real dpi size
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
X-List-Received-Date: Sun, 13 Oct 2013 21:55:42 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/h1910/machconfig      | 2 +-
 recipes-bsp/formfactor/files/h1940/machconfig      | 2 +-
 recipes-bsp/formfactor/files/h2200/machconfig      | 2 +-
 recipes-bsp/formfactor/files/h4000/machconfig      | 2 +-
 recipes-bsp/formfactor/files/jornada56x/machconfig | 2 +-
 recipes-bsp/formfactor/files/jornada6xx/machconfig | 2 +-
 recipes-bsp/formfactor/files/jornada7xx/machconfig | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-bsp/formfactor/files/h1910/machconfig b/recipes-bsp/formfactor/files/h1910/machconfig
index 7a5e7b3..9fa7472 100755
--- a/recipes-bsp/formfactor/files/h1910/machconfig
+++ b/recipes-bsp/formfactor/files/h1910/machconfig
@@ -10,6 +10,6 @@ DISPLAY_WIDTH_MM=53
 DISPLAY_HEIGHT_PIXELS=320
 DISPLAY_HEIGHT_MM=71
 DISPLAY_BPP=16
-#DISPLAY_DPI=114
+# Real DISPLAY_DPI=114
 DISPLAY_DPI=100
 DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/h1940/machconfig b/recipes-bsp/formfactor/files/h1940/machconfig
index fafe6c9..2276812 100755
--- a/recipes-bsp/formfactor/files/h1940/machconfig
+++ b/recipes-bsp/formfactor/files/h1940/machconfig
@@ -10,6 +10,6 @@ DISPLAY_WIDTH_MM=53
 DISPLAY_HEIGHT_PIXELS=320
 DISPLAY_HEIGHT_MM=71
 DISPLAY_BPP=16
-#DISPLAY_DPI=114
+# Real DISPLAY_DPI=114
 DISPLAY_DPI=100
 DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/h2200/machconfig b/recipes-bsp/formfactor/files/h2200/machconfig
index 7a5e7b3..9fa7472 100755
--- a/recipes-bsp/formfactor/files/h2200/machconfig
+++ b/recipes-bsp/formfactor/files/h2200/machconfig
@@ -10,6 +10,6 @@ DISPLAY_WIDTH_MM=53
 DISPLAY_HEIGHT_PIXELS=320
 DISPLAY_HEIGHT_MM=71
 DISPLAY_BPP=16
-#DISPLAY_DPI=114
+# Real DISPLAY_DPI=114
 DISPLAY_DPI=100
 DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/h4000/machconfig b/recipes-bsp/formfactor/files/h4000/machconfig
index 7a5e7b3..9fa7472 100755
--- a/recipes-bsp/formfactor/files/h4000/machconfig
+++ b/recipes-bsp/formfactor/files/h4000/machconfig
@@ -10,6 +10,6 @@ DISPLAY_WIDTH_MM=53
 DISPLAY_HEIGHT_PIXELS=320
 DISPLAY_HEIGHT_MM=71
 DISPLAY_BPP=16
-#DISPLAY_DPI=114
+# Real DISPLAY_DPI=114
 DISPLAY_DPI=100
 DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/jornada56x/machconfig b/recipes-bsp/formfactor/files/jornada56x/machconfig
index 7a5e7b3..9fa7472 100755
--- a/recipes-bsp/formfactor/files/jornada56x/machconfig
+++ b/recipes-bsp/formfactor/files/jornada56x/machconfig
@@ -10,6 +10,6 @@ DISPLAY_WIDTH_MM=53
 DISPLAY_HEIGHT_PIXELS=320
 DISPLAY_HEIGHT_MM=71
 DISPLAY_BPP=16
-#DISPLAY_DPI=114
+# Real DISPLAY_DPI=114
 DISPLAY_DPI=100
 DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/jornada6xx/machconfig b/recipes-bsp/formfactor/files/jornada6xx/machconfig
index 42156c5..a0f17ff 100755
--- a/recipes-bsp/formfactor/files/jornada6xx/machconfig
+++ b/recipes-bsp/formfactor/files/jornada6xx/machconfig
@@ -10,6 +10,6 @@ DISPLAY_WIDTH_MM=154
 DISPLAY_HEIGHT_PIXELS=240
 DISPLAY_HEIGHT_MM=58
 DISPLAY_BPP=16
-#DISPLAY_DPI=105
+# Real DISPLAY_DPI=105
 DISPLAY_DPI=100
 DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/jornada7xx/machconfig b/recipes-bsp/formfactor/files/jornada7xx/machconfig
index 42156c5..a0f17ff 100755
--- a/recipes-bsp/formfactor/files/jornada7xx/machconfig
+++ b/recipes-bsp/formfactor/files/jornada7xx/machconfig
@@ -10,6 +10,6 @@ DISPLAY_WIDTH_MM=154
 DISPLAY_HEIGHT_PIXELS=240
 DISPLAY_HEIGHT_MM=58
 DISPLAY_BPP=16
-#DISPLAY_DPI=105
+# Real DISPLAY_DPI=105
 DISPLAY_DPI=100
 DISPLAY_SUBPIXEL_ORDER=rgb
-- 
1.8.1.5


