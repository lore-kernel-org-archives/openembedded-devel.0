Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 56A3F78EFF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 11:11:45 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y11-v6so18424118wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 04:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=65LvVi9ExlX2GjhCH8XRIWQd00S560GAjFT9D05Nmz4=;
	b=G80sIV/Js+zWCPfy+xuSizguYv8GXSsCiWMiCY5Sf+iW9qlj4IErA9rMwodnj/oA2D
	AKRerEM1vqs7QNxhK1IMuezryWTphgWITKaXtqHdcLx1icgeqKGYNDKvkklhHjEGvCUj
	dFD4jPYO6gA/6uPuJiJmGLEYz0FXo+S7m4zJ2muJq0M+96SMuiXxtIRc+LCtNAmrYWnZ
	KKpr7eB5dhpFfZG5cOJ95CDNAmOOUXq0fKQT8jidhCkbeJU9VD7SbdT2/5VL7s9SACMG
	ezlmqREAWsrUT3ez66ceduAzKv3JjNBYr9mS8Nnc8bEhTa2FHsJRBYBs6Omfbjd6V09B
	ZRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=65LvVi9ExlX2GjhCH8XRIWQd00S560GAjFT9D05Nmz4=;
	b=ZePt+OPrQcjJ43AhybvfgKqOD4NZ5ausvZbXFnQ/Q05IZAE/HVrh4LwrI9TRLQeI8x
	lAo4afoCelZJ+/HiJ4Jrtan7c0JHZmWIFKzt9nTikfUDAj6ukHOPUGXwF2yvvR+VQStR
	IIJOjNliuaxIRM/yygNR/4ns0c1HK+Ji11UkrJCTnR85sY031e3KyaFKeWw3z399A2nG
	Plg3FNxu1fFHsxzK6oYF8MG6W7L9lr/e2vGixrshpPnlDeciXTPlLo58dkOCSIWXJr3a
	6JmoqbcTGJxhNPbo7JblEoQhEeESDZGqx1EeT89jH9svrO2eQMRkvpXZOjirqJjZNsfh
	0Kuw==
X-Gm-Message-State: ABuFfohmOaRM5yzcdfi5pm1fSOOtKiMtQxcigAW3n1UCHN1Fwc5tXiGL
	i4ktTGdUcUJTQ4QzbDzmWKrnEjgL
X-Google-Smtp-Source: ACcGV61/cvEsQpAnrrnmjicO8sILVUV5oJxWfvHgvjSw8evDuQMEU61QQLIOXXpZ7t520PSK+x022A==
X-Received: by 2002:a7b:c00a:: with SMTP id
	c10-v6mr12442901wmb.73.1539601905807; 
	Mon, 15 Oct 2018 04:11:45 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	a5-v6sm7813623wmh.8.2018.10.15.04.11.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Oct 2018 04:11:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Oct 2018 11:11:42 +0000
Message-Id: <20181015111142.16695-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181015111112.GA1342@jama>
References: <20181015111112.GA1342@jama>
Subject: [PATCH][meta-oe] glog: enable building shared library again
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
X-List-Received-Date: Mon, 15 Oct 2018 11:11:45 -0000

* fix the soversion used by libglog as explained bellow:

The preferred default should IMHO be the same as with 0.3.4 version
which was shared library, but that's easy to add with small bbappend
having:
EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"

but unfortunately the SONAME in the library changed from:
objdump -x usr/lib/libglog.so.0.0.0 | grep SONAME
  SONAME               libglog.so.0
in 0.3.4 to:
objdump -x usr/lib/libglog.so.0.3.5  | grep SONAME
  SONAME               libglog.so.0.3.5

Which breaks all our prebuilt binaries which now correctly complain that
there isn't libglog.so.0 provider in dependencies:
QA Issue: /usr/lib/libfoo.so.1.2.3 contained in package libfoo requires
libglog.so.0, but no providers found in RDEPENDS_libfoo

Which is quite unfortunate for minor upgrade. Did they really change the
ABI (and expect to change it in all future minor upgrades) or is this
change just unexpected side-effect of using cmake instead of autotools?

It looks the later, because if I build 0.3.5 version with autotools I
get:
objdump -x usr/lib/libglog.so.0.0.0 | grep SONAME
  SONAME               libglog.so.0

and there is patch for SOVERSION here as well:
https://github.com/google/or-tools/blob/master/patches/glog.patch

applied in master:
https://github.com/google/glog/blob/master/CMakeLists.txt#L493
https://github.com/google/glog/commit/6b6e38a7d53fe01f42ce34384cf4ba4c50e8cb65#diff-af3b638bc2a3e6c650974192a53c7291

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...Rework-CMake-glog-VERSION-management.patch | 71 +++++++++++++++++++
 meta-oe/recipes-support/glog/glog_0.3.5.bb    |  3 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-support/glog/glog/0001-Rework-CMake-glog-VERSION-management.patch

