Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B9B2D6C46D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Dec 2018 09:24:02 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c14so7612557wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Dec 2018 01:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wwf/M1nydVNvuek2uRI+R+sQFk/bjN71KBqEw5uUh4s=;
	b=Tr7bg+rY7B6Nf7QJ093t6opnV/nmDBsoXwx08nPuDAy8yQNECm7GvFRuQMhs8fg1VR
	EnmJd5DiObUMrRnO2giWogTa6FFHQtG040XzoyqiiOPSt7Qnt6QGpeW2XsuGCXeTf9RO
	TcUmqLTfnBCmRe5Da3VYt4AecCBBPfJuyTls2v+7f6aj4H5jl3DHUJFzpvX+njhF2qhd
	xpHEKHx8lWxLDY5OVF19d9EvF4wM5szKHaVM+675pOpZiE6335EjSokVl8MXphxUbqYi
	1b3HD1y7LyLAXMYCrfudF3TAEqFla3ZNwIwKg9t7VH0tnmcPUTPuc3fOB1gldPIZRSVE
	QXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wwf/M1nydVNvuek2uRI+R+sQFk/bjN71KBqEw5uUh4s=;
	b=Ewm+ssyRFm1IGjtdDTwy9kwuNC5UJs86e2W6lFMIvBOdoMRhfc6aPt1d4sR2Dzyl8t
	QeTdsIbrUediWmYnL+H7C37OzCM8IMZ9oDh4UnGHXc5vFRmV4AmgfDjdH8YMB/upoSYy
	KylfBgyksuRW5YIh0TlH7jstVEd6mZyAuFp/1V2p6YPKIvx5w+FSPiK2T7I7n1QJxIpb
	4jEqSyUnOGVzqAYumtTCYPiRlPIVeRu/I8qkevqRTvzw9DJscaACw1YImNy6wdlh26OB
	h0n1xBbMymgjo3iVZtgKFAFAu0Y5nBpjZ2sGQGw091UaQ3Lfmbiwv4uwv11nISdvyeRC
	6JXg==
X-Gm-Message-State: AA+aEWZv/ctPT6zl2zDGikAZpCS7Ah8DTIcSa5IhN/TTihyh9CVR35EH
	u4K83bmj7Xqb6k2K1rsap1TCPiWP
X-Google-Smtp-Source: AFSGD/ULNWOtSKtp99gRmGe4dIX/TGKApwZ2CU6KS9K60tEWQ2Ky2uytBWzhtGOd5ErPmYnfUtb3oA==
X-Received: by 2002:adf:f308:: with SMTP id i8mr6160838wro.219.1544347442896; 
	Sun, 09 Dec 2018 01:24:02 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id n9sm7410408wrx.80.2018.12.09.01.24.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 09 Dec 2018 01:24:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Dec 2018 09:24:01 +0000
Message-Id: <20181209092402.10939-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [PATCH][thud][meta-oe 1/2] glog: fixed the build for mips and other platforms
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
X-List-Received-Date: Sun, 09 Dec 2018 09:24:03 -0000

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

According to build log http://errors.yoctoproject.org/Errors/Details/201286/
FindLibunwind wokred only for x86, arm, and x86_64. This patch extends the
cmake module to work with mips, ia64, ppc(64) and other architectures supported
by libunwind

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0002-Find-Libunwind-during-configure.patch | 53 +++++++++++--------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
index 3a6f824ea7..15cf67fd2e 100644
--- a/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
+++ b/meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
@@ -1,11 +1,11 @@
 diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
 --- a/cmake/FindLibunwind.cmake	1970-01-01 01:00:00.000000000 +0100
-+++ b/cmake/FindLibunwind.cmake	2018-11-02 14:04:35.460437058 +0100
-@@ -0,0 +1,37 @@
++++ b/cmake/FindLibunwind.cmake	2018-11-20 15:53:48.799078114 +0100
+@@ -0,0 +1,54 @@
 +# - Try to find libunwind
 +# Once done this will define
 +#
-+#  LIBUNWIND_FOUND - system has libunwind
++#  Libunwind_FOUND - system has libunwind
 +#  unwind - cmake target for libunwind
 +
 +find_library (UNWIND_LIBRARY NAMES unwind DOC "unwind library")
