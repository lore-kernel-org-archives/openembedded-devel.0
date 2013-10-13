Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id DBEF26CD18
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 15:38:39 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id k11so2893007eaj.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 08:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6SowWJEX1Jqbh2NTPg+v6qWF3BkGIlG8r5WhWsvkqY4=;
	b=dhI6eme8LuRFrR/ZKviTD2wDYlVIb62zIDe38lK9z2Hv1nGUr+vZ6T8OR0j4DppCgm
	JlWqF25Q7J1GO801zTRKMX0ZwPKnaiAaMHU1/NbdUSxZSE8vmkuKOmeBaKeKReIZE0xl
	gUHo65rNuENTUZmgu80f7QqD5g3iiqJEb6E/U110NllX/kDG5RLzFVl/DpvthujpzhUy
	w5CWnr5KmYfT7jjvvmX92kysHS2zEIu+iKfX0o9WOIsG4HbI7qzC11mKFYDdN+pU6Fy9
	J4f0rwN9kebvtvQuXAllLbdoJk/o7XAdUs0vmgPqARHpKC/PQXI1WurNTAR+V4V/bDTs
	qeVg==
X-Received: by 10.15.64.1 with SMTP id n1mr48789377eex.15.1381678721304;
	Sun, 13 Oct 2013 08:38:41 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	f49sm141673312eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 08:38:40 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 17:38:37 +0200
Message-Id: <1381678717-3975-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] formfactor: add config for jornada 56x, 6xx, 7xx
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
X-List-Received-Date: Sun, 13 Oct 2013 15:38:40 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/jornada56x/machconfig | 15 +++++++++++++++
 recipes-bsp/formfactor/files/jornada6xx/machconfig | 15 +++++++++++++++
 recipes-bsp/formfactor/files/jornada7xx/machconfig | 15 +++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100755 recipes-bsp/formfactor/files/jornada56x/machconfig
 create mode 100755 recipes-bsp/formfactor/files/jornada6xx/machconfig
 create mode 100755 recipes-bsp/formfactor/files/jornada7xx/machconfig

diff --git a/recipes-bsp/formfactor/files/jornada56x/machconfig b/recipes-bsp/formfactor/files/jornada56x/machconfig
new file mode 100755
index 0000000..7a5e7b3
--- /dev/null
+++ b/recipes-bsp/formfactor/files/jornada56x/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=53
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=71
+DISPLAY_BPP=16
+#DISPLAY_DPI=114
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/jornada6xx/machconfig b/recipes-bsp/formfactor/files/jornada6xx/machconfig
new file mode 100755
index 0000000..42156c5
--- /dev/null
+++ b/recipes-bsp/formfactor/files/jornada6xx/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=0
+HAVE_KEYBOARD_LANDSCAPE=1
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=640
+DISPLAY_WIDTH_MM=154
+DISPLAY_HEIGHT_PIXELS=240
+DISPLAY_HEIGHT_MM=58
+DISPLAY_BPP=16
+#DISPLAY_DPI=105
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/jornada7xx/machconfig b/recipes-bsp/formfactor/files/jornada7xx/machconfig
new file mode 100755
index 0000000..42156c5
--- /dev/null
+++ b/recipes-bsp/formfactor/files/jornada7xx/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=0
+HAVE_KEYBOARD_LANDSCAPE=1
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=640
+DISPLAY_WIDTH_MM=154
+DISPLAY_HEIGHT_PIXELS=240
+DISPLAY_HEIGHT_MM=58
+DISPLAY_BPP=16
+#DISPLAY_DPI=105
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
-- 
1.8.1.5


