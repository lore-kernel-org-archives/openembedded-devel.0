Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4E4C43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:23:01 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75163.1782663773755193689
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h02TF5f+;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30e9eefa268so2227273eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663773; x=1783268573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFHqRGms3WGp1100OC9Pi2nyIpnD7h6Wj/shqtn/+RM=;
        b=h02TF5f+AFBhdS7ezUvLPFA55NQNCOTXH97b61vS9SBJykPYA23wlFPNkz0WhSodR9
         NYvG7g1tU7yQK8gn+QNOEs48aFMuzJDgOvMgFcIDsC7FRjSVwegalhbWz/tCOiZ7qP10
         WgPhtL7JnXxYTUaNiAyeCEvlv9W5Avafj5OOnMRedpMpksbTKcR1h6apgdXlFnD/kJbW
         7WvXJeh1eyzsZd3kv323Zhgu63pIdUuKE9S0UVaS/WCbDWcixnEftQgPU4uXS/CuYiYl
         r/FA0d5KkvN64j0SyJZEzhXN9LBGoWoU/ccpaS/gDxfy2B1PA+q9Z8D/GZ5zdkgemps2
         22VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663773; x=1783268573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OFHqRGms3WGp1100OC9Pi2nyIpnD7h6Wj/shqtn/+RM=;
        b=bTi8zshWhuMmQYjsrhJC9N/m6GbRTFKoio682Gq2Yre+aazXW+B/p6Ip9KeWbWY2Qv
         lUlAcpk7CqWYUn7memUrLjaC85AaKkeChAeejgccUpeHCQFmBa3/+E1iYYTUl0PQyxSb
         u8sPSqel+Lrdat2xH+OapF6GL9SQ+CTbBQ9dgNfZpJT6EifIbMvsGlgexQgxkuUf800A
         ORRujQzqJ1beQS8A6uYteDzpuDuszm2pwNc2S9Udy08Ul3zzTfheuO2T2ke2gzMVdRdv
         B0NTYgQaKpnZO3OW6Kcsyj2wcqDVpbtjya/d3o8U35ELcVeTJVtuiOhu9gf508jhGFjQ
         Dh0A==
X-Gm-Message-State: AOJu0YzXXtWRRlrACiS/Y9nzxwytx4g1yFWCXckmGtqirYCm8JEne5rk
	gsGremBmDQTS2NJLHiWN0pIH5uR89N5Nn61mOG1Sjwv4WEIKI70dXOIFBZbWqv+RBN3VPw==
X-Gm-Gg: AfdE7cn96ocxAe6bPQ2mlV9Zmy23b1i2SuF5qhY/vRfk75XnkhwWev91Ht9Z15IvElo
	Of9A9ZzoqPU/VNcn4J8cq5uHlIq5LVM3g3ur/MXafE18BGOE/IIUv9Kl1u881Wb9mlNdU0kOeTz
	baDFBih/4TNWQuTu318wLYoGvrd2PCQ9gVxarppRI+CfvxmsOmHdu1awVIF5U1nMK6SLk/aJw2o
	eJxUx+swRt12/A9dY+RWLixGHVTwMrtEvLGQeRH3sc0QbivH4XFLgphbKlxYrBSKG2tJ3DU4ViY
	JwP/3b863X1M9lzpdFutKQkR2lvnVFIQ0LklVlxK9dBMCTB6LvZBR+0c5gj2FYJ2HGQCGiuc5HW
	5vCUW4DQovH7GyBDcyLV7LYUs67okMAzMjq7MWAMrVrj8cGS+YzKJxOFtYzHEOuG0xoHhBykeNR
	4+da+o9sTpbrpjId8Znnw8bUm6SYU/ZBvfaG6XDp+lOL1EkksiZY750bDfMw4YZdzUWtxfk65P8
	bvJ5ys2POyE+y1CJDYYiGD15t2kE427V8yd+Jy5PqZIV7Zh6jJ+OUFxKcGBVx7WKJYFLg3pcKO8
	B0VboEA45fyBz3b63124BMgXGtLdzgWa6MKhAGw+
