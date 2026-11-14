Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7699.1794645330730312799
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 00:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IMT1Cr4o;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9ae391a05so10175665ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 00:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645330; x=1795250130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xEbNnLABh3ffvxjqRkLxYE+OzyWYRNciT+PiHO2+e8=;
        b=IMT1Cr4oH2tyVIW5a6+TtY3jeIKUl38dz7IcumHPeJEANqcq5d3UpqonSPWtMsSdlM
         gUok1s+yjFeqXSZaouaVk5FbFms6UXVmyB7vZvZkCNUd7OlgVWjgiL2+0/zyeKqg6Ih3
         zyI+vaT4zmddTnyWRYHNv70Q2ZdHzW+A3J3l9kvLVaEFs602mQsMBjENdW5WdZMdsEep
         CL/Uk3XpgZpbepmB/1bIvhKIwFF9vmdPzidpLDi28nxRl+EXVP0p6urx60GiPTHSSRg5
         bngSFDzWwtQN+MZhTl/9MfPAbzMlA9bTMNsCtmAZWsurhzu+XQ6L3+OtTcpg7OmRWaMZ
         j/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645330; x=1795250130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xEbNnLABh3ffvxjqRkLxYE+OzyWYRNciT+PiHO2+e8=;
        b=zD+xMXIV5REgkUgzKPAqWthzNFynTn/n4JU59qIAYvup/GQ6BsOYJM2JKpc97Oh1pS
         zV3NVKv566lO/5lO+0VwCNrqjoiIBrtnUz4Svg/gda/SBISIlgQG/YEOGLSqfklnLVIN
         U159cArF0ac/e3OUHPe2sEdt0R3uDIonO5Ar9XyG5T5iumxnOszzrJeAj2+zNk/AVTLE
         YiTrmhRtQVujdWGS5VwGjfolpyz6pxmbs4FVL98pDJwbYT1fFvvbmYkDlb8+okPXilti
         i/YhD3afWLJl1ReN0Ng7anXXYYiASf1HrI35j4vvu79UPvH5iFKxb1bzFPgDzj7bSw+2
         pi7w==
X-Gm-Message-State: APuU4Z83Ol6H91zKOE936F/em2uNu/ItuAaiM71pryCFw0YRXYAjuOic
	dpznuSQlPDpSxxJxEvUaXxjZRCmbPIyHflSuI17B8H0FMaP3POvWM4gkLLHWbw==
X-Gm-Gg: AYBFou0JyfJO93w9ZcuyMXyVkw5xL29Q0P8u3ZOQ2IwN+kvjFjmgOVZVdW4mINXy858
	L0AL141yWU7+ZUrb5K0/WzJoJNEHC/Mw6QGQKdzm7zgP4Ce5E3tVquV4lnaXwJnxtE3eYvWJ5i3
	yom+/6TjLrvMDLEp120ZIn9vfHUD4srlk1BP0JDiBOEMCo77pOamXaj131GVLPao9BwciLWHKgz
	gKNm5CTU73WMef0Dl8pKfJYpmBn4L/R5IJtAkWMITxTduOmS8F9BY6aH0xA8B4thTuwuMJOmwOV
	o2UXs+B3+/Oqv3wp7WD+H0lYj7HxHh4J+x4rEiotbmsGO+6QRbsntDgokbFZAYSu3pqlCkvSteb
	35VSch4qeeSEo1FEhr+IAtMJ/Nji1RzGW3Hjc6QOl2hqtrB51H8iyIXJ4ov/f8VMqarLX6KqToA
	u5zn9BZzCj+7HysIOyhULnKTyX94sNr8YVsZIWUGKaguts2Yc8v1puyXFfxiXKCL4Mq8RARE3QK
	FS0EM3AzWW0BwjuVseFb90HpTtSle3PxqfwtgXtZVdP2EFtLDPri1qsK8CLYitsCSqWsYs7MHCX
	1aGUnrnPah0H58rvZK3HwMrdusOWzbN9/mU3BI9hXGT/3wU7nLidnsGx1yl6sja83ht4LYwFGQJ
	soAV6
X-Received: by 2002:a17:903:388b:b0:2ed:662:e485 with SMTP id d9443c01a7336-2ee0d9fceefmr34999405ad.2.1794645329353;
        Sat, 14 Nov 2026 00:35:29 -0800 (PST)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from dld58y9k4-lin.dl.net ([2a02:b025:40:94c3:2c77:91fc:2a7f:9aac])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f9f13desm18484475ad.67.2026.11.14.00.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:35:28 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <locutusofborg@debian.org>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 1/2] websocketpp: update to new maintained fork, update to 0.8.4-cpprest-lts and unblacklist
Date: Sat, 14 Nov 2026 09:35:13 +0100
Message-ID: <20261114083514.1798099-1-locutusofborg@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 08:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132255
Content-Type: text/plain; charset="utf-8"

