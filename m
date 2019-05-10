Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0617E09C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYg14m7z7k
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489319;
	bh=joomT3xwVUOkL6brbD0XWWE3eEDl+/txLsJvjt61kvg=;
	h=From:To:Subject:Date:From;
	b=PBsuol6mEqXV40er++wJElBVMp5rxr3jHpjsHqmxon5toea6mN/nm1MqcBkJNOrzh
	iB+P6vKkuzn5zkEcLvh+gCTsLM+cuj2D5YFtEEdcit3s7oX7gjM6u3cRHXD0cbbEg1
	Eybv4s4Jnm5PXyYPGcSUre9Za5n0MPqH12emHouo7HT5xCGC87Qkzc9cC9CCZOfk3Y
	rVz6l11TIi9BEu92HZY2pUDojL4eqpA37RlP5I4pGOcjmY+MpiHd7khMOCz0u4x/vN
	UATuu4/1ZGM1bG42W2ZuC9f/ycAXfNRyB5IJWC81Q6hh8l+C7WJD33Xs50TbBDjunA
	O3TP/Op5cw3bXlhQL86AYogVmEN+Hqgz8jBUQmdJA5g+eVNuX0cGbeerULUE4Vstbf
	gfvjxkX4pF5/ooIpxfj+AIFkegGranZF4Fw7cKChG9ZTPDdqjDubt8cW1FyLZkI6VU
	uapBmreAj9lbKIIDmUFABHJ72K5nieu/hlsUewAOOoh/GR7qehRF1tMWmBaZ2QOQXP
	n6EExZlkIOje4R8d5hd+27EZZ6f1Sumx/ZF9eW6F58fTgJdkAwveBm26KRqUYq2/co
	8DjuObmjZG+tNtiYE3Bzrn2RMSAWU+LWHJL2fzHTYr2Y0dDWjIfX5wTZbw52YPEyQw
	Y7p3kSTe/Kq06sZ3v9ncl6/M=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:05 +0300
Message-Id: <20190510115515.19491-9-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] fvwm: Upgrade 2.6.7 -> 2.6.8
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
X-List-Received-Date: Fri, 10 May 2019 11:55:18 -0000

Remove patches applied upstream.
pkg-config is now used when checking for freetype.
The licence did not change by the changes to COPYING.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...1-Fix-compilation-for-disabled-gnome.patch | 17 +-----------
 .../fvwm/0002-Avoid-absolute-symlinks.patch   | 27 -------------------
 .../fvwm/{fvwm_2.6.7.bb => fvwm_2.6.8.bb}     |  8 +++---
 3 files changed, 4 insertions(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/fvwm/fvwm/0002-Avoid-absolute-symlinks.patch
 rename meta-oe/recipes-graphics/fvwm/{fvwm_2.6.7.bb => fvwm_2.6.8.bb} (91%)

diff --git a/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch b/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
index 5a7647455..e81d395b9 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
+++ b/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
@@ -27,22 +27,7 @@ diff --git a/configure.ac b/configure.ac
 index 48ce264..fab7b44 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1413,23 +1413,7 @@ else
-   problem_gdkimlib=": Failed on gdk-imlib, see config.log"
- fi
- 
--GNOME_INIT_HOOK
--
--# Unfortunately we have 2 gnome supports: WM hints and gnome libs.
--# The $with_gnomehints below refers to the first, not GNOME_INIT_HOOK.
--if test ! x"$enable_gnome_hints" = xno; then
--  with_gnomehints=yes
--  problem_gnomehints=""
--else
--  with_gnomehints=no
--  problem_gnomehints=": Explicitly disabled"
--fi
--
+@@ -1413,8 +1413,4 @@ else
  # Define some compatibility macros needed for config.h.
 -mg_DEFINE_IF_NOT([#include <X11/keysym.h>],
 -  [defined XK_Page_Up && defined XK_Page_Down],
diff --git a/meta-oe/recipes-graphics/fvwm/fvwm/0002-Avoid-absolute-symlinks.patch b/meta-oe/recipes-graphics/fvwm/fvwm/0002-Avoid-absolute-symlinks.patch
deleted file mode 100644
index 756cc86e8..000000000
--- a/meta-oe/recipes-graphics/fvwm/fvwm/0002-Avoid-absolute-symlinks.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
-Date: Tue, 29 Auf 2017 16:08:42 +0200
-Subject: [PATCH] Avoid absolute symlinks
-
-Avoid usage of absolute symlinks, which breaks yocto builds
-since pyro.
-
-Upstream-Status: Pending
-Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
-
-diff --git a/default-config/Makefile.am b/default-config/Makefile.am
-index 5e16d095a137..5404145a742c 100644
---- a/default-config/Makefile.am
-+++ b/default-config/Makefile.am
-@@ -17,9 +17,9 @@ EXTRA_DIST  = images \
- 
- install-data-hook:
- 	cp -r $(srcdir)/images $(inst_location)
--	ln -sf $(inst_location)/FvwmScript-DateTime $(inst_location)/..
--	ln -sf $(inst_location)/FvwmScript-ConfirmQuit $(inst_location)/..
--	ln -sf $(inst_location)/FvwmScript-ConfirmCopyConfig $(inst_location)/..
-+	ln -sf default-config/FvwmScript-DateTime $(inst_location)/..
-+	ln -sf default-config/FvwmScript-ConfirmQuit $(inst_location)/..
-+	ln -sf default-config/FvwmScript-ConfirmCopyConfig $(inst_location)/..
- 
- uninstall-hook:
- 	rm -fr $(DESTDIR)/$(configdir)
diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.7.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.8.bb
similarity index 91%
rename from meta-oe/recipes-graphics/fvwm/fvwm_2.6.7.bb
rename to meta-oe/recipes-graphics/fvwm/fvwm_2.6.8.bb
index cb851bfd9..e1c3158bb 100644
--- a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.7.bb
+++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.8.bb
@@ -2,7 +2,7 @@ SUMMARY = "F Virtual Window Manager "
 HOMEPAGE = "http://www.fvwm.org/"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=363fbcfb59124689af72c914560eaf6e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8204787357db6ea518dcc9b6cf08388"
 
 DEPENDS = " \
     bison-native \
@@ -31,15 +31,14 @@ DEPENDS = " \
     zlib \
 "
 
-PV = "2.6.7+git${SRCPV}"
+PV = "2.6.8"
 
 SRC_URI = " \
     git://github.com/fvwmorg/fvwm.git;protocol=https \
     file://0001-Fix-compilation-for-disabled-gnome.patch \
-    file://0002-Avoid-absolute-symlinks.patch \
 "
 
-SRCREV = "597a4e296da4f21e71a17facab297e016a3a80a8"
+SRCREV = "dc6a396bfe5cd6c53eb1df103c3af505d0899f90"
 
 S = "${WORKDIR}/git"
 
@@ -54,7 +53,6 @@ ALTERNATIVE_PRIORITY[x-window-manager] = "20"
 EXTRA_OECONF = " \
     --disable-bidi \
     --disable-fontconfigtest \
-    --disable-freetypetest \
     --disable-htmldoc \
     --disable-imlibtest \
     --disable-mandoc \
-- 
2.17.1


