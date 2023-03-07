Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C53C678D4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 08:10:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9693.1678176615425339091
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Mar 2023 00:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2430f38ff6=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3277Xhcv011993
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Mar 2023 00:10:15 -0800
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p4258tn14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Mar 2023 00:10:14 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 7 Mar 2023 00:10:13 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 7 Mar 2023 00:10:13 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] opencv: Upgrade to 4.7.0
Date: Tue, 7 Mar 2023 16:10:12 +0800
Message-ID: <20230307081012.2386583-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: R5reB3-uW4CRQBBs_DCtjpcYfaljWB_u
X-Proofpoint-ORIG-GUID: R5reB3-uW4CRQBBs_DCtjpcYfaljWB_u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_02,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303070073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Mar 2023 08:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101406

From: Mingli Yu <mingli.yu@windriver.com>

Upgrade opencv to 4.7.0 [1] and remove backported patch.

[1] https://github.com/opencv/opencv/wiki/ChangeLog#version470

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ng-header-for-LIBAVCODEC_VERSION_INT.patch | 26 -------------------
 .../{opencv_4.6.0.bb => opencv_4.7.0.bb}      |  5 ++--
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.6.0.bb => opencv_4.7.0.bb} (98%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch b/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch
deleted file mode 100644
index 59da6ab32..000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d6bdd0a91eb0ed57688c0af5ba5088cf0afdc0a0 Mon Sep 17 00:00:00 2001
-From: Jochen Sprickerhof <jspricke@debian.org>
-Date: Mon, 8 Aug 2022 21:10:13 +0200
-Subject: [PATCH] Add missing header for LIBAVCODEC_VERSION_INT
-
-Upstream-Status: Backport [https://github.com/opencv/opencv/pull/22357]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/videoio/src/ffmpeg_codecs.hpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/modules/videoio/src/ffmpeg_codecs.hpp b/modules/videoio/src/ffmpeg_codecs.hpp
-index 61788e0345..faad2596ed 100644
---- a/modules/videoio/src/ffmpeg_codecs.hpp
-+++ b/modules/videoio/src/ffmpeg_codecs.hpp
-@@ -60,6 +60,7 @@ extern "C" {
- #include <errno.h>
- #endif
- 
-+#include <libavcodec/version.h>
- #include <libavformat/avformat.h>
- 
- #ifdef __cplusplus
--- 
-2.38.1
-
diff --git a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
similarity index 98%
rename from meta-oe/recipes-support/opencv/opencv_4.6.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.7.0.bb
index 1e4c3545b..eef2e66ca 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.7.0.bb
@@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "b0dc474160e389b9c9045da5db49d03ae17c6a6b"
-SRCREV_contrib = "7b77c355a8fdc97667b3fa1e7a0d37e4973fc868"
+SRCREV_opencv = "725e440d278aca07d35a5e8963ef990572b07316"
+SRCREV_contrib = "e247b680a6bd396f110274b6c214406a93171350"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
@@ -30,7 +30,6 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
-           file://0001-Add-missing-header-for-LIBAVCODEC_VERSION_INT.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
-- 
2.25.1


