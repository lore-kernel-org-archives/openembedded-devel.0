Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA651E7718E
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 08:16:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.21668.1734855380366598833
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Dec 2024 00:16:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=208694af22=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BM7rRoa019027;
	Sun, 22 Dec 2024 08:16:19 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43njw0rxmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 22 Dec 2024 08:16:18 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 22 Dec 2024 00:16:17 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 22 Dec 2024 00:16:16 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 4/4] 7zip: Fix build with clang
Date: Sun, 22 Dec 2024 16:16:12 +0800
Message-ID: <20241222081612.239474-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241222081612.239474-1-hongxu.jia@windriver.com>
References: <20241222081612.239474-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Yc5H5xRf c=1 sm=1 tr=0 ts=6767cad3 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=CmXmAjSsj9DRm6oYQ8MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: xwer_8ghJqaSibeqvgzDmgYVlCzSLbaY
X-Proofpoint-GUID: xwer_8ghJqaSibeqvgzDmgYVlCzSLbaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-22_03,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412220073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Dec 2024 08:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114461

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>

(cherry picked from commit e1a8da10f038af69b2d4fc133dea62eceb4f0d46)
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/7zip/7zip_24.09.bb   | 31 +++++++++++++------
 .../0001-support-yocto-cross-compiling.patch  | 18 ++++++-----
 2 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/meta-oe/recipes-extended/7zip/7zip_24.09.bb b/meta-oe/recipes-extended/7zip/7zip_24.09.bb
index 99cb28554..9ebeae34e 100644
--- a/meta-oe/recipes-extended/7zip/7zip_24.09.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_24.09.bb
@@ -17,19 +17,27 @@ UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 S = "${WORKDIR}/git"
 
 # Support Yocto cross compiling
+CXXFLAGS:append:toolchain-clang = " -Wno-error=cast-qual -Wno-error=sign-conversion \
+                                    -Wno-error=disabled-macro-expansion \
+                                    -Wno-error=cast-function-type-strict"
+
 EXTRA_OEMAKE += " \
     CXXFLAGS_EXTRA='${CXXFLAGS}' \
     CFLAGS_BASE2='${CFLAGS}' \
     LDFLAGS_STATIC_3='${LDFLAGS}' \
 "
 
+# Support clang
+MAKEFILE ?= "../../cmpl_gcc.mak"
+MAKEFILE:class-target:toolchain-clang = "../../cmpl_clang.mak"
+
 do_compile() {
-    oe_runmake -C CPP/7zip/Bundles/Alone2    -f ../../cmpl_gcc.mak
-    oe_runmake -C CPP/7zip/Bundles/Format7zF -f ../../cmpl_gcc.mak
-    oe_runmake -C CPP/7zip/UI/Console        -f ../../cmpl_gcc.mak
-    oe_runmake -C CPP/7zip/Bundles/SFXCon    -f ../../cmpl_gcc.mak
-    oe_runmake -C CPP/7zip/Bundles/Alone     -f ../../cmpl_gcc.mak
-    oe_runmake -C CPP/7zip/Bundles/Alone7z   -f ../../cmpl_gcc.mak
+    oe_runmake -C CPP/7zip/Bundles/Alone2    -f ${MAKEFILE}
+    oe_runmake -C CPP/7zip/Bundles/Format7zF -f ${MAKEFILE}
+    oe_runmake -C CPP/7zip/UI/Console        -f ${MAKEFILE}
+    oe_runmake -C CPP/7zip/Bundles/SFXCon    -f ${MAKEFILE}
+    oe_runmake -C CPP/7zip/Bundles/Alone     -f ${MAKEFILE}
+    oe_runmake -C CPP/7zip/Bundles/Alone7z   -f ${MAKEFILE}
 }
 
 FILES:${PN} += "${libdir}/*"
@@ -37,15 +45,18 @@ FILES:${PN} += "${libdir}/*"
 FILES_SOLIBSDEV = ""
 INSANE_SKIP:${PN} += "dev-so"
 
+INSTALLDIR ?= "g"
+INSTALLDIR:class-target:toolchain-clang = "c"
+
 do_install() {
 	install -d ${D}${bindir}
-	install -m 0755 ${S}/CPP/7zip/Bundles/Alone/b/g/7za ${D}${bindir}
-	install -m 0755 ${S}/CPP/7zip/Bundles/Alone7z/b/g/7zr ${D}${bindir}
-	install -m 0755 ${S}/CPP/7zip/UI/Console/b/g/7z ${D}${bindir}/7z.real
+	install -m 0755 ${S}/CPP/7zip/Bundles/Alone/b/${INSTALLDIR}/7za ${D}${bindir}
+	install -m 0755 ${S}/CPP/7zip/Bundles/Alone7z/b/${INSTALLDIR}/7zr ${D}${bindir}
+	install -m 0755 ${S}/CPP/7zip/UI/Console/b/${INSTALLDIR}/7z ${D}${bindir}/7z.real
 	install -m 0755 ${WORKDIR}/7z_wrapper.sh ${D}${bindir}/7z
 
 	install -d ${D}${libdir}
-	install -m 0755 ${S}/CPP/7zip/Bundles/Format7zF/b/g/7z.so ${D}${libdir}/lib7z.so
+	install -m 0755 ${S}/CPP/7zip/Bundles/Format7zF/b/${INSTALLDIR}/7z.so ${D}${libdir}/lib7z.so
 	ln -rsn ${D}${libdir}/lib7z.so ${D}${bindir}/7z.so
 }
 
diff --git a/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-compiling.patch b/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-compiling.patch
index 06908e94f..e3d047793 100644
--- a/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-compiling.patch
+++ b/meta-oe/recipes-extended/7zip/files/0001-support-yocto-cross-compiling.patch
@@ -21,8 +21,6 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  CPP/7zip/var_gcc.mak  | 2 --
  2 files changed, 1 insertion(+), 3 deletions(-)
 
-diff --git a/CPP/7zip/7zip_gcc.mak b/CPP/7zip/7zip_gcc.mak
-index bcb06a0..297f0a8 100644
 --- a/CPP/7zip/7zip_gcc.mak
 +++ b/CPP/7zip/7zip_gcc.mak
 @@ -45,7 +45,7 @@ CFLAGS_DEBUG = -g
@@ -30,12 +28,10 @@ index bcb06a0..297f0a8 100644
  CFLAGS_DEBUG = -DNDEBUG
  ifneq ($(CC), $(CROSS_COMPILE)clang)
 -LFLAGS_STRIP = -s
-+LFLAGS_STRIP = 
++LFLAGS_STRIP =
  endif
  endif
  
-diff --git a/CPP/7zip/var_gcc.mak b/CPP/7zip/var_gcc.mak
-index 664491c..6d0f485 100644
 --- a/CPP/7zip/var_gcc.mak
 +++ b/CPP/7zip/var_gcc.mak
 @@ -6,7 +6,5 @@ IS_ARM64=
@@ -46,6 +42,12 @@ index 664491c..6d0f485 100644
 -CXX=$(CROSS_COMPILE)g++
  
  # -march=armv8-a+crc+crypto
--- 
-2.34.1
-
+--- a/CPP/7zip/var_clang.mak
++++ b/CPP/7zip/var_clang.mak
+@@ -6,6 +6,4 @@ IS_ARM64=
+ CROSS_COMPILE=
+ MY_ARCH=
+ USE_ASM=
+-CC=$(CROSS_COMPILE)clang
+-CXX=$(CROSS_COMPILE)clang++
+ USE_CLANG=1
-- 
2.34.1


