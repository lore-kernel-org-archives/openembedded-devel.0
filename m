Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 50B227FD04
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 02:09:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,427,1571673600"; d="scan'208";a="81708612"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 10:09:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 193844CE20DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 10:00:44 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 10:09:50 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 Jan 2020 10:09:53 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 12 Jan 2020 22:01:00 -0800
Message-ID: <1578895261-30411-6-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578895261-30411-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578895261-30411-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 193844CE20DF.A4608
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libsdl2-ttf: upgrade 2.0.14 -> 2.0.15
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
X-List-Received-Date: Mon, 13 Jan 2020 02:09:50 -0000
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

use.pkg-config.for.freetype2.patch
Removed since source is changed.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../use.pkg-config.for.freetype2.patch        | 62 -------------------
 ...l2-ttf_2.0.14.bb => libsdl2-ttf_2.0.15.bb} |  7 +--
 2 files changed, 3 insertions(+), 66 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-ttf/use.pkg-config.for.freetype2.patch
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-ttf_2.0.14.bb => libsdl2-ttf_2.0.15.bb} (71%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/use.pkg-config.for.freetype2.patch b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/use.pkg-config.for.freetype2.patch
deleted file mode 100644
index 1dfbec6ed..000000000
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/use.pkg-config.for.freetype2.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From e6d2c0e130811c15b5f5cc10221fae182cb8609e Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 22 May 2014 10:59:33 +0100
-Subject: [PATCH] freetype-config was removed from oe-core in
-
-commit 5870bd272b0b077d0826fb900b251884c1c05061
-
-    binconfig-disabled: Add class and use
-
----
- configure.in | 38 +++++---------------------------------
- 1 file changed, 5 insertions(+), 33 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 9b36e15..f300cae 100644
---- a/configure.in
-+++ b/configure.in
-@@ -86,39 +86,11 @@ case "$host" in
- esac
- AM_CONDITIONAL(USE_VERSION_RC, test x$use_version_rc = xtrue)
- 
--dnl Check for the FreeType 2 library
--dnl
--dnl Get the cflags and libraries from the freetype-config script
--dnl
--AC_ARG_WITH(freetype-prefix,[  --with-freetype-prefix=PFX   Prefix where FREETYPE is 
--installed (optional)],
--            freetype_prefix="$withval", freetype_prefix="")
--AC_ARG_WITH(freetype-exec-prefix,[  --with-freetype-exec-prefix=PFX Exec prefix 
--where FREETYPE is installed (optional)],
--            freetype_exec_prefix="$withval", freetype_exec_prefix="")
--
--if test x$freetype_exec_prefix != x ; then
--     freetype_args="$freetype_args --exec-prefix=$freetype_exec_prefix"
--     if test x${FREETYPE_CONFIG+set} != xset ; then
--        FREETYPE_CONFIG=$freetype_exec_prefix/bin/freetype-config
--     fi
--fi
--if test x$freetype_prefix != x ; then
--     freetype_args="$freetype_args --prefix=$freetype_prefix"
--     if test x${FREETYPE_CONFIG+set} != xset ; then
--        FREETYPE_CONFIG=$freetype_prefix/bin/freetype-config
--     fi
--fi
--AC_PATH_PROG(FREETYPE_CONFIG, freetype-config, no)
--no_freetype=""
--if test "$FREETYPE_CONFIG" = "no" ; then
--    AC_MSG_ERROR([
--*** Unable to find FreeType2 library (http://www.freetype.org/)
--])
--else
--    CFLAGS="$CFLAGS `$FREETYPE_CONFIG $freetypeconf_args --cflags`"
--    LIBS="$LIBS `$FREETYPE_CONFIG $freetypeconf_args --libs`"
--fi
-+PKG_CHECK_MODULES(FREETYPE2, freetype2, 
-+    CFLAGS="$CFLAGS $FREETYPE2_CFLAGS"
-+    LIBS="$LIBS $FREETYPE2_LIBS",
-+    AC_MSG_ERROR([*** Unable to find FreeType2 library (http://www.freetype.org/)])
-+)
- 
- dnl Check for SDL
- SDL_VERSION=2.0.0
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.14.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.15.bb
similarity index 71%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.14.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.15.bb
index 6224ad3e7..7d896cf00 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.14.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.15.bb
@@ -2,15 +2,14 @@ SUMMARY = "Simple DirectMedia Layer truetype font library"
 SECTION = "libs"
 DEPENDS = "virtual/libsdl2 freetype virtual/libgl"
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=cb33e7c4df9fbde389f149ad6bc93ce5"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=4bb27d550fdafcd8f8e4fb8cbb2775ef"
 
 SRC_URI = " \
     http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${PV}.tar.gz \
-    file://use.pkg-config.for.freetype2.patch \
     file://automake_foreign.patch \
 "
-SRC_URI[md5sum] = "e53c05e1e7f1382c316afd6c763388b1"
-SRC_URI[sha256sum] = "34db5e20bcf64e7071fe9ae25acaa7d72bdc4f11ab3ce59acc768ab62fe39276"
+SRC_URI[md5sum] = "04fe06ff7623d7bdcb704e82f5f88391"
+SRC_URI[sha256sum] = "a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33"
 
 S = "${WORKDIR}/SDL2_ttf-${PV}"
 
-- 
2.17.1




