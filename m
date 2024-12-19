Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33479E7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 09:14:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.126052.1734599649085940023
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 01:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=208319dcd1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ6wnGH001850
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 09:14:08 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h1095jg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 09:14:07 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 19 Dec 2024 01:14:06 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 19 Dec 2024 01:14:05 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH V2 1/3] Use 7zip 2409 to replace p7zip 16.02
Date: Thu, 19 Dec 2024 17:14:04 +0800
Message-ID: <20241219091404.113636-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219084758.3809790-1-hongxu.jia@windriver.com>
References: <20241219084758.3809790-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=bp62BFai c=1 sm=1 tr=0 ts=6763e3df cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=FP58Ms26AAAA:8 a=xNf9USuDAAAA:8 a=PTOB6kbnAAAA:8 a=NEAV23lmAAAA:8 a=6I5d2MoRAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=Qnov7ifiAAAA:8 a=a_U1oVfrAAAA:8 a=4veNbiuUptK_c8KCBTEA:9 a=Ix7Rxndb0lQA:10 a=IHbIW1swVzAA:10 a=lvfz_6v1X3QA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=4d9-RgBc9cJG6cC6SkVU:22
X-Proofpoint-ORIG-GUID: cMqxNz3AdRp5gmdZVlRoxG8svoy12a4E
X-Proofpoint-GUID: cMqxNz3AdRp5gmdZVlRoxG8svoy12a4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_04,2024-12-18_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412190073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 09:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114383

According to DOC/readme.txt [1]:

    7-Zip and p7zip
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Now there are two different ports of 7-Zip for Linux/macOS:

    1) p7zip - another port of 7-Zip for Linux, made by an independent deve=
loper.
       The latest version of p7zip now is 16.02, and that p7zip 16.02 is ou=
tdated now.
       http://sourceforge.net/projects/p7zip/

    2) 7-Zip for Linux/macOS - this package - it's new code with all change=
s from latest 7-Zip for Windows

Add recipe 7-zip [2] to instead of recipe p7zip[3] in which the upstream is=
 dead since 2016

Drop obsolete patches
- CVE-2016-9296.patch
- CVE-2017-17969.patch
- CVE-2018-5996.patch
- change_numMethods_from_bool_to_unsigned.patch
- 0001-Fix-two-buffer-overflow-vulnerabilities.patch
- 0001-Fix-narrowing-errors-Wc-11-narrowing.patch

License-Update: DOC/License.txt: Add BSD-2-Clause & BSD-3-Clause
License-Update: DOC/copying.txt: newline differs

The codec libraries was removed since 21.02 [4]

Refer debian to compile 7-zip [5]

[1] https://salsa.debian.org/debian/7zip/-/blob/master/DOC/readme.txt?ref_t=
ype=3Dheads
[2] https://sourceforge.net/projects/p7zip/
[3] https://www.7-zip.org/
[4] https://github.com/p7zip-project/p7zip/commit/6c6ed1eba9ff0c0ded9323600=
f1f3c686d6b6692
[5] https://salsa.debian.org/debian/7zip/-/blob/master/debian/rules

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../p7zip_16.02.bb =3D> 7zip/7zip_2409.bb}      |  56 +++--
 .../0001-support-yocto-cross-compiling.patch  |  51 ++++
 ...Fix-narrowing-errors-Wc-11-narrowing.patch |  49 ----
 .../p7zip/files/CVE-2016-9296.patch           |  27 ---
 .../p7zip/files/CVE-2017-17969.patch          |  40 ---
 .../p7zip/files/CVE-2018-5996.patch           | 227 ------------------
 ...nge_numMethods_from_bool_to_unsigned.patch |  34 ---
 ...t_override_compiler_and_do_not_strip.patch |  38 ---
 8 files changed, 83 insertions(+), 439 deletions(-)
 rename meta-oe/recipes-extended/{p7zip/p7zip_16.02.bb =3D> 7zip/7zip_2409.=
bb} (23%)
 create mode 100644 meta-oe/recipes-extended/7zip/files/0001-support-yocto-=
cross-compiling.patch
 delete mode 100644 meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing=
-errors-Wc-11-narrowing.patch
 delete mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
 delete mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.pat=
ch
 delete mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
 delete mode 100644 meta-oe/recipes-extended/p7zip/files/change_numMethods_=
