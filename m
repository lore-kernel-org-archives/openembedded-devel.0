Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7ECDA7C6A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:06:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1F65kJm008986
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2019 22:05:56 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 14 Feb 2019 22:05:36 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 01:04:47 -0500
Message-ID: <59c78ae44bc7998b22c93e0790d7a6e1ed5f810a.1550210289.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1550210289.git.hongxu.jia@windriver.com>
References: <cover.1550210289.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/12] hdf5: add version 1.8.19
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
X-List-Received-Date: Fri, 15 Feb 2019 06:06:21 -0000
Content-Type: text/plain

License HDF5 is BSD-style.
https://support.hdfgroup.org/products/licenses.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/licenses/HDF5                              |  92 ++
 .../hdf5/files/0001-cross-compiling-support.patch  |  71 ++
 ...ve-suffix-shared-from-shared-library-name.patch |  50 ++
 meta-oe/recipes-support/hdf5/files/H5Tinit.c       | 991 +++++++++++++++++++++
 .../recipes-support/hdf5/files/H5lib_settings.c    |  98 ++
 meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb        |  56 ++
 6 files changed, 1358 insertions(+)
 create mode 100644 meta-oe/licenses/HDF5
 create mode 100644 meta-oe/recipes-support/hdf5/files/0001-cross-compiling-support.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/H5Tinit.c
 create mode 100644 meta-oe/recipes-support/hdf5/files/H5lib_settings.c
 create mode 100644 meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb

diff --git a/meta-oe/licenses/HDF5 b/meta-oe/licenses/HDF5
new file mode 100644
index 0000000..10481dd
--- /dev/null
+++ b/meta-oe/licenses/HDF5
@@ -0,0 +1,92 @@
+Copyright Notice and License Terms for 
+HDF5 (Hierarchical Data Format 5) Software Library and Utilities
+-----------------------------------------------------------------------------
+
+HDF5 (Hierarchical Data Format 5) Software Library and Utilities
+Copyright (c) 2006-2018, The HDF Group. 
+
+NCSA HDF5 (Hierarchical Data Format 5) Software Library and Utilities
+Copyright (c) 1998-2006, The Board of Trustees of the University of Illinois. 
+
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without 
+modification, are permitted for any purpose (including commercial purposes) 
+provided that the following conditions are met:
+
+1. Redistributions of source code must retain the above copyright notice, 
+   this list of conditions, and the following disclaimer.
+
+2. Redistributions in binary form must reproduce the above copyright notice, 
+   this list of conditions, and the following disclaimer in the documentation 
+   and/or materials provided with the distribution.
+
+3. Neither the name of The HDF Group, the name of the University, nor the 
+   name of any Contributor may be used to endorse or promote products derived 
+   from this software without specific prior written permission from 
+   The HDF Group, the University, or the Contributor, respectively.
+
+DISCLAIMER: 
+THIS SOFTWARE IS PROVIDED BY THE HDF GROUP AND THE CONTRIBUTORS 
+"AS IS" WITH NO WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED. IN NO EVENT SHALL THE HDF GROUP OR THE CONTRIBUTORS BE LIABLE FOR ANY DAMAGES SUFFERED BY THE USERS ARISING OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+You are under no obligation whatsoever to provide any bug fixes, patches, or upgrades to the features, functionality or performance of the source code ("Enhancements") to anyone; however, if you choose to make your Enhancements available either publicly, or directly to The HDF Group, without imposing a separate written license agreement for such Enhancements, then you hereby grant the following license: a non-exclusive, royalty-free perpetual license to install, use, modify, prepare derivative works, incorporate into other computer software, distribute, and sublicense such enhancements or derivative works thereof, in binary and source code form.
+
+-----------------------------------------------------------------------------
+-----------------------------------------------------------------------------
+
+Limited portions of HDF5 were developed by Lawrence Berkeley National 
+Laboratory (LBNL). LBNL's Copyright Notice and Licensing Terms can be
+found here: COPYING_LBNL_HDF5 file in this directory or at 
+http://support.hdfgroup.org/ftp/HDF5/releases/COPYING_LBNL_HDF5. 
+
+-----------------------------------------------------------------------------
+-----------------------------------------------------------------------------
+
+Contributors:   National Center for Supercomputing Applications (NCSA) at 
+the University of Illinois, Fortner Software, Unidata Program Center (netCDF), The Independent JPEG Group (JPEG), Jean-loup Gailly and Mark Adler (gzip), and Digital Equipment Corporation (DEC).
+
+-----------------------------------------------------------------------------
+ 
+Portions of HDF5 were developed with support from the Lawrence Berkeley 
+National Laboratory (LBNL) and the United States Department of Energy 
+under Prime Contract No. DE-AC02-05CH11231.
+
+-----------------------------------------------------------------------------
+
+Portions of HDF5 were developed with support from the University of 
+California, Lawrence Livermore National Laboratory (UC LLNL).  
+The following statement applies to those portions of the product and must 
+be retained in any redistribution of source code, binaries, documentation, 
+and/or accompanying materials:
+
+   This work was partially produced at the University of California, 
+   Lawrence Livermore National Laboratory (UC LLNL) under contract 
+   no. W-7405-ENG-48 (Contract 48) between the U.S. Department of Energy 
+   (DOE) and The Regents of the University of California (University) 
+   for the operation of UC LLNL.
+
+   DISCLAIMER: 
+   This work was prepared as an account of work sponsored by an agency of 
+   the United States Government. Neither the United States Government nor 
+   the University of California nor any of their employees, makes any 
+   warranty, express or implied, or assumes any liability or responsibility 
+   for the accuracy, completeness, or usefulness of any information, 
+   apparatus, product, or process disclosed, or represents that its use 
+   would not infringe privately- owned rights. Reference herein to any 
+   specific commercial products, process, or service by trade name, 
+   trademark, manufacturer, or otherwise, does not necessarily constitute 
+   or imply its endorsement, recommendation, or favoring by the United 
+   States Government or the University of California. The views and 
+   opinions of authors expressed herein do not necessarily state or reflect 
+   those of the United States Government or the University of California, 
+   and shall not be used for advertising or product endorsement purposes.
+
+-----------------------------------------------------------------------------
+
+HDF5 is available with the SZIP compression library but SZIP is not part 
+of HDF5 and has separate copyright and license terms. See SZIP Compression 
+in HDF Products (www.hdfgroup.org/doc_resource/SZIP/) for further details.
+
+-----------------------------------------------------------------------------
+
diff --git a/meta-oe/recipes-support/hdf5/files/0001-cross-compiling-support.patch b/meta-oe/recipes-support/hdf5/files/0001-cross-compiling-support.patch
new file mode 100644
index 0000000..97f16bb
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/0001-cross-compiling-support.patch
@@ -0,0 +1,71 @@
+From 1b4fadf550587b46e405d7ccb777dcb00aa791a2 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 29 Jan 2019 15:39:15 +0800
+Subject: [PATCH 1/2] cross compiling support
+
+Do not generate config files at build time, use pre-generated
+files to instead.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ CMakeLists.txt     |  6 ++++++
+ src/CMakeLists.txt | 23 -----------------------
+ 2 files changed, 6 insertions(+), 23 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 08a65c4..9af14d5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -817,4 +817,10 @@ endif ()
+ #-----------------------------------------------------------------------------
+ configure_file (${HDF_RESOURCES_DIR}/H5pubconf.h.in ${HDF5_BINARY_DIR}/H5pubconf.h @ONLY)
+ 
++#-----------------------------------------------------------------------------
++# Copy the pre-generated files in place
++#-----------------------------------------------------------------------------
++configure_file(H5Tinit.c H5Tinit.c COPYONLY)
++configure_file(H5lib_settings.c H5lib_settings.c COPYONLY)
++
+ include (CMakeInstallation.cmake)
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index d343208..d11525b 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -613,32 +613,9 @@ set (H5_PRIVATE_HEADERS
+ #-----------------------------------------------------------------------------
+ add_executable (H5detect ${HDF5_SRC_DIR}/H5detect.c)
+ TARGET_C_PROPERTIES (H5detect STATIC " " " ")
+-if (MSVC OR MINGW)
+-  target_link_libraries (H5detect "ws2_32.lib")
+-endif ()
+-
+-set (CMD $<TARGET_FILE:H5detect>)
+-add_custom_command (
+-    OUTPUT ${HDF5_BINARY_DIR}/H5Tinit.c
+-    COMMAND ${CMD}
+-    ARGS > ${HDF5_BINARY_DIR}/H5Tinit.c
+-    DEPENDS H5detect
+-)
+ 
+ add_executable (H5make_libsettings ${HDF5_SRC_DIR}/H5make_libsettings.c)
+ TARGET_C_PROPERTIES (H5make_libsettings STATIC " " " ")
+-if (MSVC OR MINGW)
+-  target_link_libraries (H5make_libsettings "ws2_32.lib")
+-endif ()
+-
+-set (CMD $<TARGET_FILE:H5make_libsettings>)
+-add_custom_command (
+-    OUTPUT ${HDF5_BINARY_DIR}/H5lib_settings.c
+-    COMMAND ${CMD}
+-    ARGS > ${HDF5_BINARY_DIR}/H5lib_settings.c
+-    DEPENDS H5make_libsettings
+-    WORKING_DIRECTORY ${HDF5_BINARY_DIR}
+-)
+ 
+ if (GENERATE_ERROR_HEADERS)
+   find_package (Perl)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch b/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
new file mode 100644
index 0000000..6f89378
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
@@ -0,0 +1,50 @@
+From f76141864edf7100c1c29bec159ea629077a7fa0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 29 Jan 2019 11:13:42 +0800
+Subject: [PATCH 2/2] Remove suffix `-shared' from shared library name
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ CMakeLists.txt | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9af14d5..05100e3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -153,18 +153,18 @@ set (HDF5_F90_TEST_LIB_TARGET     "${HDF5_F90_TEST_LIB_CORENAME}-static")
+ set (HDF5_F90_C_TEST_LIB_TARGET   "${HDF5_F90_C_TEST_LIB_CORENAME}-static")
+ set (HDF5_HL_F90_LIB_TARGET       "${HDF5_HL_F90_LIB_CORENAME}-static")
+ set (HDF5_HL_F90_C_LIB_TARGET     "${HDF5_HL_F90_C_LIB_CORENAME}-static")
+-set (HDF5_LIBSH_TARGET            "${HDF5_LIB_CORENAME}-shared")
+-set (HDF5_TEST_LIBSH_TARGET       "${HDF5_TEST_LIB_CORENAME}-shared")
+-set (HDF5_CPP_LIBSH_TARGET        "${HDF5_CPP_LIB_CORENAME}-shared")
+-set (HDF5_HL_LIBSH_TARGET         "${HDF5_HL_LIB_CORENAME}-shared")
+-set (HDF5_HL_CPP_LIBSH_TARGET     "${HDF5_HL_CPP_LIB_CORENAME}-shared")
+-set (HDF5_TOOLS_LIBSH_TARGET      "${HDF5_TOOLS_LIB_CORENAME}-shared")
+-set (HDF5_F90_LIBSH_TARGET        "${HDF5_F90_LIB_CORENAME}-shared")
+-set (HDF5_F90_C_LIBSH_TARGET      "${HDF5_F90_C_LIB_CORENAME}-shared")
+-set (HDF5_F90_TEST_LIBSH_TARGET   "${HDF5_F90_TEST_LIB_CORENAME}-shared")
+-set (HDF5_F90_C_TEST_LIBSH_TARGET "${HDF5_F90_C_TEST_LIB_CORENAME}-shared")
+-set (HDF5_HL_F90_LIBSH_TARGET     "${HDF5_HL_F90_LIB_CORENAME}-shared")
+-set (HDF5_HL_F90_C_LIBSH_TARGET   "${HDF5_HL_F90_C_LIB_CORENAME}-shared")
++set (HDF5_LIBSH_TARGET            "${HDF5_LIB_CORENAME}")
++set (HDF5_TEST_LIBSH_TARGET       "${HDF5_TEST_LIB_CORENAME}")
++set (HDF5_CPP_LIBSH_TARGET        "${HDF5_CPP_LIB_CORENAME}")
++set (HDF5_HL_LIBSH_TARGET         "${HDF5_HL_LIB_CORENAME}")
++set (HDF5_HL_CPP_LIBSH_TARGET     "${HDF5_HL_CPP_LIB_CORENAME}")
++set (HDF5_TOOLS_LIBSH_TARGET      "${HDF5_TOOLS_LIB_CORENAME}")
++set (HDF5_F90_LIBSH_TARGET        "${HDF5_F90_LIB_CORENAME}")
++set (HDF5_F90_C_LIBSH_TARGET      "${HDF5_F90_C_LIB_CORENAME}")
++set (HDF5_F90_TEST_LIBSH_TARGET   "${HDF5_F90_TEST_LIB_CORENAME}")
++set (HDF5_F90_C_TEST_LIBSH_TARGET "${HDF5_F90_C_TEST_LIB_CORENAME}")
++set (HDF5_HL_F90_LIBSH_TARGET     "${HDF5_HL_F90_LIB_CORENAME}")
++set (HDF5_HL_F90_C_LIBSH_TARGET   "${HDF5_HL_F90_C_LIB_CORENAME}")
+ 
+ #-----------------------------------------------------------------------------
+ # Define some CMake variables for use later in the project
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/hdf5/files/H5Tinit.c b/meta-oe/recipes-support/hdf5/files/H5Tinit.c
new file mode 100644
index 0000000..85f79a6
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/H5Tinit.c
@@ -0,0 +1,991 @@
+/* Generated automatically by H5detect -- do not edit */
+
+
+
+/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
+ * Copyright by The HDF Group.                                               *
+ * Copyright by the Board of Trustees of the University of Illinois.         *
+ * All rights reserved.                                                      *
+ *                                                                           *
+ * This file is part of HDF5.  The full HDF5 copyright notice, including     *
+ * terms governing use, modification, and redistribution, is contained in    *
+ * the COPYING file, which can be found at the root of the source code       *
+ * distribution tree, or in https://support.hdfgroup.org/ftp/HDF5/releases.  *
+ * If you do not have access to either file, you may request a copy from     *
+ * help@hdfgroup.org.                                                        *
+ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
+ *
+ * Created:		Jan 29, 2019
+ *			root <root@qemux86-64>
+ *
+ * Purpose:		This machine-generated source code contains
+ *			information about the various integer and
+ *			floating point numeric formats found on this
+ *			architecture.  The parameters below should be
+ *			checked carefully and errors reported to the
+ *			HDF5 maintainer.
+ *			
+ *			Each of the numeric formats listed below are
+ *			printed from most significant bit to least
+ *			significant bit even though the actual bytes
+ *			might be stored in a different order in
+ *			memory.	 The integers above each binary byte
+ *			indicate the relative order of the bytes in
+ *			memory; little-endian machines have
+ *			decreasing numbers while big-endian machines
+ *			have increasing numbers.
+ *			
+ *			The fields of the numbers are printed as
+ *			letters with `S' for the mantissa sign bit,
+ *			`M' for the mantissa magnitude, and `E' for
+ *			the exponent.  The exponent has an associated
+ *			bias which can be subtracted to find the
+ *			true exponent.	The radix point is assumed
+ *			to be before the first `M' bit.	 Any bit
+ *			of a floating-point value not falling into one
+ *			of these categories is printed as a question
+ *			mark.  Bits of integer types are printed as
+ *			`I' for 2's complement and `U' for magnitude.
+ *			
+ *			If the most significant bit of the normalized
+ *			mantissa (always a `1' except for `0.0') is
+ *			not stored then an `implicit=yes' appears
+ *			under the field description.  In thie case,
+ *			the radix point is still assumed to be
+ *			before the first `M' but after the implicit
+ *			bit.
+ *
+ * Modifications:
+ *
+ *	DO NOT MAKE MODIFICATIONS TO THIS FILE!
+ *	It was generated by code in `H5detect.c'.
+ *
+ *-------------------------------------------------------------------------
+ */
+
+/****************/
+/* Module Setup */
+/****************/
+
+#define H5T_PACKAGE /*suppress error about including H5Tpkg.h*/
+
+
+/***********/
+/* Headers */
+/***********/
+#include "H5private.h"		/* Generic Functions			*/
+#include "H5Eprivate.h"		/* Error handling		  	*/
+#include "H5FLprivate.h"	/* Free Lists				*/
+#include "H5Iprivate.h"		/* IDs			  		*/
+#include "H5Tpkg.h"		/* Datatypes 				*/
+
+
+/****************/
+/* Local Macros */
+/****************/
+
+
+/******************/
+/* Local Typedefs */
+/******************/
+
+
+/********************/
+/* Package Typedefs */
+/********************/
+
+
+/********************/
+/* Local Prototypes */
+/********************/
+
+
+/********************/
+/* Public Variables */
+/********************/
+
+
+/*****************************/
+/* Library Private Variables */
+/*****************************/
+
+
+/*********************/
+/* Package Variables */
+/*********************/
+
+
+
+/*******************/
+/* Local Variables */
+/*******************/
+
+
+
+/*-------------------------------------------------------------------------
+ * Function:	H5TN_init_interface
+ *
+ * Purpose:	Initialize pre-defined native datatypes from code generated
+ *              during the library configuration by H5detect.
+ *
+ * Return:	Success:	non-negative
+ *		Failure:	negative
+ *
+ * Programmer:	Robb Matzke
+ *              Wednesday, December 16, 1998
+ *
+ *-------------------------------------------------------------------------
+ */
+herr_t
+H5TN_init_interface(void)
+{
+    H5T_t	*dt = NULL;
+    herr_t	ret_value = SUCCEED;
+
+    FUNC_ENTER_NOAPI(FAIL)
+
+   /*
+    *    0
+    * IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 1;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 8;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_SCHAR_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_SCHAR_ALIGN_g = 1;
+    H5T_NATIVE_SCHAR_COMP_ALIGN_g = 1;
+
+   /*
+    *    0
+    * UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 1;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 8;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_UCHAR_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_UCHAR_ALIGN_g = 1;
+
+   /*
+    *    1        0
+    * IIIIIIII IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 2;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 16;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_SHORT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_SHORT_ALIGN_g = 1;
+    H5T_NATIVE_SHORT_COMP_ALIGN_g = 2;
+
+   /*
+    *    1        0
+    * UUUUUUUU UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 2;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 16;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_USHORT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_USHORT_ALIGN_g = 1;
+
+   /*
+    *    3        2        1        0
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 4;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 32;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_INT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_INT_ALIGN_g = 1;
+    H5T_NATIVE_INT_COMP_ALIGN_g = 4;
+
+   /*
+    *    3        2        1        0
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 4;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 32;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_UINT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_UINT_ALIGN_g = 1;
+
+   /*
+    *    7        6        5        4
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    *    3        2        1        0
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_LONG_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_LONG_ALIGN_g = 1;
+    H5T_NATIVE_LONG_COMP_ALIGN_g = 8;
+
+   /*
+    *    7        6        5        4
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    *    3        2        1        0
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_ULONG_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_ULONG_ALIGN_g = 1;
+
+   /*
+    *    0
+    * IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 1;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 8;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_INT8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_INT8_ALIGN_g = 1;
+
+   /*
+    *    0
+    * UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 1;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 8;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_UINT8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_UINT8_ALIGN_g = 1;
+
+   /*
+    *    0
+    * IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 1;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 8;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_INT_LEAST8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_INT_LEAST8_ALIGN_g = 1;
+
+   /*
+    *    0
+    * UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 1;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 8;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_UINT_LEAST8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_UINT_LEAST8_ALIGN_g = 1;
+
+   /*
+    *    0
+    * IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 1;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 8;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_INT_FAST8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_INT_FAST8_ALIGN_g = 1;
+
+   /*
+    *    0
+    * UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 1;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 8;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_UINT_FAST8_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_UINT_FAST8_ALIGN_g = 1;
+
+   /*
+    *    1        0
+    * IIIIIIII IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 2;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 16;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_INT16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_INT16_ALIGN_g = 1;
+
+   /*
+    *    1        0
+    * UUUUUUUU UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 2;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 16;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_UINT16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_UINT16_ALIGN_g = 1;
+
+   /*
+    *    1        0
+    * IIIIIIII IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 2;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 16;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_INT_LEAST16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_INT_LEAST16_ALIGN_g = 1;
+
+   /*
+    *    1        0
+    * UUUUUUUU UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 2;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 16;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_UINT_LEAST16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_UINT_LEAST16_ALIGN_g = 1;
+
+   /*
+    *    7        6        5        4
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    *    3        2        1        0
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_INT_FAST16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_INT_FAST16_ALIGN_g = 1;
+
+   /*
+    *    7        6        5        4
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    *    3        2        1        0
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_UINT_FAST16_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_UINT_FAST16_ALIGN_g = 1;
+
+   /*
+    *    3        2        1        0
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 4;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 32;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_INT32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_INT32_ALIGN_g = 1;
+
+   /*
+    *    3        2        1        0
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 4;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 32;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_UINT32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_UINT32_ALIGN_g = 1;
+
+   /*
+    *    3        2        1        0
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 4;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 32;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_INT_LEAST32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_INT_LEAST32_ALIGN_g = 1;
+
+   /*
+    *    3        2        1        0
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 4;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 32;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_UINT_LEAST32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_UINT_LEAST32_ALIGN_g = 1;
+
+   /*
+    *    7        6        5        4
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    *    3        2        1        0
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_INT_FAST32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_INT_FAST32_ALIGN_g = 1;
+
+   /*
+    *    7        6        5        4
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    *    3        2        1        0
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_UINT_FAST32_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_UINT_FAST32_ALIGN_g = 1;
+
+   /*
+    *    7        6        5        4
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    *    3        2        1        0
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_INT64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_INT64_ALIGN_g = 1;
+
+   /*
+    *    7        6        5        4
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    *    3        2        1        0
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_UINT64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_UINT64_ALIGN_g = 1;
+
+   /*
+    *    7        6        5        4
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    *    3        2        1        0
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_INT_LEAST64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_INT_LEAST64_ALIGN_g = 1;
+
+   /*
+    *    7        6        5        4
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    *    3        2        1        0
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_UINT_LEAST64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_UINT_LEAST64_ALIGN_g = 1;
+
+   /*
+    *    7        6        5        4
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    *    3        2        1        0
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_INT_FAST64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_INT_FAST64_ALIGN_g = 1;
+
+   /*
+    *    7        6        5        4
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    *    3        2        1        0
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_UINT_FAST64_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_UINT_FAST64_ALIGN_g = 1;
+
+   /*
+    *    7        6        5        4
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    *    3        2        1        0
+    * IIIIIIII IIIIIIII IIIIIIII IIIIIIII
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_2;
+    if((H5T_NATIVE_LLONG_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_LLONG_ALIGN_g = 1;
+    H5T_NATIVE_LLONG_COMP_ALIGN_g = 8;
+
+   /*
+    *    7        6        5        4
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    *    3        2        1        0
+    * UUUUUUUU UUUUUUUU UUUUUUUU UUUUUUUU
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_INTEGER;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.i.sign = H5T_SGN_NONE;
+    if((H5T_NATIVE_ULLONG_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_ULLONG_ALIGN_g = 1;
+
+   /*
+    *    3        2        1        0
+    * SEEEEEEE EMMMMMMM MMMMMMMM MMMMMMMM
+    * Implicit bit? yes
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_FLOAT;
+    dt->shared->size = 4;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 32;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.f.sign = 31;
+    dt->shared->u.atomic.u.f.epos = 23;
+    dt->shared->u.atomic.u.f.esize = 8;
+    dt->shared->u.atomic.u.f.ebias = 0x0000007f;
+    dt->shared->u.atomic.u.f.mpos = 0;
+    dt->shared->u.atomic.u.f.msize = 23;
+    dt->shared->u.atomic.u.f.norm = H5T_NORM_IMPLIED;
+    dt->shared->u.atomic.u.f.pad = H5T_PAD_ZERO;
+    if((H5T_NATIVE_FLOAT_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_FLOAT_ALIGN_g = 1;
+    H5T_NATIVE_FLOAT_COMP_ALIGN_g = 4;
+
+   /*
+    *    7        6        5        4
+    * SEEEEEEE EEEEMMMM MMMMMMMM MMMMMMMM
+    *    3        2        1        0
+    * MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM
+    * Implicit bit? yes
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_FLOAT;
+    dt->shared->size = 8;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 64;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.f.sign = 63;
+    dt->shared->u.atomic.u.f.epos = 52;
+    dt->shared->u.atomic.u.f.esize = 11;
+    dt->shared->u.atomic.u.f.ebias = 0x000003ff;
+    dt->shared->u.atomic.u.f.mpos = 0;
+    dt->shared->u.atomic.u.f.msize = 52;
+    dt->shared->u.atomic.u.f.norm = H5T_NORM_IMPLIED;
+    dt->shared->u.atomic.u.f.pad = H5T_PAD_ZERO;
+    if((H5T_NATIVE_DOUBLE_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_DOUBLE_ALIGN_g = 1;
+    H5T_NATIVE_DOUBLE_COMP_ALIGN_g = 8;
+
+   /*
+    *   15       14       13       12
+    * ???????? ???????? ???????? ????????
+    *   11       10        9        8
+    * ???????? ???????? SEEEEEEE EEEEEEEE
+    *    7        6        5        4
+    * MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM
+    *    3        2        1        0
+    * MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM
+    * Implicit bit? no
+    * Alignment: none
+    */
+    if(NULL == (dt = H5T__alloc()))
+        HGOTO_ERROR(H5E_DATATYPE, H5E_NOSPACE, FAIL, "datatype allocation failed")
+    dt->shared->state = H5T_STATE_IMMUTABLE;
+    dt->shared->type = H5T_FLOAT;
+    dt->shared->size = 16;
+    dt->shared->u.atomic.order = H5T_ORDER_LE;
+    dt->shared->u.atomic.offset = 0;
+    dt->shared->u.atomic.prec = 80;
+    dt->shared->u.atomic.lsb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.msb_pad = H5T_PAD_ZERO;
+    dt->shared->u.atomic.u.f.sign = 79;
+    dt->shared->u.atomic.u.f.epos = 64;
+    dt->shared->u.atomic.u.f.esize = 15;
+    dt->shared->u.atomic.u.f.ebias = 0x00003fff;
+    dt->shared->u.atomic.u.f.mpos = 0;
+    dt->shared->u.atomic.u.f.msize = 64;
+    dt->shared->u.atomic.u.f.norm = H5T_NORM_NONE;
+    dt->shared->u.atomic.u.f.pad = H5T_PAD_ZERO;
+    if((H5T_NATIVE_LDOUBLE_g = H5I_register(H5I_DATATYPE, dt, FALSE)) < 0)
+        HGOTO_ERROR(H5E_DATATYPE, H5E_CANTINIT, FAIL, "can't register ID for built-in datatype")
+    H5T_NATIVE_LDOUBLE_ALIGN_g = 1;
+    H5T_NATIVE_LDOUBLE_COMP_ALIGN_g = 16;
+
+    /* Set the native order for this machine */
+    H5T_native_order_g = H5T_ORDER_LE;
+
+    /* Structure alignment for pointers, hvl_t, hobj_ref_t, hdset_reg_ref_t */
+    H5T_POINTER_COMP_ALIGN_g = 8;
+    H5T_HVL_COMP_ALIGN_g = 8;
+    H5T_HOBJREF_COMP_ALIGN_g = 8;
+    H5T_HDSETREGREF_COMP_ALIGN_g = 1;
+
+done:
+    if(ret_value < 0) {
+        if(dt != NULL) {
+            dt->shared = H5FL_FREE(H5T_shared_t, dt->shared);
+            dt = H5FL_FREE(H5T_t, dt);
+        } /* end if */
+    } /* end if */
+
+    FUNC_LEAVE_NOAPI(ret_value);
+} /* end H5TN_init_interface() */
+
+/****************************************/
+/* ALIGNMENT and signal-handling status */
+/****************************************/
+/* Signal() support: yes */
+/* setjmp() support: yes */
+/* longjmp() support: yes */
+/* sigsetjmp() support: yes */
+/* siglongjmp() support: yes */
+/* sigprocmask() support: yes */
+
+/******************************/
+/* signal handlers statistics */
+/******************************/
+/* signal_handlers tested: 15 times */
+/* sigbus_handler called: 5 times */
+/* sigsegv_handler called: 5 times */
+/* sigill_handler called: 5 times */
diff --git a/meta-oe/recipes-support/hdf5/files/H5lib_settings.c b/meta-oe/recipes-support/hdf5/files/H5lib_settings.c
new file mode 100644
index 0000000..c243aee
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/H5lib_settings.c
@@ -0,0 +1,98 @@
+/* Generated automatically by H5make_libsettings -- do not edit */
+
+
+
+/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
+ * Copyright by The HDF Group.                                               *
+ * Copyright by the Board of Trustees of the University of Illinois.         *
+ * All rights reserved.                                                      *
+ *                                                                           *
+ * This file is part of HDF5.  The full HDF5 copyright notice, including     *
+ * terms governing use, modification, and redistribution, is contained in    *
+ * the COPYING file, which can be found at the root of the source code       *
+ * distribution tree, or in https://support.hdfgroup.org/ftp/HDF5/releases.  *
+ * If you do not have access to either file, you may request a copy from     *
+ * help@hdfgroup.org.                                                        *
+ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
+ *
+ * Created:		Jan 29, 2019
+ *			root <root@qemux86-64>
+ *
+ * Purpose:		This machine-generated source code contains
+ *			information about the library build configuration
+ *
+ * Modifications:
+ *
+ *	DO NOT MAKE MODIFICATIONS TO THIS FILE!
+ *	It was generated by code in `H5make_libsettings.c'.
+ *
+ *-------------------------------------------------------------------------
+ */
+
+char H5libhdf5_settings[]=
+	"      SUMMARY OF THE HDF5 CONFIGURATION\n"
+	"      =================================\n"
+	"\n"
+	"General Information:\n"
+	"-------------------\n"
+	"                   HDF5 Version: 1.8.19\n"
+	"                  Configured on: 2019-01-29\n"
+	"                  Configured by: Ninja\n"
+	"                 Configure mode: CMAKE 3.12.2\n"
+	"                    Host system: Linux-4.4.0-31-generic\n"
+	"              Uname information: Linux\n"
+	"                       Byte sex: little-endian\n"
+	"                      Libraries: \n"
+	"             Installation point: /usr\n"
+	"\n"
+	"Compiling Options:\n"
+	"------------------\n"
+	"               Compilation Mode: \n"
+	"                      H5_CFLAGS: \n"
+	"                      AM_CFLAGS: \n"
+	"                       CPPFLAGS: \n"
+	"                    H5_CPPFLAGS: \n"
+	"                    AM_CPPFLAGS: \n"
+	"               Shared C Library: YES\n"
+	"               Static C Library: YES\n"
+	"  Statically Linked Executables: OFF\n"
+	"                        LDFLAGS: -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed\n"
+	"                     AM_LDFLAGS: \n"
+	"                Extra libraries: m;dl\n"
+	"              Debugged Packages: \n"
+	"                    API Tracing: OFF\n"
+	"\n"
+	"Languages:\n"
+	"----------\n"
+	"                        Fortran: OFF\n"
+	"               Fortran Compiler: \n"
+	"          Fortran 2003 Compiler: \n"
+	"                  Fortran Flags: \n"
+	"               H5 Fortran Flags: \n"
+	"               AM Fortran Flags: \n"
+	"         Shared Fortran Library: YES\n"
+	"         Static Fortran Library: YES\n"
+	"\n"
+	"                   H5 C++ Flags: \n"
+	"                   AM C++ Flags: \n"
+	"             Shared C++ Library: YES\n"
+	"             Static C++ Library: YES\n"
+	"\n"
+	"Features:\n"
+	"---------\n"
+	"                  Parallel HDF5: OFF\n"
+	"             High Level library: ON\n"
+	"                   Threadsafety: OFF\n"
+	"            Default API Mapping: v18\n"
+	" With Deprecated Public Symbols: ON\n"
+	"         I/O filters (external): \n"
+	"                            MPE: \n"
+	"                     Direct VFD: \n"
+	"                        dmalloc: \n"
+	"Clear file buffers before write: ON\n"
+	"           Using memory checker: OFF\n"
+	"         Function Stack Tracing: OFF\n"
+	"      Strict File Format Checks: OFF\n"
+	"   Optimization Instrumentation: \n"
+;
+
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb b/meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb
new file mode 100644
index 0000000..7ea6f64
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb
@@ -0,0 +1,56 @@
+SUMMARY = "Unique technology suite that makes possible the management of \
+extremely large and complex data collections"
+HOMEPAGE = "https://www.hdfgroup.org/"
+SECTION = "libs"
+
+LICENSE = "HDF5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=57e5351b17591e659eedae107265c606"
+
+inherit cmake
+
+SRC_URI = " \
+    https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/hdf5-${PV}/src/${BPN}-${PV}.tar.bz2 \
+    file://H5lib_settings.c \
+    file://H5Tinit.c \
+    file://0001-cross-compiling-support.patch \
+    file://0002-Remove-suffix-shared-from-shared-library-name.patch \
+"
+
+SRC_URI[md5sum] = "6f0353ee33e99089c110a1c8d2dd1b22"
+SRC_URI[sha256sum] = "59c03816105d57990329537ad1049ba22c2b8afe1890085f0c022b75f1727238"
+
+FILES_${PN} += "${libdir}/libhdf5.settings ${datadir}/*"
+
+EXTRA_OECMAKE = " \
+    -DTEST_LFS_WORKS_RUN=0 \
+    -DTEST_LFS_WORKS_RUN__TRYRUN_OUTPUT=0 \
+    -DH5_PRINTF_LL_TEST_RUN=1 \
+    -DH5_PRINTF_LL_TEST_RUN__TRYRUN_OUTPUT='8' \
+    -DH5_LDOUBLE_TO_LONG_SPECIAL_RUN=0 \
+    -DH5_LDOUBLE_TO_LONG_SPECIAL_RUN__TRYRUN_OUTPUT= \
+    -DH5_LONG_TO_LDOUBLE_SPECIAL_RUN=0 \
+    -DH5_LONG_TO_LDOUBLE_SPECIAL_RUN__TRYRUN_OUTPUT= \
+    -DH5_LDOUBLE_TO_LLONG_ACCURATE_RUN=0 \
+    -DH5_LDOUBLE_TO_LLONG_ACCURATE_RUN__TRYRUN_OUTPUT= \
+    -DH5_LLONG_TO_LDOUBLE_CORRECT_RUN=0 \
+    -DH5_LLONG_TO_LDOUBLE_CORRECT_RUN__TRYRUN_OUTPUT= \
+    -DH5_NO_ALIGNMENT_RESTRICTIONS_RUN=0 \
+    -DH5_NO_ALIGNMENT_RESTRICTIONS_RUN__TRYRUN_OUTPUT= \
+    -DCMAKE_INSTALL_PREFIX='${prefix}' \
+"
+
+do_unpack[postfuncs] += "gen_hd5file"
+gen_hd5file() {
+    install -m 544 ${WORKDIR}/H5lib_settings.c ${S}
+    install -m 544 ${WORKDIR}/H5Tinit.c ${S}
+}
+
+do_install_append() {
+    # Used for generating config files on target
+    install -m 755 ${B}/bin/H5detect ${D}${bindir}
+    install -m 755 ${B}/bin/H5make_libsettings ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native"
+
+SRC_DISTRIBUTE_LICENSES += "HDF5"
-- 
2.8.1


