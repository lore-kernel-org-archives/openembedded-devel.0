Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDD6C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 04:12:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3674.1740629549880095064
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 20:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4153b328b7=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R3nHUt027206
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 04:12:29 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451pu21n8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 04:12:28 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 26 Feb 2025 20:12:27 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 26 Feb 2025 20:12:27 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][meta-oe][PATCH] abseil-cpp: upgrade 20240116.2 -> 20240116.3
Date: Thu, 27 Feb 2025 12:12:26 +0800
Message-ID: <20250227041226.98162-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=K7bYHzWI c=1 sm=1 tr=0 ts=67bfe62c cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=JnBtpHOAbBm6UAzBLboA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: GBc4ndpBCJ4PAncEqIlmWTgligQNN7Sh
X-Proofpoint-GUID: GBc4ndpBCJ4PAncEqIlmWTgligQNN7Sh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502270029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 04:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115684

From: Changqing Li <changqing.li@windriver.com>

This upgrade include security fix for CVE-2025-0838, refer:
https://github.com/abseil/abseil-cpp/releases?page=1

git log:
54fac219 (tag: 20240116.3) Fix potential integer overflow in hash container create/resize (#1812)
d7aaad83 (tag: 20240116.2) Abseil LTS Branch, Jan 2024, Patch 2 (#1650)
2f9e432c (tag: 20240116.1) Prepare 20240116.1 patch for Apple Privacy Manifest (#1623)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{abseil-cpp_20240116.2.bb => abseil-cpp_20240116.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.bb => abseil-cpp_20240116.3.bb} (97%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
similarity index 97%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
index 87ab239311..11f4f3f9b7 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-SRCREV = "d7aaad83b488fd62bd51c81ecf16cd938532cc0a"
+SRCREV = "54fac219c4ef0bc379dfffb0b8098725d77ac81b"
 BRANCH = "lts_2024_01_16"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
-- 
2.34.1


