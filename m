Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BA7C48BEB
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 09:28:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.37818.1707902903211484253
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Feb 2024 01:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ts6QPzq/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27745cf6ca=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41E5wJut005301
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 01:28:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=1Hzgp
	lXqd7+jDZ51iLu58IIXoysY82cXjIQhbsnrM/k=; b=Ts6QPzq/v2FNZ2cxHPCn4
	Bj7Vs0noMD21zpWmZilUE1ioG/XRDpXhltGzYXybyTLJo3R5Bbr4ahgJQTrFRmWD
	RjytN3I9U7th7JyE5eJS3FXMTcuGIX9shlsiOW26zqj9dVQXVq1NLsSOU5PrKiL4
	c9wVdbaaIVOueZBdKeGRET7D+eTdEu+/5iHIgcKJiFgcng6j7vH5bWOk1ed/RtGY
	X554a/RA5/LLttNSHTXMvwyuZxYPjR0v8UA4PHYO/FY9HuuiLzoEfmLpYXn8xeEm
	Xi6DG/Tf1cRqJ5MWOmxfLalTJQ82jDe2V0rojPLv1Fl4X/H/8K0qvpjCqodIYIQE
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w69hm39h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 01:28:22 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 01:28:20 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] nodejs: update to latest v20 version 20.11.0
Date: Wed, 14 Feb 2024 09:28:07 +0000
Message-ID: <20240214092807.1224894-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: rUp3aG9ypHI-_nKonLiYNoI4PFgsLJ11
X-Proofpoint-GUID: rUp3aG9ypHI-_nKonLiYNoI4PFgsLJ11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_02,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 09:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108738

From: Archana Polampalli <archana.polampalli@windriver.com>

License-Update:
    update c-ares to 1.20.0 [1]
    Copyright update [2]

Removed below patches as these are availbe in 20.11.0
    0001-build-fix-build-with-Python-3.12.patch [3]
    0001-gyp-resolve-python-3.12-issues.patch [4]

Changelog:
   https://github.com/nodejs/node/releases/tag/v20.11.0

[1] https://github.com/nodejs/node/commit/b705e19a95b5fc5a2edc9fc11a7649d6eb32d70b
[2] https://github.com/nodejs/node/commit/347e1dd06a5f927d9fd64ce72d776c56d5101910
[3] https://github.com/nodejs/node/commit/0a5e9c12cf961a56bd63005974b953bbc0bc62a7
[4] https://github.com/nodejs/node/commit/68ec1e5eeb4ff984868c625f0ce808210169360d

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../oe-npm-cache                                            | 0
 ...cache-native_20.5.bb => nodejs-oe-cache-native_20.11.bb} | 0
 .../nodejs/{nodejs_20.8.1.bb => nodejs_20.11.0.bb}          | 6 ++----
 3 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.5 => nodejs-oe-cache-20.11}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.5.bb => nodejs-oe-cache-native_20.11.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.8.1.bb => nodejs_20.11.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.5/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.11/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.5/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.11/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.5.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.11.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.5.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.11.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.11.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.11.0.bb
index 5cdcd2767..cc5135478 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.11.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=162595a4a2f3453a0534e60b0afe4e7b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=78ad16dab3c1d15d4878c81770be0be7"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -27,8 +27,6 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Revert-io_uring-changes-from-libuv-1.46.0.patch \
            file://0002-Revert-io_uring-changes-from-libuv-1.45.0.patch \
            file://run-ptest \
-           file://0001-build-fix-build-with-Python-3.12.patch \
-           file://0001-gyp-resolve-python-3.12-issues.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -40,7 +38,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "f799c66f6a6386bb8ac2c75a378f740c455e97f1fe964393dd39c9f9f6efbc70"
+SRC_URI[sha256sum] = "31807ebeeeb049c53f1765e4a95aed69476a4b696dd100cb539ab668d7950b40"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.40.0


