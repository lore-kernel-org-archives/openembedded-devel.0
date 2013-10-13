Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 167816CCC9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 21:23:10 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so2936008eae.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 14:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Dyzsdz48S3qMoxlsGnbWgxECuBiBQtb5Wfh1/BUNYW4=;
	b=fJFff3Ul8fw0Tuo4HJhnCU0R7Q6P9X9gigoxkq+OBcyhiDdfnPjzq5Iqhv04/DValP
	ftZXIztIK2gjUvjHNguQC1ZdKps9WacrzA5DuxhAuT0PBRhX+EEFj2xErKfdxBr/Ktst
	LgXMowemH7X7u26bUdD6cpx09oQoJ567+OStaM/0PAYXpEys92d9qs4jaEuYXPwUx1dN
	FsU+RVAwZPj15z9rBA/g1wkQ3IX9dSj1GF6FiNmOiQtzFXgUnYZftYeIfypwawOqu/wL
	l3Zs/oaCrWyet0vVFD86YvLuS8qMVLJV0Q/6oAEf9cmoQQI/T8EFSTKJujOr+ifF6SiJ
	hO1A==
X-Received: by 10.15.33.132 with SMTP id c4mr51049100eev.2.1381699392570;
	Sun, 13 Oct 2013 14:23:12 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	h45sm144895008eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 14:23:12 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 23:23:09 +0200
Message-Id: <1381699389-3601-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] formfactor: add configurations for PALM devices
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
X-List-Received-Date: Sun, 13 Oct 2013 21:23:11 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/palmld/machconfig   | 15 +++++++++++++++
 recipes-bsp/formfactor/files/palmt650/machconfig | 15 +++++++++++++++
 recipes-bsp/formfactor/files/palmt680/machconfig | 15 +++++++++++++++
 recipes-bsp/formfactor/files/palmtc/machconfig   | 15 +++++++++++++++
 recipes-bsp/formfactor/files/palmtt/machconfig   | 15 +++++++++++++++
 recipes-bsp/formfactor/files/palmtt3/machconfig  | 15 +++++++++++++++
 recipes-bsp/formfactor/files/palmtt5/machconfig  | 15 +++++++++++++++
 recipes-bsp/formfactor/files/palmtx/machconfig   | 15 +++++++++++++++
 recipes-bsp/formfactor/files/palmz31/machconfig  | 16 ++++++++++++++++
 recipes-bsp/formfactor/files/palmz71/machconfig  | 15 +++++++++++++++
 recipes-bsp/formfactor/files/palmz72/machconfig  | 15 +++++++++++++++
 11 files changed, 166 insertions(+)
 create mode 100755 recipes-bsp/formfactor/files/palmld/machconfig
 create mode 100755 recipes-bsp/formfactor/files/palmt650/machconfig
 create mode 100755 recipes-bsp/formfactor/files/palmt680/machconfig
 create mode 100755 recipes-bsp/formfactor/files/palmtc/machconfig
 create mode 100755 recipes-bsp/formfactor/files/palmtt/machconfig
 create mode 100755 recipes-bsp/formfactor/files/palmtt3/machconfig
 create mode 100755 recipes-bsp/formfactor/files/palmtt5/machconfig
 create mode 100755 recipes-bsp/formfactor/files/palmtx/machconfig
 create mode 100755 recipes-bsp/formfactor/files/palmz31/machconfig
 create mode 100755 recipes-bsp/formfactor/files/palmz71/machconfig
 create mode 100755 recipes-bsp/formfactor/files/palmz72/machconfig

