Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 63FBB6AF50
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 16:38:27 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so2843374eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 09:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rjiDpolES8eIhVxI3W4hXp/JBNkb0wpn7EiSIbCQvRw=;
	b=qWbfEZ9Y/LCmO3yarsOAh/VR6XMdVDpw/KV+4dNtxM7RX4mf+0uTWRM4JWcF4QlKCV
	8v76eNk3xkgo4aNrYq7dSzv1FMkbPrElz8o+CleXgyUXSGMbe23BfC/T16OkGZqixPTe
	IqMeQW6JYONkypu6VeoiOY90KSJgzA407zmUzCjJtiXWH5e2p1SA5VLTZvRrbd95Ugrl
	6pEmuUd5uKx1//QtaGp56Ug6xaWPNpVmG8iJDlPRj7eU66m8uXMsAyMR7Bg51wA4kHiO
	M7lYBGkH3j0mMWVwMtqounil8v/pE1afAjmeKoDPnd7tEVHV51ndpAMm45mxMeHGXHsy
	6PpQ==
X-Received: by 10.14.37.4 with SMTP id x4mr49116377eea.16.1381682308951;
	Sun, 13 Oct 2013 09:38:28 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	z12sm142235347eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 09:38:28 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 18:38:25 +0200
Message-Id: <1381682305-4998-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] formfactor: add configurations for Motorola with 2.4" and 2.5" LCD
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
X-List-Received-Date: Sun, 13 Oct 2013 16:38:29 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/a1200/machconfig  | 16 ++++++++++++++++
 recipes-bsp/formfactor/files/a780/machconfig   | 15 +++++++++++++++
 recipes-bsp/formfactor/files/a910/machconfig   | 16 ++++++++++++++++
 recipes-bsp/formfactor/files/e680/machconfig   | 15 +++++++++++++++
 recipes-bsp/formfactor/files/rokre2/machconfig | 16 ++++++++++++++++
 recipes-bsp/formfactor/files/rokre6/machconfig | 16 ++++++++++++++++
 6 files changed, 94 insertions(+)
 create mode 100755 recipes-bsp/formfactor/files/a1200/machconfig
 create mode 100755 recipes-bsp/formfactor/files/a780/machconfig
 create mode 100755 recipes-bsp/formfactor/files/a910/machconfig
 create mode 100755 recipes-bsp/formfactor/files/e680/machconfig
 create mode 100755 recipes-bsp/formfactor/files/rokre2/machconfig
 create mode 100755 recipes-bsp/formfactor/files/rokre6/machconfig

diff --git a/recipes-bsp/formfactor/files/a1200/machconfig b/recipes-bsp/formfactor/files/a1200/machconfig
new file mode 100755
index 0000000..9be6c4d
--- /dev/null
+++ b/recipes-bsp/formfactor/files/a1200/machconfig
@@ -0,0 +1,16 @@
+HAVE_TOUCHSCREEN=0
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=36
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=48
+# Real DISPLAY_BPP=18
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=169
+DISPLAY_DPI=180
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/a780/machconfig b/recipes-bsp/formfactor/files/a780/machconfig
new file mode 100755
index 0000000..8a87fa4
--- /dev/null
+++ b/recipes-bsp/formfactor/files/a780/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=0
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=38
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=50
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=161
+DISPLAY_DPI=180
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/a910/machconfig b/recipes-bsp/formfactor/files/a910/machconfig
new file mode 100755
index 0000000..e416b3c
--- /dev/null
+++ b/recipes-bsp/formfactor/files/a910/machconfig
@@ -0,0 +1,16 @@
+HAVE_TOUCHSCREEN=0
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=38
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=50
+# Real DISPLAY_BPP=18
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=161
+DISPLAY_DPI=180
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/e680/machconfig b/recipes-bsp/formfactor/files/e680/machconfig
new file mode 100755
index 0000000..8a87fa4
--- /dev/null
+++ b/recipes-bsp/formfactor/files/e680/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=0
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=38
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=50
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=161
+DISPLAY_DPI=180
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/rokre2/machconfig b/recipes-bsp/formfactor/files/rokre2/machconfig
new file mode 100755
index 0000000..9be6c4d
--- /dev/null
+++ b/recipes-bsp/formfactor/files/rokre2/machconfig
@@ -0,0 +1,16 @@
+HAVE_TOUCHSCREEN=0
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=36
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=48
+# Real DISPLAY_BPP=18
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=169
+DISPLAY_DPI=180
+DISPLAY_SUBPIXEL_ORDER=rgb
diff --git a/recipes-bsp/formfactor/files/rokre6/machconfig b/recipes-bsp/formfactor/files/rokre6/machconfig
new file mode 100755
index 0000000..9be6c4d
--- /dev/null
+++ b/recipes-bsp/formfactor/files/rokre6/machconfig
@@ -0,0 +1,16 @@
+HAVE_TOUCHSCREEN=0
+HAVE_KEYBOARD=1
+HAVE_KEYBOARD_PORTRAIT=1
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=36
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=48
+# Real DISPLAY_BPP=18
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=169
+DISPLAY_DPI=180
+DISPLAY_SUBPIXEL_ORDER=rgb
-- 
1.8.1.5


