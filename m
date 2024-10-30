Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059ACD7497D
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 07:16:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9478.1730272572123442482
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Oct 2024 00:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1033036b89=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U5pS6k015216
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 00:16:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gyxjv8nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 00:16:11 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 00:16:10 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 00:16:09 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] nodejs: upgrade 20.12.2 -> 20.15.1
Date: Wed, 30 Oct 2024 07:16:08 +0000
Message-ID: <20241030071608.1496074-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=eZtvfKEH c=1 sm=1 tr=0 ts=6721dd3b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=-LCu6K_DAAAA:8 a=NEAV23lmAAAA:8 a=19RDG04orJZLT5jqiVEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: tWKpoClt2FAkuo63cXri8GAHeN4Tf5sv
X-Proofpoint-ORIG-GUID: tWKpoClt2FAkuo63cXri8GAHeN4Tf5sv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_03,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410300056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 07:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113340

From: Archana Polampalli <archana.polampalli@windriver.com>

nodejs release notes [1]

License-Update: Copyright year changed for Unicode License [2]

[1] https://nodejs.org/en/blog/release/v20.15.1
[2] https://github.com/nodejs/node/commit/d5a316f5ea3fade3140c2ae35c144b500fb5d758

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_20.12.bb => nodejs-oe-cache-native_20.15.bb} | 0
 .../nodejs/{nodejs_20.12.2.bb => nodejs_20.15.1.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.12 => nodejs-oe-cache-20.15}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.12.bb => nodejs-oe-cache-native_20.15.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.12.2.bb => nodejs_20.15.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.15/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.15/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.15.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.12.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.15.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.15.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.15.1.bb
index d86c38f2f..ff39cef48 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.15.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9a7fcce64128730251dbc58aa41b4674"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cef54676c547a5bbab44aa8be3be9ef7"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -36,7 +36,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "d7cbcc5fbfb31e9001f3f0150bbeda59abe5dd7137aaa6273958cd59ce35ced7"
+SRC_URI[sha256sum] = "fdd53a5729d936691a2a1151046fb4897721cb8b0fca2af957823a9b40fe0c34"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.40.0