@@ -15,11 +15,24 @@ diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
 +
 +if (CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
 +    set(LIBUNWIND_ARCH "arm")
++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^aarch64")
++    set(LIBUNWIND_ARCH "aarch64")
 +elseif (CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64" OR
-+        CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64")
++        CMAKE_SYSTEM_PROCESSOR STREQUAL "amd64" OR
++        CMAKE_SYSTEM_PROCESSOR STREQUAL "corei7-64")
 +    set(LIBUNWIND_ARCH "x86_64")
 +elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^i.86$")
 +    set(LIBUNWIND_ARCH "x86")
++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc64")
++    set(LIBUNWIND_ARCH "ppc64")
++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc")
++    set(LIBUNWIND_ARCH "ppc32")
++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^mips")
++    set(LIBUNWIND_ARCH "mips")
++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^hppa")
++    set(LIBUNWIND_ARCH "hppa")
++elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "^ia64")
++    set(LIBUNWIND_ARCH "ia64")
 +endif()
 +
 +find_library (UNWIND_LIBRARY_PLATFORM NAMES "unwind-${LIBUNWIND_ARCH}" DOC "unwind library platform")
@@ -35,13 +48,17 @@ diff -uNr a/cmake/FindLibunwind.cmake b/cmake/FindLibunwind.cmake
 +
 +mark_as_advanced (UNWIND_LIBRARY UNWIND_LIBRARY_PLATFORM)
 +
-+add_library(unwind INTERFACE IMPORTED)
-+set_target_properties(unwind PROPERTIES
-+    INTERFACE_LINK_LIBRARIES "${UNWIND_LIBRARY};${UNWIND_LIBRARY_PLATFORM}"
-+)
++if (Libunwind_FOUND)
++    add_library(unwind INTERFACE IMPORTED)
++    set_target_properties(unwind PROPERTIES
++        INTERFACE_LINK_LIBRARIES "${UNWIND_LIBRARY};${UNWIND_LIBRARY_PLATFORM}"
++    )
++else()
++    message("Can't find libunwind library")
++endif()
 diff -uNr a/CMakeLists.txt b/CMakeLists.txt
---- a/CMakeLists.txt	2018-11-02 14:02:21.784835854 +0100
-+++ b/CMakeLists.txt	2018-11-02 14:03:16.796935594 +0100
+--- a/CMakeLists.txt	2018-11-20 15:49:07.576278417 +0100
++++ b/CMakeLists.txt	2018-11-20 15:49:32.106819928 +0100
 @@ -58,7 +58,6 @@
  check_include_file (execinfo.h HAVE_EXECINFO_H)
  check_include_file (glob.h HAVE_GLOB_H)
@@ -91,23 +108,13 @@ diff -uNr a/CMakeLists.txt b/CMakeLists.txt
    DESTINATION lib/cmake/glog)
  
  install (EXPORT glog-targets NAMESPACE glog:: DESTINATION lib/cmake/glog)
-Binary files a/.git/index and b/.git/index differ
 diff -uNr a/glog-config.cmake.in b/glog-config.cmake.in
---- a/glog-config.cmake.in	2018-11-02 14:02:21.784835854 +0100
-+++ b/glog-config.cmake.in	2018-11-02 14:03:16.796935594 +0100
-@@ -4,4 +4,15 @@
+--- a/glog-config.cmake.in	2018-11-20 15:49:07.576278417 +0100
++++ b/glog-config.cmake.in	2018-11-20 15:52:32.330418489 +0100
+@@ -4,4 +4,6 @@
  
  @gflags_DEPENDENCY@
  
-+# Record the state of the CMake module path when this script was
-+# called so that we can ensure that we leave it in the same state on
-+# exit as it was on entry, but modify it locally.
-+set(UNWIND_CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH})
-+
-+set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
 +find_dependency (Libunwind)
-+
-+# Restore original module path
-+set(CMAKE_MODULE_PATH "${UNWIND_CMAKE_MODULE_PATH}")
 +
  include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
-- 
2.17.1


