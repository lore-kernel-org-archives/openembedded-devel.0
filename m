Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 145117DE94
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 19:58:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44znNd4sq3z5k
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 21:58:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557345538;
	bh=ESixgYEZBsK9Vy5aBavjoHYgYgUPybdlGNxgztbntEA=;
	h=From:To:Subject:Date:From;
	b=EqLO3H7gyMaVOJqGfzOXPZBXCAThoPSjCeYZvaesmkK5l/6/jIIa5CgVVRpMWsGtn
	W1oC2slUZDiWxWsDQ4Ij+KGg4aMF0l0tstocXkxZDop18CrCc9t+0Pz3fWl5sOjmON
	+RdtFgIxDxjRZhszDMcQM4JP5jrdfa9CNvaF2+ymQEXG+GXv2FXUhCzK/7E6uVGRqf
	I5kC0obJs45Bnu8Ac5hfShpQqTajs7LzPGUtagPyOSNM++zXK7+1J4jJrM5hGcrCul
	3cEyVxsILY92KtzAiNTDcmKSE9fbDmD7VqXb3HigdhiIhO3dYZb1MjilgisBrHhiMg
	frw0So/F5G16Adx0Iqbz32/I+5TJY+P5yC0q7mPB8y+O7q9u0Sxhya/9lV+yJdW0CP
	aI0uY/YyKWrQET9aYzC9P2uID5oJZDvPkn9s4Hh/6LAPixVSvM0SJE3El4iCehlewg
	rlOzTMIHXlsQy5yHjLj8imKBapvFDJdkLfHPx3Ba8YcIwykKIUUKXrRin5MKhtf7Mj
	EVN8JppuDdjmv/soUBoR+9uukn4a+AQSuDLL7qdJpTiz9RbVD49ek9eFxaHnXc+taN
	VGwimqGajo53lPUsJ8fSTY6xSCvLCxTf+s+JIpz6AYK20iLcsJZDPI96e5U/C9mrTe
	j57pt6vWVuDysnkmj+HyuH24=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 22:58:52 +0300
Message-Id: <20190508195852.28803-7-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] vlc: Remove workaround and patches for problems fixed upstream
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
X-List-Received-Date: Wed, 08 May 2019 19:58:57 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../vlc/0002-glibc-does-not-provide-strlcpy.patch | 15 ---------------
 .../vlc/vlc/0005-libpostproc-header-check.patch   | 15 ---------------
 .../recipes-multimedia/vlc/vlc_3.0.6.bb           |  5 -----
 3 files changed, 35 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0002-glibc-does-not-provide-strlcpy.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0002-glibc-does-not-provide-strlcpy.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-glibc-does-not-provide-strlcpy.patch
deleted file mode 100644
index 3db3df34b..000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0002-glibc-does-not-provide-strlcpy.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- a/src/input/subtitles.c
-+++ b/src/input/subtitles.c
-@@ -42,6 +42,12 @@
- #include "input_internal.h"
- 
- /**
-+ * Drepper's alternative 
-+ * http://en.wikibooks.org/wiki/C_Programming/C_Reference/nonstandard/strlcpy
-+ */
-+#define strlcpy(dst, src, n) *((char* ) mempcpy(dst, src, n)) = '\0'
-+
-+/**
-  * The possible extensions for subtitle files we support
-  */
- static const char *const sub_exts[] = { SLAVE_SPU_EXTENSIONS, "" };
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch
deleted file mode 100644
index 77a7d6173..000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-* Also look for postprocess.h under libpostproc/
-
-Upstream-status: Pending
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -2589,7 +2589,7 @@ then
-       VLC_SAVE_FLAGS
-       CPPFLAGS="${CPPFLAGS} ${POSTPROC_CFLAGS}"
-       CFLAGS="${CFLAGS} ${POSTPROC_CFLAGS}"
--      AC_CHECK_HEADERS(postproc/postprocess.h)
-+      AC_CHECK_HEADERS(postproc/postprocess.h,[],[AC_CHECK_HEADERS(libpostproc/postprocess.h)])
-       VLC_ADD_PLUGIN([postproc])
-       VLC_RESTORE_FLAGS
-     ],[
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb
index 1ae213ff3..fcd321cb0 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb
@@ -1,13 +1,8 @@
 require ${BPN}.inc
 
-# work around build failure
-EXTRA_OECONF += " --enable-libxml2=no"
-
 LDFLAGS_append_riscv64 = " -pthread"
 
 SRC_URI += " \
-            file://0002-glibc-does-not-provide-strlcpy.patch \
-            file://0005-libpostproc-header-check.patch \
             file://0006-make-opencv-configurable.patch \
             file://0007-use-vorbisidec.patch \
             file://0008-fix-luaL-checkint.patch \
-- 
2.17.1


