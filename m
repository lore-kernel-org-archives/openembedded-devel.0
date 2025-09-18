Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58322CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 04:58:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6420.1758171490371493859
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 21:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZoSLDcRM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=135610341e=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I4sdim2454332
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=6aJOIxH6KhQWwFs/hhn1
	s6GG0q+qFxr7x2wmY8WJnrg=; b=ZoSLDcRMaW4DEybV7NDyDB2x1R8KaqNOAhbL
	W0wQ2EmUbR5+Nvrj/I6kypwQ1koeQktOQ9HkHUIC+82eOsDhCPD1CLUUX5+uL3Gs
	BQDBX+owZXaF3GSKNhwNqPnbqNzpiQcWbzsFITGk8W7Hg1EQJI629rav13vcCGGu
	dteu+oSngkCh+IyENv7t6lcN3AYNQtorwWmZhFbRBUH+XPvdq60YoYcOnams9DC2
	3Yci5H7OyuDbmmEOhKLJzjOk8Lk1J7VCFo7ogdqYEeMhVNGjJh57vsN9lLHKvGGo
	Zelo9yr2O8FcctdL2O9g8HSkdc7fpbtEhRO9bv4ZLT02z2PgRQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwssnc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:58:08 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 17 Sep 2025 21:58:07 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 17 Sep 2025 21:58:06 -0700
From: <praveen.kumar@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar[PATCH 1/1] fix: CVE-2025-53644
Date: Thu, 18 Sep 2025 10:27:47 +0530
Message-ID: <20250918045747.2782896-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: QFdD9Zyok17HjCM7qx21KpiTBpzkw1LU
X-Proofpoint-ORIG-GUID: QFdD9Zyok17HjCM7qx21KpiTBpzkw1LU
X-Authority-Analysis: v=2.4 cv=C5zpyRP+ c=1 sm=1 tr=0 ts=68cb9161 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=1t4O7eHJqFToEEw2QrAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA0MiBTYWx0ZWRfX26QznMRxA7HR
 kTdbVhyT3Bc1IM/p9xZ4S50i4LnioqfLE7QkWh/0LeMLC4M6CjfAYwKtikVCJiSIszoFLmZg3Hv
 OQQoJ9TPA6iwH5ySVDeufg+q5yFZH0ERIEWO0ggOfyyHSnAHX4kvRtGEA/afA38Pt44ilQLXZtW
 Gb6CyKWzmy1tKBH9J2Omc9isUC0rQ7aFaH7XcGIf274ONKUlcc+lXHFJ3yJ1gdm8pm42vkoXiAz
 JRSdlsZT/GEl92ZV91BaXwHNKn5OYufmTOomudYaNautiLl25+1STNE9f1y6mIoq881dIrm3Ve9
 5NOm9Ub6NMGLr7AsyAn4uqsjQwPEbzs2L1MxMZqLi2pO7O3C4fa/c3x/GdvGzo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119517

From: Praveen Kumar <praveen.kumar@windriver.com>

OpenCV is an Open Source Computer Vision Library. Versions prior to
4.12.0 have an uninitialized pointer variable on stack that may lead
to arbitrary heap buffer write when reading crafted JPEG images.
Version 4.12.0 fixes the vulnerability.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-53644

Upstream-patch:
https://github.com/opencv/opencv/commit/a39db41390de546d18962ee1278bd6dbb715f466

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../opencv/opencv/CVE-2025-53644.patch        | 29 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.11.0.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2025-53644.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2025-53644.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2025-53644.patch
new file mode 100644
index 0000000000..671e91b616
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2025-53644.patch
@@ -0,0 +1,29 @@
+From a39db41390de546d18962ee1278bd6dbb715f466 Mon Sep 17 00:00:00 2001
+From: Alexander Smorkalov <alexander.smorkalov@opencv.ai>
+Date: Tue, 13 May 2025 08:56:14 +0300
+Subject: [PATCH] Cherry-pick OpenJPEG deconding status fix.
+
+CVE: CVE-2025-53644
+
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/a39db41390de546d18962ee1278bd6dbb715f466]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ 3rdparty/openjpeg/openjp2/jp2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/3rdparty/openjpeg/openjp2/jp2.c b/3rdparty/openjpeg/openjp2/jp2.c
+index 6015190e1f..ab868bd7c1 100644
+--- a/3rdparty/openjpeg/openjp2/jp2.c
++++ b/3rdparty/openjpeg/openjp2/jp2.c
+@@ -2869,7 +2869,7 @@ OPJ_BOOL opj_jp2_read_header(opj_stream_private_t *p_stream,
+                               p_image,
+                               p_manager);
+
+-    if (p_image && *p_image) {
++    if (ret && p_image && *p_image) {
+         /* Set Image Color Space */
+         if (jp2->enumcs == 16) {
+             (*p_image)->color_space = OPJ_CLRSPC_SRGB;
+--
+2.40.0
diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
index 61dc681a39..22760551aa 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=ht
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
            file://0001-core-fixed-VSX-intrinsics-implementation.patch \
            file://0001-FROMLIST-Switch-to-static-instance-of-FastCV-on-Linux.patch \
+           file://CVE-2025-53644.patch \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
 
-- 
2.40.0


