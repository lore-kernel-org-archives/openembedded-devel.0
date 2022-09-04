Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97DDECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:34 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.11503.1662276926122948832
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PxTyMW5P;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so176091pjm.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=O9KQ14CvNTguZ23l3XKd6uf/JOSFGb8piXG3J8ofS0A=;
        b=PxTyMW5PcAollIEYYML8h2b00DSNx9eEBtakYaBN2LPgaNLvXeSrV5kr71FcTzjL94
         AHo8i4yDdX4Bsgl7IxruKWdWPKBye/5A1I8oKXLImWRVhutGrs/yJFNG1mRhycHlapAY
         yGJTpAeoC/QbaWHR3zO43UDf6w4tc6yerBkKwDaZ3zaw9z5Yt2t+b+f0ze9z+2bg+M7q
         1+wylVra8LbJpioIkkWOFvZAcMf/LLiZRyFFs6gBmkdOk/6yUCHEOLhuAHeGZIFJ2vZO
         E19a+NGorcgEQH0qkcxCuLLNHIssSQThDNt8zEGOI8CvwZc8EYa0Qnd6Ah2GW53BMSfo
         bLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=O9KQ14CvNTguZ23l3XKd6uf/JOSFGb8piXG3J8ofS0A=;
        b=WZ4iJv9nXpChE8W54OFx+ndKBWD4rhmQTRcsF/I7DPzePdn8/x+EN9ulOJwGOAvZ7R
         3NmliFhdRbuLS+v7PAg1oN3IH2R0Nommmea+TsiAlSJRLyCpUI6uGPgZ7e3Yzc35pFts
         SxCdH7qTirtaXLzB0HwYT7NxtO1AepHGFQGRLnsoRhhQE+sPkN6KZrmbvvqAQ+qXrGkb
         piZGYOmXdvDE9VAZHBIzDWtGP6tln9fmrHIvvvy67N8G1UgYIw5hL4Kg07vK2z48zDAu
         /92QdqHclTwN2DIbIbcIVdOdX1+KFG4aO95dXG59Rf17PiZX9uPhXGZ+i39arRGp8alN
         OsAQ==
X-Gm-Message-State: ACgBeo3YyLzA2YZjt2hqC2swTFC+ZnhbgVggUBGB653frdsCzqTCVW30
	wPvHoa6AimnXEmdScFkutuwD7IGVU/q2JA==
X-Google-Smtp-Source: 
 AA6agR4E/LM5yh265mUt18Fsp8FyNuKoh2lLlR5IPmHuGBBlH7JgES4/DhPoEKGcu/FgV+evFoNmrw==
X-Received: by 2002:a17:90b:1d01:b0:1fe:56b:530d with SMTP id
 on1-20020a17090b1d0100b001fe056b530dmr12989489pjb.215.1662276923842;
        Sun, 04 Sep 2022 00:35:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 62/63] hdf5: Upgrade to 1.13.2
Date: Sun,  4 Sep 2022 00:34:16 -0700
Message-Id: <20220904073417.3251865-62-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98657

License-Update: Add attribution to Lawrence Livermore
National Laboratory and the United States Department of Energy

Drop the Advertizing Clause from COPYING

Forward port patches

Drop 0001-cross-compiling-support.patch
bring in qemu usermode to do runtime pieces of build

Delete cached source files, as they are no longer needed

Upgrade version info in python3-h5py as well to match the upgraded
version number

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-cmake-remove-build-flags.patch |  55 +-
 .../files/0001-cross-compiling-support.patch  |  68 --
 ...ffix-shared-from-shared-library-name.patch |  15 +-
 .../recipes-support/hdf5/files/H5Tinit-32.c   | 975 -----------------
 .../recipes-support/hdf5/files/H5Tinit-64.c   | 991 ------------------
 .../hdf5/files/H5lib_settings.c               |  98 --
 meta-oe/recipes-support/hdf5/hdf5_1.13.2.bb   |  54 +
 meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb   |  59 --
 .../python/python3-h5py_3.7.0.bb              |   2 +-
 9 files changed, 85 insertions(+), 2232 deletions(-)
 delete mode 100644 meta-oe/recipes-support/hdf5/files/0001-cross-compiling-support.patch
 delete mode 100755 meta-oe/recipes-support/hdf5/files/H5Tinit-32.c
 delete mode 100644 meta-oe/recipes-support/hdf5/files/H5Tinit-64.c
 delete mode 100644 meta-oe/recipes-support/hdf5/files/H5lib_settings.c
 create mode 100644 meta-oe/recipes-support/hdf5/hdf5_1.13.2.bb
 delete mode 100644 meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb

diff --git a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
index 288e642fc7..b896770d91 100644
--- a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
+++ b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
@@ -13,53 +13,46 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  config/cmake/libhdf5.settings.cmake.in | 12 ++++++------
  2 files changed, 7 insertions(+), 7 deletions(-)
 
-diff --git a/config/cmake/libh5cc.in b/config/cmake/libh5cc.in
-index f462d56..93c7137 100644
 --- a/config/cmake/libh5cc.in
 +++ b/config/cmake/libh5cc.in
-@@ -29,4 +29,4 @@ printf 'dir is %s\n' "$dir"
- 
- export PKG_CONFIG_PATH=$dir/lib/pkgconfig
- 
--@_PKG_CONFIG_COMPILER@ `pkg-config --define-variable=prefix=$dir --cflags --libs @_PKG_CONFIG_LIBNAME@-@_PKG_CONFIG_VERSION@` $@
-+`pkg-config --define-variable=prefix=$dir --cflags --libs @_PKG_CONFIG_LIBNAME@-@_PKG_CONFIG_VERSION@` $@
-diff --git a/config/cmake/libhdf5.settings.cmake.in b/config/cmake/libhdf5.settings.cmake.in
-index c337dea..0ab9066 100644
+@@ -45,7 +45,7 @@ for arg in $@ ; do
+       exit $status
+       ;;
+     *)
+-      @_PKG_CONFIG_COMPILER@ $@ `pkg-config --define-variable=prefix=$dir --cflags --libs @_PKG_CONFIG_LIBNAME@`
++      `pkg-config --define-variable=prefix=$dir --cflags --libs @_PKG_CONFIG_LIBNAME@-@_PKG_CONFIG_VERSION@` $@
+       status=$?
+       exit $status
+       ;;
 --- a/config/cmake/libhdf5.settings.cmake.in
 +++ b/config/cmake/libhdf5.settings.cmake.in