diff --git a/recipes-bsp/formfactor/files/palmld/machconfig b/recipes-bsp/formfactor/files/palmld/machconfig
new file mode 100755
index 0000000..41ba61f
--- /dev/null
+++ b/recipes-bsp/formfactor/files/palmld/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=1
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=320
+DISPLAY_WIDTH_MM=53
+DISPLAY_HEIGHT_PIXELS=480
+DISPLAY_HEIGHT_MM=80
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=153
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/palmt650/machconfig b/recipes-bsp/formfactor/files/palmt650/machconfig
new file mode 100755
index 0000000..9d02d23
--- /dev/null
+++ b/recipes-bsp/formfactor/files/palmt650/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=324
+DISPLAY_WIDTH_MM=44
+DISPLAY_HEIGHT_PIXELS=324
+DISPLAY_HEIGHT_MM=44
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=185
+DISPLAY_DPI=200
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/palmt680/machconfig b/recipes-bsp/formfactor/files/palmt680/machconfig
new file mode 100755
index 0000000..86febb7
--- /dev/null
+++ b/recipes-bsp/formfactor/files/palmt680/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=324
+DISPLAY_WIDTH_MM=44
+DISPLAY_HEIGHT_PIXELS=324
+DISPLAY_HEIGHT_MM=44
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=186
+DISPLAY_DPI=200
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/palmtc/machconfig b/recipes-bsp/formfactor/files/palmtc/machconfig
new file mode 100755
index 0000000..93dc517
--- /dev/null
+++ b/recipes-bsp/formfactor/files/palmtc/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=320
+DISPLAY_WIDTH_MM=54
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=54
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=149
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/palmtt/machconfig b/recipes-bsp/formfactor/files/palmtt/machconfig
new file mode 100755
index 0000000..93dc517
--- /dev/null
+++ b/recipes-bsp/formfactor/files/palmtt/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=320
+DISPLAY_WIDTH_MM=54
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=54
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=149
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/palmtt3/machconfig b/recipes-bsp/formfactor/files/palmtt3/machconfig
new file mode 100755
index 0000000..051ab6e
--- /dev/null
+++ b/recipes-bsp/formfactor/files/palmtt3/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=1
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=320
+DISPLAY_WIDTH_MM=54
+DISPLAY_HEIGHT_PIXELS=480
+DISPLAY_HEIGHT_MM=81
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=149
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/palmtt5/machconfig b/recipes-bsp/formfactor/files/palmtt5/machconfig
new file mode 100755
index 0000000..051ab6e
--- /dev/null
+++ b/recipes-bsp/formfactor/files/palmtt5/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=1
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=320
+DISPLAY_WIDTH_MM=54
+DISPLAY_HEIGHT_PIXELS=480
+DISPLAY_HEIGHT_MM=81
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=149
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/palmtx/machconfig b/recipes-bsp/formfactor/files/palmtx/machconfig
new file mode 100755
index 0000000..051ab6e
--- /dev/null
+++ b/recipes-bsp/formfactor/files/palmtx/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=1
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=320
+DISPLAY_WIDTH_MM=54
+DISPLAY_HEIGHT_PIXELS=480
+DISPLAY_HEIGHT_MM=81
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=149
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/palmz31/machconfig b/recipes-bsp/formfactor/files/palmz31/machconfig
new file mode 100755
index 0000000..d82ec0d
--- /dev/null
+++ b/recipes-bsp/formfactor/files/palmz31/machconfig
@@ -0,0 +1,16 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=160
+DISPLAY_WIDTH_MM=50
+DISPLAY_HEIGHT_PIXELS=160
+DISPLAY_HEIGHT_MM=50
+# Real DISPLAY_BPP=12
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=80
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/palmz71/machconfig b/recipes-bsp/formfactor/files/palmz71/machconfig
new file mode 100755
index 0000000..93dc517
--- /dev/null
+++ b/recipes-bsp/formfactor/files/palmz71/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=320
+DISPLAY_WIDTH_MM=54
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=54
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=149
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/palmz72/machconfig b/recipes-bsp/formfactor/files/palmz72/machconfig
new file mode 100755
index 0000000..93dc517
--- /dev/null
+++ b/recipes-bsp/formfactor/files/palmz72/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=320
+DISPLAY_WIDTH_MM=54
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=54
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=149
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
-- 
1.8.1.5