from_bool_to_unsigned.patch
 delete mode 100644 meta-oe/recipes-extended/p7zip/files/do_not_override_co=
mpiler_and_do_not_strip.patch

diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipe=
s-extended/7zip/7zip_2409.bb
similarity index 23%
rename from meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
rename to meta-oe/recipes-extended/7zip/7zip_2409.bb
index 789819a5e..5fc1b93e7 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_2409.bb
@@ -1,28 +1,35 @@
 SUMMARY =3D "7-zip is a commandline utility handling 7z archives."
 HOMEPAGE =3D "http://www.7-zip.org/"
-LICENSE =3D "LGPL-2.1-or-later & unRAR"
-LIC_FILES_CHKSUM =3D "file://DOC/copying.txt;md5=3D4fbd65380cdd25595107900=
8b364516c \
+LICENSE =3D "LGPL-2.1-or-later & unRAR & PD & BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://DOC/copying.txt;md5=3Db0d181292c99cf9bb2ae916=
6dd3a0239 \
                     file://DOC/unRarLicense.txt;md5=3D9c87ddde469ef94aed15=
3b0951d088de \
-                    file://DOC/License.txt;md5=3D879598edf1f54dddb6930d758=
1357f8b"
-
-SRC_URI =3D "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV=
}_src_all.tar.bz2 \
-           file://do_not_override_compiler_and_do_not_strip.patch \
-           file://CVE-2017-17969.patch \
-           file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
-           file://change_numMethods_from_bool_to_unsigned.patch \
-           file://CVE-2018-5996.patch \
-           file://CVE-2016-9296.patch \
+                    file://DOC/License.txt;md5=3D8bfe22e0285a3043b61ea408d=
234c55d"
+
+SRC_URI =3D "https://www.7-zip.org/a/7z${PV}-src.tar.xz \
+           file://0001-support-yocto-cross-compiling.patch \
            "
