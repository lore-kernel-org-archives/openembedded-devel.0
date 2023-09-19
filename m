Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03DBCD343F
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 06:15:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1571.1695104133348172201
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 23:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BnweyNMt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7626e63108=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38J5XYHp020907
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 06:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=NXken
	vbV2wZkbMg2MvPdCkBBSVJ8aHSxyeOL+5MZjkM=; b=BnweyNMt5JzuGjsmO8bSh
	5qT+zEqGONB0lPA7soWUl4mW3H4kWnR7nZZWnvbRZSrn6x/R/W0lPggF6OCvNT7J
	se86BBdpVFhtZ85wlWadofZIBCShg9a9O4ARYoUNpSLm/J2oFwneUOIkM0I+Nzv8
	aecY+GPaC43UU2BG6ORZbb9JDwq2D4oSjYANWBasKSvRhe2gIyX9yA524uTWF3YK
	pfbYA8jQia38bJXHrM76Jzl6SPxyHLYnKpl5VtKJiPVmDpq35wULV+kGuMBSC1eI
	F5uItEhO/FM5PwuO45huRhoQN4P/QEETqme/6u8uEKaa19if9edwW7nm1Sf/1FNk
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t53b5t4g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 06:15:32 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 18 Sep 2023 23:15:31 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 23:15:30 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] hdf5: Upgrade to 1.14.2
Date: Tue, 19 Sep 2023 14:15:29 +0800
Message-ID: <20230919061529.3665463-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sbrAj0fPpfBBJjej3l8GsRO4xD0-I-yI
X-Proofpoint-ORIG-GUID: sbrAj0fPpfBBJjej3l8GsRO4xD0-I-yI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_11,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=750
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309190052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 06:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104957

From: Mingli Yu <mingli.yu@windriver.com>

License Update: link update
from http://support.hdfgroup.org/ftp/HDF5/releases/COPYING_LBNL_HDF5 to
https://raw.githubusercontent.com/hdfgroup/hdf5/develop/COPYING_LBNL_HDF5.

Rework the patch 0001-cmake-remove-build-flags.patch to fix the build path
issue.

Add zlib depends to fix the below failure:
  /build/tmp/work/core2-64-poky-linux/hdf5/1.14.2/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld: bin/libhdf5.so.310.2.0: undefined reference to `inflateEnd'
  /build/tmp/work/core2-64-poky-linux/hdf5/1.14.2/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld: bin/libhdf5.so.310.2.0: undefined reference to `inflate'
  /build/tmp/work/core2-64-poky-linux/hdf5/1.14.2/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld: bin/libhdf5.so.310.2.0: undefined reference to `compress2'
  /build/tmp/work/core2-64-poky-linux/hdf5/1.14.2/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld: bin/libhdf5.so.310.2.0: undefined reference to `inflateInit_'
  collect2: error: ld returned 1 exit status

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../files/0001-cmake-remove-build-flags.patch | 98 +++++++++++++------
 .../hdf5/{hdf5_1.14.0.bb => hdf5_1.14.2.bb}   | 11 ++-
 2 files changed, 76 insertions(+), 33 deletions(-)
 rename meta-oe/recipes-support/hdf5/{hdf5_1.14.0.bb => hdf5_1.14.2.bb} (76%)

diff --git a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
index a8050cc55..68d9c3a3c 100644
--- a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
+++ b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
@@ -1,58 +1,96 @@
-From 39572baac462f16b39dc385751d5c642646718d3 Mon Sep 17 00:00:00 2001
+From 4fa437782261c0da785d4574ad3a03700f624e66 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 4 Aug 2021 17:05:10 +0800
+Date: Tue, 19 Sep 2023 02:56:09 +0000
 Subject: [PATCH] cmake: remove build flags
 
-Remove the build flags to improve reproducibility.
+Don't generate the build host related info and reemove the build flags
+to improve reproducibility.
 
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- config/cmake/libh5cc.in                |  2 +-
- config/cmake/libhdf5.settings.cmake.in | 12 ++++++------
- 2 files changed, 7 insertions(+), 7 deletions(-)
+ config/cmake/libhdf5.settings.cmake.in | 18 +++++++++---------
+ src/H5make_libsettings.c               | 17 -----------------
+ 2 files changed, 9 insertions(+), 26 deletions(-)
 
