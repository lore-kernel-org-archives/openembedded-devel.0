Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3393E6CF14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 20:57:27 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so2538276eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 13:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5iHgz09RplqllJK2FdQPCvRj4MJVVUDiWBGHRFhOR68=;
	b=jseij9WLME3unQJLhUwHqhi7YNrz5ldwzhlQ3tDfROHtm3qKdiIW6rhgN6QV4VdjXB
	/irNK1fg+0e1zxfG9DdB5lKlLF/l+00s1ATjDZC2SL0ZsnFo2K8VjeB03ziq/zANB3Ah
	RJ6vSACf3FmpPoxO63Bld8ZoJ1muxmVWtRp8Ntr0MD3KvKm5kcaabBX69dwIZExMFUez
	0fuzW7h8HuQR2NKx+6+z3YZlCsCvhMDuC3nnJKDVuxg16vQ1JawiG1LicbP+hMuk1ZAN
	vhO2YZlekfq+YCd2ps240iwdyDFDrRVoKqlwBjLBjFG/gd1my872AmF9CUAAcWpcCZRm
	zlhg==
X-Received: by 10.15.73.130 with SMTP id h2mr6632714eey.56.1381611448489;
	Sat, 12 Oct 2013 13:57:28 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	r48sm131989092eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 12 Oct 2013 13:57:27 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Oct 2013 22:57:20 +0200
Message-Id: <1381611443-16395-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH 1/4] formfactor: add configuration for IPAQ with 3.5" screen
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
X-List-Received-Date: Sat, 12 Oct 2013 20:57:27 -0000

iPAQ
h1900
h2215
hx2100
hx2400
hx2700
h4100

3.5" diagonal
2.1"x2.8" (53x71mm)
Area: 3763 mm
pixels: 240x320

Real display DPI: 114.29, set to 100

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/h1910/machconfig | 15 +++++++++++++++
 recipes-bsp/formfactor/files/h1940/machconfig | 15 +++++++++++++++
 recipes-bsp/formfactor/files/h2200/machconfig | 15 +++++++++++++++
 recipes-bsp/formfactor/files/h4000/machconfig | 15 +++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100755 recipes-bsp/formfactor/files/h1910/machconfig
 create mode 100755 recipes-bsp/formfactor/files/h1940/machconfig
 create mode 100755 recipes-bsp/formfactor/files/h2200/machconfig
 create mode 100755 recipes-bsp/formfactor/files/h4000/machconfig

diff --git a/recipes-bsp/formfactor/files/h1910/machconfig b/recipes-bsp/formfactor/files/h1910/machconfig
new file mode 100755
index 0000000..7a5e7b3
--- /dev/null
+++ b/recipes-bsp/formfactor/files/h1910/machconfig
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
diff --git a/recipes-bsp/formfactor/files/h1940/machconfig b/recipes-bsp/formfactor/files/h1940/machconfig
new file mode 100755
index 0000000..fafe6c9
--- /dev/null
+++ b/recipes-bsp/formfactor/files/h1940/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=270
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=53
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=71
+DISPLAY_BPP=16
+#DISPLAY_DPI=114
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/h2200/machconfig b/recipes-bsp/formfactor/files/h2200/machconfig
new file mode 100755
index 0000000..7a5e7b3
--- /dev/null
+++ b/recipes-bsp/formfactor/files/h2200/machconfig
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
diff --git a/recipes-bsp/formfactor/files/h4000/machconfig b/recipes-bsp/formfactor/files/h4000/machconfig
new file mode 100755
index 0000000..7a5e7b3
--- /dev/null
+++ b/recipes-bsp/formfactor/files/h4000/machconfig
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
-- 
1.8.1.5