The new fork incorporated all the patches, delete them
Update license md5sum due to upstream file change

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../cpprest/cpprest_2.10.19.bb                |  20 -
 .../0001-Correct-clang-compiler-flags.patch   |  32 --
 .../0001-cmake-Use-GNUInstallDirs.patch       |  35 --
 .../websocketpp/websocketpp-0.8.2/1024.patch  | 508 ------------------
 .../websocketpp/websocketpp-0.8.2/855.patch   |  25 -
 .../websocketpp/websocketpp-0.8.2/857.patch   | 134 -----
 ....2.bb => websocketpp_0.8.4-cpprest-lts.bb} |  15 +-
 7 files changed, 4 insertions(+), 765 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
 delete mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-Correct-clang-compiler-flags.patch
 delete mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-cmake-Use-GNUInstallDirs.patch
 delete mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/1024.patch
 delete mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch
 delete mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/857.patch
 rename meta-oe/recipes-support/websocketpp/{websocketpp_0.8.2.bb => websocketpp_0.8.4-cpprest-lts.bb} (62%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
deleted file mode 100644
index ec7be4ad37..0000000000
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.19.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."
-SECTION = "libs/network"
-HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/license.txt;md5=a2e15b954769218ff912468eecd6a02f"
-DEPENDS = "openssl websocketpp zlib boost brotli"
-
-EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake/cpprestsdk -DCPPREST_EXCLUDE_BROTLI=OFF -DWERROR=OFF"
-
-SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
-           file://disable-float-tests.patch \
-           file://disable-outside-tests.patch "
-
-# tag 2.10.19
-SRCREV = "411a109150b270f23c8c97fa4ec9a0a4a98cdecf"
-
-
-inherit cmake pkgconfig
-
-SKIP_RECIPE[cpprest] ?= "Needs websocketpp which does not yet work with boost >= 1.87"
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-Correct-clang-compiler-flags.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-Correct-clang-compiler-flags.patch
deleted file mode 100644
index 7a99daf6b2..0000000000
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-Correct-clang-compiler-flags.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5ccaff351297bca0e254bbfd66e3f03fef9d9c75 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 10 Jan 2020 21:54:39 -0800
-Subject: [PATCH] Correct clang compiler flags
-
-Fix misplaced quotes, this was leading to spurious ; in compiler cmdline
-Remove demanding libc++, clang can link with both libc++ and libstdc++
-and platforms have their own defaults, user can demand non defaults via
-adding it to cmake flags
-
-Upstream-Status: Submitted [https://github.com/zaphoyd/websocketpp/pull/859]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2d13117..c17354a 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -154,7 +154,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
-         endif()
-         set (WEBSOCKETPP_PLATFORM_TLS_LIBS ssl crypto)
-         set (WEBSOCKETPP_BOOST_LIBS system thread)
--        set (CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} "-std=c++0x -stdlib=libc++") # todo: is libc++ really needed here?
-+        set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
-         if (NOT APPLE)
-             add_definitions (-DNDEBUG -Wall -Wno-padded) # todo: should we use CMAKE_C_FLAGS for these?
-         endif ()
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-cmake-Use-GNUInstallDirs.patch
deleted file mode 100644
index 0ef2e12375..0000000000
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-cmake-Use-GNUInstallDirs.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 771d79eeb0ac5079482a4b3a131bbda744793e7d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 19 Dec 2019 20:07:11 -0800
-Subject: [PATCH] cmake: Use GNUInstallDirs
-
-Helps install cmakefiles in right libdir
-
-Upstream-Status: Submitted [https://github.com/zaphoyd/websocketpp/pull/854]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2786aba..080be3e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -39,11 +39,13 @@ endif()
- 
- set_property(GLOBAL PROPERTY USE_FOLDERS ON)
- 
-+include(GNUInstallDirs)
-+
- set(INSTALL_INCLUDE_DIR include CACHE PATH "Installation directory for header files")
- if (WIN32 AND NOT CYGWIN)
-   set (DEF_INSTALL_CMAKE_DIR cmake)
- else ()
--  set (DEF_INSTALL_CMAKE_DIR lib/cmake/websocketpp)
-+  set (DEF_INSTALL_CMAKE_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/websocketpp)
- endif ()
- set (INSTALL_CMAKE_DIR ${DEF_INSTALL_CMAKE_DIR} CACHE PATH "Installation directory for CMake files")
- 
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/1024.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/1024.patch
deleted file mode 100644
index 12613f8b19..0000000000
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/1024.patch
+++ /dev/null
@@ -1,508 +0,0 @@
-From 05d1189ffce562560da90056d96fe2084d84654a Mon Sep 17 00:00:00 2001
-From: "Laszlo Boszormenyi (GCS)" <gcs@debian.org>
-Date: Mon, 14 Feb 2022 14:13:13 +0100
-Subject: [PATCH] SCons 4.2.0 no longer has env_cpp11.has_key() Check env_cpp11
- as an array.
-
-This fixes https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1003022
----
-Upstream-Status: Pending
-
- examples/broadcast_server/SConscript    | 2 +-
- examples/debug_client/SConscript        | 2 +-
- examples/debug_server/SConscript        | 2 +-
- examples/dev/SConscript                 | 2 +-
- examples/echo_client/SConscript         | 2 +-
- examples/echo_server/SConscript         | 2 +-
- examples/echo_server_both/SConscript    | 2 +-
- examples/echo_server_tls/SConscript     | 2 +-
- examples/external_io_service/SConscript | 2 +-
- examples/iostream_server/SConscript     | 2 +-
- examples/print_client/SConscript        | 2 +-
- examples/print_client_tls/SConscript    | 2 +-
- examples/print_server/SConscript        | 2 +-
- examples/scratch_client/SConscript      | 2 +-
- examples/scratch_server/SConscript      | 2 +-
- examples/sip_client/SConscript          | 2 +-
- examples/subprotocol_server/SConscript  | 2 +-
- examples/telemetry_client/SConscript    | 2 +-
- examples/telemetry_server/SConscript    | 2 +-
- examples/testee_client/SConscript       | 2 +-
- examples/testee_server/SConscript       | 2 +-
- examples/utility_client/SConscript      | 4 ++--
- test/connection/SConscript              | 2 +-
- test/endpoint/SConscript                | 2 +-
- test/extension/SConscript               | 2 +-
- test/http/SConscript                    | 2 +-
- test/logger/SConscript                  | 2 +-
- test/message_buffer/SConscript          | 2 +-
- test/processors/SConscript              | 2 +-
- test/random/SConscript                  | 2 +-
- test/roles/SConscript                   | 2 +-
- test/transport/SConscript               | 2 +-
- test/transport/asio/SConscript          | 2 +-
- test/transport/iostream/SConscript      | 2 +-
- test/utility/SConscript                 | 2 +-
- 35 files changed, 36 insertions(+), 36 deletions(-)
-
-diff --git a/examples/broadcast_server/SConscript b/examples/broadcast_server/SConscript
-index 5786f570d..06c55c147 100644
---- a/examples/broadcast_server/SConscript
-+++ b/examples/broadcast_server/SConscript
-@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    prgs += env_cpp11.Program('broadcast_server', ["broadcast_server.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/debug_client/SConscript b/examples/debug_client/SConscript
-index 781db8371..b92b14653 100644
---- a/examples/debug_client/SConscript
-+++ b/examples/debug_client/SConscript
-@@ -14,7 +14,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
-    prgs += env_cpp11.Program('debug_client', ["debug_client.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/debug_server/SConscript b/examples/debug_server/SConscript
-index 4d02261c6..7e24b07c8 100644
---- a/examples/debug_server/SConscript
-+++ b/examples/debug_server/SConscript
-@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    prgs += env_cpp11.Program('debug_server', ["debug_server.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/dev/SConscript b/examples/dev/SConscript
-index 34ddac2d5..31062fee9 100644
---- a/examples/dev/SConscript
-+++ b/examples/dev/SConscript
-@@ -11,7 +11,7 @@ env_cpp11 = env_cpp11.Clone ()
- 
- prgs = []
- 
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework','system','timer','chrono'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    prgs += env_cpp11.Program('main', ["main.cpp"], LIBS = BOOST_LIBS_CPP11)
- 
-diff --git a/examples/echo_client/SConscript b/examples/echo_client/SConscript
-index 0e4110822..2adf1166d 100644
---- a/examples/echo_client/SConscript
-+++ b/examples/echo_client/SConscript
-@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + ['z']
-    prgs += env_cpp11.Program('echo_client', ["echo_client.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/echo_server/SConscript b/examples/echo_server/SConscript
-index a2978852e..a48724155 100644
---- a/examples/echo_server/SConscript
-+++ b/examples/echo_server/SConscript
-@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    prgs += env_cpp11.Program('echo_server', ["echo_server.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/echo_server_both/SConscript b/examples/echo_server_both/SConscript
-index d1ecf202f..32f4c8c55 100644
---- a/examples/echo_server_both/SConscript
-+++ b/examples/echo_server_both/SConscript
-@@ -14,7 +14,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
-    prgs += env_cpp11.Program('echo_server_both', ["echo_server_both.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/echo_server_tls/SConscript b/examples/echo_server_tls/SConscript
-index e24cc4ce8..688bf7c14 100644
---- a/examples/echo_server_tls/SConscript
-+++ b/examples/echo_server_tls/SConscript
-@@ -14,7 +14,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
-    prgs += env_cpp11.Program('echo_server_tls', ["echo_server_tls.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/external_io_service/SConscript b/examples/external_io_service/SConscript
-index beb7c1c42..0abf3e175 100644
---- a/examples/external_io_service/SConscript
-+++ b/examples/external_io_service/SConscript
-@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    prgs += env_cpp11.Program('external_io_service', ["external_io_service.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/iostream_server/SConscript b/examples/iostream_server/SConscript
-index dc90834cf..304142082 100644
---- a/examples/iostream_server/SConscript
-+++ b/examples/iostream_server/SConscript
-@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    prgs += env_cpp11.Program('iostream_server', ["iostream_server.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/print_client/SConscript b/examples/print_client/SConscript
-index 8da4ce5b2..79fdea0fd 100644
---- a/examples/print_client/SConscript
-+++ b/examples/print_client/SConscript
-@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    prgs += env_cpp11.Program('print_client', ["print_client.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/print_client_tls/SConscript b/examples/print_client_tls/SConscript
-index 01b011473..e57b9d691 100644
---- a/examples/print_client_tls/SConscript
-+++ b/examples/print_client_tls/SConscript
-@@ -14,7 +14,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
-    prgs += env_cpp11.Program('print_client_tls', ["print_client_tls.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/print_server/SConscript b/examples/print_server/SConscript
-index 4f0e492be..454dcf01b 100644
---- a/examples/print_server/SConscript
-+++ b/examples/print_server/SConscript
-@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    prgs += env_cpp11.Program('print_server', ["print_server.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/scratch_client/SConscript b/examples/scratch_client/SConscript
-index 6e7b2ef07..4be98f437 100644
---- a/examples/scratch_client/SConscript
-+++ b/examples/scratch_client/SConscript
-@@ -14,7 +14,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
-    prgs += env_cpp11.Program('scratch_client', ["scratch_client.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/scratch_server/SConscript b/examples/scratch_server/SConscript
-index bf90f7433..cc495ba5c 100644
---- a/examples/scratch_server/SConscript
-+++ b/examples/scratch_server/SConscript
-@@ -14,7 +14,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs] + ['z']
-    prgs += env_cpp11.Program('scratch_server', ["scratch_server.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/sip_client/SConscript b/examples/sip_client/SConscript
-index fafe7b4ff..e2afefe73 100644
---- a/examples/sip_client/SConscript
-+++ b/examples/sip_client/SConscript
-@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    prgs += env_cpp11.Program('sip_client', ["sip_client.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/subprotocol_server/SConscript b/examples/subprotocol_server/SConscript
-index e97535ca5..299af43c5 100644
---- a/examples/subprotocol_server/SConscript
-+++ b/examples/subprotocol_server/SConscript
-@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    prgs += env_cpp11.Program('subprotocol_server', ["subprotocol_server.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/telemetry_client/SConscript b/examples/telemetry_client/SConscript
-index 62396a5e3..ac0e6daba 100644
---- a/examples/telemetry_client/SConscript
-+++ b/examples/telemetry_client/SConscript
-@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    prgs += env_cpp11.Program('telemetry_client', ["telemetry_client.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/telemetry_server/SConscript b/examples/telemetry_server/SConscript
-index 1b8ff2295..c620f38a4 100644
---- a/examples/telemetry_server/SConscript
-+++ b/examples/telemetry_server/SConscript
-@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    prgs += env_cpp11.Program('telemetry_server', ["telemetry_server.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/testee_client/SConscript b/examples/testee_client/SConscript
-index 64f0ef1f3..6154bb966 100644
---- a/examples/testee_client/SConscript
-+++ b/examples/testee_client/SConscript
-@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + ['z']
-    prgs += env_cpp11.Program('testee_client', ["testee_client.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/testee_server/SConscript b/examples/testee_server/SConscript
-index 3c75f4ff2..ca8ffb7d7 100644
---- a/examples/testee_server/SConscript
-+++ b/examples/testee_server/SConscript
-@@ -13,7 +13,7 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs] + ['z']
-    prgs += env_cpp11.Program('testee_server', ["testee_server.cpp"], LIBS = ALL_LIBS)
- else:
-diff --git a/examples/utility_client/SConscript b/examples/utility_client/SConscript
-index 6e6cd8c9d..f6d673a43 100644
---- a/examples/utility_client/SConscript
-+++ b/examples/utility_client/SConscript
-@@ -13,11 +13,11 @@ env_cpp11 = env_cpp11.Clone ()
- prgs = []
- 
- # if a C++11 environment is available build using that, otherwise use boost
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    ALL_LIBS = boostlibs(['system'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    prgs += env_cpp11.Program('utility_client', ["utility_client.cpp"], LIBS = ALL_LIBS)
- else:
-    ALL_LIBS = boostlibs(['system','random'],env) + [platform_libs] + [polyfill_libs]
-    prgs += env.Program('utility_client', ["utility_client.cpp"], LIBS = ALL_LIBS)
- 
--Return('prgs')
-\ No newline at end of file
-+Return('prgs')
-diff --git a/test/connection/SConscript b/test/connection/SConscript
-index 4ed7a4e69..b79876bf1 100644
---- a/test/connection/SConscript
-+++ b/test/connection/SConscript
-@@ -16,7 +16,7 @@ objs = env.Object('connection_boost.o', ["connection.cpp"], LIBS = BOOST_LIBS)
- objs = env.Object('connection_tu2_boost.o', ["connection_tu2.cpp"], LIBS = BOOST_LIBS)
- prgs = env.Program('test_connection_boost', ["connection_boost.o","connection_tu2_boost.o"], LIBS = BOOST_LIBS)
- 
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework','system'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    objs += env_cpp11.Object('connection_stl.o', ["connection.cpp"], LIBS = BOOST_LIBS_CPP11)
-    objs += env_cpp11.Object('connection_tu2_stl.o', ["connection_tu2.cpp"], LIBS = BOOST_LIBS_CPP11)
-diff --git a/test/endpoint/SConscript b/test/endpoint/SConscript
-index 5cb3ede91..74912865e 100644
---- a/test/endpoint/SConscript
-+++ b/test/endpoint/SConscript
-@@ -16,7 +16,7 @@ BOOST_LIBS = boostlibs(['unit_test_framework','system'],env) + [platform_libs] +
- objs = env.Object('endpoint_boost.o', ["endpoint.cpp"], LIBS = BOOST_LIBS)
- prgs = env.Program('test_endpoint_boost', ["endpoint_boost.o"], LIBS = BOOST_LIBS)
- 
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework','system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
-    objs += env_cpp11.Object('endpoint_stl.o', ["endpoint.cpp"], LIBS = BOOST_LIBS_CPP11)
-    prgs += env_cpp11.Program('test_endpoint_stl', ["endpoint_stl.o"], LIBS = BOOST_LIBS_CPP11)
-diff --git a/test/extension/SConscript b/test/extension/SConscript
-index d8b425fda..0cb813856 100644
---- a/test/extension/SConscript
-+++ b/test/extension/SConscript
-@@ -17,7 +17,7 @@ objs += env.Object('permessage_deflate_boost.o', ["permessage_deflate.cpp"], LIB
- prgs = env.Program('test_extension_boost', ["extension_boost.o"], LIBS = BOOST_LIBS)
- prgs += env.Program('test_permessage_deflate_boost', ["permessage_deflate_boost.o"], LIBS = BOOST_LIBS)
- 
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs] + ['z']
-    objs += env_cpp11.Object('extension_stl.o', ["extension.cpp"], LIBS = BOOST_LIBS_CPP11)
-    objs += env_cpp11.Object('permessage_deflate_stl.o', ["permessage_deflate.cpp"], LIBS = BOOST_LIBS_CPP11)
-diff --git a/test/http/SConscript b/test/http/SConscript
-index 0a24a8774..422998e24 100644
---- a/test/http/SConscript
-+++ b/test/http/SConscript
-@@ -15,7 +15,7 @@ BOOST_LIBS = boostlibs(['unit_test_framework'],env) + [platform_libs]
- objs = env.Object('parser_boost.o', ["parser.cpp"], LIBS = BOOST_LIBS)
- prgs = env.Program('test_http_boost', ["parser_boost.o"], LIBS = BOOST_LIBS)
- 
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    objs += env_cpp11.Object('parser_stl.o', ["parser.cpp"], LIBS = BOOST_LIBS_CPP11)
-    prgs += env_cpp11.Program('test_http_stl', ["parser_stl.o"], LIBS = BOOST_LIBS_CPP11)
-diff --git a/test/logger/SConscript b/test/logger/SConscript
-index 81d607601..0ccbbc5df 100644
---- a/test/logger/SConscript
-+++ b/test/logger/SConscript
-@@ -15,7 +15,7 @@ BOOST_LIBS = boostlibs(['unit_test_framework','system'],env) + [platform_libs]
- objs = env.Object('logger_basic_boost.o', ["basic.cpp"], LIBS = BOOST_LIBS)
- prgs = env.Program('logger_basic_boost', ["logger_basic_boost.o"], LIBS = BOOST_LIBS)
- 
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework','system'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    objs += env_cpp11.Object('logger_basic_stl.o', ["basic.cpp"], LIBS = BOOST_LIBS_CPP11)
-    prgs += env_cpp11.Program('logger_basic_stl', ["logger_basic_stl.o"], LIBS = BOOST_LIBS_CPP11)
-diff --git a/test/message_buffer/SConscript b/test/message_buffer/SConscript
-index 2ef6d71f3..89785cb3e 100644
---- a/test/message_buffer/SConscript
-+++ b/test/message_buffer/SConscript
-@@ -17,7 +17,7 @@ objs += env.Object('alloc_boost.o', ["alloc.cpp"], LIBS = BOOST_LIBS)
- prgs = env.Program('test_message_boost', ["message_boost.o"], LIBS = BOOST_LIBS)
- prgs += env.Program('test_alloc_boost', ["alloc_boost.o"], LIBS = BOOST_LIBS)
- 
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    objs += env_cpp11.Object('message_stl.o', ["message.cpp"], LIBS = BOOST_LIBS_CPP11)
-    objs += env_cpp11.Object('alloc_stl.o', ["alloc.cpp"], LIBS = BOOST_LIBS_CPP11)
-diff --git a/test/processors/SConscript b/test/processors/SConscript
-index 406a7edc9..1b40d0b1d 100644
---- a/test/processors/SConscript
-+++ b/test/processors/SConscript
-@@ -26,7 +26,7 @@ prgs += env.Program('test_hybi07_boost', ["test_hybi07_boost.o"], LIBS = BOOST_L
- prgs += env.Program('test_hybi00_boost', ["test_hybi00_boost.o"], LIBS = BOOST_LIBS)
- prgs += env.Program('test_extension_permessage_compress_boost', ["test_extension_permessage_compress_boost.o"], LIBS = BOOST_LIBS + ['z'])
- 
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs] + ['z']
-    # no C++11 features are used in processor so there are no C++11 versions of
-    # these tests.
-diff --git a/test/random/SConscript b/test/random/SConscript
-index 3cadc9e97..4a11b0ce5 100644
---- a/test/random/SConscript
-+++ b/test/random/SConscript
-@@ -17,7 +17,7 @@ objs += env.Object('random_device_boost.o', ["random_device.cpp"], LIBS = BOOST_
- prgs = env.Program('test_random_none_boost', ["random_none_boost.o"], LIBS = BOOST_LIBS)
- prgs += env.Program('test_random_device_boost', ["random_device_boost.o"], LIBS = BOOST_LIBS)
- 
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    objs += env_cpp11.Object('random_none_stl.o', ["none.cpp"], LIBS = BOOST_LIBS_CPP11)
-    objs += env_cpp11.Object('random_device_stl.o', ["random_device.cpp"], LIBS = BOOST_LIBS_CPP11)
-diff --git a/test/roles/SConscript b/test/roles/SConscript
-index e86107ece..17b3be105 100644
---- a/test/roles/SConscript
-+++ b/test/roles/SConscript
-@@ -17,7 +17,7 @@ objs += env.Object('server_boost.o', ["server.cpp"], LIBS = BOOST_LIBS)
- prgs = env.Program('test_client_boost', ["client_boost.o"], LIBS = BOOST_LIBS)
- prgs += env.Program('test_server_boost', ["server_boost.o"], LIBS = BOOST_LIBS)
- 
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    objs += env_cpp11.Object('client_stl.o', ["client.cpp"], LIBS = BOOST_LIBS_CPP11)
-    objs += env_cpp11.Object('server_stl.o', ["server.cpp"], LIBS = BOOST_LIBS_CPP11)
-diff --git a/test/transport/SConscript b/test/transport/SConscript
-index 71b31b6c5..aa9b719ec 100644
---- a/test/transport/SConscript
-+++ b/test/transport/SConscript
-@@ -16,7 +16,7 @@ BOOST_LIBS = boostlibs(['unit_test_framework','system','thread','random','chrono
- objs = env.Object('boost_integration.o', ["integration.cpp"], LIBS = BOOST_LIBS)
- prgs = env.Program('test_boost_integration', ["boost_integration.o"], LIBS = BOOST_LIBS)
- 
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework','system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
-    objs += env_cpp11.Object('stl_integration.o', ["integration.cpp"], LIBS = BOOST_LIBS_CPP11)
-    prgs += env_cpp11.Program('test_stl_integration', ["stl_integration.o"], LIBS = BOOST_LIBS_CPP11)
-diff --git a/test/transport/asio/SConscript b/test/transport/asio/SConscript
-index f8185e57e..518d362b1 100644
---- a/test/transport/asio/SConscript
-+++ b/test/transport/asio/SConscript
-@@ -20,7 +20,7 @@ prgs = env.Program('test_base_boost', ["base_boost.o"], LIBS = BOOST_LIBS)
- prgs += env.Program('test_timers_boost', ["timers_boost.o"], LIBS = BOOST_LIBS)
- prgs += env.Program('test_security_boost', ["security_boost.o"], LIBS = BOOST_LIBS)
- 
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework','system'],env_cpp11) + [platform_libs] + [polyfill_libs] + [tls_libs]
-    objs += env_cpp11.Object('base_stl.o', ["base.cpp"], LIBS = BOOST_LIBS_CPP11)
-    objs += env_cpp11.Object('timers_stl.o', ["timers.cpp"], LIBS = BOOST_LIBS_CPP11)
-diff --git a/test/transport/iostream/SConscript b/test/transport/iostream/SConscript
-index 9e74c2f15..dcaf9f2d9 100644
---- a/test/transport/iostream/SConscript
-+++ b/test/transport/iostream/SConscript
-@@ -19,7 +19,7 @@ prgs = env.Program('test_iostream_base_boost', ["iostream_base_boost.o"], LIBS =
- prgs += env.Program('test_iostream_connection_boost', ["iostream_connection_boost.o"], LIBS = BOOST_LIBS)
- prgs += env.Program('test_iostream_endpoint_boost', ["iostream_endpoint_boost.o"], LIBS = BOOST_LIBS)
- 
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    objs += env_cpp11.Object('iostream_base_stl.o', ["base.cpp"], LIBS = BOOST_LIBS_CPP11)
-    objs += env_cpp11.Object('iostream_connection_stl.o', ["connection.cpp"], LIBS = BOOST_LIBS_CPP11)
-diff --git a/test/utility/SConscript b/test/utility/SConscript
-index 80e9ef6c8..6f19aa52a 100644
---- a/test/utility/SConscript
-+++ b/test/utility/SConscript
-@@ -24,7 +24,7 @@ prgs += env.Program('test_close_boost', ["close_boost.o"], LIBS = BOOST_LIBS)
- prgs += env.Program('test_sha1_boost', ["sha1_boost.o"], LIBS = BOOST_LIBS)
- prgs += env.Program('test_error_boost', ["error_boost.o"], LIBS = BOOST_LIBS)
- 
--if env_cpp11.has_key('WSPP_CPP11_ENABLED'):
-+if 'WSPP_CPP11_ENABLED' in env_cpp11:
-    BOOST_LIBS_CPP11 = boostlibs(['unit_test_framework'],env_cpp11) + [platform_libs] + [polyfill_libs]
-    objs += env_cpp11.Object('utilities_stl.o', ["utilities.cpp"], LIBS = BOOST_LIBS_CPP11)
-    objs += env_cpp11.Object('uri_stl.o', ["uri.cpp"], LIBS = BOOST_LIBS_CPP11)
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch
deleted file mode 100644
index 68cb645b40..0000000000
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 3590d77bb9753fbbf076028e2395182ced6466ba Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Wed, 8 Jan 2020 17:59:48 +0100
-Subject: [PATCH] Fix cmake find boost with version >= 1.71
-
-For some reasons "system;thread;random;unit_test_framework" was seen as a single module, because of the quotes.
----
-Upstream-Status: Pending
-
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2d13117b..9a46bc10 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -217,7 +217,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
-     set (Boost_USE_MULTITHREADED TRUE)
-     set (Boost_ADDITIONAL_VERSIONS "1.39.0" "1.40.0" "1.41.0" "1.42.0" "1.43.0" "1.44.0" "1.46.1") # todo: someone who knows better spesify these!
- 
--    find_package (Boost 1.39.0 COMPONENTS "${WEBSOCKETPP_BOOST_LIBS}")
-+    find_package (Boost 1.39.0 COMPONENTS ${WEBSOCKETPP_BOOST_LIBS})
- 
-     if (Boost_FOUND)
-         # Boost is a project wide global dependency.
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/857.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/857.patch
deleted file mode 100644
index 401a614dc1..0000000000
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/857.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 931a55347a322f38eb82d5f387b2924e6c7a1746 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Thu, 9 Jan 2020 10:07:20 +0100
-Subject: [PATCH] Update SConstruct with new Python3 syntax: - new raise
- keyword syntax - has_key deprecated method is now removed - commands
- deprecated library is replaced by subprocess - print function fixes
-
-This should fix FTBFS against new scons 3.1.2
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=947584
----
-Upstream-Status: Pending
-
- SConstruct | 45 +++++++++++++++++++++++----------------------
- 1 file changed, 23 insertions(+), 22 deletions(-)
-
-diff --git a/SConstruct b/SConstruct
-index ae3df10b..9d1c8914 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -1,18 +1,19 @@
--import os, sys, commands
-+import os, sys
-+from subprocess import check_output
- env = Environment(ENV = os.environ)
- 
- # figure out a better way to configure this
--if os.environ.has_key('CXX'):
-+if 'CXX' in os.environ:
-     env['CXX'] = os.environ['CXX']
- 
--if os.environ.has_key('DEBUG'):
-+if 'DEBUG' in os.environ:
-     env['DEBUG'] = os.environ['DEBUG']
- 
--if os.environ.has_key('CXXFLAGS'):
-+if 'CXXFLAGS' in os.environ:
-     #env['CXXFLAGS'] = os.environ['CXXFLAGS']
-     env.Append(CXXFLAGS = os.environ['CXXFLAGS'])
- 
--if os.environ.has_key('LINKFLAGS'):
-+if 'LINKFLAGS' in os.environ:
-     #env['LDFLAGS'] = os.environ['LDFLAGS']
-     env.Append(LINKFLAGS = os.environ['LINKFLAGS'])
- 
-@@ -22,24 +23,24 @@ if os.environ.has_key('LINKFLAGS'):
- ## or set BOOST_INCLUDES and BOOST_LIBS if Boost comes with your OS distro e.g. and
- ## needs BOOST_INCLUDES=/usr/include/boost and BOOST_LIBS=/usr/lib like Ubuntu.
- ##
--if os.environ.has_key('BOOSTROOT'):
-+if 'BOOSTROOT' in os.environ:
-     os.environ['BOOST_ROOT'] = os.environ['BOOSTROOT']
- 
--if os.environ.has_key('BOOST_ROOT'):
-+if 'BOOST_ROOT' in os.environ:
-    env['BOOST_INCLUDES'] = os.environ['BOOST_ROOT']
-    env['BOOST_LIBS'] = os.path.join(os.environ['BOOST_ROOT'], 'stage', 'lib')
--elif os.environ.has_key('BOOST_INCLUDES') and os.environ.has_key('BOOST_LIBS'):
-+elif 'BOOST_INCLUDES' in os.environ and 'BOOST_LIBS' in os.environ:
-    env['BOOST_INCLUDES'] = os.environ['BOOST_INCLUDES']
-    env['BOOST_LIBS'] = os.environ['BOOST_LIBS']
- else:
--   raise SCons.Errors.UserError, "Neither BOOST_ROOT, nor BOOST_INCLUDES + BOOST_LIBS was set!"
-+   raise SCons.Errors.UserError("Neither BOOST_ROOT, nor BOOST_INCLUDES + BOOST_LIBS were set!")
- 
- ## Custom OpenSSL
--if os.environ.has_key('OPENSSL_PATH'):
-+if 'OPENSSL_PATH' in os.environ:
-    env.Append(CPPPATH = os.path.join(os.environ['OPENSSL_PATH'], 'include'))
-    env.Append(LIBPATH = os.environ['OPENSSL_PATH'])
- 
--if os.environ.has_key('WSPP_ENABLE_CPP11'):
-+if 'WSPP_ENABLE_CPP11' in os.environ:
-    env['WSPP_ENABLE_CPP11'] = True
- else:
-    env['WSPP_ENABLE_CPP11'] = False
-@@ -76,7 +77,7 @@ if env['PLATFORM'].startswith('win'):
-    env['CCFLAGS'] = '%s /EHsc /GR /GS- /MD /nologo %s %s' % (warn_flags, arch_flags, opt_flags)
-    env['LINKFLAGS'] = '/INCREMENTAL:NO /MANIFEST /NOLOGO /OPT:REF /OPT:ICF /MACHINE:X86'
- elif env['PLATFORM'] == 'posix':
--   if env.has_key('DEBUG'):
-+   if 'DEBUG' in env:
-       env.Append(CCFLAGS = ['-g', '-O0'])
-    else:
-       env.Append(CPPDEFINES = ['NDEBUG'])
-@@ -84,9 +85,9 @@ elif env['PLATFORM'] == 'posix':
-    env.Append(CCFLAGS = ['-Wall'])
-    #env['LINKFLAGS'] = ''
- elif env['PLATFORM'] == 'darwin':
--   if not os.environ.has_key('CXX'):
-+   if not 'CXX' in os.environ:
-       env['CXX'] = "clang++"
--   if env.has_key('DEBUG'):
-+   if 'DEBUG' in env:
-       env.Append(CCFLAGS = ['-g', '-O0'])
-    else:
-       env.Append(CPPDEFINES = ['NDEBUG'])
-@@ -157,29 +158,29 @@ env_cpp11 = env.Clone ()
- 
- if env_cpp11['CXX'].startswith('g++'):
-    # TODO: check g++ version
--   GCC_VERSION = commands.getoutput(env_cpp11['CXX'] + ' -dumpversion')
-+   GCC_VERSION = check_output([env_cpp11['CXX'], '-dumpversion'])
- 
--   if GCC_VERSION > "4.4.0":
--      print "C++11 build environment partially enabled"
-+   if GCC_VERSION.decode('utf-8') > "4.4.0":
-+      print("C++11 build environment partially enabled")
-       env_cpp11.Append(WSPP_CPP11_ENABLED = "true",CXXFLAGS = ['-std=c++0x'],TOOLSET = ['g++'],CPPDEFINES = ['_WEBSOCKETPP_CPP11_STL_'])
-    else:
--      print "C++11 build environment is not supported on this version of G++"
-+      print("C++11 build environment is not supported on this version of G++")
- elif env_cpp11['CXX'].startswith('clang++'):
--   print "C++11 build environment enabled"
-+   print("C++11 build environment enabled")
-    env.Append(CXXFLANGS = ['-stdlib=libc++'],LINKFLAGS=['-stdlib=libc++'])
-    env_cpp11.Append(WSPP_CPP11_ENABLED = "true",CXXFLAGS = ['-std=c++0x','-stdlib=libc++'],LINKFLAGS = ['-stdlib=libc++'],TOOLSET = ['clang++'],CPPDEFINES = ['_WEBSOCKETPP_CPP11_STL_'])
- 
-    # look for optional second boostroot compiled with clang's libc++ STL library
-    # this prevents warnings/errors when linking code built with two different
-    # incompatible STL libraries.
--   if os.environ.has_key('BOOST_ROOT_CPP11'):
-+   if 'BOOST_ROOT_CPP11' in os.environ:
-       env_cpp11['BOOST_INCLUDES'] = os.environ['BOOST_ROOT_CPP11']
-       env_cpp11['BOOST_LIBS'] = os.path.join(os.environ['BOOST_ROOT_CPP11'], 'stage', 'lib')
--   elif os.environ.has_key('BOOST_INCLUDES_CPP11') and os.environ.has_key('BOOST_LIBS_CPP11'):
-+   elif 'BOOST_INCLUDES_CPP11' in os.environ and 'BOOST_LIBS_CPP11' in os.environ:
-       env_cpp11['BOOST_INCLUDES'] = os.environ['BOOST_INCLUDES_CPP11']
-       env_cpp11['BOOST_LIBS'] = os.environ['BOOST_LIBS_CPP11']
- else:
--   print "C++11 build environment disabled"
-+   print("C++11 build environment disabled")
- 
- # if the build system is known to allow the isystem modifier for library include
- # values then use it for the boost libraries. Otherwise just add them to the
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.4-cpprest-lts.bb
similarity index 62%
rename from meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
rename to meta-oe/recipes-support/websocketpp/websocketpp_0.8.4-cpprest-lts.bb
index 17b71411ca..dde4d0b367 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.4-cpprest-lts.bb
@@ -2,16 +2,11 @@ SUMMARY = "C++/Boost Asio based websocket client/server library."
 SECTION = "libs/network"
 HOMEPAGE = "https://github.com/zaphoyd/websocketpp"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=4d168d763c111f4ffc62249870e4e0ea"
+LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=caca8c57fc82d4528bfd694b3de9b7cf"
 
 DEPENDS = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'openssl boost zlib', '', d)} "
 
-SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https;branch=master \
-           file://0001-cmake-Use-GNUInstallDirs.patch \
-           file://855.patch \
-           file://857.patch \
-           file://0001-Correct-clang-compiler-flags.patch \
-           file://1024.patch \
+SRC_URI = "git://github.com/cpprest-lts/websocketpp.git;protocol=https;branch=cpprest-lts \
           "
 
 EXTRA_OECMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-DBUILD_EXAMPLES=ON -DBUILD_TESTS=ON', '', d)} "
@@ -22,8 +17,8 @@ RDEPENDS:${PN}-dev = ""
 # to add this package to an SDK, since it isn't a reverse-dependency of anything, just use something like this:
 # TOOLCHAIN_TARGET_TASK:append = " websocketpp-dev"
 
-# tag 0.8.2
-SRCREV = "56123c87598f8b1dd471be83ca841ceae07f95ba"
+# tag 0.8.4+cpprest-lts
+SRCREV = "c011de4608e8221412f2ea9be5d755a68a4e5e29"
 
 
 inherit cmake
@@ -36,5 +31,3 @@ do_install:append() {
 	install -d ${D}${docdir}/${BPN}
 	cp -R ${S}/examples ${D}${docdir}/${BPN}
 }
-
-SKIP_RECIPE[websocketpp] ?= "Does not work with boost >= 1.87"
-- 
2.43.0