X-Received: by 2002:a05:693c:3114:b0:30c:c3d:bc0d with SMTP id 5a478bee46e88-30c84d127cdmr13639347eec.18.1782663773081;
        Sun, 28 Jun 2026 09:22:53 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 128/128] freeglut: build without the glvnd distro feature for X11, Wayland and GLES
Date: Sun, 28 Jun 2026 09:22:22 -0700
Message-ID: <20260628162222.4081517-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127938

freeglut's CMake used FIND_PACKAGE(OpenGL REQUIRED COMPONENTS OpenGL),
which demands the GLVND libOpenGL.so (OPENGL_opengl_LIBRARY). Without the
glvnd distro feature libglvnd is not built, so do_configure fails on the
X11, Wayland and GLES paths:

  CMake Error: Could NOT find OpenGL (missing: OPENGL_opengl_LIBRARY)

CMake's FindOpenGL also couples the EGL component to GLVND: requesting EGL
without GLES2/GLES3 unconditionally adds OPENGL_opengl_LIBRARY, so dropping
the "OpenGL" component alone is not enough.

Extend the legacy-OpenGL patch to:

* X11/GLES: drop the unsatisfiable GLVND "OpenGL" component from
  FIND_PACKAGE and link the legacy OpenGL::GL target.
* Wayland: find EGL via pkg-config (PkgConfig::EGL), which is independent
  of GLVND, and link the legacy OpenGL::GL target.

Verified by building freeglut for qemux86-64 with x11+wayland and no glvnd
(configure, compile, install, package) and re-checking freeglut-gles
configures.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Add-support-for-legacy-OpenGL.patch  | 64 +++++++++++++++----
 1 file changed, 52 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-graphics/freeglut/files/0001-Add-support-for-legacy-OpenGL.patch b/meta-oe/recipes-graphics/freeglut/files/0001-Add-support-for-legacy-OpenGL.patch
index b7dc2a58aa..023a38caff 100644
--- a/meta-oe/recipes-graphics/freeglut/files/0001-Add-support-for-legacy-OpenGL.patch
+++ b/meta-oe/recipes-graphics/freeglut/files/0001-Add-support-for-legacy-OpenGL.patch
@@ -1,28 +1,53 @@
 From a4c51ae7897f1ad82d10e593344511b3d7b81dbc Mon Sep 17 00:00:00 2001
 From: Jan Vermaete <jan.vermaete@gmail.com>
 Date: Wed, 24 Dec 2025 12:58:36 +0100
-Subject: [PATCH 1/1] Add support for legacy OpenGL
+Subject: [PATCH 1/1] Add support for legacy (non-GLVND) OpenGL
+
+Without the glvnd distro feature libglvnd is not built, so libOpenGL.so
+(OPENGL_opengl_LIBRARY) is absent. Make all OpenGL-using code paths work
+against the legacy mesa libGL.so instead:
+
+* Link the legacy OpenGL::GL target rather than the GLVND OpenGL::OpenGL
+  target everywhere (X11, GLES and Wayland).
+
+* X11 / GLES: drop the unsatisfiable GLVND "OpenGL" component from the
+  FIND_PACKAGE() calls; the legacy OpenGL::GL target covers it.
+
+* Wayland: CMake's FindOpenGL couples the EGL component to GLVND -
+  requesting EGL without GLES2/GLES3 forces OPENGL_opengl_LIBRARY to be a
+  required var (FindOpenGL.cmake), so configure fails with:
+
+    Could NOT find OpenGL (missing: OPENGL_opengl_LIBRARY)
+
+  at CMakeLists.txt:435. Find EGL via pkg-config (PkgConfig::EGL) instead,
+  which works regardless of GLVND, and keep the legacy OpenGL::GL target.
 
 Upstream-Status: Pending
 
 Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
 Commited-by: Jan Vermaete <jan.vermaete@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- CMakeLists.txt | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ CMakeLists.txt | 19 +++++++------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 23741bf..31b3ac8 100644
