Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA11EC636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 09:01:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8714.1676883680129045610
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 01:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1415283ec8=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K8OjYj002438
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 09:01:19 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3sj96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 09:01:19 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Mon, 20 Feb 2023 01:01:15 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 20 Feb 2023 01:01:15 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] opencv: disable intel IPP
Date: Mon, 20 Feb 2023 17:01:14 +0800
Message-ID: <20230220090114.575687-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 56Ri0wXD-tB2bifzASpN5Uf2-_EGhXHa
X-Proofpoint-ORIG-GUID: 56Ri0wXD-tB2bifzASpN5Uf2-_EGhXHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_05,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 09:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101167

From: Mingli Yu <mingli.yu@windriver.com>

The ipp related code has IP issue as below.

=====================================================================
 $ cat  tmp/work/corei7-64-wrs-linux/opencv/4.6.0-r0/git/ippicv_lnx/icv/include/ippicv.h | head -n 30
 /*
 // Copyright 2014-2019 Intel Corporation All Rights Reserved.
 //
 // The source code, information and material ("Material") contained herein is
 // owned by Intel Corporation or its suppliers or licensors, and title
 // to such Material remains with Intel Corporation or its suppliers or
 // licensors. The Material contains proprietary information of Intel
 // or its suppliers and licensors. The Material is protected by worldwide
 // copyright laws and treaty provisions. No part of the Material may be used,
 // copied, reproduced, modified, published, uploaded, posted, transmitted,
 // distributed or disclosed in any way without Intel's prior express written
 // permission. No license under any patent, copyright or other intellectual
 // property rights in the Material is granted to or conferred upon you,
 // either expressly, by implication, inducement, estoppel or otherwise.
 // Any license under such intellectual property rights must be express and
 // approved by Intel in writing.
 //
 // Unless otherwise agreed by Intel in writing,
 // you may not remove or alter this notice or any other notice embedded in
 // Materials by Intel or Intel's suppliers or licensors in any way.
 //
 */

 #if !defined( __IPPICV_H__ )
 #define __IPPICV_H__

 #ifdef __cplusplus
 extern "C" {
 #endif
=====================================================================

So disable intel IPP [1] to avoid IP issue.

[1] https://www.intel.com/content/www/us/en/developer/articles/troubleshooting/intel-integrated-performance-primitives-intel-ipp-open-source-computer-vision-library-opencv-faq.html

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-support/opencv/opencv_4.6.0.bb    | 25 +------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
index fcbafd78a..1e4c3545b 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
@@ -12,40 +12,19 @@ DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
 SRCREV_opencv = "b0dc474160e389b9c9045da5db49d03ae17c6a6b"
 SRCREV_contrib = "7b77c355a8fdc97667b3fa1e7a0d37e4973fc868"
-SRCREV_ipp = "a56b6ac6f030c312b2dce17430eef13aed9af274"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
 SRCREV_wechat-qrcode = "a8b69ccc738421293254aec5ddb38bd523503252"
 
-def ipp_filename(d):
-    import re
-    arch = d.getVar('TARGET_ARCH')
-    if re.match("i.86$", arch):
-        return "ippicv_2020_lnx_ia32_20191018_general.tgz"
-    else:
-        return "ippicv_2020_lnx_intel64_20191018_general.tgz"
-
-def ipp_md5sum(d):
-    import re
-    arch = d.getVar('TARGET_ARCH')
-    if re.match("i.86$", arch):
-        return "ad189a940fb60eb71f291321322fe3e8"
-    else:
-        return "7421de0095c7a39162ae13a6098782f9"
-
-IPP_FILENAME = "${@ipp_filename(d)}"
-IPP_MD5 = "${@ipp_md5sum(d)}"
 
 SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg"
 SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=master;protocol=https \
            git://github.com/opencv/opencv_contrib.git;destsuffix=git/contrib;name=contrib;branch=master;protocol=https \
-           git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20191018;destsuffix=git/ipp;name=ipp;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=git/boostdesc;name=boostdesc;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=git/vgg;name=vgg;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=git/face;name=face;protocol=https \
            git://github.com/WeChatCV/opencv_3rdparty.git;branch=wechat_qrcode;destsuffix=git/wechat_qrcode;name=wechat-qrcode;protocol=https \
-           file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
            file://0003-To-fix-errors-as-following.patch \
            file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
            file://0001-Dont-use-isystem.patch \
@@ -63,7 +42,6 @@ S = "${WORKDIR}/git"
 OPENCV_DLDIR = "${WORKDIR}/downloads"
 
 do_unpack_extra() {
-    tar xzf ${S}/ipp/ippicv/${IPP_FILENAME} -C ${S}
 
     md5() {
         # Return the MD5 of $1
@@ -92,8 +70,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${S}/contrib/modules \
     -DWITH_1394=OFF \
     -DENABLE_PRECOMPILED_HEADERS=OFF \
     -DCMAKE_SKIP_RPATH=ON \
-    -DOPENCV_ICV_HASH=${IPP_MD5} \
-    -DIPPROOT=${S}/ippicv_lnx \
+    -DWITH_IPP=OFF \
     -DOPENCV_GENERATE_PKGCONFIG=ON \
     -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
     -DOPENCV_ALLOW_DOWNLOADS=OFF \
-- 
2.25.1


