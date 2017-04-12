Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B2F4D77D89
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:13 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d79so8686535wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=umyfTBtVjQeDGXIQn/ZQ6CZHZBEBo+yKM3Zw8IhU2bg=;
	b=hDuQc2r89VR2fy12p2+aG27nMlEa9BOL1pLMMQbrhg3xVfXpQdTQFPWhqrwVkWStpK
	K/QZiM1ebbRvMl+n8THY8JPtnomga08sd/wLxV42FFzckUhnwxDc5s0fOSG7y5Wdkwm6
	Yrv2Z6aALBjS4q1stJl1l61Y89Z4g9n0OlDTbV8RXyw5e2SMOpdp6uQu47x28gZ1pYaf
	KmOkx9BerarUGYU5Y8iIPqKPeJFjykYoIgTWmf+KslJm5pfY5j9PvUfs0gidwhsW7OwT
	cPIk9o5ujVAg9QxQCuaD2owmZEBwhmWEiF7s8EFGcd5WL9OYKS428JjcuCQd2oiNAZde
	ZcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=umyfTBtVjQeDGXIQn/ZQ6CZHZBEBo+yKM3Zw8IhU2bg=;
	b=pX0ftJ7GM/hLe4gTFcm1GZKcv6YnGhXogJVm3r5ecU2GrPrl+KBf8c7He/761xERCV
	fs0tdCUWRUnJBblIT8nh92YwgQB0lQ3JcGf/jya58w7n7thzbS62BhGl2Waia1iUqwKN
	UBJM+xuKWpusJ22ffXcOlWtlgYAJfoP5gzdGfvJnpu3sgxVyMiouplX6NOiNK5194n63
	gEFR3dw0JQrZmEeEN6JX1bK6Oy4YvvwlE6878Eql/Bu3FDdYg7Ofu2pShBfH0ugjTpWg
	KghgvjvSDX22/2cMfDB3F/ExdB48JuUaA3L0Uk9nLkgE22hLmxybiEAGuUfMuEbx++yL
	H4LA==
X-Gm-Message-State: AN3rC/7IYfKifQICXvdhE6z2ltBge64avQUZIL0jLGeAMJl8dyLd+yyk
	fNrHk81UIl0shxJM
X-Received: by 10.28.111.213 with SMTP id c82mr6284481wmi.11.1492027034733;
	Wed, 12 Apr 2017 12:57:14 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:34 +0200
Message-Id: <20170412195638.3243-26-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 25/29] mpv: update 0.15.0 -> 0.24.0
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../mpv/0001-Fix-build-with-HAVE_GL-0.patch        | 39 ++++++++++++++++++++++
 .../mplayer/{mpv_0.15.0.bb => mpv_0.24.0.bb}       | 12 +++----
 2 files changed, 45 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-Fix-build-with-HAVE_GL-0.patch
 rename meta-oe/recipes-multimedia/mplayer/{mpv_0.15.0.bb => mpv_0.24.0.bb} (83%)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0001-Fix-build-with-HAVE_GL-0.patch b/meta-oe/recipes-multimedia/mplayer/mpv/0001-Fix-build-with-HAVE_GL-0.patch
new file mode 100644
index 0000000..ab2b534
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv/0001-Fix-build-with-HAVE_GL-0.patch
@@ -0,0 +1,39 @@
+From 212f6c8206bd4dcc7d8970c5f1632823ae4e783a Mon Sep 17 00:00:00 2001
+From: Michael Forney <mforney@mforney.org>
+Date: Sun, 12 Feb 2017 23:01:21 -0800
+Subject: [PATCH] Fix build with HAVE_GL==0
+
+video/out/opengl/hwdec.h includes video/out/opengl/common.h, which tries
+to include opengl headers.
+
+Upstream-Status: Backport
+---
+ options/options.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/options/options.c b/options/options.c
+index b711156..0bb36ad 100644
+--- a/options/options.c
++++ b/options/options.c
+@@ -40,7 +40,6 @@
+ #include "stream/stream.h"
+ #include "video/csputils.h"
+ #include "video/hwdec.h"
+-#include "video/out/opengl/hwdec.h"
+ #include "video/image_writer.h"
+ #include "sub/osd.h"
+ #include "audio/filter/af.h"
+@@ -53,6 +52,10 @@
+ #include "video/out/drm_common.h"
+ #endif
+ 
++#if HAVE_GL
++#include "video/out/opengl/hwdec.h"
++#endif
++
+ extern const char mp_help_text[];
+ 
+ static void print_version(struct mp_log *log)
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
similarity index 83%
rename from meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
rename to meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
index f51df77..3f46dc1 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
@@ -11,11 +11,13 @@ REQUIRED_DISTRO_FEATURES = "x11"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=91f1cb870c1cc2d31351a4d2595441cb"
 
-SRC_URI = "https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=mpv \
-           http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=waf;subdir=${BPN}-${PV} \
+SRC_URI = " \
+    https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=mpv \
+    http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=waf;subdir=${BPN}-${PV} \
+    file://0001-Fix-build-with-HAVE_GL-0.patch \
 "
-SRC_URI[mpv.md5sum] = "9042bd3fbff2bc8ba0b7fadaa4a22101"
-SRC_URI[mpv.sha256sum] = "7d31217ba8572f364fcea2955733f821374ae6d8c6d8f22f8bc63c44c0400bdc"
+SRC_URI[mpv.md5sum] = "5c85d1163911e49315a5bf1ca1fae13d"
+SRC_URI[mpv.sha256sum] = "a41854fa0ac35b9c309ad692aaee67c8d4495c3546f11cb4cdd0a124195d3f15"
 SRC_URI[waf.md5sum] = "cef4ee82206b1843db082d0b0506bf71"
 SRC_URI[waf.sha256sum] = "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b"
 
@@ -43,8 +45,6 @@ EXTRA_OECONF = " \
     --disable-dvdread \
     --disable-dvdnav \
     --disable-cdda \
-    --disable-enca \
-    --disable-libguess \
     --disable-uchardet \
     --disable-rubberband \
     --disable-lcms2 \
-- 
2.9.3