-@@ -16,8 +16,8 @@ General Information:
- Compiling Options:
- ------------------
-                Compilation Mode: @CMAKE_BUILD_TYPE@ @CMAKE_C_COMPILER_VERSION@
--                     C Compiler: @CMAKE_C_COMPILER@
--                         CFLAGS: @CMAKE_C_FLAGS@
-+                     C Compiler:
-+                         CFLAGS:
-                       H5_CFLAGS: @H5_CFLAGS@
-                       AM_CFLAGS: @AM_CFLAGS@
-                        CPPFLAGS: @CPPFLAGS@
-@@ -29,8 +29,8 @@ Compiling Options:
-                         LDFLAGS: @CMAKE_SHARED_LINKER_FLAGS@
+@@ -27,14 +27,14 @@ Linking Options:
+                      H5_LDFLAGS: @H5_LDFLAGS@
                       AM_LDFLAGS: @AM_LDFLAGS@
                  Extra libraries: @LINK_LIBS@
 -                       Archiver: @CMAKE_AR@
 -                         Ranlib: @CMAKE_RANLIB@
 +                       Archiver:
 +                         Ranlib:
-               Debugged Packages: @DEBUG_PKG@
-                     API Tracing: @HDF5_ENABLE_TRACE@
  
-@@ -46,8 +46,8 @@ Languages:
- @BUILD_FORTRAN_CONDITIONAL_TRUE@         Static Fortran Library: YES
+ Languages:
+ ----------
+                               C: YES
+-                     C Compiler: @CMAKE_C_COMPILER@ @CMAKE_C_COMPILER_VERSION@
+-                       CPPFLAGS: @CPPFLAGS@
++                     C Compiler:
++                       CPPFLAGS:
+                     H5_CPPFLAGS: @H5_CPPFLAGS@
+                     AM_CPPFLAGS: @AM_CPPFLAGS@
+                          CFLAGS: @CMAKE_C_FLAGS@
+@@ -52,8 +52,8 @@ Languages:
+ @BUILD_FORTRAN_CONDITIONAL_TRUE@         Static Fortran Library: @H5_ENABLE_STATIC_LIB@
  
                              C++: @HDF5_BUILD_CPP_LIB@
 -@BUILD_CXX_CONDITIONAL_TRUE@                   C++ Compiler: @CMAKE_CXX_COMPILER@ @CMAKE_CXX_COMPILER_VERSION@
 -@BUILD_CXX_CONDITIONAL_TRUE@                      C++ Flags: @CMAKE_CXX_FLAGS@
 +@BUILD_CXX_CONDITIONAL_TRUE@                   C++ Compiler:
 +@BUILD_CXX_CONDITIONAL_TRUE@                      C++ Flags:
