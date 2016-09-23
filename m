Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B5E2860268
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 11:47:18 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 133so2386970wmq.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 04:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ddUKTIKKiilIh2NGZWgxxfD1Qj0su775wxpMMeREVKI=;
	b=c8Njpu+2gDm91iqaCStutCod8n7Yw0DkNlNZ5OLcYfPT45muzkoexmxm+ZZE86t0Kl
	7iUBTZCSg6Xt9YlT8ynlNmMovjZBPVvC+YCAFXWgPOjFOBZ7n8Ftvw8lSouJ6/DPyys4
	kVnCCr45k+NxM5y3DcckpwsLBxU2I/za7v2NkYXJixjLpzjlf1Btggfkuy/DDG++NfM8
	Q1Vp2ItAR121qtUdTxHEO1YmbdV4IwbbMT7DoMoYAfjbh0HYfvMj4FRxNq7Zgopytr9Z
	C62+5S93j2de2U3qr159ejvjloHHE9qx6ySDG8k4hSeuDap//on3YRvb2bmXeewHWC7e
	2FpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ddUKTIKKiilIh2NGZWgxxfD1Qj0su775wxpMMeREVKI=;
	b=B6EJ7aLHwP6kC0PTyoTHOIK91T0a6sSAAUqsyOhXB0NyeZ38MOwHJitGeGJePdgAjH
	IfR6uX7B/MLXWJeiZ+nE9FZzwEG5tadLLCRUwQbZhymyvTEdpYXALFJH4uGkpYwpC20w
	OHjFvd7tDoPT5nwRqJKv9RZI0CznOu9l9a6cO2AU2r93kj97+7ITPXba9papZITL0Jzi
	spUmxizi6GS9u2Gurzcp2tFqlN7lNrBNOn2Ha299wrGIlvcdo2gSLR1mPUrmIW78zcDx
	fOn8OT4T11JYQVY9TfYIroI00zDyzJCWfMjcezRyoQxygVL5gzMfoXDHjgeaDwcHZfFe
	1O2Q==
X-Gm-Message-State: AE9vXwP4xTAyadWIh24/lpf6iYKykstF3kYwBV3qt4LLXK3PuVIX3RchISMyjZOpS/GSCA==
X-Received: by 10.194.100.199 with SMTP id fa7mr7581230wjb.16.1474631239615;
	Fri, 23 Sep 2016 04:47:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	w138sm3433461wmd.1.2016.09.23.04.47.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 04:47:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Sep 2016 13:44:27 +0200
Message-Id: <20160923114427.25293-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
Subject: [meta-gnome][PATCH] gthumb, libgnomekbd, gnome-desktop: add dependency on intltool-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Sep 2016 11:47:19 -0000

* fixes:
WARNING: gnome-desktop-2.32.1-r6 do_configure: Missing DEPENDS on intltool-native
WARNING: libgnomekbd-2.32.0-r0 do_configure: Missing DEPENDS on intltool-native
WARNING: gthumb-2.12.4-r4 do_configure: Missing DEPENDS on intltool-native

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb | 2 +-
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb               | 2 +-
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
index d5f6035..c1a47e0 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
@@ -12,7 +12,7 @@ SRC_URI[archive.md5sum] = "5c80d628a240eb9d9ff78913b31f2f67"
 SRC_URI[archive.sha256sum] = "55cbecf67efe1fa1e57ac966520a7c46d799c8ba3c652a1219f60cafccb3739d"
 GNOME_COMPRESS_TYPE="bz2"
 
-DEPENDS += "gconf libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils startup-notification"
+DEPENDS += "gconf libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils startup-notification intltool-native"
 
 EXTRA_OECONF = "--disable-scrollkeeper --disable-desktop-docs --disable-gnome-about"
 
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
index b346c7a..5eee7f0 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "gThumb is an image viewer and browser for the GNOME Desktop"
 SECTION = "x11/gnome"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base"
+DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base intltool-native"
 
 PR = "r4"
 
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
index 969df3b..f357657 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
 
 SECTION = "x11/gnome/libs"
 
-DEPENDS = "gconf gtk+ glib-2.0 libxklavier"
+DEPENDS = "gconf gtk+ glib-2.0 libxklavier intltool-native"
 
 inherit gnome
 
-- 
2.10.0


