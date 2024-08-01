Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4FCC3DA64
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 07:10:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.62572.1722496249824756093
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Aug 2024 00:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8943d9007b=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4715UdJI010442
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Aug 2024 00:10:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40mv61crdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Aug 2024 00:10:49 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 00:10:47 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][master][scarthgap][PATCH 1/1] hdf5: upgrade to 1.14.4
Date: Thu, 1 Aug 2024 07:10:29 +0000
Message-ID: <20240801071029.654297-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: cBGrUNJNqVwM1GFiVl8nUe3jm8W4tZVQ
X-Proofpoint-ORIG-GUID: cBGrUNJNqVwM1GFiVl8nUe3jm8W4tZVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_04,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408010040
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Aug 2024 07:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111489

From: Yogita Urade <yogita.urade@windriver.com>

Release notes:
https://github.com/HDFGroup/hdf5/blob/hdf5_1.14.4.3/release_docs/RELEASE.txt

License update: link update
from https://raw.githubusercontent.com/hdfgroup/hdf5/develop/COPYING_LBNL_HDF5
to https://raw.githubusercontent.com/hdfgroup/hdf5/hdf5_1_14/COPYING_LBNL_HDF5.

Upstream has only Released tar file extension is .gz so
SRC_URI tar file extension changed from .bz2 to .gz

Fixes
File /usr/lib/libhdf5.settings in package hdf5 contains reference to TMPDIR
File /usr/src/debug/hdf5/1.14.4-3/src/H5build_settings.c in package
hdf5-src contains reference to TMPDIR [buildpaths]

- Running H5make_libsettings is no longer required for cross-compiling
      The functionality of H5make_libsettings is now handled via template files,
      so H5make_libsettings has been removed.

- Running H5detect is no longer required for cross-compiling
      The functionality of H5detect is now exercised at library startup,
      so H5detect has been removed

Rework the patch 0001-cmake-remove-build-flags.patch to fix the build path
issue.

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../files/0001-cmake-remove-build-flags.patch | 41 +++----------------
 .../hdf5/{hdf5_1.14.2.bb => hdf5_1.14.4-3.bb} | 13 +++---
 2 files changed, 14 insertions(+), 40 deletions(-)
 rename meta-oe/recipes-support/hdf5/{hdf5_1.14.2.bb => hdf5_1.14.4-3.bb} (84%)

diff --git a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
index 68d9c3a3c..0d016ccb4 100644
--- a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
+++ b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
@@ -1,6 +1,6 @@
-From 4fa437782261c0da785d4574ad3a03700f624e66 Mon Sep 17 00:00:00 2001
+From 9f5afd99cce93e68996deb2b5fa7c32737d279fe Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
-Date: Tue, 19 Sep 2023 02:56:09 +0000
+Date: Tue, 16 Jul 2024 17:54:29 +0800
 Subject: [PATCH] cmake: remove build flags
 
 Don't generate the build host related info and reemove the build flags
@@ -11,11 +11,10 @@ Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
  config/cmake/libhdf5.settings.cmake.in | 18 +++++++++---------
- src/H5make_libsettings.c               | 17 -----------------
- 2 files changed, 9 insertions(+), 26 deletions(-)
+ 1 file changed, 9 insertions(+), 9 deletions(-)
 
 diff --git a/config/cmake/libhdf5.settings.cmake.in b/config/cmake/libhdf5.settings.cmake.in
-index f60f0de..f4433c0 100644
+index deb07ed..6f255c4 100644
 --- a/config/cmake/libhdf5.settings.cmake.in
 +++ b/config/cmake/libhdf5.settings.cmake.in
 @@ -23,23 +23,23 @@ Linking Options:
@@ -28,7 +27,7 @@ index f60f0de..f4433c0 100644
                       AM_LDFLAGS: @AM_LDFLAGS@
                  Extra libraries: @LINK_LIBS@
 -                       Archiver: @CMAKE_AR@