- @BUILD_CXX_CONDITIONAL_TRUE@                   H5 C++ Flags: @H5_CXXFLAGS@
+ @BUILD_CXX_CONDITIONAL_TRUE@                   H5 C++ Flags: @HDF5_CMAKE_CXX_FLAGS@
  @BUILD_CXX_CONDITIONAL_TRUE@                   AM C++ Flags: @AM_CXXFLAGS@
  @BUILD_CXX_CONDITIONAL_TRUE@             Shared C++ Library: @H5_ENABLE_SHARED_LIB@
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/hdf5/files/0001-cross-compiling-support.patch b/meta-oe/recipes-support/hdf5/files/0001-cross-compiling-support.patch
deleted file mode 100644
index bdc1fa5f96..0000000000
--- a/meta-oe/recipes-support/hdf5/files/0001-cross-compiling-support.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 1b4fadf550587b46e405d7ccb777dcb00aa791a2 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 29 Jan 2019 15:39:15 +0800
-Subject: [PATCH 1/2] cross compiling support
-
-Do not generate config files at build time, use pre-generated
-files to instead.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- CMakeLists.txt     |  6 ++++++
- src/CMakeLists.txt | 23 -----------------------
- 2 files changed, 6 insertions(+), 23 deletions(-)
-
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -770,4 +770,10 @@ endif ()
- #-----------------------------------------------------------------------------
- configure_file (${HDF_RESOURCES_DIR}/H5pubconf.h.in ${HDF5_BINARY_DIR}/H5pubconf.h @ONLY)
- 
-+#-----------------------------------------------------------------------------
-+# Copy the pre-generated files in place
-+#-----------------------------------------------------------------------------
-+configure_file(H5Tinit.c H5Tinit.c COPYONLY)
-+configure_file(H5lib_settings.c H5lib_settings.c COPYONLY)
-+
- include (CMakeInstallation.cmake)
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -613,36 +613,9 @@ set (H5_PRIVATE_HEADERS
- #-----------------------------------------------------------------------------
- add_executable (H5detect ${HDF5_SRC_DIR}/H5detect.c)
- TARGET_C_PROPERTIES (H5detect STATIC " " " ")
--if (MSVC OR MINGW)
--  target_link_libraries (H5detect "ws2_32.lib")
--endif ()
--if (CMAKE_SYSTEM_NAME STREQUAL "Emscripten")
--  set_property(TARGET H5detect PROPERTY LINK_FLAGS "-O0")
--endif ()
--
--add_custom_command (
--    OUTPUT ${HDF5_BINARY_DIR}/H5Tinit.c
--    COMMAND $<TARGET_FILE:H5detect>
--    ARGS > ${HDF5_BINARY_DIR}/H5Tinit.c
--    DEPENDS H5detect
--)
- 
- add_executable (H5make_libsettings ${HDF5_SRC_DIR}/H5make_libsettings.c)
- TARGET_C_PROPERTIES (H5make_libsettings STATIC " " " ")
--if (MSVC OR MINGW)
--  target_link_libraries (H5make_libsettings "ws2_32.lib")
--endif ()
--if (CMAKE_SYSTEM_NAME STREQUAL "Emscripten")
--  set_property(TARGET H5make_libsettings PROPERTY LINK_FLAGS "-O0")
--endif ()
--
--add_custom_command (
--    OUTPUT ${HDF5_BINARY_DIR}/H5lib_settings.c
--    COMMAND $<TARGET_FILE:H5make_libsettings>
--    ARGS > ${HDF5_BINARY_DIR}/H5lib_settings.c
--    DEPENDS H5make_libsettings
--    WORKING_DIRECTORY ${HDF5_BINARY_DIR}
--)
- 
- if (GENERATE_ERROR_HEADERS)
-   find_package (Perl)
diff --git a/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch b/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
index 6f893787f8..de052451bd 100644
--- a/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
+++ b/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
@@ -10,20 +10,19 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  CMakeLists.txt | 24 ++++++++++++------------
  1 file changed, 12 insertions(+), 12 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9af14d5..05100e3 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -153,18 +153,18 @@ set (HDF5_F90_TEST_LIB_TARGET     "${HDF5_F90_TEST_LIB_CORENAME}-static")
- set (HDF5_F90_C_TEST_LIB_TARGET   "${HDF5_F90_C_TEST_LIB_CORENAME}-static")
- set (HDF5_HL_F90_LIB_TARGET       "${HDF5_HL_F90_LIB_CORENAME}-static")
- set (HDF5_HL_F90_C_LIB_TARGET     "${HDF5_HL_F90_C_LIB_CORENAME}-static")
+@@ -196,19 +196,19 @@ set (HDF5_HL_F90_C_LIB_TARGET     "${HDF
+ set (HDF5_JAVA_JNI_LIB_TARGET     "${HDF5_JAVA_JNI_LIB_CORENAME}")
+ set (HDF5_JAVA_HDF5_LIB_TARGET    "${HDF5_JAVA_HDF5_LIB_CORENAME}")
+ set (HDF5_JAVA_TEST_LIB_TARGET    "${HDF5_JAVA_TEST_LIB_CORENAME}")
 -set (HDF5_LIBSH_TARGET            "${HDF5_LIB_CORENAME}-shared")
 -set (HDF5_TEST_LIBSH_TARGET       "${HDF5_TEST_LIB_CORENAME}-shared")
 -set (HDF5_CPP_LIBSH_TARGET        "${HDF5_CPP_LIB_CORENAME}-shared")
 -set (HDF5_HL_LIBSH_TARGET         "${HDF5_HL_LIB_CORENAME}-shared")
 -set (HDF5_HL_CPP_LIBSH_TARGET     "${HDF5_HL_CPP_LIB_CORENAME}-shared")
 -set (HDF5_TOOLS_LIBSH_TARGET      "${HDF5_TOOLS_LIB_CORENAME}-shared")
+-set (HDF5_UTILS_LIBSH_TARGET      "${HDF5_UTILS_LIB_CORENAME}-shared")
 -set (HDF5_F90_LIBSH_TARGET        "${HDF5_F90_LIB_CORENAME}-shared")
 -set (HDF5_F90_C_LIBSH_TARGET      "${HDF5_F90_C_LIB_CORENAME}-shared")
 -set (HDF5_F90_TEST_LIBSH_TARGET   "${HDF5_F90_TEST_LIB_CORENAME}-shared")
@@ -36,6 +35,7 @@ index 9af14d5..05100e3 100644
 +set (HDF5_HL_LIBSH_TARGET         "${HDF5_HL_LIB_CORENAME}")
 +set (HDF5_HL_CPP_LIBSH_TARGET     "${HDF5_HL_CPP_LIB_CORENAME}")
 +set (HDF5_TOOLS_LIBSH_TARGET      "${HDF5_TOOLS_LIB_CORENAME}")
++set (HDF5_UTILS_LIBSH_TARGET      "${HDF5_UTILS_LIB_CORENAME}")
 +set (HDF5_F90_LIBSH_TARGET        "${HDF5_F90_LIB_CORENAME}")
 +set (HDF5_F90_C_LIBSH_TARGET      "${HDF5_F90_C_LIB_CORENAME}")
 +set (HDF5_F90_TEST_LIBSH_TARGET   "${HDF5_F90_TEST_LIB_CORENAME}")
@@ -45,6 +45,3 @@ index 9af14d5..05100e3 100644
  
  #-----------------------------------------------------------------------------
  # Define some CMake variables for use later in the project
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/hdf5/files/H5Tinit-32.c b/meta-oe/recipes-support/hdf5/files/H5Tinit-32.c
deleted file mode 100755
index 8057a7ad83..0000000000
--- a/meta-oe/recipes-support/hdf5/files/H5Tinit-32.c
+++ /dev/null
@@ -1,975 +0,0 @@
-/* Generated automatically by H5detect -- do not edit */
-
-
-
-/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
- * Copyright by The HDF Group.                                               *
- * Copyright by the Board of Trustees of the University of Illinois.         *
- * All rights reserved.                                                      *
- *                                                                           *
- * This file is part of HDF5.  The full HDF5 copyright notice, including     *
- * terms governing use, modification, and redistribution, is contained in    *
- * the COPYING file, which can be found at the root of the source code       *
- * distribution tree, or in https://support.hdfgroup.org/ftp/HDF5/releases.  *
- * If you do not have access to either file, you may request a copy from     *
- * help@hdfgroup.org.                                                        *
- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
- *
- * Created:		Mar  5, 2019
- *			root <root@qemuarm>
- *
- * Purpose:		This machine-generated source code contains
- *			information about the various integer and
- *			floating point numeric formats found on this
- *			architecture.  The parameters below should be
- *			checked carefully and errors reported to the
- *			HDF5 maintainer.
- *			
- *			Each of the numeric formats listed below are
- *			printed from most significant bit to least
- *			significant bit even though the actual bytes
- *			might be stored in a different order in
- *			memory.	 The integers above each binary byte
- *			indicate the relative order of the bytes in
- *			memory; little-endian machines have
- *			decreasing numbers while big-endian machines
- *			have increasing numbers.
- *			
- *			The fields of the numbers are printed as
- *			letters with `S' for the mantissa sign bit,
- *			`M' for the mantissa magnitude, and `E' for
- *			the exponent.  The exponent has an associated
- *			bias which can be subtracted to find the
- *			true exponent.	The radix point is assumed
- *			to be before the first `M' bit.	 Any bit
- *			of a floating-point value not falling into one
- *			of these categories is printed as a question
- *			mark.  Bits of integer types are printed as
- *			`I' for 2's complement and `U' for magnitude.
- *			
- *			If the most significant bit of the normalized
- *			mantissa (always a `1' except for `0.0') is
- *			not stored then an `implicit=yes' appears
- *			under the field description.  In thie case,
- *			the radix point is still assumed to be
- *			before the first `M' but after the implicit
- *			bit.
- *
- * Modifications:
- *
- *	DO NOT MAKE MODIFICATIONS TO THIS FILE!
- *	It was generated by code in `H5detect.c'.
- *
- *-------------------------------------------------------------------------
- */
-
-/****************/
-/* Module Setup */
-/****************/
-
-#define H5T_PACKAGE /*suppress error about including H5Tpkg.h*/
-
-
-/***********/
-/* Headers */
-/***********/
-#include "H5private.h"		/* Generic Functions			*/
-#include "H5Eprivate.h"		/* Error handling		  	*/
-#include "H5FLprivate.h"	/* Free Lists				*/
-#include "H5Iprivate.h"		/* IDs			  		*/
-#include "H5Tpkg.h"		/* Datatypes 				*/
-
-
-/****************/
-/* Local Macros */
-/****************/
-
-
-/******************/
-/* Local Typedefs */
-/******************/
-
-
-/********************/
-/* Package Typedefs */
-/********************/
-
-
-/********************/
-/* Local Prototypes */
-/********************/
-
-
-/********************/
-/* Public Variables */
-/********************/
-
-
-/*****************************/
-/* Library Private Variables */
-/*****************************/
-
-
-/*********************/
-/* Package Variables */
-/*********************/
-
-
-
-/*******************/
-/* Local Variables */
-/*******************/
-
-
-
-/*-------------------------------------------------------------------------
- * Function:	H5TN_init_interface
- *
- * Purpose:	Initialize pre-defined native datatypes from code generated
- *              during the library configuration by H5detect.
- *
- * Return:	Success:	non-negative
- *		Failure:	negative
- *
- * Programmer:	Robb Matzke
- *              Wednesday, December 16, 1998
- *
- *-------------------------------------------------------------------------
- */
-herr_t
-H5TN_init_interface(void)
-{
-    H5T_t	*dt = NULL;
-    herr_t	ret_value = SUCCEED;
-
-    FUNC_ENTER_NOAPI(FAIL)
-
-   /*
-    *    0
-    * IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_SCHAR_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_SCHAR_ALIGN_g = 1;
-    H5T_NATIVE_SCHAR_COMP_ALIGN_g = 1;
-
-   /*
-    *    0
-    * UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UCHAR_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UCHAR_ALIGN_g = 1;
-
-   /*
-    *    1        0
-    * IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 2;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 16;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_SHORT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_SHORT_ALIGN_g = 1;
-    H5T_NATIVE_SHORT_COMP_ALIGN_g = 2;
-
-   /*
-    *    1        0
-    * UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 2;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 16;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_USHORT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_USHORT_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_ALIGN_g = 1;
-    H5T_NATIVE_INT_COMP_ALIGN_g = 4;
-
-   /*
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_LONG_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_LONG_ALIGN_g = 1;
-    H5T_NATIVE_LONG_COMP_ALIGN_g = 4;
-
-   /*
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_ULONG_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_ULONG_ALIGN_g = 1;
-
-   /*
-    *    0
-    * IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT8_ALIGN_g = 1;
-
-   /*
-    *    0
-    * UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT8_ALIGN_g = 1;
-
-   /*
-    *    0
-    * IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_LEAST8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_LEAST8_ALIGN_g = 1;
-
-   /*
-    *    0
-    * UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_LEAST8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_LEAST8_ALIGN_g = 1;
-
-   /*
-    *    0
-    * IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_FAST8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_FAST8_ALIGN_g = 1;
-
-   /*
-    *    0
-    * UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_FAST8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_FAST8_ALIGN_g = 1;
-
-   /*
-    *    1        0
-    * IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 2;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 16;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT16_ALIGN_g = 1;
-
-   /*
-    *    1        0
-    * UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 2;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 16;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT16_ALIGN_g = 1;
-
-   /*
-    *    1        0
-    * IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 2;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 16;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_LEAST16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_LEAST16_ALIGN_g = 1;
-
-   /*
-    *    1        0
-    * UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 2;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 16;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_LEAST16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_LEAST16_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_FAST16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_FAST16_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_FAST16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_FAST16_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT32_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT32_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_LEAST32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_LEAST32_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_LEAST32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_LEAST32_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_FAST32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_FAST32_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_FAST32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_FAST32_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT64_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT64_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_LEAST64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_LEAST64_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_LEAST64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_LEAST64_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_FAST64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_FAST64_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_FAST64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_FAST64_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_LLONG_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_LLONG_ALIGN_g = 1;
-    H5T_NATIVE_LLONG_COMP_ALIGN_g = 8;
-
-   /*
-    *    7        6        5        4
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_ULLONG_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_ULLONG_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * SEEEEEEE EMMMMMMM MMMMMMMM MMMMMMMM
-    * Implicit bit? yes
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_FLOAT;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.f.sign = 31;
-    dt->shared->u.atomic.u.f.epos = 23;
-    dt->shared->u.atomic.u.f.esize = 8;
-    dt->shared->u.atomic.u.f.ebias = 0x0000007f;
-    dt->shared->u.atomic.u.f.mpos = 0;
-    dt->shared->u.atomic.u.f.msize = 23;
-    dt->shared->u.atomic.u.f.norm = H5T_NORM_IMPLIED;
-    dt->shared->u.atomic.u.f.pad = H5T_PAD_ZERO;
-    if((H5T_NATIVE_FLOAT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_FLOAT_ALIGN_g = 1;
-    H5T_NATIVE_FLOAT_COMP_ALIGN_g = 4;
-
-   /*
-    *    7        6        5        4
-    * SEEEEEEE EEEEMMMM MMMMMMMM MMMMMMMM
-    *    3        2        1        0
-    * MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM
-    * Implicit bit? yes
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_FLOAT;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.f.sign = 63;
-    dt->shared->u.atomic.u.f.epos = 52;
-    dt->shared->u.atomic.u.f.esize = 11;
-    dt->shared->u.atomic.u.f.ebias = 0x000003ff;
-    dt->shared->u.atomic.u.f.mpos = 0;
-    dt->shared->u.atomic.u.f.msize = 52;
-    dt->shared->u.atomic.u.f.norm = H5T_NORM_IMPLIED;
-    dt->shared->u.atomic.u.f.pad = H5T_PAD_ZERO;
-    if((H5T_NATIVE_DOUBLE_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_DOUBLE_ALIGN_g = 1;
-    H5T_NATIVE_DOUBLE_COMP_ALIGN_g = 8;
-
-   /*
-    *    7        6        5        4
-    * SEEEEEEE EEEEMMMM MMMMMMMM MMMMMMMM
-    *    3        2        1        0
-    * MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM
-    * Implicit bit? yes
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_FLOAT;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.f.sign = 63;
-    dt->shared->u.atomic.u.f.epos = 52;
-    dt->shared->u.atomic.u.f.esize = 11;
-    dt->shared->u.atomic.u.f.ebias = 0x000003ff;
-    dt->shared->u.atomic.u.f.mpos = 0;
-    dt->shared->u.atomic.u.f.msize = 52;
-    dt->shared->u.atomic.u.f.norm = H5T_NORM_IMPLIED;
-    dt->shared->u.atomic.u.f.pad = H5T_PAD_ZERO;
-    if((H5T_NATIVE_LDOUBLE_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_LDOUBLE_ALIGN_g = 1;
-    H5T_NATIVE_LDOUBLE_COMP_ALIGN_g = 8;
-
-    /* Set the native order for this machine */
-    H5T_native_order_g = H5T_ORDER_LE;
-
-    /* Structure alignment for pointers, hvl_t, hobj_ref_t, hdset_reg_ref_t */
-    H5T_POINTER_COMP_ALIGN_g = 4;
-    H5T_HVL_COMP_ALIGN_g = 4;
-    H5T_HOBJREF_COMP_ALIGN_g = 8;
-    H5T_HDSETREGREF_COMP_ALIGN_g = 1;
-
-done:
-    if(ret_value < 0) {
-        if(dt != NULL) {
-            dt->shared = H5FL_FREE(H5T_shared_t, dt->shared);
-            dt = H5FL_FREE(H5T_t, dt);
-        } /* end if */
-    } /* end if */
-
-    FUNC_LEAVE_NOAPI(ret_value);
-} /* end H5TN_init_interface() */
-
-/****************************************/
-/* ALIGNMENT and signal-handling status */
-/****************************************/
-/* Signal() support: yes */
-/* setjmp() support: yes */
-/* longjmp() support: yes */
-/* sigsetjmp() support: yes */
-/* siglongjmp() support: yes */
-/* sigprocmask() support: yes */
-
-/******************************/
-/* signal handlers statistics */
-/******************************/
-/* signal_handlers tested: 15 times */
-/* sigbus_handler called: 5 times */
-/* sigsegv_handler called: 5 times */
-/* sigill_handler called: 5 times */
diff --git a/meta-oe/recipes-support/hdf5/files/H5Tinit-64.c b/meta-oe/recipes-support/hdf5/files/H5Tinit-64.c
deleted file mode 100644
index 85f79a6ae7..0000000000
--- a/meta-oe/recipes-support/hdf5/files/H5Tinit-64.c
+++ /dev/null
@@ -1,991 +0,0 @@
-/* Generated automatically by H5detect -- do not edit */
-
-
-
-/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
- * Copyright by The HDF Group.                                               *
- * Copyright by the Board of Trustees of the University of Illinois.         *
- * All rights reserved.                                                      *
- *                                                                           *
- * This file is part of HDF5.  The full HDF5 copyright notice, including     *
- * terms governing use, modification, and redistribution, is contained in    *
- * the COPYING file, which can be found at the root of the source code       *
- * distribution tree, or in https://support.hdfgroup.org/ftp/HDF5/releases.  *
- * If you do not have access to either file, you may request a copy from     *
- * help@hdfgroup.org.                                                        *
- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
- *
- * Created:		Jan 29, 2019
- *			root <root@qemux86-64>
- *
- * Purpose:		This machine-generated source code contains
- *			information about the various integer and
- *			floating point numeric formats found on this
- *			architecture.  The parameters below should be
- *			checked carefully and errors reported to the
- *			HDF5 maintainer.
- *			
- *			Each of the numeric formats listed below are
- *			printed from most significant bit to least
- *			significant bit even though the actual bytes
- *			might be stored in a different order in
- *			memory.	 The integers above each binary byte
- *			indicate the relative order of the bytes in
- *			memory; little-endian machines have
- *			decreasing numbers while big-endian machines
- *			have increasing numbers.
- *			
- *			The fields of the numbers are printed as
- *			letters with `S' for the mantissa sign bit,
- *			`M' for the mantissa magnitude, and `E' for
- *			the exponent.  The exponent has an associated
- *			bias which can be subtracted to find the
- *			true exponent.	The radix point is assumed
- *			to be before the first `M' bit.	 Any bit
- *			of a floating-point value not falling into one
- *			of these categories is printed as a question
- *			mark.  Bits of integer types are printed as
- *			`I' for 2's complement and `U' for magnitude.
- *			
- *			If the most significant bit of the normalized
- *			mantissa (always a `1' except for `0.0') is
- *			not stored then an `implicit=yes' appears
- *			under the field description.  In thie case,
- *			the radix point is still assumed to be
- *			before the first `M' but after the implicit
- *			bit.
- *
- * Modifications:
- *
- *	DO NOT MAKE MODIFICATIONS TO THIS FILE!
- *	It was generated by code in `H5detect.c'.
- *
- *-------------------------------------------------------------------------
- */
-
-/****************/
-/* Module Setup */
-/****************/
-
-#define H5T_PACKAGE /*suppress error about including H5Tpkg.h*/
-
-
-/***********/
-/* Headers */
-/***********/
-#include "H5private.h"		/* Generic Functions			*/
-#include "H5Eprivate.h"		/* Error handling		  	*/
-#include "H5FLprivate.h"	/* Free Lists				*/
-#include "H5Iprivate.h"		/* IDs			  		*/
-#include "H5Tpkg.h"		/* Datatypes 				*/
-
-
-/****************/
-/* Local Macros */
-/****************/
-
-
-/******************/
-/* Local Typedefs */
-/******************/
-
-
-/********************/
-/* Package Typedefs */
-/********************/
-
-
-/********************/
-/* Local Prototypes */
-/********************/
-
-
-/********************/
-/* Public Variables */
-/********************/
-
-
-/*****************************/
-/* Library Private Variables */
-/*****************************/
-
-
-/*********************/
-/* Package Variables */
-/*********************/
-
-
-
-/*******************/
-/* Local Variables */
-/*******************/
-
-
-
-/*-------------------------------------------------------------------------
- * Function:	H5TN_init_interface
- *
- * Purpose:	Initialize pre-defined native datatypes from code generated
- *              during the library configuration by H5detect.
- *
- * Return:	Success:	non-negative
- *		Failure:	negative
- *
- * Programmer:	Robb Matzke
- *              Wednesday, December 16, 1998
- *
- *-------------------------------------------------------------------------
- */
-herr_t
-H5TN_init_interface(void)
-{
-    H5T_t	*dt = NULL;
-    herr_t	ret_value = SUCCEED;
-
-    FUNC_ENTER_NOAPI(FAIL)
-
-   /*
-    *    0
-    * IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_SCHAR_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_SCHAR_ALIGN_g = 1;
-    H5T_NATIVE_SCHAR_COMP_ALIGN_g = 1;
-
-   /*
-    *    0
-    * UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UCHAR_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UCHAR_ALIGN_g = 1;
-
-   /*
-    *    1        0
-    * IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 2;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 16;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_SHORT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_SHORT_ALIGN_g = 1;
-    H5T_NATIVE_SHORT_COMP_ALIGN_g = 2;
-
-   /*
-    *    1        0
-    * UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 2;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 16;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_USHORT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_USHORT_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_ALIGN_g = 1;
-    H5T_NATIVE_INT_COMP_ALIGN_g = 4;
-
-   /*
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_LONG_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_LONG_ALIGN_g = 1;
-    H5T_NATIVE_LONG_COMP_ALIGN_g = 8;
-
-   /*
-    *    7        6        5        4
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_ULONG_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_ULONG_ALIGN_g = 1;
-
-   /*
-    *    0
-    * IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT8_ALIGN_g = 1;
-
-   /*
-    *    0
-    * UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT8_ALIGN_g = 1;
-
-   /*
-    *    0
-    * IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_LEAST8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_LEAST8_ALIGN_g = 1;
-
-   /*
-    *    0
-    * UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_LEAST8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_LEAST8_ALIGN_g = 1;
-
-   /*
-    *    0
-    * IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_FAST8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_FAST8_ALIGN_g = 1;
-
-   /*
-    *    0
-    * UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 1;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 8;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_FAST8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_FAST8_ALIGN_g = 1;
-
-   /*
-    *    1        0
-    * IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 2;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 16;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT16_ALIGN_g = 1;
-
-   /*
-    *    1        0
-    * UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 2;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 16;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT16_ALIGN_g = 1;
-
-   /*
-    *    1        0
-    * IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 2;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 16;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_LEAST16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_LEAST16_ALIGN_g = 1;
-
-   /*
-    *    1        0
-    * UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 2;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 16;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_LEAST16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_LEAST16_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_FAST16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_FAST16_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_FAST16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_FAST16_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT32_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT32_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_LEAST32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_LEAST32_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_LEAST32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_LEAST32_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_FAST32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_FAST32_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_FAST32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_FAST32_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT64_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT64_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_LEAST64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_LEAST64_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_LEAST64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_LEAST64_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_INT_FAST64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_INT_FAST64_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_UINT_FAST64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_UINT_FAST64_ALIGN_g = 1;
-
-   /*
-    *    7        6        5        4
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    *    3        2        1        0
-    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
-    if((H5T_NATIVE_LLONG_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_LLONG_ALIGN_g = 1;
-    H5T_NATIVE_LLONG_COMP_ALIGN_g = 8;
-
-   /*
-    *    7        6        5        4
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    *    3        2        1        0
-    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_INTEGER;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
-    if((H5T_NATIVE_ULLONG_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_ULLONG_ALIGN_g = 1;
-
-   /*
-    *    3        2        1        0
-    * SEEEEEEE EMMMMMMM MMMMMMMM MMMMMMMM
-    * Implicit bit? yes
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_FLOAT;
-    dt->shared->size = 4;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 32;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.f.sign = 31;
-    dt->shared->u.atomic.u.f.epos = 23;
-    dt->shared->u.atomic.u.f.esize = 8;
-    dt->shared->u.atomic.u.f.ebias = 0x0000007f;
-    dt->shared->u.atomic.u.f.mpos = 0;
-    dt->shared->u.atomic.u.f.msize = 23;
-    dt->shared->u.atomic.u.f.norm = H5T_NORM_IMPLIED;
-    dt->shared->u.atomic.u.f.pad = H5T_PAD_ZERO;
-    if((H5T_NATIVE_FLOAT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_FLOAT_ALIGN_g = 1;
-    H5T_NATIVE_FLOAT_COMP_ALIGN_g = 4;
-
-   /*
-    *    7        6        5        4
-    * SEEEEEEE EEEEMMMM MMMMMMMM MMMMMMMM
-    *    3        2        1        0
-    * MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM
-    * Implicit bit? yes
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_FLOAT;
-    dt->shared->size = 8;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 64;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.f.sign = 63;
-    dt->shared->u.atomic.u.f.epos = 52;
-    dt->shared->u.atomic.u.f.esize = 11;
-    dt->shared->u.atomic.u.f.ebias = 0x000003ff;
-    dt->shared->u.atomic.u.f.mpos = 0;
-    dt->shared->u.atomic.u.f.msize = 52;
-    dt->shared->u.atomic.u.f.norm = H5T_NORM_IMPLIED;
-    dt->shared->u.atomic.u.f.pad = H5T_PAD_ZERO;
-    if((H5T_NATIVE_DOUBLE_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_DOUBLE_ALIGN_g = 1;
-    H5T_NATIVE_DOUBLE_COMP_ALIGN_g = 8;
-
-   /*
-    *   15       14       13       12
-    * ???????? ???????? ???????? ????????
-    *   11       10        9        8
-    * ???????? ???????? SEEEEEEE EEEEEEEE
-    *    7        6        5        4
-    * MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM
-    *    3        2        1        0
-    * MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM
-    * Implicit bit? no
-    * Alignment: none
-    */
-    if(NULL == (dt = H5T__alloc()))
-        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
-    dt->shared->state = H5T_STATE_IMMUTABLE;
-    dt->shared->type = H5T_FLOAT;
-    dt->shared->size = 16;
-    dt->shared->u.atomic.order = H5T_ORDER_LE;
-    dt->shared->u.atomic.offset = 0;
-    dt->shared->u.atomic.prec = 80;
-    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
-    dt->shared->u.atomic.u.f.sign = 79;
-    dt->shared->u.atomic.u.f.epos = 64;
-    dt->shared->u.atomic.u.f.esize = 15;
-    dt->shared->u.atomic.u.f.ebias = 0x00003fff;
-    dt->shared->u.atomic.u.f.mpos = 0;
-    dt->shared->u.atomic.u.f.msize = 64;
-    dt->shared->u.atomic.u.f.norm = H5T_NORM_NONE;
-    dt->shared->u.atomic.u.f.pad = H5T_PAD_ZERO;
-    if((H5T_NATIVE_LDOUBLE_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
-        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
-    H5T_NATIVE_LDOUBLE_ALIGN_g = 1;
-    H5T_NATIVE_LDOUBLE_COMP_ALIGN_g = 16;
-
-    /* Set the native order for this machine */
-    H5T_native_order_g = H5T_ORDER_LE;
-
-    /* Structure alignment for pointers, hvl_t, hobj_ref_t, hdset_reg_ref_t */
-    H5T_POINTER_COMP_ALIGN_g = 8;
-    H5T_HVL_COMP_ALIGN_g = 8;
-    H5T_HOBJREF_COMP_ALIGN_g = 8;
-    H5T_HDSETREGREF_COMP_ALIGN_g = 1;
-
-done:
-    if(ret_value < 0) {
-        if(dt != NULL) {
-            dt->shared = H5FL_FREE(H5T_shared_t, dt->shared);
-            dt = H5FL_FREE(H5T_t, dt);
-        } /* end if */
-    } /* end if */
-
-    FUNC_LEAVE_NOAPI(ret_value);
-} /* end H5TN_init_interface() */
-
-/****************************************/
-/* ALIGNMENT and signal-handling status */
-/****************************************/
-/* Signal() support: yes */
-/* setjmp() support: yes */
-/* longjmp() support: yes */
-/* sigsetjmp() support: yes */
-/* siglongjmp() support: yes */
-/* sigprocmask() support: yes */
-
-/******************************/
-/* signal handlers statistics */
-/******************************/
-/* signal_handlers tested: 15 times */
-/* sigbus_handler called: 5 times */
-/* sigsegv_handler called: 5 times */
-/* sigill_handler called: 5 times */
diff --git a/meta-oe/recipes-support/hdf5/files/H5lib_settings.c b/meta-oe/recipes-support/hdf5/files/H5lib_settings.c
deleted file mode 100644
index c243aee121..0000000000
--- a/meta-oe/recipes-support/hdf5/files/H5lib_settings.c
+++ /dev/null
@@ -1,98 +0,0 @@
-/* Generated automatically by H5make_libsettings -- do not edit */
-
-
-
-/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
- * Copyright by The HDF Group.                                               *
- * Copyright by the Board of Trustees of the University of Illinois.         *
- * All rights reserved.                                                      *
- *                                                                           *
- * This file is part of HDF5.  The full HDF5 copyright notice, including     *
- * terms governing use, modification, and redistribution, is contained in    *
- * the COPYING file, which can be found at the root of the source code       *
- * distribution tree, or in https://support.hdfgroup.org/ftp/HDF5/releases.  *
- * If you do not have access to either file, you may request a copy from     *
- * help@hdfgroup.org.                                                        *
- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
- *
- * Created:		Jan 29, 2019
- *			root <root@qemux86-64>
- *
- * Purpose:		This machine-generated source code contains
- *			information about the library build configuration
- *
- * Modifications:
- *
- *	DO NOT MAKE MODIFICATIONS TO THIS FILE!
- *	It was generated by code in `H5make_libsettings.c'.
- *
- *-------------------------------------------------------------------------
- */
-
-char H5libhdf5_settings[]=
-	"      SUMMARY OF THE HDF5 CONFIGURATION\n"
-	"      =================================\n"
-	"\n"
-	"General Information:\n"
-	"-------------------\n"
-	"                   HDF5 Version: 1.8.19\n"
-	"                  Configured on: 2019-01-29\n"
-	"                  Configured by: Ninja\n"
-	"                 Configure mode: CMAKE 3.12.2\n"
-	"                    Host system: Linux-4.4.0-31-generic\n"
-	"              Uname information: Linux\n"
-	"                       Byte sex: little-endian\n"
-	"                      Libraries: \n"
-	"             Installation point: /usr\n"
-	"\n"
-	"Compiling Options:\n"
-	"------------------\n"
-	"               Compilation Mode: \n"
-	"                      H5_CFLAGS: \n"
-	"                      AM_CFLAGS: \n"
-	"                       CPPFLAGS: \n"
-	"                    H5_CPPFLAGS: \n"
-	"                    AM_CPPFLAGS: \n"
-	"               Shared C Library: YES\n"
-	"               Static C Library: YES\n"
-	"  Statically Linked Executables: OFF\n"
-	"                        LDFLAGS: -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed\n"
-	"                     AM_LDFLAGS: \n"
-	"                Extra libraries: m;dl\n"
-	"              Debugged Packages: \n"
-	"                    API Tracing: OFF\n"
-	"\n"
-	"Languages:\n"
-	"----------\n"
-	"                        Fortran: OFF\n"
-	"               Fortran Compiler: \n"
-	"          Fortran 2003 Compiler: \n"
-	"                  Fortran Flags: \n"
-	"               H5 Fortran Flags: \n"
-	"               AM Fortran Flags: \n"
-	"         Shared Fortran Library: YES\n"
-	"         Static Fortran Library: YES\n"
-	"\n"
-	"                   H5 C++ Flags: \n"
-	"                   AM C++ Flags: \n"
-	"             Shared C++ Library: YES\n"
-	"             Static C++ Library: YES\n"
-	"\n"
-	"Features:\n"
-	"---------\n"
-	"                  Parallel HDF5: OFF\n"
-	"             High Level library: ON\n"
-	"                   Threadsafety: OFF\n"
-	"            Default API Mapping: v18\n"
-	" With Deprecated Public Symbols: ON\n"
-	"         I/O filters (external): \n"
-	"                            MPE: \n"
-	"                     Direct VFD: \n"
-	"                        dmalloc: \n"
-	"Clear file buffers before write: ON\n"
-	"           Using memory checker: OFF\n"
-	"         Function Stack Tracing: OFF\n"
-	"      Strict File Format Checks: OFF\n"
-	"   Optimization Instrumentation: \n"
-;
-
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.13.2.bb b/meta-oe/recipes-support/hdf5/hdf5_1.13.2.bb
new file mode 100644
index 0000000000..80611c6714
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.13.2.bb
@@ -0,0 +1,54 @@
+SUMMARY = "Management suite for extremely large and complex data collections"
+DESCRIPTION = "Unique technology suite that makes possible the management of \
+extremely large and complex data collections"
+HOMEPAGE = "https://www.hdfgroup.org/"
+SECTION = "libs"
+
+LICENSE = "HDF5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ac1039f6bf7c9ab2b3693836f46d0735"
+
+inherit cmake siteinfo qemu
+
+DEPENDS += "qemu-native"
+
+SRC_URI = " \
+    https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.13/hdf5-${PV}/src/${BPN}-${PV}.tar.bz2 \
+    file://0002-Remove-suffix-shared-from-shared-library-name.patch \
+    file://0001-cmake-remove-build-flags.patch \
+"
+SRC_URI[sha256sum] = "9c51b3da426977ec622a43dca8adaf4e81eabf838c1ff80c6225ad1d3ed54b5c"
+
+FILES:${PN} += "${libdir}/libhdf5.settings ${datadir}/*"
+
+EXTRA_OECMAKE = " \
+    -DHDF5_INSTALL_CMAKE_DIR=${libdir}/cmake \
+    -DCMAKE_INSTALL_PREFIX='${prefix}' \
+    -DHDF5_INSTALL_LIB_DIR='${baselib}' \
+"
+EXTRA_OECMAKE:prepend:class-target = "-DCMAKE_CROSSCOMPILING_EMULATOR=${WORKDIR}/qemuwrapper "
+
+gen_emu() {
+        # Write out a qemu wrapper that will be used by cmake
+        # so that it can run target helper binaries through that.
+        qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
+        cat > ${WORKDIR}/qemuwrapper << EOF
+#!/bin/sh
+$qemu_binary "\$@"
+EOF
+        chmod +x ${WORKDIR}/qemuwrapper
+}
+
+do_unpack[postfuncs] += "gen_emu"
+
+do_install:append() {
+    # Used for generating config files on target
+    install -m 755 ${B}/bin/H5detect ${D}${bindir}
+    install -m 755 ${B}/bin/H5make_libsettings ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native"
+
+SRC_DISTRIBUTE_LICENSES += "HDF5"
+
+# h5fuse.sh script needs bash
+RDEPENDS:${PN} += "bash"
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb b/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
deleted file mode 100644
index 7b886a4635..0000000000
--- a/meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb
+++ /dev/null
@@ -1,59 +0,0 @@
-SUMMARY = "Management suite for extremely large and complex data collections"
-DESCRIPTION = "Unique technology suite that makes possible the management of \
-extremely large and complex data collections"
-HOMEPAGE = "https://www.hdfgroup.org/"
-SECTION = "libs"
-
-LICENSE = "HDF5"
-LIC_FILES_CHKSUM = "file://COPYING;md5=57e5351b17591e659eedae107265c606"
-
-inherit cmake siteinfo
-
-SRC_URI = " \
-    https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/hdf5-${PV}/src/${BPN}-${PV}.tar.bz2 \
-    file://H5lib_settings.c \
-    file://H5Tinit-64.c \
-    file://H5Tinit-32.c \
-    file://0001-cross-compiling-support.patch \
-    file://0002-Remove-suffix-shared-from-shared-library-name.patch \
-    file://0001-cmake-remove-build-flags.patch \
-"
-SRC_URI[md5sum] = "2d2408f2a9dfb5c7b79998002e9a90e9"
-SRC_URI[sha256sum] = "e5b1b1dee44a64b795a91c3321ab7196d9e0871fe50d42969761794e3899f40d"
-
-FILES:${PN} += "${libdir}/libhdf5.settings ${datadir}/*"
-
-EXTRA_OECMAKE = " \
-    -DTEST_LFS_WORKS_RUN=0 \
-    -DTEST_LFS_WORKS_RUN__TRYRUN_OUTPUT=0 \
-    -DH5_PRINTF_LL_TEST_RUN=1 \
-    -DH5_PRINTF_LL_TEST_RUN__TRYRUN_OUTPUT='8' \
-    -DH5_LDOUBLE_TO_LONG_SPECIAL_RUN=0 \
-    -DH5_LDOUBLE_TO_LONG_SPECIAL_RUN__TRYRUN_OUTPUT= \
-    -DH5_LONG_TO_LDOUBLE_SPECIAL_RUN=0 \
-    -DH5_LONG_TO_LDOUBLE_SPECIAL_RUN__TRYRUN_OUTPUT= \
-    -DH5_LDOUBLE_TO_LLONG_ACCURATE_RUN=0 \
-    -DH5_LDOUBLE_TO_LLONG_ACCURATE_RUN__TRYRUN_OUTPUT= \
-    -DH5_LLONG_TO_LDOUBLE_CORRECT_RUN=0 \
-    -DH5_LLONG_TO_LDOUBLE_CORRECT_RUN__TRYRUN_OUTPUT= \
-    -DH5_NO_ALIGNMENT_RESTRICTIONS_RUN=0 \
-    -DH5_NO_ALIGNMENT_RESTRICTIONS_RUN__TRYRUN_OUTPUT= \
-    -DCMAKE_INSTALL_PREFIX='${prefix}' \
-    -DHDF5_INSTALL_LIB_DIR='${baselib}' \
-"
-
-do_unpack[postfuncs] += "gen_hd5file"
-gen_hd5file() {
-    install -m 544 ${WORKDIR}/H5lib_settings.c ${S}
-    install -m 544 ${WORKDIR}/H5Tinit-${SITEINFO_BITS}.c ${S}/H5Tinit.c
-}
-
-do_install:append() {
-    # Used for generating config files on target
-    install -m 755 ${B}/bin/H5detect ${D}${bindir}
-    install -m 755 ${B}/bin/H5make_libsettings ${D}${bindir}
-}
-
-BBCLASSEXTEND = "native"
-
-SRC_DISTRIBUTE_LICENSES += "HDF5"
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb
index 1153ea32ce..07128bb039 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb
@@ -28,4 +28,4 @@ RDEPENDS:${PN} = "python3-numpy \
                   python3-json \
                  "
 
-export HDF5_VERSION="1.8.21"
+export HDF5_VERSION="1.13.2"
-- 
2.37.3


