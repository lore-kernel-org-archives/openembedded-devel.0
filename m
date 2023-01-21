Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A39C38159
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:57 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.2135.1674324107457591306
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iNo/n22V;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d3so7955449plr.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19E9+pORw/MT4AKwl6+zmyp5brZBB+5HQzpkeCoPXCQ=;
        b=iNo/n22Vb/Jm7rDt341MtNY9xZ5y6d1/WHhSYneqTE6PvR7pAruZ8rXXl2PEazgSI4
         SaX319Iz46aZxesV3YcECxe/Oisqsd8LLGhZu/EPXbmqoUt5Veo15wVPcsdaco5G+h+T
         a0KRQyRvTJXrCSYe6XyFGMqSDP8tept1p2S3BNwMlC5P4oiETlDaHGdeLkqR3mnx+uG5
         +rSysDX7zUzjJjXAmhuB0BKcJm47dws1w+hpkiJOhR3pKbg0+ZyOUg6hTgr3lFrKbI3t
         iSahfB08YdrGD8H0FK95546+gaxCwlT6pzUvuXnkqrIxFkcTIJf2N/Rak6cXJtQmOaZ1
         7gbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19E9+pORw/MT4AKwl6+zmyp5brZBB+5HQzpkeCoPXCQ=;
        b=VFbSczT8gVDzJEWJqDhfOzcTEnmH47VSwTjeme3pwvycyzefYo0k0RrhkgDvHwpZ24
         ydIoJwIS24dhNl0hMHYdZiyhy1viVpIe8ayH6hIqLZriTRN/zyIfBDiAEOm3IGJMNqFM
         ZkqPtXYrgoPS8x5z+OWxYyh78XuTlWsR2meMtC37nmICW6ondGhUz6k7ubCVIHD9j1Aj
         HFdSLDLkmt7YlnKu1UQaPQdlsNJGu2ItppNxSg+DX2sZta55qwmFg9hOTrOMI4btHKEw
         dg0sv3jggrERQnLTkf4s9x+dqU0FvMaTJ4x+57AIWQsOA06K816y5uYc8nUWVCrg82u3
         bNYg==
X-Gm-Message-State: AFqh2komS3tsBTzpxiQCZnFASslcBP4IRHaVT/Qpa4YGACGsKXBIxQcP
	pbfGWX/IqVfop9KHNrZT//nu+Lyj7MF32A==
X-Google-Smtp-Source: AMrXdXs4igfgRTvfjImZ8ndMGuI42Gxdi2ms4oOKByqlc6xgUubmBRIbgPGQ8aLmBbP4ty11PU6CKw==
X-Received: by 2002:a17:90a:b792:b0:226:51ff:a8f8 with SMTP id m18-20020a17090ab79200b0022651ffa8f8mr20154414pjr.15.1674324106556;
        Sat, 21 Jan 2023 10:01:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 28/30] thrift: Fix c++ and system header include order problem
Date: Sat, 21 Jan 2023 10:01:19 -0800
Message-Id: <20230121180121.1229895-28-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100695

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ake-Use-idirafter-instead-of-isystem.patch | 180 ++++++++++++++++++
 .../thrift/thrift_0.17.0.bb                   |   1 +
 2 files changed, 181 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/0001-cmake-Use-idirafter-instead-of-isystem.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/0001-cmake-Use-idirafter-instead-of-isystem.patch b/meta-oe/recipes-connectivity/thrift/thrift/0001-cmake-Use-idirafter-instead-of-isystem.patch
