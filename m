Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0ECCC52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 21:10:44 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.702.1724274643843948979
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 14:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DprzsYSQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2021aeee5e4so950745ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 14:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724274643; x=1724879443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOBRsoQ0Snt7hzg/ct7c4p9Fno05zzbVGJdInxOvwp0=;
        b=DprzsYSQuQUn9NJDztdPryHGEZ/BKHmPGmwBNa3l/yODJP2FFvDv4DCn546r0nUIz7
         aVLW7qjSRg3SgWLdvjjZSpyrPGQ9MGYytuFXAJ4p2YR4+srA3QFp5r0Gdd0/36Bim6x7
         BXHk9OJzVGQjM5sfCnl1P8qGP8MLksoXLSbVQU5yiqV8bmTltMGcZEOGe7sduHC3B827
         NVyLAfInfAs866UZaaVFeMEdlrwxJPE7ZnBPi8djNyyFJagIiXFZcH3a5KTWvQ+R8bGQ
         LiAcCdCD6u1a+8MAfetzoErLPOYMCBFB9RiupBsQaEUXX/pPeezskZws3SHmo91hoD11
         nUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724274643; x=1724879443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOBRsoQ0Snt7hzg/ct7c4p9Fno05zzbVGJdInxOvwp0=;
        b=i1ThFkmIzk4E4gWvL/wCF/07irXd/4rvkGiN/pUX78TI8aaFsqgjqXI+gyXbG09VNp
         Z9B7c2VvwD6TJOnet1CkgbGAOBi2oa1GkYz39X2JE9JKrZgVS9C3DucrnCiXw/vL4FTh
         5omEZ0ITiZY3NjPYWibCIi0M6gFDWaPrcI6U/UDHwso0MmpqoQXs8fLyQpsJrvN9z3oT
         mhGcixjtGataJQLyvwAvDn0uY6MLC0xgSI4xo4xSoERQdBf13FqhknS4CKzf/66m5y0I
         gxGNcMvn2RMy2Lkt02adih0Knmi6HoMz+PJ+zl6zARS4k/GfP5w4t8hcU2aDaRthR57A
         N3sA==
X-Gm-Message-State: AOJu0YyHeWU/JW44De8aTOoMCtFnmWmDGeLIob+D6Wdux1RCnWGk30hl
	nApA66NY4LI6n60ppOCy+jtgVWi0k50pGxLQ5jX9qhpe8TnMFjK5vXO9dQ==
X-Google-Smtp-Source: AGHT+IHzeQEkK7Ju8vJbl7/VPqbSjf8NrCg+9mjqffD3FfBoIaVzxYqjh83DhJpIUmSYvkT8rNwHfw==
X-Received: by 2002:a17:902:ea04:b0:1fb:6d12:2c1c with SMTP id d9443c01a7336-20367c0c3camr43091525ad.19.1724274642574;
        Wed, 21 Aug 2024 14:10:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::77e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855def42sm323555ad.143.2024.08.21.14.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 14:10:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ftgl: Upgrade to 2.4.0
Date: Wed, 21 Aug 2024 14:10:39 -0700
Message-ID: <20240821211040.2667540-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 21:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111896

- Switch to git fork which has all the patches
- Fix build with freetype 2.13.3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-to-avoid-implicit-double-to-float-.patch | 38 -------------------
 ...x-type-mismatch-with-latest-FreeType.patch | 33 ++++++++++++++++
 ...001-use-pkg-config-to-find-freetype2.patch | 38 -------------------
 ....am-remove-useless-and-breaking-code.patch | 38 -------------------
 .../recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb   | 27 -------------
 meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb   | 20 ++++++++++
 6 files changed, 53 insertions(+), 141 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/ftgl/ftgl/0001-Explicit-typecast-to-avoid-implicit-double-to-float-.patch
 create mode 100644 meta-oe/recipes-graphics/ftgl/ftgl/0001-Fix-type-mismatch-with-latest-FreeType.patch
 delete mode 100644 meta-oe/recipes-graphics/ftgl/ftgl/0001-use-pkg-config-to-find-freetype2.patch
 delete mode 100644 meta-oe/recipes-graphics/ftgl/ftgl/0002-Makefile.am-remove-useless-and-breaking-code.patch
 delete mode 100644 meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
 create mode 100644 meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb

diff --git a/meta-oe/recipes-graphics/ftgl/ftgl/0001-Explicit-typecast-to-avoid-implicit-double-to-float-.patch b/meta-oe/recipes-graphics/ftgl/ftgl/0001-Explicit-typecast-to-avoid-implicit-double-to-float-.patch
deleted file mode 100644
index 385bff8dd1..0000000000
--- a/meta-oe/recipes-graphics/ftgl/ftgl/0001-Explicit-typecast-to-avoid-implicit-double-to-float-.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e3bce98a60d6db3b719bbf5d71f732f9b86cb566 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Feb 2019 08:28:09 -0800
-Subject: [PATCH] Explicit typecast to avoid implicit double to float
- conversion
-
-fixes compile errors e.g.
-
-../../ftgl-2.1.3~rc5/demo/simple.cpp:110:27: error: non-constant-expression cannot be narrowed from type 'double' to
-      'float' in initializer list [-Wc++11-narrowing]
-                          (t3 + 2.0) / 3, 0.3 };
-                          ^~~~~~~~~~~~~~
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- demo/simple.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/demo/simple.cpp b/demo/simple.cpp
-index 532e862..aba55b4 100644
---- a/demo/simple.cpp
-+++ b/demo/simple.cpp
-@@ -105,9 +105,9 @@ static void RenderScene(void)
-     float t2 = sin(n / 50 + 1);
-     float t3 = sin(n / 30 + 2);
- 
--    float ambient[4]  = { (t1 + 2.0) / 3,
--                          (t2 + 2.0) / 3,
--                          (t3 + 2.0) / 3, 0.3 };
-+    float ambient[4]  = { float(t1 + 2.0) / 3,
-+                          float(t2 + 2.0) / 3,
-+                          float(t3 + 2.0) / 3, 0.3 };
-     float diffuse[4]  = { 1.0, 0.9, 0.9, 1.0 };
-     float specular[4] = { 1.0, 0.7, 0.7, 1.0 };
-     float position[4] = { 100.0, 100.0, 0.0, 1.0 };
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-graphics/ftgl/ftgl/0001-Fix-type-mismatch-with-latest-FreeType.patch b/meta-oe/recipes-graphics/ftgl/ftgl/0001-Fix-type-mismatch-with-latest-FreeType.patch
new file mode 100644
index 0000000000..e481e4e793
--- /dev/null
+++ b/meta-oe/recipes-graphics/ftgl/ftgl/0001-Fix-type-mismatch-with-latest-FreeType.patch
@@ -0,0 +1,33 @@
+From d11219b681a080c71e33c51c9404c28b134e1745 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 Aug 2024 13:50:34 -0700
+Subject: [PATCH] Fix type mismatch with latest FreeType
+
+This change is intrumented due to a type change in freetype [1] with release 2.13.3
+
+Fixes
+| ../../git/src/FTVectoriser.cpp:171:15: error: cannot initialize a variable of type 'char *' with an rvalue of type 'unsigned char *'
+|   171 |         char* tagList = &outline.tags[startIndex];
+|       |               ^         ~~~~~~~~~~~~~~~~~~~~~~~~~
+
+[1] https://gitlab.freedesktop.org/freetype/freetype/-/commit/044d142be7b6a93b6940367a1bc5847451ff4775
+
+Upstream-Status: Submitted [https://github.com/frankheckenbach/ftgl/pull/19]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/FTVectoriser.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/FTVectoriser.cpp b/src/FTVectoriser.cpp
+index 26e7da8..3610215 100644
+--- a/src/FTVectoriser.cpp
++++ b/src/FTVectoriser.cpp
+@@ -168,7 +168,7 @@ void FTVectoriser::ProcessContours()
+     for(int i = 0; i < ftContourCount; ++i)
+     {
+         FT_Vector* pointList = &outline.points[startIndex];
+-        char* tagList = &outline.tags[startIndex];
++        char* tagList = (char*)&outline.tags[startIndex];
+ 
+         endIndex = outline.contours[i];
+         contourLength =  (endIndex - startIndex) + 1;
diff --git a/meta-oe/recipes-graphics/ftgl/ftgl/0001-use-pkg-config-to-find-freetype2.patch b/meta-oe/recipes-graphics/ftgl/ftgl/0001-use-pkg-config-to-find-freetype2.patch
deleted file mode 100644
index e5ed0bdb86..0000000000
--- a/meta-oe/recipes-graphics/ftgl/ftgl/0001-use-pkg-config-to-find-freetype2.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 8bb183926078b6dd54048fb6820838fe7b6e6163 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sun, 23 Oct 2016 22:46:43 +0200
-Subject: [PATCH] use pkg-config to find freetype2
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 53560ea..b5bb6a3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -41,8 +41,13 @@ AC_CHECK_FUNCS(strndup)
- 
- AC_PATH_X
- 
--AC_CHECK_FT2([9.0.3],[],
--             [AC_MSG_ERROR([FreeType2 is required to compile this library])])
-+PKG_CHECK_MODULES(FT2, freetype2,
-+    CFLAGS="$CFLAGS $FT2_CFLAGS"
-+    LIBS="$LIBS $FT2_LIBS",
-+    AC_MSG_ERROR([FreeType2 is required to compile this library])
-+)
-+AC_SUBST([FT2_CFLAGS])
-+AC_SUBST([FT2_LIBS])
- 
- AC_PATH_XTRA
- 
--- 
-2.5.5
-
diff --git a/meta-oe/recipes-graphics/ftgl/ftgl/0002-Makefile.am-remove-useless-and-breaking-code.patch b/meta-oe/recipes-graphics/ftgl/ftgl/0002-Makefile.am-remove-useless-and-breaking-code.patch
deleted file mode 100644
index 830783e204..0000000000
--- a/meta-oe/recipes-graphics/ftgl/ftgl/0002-Makefile.am-remove-useless-and-breaking-code.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From daabb4110661c4358ec73293d5c0b2106f567c1f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sun, 23 Oct 2016 23:54:14 +0200
-Subject: [PATCH] Makefile.am: remove useless and breaking code
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- Makefile.am | 9 ---------
- 1 file changed, 9 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 89a8a7f..e582a34 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -24,15 +24,6 @@ EXTRA_DIST = \
- 	m4 \
- 	$(NULL)
- 
--# Print out an informative summary.
--all-local:
--	@$(ECHO) "Done."
--	@$(ECHO)
--	@if test "x$(MAKECMDGOALS)" = "xall-am" -o "x$(.TARGETS)" = "xall-am" -o "x$(MAKECMDGOALS)" = "x" -o "x$(.TARGETS)" = "x" ; then \
--	  $(ECHO) "---" ;\
--	  $(ECHO) "Run 'make install' to begin installation into $(prefix)" ;\
--	fi
--	@$(ECHO)
- 
- # Upload documentation
- DOC = docs/html docs/latex/ftgl.pdf
--- 
-2.5.5
-
diff --git a/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb b/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
deleted file mode 100644
index 65f72747cc..0000000000
--- a/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "OpenGL frontend to Freetype 2"
-HOMEPAGE = "https://sourceforge.net/projects/ftgl/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=527a83e92c7bf363025380eec05df6e4"
-
-inherit autotools pkgconfig features_check
-
-REQUIRED_DISTRO_FEATURES = "opengl x11"
-
-DEPENDS += " \
-    freetype \
-    freeglut \
-"
-
-SRC_URI = " \
-    ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-    file://0001-use-pkg-config-to-find-freetype2.patch \
-    file://0002-Makefile.am-remove-useless-and-breaking-code.patch \
-    file://0001-Explicit-typecast-to-avoid-implicit-double-to-float-.patch \
-"
-SRC_URI[md5sum] = "c7879018cde844059495b3029b0b6503"
-SRC_URI[sha256sum] = "521ff7bd62c459ff5372e269c223e2a6107a6a99a36afdc2ae634a973af70c59"
-
-S = "${WORKDIR}/ftgl-2.1.3~rc5"
-
-# undefined reference to symbol 'sin@@GLIBC_2.4'
-CFLAGS += "-lm"
diff --git a/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb b/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
new file mode 100644
index 0000000000..85b0d68aa3
--- /dev/null
+++ b/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "OpenGL frontend to Freetype 2"
+HOMEPAGE = "https://sourceforge.net/projects/ftgl/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=527a83e92c7bf363025380eec05df6e4"
+
+inherit autotools pkgconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl x11"
+
+DEPENDS += " \
+    freetype \
+    freeglut \
+"
+SRCREV = "ddc77166651a71ae037ef3129a285440aa559b2d"
+PV .= "+git"
+
+SRC_URI = "git://github.com/frankheckenbach/ftgl;protocol=https;branch=master \
+           file://0001-Fix-type-mismatch-with-latest-FreeType.patch"
+
+S = "${WORKDIR}/git"

