Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10305.1795752926176496528
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SgoXDRCW;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-380c28f9e35so8568542eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752925; x=1796357725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQHFFY6MBhyJC1R19SBQ0vHfJHo3kSNXQ0CWHyrAoC0=;
        b=SgoXDRCWc3uyUMuAqiBg4tCVNyYyaOJBT750Raa6QKZjsVDJOHhgRa09uJ1wNZ8GK7
         L0Bj6GcoUhpq9tzGvMs+7Yk/hGzUc+AnsAT5gv5vEX7sIShEzPa8x0bsxt8Py8geMaM1
         vFU+2TAxngehVmNhThkYPkVQgAg4TzH+AI2x2G8/b9t1Elqa7Q5xHUjHtSxf05ekjFnt
         ZkRanCp5YdKO+Isu5yI+aV4DH7ZEcMaFvLlROiWvmZMWDWtC0f9cMJI4ordd7VZIYvht
         NrDOCawX0jHmJYYQHal/HZR/QhCGSMfW/nkFOKgMgKV6cTB+9chxIb9fJ0Iapsz+j5xy
         Q5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752925; x=1796357725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eQHFFY6MBhyJC1R19SBQ0vHfJHo3kSNXQ0CWHyrAoC0=;
        b=zdxBKX4DqHLp7dwwedco8BmvZEsJtfp5f4d8TLARJuvEe58zdOcdSBBHz3VyR9U3zu
         raViQmuINbVK7Eyild8nAba9ourPHBYHS0pi+ISDK0xju5fZGaWiiNB2ljLmo34qr/np
         O2y/L7OEj5Rs/Jn7pdiCPNYEJVlT72BeJdeVGgXl2AsrRCCs+WDp8pyYocFw/wr763ZT
         6GLqkCFRzoaoTbe9uc1l6LZqa+7sF/v3cqxPX5j6ohJim2nbZjA0oqpiIcz19MQ+rCUb
         uz31rC8rBTDKJSilW3fZ2fiEi/2404BRoETaM92Mb+X6LhNDJBSXa5Z/7IRoatdF7Lnm
         Yfjg==
X-Gm-Message-State: APuU4Z8Uz8gr+1aXVUDZ2jmYdbxgAfEdJm3m4wP3Z7nO2TdezzJLZfvX
	6ezLf//7y+b+KiJOLXg16q+V9gDX4Twev0063CjxSAO5wToaz+QPkZSJ5LxbTplW
X-Gm-Gg: AZFdTZcS7raUypc2paR+k4wr08b8Er26Wid7L6e/rUaNZpDjnT+YzonLOL7xSJbSNCG
	ZXn4HxDiefYn/28E+1GiNKC0qIXEG2SgJJZG56uQP4H+Nn/PMsnPy3wUFtYP9JlVWzzqA5KRmFZ
	d5Fg6D1N/GZVvCIfkWjV85wvHzvi/YofJxJH/7G+rCgxKDG2qL1N5zidGjZ6GHzVJF41XdteHCu
	d7gQFPsg/b+574rj5NIqyPnZdJgw7uWwc6gRVX4ByPaN4cxP4nARz55QYXeoyE2mBe+0ZBFl3HB
	WS6elEkzexLTvRQgREEeel1aG69oUSxU8q79PYhDHmXFGdaa5HZSd2GCM0wpJ9CFReq/UZLRR5W
	cR1Esr9CpQMTat7GXtEGe6lHW/Liqx0AB9U2aY54Xzd2QZLLKQGaa0bcQO+Hm+8/mFU10cRybzD
	jPv4MJGMxWajx3s6xdgLEHSmFnGlDUFaSCL28PdkUywfTOhSsUgP6BSmx7OXGWUt1qWmKOhhDrg
	VMPqRC9w6LLkX8kLUvE/7RSFTTxglYhnLJ0+y3AAWWrB3KXwsAi25pJnhzWH6S1R0EAyZJRalqU
	vLwUPJC+3+VhV6lLsqb9GMwMQsjWqzHqNidc1x6wbYua0qaT1rtbiT8Mi3dRNS2W+5oyeztVhhH
	bHerHPVZJurzUgen0tWvmdd8XX3Ql7p6bgWinshSh3OeVay9MI+8U8q1qFJsMIgUVrViOkpWY8r
	QYvnPWtcpL01v5QNzp6itrlecrqqk4fr8TtlxvH3vmVM7PHguN0OI2zdfUizAgkxNqBIqhPg690
	Qh370PKea7WCvDwlcqFhqsnctxPG+aRrCVQAxseAbTwkGxgDd6pArOAgj++A2b/UzZIiLRjSGwE
	FWtpEteECuFOg2GwUBLWNH4ijA==
