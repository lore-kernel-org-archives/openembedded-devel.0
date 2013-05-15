Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UceCR-0001a2-NG
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 18:05:25 +0200
Received: by mail-da0-f54.google.com with SMTP id z17so1056751dal.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=yv1aSBZYOaCPc7y82kwBQWGaCnBs4MbspPKLxfItUn8=;
	b=WMLs+/NqPPql6iVVbk6Z8UEU3JGprDeuXlepNP8pGr4woRxPdZkBC6dfXzhUwC8K/U
	K8fN7x/5b/Bw36qaX4NaYYCFgfBT2+GRUiz+xiiI2Zo322VlIb20k39MmcqDZP2xb22r
	pXfBe3+HYW7U60xdH8sQGVJf9w1V2/+mgYiBzPtLyzXiLlecXf+RgbFEbsB0elS2gGFI
	Xd28mRTeEDX89FctU4yIK+h90BrQrAxUFIagVazWWyNyWLxtC/y5pC5ao5o5NxZpn8MY
	ciGfFDPocTGCVpY+cDOK56DyOvJzu/4bfulRWCM1YmJPr6ediQTUQLdJ3G2sxtazI0Pu
	wPfA==
X-Received: by 10.68.106.229 with SMTP id gx5mr28476998pbb.95.1368632814204;
	Wed, 15 May 2013 08:46:54 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id gc5sm3256376pbb.19.2013.05.15.08.46.53
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:46:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 08:45:17 -0700
Message-Id: <1368632717-20991-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-gnome][PATCH V2] gnome-bluetooth: Fix build erorrs found with gcc 4.8
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
X-List-Received-Date: Wed, 15 May 2013 16:05:31 -0000

Fix errors like below

| bluetooth-input.c:193:4: error: format '%d' expects argument of type
'int', but argument 5 has type 'XID' [-Werror=format=]
|     g_message ("has mouse: %s (id = %d)", device_info[i].name,
device_info[i].id);
|     ^
| bluetooth-input.c:198:4: error: format '%d' expects argument of type
'int', but argument 5 has type 'XID' [-Werror=format=]
|     g_message ("has keyboard: %s (id = %d)", device_info[i].name,
device_info[i].id);
|     ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-bluetooth-input-Fix-compile-errors.patch  |   37 ++++++++++++++++++++
 .../gnome-bluetooth/gnome-bluetooth_2.32.0.bb      |    2 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-bluetooth-input-Fix-compile-errors.patch

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-bluetooth-input-Fix-compile-errors.patch b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-bluetooth-input-Fix-compile-errors.patch
new file mode 100644
index 0000000..0b0cf8b
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-bluetooth-input-Fix-compile-errors.patch
@@ -0,0 +1,37 @@
+From e3c789d6dca9a8a99b60b86e28d8119c55253c13 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 May 2013 08:37:03 -0700
+Subject: [PATCH] bluetooth-input: Fix compile errors
+
+XID is unsigned long type so %d will error out with -Wformat
+where format warnings are being treated at errors
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Unknown
+---
+ wizard/bluetooth-input.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/wizard/bluetooth-input.c b/wizard/bluetooth-input.c
+index b3fbdaf..d17e67c 100644
+--- a/wizard/bluetooth-input.c
++++ b/wizard/bluetooth-input.c
+@@ -190,12 +190,12 @@ bluetooth_input_check_for_devices (BluetoothInput *input)
+ 		if (bluetooth_input_device_get_type (&device_info[i], &is_mouse, &is_keyboard) == FALSE)
+ 			continue;
+ 		if (is_mouse != FALSE) {
+-			g_message ("has mouse: %s (id = %d)", device_info[i].name, device_info[i].id);
++			g_message ("has mouse: %s (id = %lu)", device_info[i].name, device_info[i].id);
+ 			has_mouse = TRUE;
+ 			//break;
+ 		}
+ 		if (is_keyboard != FALSE) {
+-			g_message ("has keyboard: %s (id = %d)", device_info[i].name, device_info[i].id);
++			g_message ("has keyboard: %s (id = %lu)", device_info[i].name, device_info[i].id);
+ 			has_keyboard = TRUE;
+ 			//break;
+ 		}
+-- 
+1.7.9.5
+
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index a2037cf..00ac3f8 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -11,6 +11,8 @@ DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib lib
 
 inherit gnome
 
+SRC_URI += "file://0001-bluetooth-input-Fix-compile-errors.patch \
+           "
 SRC_URI[archive.md5sum] = "f129686fe46c4c98eb70a0cc85d59cae"
 SRC_URI[archive.sha256sum] = "57b1f06c96a1b85e1c19ff919d708cc38e95edae658881ed99968c325839a973"
 
-- 
1.7.9.5



