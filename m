Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0229E7718E
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 06:38:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9166.1734935909165553077
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Dec 2024 22:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2087a7b2cf=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN5DoWG002637;
	Mon, 23 Dec 2024 06:38:27 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nmn89gkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Dec 2024 06:38:27 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 22 Dec 2024 22:38:26 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 22 Dec 2024 22:38:25 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <akuster808@gmail.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][kirkstone][PATCH 1/3] Use 7zip 24.09 to replace p7zip 16.02
Date: Mon, 23 Dec 2024 14:38:22 +0800
Message-ID: <20241223063824.2495987-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: TF1u5zCF0UlxcdjWYGQwszT5PMP1SWgF
X-Proofpoint-ORIG-GUID: TF1u5zCF0UlxcdjWYGQwszT5PMP1SWgF
X-Authority-Analysis: v=2.4 cv=CeHy5Krl c=1 sm=1 tr=0 ts=67690563 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=FP58Ms26AAAA:8 a=xNf9USuDAAAA:8 a=PTOB6kbnAAAA:8 a=NEAV23lmAAAA:8 a=6I5d2MoRAAAA:8 a=rSOwsd83AAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Qnov7ifiAAAA:8 a=a_U1oVfrAAAA:8 a=m9PdqqSwfJ03ElKz0OIA:9 a=lvfz_6v1X3QA:10 a=z6duCZvG03gA:10 a=rfQBsaRwJpcA:10 a=L0az8WXCj77rZHF50HxO:22 a=u88H62rNFFGbxZIp_uAB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=4d9-RgBc9cJG6cC6SkVU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-23_02,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412230057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 06:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114463

According to DOC/readme.txt [1]:

    7-Zip and p7zip
    ===============
    Now there are two different ports of 7-Zip for Linux/macOS:

    1) p7zip - another port of 7-Zip for Linux, made by an independent developer.
       The latest version of p7zip now is 16.02, and that p7zip 16.02 is outdated now.
       http://sourceforge.net/projects/p7zip/

    2) 7-Zip for Linux/macOS - this package - it's new code with all changes from latest 7-Zip for Windows

Add recipe 7-zip [2] to instead of recipe p7zip[3] in which the upstream is dead since 2016

Use git repo to instead of tarball

Drop obsolete patches
- CVE-2016-9296.patch
- CVE-2017-17969.patch
- CVE-2018-5996.patch
- change_numMethods_from_bool_to_unsigned.patch
- 0001-Fix-two-buffer-overflow-vulnerabilities.patch
- 0001-Fix-narrowing-errors-Wc-11-narrowing.patch

License-Update: DOC/License.txt: Add BSD-2-Clause & BSD-3-Clause

The codec libraries was removed since 21.02 [4]

Refer debian to compile 7-zip [5]

Add link 7z.so to lib7z.so and create wrapper to command 7z
which required running with absolute path to link the library 7z.so

[1] https://salsa.debian.org/debian/7zip/-/blob/master/DOC/readme.txt?ref_type=heads
[2] https://sourceforge.net/projects/p7zip/
[3] https://www.7-zip.org/
[4] https://github.com/p7zip-project/p7zip/commit/6c6ed1eba9ff0c0ded9323600f1f3c686d6b6692
[5] https://salsa.debian.org/debian/7zip/-/blob/master/debian/rules

(cherry picked from commit 4cac1be12dd0221515951642d8c4362bf9a8b4d7)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/7zip/7zip_24.09.bb   |  56 +++
 .../0001-support-yocto-cross-compiling.patch  |  51 ++
 .../recipes-extended/7zip/files/7z_wrapper.sh |   4 +
 ...Fix-narrowing-errors-Wc-11-narrowing.patch |  49 --
 ...-two-buffer-overflow-vulnerabilities.patch | 455 ------------------
 .../p7zip/files/CVE-2016-9296.patch           |  30 --
 .../p7zip/files/CVE-2017-17969.patch          |  40 --
 .../p7zip/files/CVE-2018-5996.patch           | 228 ---------
 ...nge_numMethods_from_bool_to_unsigned.patch |  34 --
 ...t_override_compiler_and_do_not_strip.patch |  38 --
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |  45 --
 11 files changed, 111 insertions(+), 919 deletions(-)
 create mode 100644 meta-oe/recipes-extended/7zip/7zip_24.09.bb
 create mode 100644 meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-compiling.patch
 create mode 100755 meta-oe/recipes-extended/7zip/files/7z_wrapper.sh
 delete mode 100644 meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors-Wc-11-narrowing.patch
 delete mode 100644 meta-oe/recipes-extended/p7zip/files/0001-Fix-two-buffer-overflow-vulnerabilities.patch
 delete mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
 delete mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch
 delete mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
 delete mode 100644 meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
 delete mode 100644 meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
 delete mode 100644 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb

diff --git a/meta-oe/recipes-extended/7zip/7zip_24.09.bb b/meta-oe/recipes-extended/7zip/7zip_24.09.bb
new file mode 100644
index 000000000..99cb28554
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/7zip_24.09.bb
@@ -0,0 +1,56 @@
+SUMMARY = "7-zip is a commandline utility handling 7z archives."
+HOMEPAGE = "http://www.7-zip.org/"
+LICENSE = "LGPL-2.1-or-later & unRAR & PD & BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://DOC/copying.txt;md5=4fbd65380cdd255951079008b364516c \
+                    file://DOC/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de \
+                    file://DOC/License.txt;md5=44483e232b64ffca25fe001f3d6418d0"
+
+CVE_PRODUCT = "7-zip 7zip"
+SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main \
+           file://0001-support-yocto-cross-compiling.patch \
+           file://7z_wrapper.sh \
+           "
+SRCREV = "e5431fa6f5505e385c6f9367260717e9c47dc2ee"
+
+UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
+
+S = "${WORKDIR}/git"
+
+# Support Yocto cross compiling
+EXTRA_OEMAKE += " \
+    CXXFLAGS_EXTRA='${CXXFLAGS}' \
+    CFLAGS_BASE2='${CFLAGS}' \
+    LDFLAGS_STATIC_3='${LDFLAGS}' \
+"
+
+do_compile() {
+    oe_runmake -C CPP/7zip/Bundles/Alone2    -f ../../cmpl_gcc.mak
+    oe_runmake -C CPP/7zip/Bundles/Format7zF -f ../../cmpl_gcc.mak
+    oe_runmake -C CPP/7zip/UI/Console        -f ../../cmpl_gcc.mak
+    oe_runmake -C CPP/7zip/Bundles/SFXCon    -f ../../cmpl_gcc.mak
+    oe_runmake -C CPP/7zip/Bundles/Alone     -f ../../cmpl_gcc.mak
+    oe_runmake -C CPP/7zip/Bundles/Alone7z   -f ../../cmpl_gcc.mak
+}
+
+FILES:${PN} += "${libdir}/*"
+
+FILES_SOLIBSDEV = ""
+INSANE_SKIP:${PN} += "dev-so"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/CPP/7zip/Bundles/Alone/b/g/7za ${D}${bindir}
+	install -m 0755 ${S}/CPP/7zip/Bundles/Alone7z/b/g/7zr ${D}${bindir}
+	install -m 0755 ${S}/CPP/7zip/UI/Console/b/g/7z ${D}${bindir}/7z.real
+	install -m 0755 ${WORKDIR}/7z_wrapper.sh ${D}${bindir}/7z
+
+	install -d ${D}${libdir}
+	install -m 0755 ${S}/CPP/7zip/Bundles/Format7zF/b/g/7z.so ${D}${libdir}/lib7z.so
+	ln -rsn ${D}${libdir}/lib7z.so ${D}${bindir}/7z.so
+}
+
+PROVIDES += "p7zip"
+RPROVIDES:${PN} += "lib7z.so()(64bit) 7z lib7z.so p7zip"
+RPROVIDES:${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-compiling.patch b/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-compiling.patch
new file mode 100644
index 000000000..06908e94f
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-compiling.patch
@@ -0,0 +1,51 @@
+From fd0d54f96576a8ff572bb7c7d28df6b097f99a30 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 18 Dec 2024 16:38:11 +0800
+Subject: [PATCH] support yocto cross compiling
+
+Remove -s from $LFLAGS_STRIP, do not strip binary to workaournd
+Yocto build warning
+...
+WARNING: 7zip-native-24.09-r0 do_populate_sysroot: File 'tmp/work/x86_64-linux/
+7zip-native/24.09/recipe-sysroot-native/usr/lib/7z.so' from 7zip-native was already stripped,
+this will prevent future debugging!
+...
+
+Apply CC, CXX from environments
+
+Upstream-Status: Inappropriate [Yocto specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ CPP/7zip/7zip_gcc.mak | 2 +-
+ CPP/7zip/var_gcc.mak  | 2 --
+ 2 files changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/CPP/7zip/7zip_gcc.mak b/CPP/7zip/7zip_gcc.mak
+index bcb06a0..297f0a8 100644
+--- a/CPP/7zip/7zip_gcc.mak
++++ b/CPP/7zip/7zip_gcc.mak
+@@ -45,7 +45,7 @@ CFLAGS_DEBUG = -g
+ else
+ CFLAGS_DEBUG = -DNDEBUG
+ ifneq ($(CC), $(CROSS_COMPILE)clang)
+-LFLAGS_STRIP = -s
++LFLAGS_STRIP = 
+ endif
+ endif
+ 
+diff --git a/CPP/7zip/var_gcc.mak b/CPP/7zip/var_gcc.mak
+index 664491c..6d0f485 100644
+--- a/CPP/7zip/var_gcc.mak
++++ b/CPP/7zip/var_gcc.mak
+@@ -6,7 +6,5 @@ IS_ARM64=
+ CROSS_COMPILE=
+ MY_ARCH=
+ USE_ASM=
+-CC=$(CROSS_COMPILE)gcc
+-CXX=$(CROSS_COMPILE)g++
+ 
+ # -march=armv8-a+crc+crypto
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/7zip/files/7z_wrapper.sh b/meta-oe/recipes-extended/7zip/files/7z_wrapper.sh
new file mode 100755
index 000000000..af5b9b393
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/files/7z_wrapper.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+realpath=`readlink -fn $0`
+realdir=`dirname $realpath`
+exec $realdir/7z.real "$@"
diff --git a/meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors-Wc-11-narrowing.patch b/meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors-Wc-11-narrowing.patch
deleted file mode 100644
index 1f08d1603..000000000
--- a/meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors-Wc-11-narrowing.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 653674e11872465dd5edf1c1e8413ea813d7e086 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Apr 2018 23:07:21 -0700
-Subject: [PATCH] Fix narrowing errors -Wc++11-narrowing
-
-Clang 6.x finds these errors
-
-    ../../../../CPP/Windows/ErrorMsg.cpp:24:10: error: case value evaluates to -2147024809, which cannot be narrowed to type 'DWORD' (aka 'unsigned int') [-Wc++11-narrowing]
-        case E_INVALIDARG          : txt = "E_INVALIDARG"; break ;
-             ^
-
-HRESULT causes the macro to be parsed as a signed long, so we need to force it
-to be checked as an unsigned long instead.
-
-also reported here https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=224930
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- CPP/Windows/ErrorMsg.cpp | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/CPP/Windows/ErrorMsg.cpp b/CPP/Windows/ErrorMsg.cpp
-index 99684ae..78a64ba 100644
---- a/CPP/Windows/ErrorMsg.cpp
-+++ b/CPP/Windows/ErrorMsg.cpp
-@@ -15,13 +15,13 @@ UString MyFormatMessage(DWORD errorCode)
- 
-   switch(errorCode) {
-     case ERROR_NO_MORE_FILES   : txt = "No more files"; break ;
--    case E_NOTIMPL             : txt = "E_NOTIMPL"; break ;
--    case E_NOINTERFACE         : txt = "E_NOINTERFACE"; break ;
--    case E_ABORT               : txt = "E_ABORT"; break ;
--    case E_FAIL                : txt = "E_FAIL"; break ;
--    case STG_E_INVALIDFUNCTION : txt = "STG_E_INVALIDFUNCTION"; break ;
--    case E_OUTOFMEMORY         : txt = "E_OUTOFMEMORY"; break ;
--    case E_INVALIDARG          : txt = "E_INVALIDARG"; break ;
-+    case (DWORD) E_NOTIMPL             : txt = "E_NOTIMPL"; break ;
-+    case (DWORD) E_NOINTERFACE         : txt = "E_NOINTERFACE"; break ;
-+    case (DWORD) E_ABORT               : txt = "E_ABORT"; break ;
-+    case (DWORD) E_FAIL                : txt = "E_FAIL"; break ;
-+    case (DWORD) STG_E_INVALIDFUNCTION : txt = "STG_E_INVALIDFUNCTION"; break ;
-+    case (DWORD) E_OUTOFMEMORY         : txt = "E_OUTOFMEMORY"; break ;
-+    case (DWORD) E_INVALIDARG          : txt = "E_INVALIDARG"; break ;
-     case ERROR_DIRECTORY          : txt = "Error Directory"; break ;
-     default:
-       txt = strerror(errorCode);
diff --git a/meta-oe/recipes-extended/p7zip/files/0001-Fix-two-buffer-overflow-vulnerabilities.patch b/meta-oe/recipes-extended/p7zip/files/0001-Fix-two-buffer-overflow-vulnerabilities.patch
deleted file mode 100644
index d149c3413..000000000
--- a/meta-oe/recipes-extended/p7zip/files/0001-Fix-two-buffer-overflow-vulnerabilities.patch
+++ /dev/null
@@ -1,455 +0,0 @@
-From 1f266347b154ed90b8262126f04e8cc8f59fa617 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 22 Nov 2024 21:25:21 +0800
-Subject: [PATCH] Fix two buffer overflow vulnerabilities
-
-According to [1][2], Igor Pavlov, the author of 7-Zip, refused to
-provide an advisory or any related change log entries. We have to
-backport a part of ./CPP/7zip/Archive/NtfsHandler.cpp from upstream
-big commit
-
-Upstream-Status: Backport [https://github.com/ip7z/7zip/commit/fc662341e6f85da78ada0e443f6116b978f79f22]
-
-[1] https://dfir.ru/2024/06/19/vulnerabilities-in-7-zip-and-ntfs3/
-[2] https://dfir.ru/wp-content/uploads/2024/07/screenshot-2024-07-03-at-02-13-40-7-zip-_-bugs-_-2402-two-vulnerabilities-in-the-ntfs-handler.png
-
-CVE: CVE-2023-52169
-CVE: CVE-2023-52168
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- CPP/7zip/Archive/NtfsHandler.cpp | 229 ++++++++++++++++++++-----------
- 1 file changed, 151 insertions(+), 78 deletions(-)
-
-diff --git a/CPP/7zip/Archive/NtfsHandler.cpp b/CPP/7zip/Archive/NtfsHandler.cpp
-index 93e9f88..2701439 100644
---- a/CPP/7zip/Archive/NtfsHandler.cpp
-+++ b/CPP/7zip/Archive/NtfsHandler.cpp
-@@ -71,8 +71,9 @@ struct CHeader
- {
-   unsigned SectorSizeLog;
-   unsigned ClusterSizeLog;
-+  unsigned MftRecordSizeLog;
-   // Byte MediaType;
--  UInt32 NumHiddenSectors;
-+  //UInt32 NumHiddenSectors;
-   UInt64 NumSectors;
-   UInt64 NumClusters;
-   UInt64 MftCluster;
-@@ -111,30 +112,42 @@ bool CHeader::Parse(const Byte *p)
-   if (memcmp(p + 3, "NTFS    ", 8) != 0)
-     return false;
-   {
--    int t = GetLog(Get16(p + 11));
--    if (t < 9 || t > 12)
--      return false;
--    SectorSizeLog = t;
--    t = GetLog(p[13]);
--    if (t < 0)
--      return false;
--    sectorsPerClusterLog = t;
--    ClusterSizeLog = SectorSizeLog + sectorsPerClusterLog;
--    if (ClusterSizeLog > 30)
--      return false;
-+    {
-+      const int t = GetLog(Get16(p + 11));
-+      if (t < 9 || t > 12)
-+        return false;
-+      SectorSizeLog = (unsigned)t;
-+    }
-+    {
-+      const unsigned v = p[13];
-+      if (v <= 0x80)
-+      {
-+        const int t = GetLog(v);
-+        if (t < 0)
-+          return false;
-+        sectorsPerClusterLog = (unsigned)t;
-+      }
-+      else
-+        sectorsPerClusterLog = 0x100 - v;
-+      ClusterSizeLog = SectorSizeLog + sectorsPerClusterLog;
-+      if (ClusterSizeLog > 30)
-+        return false;
-+    }
-   }
- 
-   for (int i = 14; i < 21; i++)
-     if (p[i] != 0)
-       return false;
- 
-+  // F8 : a hard disk
-+  // F0 : high-density 3.5-inch floppy disk
-   if (p[21] != 0xF8) // MediaType = Fixed_Disk
-     return false;
-   if (Get16(p + 22) != 0) // NumFatSectors
-     return false;
--  G16(p + 24, SectorsPerTrack); // 63 usually
--  G16(p + 26, NumHeads); // 255
--  G32(p + 28, NumHiddenSectors); // 63 (XP) / 2048 (Vista and win7) / (0 on media that are not partitioned ?)
-+  // G16(p + 24, SectorsPerTrack); // 63 usually
-+  // G16(p + 26, NumHeads); // 255
-+  // G32(p + 28, NumHiddenSectors); // 63 (XP) / 2048 (Vista and win7) / (0 on media that are not partitioned ?)
-   if (Get32(p + 32) != 0) // NumSectors32
-     return false;
- 
-@@ -156,14 +169,47 @@ bool CHeader::Parse(const Byte *p)
- 
-   NumClusters = NumSectors >> sectorsPerClusterLog;
- 
--  G64(p + 0x30, MftCluster);
-+  G64(p + 0x30, MftCluster);   // $MFT.
-   // G64(p + 0x38, Mft2Cluster);
--  G64(p + 0x48, SerialNumber);
--  UInt32 numClustersInMftRec;
--  UInt32 numClustersInIndexBlock;
--  G32(p + 0x40, numClustersInMftRec); // -10 means 2 ^10 = 1024 bytes.
--  G32(p + 0x44, numClustersInIndexBlock);
--  return (numClustersInMftRec < 256 && numClustersInIndexBlock < 256);
-+  G64(p + 0x48, SerialNumber); // $MFTMirr
-+
-+  /*
-+    numClusters_per_MftRecord:
-+    numClusters_per_IndexBlock:
-+    only low byte from 4 bytes is used. Another 3 high bytes are zeros.
-+      If the number is positive (number < 0x80),
-+          then it represents the number of clusters.
-+      If the number is negative (number >= 0x80),
-+          then the size of the file record is 2 raised to the absolute value of this number.
-+          example: (0xF6 == -10) means 2^10 = 1024 bytes.
-+  */
-+  {
-+    UInt32 numClusters_per_MftRecord;
-+    G32(p + 0x40, numClusters_per_MftRecord);
-+    if (numClusters_per_MftRecord >= 0x100 || numClusters_per_MftRecord == 0)
-+      return false;
-+    if (numClusters_per_MftRecord < 0x80)
-+    {
-+      const int t = GetLog(numClusters_per_MftRecord);
-+      if (t < 0)
-+        return false;
-+      MftRecordSizeLog = (unsigned)t + ClusterSizeLog;
-+    }
-+    else
-+      MftRecordSizeLog = 0x100 - numClusters_per_MftRecord;
-+    // what exact MFT record sizes are possible and supported by Windows?
-+    // do we need to change this limit here?
-+    const unsigned k_MftRecordSizeLog_MAX = 12;
-+    if (MftRecordSizeLog > k_MftRecordSizeLog_MAX)
-+      return false;
-+    if (MftRecordSizeLog < SectorSizeLog)
-+      return false;
-+  }
-+  {
-+    UInt32 numClusters_per_IndexBlock;
-+    G32(p + 0x44, numClusters_per_IndexBlock);
-+    return (numClusters_per_IndexBlock < 0x100);
-+  }
- }
- 
- struct CMftRef
-@@ -235,7 +281,7 @@ struct CFileNameAttr
-   bool Parse(const Byte *p, unsigned size);
- };
- 
--static void GetString(const Byte *p, unsigned len, UString2 &res)
-+static void GetString(const Byte *p, const unsigned len, UString2 &res)
- {
-   if (len == 0 && res.IsEmpty())
-     return;
-@@ -266,8 +312,8 @@ bool CFileNameAttr::Parse(const Byte *p, unsigned size)
-   G32(p + 0x38, Attrib);
-   // G16(p + 0x3C, PackedEaSize);
-   NameType = p[0x41];
--  unsigned len = p[0x40];
--  if (0x42 + len > size)
-+  const unsigned len = p[0x40];
-+  if (0x42 + len * 2 > size)
-     return false;
-   if (len != 0)
-     GetString(p + 0x42, len, Name);
-@@ -954,6 +1000,14 @@ struct CDataRef
- static const UInt32 kMagic_FILE = 0x454C4946;
- static const UInt32 kMagic_BAAD = 0x44414142;
- 
-+// 22.02: we support some rare case magic values:
-+static const UInt32 kMagic_INDX = 0x58444e49;
-+static const UInt32 kMagic_HOLE = 0x454c4f48;
-+static const UInt32 kMagic_RSTR = 0x52545352;
-+static const UInt32 kMagic_RCRD = 0x44524352;
-+static const UInt32 kMagic_CHKD = 0x444b4843;
-+static const UInt32 kMagic_FFFFFFFF = 0xFFFFFFFF;
-+
- struct CMftRec
- {
-   UInt32 Magic;
-@@ -1030,6 +1084,26 @@ struct CMftRec
- 
-   bool Parse(Byte *p, unsigned sectorSizeLog, UInt32 numSectors, UInt32 recNumber, CObjectVector<CAttr> *attrs);
- 
-+  bool Is_Magic_Empty() const
-+  {
-+    // what exact Magic values are possible for empty and unused records?
-+    const UInt32 k_Magic_Unused_MAX = 5; // 22.02
-+    return (Magic <= k_Magic_Unused_MAX);
-+  }
-+  bool Is_Magic_FILE() const { return (Magic == kMagic_FILE); }
-+  // bool Is_Magic_BAAD() const { return (Magic == kMagic_BAAD); }
-+  bool Is_Magic_CanIgnore() const
-+  {
-+    return Is_Magic_Empty()
-+        || Magic == kMagic_BAAD
-+        || Magic == kMagic_INDX
-+        || Magic == kMagic_HOLE
-+        || Magic == kMagic_RSTR
-+        || Magic == kMagic_RCRD
-+        || Magic == kMagic_CHKD
-+        || Magic == kMagic_FFFFFFFF;
-+  }
-+
-   bool IsEmpty() const { return (Magic <= 2); }
-   bool IsFILE() const { return (Magic == kMagic_FILE); }
-   bool IsBAAD() const { return (Magic == kMagic_BAAD); }
-@@ -1141,9 +1215,8 @@ bool CMftRec::Parse(Byte *p, unsigned sectorSizeLog, UInt32 numSectors, UInt32 r
-     CObjectVector<CAttr> *attrs)
- {
-   G32(p, Magic);
--  if (!IsFILE())
--    return IsEmpty() || IsBAAD();
--
-+  if (!Is_Magic_FILE())
-+    return Is_Magic_CanIgnore();
-   
-   {
-     UInt32 usaOffset;
-@@ -1188,12 +1261,12 @@ bool CMftRec::Parse(Byte *p, unsigned sectorSizeLog, UInt32 numSectors, UInt32 r
-   G16(p + 0x10, SeqNumber);
-   // G16(p + 0x12, LinkCount);
-   // PRF(printf(" L=%d", LinkCount));
--  UInt32 attrOffs = Get16(p + 0x14);
-+  const UInt32 attrOffs = Get16(p + 0x14);
-   G16(p + 0x16, Flags);
-   PRF(printf(" F=%4X", Flags));
- 
--  UInt32 bytesInUse = Get32(p + 0x18);
--  UInt32 bytesAlloc = Get32(p + 0x1C);
-+  const UInt32 bytesInUse = Get32(p + 0x18);
-+  const UInt32 bytesAlloc = Get32(p + 0x1C);
-   G64(p + 0x20, BaseMftRef.Val);
-   if (BaseMftRef.Val != 0)
-   {
-@@ -1667,68 +1740,57 @@ HRESULT CDatabase::Open()
-  
-   SeekToCluster(Header.MftCluster);
- 
--  CMftRec mftRec;
--  UInt32 numSectorsInRec;
--
-+  // we use ByteBuf for records reading.
-+  // so the size of ByteBuf must be >= mftRecordSize
-+  const size_t recSize = (size_t)1 << Header.MftRecordSizeLog;
-+  const size_t kBufSize = MyMax((size_t)(1 << 15), recSize);
-+  ByteBuf.Alloc(kBufSize);
-+  RINOK(ReadStream_FALSE(InStream, ByteBuf, recSize))
-+  {
-+    const UInt32 allocSize = Get32(ByteBuf + 0x1C);
-+    if (allocSize != recSize)
-+      return S_FALSE;
-+  }
-+  // MftRecordSizeLog >= SectorSizeLog
-+  const UInt32 numSectorsInRec = 1u << (Header.MftRecordSizeLog - Header.SectorSizeLog);
-   CMyComPtr<IInStream> mftStream;
-+  CMftRec mftRec;
-   {
--    UInt32 blockSize = 1 << 12;
--    ByteBuf.Alloc(blockSize);
--    RINOK(ReadStream_FALSE(InStream, ByteBuf, blockSize));
--    
--    {
--      UInt32 allocSize = Get32(ByteBuf + 0x1C);
--      int t = GetLog(allocSize);
--      if (t < (int)Header.SectorSizeLog)
--        return S_FALSE;
--      RecSizeLog = t;
--      if (RecSizeLog > 15)
--        return S_FALSE;
--    }
--
--    numSectorsInRec = 1 << (RecSizeLog - Header.SectorSizeLog);
-     if (!mftRec.Parse(ByteBuf, Header.SectorSizeLog, numSectorsInRec, 0, NULL))
-       return S_FALSE;
--    if (!mftRec.IsFILE())
-+    if (!mftRec.Is_Magic_FILE())
-       return S_FALSE;
-     mftRec.ParseDataNames();
-     if (mftRec.DataRefs.IsEmpty())
-       return S_FALSE;
--    RINOK(mftRec.GetStream(InStream, 0, Header.ClusterSizeLog, Header.NumClusters, &mftStream));
-+    RINOK(mftRec.GetStream(InStream, 0, Header.ClusterSizeLog, Header.NumClusters, &mftStream))
-     if (!mftStream)
-       return S_FALSE;
-   }
- 
-   // CObjectVector<CAttr> SecurityAttrs;
- 
--  UInt64 mftSize = mftRec.DataAttrs[0].Size;
-+  const UInt64 mftSize = mftRec.DataAttrs[0].Size;
-   if ((mftSize >> 4) > Header.GetPhySize_Clusters())
-     return S_FALSE;
- 
--  const size_t kBufSize = (1 << 15);
--  const size_t recSize = ((size_t)1 << RecSizeLog);
--  if (kBufSize < recSize)
--    return S_FALSE;
--
-   {
--    const UInt64 numFiles = mftSize >> RecSizeLog;
-+    const UInt64 numFiles = mftSize >> Header.MftRecordSizeLog;
-     if (numFiles > (1 << 30))
-       return S_FALSE;
-     if (OpenCallback)
-     {
-       RINOK(OpenCallback->SetTotal(&numFiles, &mftSize));
-     }
--    
--    ByteBuf.Alloc(kBufSize);
-     Recs.ClearAndReserve((unsigned)numFiles);
-   }
--  
-+ 
-   for (UInt64 pos64 = 0;;)
-   {
-     if (OpenCallback)
-     {
-       const UInt64 numFiles = Recs.Size();
--      if ((numFiles & 0x3FF) == 0)
-+      if ((numFiles & 0x3FFF) == 0)
-       {
-         RINOK(OpenCallback->SetCompleted(&numFiles, &pos64));
-       }
-@@ -1817,12 +1879,18 @@ HRESULT CDatabase::Open()
-   for (i = 0; i < Recs.Size(); i++)
-   {
-     CMftRec &rec = Recs[i];
-+    if (!rec.Is_Magic_FILE())
-+      continue;
-+
-     if (!rec.BaseMftRef.IsBaseItself())
-     {
--      UInt64 refIndex = rec.BaseMftRef.GetIndex();
--      if (refIndex > (UInt32)Recs.Size())
-+      const UInt64 refIndex = rec.BaseMftRef.GetIndex();
-+      if (refIndex >= Recs.Size())
-         return S_FALSE;
-       CMftRec &refRec = Recs[(unsigned)refIndex];
-+      if (!refRec.Is_Magic_FILE())
-+        continue;
-+
-       bool moveAttrs = (refRec.SeqNumber == rec.BaseMftRef.GetNumber() && refRec.BaseMftRef.IsBaseItself());
-       if (rec.InUse() && refRec.InUse())
-       {
-@@ -1837,12 +1905,17 @@ HRESULT CDatabase::Open()
-   }
- 
-   for (i = 0; i < Recs.Size(); i++)
--    Recs[i].ParseDataNames();
-+  {
-+    CMftRec &rec = Recs[i];
-+    if (!rec.Is_Magic_FILE())
-+      continue;
-+    rec.ParseDataNames();
-+  }
-   
-   for (i = 0; i < Recs.Size(); i++)
-   {
-     CMftRec &rec = Recs[i];
--    if (!rec.IsFILE() || !rec.BaseMftRef.IsBaseItself())
-+    if (!rec.Is_Magic_FILE() || !rec.BaseMftRef.IsBaseItself())
-       continue;
-     if (i < kNumSysRecs && !_showSystemFiles)
-       continue;
-@@ -1864,7 +1937,7 @@ HRESULT CDatabase::Open()
-       FOR_VECTOR (di, rec.DataRefs)
-         if (rec.DataAttrs[rec.DataRefs[di].Start].Name.IsEmpty())
-         {
--          indexOfUnnamedStream = di;
-+          indexOfUnnamedStream = (int)di;
-           break;
-         }
-     }
-@@ -1922,14 +1995,14 @@ HRESULT CDatabase::Open()
-           indexOfUnnamedStream);
-       
-       if (rec.MyItemIndex < 0)
--        rec.MyItemIndex = Items.Size();
--      item.ParentHost = Items.Add(item);
-+        rec.MyItemIndex = (int)Items.Size();
-+      item.ParentHost = (int)Items.Add(item);
-       
-       /* we can use that code to reduce the number of alt streams:
-          it will not show how alt streams for hard links. */
-       // if (!isMainName) continue; isMainName = false;
- 
--      unsigned numAltStreams = 0;
-+      // unsigned numAltStreams = 0;
- 
-       FOR_VECTOR (di, rec.DataRefs)
-       {
-@@ -1947,9 +2020,9 @@ HRESULT CDatabase::Open()
-             continue;
-         }
- 
--        numAltStreams++;
-+        // numAltStreams++;
-         ThereAreAltStreams = true;
--        item.DataIndex = di;
-+        item.DataIndex = (int)di;
-         Items.Add(item);
-       }
-     }
-@@ -1964,10 +2037,10 @@ HRESULT CDatabase::Open()
-       if (attr.Name == L"$SDS")
-       {
-         CMyComPtr<IInStream> sdsStream;
--        RINOK(rec.GetStream(InStream, di, Header.ClusterSizeLog, Header.NumClusters, &sdsStream));
-+        RINOK(rec.GetStream(InStream, (int)di, Header.ClusterSizeLog, Header.NumClusters, &sdsStream));
-         if (sdsStream)
-         {
--          UInt64 size64 = attr.GetSize();
-+          const UInt64 size64 = attr.GetSize();
-           if (size64 < (UInt32)1 << 29)
-           {
-             size_t size = (size_t)size64;
-@@ -1997,7 +2070,7 @@ HRESULT CDatabase::Open()
-     const CMftRec &rec = Recs[item.RecIndex];
-     const CFileNameAttr &fn = rec.FileNames[item.NameIndex];
-     const CMftRef &parentDirRef = fn.ParentDirRef;
--    UInt64 refIndex = parentDirRef.GetIndex();
-+    const UInt64 refIndex = parentDirRef.GetIndex();
-     if (refIndex == kRecIndex_RootDir)
-       item.ParentFolder = -1;
-     else
-@@ -2024,17 +2097,17 @@ HRESULT CDatabase::Open()
-   unsigned virtIndex = Items.Size();
-   if (_showSystemFiles)
-   {
--    _systemFolderIndex = virtIndex++;
-+    _systemFolderIndex = (int)(virtIndex++);
-     VirtFolderNames.Add(kVirtualFolder_System);
-   }
-   if (thereAreUnknownFolders_Normal)
-   {
--    _lostFolderIndex_Normal = virtIndex++;
-+    _lostFolderIndex_Normal = (int)(virtIndex++);
-     VirtFolderNames.Add(kVirtualFolder_Lost_Normal);
-   }
-   if (thereAreUnknownFolders_Deleted)
-   {
--    _lostFolderIndex_Deleted = virtIndex++;
-+    _lostFolderIndex_Deleted = (int)(virtIndex++);
-     VirtFolderNames.Add(kVirtualFolder_Lost_Deleted);
-   }
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch b/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
deleted file mode 100644
index 42ea716be..000000000
--- a/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From: Robert Luberda <robert@debian.org>
-Date: Sat, 19 Nov 2016 08:48:08 +0100
-Subject: Fix nullptr dereference (CVE-2016-9296)
-
-Patch taken from https://sourceforge.net/p/p7zip/bugs/185/
-
-CVE: CVE-2016-9296
-
-Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-debug/20180205T215659Z/pool/main/p/p7zip/p7zip_16.02%2Bdfsg-6.debian.tar.xz]
-
-Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
-Signed-off-by: aszh07 <mail2szahir@gmail.com>
----
- CPP/7zip/Archive/7z/7zIn.cpp | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/CPP/7zip/Archive/7z/7zIn.cpp b/CPP/7zip/Archive/7z/7zIn.cpp
-index b0c6b98..7c6dde2 100644
---- a/CPP/7zip/Archive/7z/7zIn.cpp
-+++ b/CPP/7zip/Archive/7z/7zIn.cpp
-@@ -1097,7 +1097,8 @@ HRESULT CInArchive::ReadAndDecodePackedStreams(
-       if (CrcCalc(data, unpackSize) != folders.FolderCRCs.Vals[i])
-         ThrowIncorrect();
-   }
--  HeadersSize += folders.PackPositions[folders.NumPackStreams];
-+  if (folders.PackPositions)
-+      HeadersSize += folders.PackPositions[folders.NumPackStreams];
-   return S_OK;
- }
- 
diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch b/meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch
deleted file mode 100644
index 9ba107807..000000000
--- a/meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 7f2da4f810b429ddb7afa0e252e3d02ced0eba87 Mon Sep 17 00:00:00 2001
-From: Radovan Scasny <radovan.scasny@siemens.com>
-Date: Tue, 20 Feb 2018 12:08:13 +0100
-Subject: [PATCH] p7zip: Fix CVE-2017-17969
-
-[No upstream tracking] -- https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=888297
-
-Heap-based buffer overflow in 7zip
-
-Compress/ShrinkDecoder.cpp: Heap-based buffer overflow
-in the NCompress::NShrink::CDecoder::CodeReal method
-in 7-Zip before 18.00 and p7zip allows remote attackers
-to cause a denial of service (out-of-bounds write)
-or potentially execute arbitrary code via a crafted ZIP archive.
-
-Upstream-Status: Backport [https://sourceforge.net/p/p7zip/bugs/_discuss/thread/0920f369/8316/attachment/CVE-2017-17969.patch]
-CVE: CVE-2017-17969
-Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
-
----
- CPP/7zip/Compress/ShrinkDecoder.cpp | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/CPP/7zip/Compress/ShrinkDecoder.cpp b/CPP/7zip/Compress/ShrinkDecoder.cpp
-index 80b7e67..5bb0559 100644
---- a/CPP/7zip/Compress/ShrinkDecoder.cpp
-+++ b/CPP/7zip/Compress/ShrinkDecoder.cpp
-@@ -121,7 +121,12 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStream, ISequentialOutStream *
-     {
-       _stack[i++] = _suffixes[cur];
-       cur = _parents[cur];
-+	  if (cur >= kNumItems || i >= kNumItems)
-+	  	break;
-     }
-+	
-+	if (cur >= kNumItems || i >= kNumItems)
-+		break;
-     
-     _stack[i++] = (Byte)cur;
-     lastChar2 = (Byte)cur;
diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch b/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
deleted file mode 100644
index 6b337b8d2..000000000
--- a/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
+++ /dev/null
@@ -1,228 +0,0 @@
-From: Robert Luberda <robert@debian.org>
-Date: Sun, 28 Jan 2018 23:47:40 +0100
-Subject: CVE-2018-5996
-
-Hopefully fix Memory Corruptions via RAR PPMd (CVE-2018-5996) by
-applying a few changes from 7Zip 18.00-beta.
-
-Bug-Debian: https://bugs.debian.org/#888314
-
-CVE: CVE-2018-5996
-
-Upstream-Status: Backport [https://sources.debian.org/data/non-free/p/p7zip-rar/16.02-3/debian/patches/06-CVE-2018-5996.patch]
-
-Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
-Signed-off-by: aszh07 <mail2szahir@gmail.com>
----
- CPP/7zip/Compress/Rar1Decoder.cpp | 13 +++++++++----
- CPP/7zip/Compress/Rar1Decoder.h   |  1 +
- CPP/7zip/Compress/Rar2Decoder.cpp | 10 +++++++++-
- CPP/7zip/Compress/Rar2Decoder.h   |  1 +
- CPP/7zip/Compress/Rar3Decoder.cpp | 23 ++++++++++++++++++++---
- CPP/7zip/Compress/Rar3Decoder.h   |  2 ++
- 6 files changed, 42 insertions(+), 8 deletions(-)
-
-diff --git a/CPP/7zip/Compress/Rar1Decoder.cpp b/CPP/7zip/Compress/Rar1Decoder.cpp
-index 1aaedcc..68030c7 100644
---- a/CPP/7zip/Compress/Rar1Decoder.cpp
-+++ b/CPP/7zip/Compress/Rar1Decoder.cpp
-@@ -29,7 +29,7 @@ public:
- };
- */
- 
--CDecoder::CDecoder(): m_IsSolid(false) { }
-+CDecoder::CDecoder(): m_IsSolid(false), _errorMode(false) { }
- 
- void CDecoder::InitStructures()
- {
-@@ -406,9 +406,14 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStream, ISequentialOutStream *
-   InitData();
-   if (!m_IsSolid)
-   {
-+    _errorMode = false;
-     InitStructures();
-     InitHuff();
-   }
-+
-+  if (_errorMode)
-+    return S_FALSE;
-+
-   if (m_UnpackSize > 0)
-   {
-     GetFlagsBuf();
-@@ -477,9 +482,9 @@ STDMETHODIMP CDecoder::Code(ISequentialInStream *inStream, ISequentialOutStream
-     const UInt64 *inSize, const UInt64 *outSize, ICompressProgressInfo *progress)
- {
-   try { return CodeReal(inStream, outStream, inSize, outSize, progress); }
--  catch(const CInBufferException &e) { return e.ErrorCode; }
--  catch(const CLzOutWindowException &e) { return e.ErrorCode; }
--  catch(...) { return S_FALSE; }
-+  catch(const CInBufferException &e) { _errorMode = true; return e.ErrorCode; }
-+  catch(const CLzOutWindowException &e) { _errorMode = true; return e.ErrorCode; }
-+  catch(...) { _errorMode = true; return S_FALSE; }
- }
- 
- STDMETHODIMP CDecoder::SetDecoderProperties2(const Byte *data, UInt32 size)
-diff --git a/CPP/7zip/Compress/Rar1Decoder.h b/CPP/7zip/Compress/Rar1Decoder.h
-index 630f089..01b606b 100644
---- a/CPP/7zip/Compress/Rar1Decoder.h
-+++ b/CPP/7zip/Compress/Rar1Decoder.h
-@@ -39,6 +39,7 @@ public:
- 
-   Int64 m_UnpackSize;
-   bool m_IsSolid;
-+  bool _errorMode;
- 
-   UInt32 ReadBits(int numBits);
-   HRESULT CopyBlock(UInt32 distance, UInt32 len);
-diff --git a/CPP/7zip/Compress/Rar2Decoder.cpp b/CPP/7zip/Compress/Rar2Decoder.cpp
-index b3f2b4b..0580c8d 100644
---- a/CPP/7zip/Compress/Rar2Decoder.cpp
-+++ b/CPP/7zip/Compress/Rar2Decoder.cpp
-@@ -80,7 +80,8 @@ static const UInt32 kHistorySize = 1 << 20;
- static const UInt32 kWindowReservSize = (1 << 22) + 256;
- 
- CDecoder::CDecoder():
--  m_IsSolid(false)
-+  m_IsSolid(false),
-+  m_TablesOK(false)
- {
- }
- 
-@@ -100,6 +101,8 @@ UInt32 CDecoder::ReadBits(unsigned numBits) { return m_InBitStream.ReadBits(numB
- 
- bool CDecoder::ReadTables(void)
- {
-+  m_TablesOK = false;
-+
-   Byte levelLevels[kLevelTableSize];
-   Byte newLevels[kMaxTableSize];
-   m_AudioMode = (ReadBits(1) == 1);
-@@ -170,6 +173,8 @@ bool CDecoder::ReadTables(void)
-   }
-   
-   memcpy(m_LastLevels, newLevels, kMaxTableSize);
-+  m_TablesOK = true;
-+
-   return true;
- }
- 
-@@ -344,6 +349,9 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStream, ISequentialOutStream *
-       return S_FALSE;
-   }
- 
-+  if (!m_TablesOK)
-+    return S_FALSE;
-+
-   UInt64 startPos = m_OutWindowStream.GetProcessedSize();
-   while (pos < unPackSize)
-   {
-diff --git a/CPP/7zip/Compress/Rar2Decoder.h b/CPP/7zip/Compress/Rar2Decoder.h
-index 3a0535c..0e9005f 100644
---- a/CPP/7zip/Compress/Rar2Decoder.h
-+++ b/CPP/7zip/Compress/Rar2Decoder.h
-@@ -139,6 +139,7 @@ class CDecoder :
- 
-   UInt64 m_PackSize;
-   bool m_IsSolid;
-+  bool m_TablesOK;
- 
-   void InitStructures();
-   UInt32 ReadBits(unsigned numBits);
-diff --git a/CPP/7zip/Compress/Rar3Decoder.cpp b/CPP/7zip/Compress/Rar3Decoder.cpp
-index 3bf2513..6cb8a6a 100644
---- a/CPP/7zip/Compress/Rar3Decoder.cpp
-+++ b/CPP/7zip/Compress/Rar3Decoder.cpp
-@@ -92,7 +92,8 @@ CDecoder::CDecoder():
-   _writtenFileSize(0),
-   _vmData(0),
-   _vmCode(0),
--  m_IsSolid(false)
-+  m_IsSolid(false),
-+  _errorMode(false)
- {
-   Ppmd7_Construct(&_ppmd);
- }
-@@ -545,6 +546,9 @@ HRESULT CDecoder::ReadTables(bool &keepDecompressing)
-     return InitPPM();
-   }
- 
-+  TablesRead = false;
-+  TablesOK = false;
-+
-   _lzMode = true;
-   PrevAlignBits = 0;
-   PrevAlignCount = 0;
-@@ -606,6 +610,9 @@ HRESULT CDecoder::ReadTables(bool &keepDecompressing)
-       }
-     }
-   }
-+  if (InputEofError())
-+    return S_FALSE;
-+
-   TablesRead = true;
- 
-   // original code has check here:
-@@ -623,6 +630,9 @@ HRESULT CDecoder::ReadTables(bool &keepDecompressing)
-   RIF(m_LenDecoder.Build(&newLevels[kMainTableSize + kDistTableSize + kAlignTableSize]));
- 
-   memcpy(m_LastLevels, newLevels, kTablesSizesSum);
-+
-+  TablesOK = true;
-+
-   return S_OK;
- }
- 
-@@ -824,7 +834,12 @@ HRESULT CDecoder::CodeReal(ICompressProgressInfo *progress)
-     PpmEscChar = 2;
-     PpmError = true;
-     InitFilters();
-+    _errorMode = false;
-   }
-+
-+  if (_errorMode)
-+    return S_FALSE;
-+
-   if (!m_IsSolid || !TablesRead)
-   {
-     bool keepDecompressing;
-@@ -838,6 +853,8 @@ HRESULT CDecoder::CodeReal(ICompressProgressInfo *progress)
-     bool keepDecompressing;
-     if (_lzMode)
-     {
-+      if (!TablesOK)
-+        return S_FALSE;
-       RINOK(DecodeLZ(keepDecompressing))
-     }
-     else
-@@ -901,8 +918,8 @@ STDMETHODIMP CDecoder::Code(ISequentialInStream *inStream, ISequentialOutStream
-     _unpackSize = outSize ? *outSize : (UInt64)(Int64)-1;
-     return CodeReal(progress);
-   }
--  catch(const CInBufferException &e)  { return e.ErrorCode; }
--  catch(...) { return S_FALSE; }
-+  catch(const CInBufferException &e)  { _errorMode = true; return e.ErrorCode; }
-+  catch(...) { _errorMode = true; return S_FALSE; }
-   // CNewException is possible here. But probably CNewException is caused
-   // by error in data stream.
- }
-diff --git a/CPP/7zip/Compress/Rar3Decoder.h b/CPP/7zip/Compress/Rar3Decoder.h
-index c130cec..2f72d7d 100644
---- a/CPP/7zip/Compress/Rar3Decoder.h
-+++ b/CPP/7zip/Compress/Rar3Decoder.h
-@@ -192,6 +192,7 @@ class CDecoder:
-   UInt32 _lastFilter;
- 
-   bool m_IsSolid;
-+  bool _errorMode;
- 
-   bool _lzMode;
-   bool _unsupportedFilter;
-@@ -200,6 +201,7 @@ class CDecoder:
-   UInt32 PrevAlignCount;
- 
-   bool TablesRead;
-+  bool TablesOK;
- 
-   CPpmd7 _ppmd;
-   int PpmEscChar;
diff --git a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
deleted file mode 100644
index 93eb0588c..000000000
--- a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0820ef4b9238c1e39ae5bda32cc08cce3fd3ce89 Mon Sep 17 00:00:00 2001
-From: Nisha Parrakat <Nisha.Parrakat@kpit.com>
-Date: Wed, 26 May 2021 19:59:28 +0000
-Subject: [PATCH] fixes the below error
-
-| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*)':
-| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
-|   308 |           numMethods++;
-|       |           ^~~~~~~~~~
-| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
-|   318 |         numMethods++;
-
-use unsigned instead of bool
-Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
-
-Upstream-Status: Pending
-
----
- CPP/7zip/Archive/Wim/WimHandler.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CPP/7zip/Archive/Wim/WimHandler.cpp b/CPP/7zip/Archive/Wim/WimHandler.cpp
-index 27d3298..4ff5cfe 100644
---- a/CPP/7zip/Archive/Wim/WimHandler.cpp
-+++ b/CPP/7zip/Archive/Wim/WimHandler.cpp
-@@ -298,7 +298,7 @@ STDMETHODIMP CHandler::GetArchiveProperty(PROPID propID, PROPVARIANT *value)
- 
-       AString res;
- 
--      bool numMethods = 0;
-+      unsigned numMethods = 0;
-       for (unsigned i = 0; i < ARRAY_SIZE(k_Methods); i++)
-       {
-         if (methodMask & ((UInt32)1 << i))
diff --git a/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch b/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
deleted file mode 100644
index 2636e7f6f..000000000
--- a/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_not_strip.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b2aa209dfc5e59d6329b55b9764782334b63dbe8 Mon Sep 17 00:00:00 2001
-From: Raphael Freudiger <raphael.freudiger@siemens.com>
-Date: Wed, 11 Feb 2015 09:11:47 +0100
-Subject: [PATCH] do not override compiler and do not strip
-
-The default makefile sets the compiler to g++ or gcc. This leads to a wrong architecture when cross-compiling.
-Remove the hardcoded compiler and just append the flags to CXX and CC.
-
-Upstream-Status: Pending
-Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
-Reviewed-By: Pascal Bach <pascal.bach@siemens.com>
-
----
- makefile.machine | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/makefile.machine b/makefile.machine
-index 9e34c34..e9244d9 100644
---- a/makefile.machine
-+++ b/makefile.machine
-@@ -2,7 +2,7 @@
- # makefile for Linux (x86, PPC, alpha ...)
- #
- 
--OPTFLAGS=-O -s
-+OPTFLAGS=-O
- 
- ALLFLAGS=${OPTFLAGS} -pipe \
-     	-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE \
-@@ -10,8 +10,6 @@ ALLFLAGS=${OPTFLAGS} -pipe \
- 	-D_7ZIP_LARGE_PAGES \
- 	$(LOCAL_FLAGS)
- 
--CXX=g++
--CC=gcc
- CC_SHARED=-fPIC
- LINK_SHARED=-fPIC -shared
- 
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
deleted file mode 100644
index 31a12fdb0..000000000
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "7-zip is a commandline utility handling 7z archives."
-HOMEPAGE = "http://www.7-zip.org/"
-LICENSE = "LGPL-2.1-or-later & unRAR"
-LIC_FILES_CHKSUM = "file://DOC/copying.txt;md5=4fbd65380cdd255951079008b364516c \
-                    file://DOC/unRarLicense.txt;md5=9c87ddde469ef94aed153b0951d088de \
-                    file://DOC/License.txt;md5=879598edf1f54dddb6930d7581357f8b"
-
-SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_all.tar.bz2 \
-           file://do_not_override_compiler_and_do_not_strip.patch \
-           file://CVE-2017-17969.patch \
-           file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
-           file://change_numMethods_from_bool_to_unsigned.patch \
-           file://CVE-2018-5996.patch \
-           file://CVE-2016-9296.patch \
-           file://0001-Fix-two-buffer-overflow-vulnerabilities.patch \
-           "
-
-SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
-SRC_URI[sha256sum] = "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f"
-
-S = "${WORKDIR}/${BPN}_${PV}"
-
-do_compile:append() {
-    oe_runmake 7z
-}
-FILES:${PN} += "${libdir}/* ${bindir}/7z"
-
-FILES_SOLIBSDEV = ""
-INSANE_SKIP:${PN} += "dev-so"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -d ${D}${bindir}/Codecs
-	install -d ${D}${libdir}
-	install -d ${D}${libdir}/Codecs
-	install -m 0755 ${S}/bin/7za ${D}${bindir}
-	ln -s 7za ${D}${bindir}/7z
-	install -m 0755 ${S}/bin/Codecs/* ${D}${libdir}/Codecs/
-	install -m 0755 ${S}/bin/7z.so ${D}${libdir}/lib7z.so
-}
-
-RPROVIDES:${PN} += "lib7z.so()(64bit) 7z lib7z.so"
-RPROVIDES:${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