X-Received: by 2002:a05:7300:d589:b0:386:9ff1:7f7d with SMTP id 5a478bee46e88-3869ff18213mr19784308eec.4.1795752925215;
        Thu, 26 Nov 2026 20:15:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm60340062eec.8.2026.11.26.20.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/8] suitesparse: upgrade 5.10.1 -> 7.14.1
Date: Thu, 26 Nov 2026 20:15:12 -0800
Message-ID: <20261127041517.1773986-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
References: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133213
Content-Type: text/plain; charset="utf-8"

- 6.0: CMake build system for all packages; Fortran is optional
- 7.0: SuiteSparse_config struct hidden behind get/set methods;
  UMFPACK gained copy/serialize/deserialize
- CHOLMOD 5: single precision and 32/64-bit integer variants; METIS
  is now internal to CHOLMOD (symbols renamed), libmetis is no
  longer installed; SLIP_LU is replaced by SPEX
- new packages ParU, LAGraph; GraphBLAS 10.5.1 with a CPU JIT
- headers install to include/suitesparse, CMake config and
  pkg-config files are provided; sonames are bumped

The Makefile wrapper is gone, so build with the root CMakeLists.txt
through the cmake class and drop all patches, which only touched
the old Makefiles, bundled metis and the old CMake minimum. Disable
the GraphBLAS JIT (it would build and run a host tool and compile
kernels at run time), CUDA, Fortran, the demos and the SPEX Python
helper library, and pin BLAS discovery to the generic vendor. Do not
set the $ORIGIN install rpath and blank the compiler/flags strings
GraphBLAS records in GB_config.h for the JIT, which would otherwise
leak build paths. OpenMP becomes a PACKAGECONFIG. Default FILES
cover the libraries now, so the explicit list (with the removed
libmetis and libsliplu) is dropped, as is chrpath-native. Add an
upstream version check.

Build only the shared libraries and drop the recipe sysroot paths of
BLAS/LAPACK/GMP/MPFR/OpenMP that SuiteSparse writes into its CMake and
pkg-config files (buildpaths QA warnings).

License-Update: SLIP_LU replaced by SPEX (LGPL-3.0-or-later OR
GPL-2.0-or-later), new ParU (GPL-3.0-or-later) and LAGraph
(BSD-2-Clause) sections, CHOLMOD headers now Apache-2.0, copyright
years updated. LICENSE is re-derived from the per-package licenses
(LGPL-2.0-only was wrong, the LGPL parts are LGPL-2.1-or-later and
the GPL parts are -or-later except Mongoose, GPL-3.0-only).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...XXFLAGS-from-environment-in-Mongoose.patch | 45 ----------
 ...serve-links-when-installing-libmetis.patch | 24 ------
 ...-Add-version-information-to-libmetis.patch | 51 -----------
 .../0004-Allow-build-with-CMake-4.patch       | 86 -------------------
 ...dd-install-rpath-to-shared-libraries.patch | 37 --------
 .../suitesparse/makefile-quoting.patch        | 32 -------
 .../suitesparse/suitesparse_5.10.1.bb         | 69 ---------------
 .../suitesparse/suitesparse_7.14.1.bb         | 48 +++++++++++
 8 files changed, 48 insertions(+), 344 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch
 delete mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch
 delete mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch
 delete mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0004-Allow-build-with-CMake-4.patch
 delete mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0005-Do-not-add-install-rpath-to-shared-libraries.patch
 delete mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/makefile-quoting.patch
 delete mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
 create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse_7.14.1.bb

diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch
deleted file mode 100644
index 47865de858..0000000000
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 83628b471a1a79dae50bb158fca9448b668dd3a6 Mon Sep 17 00:00:00 2001
-From: Gregory Anders <greg@gpanders.com>
-Date: Wed, 21 Oct 2020 10:43:16 -0600
-Subject: [PATCH] Preserve CXXFLAGS from environment in Mongoose
-
-This allows CXXFLAGS set in the environment to also be used in the CMake
-build process, instead of overwriting them. This is useful in a cross
-compile context where the CXXFLAGS variable might contain necessary
-flags for cross compiling.
----
-Upstream-Status: Pending
-
- Mongoose/CMakeLists.txt | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Mongoose/CMakeLists.txt b/Mongoose/CMakeLists.txt
-index 7e134ab..91a7f70 100644
---- a/Mongoose/CMakeLists.txt
-+++ b/Mongoose/CMakeLists.txt
-@@ -321,14 +321,14 @@ add_test(Unit_Test_EdgeSep ./tests/mongoose_unit_test_edgesep)
- message(STATUS "CMAKE_CXX_COMPILER: " ${BoldBlue} ${CMAKE_CXX_COMPILER_ID} ${ColourReset})
- if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang" OR "${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang")
-     # using Clang
--    SET(CMAKE_CXX_FLAGS "-O3 -fwrapv")
-+    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fwrapv")
-     # Debug flags for Clang
-     SET(CMAKE_CXX_FLAGS_DEBUG "--coverage -g -fwrapv")
-     SET(CMAKE_C_FLAGS_DEBUG "--coverage -g")
-     SET(CMAKE_EXE_LINKER_FLAGS_DEBUG "--coverage -g")
- elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
-     # using GCC
--    SET(CMAKE_CXX_FLAGS "-O3 -fwrapv")
-+    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fwrapv")
-     # Debug flags for GCC
-     if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "4.6")
-         set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
-@@ -339,7 +339,7 @@ elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
-     SET(CMAKE_EXE_LINKER_FLAGS_DEBUG "-fprofile-arcs -ftest-coverage")
- elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
-     # using Intel C++
--    SET(CMAKE_CXX_FLAGS "-O3 -no-prec-div -xHOST -ipo -fwrapv")
-+    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -no-prec-div -xHOST -ipo -fwrapv")
-     # Debug flags for Intel
-     SET(CMAKE_CXX_FLAGS_DEBUG "-g -O0 -Wall -fwrapv")
-     SET(CMAKE_C_FLAGS_DEBUG "-g -O0 -Wall")
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch
deleted file mode 100644
index d80c1a7362..0000000000
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 31175fb408a4f5e85e39a9aabd4a29f9d9c1fe25 Mon Sep 17 00:00:00 2001
-From: Gregory Anders <greg@gpanders.com>
-Date: Wed, 21 Oct 2020 15:26:52 -0600
-Subject: [PATCH] Preserve links when installing libmetis
-
----
-Upstream-Status: Pending
-
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 7631955..57fd022 100644
---- a/Makefile
-+++ b/Makefile
-@@ -76,7 +76,7 @@ ifeq (,$(MY_METIS_LIB))
- 	@mkdir -p $(INSTALL_LIB)
- 	@mkdir -p $(INSTALL_INCLUDE)
- 	@mkdir -p $(INSTALL_DOC)
--	- $(CP) lib/libmetis.* $(INSTALL_LIB)
-+	- $(CP) -d lib/libmetis.* $(INSTALL_LIB)
- 	- $(CP) metis-5.1.0/manual/manual.pdf $(INSTALL_DOC)/METIS_manual.pdf
- 	- $(CP) metis-5.1.0/README.txt $(INSTALL_DOC)/METIS_README.txt
-         # the following is needed only on the Mac, so *.dylib is hardcoded:
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch
deleted file mode 100644
index fc83897a05..0000000000
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 11ab355fdda93b762fcc07ac3f7c6ab1be0a5f5a Mon Sep 17 00:00:00 2001
-From: Gregory Anders <greg@gpanders.com>
-Date: Wed, 21 Oct 2020 15:27:07 -0600
-Subject: [PATCH] Add version information to libmetis
-
----
-Upstream-Status: Pending
-
- metis-5.1.0/Makefile                | 8 ++++----
- metis-5.1.0/libmetis/CMakeLists.txt | 1 +
- 2 files changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/metis-5.1.0/Makefile b/metis-5.1.0/Makefile
-index 9cc03b9..c445d85 100644
---- a/metis-5.1.0/Makefile
-+++ b/metis-5.1.0/Makefile
-@@ -18,8 +18,11 @@ systype = $(shell uname -s)
- 
- BUILDDIR = build/$(systype)-$(cputype)
- 
-+VERNUM=5.1.0
-+PKGNAME=metis-$(VERNUM)
-+
- # Process configuration options.
--CONFIG_FLAGS = 
-+CONFIG_FLAGS = -DMETIS_VERSION=$(VERNUM)
- ifeq ($(gklib_path), not-set)
-     gklib_path = GKlib
- endif
-@@ -52,9 +55,6 @@ ifneq ($(cc), not-set)
-     CONFIG_FLAGS += -DCMAKE_C_COMPILER=$(cc)
- endif
- 
--VERNUM=5.1.0
--PKGNAME=metis-$(VERNUM)
--
- JOBS ?= 1
- 
- define run-config
-diff --git a/metis-5.1.0/libmetis/CMakeLists.txt b/metis-5.1.0/libmetis/CMakeLists.txt
-index 120e94d..11bde87 100644
---- a/metis-5.1.0/libmetis/CMakeLists.txt
-+++ b/metis-5.1.0/libmetis/CMakeLists.txt
-@@ -4,6 +4,7 @@ include_directories(.)
- file(GLOB metis_sources *.c)
- # Build libmetis.
- add_library(metis ${METIS_LIBRARY_TYPE} ${GKlib_sources} ${metis_sources})
-+set_target_properties(metis PROPERTIES VERSION ${METIS_VERSION})
- if(UNIX)
-   target_link_libraries(metis m)
- endif()
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0004-Allow-build-with-CMake-4.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/0004-Allow-build-with-CMake-4.patch
deleted file mode 100644
index 5fc3f666c3..0000000000
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse/0004-Allow-build-with-CMake-4.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 57e1fd1a4bf7878136a9f5070dadb310f233f489 Mon Sep 17 00:00:00 2001
-From: Tim Davis <DrTimothyAldenDavis@gmail.com>
-Date: Wed, 9 Mar 2022 10:33:33 -0600
-Subject: [PATCH] require cmake 3.13
-
-Upstream-Status: Backport [https://github.com/DrTimothyAldenDavis/SuiteSparse/commit/ae0be0028e68d429feb565f093aec875235447cc]
-Backport-Changes:
- * Also update the two bundled GraphBLAS CMake entry points reached by
-   the SuiteSparse 5.10.1 build.
- * Preserve the METIS_VERSION value supplied by the existing OE patch
-   after CMake policy CMP0048 becomes NEW.
-
-(cherry picked from commit ae0be0028e68d429feb565f093aec875235447cc)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- GraphBLAS/CMakeLists.txt           | 2 +-
- GraphBLAS/GraphBLAS/CMakeLists.txt | 2 +-
- Mongoose/CMakeLists.txt            | 2 +-
- metis-5.1.0/CMakeLists.txt         | 2 +-
- metis-5.1.0/GKlib/CMakeLists.txt   | 2 +-
- 5 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/GraphBLAS/CMakeLists.txt b/GraphBLAS/CMakeLists.txt
-index 7eb999189..eecfa0ac5 100644
---- a/GraphBLAS/CMakeLists.txt
-+++ b/GraphBLAS/CMakeLists.txt
-@@ -12,7 +12,7 @@
- #-------------------------------------------------------------------------------
- 
- # cmake 3.13 is preferred.
--cmake_minimum_required ( VERSION 2.8.12 )
-+cmake_minimum_required ( VERSION 3.13 )
- 
- message ( STATUS "CMake version: " ${CMAKE_VERSION} )
- 
-diff --git a/GraphBLAS/GraphBLAS/CMakeLists.txt b/GraphBLAS/GraphBLAS/CMakeLists.txt
-index f365251db..26928dc0a 100644
---- a/GraphBLAS/GraphBLAS/CMakeLists.txt
-+++ b/GraphBLAS/GraphBLAS/CMakeLists.txt
-@@ -17,7 +17,7 @@
- #-------------------------------------------------------------------------------
- 
- # cmake 3.13 is preferred.
--cmake_minimum_required ( VERSION 2.8.12 )
-+cmake_minimum_required ( VERSION 3.13 )
- 
- message ( STATUS "CMake version: " ${CMAKE_VERSION} )
- 
-diff --git a/Mongoose/CMakeLists.txt b/Mongoose/CMakeLists.txt
-index 91a7f70ef..361fa1239 100644
---- a/Mongoose/CMakeLists.txt
-+++ b/Mongoose/CMakeLists.txt
-@@ -20,7 +20,7 @@
- #
- #   make distclean
- 
--cmake_minimum_required(VERSION 2.8)
-+cmake_minimum_required(VERSION 3.13)
- include(CMake/cmake_colors.cmake)
- 
- if (POLICY CMP0048)
-diff --git a/metis-5.1.0/CMakeLists.txt b/metis-5.1.0/CMakeLists.txt
-index 318019bfc..1a72ed0d0 100644
---- a/metis-5.1.0/CMakeLists.txt
-+++ b/metis-5.1.0/CMakeLists.txt
-@@ -1,5 +1,5 @@
--cmake_minimum_required(VERSION 2.8)
--project(METIS)
-+cmake_minimum_required(VERSION 3.13)
-+project(METIS VERSION ${METIS_VERSION})
- 
- set(GKLIB_PATH "GKlib" CACHE PATH "path to GKlib")
- set(SHARED FALSE CACHE BOOL "build a shared library")
-diff --git a/metis-5.1.0/GKlib/CMakeLists.txt b/metis-5.1.0/GKlib/CMakeLists.txt
-index 67b600aa6..2f4ae75d7 100644
---- a/metis-5.1.0/GKlib/CMakeLists.txt
-+++ b/metis-5.1.0/GKlib/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 2.8)
-+cmake_minimum_required(VERSION 3.13)
- project(GKlib)
- 
- get_filename_component(abs "." ABSOLUTE)
--- 
-2.35.6
-
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0005-Do-not-add-install-rpath-to-shared-libraries.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/0005-Do-not-add-install-rpath-to-shared-libraries.patch
deleted file mode 100644
index a6105f73f8..0000000000
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse/0005-Do-not-add-install-rpath-to-shared-libraries.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f8be0a727c506d25450386c370a846e66b3f3297 Mon Sep 17 00:00:00 2001
-From: Deepak Rathore <deeratho@cisco.com>
-Date: Wed, 5 Aug 2026 00:00:00 -0700
-Subject: [PATCH] Do not add install rpath to shared libraries
-
-SuiteSparse adds the install library directory to Linux shared library
-links through -Wl,-rpath=$(INSTALL_LIB). In Yocto builds INSTALL_LIB
-resolves to a build or install path under TMPDIR, so the final ELF files
-keep an absolute TMPDIR path in .dynstr even after chrpath removes the
-dynamic rpath tag.
-
-Yocto stages dependent SuiteSparse libraries through normal sysroot and
-package runtime dependencies. The install-tree rpath is not required for
-packaged target libraries, and it makes buildpaths QA fail.
-
-Upstream-Status: Inappropriate [oe-specific: build/install path triggers buildpaths QA]
-
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- SuiteSparse_config/SuiteSparse_config.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/SuiteSparse_config/SuiteSparse_config.mk b/SuiteSparse_config/SuiteSparse_config.mk
-index 8309c5142..807323c4c 100644
---- a/SuiteSparse_config/SuiteSparse_config.mk
-+++ b/SuiteSparse_config/SuiteSparse_config.mk
-@@ -358,7 +358,7 @@ SUITESPARSE_VERSION = 5.10.1
- 
-     ifeq ($(UNAME),Linux)
-         # add the realtime library, librt, and SuiteSparse/lib
--        LDLIBS += -lrt -Wl,-rpath=$(INSTALL_LIB)
-+        LDLIBS += -lrt
-     endif
- 
-     #---------------------------------------------------------------------------
--- 
-2.43.0
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/makefile-quoting.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/makefile-quoting.patch
deleted file mode 100644
index 6bd2ffbb55..0000000000
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse/makefile-quoting.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-OE's CC and CXX contain spaces and extra options which is incompatible with 
-cmake way of handling them. Remove passing the compiler options this way in
-favour of our normal cmake toolchain files added elsewhere.
-
-Upstream-Status: Pending
-
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -282,7 +282,7 @@ metis: include/metis.h
- # hardcoded below.
- include/metis.h:
- ifeq (,$(MY_METIS_LIB))
--	- ( cd metis-5.1.0 && $(MAKE) config shared=1 prefix=$(SUITESPARSE) cc=$(CC) )
-+	- ( cd metis-5.1.0 && $(MAKE) config shared=1 prefix=$(SUITESPARSE) )
- 	- ( cd metis-5.1.0 && $(MAKE) )
- 	- ( cd metis-5.1.0 && $(MAKE) install )
- 	- $(SO_INSTALL_NAME) $(SUITESPARSE)/lib/libmetis.dylib \
-Index: git/SuiteSparse_config/SuiteSparse_config.mk
-===================================================================
---- git.orig/SuiteSparse_config/SuiteSparse_config.mk
-+++ git/SuiteSparse_config/SuiteSparse_config.mk
-@@ -146,7 +146,7 @@ SUITESPARSE_VERSION = 5.10.1
-         endif
-     endif
- 
--    CMAKE_OPTIONS += -DCMAKE_CXX_COMPILER=$(CXX) -DCMAKE_C_COMPILER=$(CC)
-+    #CMAKE_OPTIONS += -DCMAKE_CXX_COMPILER=$(CXX) -DCMAKE_C_COMPILER=$(CC)
- 
-     #---------------------------------------------------------------------------
-     # CFLAGS for the C/C++ compiler
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
deleted file mode 100644
index a2fee6400c..0000000000
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
+++ /dev/null
@@ -1,69 +0,0 @@
-LICENSE = "Apache-2.0 AND BSD-3-Clause AND GPL-2.0-only AND GPL-3.0-only AND LGPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5fa987762101f748a6cdd951b64ffc6b"
-SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https;branch=stable \
-           file://0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch \
-           file://0002-Preserve-links-when-installing-libmetis.patch \
-           file://0003-Add-version-information-to-libmetis.patch \
-           file://makefile-quoting.patch \
-           file://0004-Allow-build-with-CMake-4.patch \
-           file://0005-Do-not-add-install-rpath-to-shared-libraries.patch \
-           "
-SRCREV = "538273cfd53720a10e34a3d80d3779b607e1ac26"
-
-
-DEPENDS = "cmake-native lapack gmp mpfr chrpath-native"
-
-PROVIDES = "mongoose graphblas"
-RPROVIDES:${PN} = "mongoose graphblas"
-
-inherit cmake
-
-B = "${S}"
-
-export CMAKE_OPTIONS = " \
-    -DCMAKE_INSTALL_PREFIX=${D}${prefix} \
-    -DCMAKE_INSTALL_LIBDIR=${baselib} \
-"
-
-OECMAKE_SOURCEPATH = "${S}/Mongoose ${S}/metis-5.1.0 ${S}/GraphBLAS"
-
-do_compile () {
-	oe_runmake library
-}
-
-do_install () {
-	oe_runmake prefix=${D}${prefix} INSTALL=${D}${prefix} install
-
-        # Remove runtime paths from shared libraries
-        for file in ${D}${libdir}/*.so.*; do
-            if [ ! -L "$file" ]; then
-                chrpath -d "$file"
-            fi
-        done
-}
-
-FILES:${PN} += " \
-    ${libdir}/libmongoose.so.* \
-    ${libdir}/libgraphblas.so.* \
-    ${libdir}/libmetis.so.* \
-    ${libdir}/libsuitesparseconfig.so.* \
-    ${libdir}/libamd.so.* \
-    ${libdir}/libbtf.so.* \
-    ${libdir}/libcamd.so.* \
-    ${libdir}/libccolamd.so.* \
-    ${libdir}/libcolamd.so.* \
-    ${libdir}/libcholmod.so.* \
-    ${libdir}/libcxsparse.so.* \
-    ${libdir}/libldl.so.* \
-    ${libdir}/libklu.so.* \
-    ${libdir}/libumfpack.so.* \
-    ${libdir}/librbio.so.* \
-    ${libdir}/libspqr.so.* \
-    ${libdir}/libsliplu.so.* \
-    ${bindir}/mongoose \
-"
-
-FILES:${PN}-staticdev += "${libdir}/libmongoose.a"
-FILES:${PN}-dev += "${includedir} ${libdir}/*.so"
-
-EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_7.14.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_7.14.1.bb
new file mode 100644
index 0000000000..334f5bbf04
--- /dev/null
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_7.14.1.bb
@@ -0,0 +1,48 @@
+SUMMARY = "Suite of sparse matrix algorithms"
+HOMEPAGE = "https://people.engr.tamu.edu/davis/suitesparse.html"
+LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND GPL-2.0-or-later AND GPL-3.0-only AND GPL-3.0-or-later AND LGPL-2.1-or-later AND (LGPL-3.0-or-later OR GPL-2.0-or-later)"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9a78501f72366f5b3d08a496c9df9fee"
+
+SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https;branch=stable;tag=v${PV}"
+SRCREV = "e202a5bcef55f5a780c26830ebd6ff13af193baf"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
+DEPENDS = "lapack gmp mpfr"
+
+PROVIDES = "mongoose graphblas"
+RPROVIDES:${PN} = "mongoose graphblas"
+
+inherit cmake
+
+EXTRA_OECMAKE = " \
+    -DBLA_VENDOR=Generic \
+    -DBUILD_STATIC_LIBS=OFF \
+    -DCMAKE_SKIP_INSTALL_RPATH=ON \
+    -DGRAPHBLAS_USE_JIT=OFF \
+    -DSUITESPARSE_DEMOS=OFF \
+    -DSUITESPARSE_USE_CUDA=OFF \
+    -DSUITESPARSE_USE_FORTRAN=OFF \
+    -DSUITESPARSE_USE_PYTHON=OFF \
+"
+
+SUITESPARSE_OPENMP_DEPS = ""
+SUITESPARSE_OPENMP_DEPS:toolchain-clang = "openmp"
+
+PACKAGECONFIG ??= "openmp"
+PACKAGECONFIG[openmp] = "-DSUITESPARSE_USE_OPENMP=ON,-DSUITESPARSE_USE_OPENMP=OFF,${SUITESPARSE_OPENMP_DEPS}"
+
+do_configure:append() {
+    # GB_config.h embeds the compiler and flags for the JIT, which is disabled
+    sed -i -e '/^#define GB_\(C_COMPILER\|C_FLAGS\|C_LINK_FLAGS\|OMP_INC\|OMP_INC_DIRS\|C_LIBRARIES\|CMAKE_LIBRARIES\) /s/".*"/""/' \
+        ${S}/GraphBLAS/Config/GB_config.h
+}
+
+do_install:append() {
+    # Drop recipe sysroot paths of dependencies from the CMake and pkg-config files
+    sed -i -e 's#;${RECIPE_SYSROOT}${includedir}##g' -e 's#"${RECIPE_SYSROOT}${includedir};*#"#g' \
+        ${D}${libdir}/cmake/*/*.cmake
+    sed -i -e 's#${RECIPE_SYSROOT}${libdir}/lib\([^/ ]*\)\.so#-l\1#g' ${D}${libdir}/pkgconfig/*.pc
+}
+
+EXCLUDE_FROM_WORLD = "1"