+index 23741bf..580d1a0 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -378,13 +378,13 @@ IF(FREEGLUT_GLES)
-       FIND_PACKAGE(OpenGL REQUIRED COMPONENTS EGL GLES2 OpenGL)
+@@ -375,16 +375,16 @@ ENDIF()
+ IF(FREEGLUT_GLES)
+     LIST(APPEND PUBLIC_DEFINITIONS -DFREEGLUT_GLES)
+     if(NOT CMAKE_VERSION VERSION_LESS "3.27")
+-      FIND_PACKAGE(OpenGL REQUIRED COMPONENTS EGL GLES2 OpenGL)
++      FIND_PACKAGE(OpenGL REQUIRED COMPONENTS EGL GLES2)
        CMAKE_PATH(GET OPENGL_gles2_LIBRARY PARENT_PATH _OPENGL_LIBDIR)
        FIND_LIBRARY(GLES1_LIBRARY GLESv1_CM HINTS ${_OPENGL_LIBDIR} REQUIRED)
 -      LIST(APPEND LIBS ${GLES1_LIBRARY} OpenGL::EGL OpenGL::GLES2 OpenGL::OpenGL)
 +      LIST(APPEND LIBS ${GLES1_LIBRARY} OpenGL::EGL OpenGL::GLES2 OpenGL::GL)
      elseif(NOT CMAKE_VERSION VERSION_LESS "3.10")
-       FIND_PACKAGE(OpenGL REQUIRED COMPONENTS EGL OpenGL)
+-      FIND_PACKAGE(OpenGL REQUIRED COMPONENTS EGL OpenGL)
++      FIND_PACKAGE(OpenGL REQUIRED COMPONENTS EGL)
        GET_FILENAME_COMPONENT(_OPENGL_LIBDIR ${OPENGL_egl_LIBRARY} DIRECTORY)
        FIND_LIBRARY(GLES1_LIBRARY GLESv1_CM HINTS ${_OPENGL_LIBDIR})
        FIND_LIBRARY(GLES2_LIBRARY GLESv2 HINTS ${_OPENGL_LIBDIR})
@@ -31,15 +56,30 @@ index 23741bf..31b3ac8 100644
      else()
        FIND_PACKAGE(OpenGL REQUIRED)
        LIST(GET ${OPENGL_LIBRARIES} 0 _OPENGL_LIB)
-@@ -433,7 +433,7 @@ IF(FREEGLUT_WAYLAND)
+@@ -407,7 +407,7 @@ ELSE()
+     endif()
+ 
+     if(NOT CMAKE_VERSION VERSION_LESS "3.10")
+-      FIND_PACKAGE(OpenGL REQUIRED COMPONENTS OpenGL)
++      FIND_PACKAGE(OpenGL REQUIRED)
+       LIST(APPEND LIBS OpenGL::GL)
+     else()
+       FIND_PACKAGE(OpenGL REQUIRED)
+@@ -432,8 +432,13 @@ IF(FREEGLUT_WAYLAND)
+   ADD_DEFINITIONS(-DFREEGLUT_WAYLAND)
    INCLUDE(FindPkgConfig)
    if(NOT CMAKE_VERSION VERSION_LESS "3.10")
-     FIND_PACKAGE(OpenGL REQUIRED COMPONENTS EGL OpenGL)
+-    FIND_PACKAGE(OpenGL REQUIRED COMPONENTS EGL OpenGL)
 -    LIST(APPEND LIBS OpenGL::EGL OpenGL::OpenGL)
-+    LIST(APPEND LIBS OpenGL::EGL OpenGL::GL)
++    # CMake's FindOpenGL ties the EGL component to GLVND: requesting EGL
++    # without GLES2/GLES3 forces OPENGL_opengl_LIBRARY (libOpenGL.so) to be
++    # required, which is absent without the glvnd distro feature. Find EGL via
++    # pkg-config instead and use the legacy OpenGL::GL (libGL) target.
++    FIND_PACKAGE(OpenGL REQUIRED)
++    PKG_CHECK_MODULES(EGL REQUIRED IMPORTED_TARGET egl)
++    LIST(APPEND LIBS PkgConfig::EGL OpenGL::GL)
    else()
      FIND_PACKAGE(OpenGL REQUIRED)
      LIST(GET ${OPENGL_LIBRARIES} 0 _OPENGL_LIB)
--- 
+--
 2.47.3
-