=20
-SRC_URI[sha256sum] =3D "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89=
087ffdd6e2341f"
+SRC_URI[sha256sum] =3D "49c05169f49572c1128453579af1632a952409ced028259381=
dac30726b6133a"
+
+UPSTREAM_CHECK_URI =3D "https://www.7-zip.org/download.html"
=20
-UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/p7zip"
-UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
+S =3D "${WORKDIR}/sources"
+UNPACKDIR =3D "${S}"
=20
-S =3D "${WORKDIR}/${BPN}_${PV}"
+# Support Yocto cross compiling
+EXTRA_OEMAKE +=3D " \
+    CXXFLAGS_EXTRA=3D'${CXXFLAGS}' \
+    CFLAGS_BASE2=3D'${CFLAGS}' \
+    LDFLAGS_STATIC_3=3D'${LDFLAGS}' \
+"
=20
-do_compile:append() {
-    oe_runmake 7z
+do_compile() {
+    oe_runmake -C CPP/7zip/Bundles/Alone2    -f ../../cmpl_gcc.mak
+    oe_runmake -C CPP/7zip/Bundles/Format7zF -f ../../cmpl_gcc.mak
+    oe_runmake -C CPP/7zip/UI/Console        -f ../../cmpl_gcc.mak
+    oe_runmake -C CPP/7zip/Bundles/SFXCon    -f ../../cmpl_gcc.mak
+    oe_runmake -C CPP/7zip/Bundles/Alone     -f ../../cmpl_gcc.mak
+    oe_runmake -C CPP/7zip/Bundles/Alone7z   -f ../../cmpl_gcc.mak
 }
 FILES:${PN} +=3D "${libdir}/* ${bindir}/7z"
=20
@@ -31,16 +38,17 @@ INSANE_SKIP:${PN} +=3D "dev-so"
=20
 do_install() {
 	install -d ${D}${bindir}
-	install -d ${D}${bindir}/Codecs
+	install -m 0755 ${S}/CPP/7zip/Bundles/Alone/b/g/7za ${D}${bindir}
+	install -m 0755 ${S}/CPP/7zip/Bundles/Alone7z/b/g/7zr ${D}${bindir}
+	install -m 0755 ${S}/CPP/7zip/UI/Console/b/g/7z ${D}${bindir}
+
 	install -d ${D}${libdir}
-	install -d ${D}${libdir}/Codecs
-	install -m 0755 ${S}/bin/7za ${D}${bindir}
-	ln -s 7za ${D}${bindir}/7z
-	install -m 0755 ${S}/bin/Codecs/* ${D}${libdir}/Codecs/
-	install -m 0755 ${S}/bin/7z.so ${D}${libdir}/lib7z.so
+	install -m 0755 ${S}/CPP/7zip/Bundles/Format7zF/b/g/7z.so ${D}${libdir}/l=
ib7z.so
+	ln -rsn ${D}${libdir}/lib7z.so ${D}${bindir}/7z.so
 }
=20
-RPROVIDES:${PN} +=3D "lib7z.so()(64bit) 7z lib7z.so"
+PROVIDES +=3D "p7zip"
+RPROVIDES:${PN} +=3D "lib7z.so()(64bit) 7z lib7z.so p7zip"
 RPROVIDES:${PN}-dev +=3D "lib7z.so()(64bit) 7z lib7z.so"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-c=
ompiling.patch b/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cro=
ss-compiling.patch
new file mode 100644
index 000000000..32b698ecd
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-compilin=
g.patch
@@ -0,0 +1,51 @@
+From 80321060ff24edee11d9ead8e21e9168f52d1d44 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 18 Dec 2024 16:38:11 +0800
+Subject: [PATCH] support yocto cross compiling
+
+Remove -s from $LFLAGS_STRIP, do not strip binary to workaournd
+Yocto build warning
+...
+WARNING: 7zip-native-24.09-r0 do_populate_sysroot: File 'tmp/work/x86_64-l=
inux/
+7zip-native/24.09/recipe-sysroot-native/usr/lib/7z.so' from 7zip-native wa=
s already stripped,
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
+index fcb580a..74a15d9 100755
+--- a/CPP/7zip/7zip_gcc.mak
++++ b/CPP/7zip/7zip_gcc.mak
+@@ -45,7 +45,7 @@ CFLAGS_DEBUG =3D -g
+ else=0D
+ CFLAGS_DEBUG =3D -DNDEBUG=0D
+ ifneq ($(CC), $(CROSS_COMPILE)clang)=0D
+-LFLAGS_STRIP =3D -s=0D
++LFLAGS_STRIP =3D =0D
+ endif=0D
+ endif=0D
+ =0D
+diff --git a/CPP/7zip/var_gcc.mak b/CPP/7zip/var_gcc.mak
+index 803c8de..48a7c09 100755
+--- a/CPP/7zip/var_gcc.mak
++++ b/CPP/7zip/var_gcc.mak
+@@ -6,7 +6,5 @@ IS_ARM64=3D
+ CROSS_COMPILE=3D=0D
+ MY_ARCH=3D=0D
+ USE_ASM=3D=0D
+-CC=3D$(CROSS_COMPILE)gcc=0D
+-CXX=3D$(CROSS_COMPILE)g++=0D
+ =0D
+ # -march=3Darmv8-a+crc+crypto=0D
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors=
-Wc-11-narrowing.patch b/meta-oe/recipes-extended/p7zip/files/0001-Fix-narr=
owing-errors-Wc-11-narrowing.patch
deleted file mode 100644
index 1f08d1603..000000000
--- a/meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors-Wc-11-=
narrowing.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 653674e11872465dd5edf1c1e8413ea813d7e086 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Apr 2018 23:07:21 -0700
-Subject: [PATCH] Fix narrowing errors -Wc++11-narrowing
-
-Clang 6.x finds these errors
-
-    ../../../../CPP/Windows/ErrorMsg.cpp:24:10: error: case value evaluate=
s to -2147024809, which cannot be narrowed to type 'DWORD' (aka 'unsigned i=
nt') [-Wc++11-narrowing]
-        case E_INVALIDARG          : txt =3D "E_INVALIDARG"; break ;
-             ^
-
-HRESULT causes the macro to be parsed as a signed long, so we need to forc=
e it
-to be checked as an unsigned long instead.
-
-also reported here https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=3D224=
930
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
-=20
-   switch(errorCode) {
-     case ERROR_NO_MORE_FILES   : txt =3D "No more files"; break ;
--    case E_NOTIMPL             : txt =3D "E_NOTIMPL"; break ;
--    case E_NOINTERFACE         : txt =3D "E_NOINTERFACE"; break ;
--    case E_ABORT               : txt =3D "E_ABORT"; break ;
--    case E_FAIL                : txt =3D "E_FAIL"; break ;
--    case STG_E_INVALIDFUNCTION : txt =3D "STG_E_INVALIDFUNCTION"; break ;
--    case E_OUTOFMEMORY         : txt =3D "E_OUTOFMEMORY"; break ;
--    case E_INVALIDARG          : txt =3D "E_INVALIDARG"; break ;
-+    case (DWORD) E_NOTIMPL             : txt =3D "E_NOTIMPL"; break ;
-+    case (DWORD) E_NOINTERFACE         : txt =3D "E_NOINTERFACE"; break ;
-+    case (DWORD) E_ABORT               : txt =3D "E_ABORT"; break ;
-+    case (DWORD) E_FAIL                : txt =3D "E_FAIL"; break ;
-+    case (DWORD) STG_E_INVALIDFUNCTION : txt =3D "STG_E_INVALIDFUNCTION";=
 break ;
-+    case (DWORD) E_OUTOFMEMORY         : txt =3D "E_OUTOFMEMORY"; break ;
-+    case (DWORD) E_INVALIDARG          : txt =3D "E_INVALIDARG"; break ;
-     case ERROR_DIRECTORY          : txt =3D "Error Directory"; break ;
-     default:
-       txt =3D strerror(errorCode);
diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch b/met=
a-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
deleted file mode 100644
index 98e186cbf..000000000
--- a/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-p7zip: Update CVE-2016-9296 patch URL.
-From: Robert Luberda <robert@debian.org>
-Date: Sat, 19 Nov 2016 08:48:08 +0100
-Subject: Fix nullptr dereference (CVE-2016-9296)
-
-Patch taken from https://sourceforge.net/p/p7zip/bugs/185/
-This patch file taken from Debian's patch set for p7zip
-
-Upstream-Status: Backport [https://sourceforge.net/p/p7zip/bugs/185/]
-CVE: CVE-2016-9296
-
-Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
-
-Index: p7zip_16.02/CPP/7zip/Archive/7z/7zIn.cpp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- p7zip_16.02.orig/CPP/7zip/Archive/7z/7zIn.cpp
-+++ p7zip_16.02/CPP/7zip/Archive/7z/7zIn.cpp
-@@ -1097,7 +1097,8 @@ HRESULT CInArchive::ReadAndDecodePackedS
-       if (CrcCalc(data, unpackSize) !=3D folders.FolderCRCs.Vals[i])
-         ThrowIncorrect();
-   }
--  HeadersSize +=3D folders.PackPositions[folders.NumPackStreams];
-+  if (folders.PackPositions)
-+      HeadersSize +=3D folders.PackPositions[folders.NumPackStreams];
-   return S_OK;
- }
-=20
diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch b/me=
ta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch
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
-[No upstream tracking] -- https://bugs.debian.org/cgi-bin/bugreport.cgi?bu=
g=3D888297
-
-Heap-based buffer overflow in 7zip
-
-Compress/ShrinkDecoder.cpp: Heap-based buffer overflow
-in the NCompress::NShrink::CDecoder::CodeReal method
-in 7-Zip before 18.00 and p7zip allows remote attackers
-to cause a denial of service (out-of-bounds write)
-or potentially execute arbitrary code via a crafted ZIP archive.
-
-Upstream-Status: Backport [https://sourceforge.net/p/p7zip/bugs/_discuss/t=
hread/0920f369/8316/attachment/CVE-2017-17969.patch]
-CVE: CVE-2017-17969
-Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
-
----
- CPP/7zip/Compress/ShrinkDecoder.cpp | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/CPP/7zip/Compress/ShrinkDecoder.cpp b/CPP/7zip/Compress/Shrin=
kDecoder.cpp
-index 80b7e67..5bb0559 100644
---- a/CPP/7zip/Compress/ShrinkDecoder.cpp
-+++ b/CPP/7zip/Compress/ShrinkDecoder.cpp
-@@ -121,7 +121,12 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStr=
eam, ISequentialOutStream *
-     {
-       _stack[i++] =3D _suffixes[cur];
-       cur =3D _parents[cur];
-+	  if (cur >=3D kNumItems || i >=3D kNumItems)
-+	  	break;
-     }
-+=09
-+	if (cur >=3D kNumItems || i >=3D kNumItems)
-+		break;
-=20=20=20=20=20
-     _stack[i++] =3D (Byte)cur;
-     lastChar2 =3D (Byte)cur;
diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch b/met=
a-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
deleted file mode 100644
index 47868c982..000000000
--- a/meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch
+++ /dev/null
@@ -1,227 +0,0 @@
-From: Robert Luberda <robert@debian.org>
-Date: Sun, 28 Jan 2018 23:47:40 +0100
-Subject: CVE-2018-5996
-
-Hopefully fix Memory Corruptions via RAR PPMd (CVE-2018-5996) by
-applying a few changes from 7Zip 18.00-beta.
-
-Bug-Debian: https://bugs.debian.org/#888314
-
-Upstream-Status: Backport [https://sources.debian.org/data/non-free/p/p7zi=
p-rar/16.02-3/debian/patches/06-CVE-2018-5996.patch]
-CVE: CVE-2018-5996
-
-Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
----
- CPP/7zip/Compress/Rar1Decoder.cpp | 13 +++++++++----
- CPP/7zip/Compress/Rar1Decoder.h   |  1 +
- CPP/7zip/Compress/Rar2Decoder.cpp | 10 +++++++++-
- CPP/7zip/Compress/Rar2Decoder.h   |  1 +
- CPP/7zip/Compress/Rar3Decoder.cpp | 23 ++++++++++++++++++++---
- CPP/7zip/Compress/Rar3Decoder.h   |  2 ++
- 6 files changed, 42 insertions(+), 8 deletions(-)
-
-diff --git a/CPP/7zip/Compress/Rar1Decoder.cpp b/CPP/7zip/Compress/Rar1Dec=
oder.cpp
-index 1aaedcc..68030c7 100644
---- a/CPP/7zip/Compress/Rar1Decoder.cpp
-+++ b/CPP/7zip/Compress/Rar1Decoder.cpp
-@@ -29,7 +29,7 @@ public:
- };
- */
-=20
--CDecoder::CDecoder(): m_IsSolid(false) { }
-+CDecoder::CDecoder(): m_IsSolid(false), _errorMode(false) { }
-=20
- void CDecoder::InitStructures()
- {
-@@ -406,9 +406,14 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStr=
eam, ISequentialOutStream *
-   InitData();
-   if (!m_IsSolid)
-   {
-+    _errorMode =3D false;
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
-@@ -477,9 +482,9 @@ STDMETHODIMP CDecoder::Code(ISequentialInStream *inStr=
eam, ISequentialOutStream
-     const UInt64 *inSize, const UInt64 *outSize, ICompressProgressInfo *p=
rogress)
- {
-   try { return CodeReal(inStream, outStream, inSize, outSize, progress); }
--  catch(const CInBufferException &e) { return e.ErrorCode; }
--  catch(const CLzOutWindowException &e) { return e.ErrorCode; }
--  catch(...) { return S_FALSE; }
-+  catch(const CInBufferException &e) { _errorMode =3D true; return e.Erro=
rCode; }
-+  catch(const CLzOutWindowException &e) { _errorMode =3D true; return e.E=
rrorCode; }
-+  catch(...) { _errorMode =3D true; return S_FALSE; }
- }
-=20
- STDMETHODIMP CDecoder::SetDecoderProperties2(const Byte *data, UInt32 siz=
e)
-diff --git a/CPP/7zip/Compress/Rar1Decoder.h b/CPP/7zip/Compress/Rar1Decod=
er.h
-index 630f089..01b606b 100644
---- a/CPP/7zip/Compress/Rar1Decoder.h
-+++ b/CPP/7zip/Compress/Rar1Decoder.h
-@@ -39,6 +39,7 @@ public:
-=20
-   Int64 m_UnpackSize;
-   bool m_IsSolid;
-+  bool _errorMode;
-=20
-   UInt32 ReadBits(int numBits);
-   HRESULT CopyBlock(UInt32 distance, UInt32 len);
-diff --git a/CPP/7zip/Compress/Rar2Decoder.cpp b/CPP/7zip/Compress/Rar2Dec=
oder.cpp
-index b3f2b4b..0580c8d 100644
---- a/CPP/7zip/Compress/Rar2Decoder.cpp
-+++ b/CPP/7zip/Compress/Rar2Decoder.cpp
-@@ -80,7 +80,8 @@ static const UInt32 kHistorySize =3D 1 << 20;
- static const UInt32 kWindowReservSize =3D (1 << 22) + 256;
-=20
- CDecoder::CDecoder():
--  m_IsSolid(false)
-+  m_IsSolid(false),
-+  m_TablesOK(false)
- {
- }
-=20
-@@ -100,6 +101,8 @@ UInt32 CDecoder::ReadBits(unsigned numBits) { return m=
_InBitStream.ReadBits(numB
-=20
- bool CDecoder::ReadTables(void)
- {
-+  m_TablesOK =3D false;
-+
-   Byte levelLevels[kLevelTableSize];
-   Byte newLevels[kMaxTableSize];
-   m_AudioMode =3D (ReadBits(1) =3D=3D 1);
-@@ -170,6 +173,8 @@ bool CDecoder::ReadTables(void)
-   }
-=20=20=20
-   memcpy(m_LastLevels, newLevels, kMaxTableSize);
-+  m_TablesOK =3D true;
-+
-   return true;
- }
-=20
-@@ -344,6 +349,9 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStre=
am, ISequentialOutStream *
-       return S_FALSE;
-   }
-=20
-+  if (!m_TablesOK)
-+    return S_FALSE;
-+
-   UInt64 startPos =3D m_OutWindowStream.GetProcessedSize();
-   while (pos < unPackSize)
-   {
-diff --git a/CPP/7zip/Compress/Rar2Decoder.h b/CPP/7zip/Compress/Rar2Decod=
er.h
-index 3a0535c..0e9005f 100644
---- a/CPP/7zip/Compress/Rar2Decoder.h
-+++ b/CPP/7zip/Compress/Rar2Decoder.h
-@@ -139,6 +139,7 @@ class CDecoder :
-=20
-   UInt64 m_PackSize;
-   bool m_IsSolid;
-+  bool m_TablesOK;
-=20
-   void InitStructures();
-   UInt32 ReadBits(unsigned numBits);
-diff --git a/CPP/7zip/Compress/Rar3Decoder.cpp b/CPP/7zip/Compress/Rar3Dec=
oder.cpp
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
-=20
-+  TablesRead =3D false;
-+  TablesOK =3D false;
-+
-   _lzMode =3D true;
-   PrevAlignBits =3D 0;
-   PrevAlignCount =3D 0;
-@@ -606,6 +610,9 @@ HRESULT CDecoder::ReadTables(bool &keepDecompressing)
-       }
-     }
-   }
-+  if (InputEofError())
-+    return S_FALSE;
-+
-   TablesRead =3D true;
-=20
-   // original code has check here:
-@@ -623,6 +630,9 @@ HRESULT CDecoder::ReadTables(bool &keepDecompressing)
-   RIF(m_LenDecoder.Build(&newLevels[kMainTableSize + kDistTableSize + kAl=
ignTableSize]));
-=20
-   memcpy(m_LastLevels, newLevels, kTablesSizesSum);
-+
-+  TablesOK =3D true;
-+
-   return S_OK;
- }
-=20
-@@ -824,7 +834,12 @@ HRESULT CDecoder::CodeReal(ICompressProgressInfo *pro=
gress)
-     PpmEscChar =3D 2;
-     PpmError =3D true;
-     InitFilters();
-+    _errorMode =3D false;
-   }
-+
-+  if (_errorMode)
-+    return S_FALSE;
-+
-   if (!m_IsSolid || !TablesRead)
-   {
-     bool keepDecompressing;
-@@ -838,6 +853,8 @@ HRESULT CDecoder::CodeReal(ICompressProgressInfo *prog=
ress)
-     bool keepDecompressing;
-     if (_lzMode)
-     {
-+      if (!TablesOK)
-+        return S_FALSE;
-       RINOK(DecodeLZ(keepDecompressing))
-     }
-     else
-@@ -901,8 +918,8 @@ STDMETHODIMP CDecoder::Code(ISequentialInStream *inStr=
eam, ISequentialOutStream
-     _unpackSize =3D outSize ? *outSize : (UInt64)(Int64)-1;
-     return CodeReal(progress);
-   }
--  catch(const CInBufferException &e)  { return e.ErrorCode; }
--  catch(...) { return S_FALSE; }
-+  catch(const CInBufferException &e)  { _errorMode =3D true; return e.Err=
orCode; }
-+  catch(...) { _errorMode =3D true; return S_FALSE; }
-   // CNewException is possible here. But probably CNewException is caused
-   // by error in data stream.
- }
-diff --git a/CPP/7zip/Compress/Rar3Decoder.h b/CPP/7zip/Compress/Rar3Decod=
er.h
-index c130cec..2f72d7d 100644
---- a/CPP/7zip/Compress/Rar3Decoder.h
-+++ b/CPP/7zip/Compress/Rar3Decoder.h
-@@ -192,6 +192,7 @@ class CDecoder:
-   UInt32 _lastFilter;
-=20
-   bool m_IsSolid;
-+  bool _errorMode;
-=20
-   bool _lzMode;
-   bool _unsupportedFilter;
-@@ -200,6 +201,7 @@ class CDecoder:
-   UInt32 PrevAlignCount;
-=20
-   bool TablesRead;
-+  bool TablesOK;
-=20
-   CPpmd7 _ppmd;
-   int PpmEscChar;
-
diff --git a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bo=
ol_to_unsigned.patch b/meta-oe/recipes-extended/p7zip/files/change_numMetho=
ds_from_bool_to_unsigned.patch
deleted file mode 100644
index 93eb0588c..000000000
--- a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_u=
nsigned.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0820ef4b9238c1e39ae5bda32cc08cce3fd3ce89 Mon Sep 17 00:00:00 2001
-From: Nisha Parrakat <Nisha.Parrakat@kpit.com>
-Date: Wed, 26 May 2021 19:59:28 +0000
-Subject: [PATCH] fixes the below error
-
-| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'vir=
tual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*=
)':
-| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an=
 operand of type 'bool' in 'operator++' is forbidden in C++17