--                       AR_FLAGS: 
+-                       AR_FLAGS:
 -                         Ranlib: @CMAKE_RANLIB@
 +                       Archiver:
 +                       AR_FLAGS:
@@ -63,34 +62,6 @@ index f60f0de..f4433c0 100644
                     H5 C++ Flags: @HDF5_CMAKE_CXX_FLAGS@
                     AM C++ Flags: @AM_CXXFLAGS@
               Shared C++ Library: @H5_ENABLE_SHARED_LIB@
-diff --git a/src/H5make_libsettings.c b/src/H5make_libsettings.c
-index 2661288..7c0f84f 100644
---- a/src/H5make_libsettings.c
-+++ b/src/H5make_libsettings.c
-@@ -205,23 +205,6 @@ information about the library build configuration\n";
-     fprintf(rawoutstream, "/* Generated automatically by H5make_libsettings -- do not edit */\n\n\n");
-     fputs(FileHeader, rawoutstream); /*the copyright notice--see top of this file */
- 
--    fprintf(rawoutstream, " *\n * Created:\t\t%s %2d, %4d\n", month_name[tm->tm_mon], tm->tm_mday,
--            1900 + tm->tm_year);
--    if (pwd || real_name[0] || host_name[0]) {
--        fprintf(rawoutstream, " *\t\t\t");
--        if (real_name[0])
--            fprintf(rawoutstream, "%s <", real_name);
--#ifdef H5_HAVE_GETPWUID
--        if (pwd)
--            fputs(pwd->pw_name, rawoutstream);
--#endif
--        if (host_name[0])
--            fprintf(rawoutstream, "@%s", host_name);
--        if (real_name[0])
--            fprintf(rawoutstream, ">");
--        fputc('\n', rawoutstream);
--    }
--
-     fprintf(rawoutstream, " *\n * Purpose:\t\t");
- 
-     for (s = purpose; *s; s++) {
 -- 
-2.35.5
+2.25.1
 
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
similarity index 84%
rename from meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb
rename to meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index b8a81bb0b..f34e5f183 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -5,18 +5,18 @@ HOMEPAGE = "https://www.hdfgroup.org/"
 SECTION = "libs"
 
 LICENSE = "HDF5"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9ba0f3d878ab6c2403c86e9b0362d998"
+LIC_FILES_CHKSUM = "file://COPYING;md5=adebb1ecf1b3b80c13359e18ef67301e"
 
 inherit cmake siteinfo qemu multilib_header multilib_script
 
 DEPENDS += "qemu-native zlib"
 
 SRC_URI = " \
-    https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.14/hdf5-${PV}/src/${BPN}-${PV}.tar.bz2 \
+    https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.14/hdf5-1.14.4/src/${BPN}-${PV}.tar.gz \
     file://0002-Remove-suffix-shared-from-shared-library-name.patch \
     file://0001-cmake-remove-build-flags.patch \
 "
-SRC_URI[sha256sum] = "ea3c5e257ef322af5e77fc1e52ead3ad6bf3bb4ac06480dd17ee3900d7a24cfb"
+SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
 FILES:${PN} += "${libdir}/libhdf5.settings ${datadir}/*"
 
@@ -44,10 +44,13 @@ MULTILIB_SCRIPTS += "${PN}:${bindir}/h5cc \
                      ${PN}:${bindir}/h5hlcc \
 "
 
+do_configure:append() {
+    sed -i -e 's|${WORKDIR}||g' ${B}/src/libhdf5.settings
+    sed -i -e 's|${WORKDIR}||g' ${B}/src/H5build_settings.c
+}
+
 do_install:append() {
     # Used for generating config files on target
-    install -m 755 ${B}/bin/H5detect ${D}${bindir}
-    install -m 755 ${B}/bin/H5make_libsettings ${D}${bindir}
     oe_multilib_header H5pubconf.h
     # remove the buildpath
     sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/pkgconfig/hdf5.pc
-- 
2.40.0