---- a/config/cmake/libh5cc.in
-+++ b/config/cmake/libh5cc.in
-@@ -44,7 +44,7 @@ for arg in $@ ; do
-       exit $status
-       ;;
-     *)
--      @_PKG_CONFIG_COMPILER@ $@ `pkg-config --define-variable=prefix=$dir --cflags --libs @_PKG_CONFIG_LIBNAME@`
-+      `pkg-config --define-variable=prefix=$dir --cflags --libs @_PKG_CONFIG_LIBNAME@-@_PKG_CONFIG_VERSION@` $@
-       status=$?
-       exit $status
-       ;;
+diff --git a/config/cmake/libhdf5.settings.cmake.in b/config/cmake/libhdf5.settings.cmake.in
+index f60f0de..f4433c0 100644
 --- a/config/cmake/libhdf5.settings.cmake.in
 +++ b/config/cmake/libhdf5.settings.cmake.in
-@@ -27,14 +27,14 @@ Linking Options:
+@@ -23,23 +23,23 @@ Linking Options:
+ ----------------
+                       Libraries: @BUILD_NAME_EXT@
+   Statically Linked Executables: @BUILD_STATIC_EXECS@
+-                        LDFLAGS: @CMAKE_SHARED_LINKER_FLAGS@
++                        LDFLAGS:
                       H5_LDFLAGS: @H5_LDFLAGS@
                       AM_LDFLAGS: @AM_LDFLAGS@
                  Extra libraries: @LINK_LIBS@
 -                       Archiver: @CMAKE_AR@
+-                       AR_FLAGS: 
 -                         Ranlib: @CMAKE_RANLIB@
 +                       Archiver:
++                       AR_FLAGS:
 +                         Ranlib:
  
  Languages:
  ----------
                                C: YES
 -                     C Compiler: @CMAKE_C_COMPILER@ @CMAKE_C_COMPILER_VERSION@
--                       CPPFLAGS: @CPPFLAGS@
 +                     C Compiler:
-+                       CPPFLAGS:
+                        CPPFLAGS: @CPPFLAGS@
                      H5_CPPFLAGS: @H5_CPPFLAGS@
                      AM_CPPFLAGS: @AM_CPPFLAGS@
-                          CFLAGS: @CMAKE_C_FLAGS@
-@@ -53,8 +53,8 @@ Languages:
- @BUILD_FORTRAN_CONDITIONAL_TRUE@               Module Directory: @CMAKE_Fortran_MODULE_DIRECTORY@
+-                         CFLAGS: @CMAKE_C_FLAGS@
+-                      H5_CFLAGS: @HDF5_CMAKE_C_FLAGS@
++                         CFLAGS:
++                      H5_CFLAGS:
+                       AM_CFLAGS: @AM_CFLAGS@
+                Shared C Library: @H5_ENABLE_SHARED_LIB@
+                Static C Library: @H5_ENABLE_STATIC_LIB@
+@@ -51,11 +51,11 @@ Languages:
+                AM Fortran Flags: @AM_FCFLAGS@
+          Shared Fortran Library: @H5_ENABLE_SHARED_LIB@
+          Static Fortran Library: @H5_ENABLE_STATIC_LIB@
+-               Module Directory: @CMAKE_Fortran_MODULE_DIRECTORY@
++               Module Directory:
  
                              C++: @HDF5_BUILD_CPP_LIB@
