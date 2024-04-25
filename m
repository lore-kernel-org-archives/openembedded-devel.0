Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0BEC4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 08:25:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12043.1714033553124019510
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Apr 2024 01:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ozdF5p6e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=484590994e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P6jYbI007264
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 01:25:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=aVRqg
	kbMl1TodONg7r+DCcWzxixkZyvAPawvx0nCDWI=; b=ozdF5p6eiCEpILqIkp6UX
	bxjkGxG1mjerblr6oPi+7rYlh0yFqhDxbPmqFKbNMYu5hSVedvev1JPhIrDvsScc
	J98ymJTSDVHuChdOYUJmFWH+vQO2icRcks1AJpQ1CNg9MO5KHbiWCN6QQ9vC4YGs
	EbR+zhDaeVYKsvLG/pEuf8pf8GpsSQgTUvNZ1+ei7FxOzSJiaaLFis24Ec1Xj1YJ
	isCupcGcqQy7Z67Uq774xxqDne5EMBTgQAGu3x5LFS+zp47X5E1rw/woi+Vr1J7C
	3wQdIGOKANpLYE2Zb0e8ltTZD/iSX5aKKVVzlSRbcj/aQOJUwWEmpKDQvvfqULul
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xm900w2wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 01:25:52 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Thu, 25 Apr 2024 01:25:49 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] nodejs: upgrade 20.11.1 -> 20.12.2
Date: Thu, 25 Apr 2024 08:25:19 +0000
Message-ID: <20240425082519.2888002-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: VrFvd4Me_CyfArcOw30zIDUlEJJ7yEB7
X-Proofpoint-ORIG-GUID: VrFvd4Me_CyfArcOw30zIDUlEJJ7yEB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_07,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 08:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110150

From: Archana Polampalli <archana.polampalli@windriver.com>

License-Update:
    Copyright year updated
    zlib version updated
    GN files License update

https://github.com/nodejs/node/commit/b5bc597871ca701bab750c46d31ed626decd7f89
https://github.com/nodejs/node/commit/c8233912e9fd7464898b549d6762130722bf0bf4

Changelog:
https://github.com/nodejs/node/releases/tag/v20.12.2
https://github.com/nodejs/node/releases/tag/v20.12.1
https://github.com/nodejs/node/releases/tag/v20.12.0

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_20.11.bb => nodejs-oe-cache-native_20.12.bb} | 0
 .../nodejs/{nodejs_20.11.1.bb => nodejs_20.12.2.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.11 => nodejs-oe-cache-20.12}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.11.bb => nodejs-oe-cache-native_20.12.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.11.1.bb => nodejs_20.12.2.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.11/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.11/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.11.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.12.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.11.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.12.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.11.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_20.11.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
index 9a61cfcf7..d86c38f2f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.11.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.12.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=78ad16dab3c1d15d4878c81770be0be7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9a7fcce64128730251dbc58aa41b4674"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -36,7 +36,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "77813edbf3f7f16d2d35d3353443dee4e61d5ee84d9e3138c7538a3c0ca5209e"
+SRC_URI[sha256sum] = "d7cbcc5fbfb31e9001f3f0150bbeda59abe5dd7137aaa6273958cd59ce35ced7"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.40.0


