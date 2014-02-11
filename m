Return-Path: <net147@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7E5186E9F8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 07:15:03 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id kp14so7317540pab.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 23:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FxLGQrGJ6hb76CRlu/uLS7CjEg0e8CVV7RccBtrXkNk=;
	b=kDoanbywqvLGXT62C4VNn/qzJhilzSloyi1sOpLrcChbdbeZSUsvkXVZ/H0r8zLEeI
	2+F1NZWc6OU70gfhgkMFB0YN32MuhUzkM7Ar+1ca62n7cHsudKxG/Jhg/IbS/LYSQDBU
	aamsxI5//jaGmom8xH3ft4cr3jtmIvj1EuZOruv/f59J/F9hPGcREsqUyQFVWpXoZEyq
	5oqV3vRdkDSi1zL8HtNQHjvzywNKuCwSHW16Z6ExVtgVngDpesVlo/R4ND8E+Mb20A0R
	BAqCUztjUma7n3n8/PtI1xW/OMxOnD7UQ2UWQ4SchO11huMNxGk/Md/h1wbC4Gm6haDl
	qIvw==
X-Received: by 10.68.66.103 with SMTP id e7mr42326165pbt.120.1392102903660;
	Mon, 10 Feb 2014 23:15:03 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ac5sm49574301pbc.37.2014.02.10.23.15.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Feb 2014 23:15:02 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Feb 2014 18:19:04 +1100
Message-Id: <1392103144-18040-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-oe][PATCH] xf86-input-tslib: fix crash with xserver 1.12 and later
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
X-List-Received-Date: Tue, 11 Feb 2014 07:15:03 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...f86-input-tslib-0.0.6-xf86XInputSetScreen.patch | 31 ++++++++++++++++++++++
 .../xorg-driver/xf86-input-tslib_0.0.6.bb          |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-0.0.6-xf86XInputSetScreen.patch

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-0.0.6-xf86XInputSetScreen.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-0.0.6-xf86XInputSetScreen.patch
new file mode 100644
index 0000000..d16b4a5
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib/xf86-input-tslib-0.0.6-xf86XInputSetScreen.patch
@@ -0,0 +1,31 @@
+Fixes crash when a touchscreen event is received with xserver 1.12 and later:
+X: symbol lookup error: /usr/lib/xorg/modules/input/tslib_drv.so: undefined symbol: xf86XInputSetScreen
+
+Upstream-Status: Pending
+
+Taken from Gentoo:
+https://bugs.gentoo.org/show_bug.cgi?id=446432
+
+diff -ur xf86-input-tslib-0.0.6.orig/src/tslib.c xf86-input-tslib-0.0.6/src/tslib.c
+--- xf86-input-tslib-0.0.6.orig/src/tslib.c	2012-12-05 01:12:16.286597071 +0100
++++ xf86-input-tslib-0.0.6/src/tslib.c	2012-12-05 01:11:02.686598595 +0100
+@@ -75,6 +75,19 @@
+ #define COLLECT_INPUT_OPTIONS(pInfo, options) xf86CollectInputOptions((pInfo), (options))
+ #endif
+ 
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) > 13
++static void
++xf86XInputSetScreen(InputInfoPtr	pInfo,
++		    int			screen_number,
++		    int			x,
++		    int			y)
++{
++    if (miPointerGetScreen(pInfo->dev) !=
++          screenInfo.screens[screen_number]) {
++	miPointerSetScreen(pInfo->dev, screen_number, x, y);
++    }
++}
++#endif
+ 
+ enum { TSLIB_ROTATE_NONE=0, TSLIB_ROTATE_CW=270, TSLIB_ROTATE_UD=180, TSLIB_ROTATE_CCW=90 };
+ 
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
index fab7fab..acc7528 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.pengutronix.de/software/xf86-input-tslib/download/xf86-inp
            file://xserver-174-XGetPointerControl.patch \
            file://99-xf86-input-tslib.rules \
            file://xf86-input-tslib-port-ABI-12-r48.patch \
+           file://xf86-input-tslib-0.0.6-xf86XInputSetScreen.patch \
 "
 
 SRC_URI[md5sum] = "b7a4d2f11637ee3fcf432e044b1d017f"
-- 
1.8.5.3


