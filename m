Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72951CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 11:56:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8880.1761306969415229713
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 04:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SqQlNNIJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2392a7d4df=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O5DSVr1375357
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 04:56:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=aqSI4X154SdducIkIWxl
	QqZEvHg74A43qmjBvPvczio=; b=SqQlNNIJff7eVkWZ5NBL60vEYQdFp+l65oVQ
	6QLxfpSuNNn1zCZc/+5VXP6HJrS+1YwiukD9kSh/N1VPIhzF+fA2mAjRZB0nioyz
	Am672+eYw65FdKybmZ8w2YvgHXN3kqB7/nqYjC5sU+FzhvpX6zp34dUSoGL1ABbr
	WRyd67Sx44+zb4VJ90EgKgntQSixQRPkufuOwqCL1GBzvEry321FBL4mt7aYchCi
	ZIg6aeI40r477eWvU8SZIcBvx6J81Ak0SVEJ3IxMOvO9kq0cB08OZs2/ybTEHUi/
	eM16wKnYHSyu8q3C9Calcmf19mVne/J7lKc90VBI/4tMztDTWQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49ys00gt9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 04:56:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 24 Oct 2025 04:56:08 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 24 Oct 2025 04:56:07 -0700
From: <praveen.kumar@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] cjson: upgrade 1.7.18 -> 1.7.19
Date: Fri, 24 Oct 2025 17:25:58 +0530
Message-ID: <20251024115558.931915-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDEwNiBTYWx0ZWRfX4hXCqwHeaYyB
 /GC7qhqjFkyxxs0EXEVQDost7ixbDg4PzomcnJU4w7chPv7PA12GcM5Y0DOv34Sk/S3EQ1cUcbB
 Gm3tupciWxt5HKKle6yIt8hySm3EsUByRjslexnCVUcDPFCJj+qdvPD4D4ONSOOJrCk3dtJI3pR
 UkBlVCx+1wnoh5rXMJHy6de8aPml6WR+x8TmJ/PuykRM92asGT3rgF6EkxMVH8us5J6LCk0f1hX
 Row+xsAt+BBif5R1gIpypLCIo7ZQFhc+zFUxSnXwjb4Bj6TVzYVW8iUrqvEEWt8ukN/gO+SuCkG
 IHPxwJJBAv0szwN3eUcl3KnA8/1fERuquDdgRpgNddEdcPma8iVlli9rK+3FD6yWjXCVZOJQdww
 Wb+fLa2FXh9uhCxK8APPnlQqh7ggAQ==
X-Proofpoint-ORIG-GUID: 7ZksoVfTbKI_3edOOTerqAd2G4Bszk4p
X-Proofpoint-GUID: 7ZksoVfTbKI_3edOOTerqAd2G4Bszk4p
X-Authority-Analysis: v=2.4 cv=N/8k1m9B c=1 sm=1 tr=0 ts=68fb6959 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=AUd_NHdVAAAA:8 a=i--bMA7scPcvzODhH_cA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510240106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 11:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120954

From: Praveen Kumar <praveen.kumar@windriver.com>

This includes CVE-fix for CVE-2023-26819.

Removed CVE-2025-57052, as the issue was already resolved
in v1.7.19.

Changelog:
==========
https://github.com/DaveGamble/cJSON/blob/master/CHANGELOG.md

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../cjson/cjson/CVE-2025-57052.patch          | 33 -------------------
 .../{cjson_1.7.18.bb => cjson_1.7.19.bb}      |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.18.bb => cjson_1.7.19.bb} (85%)

diff --git a/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch b/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
deleted file mode 100644
index ed3d4a7eba..0000000000
--- a/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e53a1413304382d562176bed91609e00b4fcf87e Mon Sep 17 00:00:00 2001
-From: Lee <peteralfredlee@gmail.com>
-Date: Fri, 5 Sep 2025 14:53:20 +0800
-Subject: [PATCH] fix the incorrect check in decode_array_index_from_pointer
- (#957)
-
-this fixes CVE-2025-57052
-
-CVE: CVE-2025-57052
-Upstream-Status: Backport [https://github.com/DaveGamble/cJSON/commit/74e1ff4994aa]
-
-(cherry picked from commit 74e1ff4994aa4139126967f6d289b675b4b36fef)
-Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
----
- cJSON_Utils.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cJSON_Utils.c b/cJSON_Utils.c
-index 63651df..8fa24f8 100644
---- a/cJSON_Utils.c
-+++ b/cJSON_Utils.c
-@@ -282,7 +282,7 @@ static cJSON_bool decode_array_index_from_pointer(const unsigned char * const po
-         return 0;
-     }
- 
--    for (position = 0; (pointer[position] >= '0') && (pointer[0] <= '9'); position++)
-+    for (position = 0; (pointer[position] >= '0') && (pointer[position] <= '9'); position++)
-     {
-         parsed_index = (10 * parsed_index) + (size_t)(pointer[position] - '0');
- 
--- 
-2.44.1
-
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
similarity index 85%
rename from meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
rename to meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
index 6c335a988a..d7e40c5acd 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
@@ -6,9 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
 SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
-           file://CVE-2025-57052.patch \
          "
-SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
+SRCREV = "c859b25da02955fef659d658b8f324b5cde87be3"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


