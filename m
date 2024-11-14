Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDC6D68B14
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 13:23:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.37040.1731590622539071923
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 05:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10487a133e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE7XCol008402
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 13:23:41 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwtubstn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 13:23:41 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 14 Nov 2024 05:23:40 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 14 Nov 2024 05:23:39 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 6/7] nodejs: upgrade 20.17.0 -> 20.18.0
Date: Thu, 14 Nov 2024 13:23:27 +0000
Message-ID: <20241114132328.1340824-6-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241114132328.1340824-1-archana.polampalli@windriver.com>
References: <20241114132328.1340824-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: asxGr3VikTD6SoSeLLCvWSMhgE66jf-K
X-Authority-Analysis: v=2.4 cv=BPnhr0QG c=1 sm=1 tr=0 ts=6735f9dd cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=-LCu6K_DAAAA:8 a=wmoFfhs-WseHezOzP3oA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: asxGr3VikTD6SoSeLLCvWSMhgE66jf-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411140105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 13:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113821

From: "J. S" <schonm@gmail.com>

License checksum change due to whitespace changes.
https://github.com/nodejs/node/commit/1dfd238781

libatomic.patch change due to changes in node.gyp
https://github.com/nodejs/node/commit/25c788009f1fa7a392af51cb97d0a55f0f4a6983

Changelog :
https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V20.md#20.18.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_20.17.bb => nodejs-oe-cache-native_20.18.bb} | 0
 meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch        | 2 +-
 .../nodejs/{nodejs_20.17.0.bb => nodejs_20.18.0.bb}           | 4 ++--
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-20.17 => nodejs-oe-cache-20.18}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_20.17.bb => nodejs-oe-cache-native_20.18.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.17.0.bb => nodejs_20.18.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.17/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.18/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.17/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.18/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.17.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.18.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.17.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_20.18.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
index 6b7ccb8a9..22dc6c151 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
@@ -29,7 +29,7 @@ index b425f443..f296f35c 100644
 @@ -487,7 +487,18 @@
          ],
        }],
-       ['OS == "linux" and llvm_version != "0.0"', {
+       ['OS=="linux" and clang==1', {
 -        'libraries': ['-latomic'],
 +        'target_conditions': [
 +           ['_toolset=="host"', {
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_20.17.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_20.18.0.bb
index be1802f29..f937e298e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2ab85b3bae451276a10919163bcc5b74"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c83fcdcd43ab352be6429ee1fd8827a0"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "9abf03ac23362c60387ebb633a516303637145cb3c177be3348b16880fd8b28c"
+SRC_URI[sha256sum] = "7d9433e91fd88d82ba8de86e711ec41907638e227993d22e95126b02f6cd714a"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.40.0


