Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6FEC7EE26
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 06:05:26 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.87632.1682921123408225762
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Apr 2023 23:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Df/QE3T2;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-247048f86c7so1447710a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Apr 2023 23:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682921122; x=1685513122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EK1KXzj38S5en/j9aTE4k/Y5NzsO2rw+vITNrSOv+ys=;
        b=Df/QE3T2quMzNSnI6lIcozAByPQUCF8kQHBhCOfjZi0Lw3104g95z7cIT5sf70d7wQ
         4Y+WncBTNSGGloJWe1CEg6qo5NbNj+/5bO9P/oFz7Gr8wcHZoIPN/8wEsh8LflwO+c8g
         zpG+SvNXYitoGHU5Fi8XQz3562kDNckKVz88rxLOe2obQzWozrxMUGdueVHJQs2+Pba3
         ZId8ieuJ4dqwI5SGiBag03zUJJt6JyfYNjB92Wwqm3n0X6uJGXUKVUDUSsL2UwqOhyFx
         qH65SXTMSCb2/xTdN/6zCg/Xc7i+2ptgDaiKOcxWzbA0Q+3ns3vwyg2hCdsfoyaetT/f
         lG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682921122; x=1685513122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EK1KXzj38S5en/j9aTE4k/Y5NzsO2rw+vITNrSOv+ys=;
        b=eiJwKANT9nhG5BupIOPxNTBWaQ4UPoNYctPhRNAs+8rkDhJUXiXau0XevAeDWWUazD
         4SPawZVKadhHPpp67tfVGsxJ95zrxE425/FG3HVYYRqlCv1IxxYASMCmTjtbbmKvCHFZ
         EGwTvKiS0t4fVs92KWHMgOn+FuiP8saD0E1hwvsTzZrqMgMrLTDyDWdrCDaK2Wv/mNE+
         HCkCVP+dL3mkv08QcJGvaUHXVdpm0o2KKERt6HtM4b3AOiz4aamOJZgzNi6NPc60kAxE
         P464H3J110+rd4LDNm/P65/t/j7cc1ot460PaQk8inyR+sI8U/oyLX9F+s8cqC2lTiI4
         puRw==
X-Gm-Message-State: AC+VfDxNaNPA5G0FLoKXFT35tQXdauH6BPfG/TIEYpIGFyQXGm22iQaw
	1cmGF141bC1UYR5nMny7SdOlxQd0DH897A==
X-Google-Smtp-Source: ACHHUZ4wgJZOac0g4lh8IKc9ztQr/vpKnpOgoJ3AZJY0VRGsjEagwLCxz4JbvQ/iyzdf8ierVXRnFA==
X-Received: by 2002:a17:90a:fb4d:b0:24d:fcd2:bdad with SMTP id iq13-20020a17090afb4d00b0024dfcd2bdadmr2517623pjb.35.1682921122187;
        Sun, 30 Apr 2023 23:05:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005134fc049d7sm16767730pgt.31.2023.04.30.23.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 23:05:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/13] thrift: Upgrade to 0.18.1
Date: Sun, 30 Apr 2023 23:05:08 -0700
Message-Id: <20230501060518.3505068-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501060518.3505068-1-raj.khem@gmail.com>
References: <20230501060518.3505068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 06:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102232

