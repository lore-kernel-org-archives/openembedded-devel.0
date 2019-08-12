Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 61DB973196
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 12:06:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 466ZMK11qBz28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 14:06:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565611597;
	bh=qqjkmTr5jvy+eZlWWdFiNPO/jxK7WU41ANvEuSlgeeg=;
	h=From:To:Subject:Date:From;
	b=PPrKNEO5jojryv84pQHVds2a8xFibqWZrkjiQgDlN16N3JtioY5dMlYUZYIIhNJro
	pCKy6UyWz3k+SUHFexUluUlHESjqMXt2GVJ+LjEyiGaJOQ7m5EH7mvwjEQFlIiVilH
	UD1Q5VHvEAuv91rmHG+JJcMBazgQ5HPGC+4/bmBqscTgVDwRoEE9cKldTvIA7ttnjU
	9NHkYEN86n2q4wKcGCr29rdF+cAOsynA3tKzrI0Ku7O4kFyTqJqbLDDB5nEDM5sAdA
	33yu44lyyWSNhLZJNZupMtQHZGiAS1uzS0s22+iLSKRhlHJw4sVaYOPNuns1ZGi6HT
	qGQGKTT0OFvVx20449CRzG9F/Uh6PPtz9lxuTx4gnnb6W7k9iELBG1vL9v8VBgJGOX
	HqRKdYSVNk+Uncln3lxS0TMcBe+FkyR5b6J/sxJb+QF8R0fn2SwBnMc7JPQKPv6S3S
	q6BHnCHPPszTjItjxWG2m5jTLDU4efUIsA5uwHuEuka689iWWsN4tGsOioziZDe+Ux
	dV1Hs0NC5XNYFhBfvvNgXJsygFSbceSYAyChtPrt5vjDxMw72o8b9tVC2NySkwG0OB
	+SvOjh6Q3p8AnrVbicK3pe7XAehbCNi00+DfsePnye9AYCOoyEqNinOnIVTUAbS9k0
	6mTpeoaZ31zc5Z/Br9Yy5UX0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Aug 2019 15:06:35 +0300