-|   308 |           numMethods++;
-|       |           ^~~~~~~~~~
-| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an =
operand of type 'bool' in 'operator++' is forbidden in C++17
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
-diff --git a/CPP/7zip/Archive/Wim/WimHandler.cpp b/CPP/7zip/Archive/Wim/Wi=
mHandler.cpp
-index 27d3298..4ff5cfe 100644
---- a/CPP/7zip/Archive/Wim/WimHandler.cpp
-+++ b/CPP/7zip/Archive/Wim/WimHandler.cpp
-@@ -298,7 +298,7 @@ STDMETHODIMP CHandler::GetArchiveProperty(PROPID propI=
D, PROPVARIANT *value)
-=20
-       AString res;
-=20
--      bool numMethods =3D 0;
-+      unsigned numMethods =3D 0;
-       for (unsigned i =3D 0; i < ARRAY_SIZE(k_Methods); i++)
-       {
-         if (methodMask & ((UInt32)1 << i))
diff --git a/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_=
and_do_not_strip.patch b/meta-oe/recipes-extended/p7zip/files/do_not_overri=
de_compiler_and_do_not_strip.patch
deleted file mode 100644
index 2636e7f6f..000000000
--- a/meta-oe/recipes-extended/p7zip/files/do_not_override_compiler_and_do_=
not_strip.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b2aa209dfc5e59d6329b55b9764782334b63dbe8 Mon Sep 17 00:00:00 2001
-From: Raphael Freudiger <raphael.freudiger@siemens.com>
-Date: Wed, 11 Feb 2015 09:11:47 +0100
-Subject: [PATCH] do not override compiler and do not strip
-
-The default makefile sets the compiler to g++ or gcc. This leads to a wron=
g architecture when cross-compiling.
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
-=20
--OPTFLAGS=3D-O -s
-+OPTFLAGS=3D-O
-=20
- ALLFLAGS=3D${OPTFLAGS} -pipe \
-     	-D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE \
-@@ -10,8 +10,6 @@ ALLFLAGS=3D${OPTFLAGS} -pipe \
- 	-D_7ZIP_LARGE_PAGES \
- 	$(LOCAL_FLAGS)
-=20
--CXX=3Dg++
--CC=3Dgcc
- CC_SHARED=3D-fPIC
- LINK_SHARED=3D-fPIC -shared
-=20
--=20
2.34.1