diff --git a/meta-oe/recipes-support/glog/glog/0001-Rework-CMake-glog-VERSION-management.patch b/meta-oe/recipes-support/glog/glog/0001-Rework-CMake-glog-VERSION-management.patch
new file mode 100644
index 0000000000..f41a6c9724
--- /dev/null
+++ b/meta-oe/recipes-support/glog/glog/0001-Rework-CMake-glog-VERSION-management.patch
@@ -0,0 +1,71 @@
+From 4ea11e0d7c0575316a6ccc07a931164ca29c3d2f Mon Sep 17 00:00:00 2001
+From: Corentin Le Molgat <corentinl@google.com>
+Date: Mon, 29 Jan 2018 14:59:08 +0100
+Subject: [PATCH] Rework CMake glog VERSION management.
+
+- Use of Project version properties instead of custom variables
+- fix missmatch between VERSION (build version) and SOVERSION (API version)
+src: https://cmake.org/cmake/help/latest/prop_tgt/VERSION.html#prop_tgt:VERSION
+
+Upstream-Status: Backport [https://github.com/google/glog/commit/6b6e38a7d53fe01f42ce34384cf4ba4c50e8cb65]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ CMakeLists.txt | 23 ++++++++---------------
+ 1 file changed, 8 insertions(+), 15 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7415eab..fb4e408 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -8,23 +8,16 @@ if (POLICY CMP0063)
+   cmake_policy (SET CMP0063 NEW)
+ endif (POLICY CMP0063)
+ 
+-project (google-glog)
++project(glog VERSION 0.3.5 LANGUAGES C CXX)
+ 
+ enable_testing ()
+ 
+-set (GLOG_MAJOR_VERSION 0)
+-set (GLOG_MINOR_VERSION 3)
+-set (GLOG_PATCH_VERSION 5)
+-
+-set (GLOG_VERSION
+-  ${GLOG_MAJOR_VERSION}.${GLOG_MINOR_VERSION}.${GLOG_PATCH_VERSION})
+-
+ set (CPACK_PACKAGE_NAME glog)
+ set (CPACK_PACKAGE_DESCRIPTION_SUMMARY "")
+-set (CPACK_PACKAGE_VERSION_MAJOR ${GLOG_MAJOR_VERSION})
+-set (CPACK_PACKAGE_VERSION_MINOR ${GLOG_MINOR_VERSION})
+-set (CPACK_PACKAGE_VERSION_PATCH ${GLOG_PATCH_VERSION})
+-set (CPACK_PACKAGE_VERSION ${GLOG_VERSION})
++set (CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
++set (CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
++set (CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
++set (CPACK_PACKAGE_VERSION ${PROJECT_VERSION})
+ 
+ option (WITH_GFLAGS "Use gflags" ON)
+ option (WITH_THREADS "Enable multithreading support" ON)
+@@ -406,8 +399,8 @@ if (gflags_FOUND)
+   endif (NOT BUILD_SHARED_LIBS)
+ endif (gflags_FOUND)
+ 
+-set_target_properties (glog PROPERTIES VERSION ${GLOG_MAJOR_VERSION})
+-set_target_properties (glog PROPERTIES SOVERSION ${GLOG_VERSION})
++set_target_properties (glog PROPERTIES VERSION ${PROJECT_VERSION})
++set_target_properties (glog PROPERTIES SOVERSION ${PROJECT_VERSION_MAJOR})
+ 
+ if (WIN32)
+   target_compile_definitions (glog PUBLIC GLOG_NO_ABBREVIATED_SEVERITIES)
+@@ -570,7 +563,7 @@ configure_package_config_file (glog-config.cmake.in
+   NO_CHECK_REQUIRED_COMPONENTS_MACRO)
+ 
+ write_basic_package_version_file (glog-config-version.cmake VERSION
+-  ${GLOG_VERSION} COMPATIBILITY SameMajorVersion)
++  ${PROJECT_VERSION} COMPATIBILITY SameMajorVersion)
+ 
+ export (TARGETS glog NAMESPACE glog:: FILE glog-targets.cmake)
+ export (PACKAGE glog)
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/glog/glog_0.3.5.bb b/meta-oe/recipes-support/glog/glog_0.3.5.bb
index bf7df53f3f..4c1bce74e2 100644
--- a/meta-oe/recipes-support/glog/glog_0.3.5.bb
+++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
@@ -11,6 +11,7 @@ DEPENDS = "libunwind"
 SRC_URI = " \
     git://github.com/google/glog.git;branch=v035 \
     file://0001-find-libunwind-during-configure.patch \
+    file://0001-Rework-CMake-glog-VERSION-management.patch \
 "
 
 SRCREV = "a6a166db069520dbbd653c97c2e5b12e08a8bb26"
@@ -22,3 +23,5 @@ inherit cmake
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dev = "${PN}-staticdev"
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
+
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
-- 
2.17.1