--@BUILD_CXX_CONDITIONAL_TRUE@                   C++ Compiler: @CMAKE_CXX_COMPILER@ @CMAKE_CXX_COMPILER_VERSION@
--@BUILD_CXX_CONDITIONAL_TRUE@                      C++ Flags: @CMAKE_CXX_FLAGS@
-+@BUILD_CXX_CONDITIONAL_TRUE@                   C++ Compiler:
-+@BUILD_CXX_CONDITIONAL_TRUE@                      C++ Flags:
- @BUILD_CXX_CONDITIONAL_TRUE@                   H5 C++ Flags: @HDF5_CMAKE_CXX_FLAGS@
- @BUILD_CXX_CONDITIONAL_TRUE@                   AM C++ Flags: @AM_CXXFLAGS@
- @BUILD_CXX_CONDITIONAL_TRUE@             Shared C++ Library: @H5_ENABLE_SHARED_LIB@
+                    C++ Compiler: @CMAKE_CXX_COMPILER@ @CMAKE_CXX_COMPILER_VERSION@
+-                      C++ Flags: @CMAKE_CXX_FLAGS@
++                      C++ Flags:
+                    H5 C++ Flags: @HDF5_CMAKE_CXX_FLAGS@
+                    AM C++ Flags: @AM_CXXFLAGS@
+              Shared C++ Library: @H5_ENABLE_SHARED_LIB@
+diff --git a/src/H5make_libsettings.c b/src/H5make_libsettings.c
+index 2661288..7c0f84f 100644
+--- a/src/H5make_libsettings.c
++++ b/src/H5make_libsettings.c
+@@ -205,23 +205,6 @@ information about the library build configuration\n";
+     fprintf(rawoutstream, "/* Generated automatically by H5make_libsettings -- do not edit */\n\n\n");
+     fputs(FileHeader, rawoutstream); /*the copyright notice--see top of this file */
+ 
+-    fprintf(rawoutstream, " *\n * Created:\t\t%s %2d, %4d\n", month_name[tm->tm_mon], tm->tm_mday,
+-            1900 + tm->tm_year);
+-    if (pwd || real_name[0] || host_name[0]) {
+-        fprintf(rawoutstream, " *\t\t\t");
+-        if (real_name[0])
+-            fprintf(rawoutstream, "%s <", real_name);
+-#ifdef H5_HAVE_GETPWUID
+-        if (pwd)
+-            fputs(pwd->pw_name, rawoutstream);
+-#endif
+-        if (host_name[0])
+-            fprintf(rawoutstream, "@%s", host_name);
+-        if (real_name[0])
+-            fprintf(rawoutstream, ">");
+-        fputc('\n', rawoutstream);
+-    }
+-
+     fprintf(rawoutstream, " *\n * Purpose:\t\t");
+ 
+     for (s = purpose; *s; s++) {
+-- 
+2.35.5
+
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb
similarity index 76%
rename from meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb
rename to meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb
index d0ff2ef48..68b91c0b0 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb
@@ -5,18 +5,18 @@ HOMEPAGE = "https://www.hdfgroup.org/"
 SECTION = "libs"
 
 LICENSE = "HDF5"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ac1039f6bf7c9ab2b3693836f46d0735"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9ba0f3d878ab6c2403c86e9b0362d998"
 
 inherit cmake siteinfo qemu multilib_header
 
-DEPENDS += "qemu-native"
+DEPENDS += "qemu-native zlib"
 
 SRC_URI = " \
     https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.14/hdf5-${PV}/src/${BPN}-${PV}.tar.bz2 \
     file://0002-Remove-suffix-shared-from-shared-library-name.patch \
     file://0001-cmake-remove-build-flags.patch \
 "
-SRC_URI[sha256sum] = "e4e79433450edae2865a4c6328188bb45391b29d74f8c538ee699f0b116c2ba0"
+SRC_URI[sha256sum] = "ea3c5e257ef322af5e77fc1e52ead3ad6bf3bb4ac06480dd17ee3900d7a24cfb"
 
 FILES:${PN} += "${libdir}/libhdf5.settings ${datadir}/*"
 
@@ -45,6 +45,11 @@ do_install:append() {
     install -m 755 ${B}/bin/H5detect ${D}${bindir}
     install -m 755 ${B}/bin/H5make_libsettings ${D}${bindir}
     oe_multilib_header H5pubconf.h
+    # remove the buildpath
+    sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/pkgconfig/hdf5.pc
+    sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/hdf5-targets.cmake
+    sed -i -e 's|${RECIPE_SYSROOT_NATIVE}||g' ${D}${bindir}/h5hlcc
+    sed -i -e 's|${RECIPE_SYSROOT_NATIVE}||g' ${D}${bindir}/h5cc
 }
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