Drop idirafter patch to cmake files its not needed anymore with new
version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...onPaths.cmake-Define-libdir-in-terms.patch |   4 +-
 ...ake-Use-idirafter-instead-of-isystem.patch | 180 ------------------
 .../{thrift_0.17.0.bb => thrift_0.18.1.bb}    |   8 +-
 3 files changed, 5 insertions(+), 187 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/thrift/thrift/0001-cmake-Use-idirafter-instead-of-isystem.patch
 rename meta-oe/recipes-connectivity/thrift/{thrift_0.17.0.bb => thrift_0.18.1.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch b/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch
index e1e474ab0a..bbfc6c8069 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch
+++ b/meta-oe/recipes-connectivity/thrift/thrift/0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/build/cmake/DefineInstallationPaths.cmake
 +++ b/build/cmake/DefineInstallationPaths.cmake
-@@ -26,11 +26,11 @@
+@@ -26,11 +26,11 @@ else()
      set(LIB_INSTALL_DIR "lib${LIB_SUFFIX}" CACHE PATH "The library install dir (default: lib${LIB_SUFFIX})")
  endif()
  set(INCLUDE_INSTALL_DIR "include" CACHE PATH "The library install dir (default: include)")
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  set(cmakedir "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DIR}")
 --- a/build/cmake/DefineCMakeDefaults.cmake
 +++ b/build/cmake/DefineCMakeDefaults.cmake
-@@ -44,8 +44,8 @@
+@@ -44,8 +44,8 @@ include(BuildType)
  # top of the build tree rather than in hard-to-find leaf
  # directories. This simplifies manual testing and the use of the build
  # tree rather than installed thrift libraries.
diff --git a/meta-oe/recipes-connectivity/thrift/thrift/0001-cmake-Use-idirafter-instead-of-isystem.patch b/meta-oe/recipes-connectivity/thrift/thrift/0001-cmake-Use-idirafter-instead-of-isystem.patch
deleted file mode 100644
index fd995153b3..0000000000
--- a/meta-oe/recipes-connectivity/thrift/thrift/0001-cmake-Use-idirafter-instead-of-isystem.patch
+++ /dev/null
@@ -1,180 +0,0 @@
-From 0b9c6c4286a33961016839826e709a0e7394b28b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 21 Jan 2023 00:00:04 -0800
-Subject: [PATCH] cmake: Use -idirafter instead of -isystem
-
-isystem dirs are searched before the regular system dirs
-this exposes an interesting include ordering problem when using
-clang + libc++, when including C++ headers like <cstdlib>
-
-cstdlib includes stdlib.h and in case of libc++, this should be coming
-from libc++ as well, which is then eventually including system stdlib.h
-
-libc++ has added a check for checking this order recently, which means
-if cstlib ends up including system stdlib.h before libc++ provided
-stdlib.h it errors out
-
-/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/thrift/0.17.0-r0/recipe-sysroot/usr/include/c++/v1/cstdlib:90:5: error: <cstdlib> tried including <stdlib.h> but didn't find libc++'s <stdlib.h> header.           This usually means that your header search paths are not configured properly.           The header search paths should contain the C++ Standard Library headers before           any C Standard Library, and you are probably using compiler flags that make that           not be the case.
-    ^
-
-The reason is that include_directories with SYSTEM property adds the
-directory via -system and some of these directories point to sysroot
-e.g. OPENSSL_INCLUDE_DIR which ends up adding -isystem
-<sysroot>/usr/include and causes the system stdlib.h to included before
-libc++ stdlib.h
-
-A fix is to use -idirafter which preserved the effects of system headers
-but instead of prepending, it will append to system headers and the
-issue is addressed
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- build/cmake/BoostMacros.cmake  | 2 +-
- lib/c_glib/CMakeLists.txt      | 4 ++--
- lib/c_glib/test/CMakeLists.txt | 2 +-
- lib/cpp/CMakeLists.txt         | 7 +++----
- lib/cpp/test/CMakeLists.txt    | 2 +-
- test/c_glib/CMakeLists.txt     | 6 +++---
- test/cpp/CMakeLists.txt        | 6 +++---
- 7 files changed, 14 insertions(+), 15 deletions(-)
-
-diff --git a/build/cmake/BoostMacros.cmake b/build/cmake/BoostMacros.cmake
-index ffb85af..9f9d2dd 100644
---- a/build/cmake/BoostMacros.cmake
-+++ b/build/cmake/BoostMacros.cmake
-@@ -26,7 +26,7 @@ macro(REQUIRE_BOOST_HEADERS)
-   endif()
-   if (DEFINED Boost_INCLUDE_DIRS)
-     # pre-boost 1.70.0 aware cmake, otherwise it is using targets
--    include_directories(SYSTEM "${Boost_INCLUDE_DIRS}")
-+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${Boost_INCLUDE_DIRS}")
-   endif()
- endmacro()
- 
-diff --git a/lib/c_glib/CMakeLists.txt b/lib/c_glib/CMakeLists.txt
-index 218f7dd..d7a6161 100644
---- a/lib/c_glib/CMakeLists.txt
-+++ b/lib/c_glib/CMakeLists.txt
-@@ -83,7 +83,7 @@ if(OPENSSL_FOUND AND WITH_OPENSSL)
-             list(APPEND SYSLIBS OpenSSL::Crypto)
-         endif()
-     else()
--        include_directories(SYSTEM "${OPENSSL_INCLUDE_DIR}")
-+        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${OPENSSL_INCLUDE_DIR}")
-         list(APPEND SYSLIBS "${OPENSSL_LIBRARIES}")
-     endif()
- endif()
-@@ -97,7 +97,7 @@ target_link_libraries(thrift_c_glib PUBLIC ${SYSLIBS})
- 
- # If Zlib is not found just ignore the Zlib stuff
- if(WITH_ZLIB)
--    include_directories(SYSTEM ${ZLIB_INCLUDE_DIRS})
-+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${ZLIB_INCLUDE_DIRS}")
-     ADD_LIBRARY_THRIFT(thrift_c_glib_zlib ${thrift_c_glib_zlib_SOURCES})
-     target_link_libraries(thrift_c_glib_zlib ${SYSLIBS} ${ZLIB_LIBRARIES})
-     target_link_libraries(thrift_c_glib_zlib thrift_c_glib)
-diff --git a/lib/c_glib/test/CMakeLists.txt b/lib/c_glib/test/CMakeLists.txt
-index 85c6dd0..0c8d3d2 100644
---- a/lib/c_glib/test/CMakeLists.txt
-+++ b/lib/c_glib/test/CMakeLists.txt
-@@ -129,7 +129,7 @@ target_link_libraries(testthriftmemorybufferreadcheck testgenc)
- add_test(NAME testthriftmemorybufferreadcheck COMMAND testthriftmemorybufferreadcheck)
- 
- if(WITH_ZLIB)
--  include_directories(SYSTEM "${ZLIB_INCLUDE_DIRS}")
-+  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${ZLIB_INCLUDE_DIRS}")
-   add_executable(testzlibtransport testzlibtransport.c)
-   target_link_libraries(testzlibtransport testgenc ${ZLIB_LIBRARIES})
-   target_link_libraries(testzlibtransport thrift_c_glib_zlib)
-diff --git a/lib/cpp/CMakeLists.txt b/lib/cpp/CMakeLists.txt
-index 13b41c5..96bea53 100644
---- a/lib/cpp/CMakeLists.txt
-+++ b/lib/cpp/CMakeLists.txt
-@@ -111,7 +111,7 @@ if(OPENSSL_FOUND AND WITH_OPENSSL)
-             list(APPEND SYSLIBS OpenSSL::Crypto)
-         endif()
-     else()
--        include_directories(SYSTEM "${OPENSSL_INCLUDE_DIR}")
-+	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${OPENSSL_INCLUDE_DIR}")
-         list(APPEND SYSLIBS "${OPENSSL_LIBRARIES}")
-     endif()
- endif()
-@@ -167,8 +167,7 @@ ADD_PKGCONFIG_THRIFT(thrift)
- 
- if(WITH_LIBEVENT)
-     find_package(Libevent REQUIRED)  # Libevent comes with CMake support from upstream
--    include_directories(SYSTEM ${LIBEVENT_INCLUDE_DIRS})
--
-+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${LIBEVENT_INCLUDE_DIRS}")
-     ADD_LIBRARY_THRIFT(thriftnb ${thriftcppnb_SOURCES})
-     target_link_libraries(thriftnb PUBLIC thrift)
-     if(TARGET libevent::core AND TARGET libevent::extra)
-@@ -182,7 +181,7 @@ endif()
- 
- if(WITH_ZLIB)
-     find_package(ZLIB REQUIRED)
--    include_directories(SYSTEM ${ZLIB_INCLUDE_DIRS})
-+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${ZLIB_INCLUDE_DIRS}")
- 
-     ADD_LIBRARY_THRIFT(thriftz ${thriftcppz_SOURCES})
-     target_link_libraries(thriftz PUBLIC thrift)
-diff --git a/lib/cpp/test/CMakeLists.txt b/lib/cpp/test/CMakeLists.txt
-index 19854e1..1b36b47 100644
---- a/lib/cpp/test/CMakeLists.txt
-+++ b/lib/cpp/test/CMakeLists.txt
-@@ -127,7 +127,7 @@ endif ()
- add_test(NAME TServerIntegrationTest COMMAND TServerIntegrationTest)
- 
- if(WITH_ZLIB)
--include_directories(SYSTEM "${ZLIB_INCLUDE_DIRS}")
-+set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${ZLIB_INCLUDE_DIRS}")
- add_executable(TransportTest TransportTest.cpp)
- target_link_libraries(TransportTest
-     testgencpp
-diff --git a/test/c_glib/CMakeLists.txt b/test/c_glib/CMakeLists.txt
-index 410774d..cbda860 100644
---- a/test/c_glib/CMakeLists.txt
-+++ b/test/c_glib/CMakeLists.txt
-@@ -21,14 +21,14 @@
- include(ThriftMacros)
- 
- find_package(GLIB REQUIRED COMPONENTS gobject)
--include_directories(SYSTEM "${GLIB_INCLUDE_DIR}")
--include_directories(SYSTEM "${GLIBCONFIG_INCLUDE_DIR}")
-+set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${GLIB_INCLUDE_DIR}")
-+set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${GLIBCONFIG_INCLUDE_DIR}")
- 
- #Make sure gen-c_glib files can be included
- include_directories("${CMAKE_CURRENT_BINARY_DIR}")
- include_directories("${CMAKE_CURRENT_BINARY_DIR}/gen-c_glib")
- include_directories("${PROJECT_SOURCE_DIR}/lib/c_glib/src")
--include_directories(SYSTEM "${OPENSSL_INCLUDE_DIR}")
-+set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${OPENSSL_INCLUDE_DIR}")
- 
- set(crosstestgencglib_SOURCES
- 	gen-c_glib/t_test_second_service.c
-diff --git a/test/cpp/CMakeLists.txt b/test/cpp/CMakeLists.txt
-index a6c1fd5..160c67b 100644
---- a/test/cpp/CMakeLists.txt
-+++ b/test/cpp/CMakeLists.txt
-@@ -27,13 +27,13 @@ REQUIRE_BOOST_LIBRARIES(BOOST_COMPONENTS)
- include(ThriftMacros)
- 
- find_package(OpenSSL REQUIRED)
--include_directories(SYSTEM "${OPENSSL_INCLUDE_DIR}")
-+set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${OPENSSL_INCLUDE_DIR}")
- 
- find_package(Libevent REQUIRED)  # Libevent comes with CMake support from upstream
--include_directories(SYSTEM ${LIBEVENT_INCLUDE_DIRS})
-+set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${LIBEVENT_INCLUDE_DIRS}")
- 
- find_package(ZLIB REQUIRED)
--include_directories(SYSTEM ${ZLIB_INCLUDE_DIRS})
-+set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${ZLIB_INCLUDE_DIRS}")
- 
- #Make sure gen-cpp files can be included
- include_directories("${CMAKE_CURRENT_BINARY_DIR}")
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.17.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/thrift/thrift_0.17.0.bb
rename to meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
index 216af02c42..ea5a3972dc 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.17.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
@@ -8,11 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c40a383cb3f747e0c7abbf1482f194f0 \
 
 DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
-SRC_URI = "https://www-eu.apache.org/dist/thrift//${PV}/${BPN}-${PV}.tar.gz \
-           file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
-           file://0001-cmake-Use-idirafter-instead-of-isystem.patch \
-          "
-SRC_URI[sha256sum] = "b272c1788bb165d99521a2599b31b97fa69e5931d099015d91ae107a0b0cc58f"
+SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
+           file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch"
+SRC_URI[sha256sum] = "04c6f10e5d788ca78e13ee2ef0d2152c7b070c0af55483d6b942e29cff296726"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.40.1


