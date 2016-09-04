Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4775A77255
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Sep 2016 20:15:38 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l65so2657840wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Sep 2016 13:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=z2ckGZsA2e5aB4wCIWQYkK0Knueo3wHimz4yY/hVc38=;
	b=twAhn9Q4aq0XuNpVB5tHSfpzIqofo7YM9z0oR8k08cx8JiHu/ZApP7/DfWxddunfbL
	hitxogyyI9IlPs2BMz/1RlS9UZdf6e7tYWDxki3x+Svjip/lmwJ+bnX5V0lBa/c6Yv/6
	JKLUgfjF1XoeM0E4ropUiYoumDhlZljHwhA7nAHF30ttNMTtE7vTQsD6O8XnIJmNEIBe
	KU0kgbmb2mZabDz/Qx8lgkWcHtzLrI672B4Ji7h2D4UyeE6eXO7ZBesiA55nxrHTp1sB
	XbaIx6Dj27i3JqJCeXBFChaRavm9QsyJwUm/efejKuSJrREfLkQJ11GuxxHb3JVc24LL
	cqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=z2ckGZsA2e5aB4wCIWQYkK0Knueo3wHimz4yY/hVc38=;
	b=kLz7AnPxViaZSzJub/P1iPphuhnJbKnCPZCYrQvHfyLlRlgxYT6LvsDQFJWc5Q0PGE
	3eEww1yuf66seVeelQ4aWFt3YEo1Fn9eeq19Jpn0G6oCIftdGaIV4fOc+L1gB82I4mhu
	XAN837kgsNdKl5oTIB5PxZbv1uLqMCvbNipOmdFIky1V/dcMpN6pi9AAwcr/Uz0KyhIC
	BuJoVwLciYO8HsZbD5hlF9VBztP1J8NK/oxeYCZ9if0vx4gsdq/4gHKgOwyH3DnJvhZO
	5AHPEYrshYvmxMdsytBtI5YIWvVkoidkuzgz98y7dUX24VxKOeIEP8pZa+9Vo6pLVRMh
	9mjg==
X-Gm-Message-State: AE9vXwNaBRGOa299VeqtlRf5yqjYUMHALlDv23bmria5xSOI9gEBdfAaBLPFVU7/bsEgPA==
X-Received: by 10.28.166.140 with SMTP id p134mr11630969wme.21.1473020138231; 
	Sun, 04 Sep 2016 13:15:38 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3967.dip0.t-ipconnect.de.
	[91.10.57.103]) by smtp.googlemail.com with ESMTPSA id
	v137sm10708151wmf.3.2016.09.04.13.15.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Sep 2016 13:15:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Sep 2016 22:15:11 +0200
Message-Id: <1473020112-25797-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
References: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] gtkmathview: unbreak gcc-6 build and unblacklist
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
X-List-Received-Date: Sun, 04 Sep 2016 20:15:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...c-header-detection-of-hash_map-is-broken-.patch | 63 +++++++++++++++
 .../gtkmathview/0003-gcc-6.0-build-fixes.patch     | 93 ++++++++++++++++++++++
 .../mml-widget/gtkmathview_0.8.0.bb                |  5 +-
 3 files changed, 158 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/0002-configure.ac-header-detection-of-hash_map-is-broken-.patch
 create mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/0003-gcc-6.0-build-fixes.patch

diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/0002-configure.ac-header-detection-of-hash_map-is-broken-.patch b/meta-oe/recipes-extended/mml-widget/gtkmathview/0002-configure.ac-header-detection-of-hash_map-is-broken-.patch
new file mode 100644
index 0000000..b879d6a
--- /dev/null
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview/0002-configure.ac-header-detection-of-hash_map-is-broken-.patch
@@ -0,0 +1,63 @@
+From 9c226fbc6a42540cb492fcfcb81ff16fffb086d6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 30 Aug 2016 23:24:53 +0200
+Subject: [PATCH] configure.ac: header detection of hash_map is broken - pin to
+ correct implementation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac | 31 ++++---------------------------
+ 1 file changed, 4 insertions(+), 27 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4f2118e..16c09d5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -252,35 +252,12 @@ AC_SUBST(GTKMATHVIEW_SIZEOF_WCHAR_T, "$ac_cv_sizeof_wchar_t")
+ 
+ AC_LANG_PUSH(C++)
+ 
+-AC_CHECK_HEADERS(unordered_map,
+-	[
+-		AC_DEFINE(GMV_HAVE_UNORDERED_MAP,1,[Define if <unordered_map> is provided])
+-		GMV_HAVE_UNORDERED_MAP_CFLAGS=-DGMV_HAVE_UNORDERED_MAP=1
+-	],
+-	[
+-		GMV_HAVE_UNORDERED_MAP_CFLAGS=
+-	]
+-)
++GMV_HAVE_UNORDERED_MAP_CFLAGS=
+ AC_SUBST(GMV_HAVE_UNORDERED_MAP_CFLAGS)
+-AC_CHECK_HEADERS(hash_map,
+-	[
+-		AC_DEFINE(GMV_HAVE_HASH_MAP,1,[Define if <hash_map> is provided])
+-		GMV_HAVE_HASH_MAP_CFLAGS=-DGMV_HAVE_HASH_MAP=1
+-	],
+-	[
+-		GMV_HAVE_HASH_MAP_CFLAGS=
+-	]
+-)
++GMV_HAVE_HASH_MAP_CFLAGS=
+ AC_SUBST(GMV_HAVE_HASH_MAP_CFLAGS)
+-AC_CHECK_HEADERS(ext/hash_map,
+-	[
+-		AC_DEFINE(GMV_HAVE_EXT_HASH_MAP,1,[Define if <ext/hash_map> is provided])
+-		GMV_HAVE_EXT_HASH_MAP_CFLAGS=-DGMV_HAVE_EXT_HASH_MAP=1
+-	],
+-	[
+-		GMV_HAVE_EXT_HASH_MAP_CFLAGS=
+-	]
+-)
++AC_DEFINE(GMV_HAVE_EXT_HASH_MAP,1,[Define if <ext/hash_map> is provided])
++GMV_HAVE_EXT_HASH_MAP_CFLAGS=-DGMV_HAVE_EXT_HASH_MAP=1
+ AC_SUBST(GMV_HAVE_EXT_HASH_MAP_CFLAGS)
+ 
+ AC_MSG_CHECKING([whether the C++ compiler supports the standard character traits])
+-- 
+2.5.5
+
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/0003-gcc-6.0-build-fixes.patch b/meta-oe/recipes-extended/mml-widget/gtkmathview/0003-gcc-6.0-build-fixes.patch
new file mode 100644
index 0000000..356274d
--- /dev/null
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview/0003-gcc-6.0-build-fixes.patch
@@ -0,0 +1,93 @@
+From: Gert Wollny <gw.fossdev@gmail.com>
+Date: Sun, 26 Jun 2016 13:25:00 +0200
+Description: gcc 6.0 build fixes
+Bug: https://bugs.debian.org/811682
+
+Slightly adapted to our environment
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+--- a/src/engine/common/View.cc
++++ b/src/engine/common/View.cc
+@@ -291,7 +291,7 @@
+ 	  }
+     }
+ 
+-  return false;
++  return SmartPtr<Element>();
+ }
+ 
+ bool
+--- a/src/backend/common/tfm/TFM.hh
++++ b/src/backend/common/tfm/TFM.hh
+@@ -37,7 +37,7 @@
+     unsigned char face;
+     const char* codingScheme;
+     int designSize;
+-    int checksum;
++    unsigned int checksum;
+     unsigned int nDimensions;
+     unsigned int nCharacters;
+   };
+@@ -52,7 +52,7 @@
+   struct Kerning
+   {
+     UChar8 index;
+-    int value;
++    unsigned int value;
+   };
+ 
+   struct Ligature
+@@ -67,7 +67,7 @@
+     UChar8 index;
+     int width;
+     int height;
+-    int depth;
++    unsigned int depth;
+     int italicCorrection;
+     unsigned char nKernings;
+     const Kerning* kerning;
+--- a/src/backend/common/StandardSymbolsShaper.hh
++++ b/src/backend/common/StandardSymbolsShaper.hh
+@@ -32,20 +32,20 @@
+   struct HStretchyChar
+   {
+     Char16 ch;
+-    Char8 normal;
+-    Char8 left;
+-    Char8 glue;
+-    Char8 right;
++    UChar8 normal;
++    UChar8 left;
++    UChar8 glue;
++    UChar8 right;
+   };
+   
+   struct VStretchyChar
+   {
+     Char16 ch;
+-    Char8 normal;
+-    Char8 top;
+-    Char8 glue;
+-    Char8 middle;
+-    Char8 bottom;
++    UChar8 normal;
++    UChar8 top;
++    UChar8 glue;
++    UChar8 middle;
++    UChar8 bottom;
+   };
+ 
+ protected:
+--- a/src/backend/common/StandardSymbolsShaper.cc
++++ b/src/backend/common/StandardSymbolsShaper.cc
+@@ -29,7 +29,7 @@
+ #include "ShapingContext.hh"
+ 
+ struct GlyphMap {
+-  Char8 index;
++  UChar8 index;
+   Char16 ch;
+ };
+ 
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index cce3528..c693639 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -11,6 +11,8 @@ PV = "0.8.0+git${SRCPV}"
 SRC_URI = "git://github.com/GNOME/gtkmathview.git \
     file://use_hostcxx.patch \
     file://0001-include-cstdio-to-get-printf-definitions.patch \
+    file://0002-configure.ac-header-detection-of-hash_map-is-broken-.patch \
+    file://0003-gcc-6.0-build-fixes.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -21,6 +23,3 @@ do_configure_append() {
     # avoid host polution inf pkg-config files
     sed -i "s:${STAGING_DIR_HOST}::g" `find -name '*.pc'`
 }
-
-# http://errors.yoctoproject.org/Errors/Details/68615/
-PNBLACKLIST[gtkmathview] ?= "BROKEN: fails to build with gcc-6"
-- 
2.5.5