Message-Id: <20190812120636.22643-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gtkmathview: Remove, abiword was the last user
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
X-List-Received-Date: Mon, 12 Aug 2019 12:06:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
The recipe will be submitted to meta-office.
---
 .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
 ...formatting-for-modern-c-11-compilers.patch | 31 -------
 ...ude-cstdio-to-get-printf-definitions.patch | 28 ------
 ...der-detection-of-hash_map-is-broken-.patch | 63 -------------
 .../0003-gcc-6.0-build-fixes.patch            | 93 -------------------
 .../mml-widget/gtkmathview/use_hostcxx.patch  | 18 ----
 .../mml-widget/gtkmathview_0.8.0.bb           | 28 ------
 7 files changed, 1 insertion(+), 262 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/0001-Fix-formatting-for-modern-c-11-compilers.patch
 delete mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/0001-include-cstdio-to-get-printf-definitions.patch
 delete mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/0002-configure.ac-header-detection-of-hash_map-is-broken-.patch
 delete mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/0003-gcc-6.0-build-fixes.patch
 delete mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/use_hostcxx.patch
 delete mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index f7eafe2e3..6a9592cfa 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -142,7 +142,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
     can-utils libsocketcan tipcutils tiptop \
     tmux uml-utilities upm vlock volume-key wipe zlog zram \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-client", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", " libgxim t1lib gnuplot libwmf gtkmathview", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", " libgxim t1lib gnuplot libwmf", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "bluez", "collectd", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-plugin-ccreds pam-plugin-ldapdb", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam-ssh-agent-auth openwsman sblim-sfcb ", "", d)} \
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/0001-Fix-formatting-for-modern-c-11-compilers.patch b/meta-oe/recipes-extended/mml-widget/gtkmathview/0001-Fix-formatting-for-modern-c-11-compilers.patch
deleted file mode 100644
index 8b0096630..000000000
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview/0001-Fix-formatting-for-modern-c-11-compilers.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 90411a7f5e0e9582e79f0a8ccc1e2f158615e451 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 19 May 2018 23:18:11 -0700
-Subject: [PATCH] Fix formatting for modern c++11 compilers
-
-Fixes
-error: invalid suffix on literal; C++11 requires a space between literal and identifier [-Wreserved-user-defined-literal]
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/backend/svg/SVG_RenderingContext.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/backend/svg/SVG_RenderingContext.cc b/src/backend/svg/SVG_RenderingContext.cc
-index 55d6097..0d50702 100644
---- a/src/backend/svg/SVG_RenderingContext.cc
-+++ b/src/backend/svg/SVG_RenderingContext.cc
-@@ -68,7 +68,7 @@ void
- SVG_RenderingContext::documentStart(const BoundingBox& bbox)
- {
-   beginDocument(bbox);
--  metadata("Created by "PACKAGE" version "VERSION);
-+  metadata("Created by " PACKAGE " version " VERSION);
- }
- 
- void
--- 
-2.17.0
-
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/0001-include-cstdio-to-get-printf-definitions.patch b/meta-oe/recipes-extended/mml-widget/gtkmathview/0001-include-cstdio-to-get-printf-definitions.patch
deleted file mode 100644
index c5814bfe2..000000000
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview/0001-include-cstdio-to-get-printf-definitions.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c92890c5e18bb6ee23bdb14074bacf306dd9428f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 5 May 2015 20:35:01 -0700
-Subject: [PATCH] include cstdio to get printf definitions
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/engine/boxml/BoxMLHOVElement.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/engine/boxml/BoxMLHOVElement.cc b/src/engine/boxml/BoxMLHOVElement.cc
-index 1a2812c..96c9eea 100644
---- a/src/engine/boxml/BoxMLHOVElement.cc
-+++ b/src/engine/boxml/BoxMLHOVElement.cc
-@@ -21,7 +21,7 @@
- // <http://www.gnu.org/licenses/>.
- 
- #include <config.h>
--
-+#include <cstdio>
- #include "BoxMLAttributeSignatures.hh"
- #include "BoxMLHOVElement.hh"
- #include "BoxMLHElement.hh"
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/0002-configure.ac-header-detection-of-hash_map-is-broken-.patch b/meta-oe/recipes-extended/mml-widget/gtkmathview/0002-configure.ac-header-detection-of-hash_map-is-broken-.patch
deleted file mode 100644
index b879d6a51..000000000
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview/0002-configure.ac-header-detection-of-hash_map-is-broken-.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 9c226fbc6a42540cb492fcfcb81ff16fffb086d6 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 30 Aug 2016 23:24:53 +0200
-Subject: [PATCH] configure.ac: header detection of hash_map is broken - pin to
- correct implementation
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac | 31 ++++---------------------------
- 1 file changed, 4 insertions(+), 27 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4f2118e..16c09d5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -252,35 +252,12 @@ AC_SUBST(GTKMATHVIEW_SIZEOF_WCHAR_T, "$ac_cv_sizeof_wchar_t")
- 
- AC_LANG_PUSH(C++)
- 
--AC_CHECK_HEADERS(unordered_map,
--	[
--		AC_DEFINE(GMV_HAVE_UNORDERED_MAP,1,[Define if <unordered_map> is provided])
--		GMV_HAVE_UNORDERED_MAP_CFLAGS=-DGMV_HAVE_UNORDERED_MAP=1
--	],
--	[
--		GMV_HAVE_UNORDERED_MAP_CFLAGS=
--	]
--)
-+GMV_HAVE_UNORDERED_MAP_CFLAGS=
- AC_SUBST(GMV_HAVE_UNORDERED_MAP_CFLAGS)
--AC_CHECK_HEADERS(hash_map,
--	[
--		AC_DEFINE(GMV_HAVE_HASH_MAP,1,[Define if <hash_map> is provided])
--		GMV_HAVE_HASH_MAP_CFLAGS=-DGMV_HAVE_HASH_MAP=1
--	],
--	[
--		GMV_HAVE_HASH_MAP_CFLAGS=
--	]
--)
-+GMV_HAVE_HASH_MAP_CFLAGS=
- AC_SUBST(GMV_HAVE_HASH_MAP_CFLAGS)
--AC_CHECK_HEADERS(ext/hash_map,
--	[
--		AC_DEFINE(GMV_HAVE_EXT_HASH_MAP,1,[Define if <ext/hash_map> is provided])
--		GMV_HAVE_EXT_HASH_MAP_CFLAGS=-DGMV_HAVE_EXT_HASH_MAP=1
--	],
--	[
--		GMV_HAVE_EXT_HASH_MAP_CFLAGS=
--	]
--)
-+AC_DEFINE(GMV_HAVE_EXT_HASH_MAP,1,[Define if <ext/hash_map> is provided])
-+GMV_HAVE_EXT_HASH_MAP_CFLAGS=-DGMV_HAVE_EXT_HASH_MAP=1
- AC_SUBST(GMV_HAVE_EXT_HASH_MAP_CFLAGS)
- 
- AC_MSG_CHECKING([whether the C++ compiler supports the standard character traits])
--- 
-2.5.5
-
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/0003-gcc-6.0-build-fixes.patch b/meta-oe/recipes-extended/mml-widget/gtkmathview/0003-gcc-6.0-build-fixes.patch
deleted file mode 100644
index 356274d17..000000000
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview/0003-gcc-6.0-build-fixes.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From: Gert Wollny <gw.fossdev@gmail.com>
-Date: Sun, 26 Jun 2016 13:25:00 +0200
-Description: gcc 6.0 build fixes
-Bug: https://bugs.debian.org/811682
-
-Slightly adapted to our environment
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---- a/src/engine/common/View.cc
-+++ b/src/engine/common/View.cc
-@@ -291,7 +291,7 @@
- 	  }
-     }
- 
--  return false;
-+  return SmartPtr<Element>();
- }
- 
- bool
---- a/src/backend/common/tfm/TFM.hh
-+++ b/src/backend/common/tfm/TFM.hh
-@@ -37,7 +37,7 @@
-     unsigned char face;
-     const char* codingScheme;
-     int designSize;
--    int checksum;
-+    unsigned int checksum;
-     unsigned int nDimensions;
-     unsigned int nCharacters;
-   };
-@@ -52,7 +52,7 @@
-   struct Kerning
-   {
-     UChar8 index;
--    int value;
-+    unsigned int value;
-   };
- 
-   struct Ligature
-@@ -67,7 +67,7 @@
-     UChar8 index;
-     int width;
-     int height;
--    int depth;
-+    unsigned int depth;
-     int italicCorrection;
-     unsigned char nKernings;
-     const Kerning* kerning;
---- a/src/backend/common/StandardSymbolsShaper.hh
-+++ b/src/backend/common/StandardSymbolsShaper.hh
-@@ -32,20 +32,20 @@
-   struct HStretchyChar
-   {
-     Char16 ch;
--    Char8 normal;
--    Char8 left;
--    Char8 glue;
--    Char8 right;
-+    UChar8 normal;
-+    UChar8 left;
-+    UChar8 glue;
-+    UChar8 right;
-   };
-   
-   struct VStretchyChar
-   {
-     Char16 ch;
--    Char8 normal;
--    Char8 top;
--    Char8 glue;
--    Char8 middle;
--    Char8 bottom;
-+    UChar8 normal;
-+    UChar8 top;
-+    UChar8 glue;
-+    UChar8 middle;
-+    UChar8 bottom;
-   };
- 
- protected:
---- a/src/backend/common/StandardSymbolsShaper.cc
-+++ b/src/backend/common/StandardSymbolsShaper.cc
-@@ -29,7 +29,7 @@
- #include "ShapingContext.hh"
- 
- struct GlyphMap {
--  Char8 index;
-+  UChar8 index;
-   Char16 ch;
- };
- 
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/use_hostcxx.patch b/meta-oe/recipes-extended/mml-widget/gtkmathview/use_hostcxx.patch
deleted file mode 100644
index 3fe632860..000000000
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview/use_hostcxx.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Use build_cc to compile the programs to run on build host
-helps with cross compiling
-
-Upstream-Status: Inappropriate [Cross-compiled OE specific]
-
-diff --git a/src/common/mathvariants/Makefile.am b/src/common/mathvariants/Makefile.am
-index 636ccf0..ed9921d 100644
---- a/src/common/mathvariants/Makefile.am
-+++ b/src/common/mathvariants/Makefile.am
-@@ -52,7 +52,7 @@ XSLTPROC = xsltproc
- %.cc : %_gen.cc $(srcdir)/variant.top $(srcdir)/variant.bot
- 	cat $(srcdir)/variant.top >$@
- 	$(XSLTPROC) --novalid --param temp "false()" $(srcdir)/extract.xsl $(<:%_gen.cc=$(srcdir)/xml/%.xml) >>$@
--	$(CXX) -o $(@:%.cc=%) -I$(top_builddir)/auto $<
-+	$(BUILD_CXX) -o $(@:%.cc=%) -I$(top_builddir)/auto $<
- 	echo "Char32 " >>$@
- 	basename map_variant_$@ .cc | tr "-" "_" >>$@
- 	echo "(Char32 ch)" >>$@
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
deleted file mode 100644
index 9ee9e3035..000000000
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-HOMEPAGE = "http://helm.cs.unibo.it/mml-widget/"
-DEPENDS = "t1lib gtk+ popt libxslt-native libxml2"
-
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-
-PR = "r3"
-SRCREV = "0bc2cfa0a47aed2c8a63abd989cb8da4dcceb2ec"
-PV = "0.8.0+git${SRCPV}"
-
-SRC_URI = "git://github.com/GNOME/gtkmathview.git \
-    file://use_hostcxx.patch \
-    file://0001-include-cstdio-to-get-printf-definitions.patch \
-    file://0002-configure.ac-header-detection-of-hash_map-is-broken-.patch \
-    file://0003-gcc-6.0-build-fixes.patch \
-    file://0001-Fix-formatting-for-modern-c-11-compilers.patch \
-"
-
-S = "${WORKDIR}/git"
-
-inherit distro_features_check autotools pkgconfig
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-do_configure_append() {
-    # avoid host polution inf pkg-config files
-    sed -i "s:${STAGING_DIR_HOST}::g" `find -name '*.pc'`
-}
-- 
2.17.1