new file mode 100644
index 0000000000..fd995153b3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/0001-cmake-Use-idirafter-instead-of-isystem.patch
@@ -0,0 +1,180 @@
+From 0b9c6c4286a33961016839826e709a0e7394b28b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 Jan 2023 00:00:04 -0800
+Subject: [PATCH] cmake: Use -idirafter instead of -isystem
+
+isystem dirs are searched before the regular system dirs
+this exposes an interesting include ordering problem when using
+clang + libc++, when including C++ headers like <cstdlib>
+
+cstdlib includes stdlib.h and in case of libc++, this should be coming
+from libc++ as well, which is then eventually including system stdlib.h
+
+libc++ has added a check for checking this order recently, which means
+if cstlib ends up including system stdlib.h before libc++ provided
+stdlib.h it errors out
+
+/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/thrift/0.17.0-r0/recipe-sysroot/usr/include/c++/v1/cstdlib:90:5: error: <cstdlib> tried including <stdlib.h> but didn't find libc++'s <stdlib.h> header.           This usually means that your header search paths are not configured properly.           The header search paths should contain the C++ Standard Library headers before           any C Standard Library, and you are probably using compiler flags that make that           not be the case.
+    ^
+
+The reason is that include_directories with SYSTEM property adds the
+directory via -system and some of these directories point to sysroot
+e.g. OPENSSL_INCLUDE_DIR which ends up adding -isystem
+<sysroot>/usr/include and causes the system stdlib.h to included before
+libc++ stdlib.h
+
+A fix is to use -idirafter which preserved the effects of system headers
+but instead of prepending, it will append to system headers and the
+issue is addressed
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ build/cmake/BoostMacros.cmake  | 2 +-
+ lib/c_glib/CMakeLists.txt      | 4 ++--
+ lib/c_glib/test/CMakeLists.txt | 2 +-
+ lib/cpp/CMakeLists.txt         | 7 +++----
+ lib/cpp/test/CMakeLists.txt    | 2 +-
+ test/c_glib/CMakeLists.txt     | 6 +++---
+ test/cpp/CMakeLists.txt        | 6 +++---
+ 7 files changed, 14 insertions(+), 15 deletions(-)
+
+diff --git a/build/cmake/BoostMacros.cmake b/build/cmake/BoostMacros.cmake
+index ffb85af..9f9d2dd 100644
+--- a/build/cmake/BoostMacros.cmake
++++ b/build/cmake/BoostMacros.cmake
+@@ -26,7 +26,7 @@ macro(REQUIRE_BOOST_HEADERS)
+   endif()
+   if (DEFINED Boost_INCLUDE_DIRS)
+     # pre-boost 1.70.0 aware cmake, otherwise it is using targets
+-    include_directories(SYSTEM "${Boost_INCLUDE_DIRS}")
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${Boost_INCLUDE_DIRS}")
+   endif()
+ endmacro()
+ 
+diff --git a/lib/c_glib/CMakeLists.txt b/lib/c_glib/CMakeLists.txt
+index 218f7dd..d7a6161 100644
+--- a/lib/c_glib/CMakeLists.txt
++++ b/lib/c_glib/CMakeLists.txt
+@@ -83,7 +83,7 @@ if(OPENSSL_FOUND AND WITH_OPENSSL)
+             list(APPEND SYSLIBS OpenSSL::Crypto)
+         endif()
+     else()
+-        include_directories(SYSTEM "${OPENSSL_INCLUDE_DIR}")
++        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${OPENSSL_INCLUDE_DIR}")
+         list(APPEND SYSLIBS "${OPENSSL_LIBRARIES}")
+     endif()
+ endif()
+@@ -97,7 +97,7 @@ target_link_libraries(thrift_c_glib PUBLIC ${SYSLIBS})
+ 
+ # If Zlib is not found just ignore the Zlib stuff
+ if(WITH_ZLIB)
+-    include_directories(SYSTEM ${ZLIB_INCLUDE_DIRS})
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${ZLIB_INCLUDE_DIRS}")
+     ADD_LIBRARY_THRIFT(thrift_c_glib_zlib ${thrift_c_glib_zlib_SOURCES})
+     target_link_libraries(thrift_c_glib_zlib ${SYSLIBS} ${ZLIB_LIBRARIES})
+     target_link_libraries(thrift_c_glib_zlib thrift_c_glib)
+diff --git a/lib/c_glib/test/CMakeLists.txt b/lib/c_glib/test/CMakeLists.txt
+index 85c6dd0..0c8d3d2 100644
+--- a/lib/c_glib/test/CMakeLists.txt
++++ b/lib/c_glib/test/CMakeLists.txt
+@@ -129,7 +129,7 @@ target_link_libraries(testthriftmemorybufferreadcheck testgenc)
+ add_test(NAME testthriftmemorybufferreadcheck COMMAND testthriftmemorybufferreadcheck)
+ 
+ if(WITH_ZLIB)
+-  include_directories(SYSTEM "${ZLIB_INCLUDE_DIRS}")
++  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${ZLIB_INCLUDE_DIRS}")
+   add_executable(testzlibtransport testzlibtransport.c)
+   target_link_libraries(testzlibtransport testgenc ${ZLIB_LIBRARIES})
+   target_link_libraries(testzlibtransport thrift_c_glib_zlib)
+diff --git a/lib/cpp/CMakeLists.txt b/lib/cpp/CMakeLists.txt
+index 13b41c5..96bea53 100644
+--- a/lib/cpp/CMakeLists.txt
++++ b/lib/cpp/CMakeLists.txt
+@@ -111,7 +111,7 @@ if(OPENSSL_FOUND AND WITH_OPENSSL)
+             list(APPEND SYSLIBS OpenSSL::Crypto)
+         endif()
+     else()
+-        include_directories(SYSTEM "${OPENSSL_INCLUDE_DIR}")
++	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${OPENSSL_INCLUDE_DIR}")
+         list(APPEND SYSLIBS "${OPENSSL_LIBRARIES}")
+     endif()
+ endif()
+@@ -167,8 +167,7 @@ ADD_PKGCONFIG_THRIFT(thrift)
+ 
+ if(WITH_LIBEVENT)
+     find_package(Libevent REQUIRED)  # Libevent comes with CMake support from upstream
+-    include_directories(SYSTEM ${LIBEVENT_INCLUDE_DIRS})
+-
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${LIBEVENT_INCLUDE_DIRS}")
+     ADD_LIBRARY_THRIFT(thriftnb ${thriftcppnb_SOURCES})
+     target_link_libraries(thriftnb PUBLIC thrift)
+     if(TARGET libevent::core AND TARGET libevent::extra)
+@@ -182,7 +181,7 @@ endif()
+ 
+ if(WITH_ZLIB)
+     find_package(ZLIB REQUIRED)
+-    include_directories(SYSTEM ${ZLIB_INCLUDE_DIRS})
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${ZLIB_INCLUDE_DIRS}")
+ 
+     ADD_LIBRARY_THRIFT(thriftz ${thriftcppz_SOURCES})
+     target_link_libraries(thriftz PUBLIC thrift)
+diff --git a/lib/cpp/test/CMakeLists.txt b/lib/cpp/test/CMakeLists.txt
+index 19854e1..1b36b47 100644
+--- a/lib/cpp/test/CMakeLists.txt
++++ b/lib/cpp/test/CMakeLists.txt
+@@ -127,7 +127,7 @@ endif ()
+ add_test(NAME TServerIntegrationTest COMMAND TServerIntegrationTest)
+ 
+ if(WITH_ZLIB)
+-include_directories(SYSTEM "${ZLIB_INCLUDE_DIRS}")
++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${ZLIB_INCLUDE_DIRS}")
+ add_executable(TransportTest TransportTest.cpp)
+ target_link_libraries(TransportTest
+     testgencpp
+diff --git a/test/c_glib/CMakeLists.txt b/test/c_glib/CMakeLists.txt
+index 410774d..cbda860 100644
+--- a/test/c_glib/CMakeLists.txt
++++ b/test/c_glib/CMakeLists.txt
+@@ -21,14 +21,14 @@
+ include(ThriftMacros)
+ 
+ find_package(GLIB REQUIRED COMPONENTS gobject)
+-include_directories(SYSTEM "${GLIB_INCLUDE_DIR}")
+-include_directories(SYSTEM "${GLIBCONFIG_INCLUDE_DIR}")
++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${GLIB_INCLUDE_DIR}")
++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${GLIBCONFIG_INCLUDE_DIR}")
+ 
+ #Make sure gen-c_glib files can be included
+ include_directories("${CMAKE_CURRENT_BINARY_DIR}")
+ include_directories("${CMAKE_CURRENT_BINARY_DIR}/gen-c_glib")
+ include_directories("${PROJECT_SOURCE_DIR}/lib/c_glib/src")
+-include_directories(SYSTEM "${OPENSSL_INCLUDE_DIR}")
++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${OPENSSL_INCLUDE_DIR}")
+ 
+ set(crosstestgencglib_SOURCES
+ 	gen-c_glib/t_test_second_service.c
+diff --git a/test/cpp/CMakeLists.txt b/test/cpp/CMakeLists.txt
+index a6c1fd5..160c67b 100644
+--- a/test/cpp/CMakeLists.txt
++++ b/test/cpp/CMakeLists.txt
+@@ -27,13 +27,13 @@ REQUIRE_BOOST_LIBRARIES(BOOST_COMPONENTS)
+ include(ThriftMacros)
+ 
+ find_package(OpenSSL REQUIRED)
+-include_directories(SYSTEM "${OPENSSL_INCLUDE_DIR}")
++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${OPENSSL_INCLUDE_DIR}")
+ 
+ find_package(Libevent REQUIRED)  # Libevent comes with CMake support from upstream
+-include_directories(SYSTEM ${LIBEVENT_INCLUDE_DIRS})
++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${LIBEVENT_INCLUDE_DIRS}")
+ 
+ find_package(ZLIB REQUIRED)
+-include_directories(SYSTEM ${ZLIB_INCLUDE_DIRS})
++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -idirafter ${ZLIB_INCLUDE_DIRS}")
+ 
+ #Make sure gen-cpp files can be included
+ include_directories("${CMAKE_CURRENT_BINARY_DIR}")
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.17.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.17.0.bb
index 24d07b8e52..216af02c42 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.17.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.17.0.bb
@@ -10,6 +10,7 @@ DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
 SRC_URI = "https://www-eu.apache.org/dist/thrift//${PV}/${BPN}-${PV}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
+           file://0001-cmake-Use-idirafter-instead-of-isystem.patch \
           "
 SRC_URI[sha256sum] = "b272c1788bb165d99521a2599b31b97fa69e5931d099015d91ae107a0b0cc58f"
 
-- 
2.39.1


