Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAE2EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 15:37:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11069.1689694613972781146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 08:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RZaVFNTA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65634f9655=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36ICNkY7003740
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 15:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ne/5z
	OTrx0YFMAEgDsVtHp1Z0N9qDTG6YGjf/Y/1oFM=; b=RZaVFNTAS9ALebQY278uN
	67ztT9pWAOdfyaMKFL40dYxSD3moT8ttykfMP8EwcyOzmRi9mZMkq8QYmuurruhZ
	0KdQ4T+Zhbj+U2+2YOxbG0ghd5ptuCtBdo3qKZ7Sc8QctnSEa5A8GZTgZ4yikuD1
	ToUkkGrjFtv8SErjn5hz83SyawicTYnfLiZVm3QVDYwx9OvLzQMzjEDT4GAJXNYj
	9kH/s2RXVCuarOv1W3RguYvKNMmP5SnZsd21a/c+tKNwfiWaiG938jySs4HWWPsO
	2wEnTc2JMKxvVI+qPmQTuT1dq0Oz7MARaN2YK5k/8fE+sPaGFrUABnKl3FHv9vju
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run8aartt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 15:36:53 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 08:36:44 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][mickledore][PATCH 1/1] nodejs: upgrade 18.14.2 -> 18.16.1
Date: Tue, 18 Jul 2023 15:36:28 +0000
Message-ID: <20230718153628.536776-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: YI1yPYGnfRzUzgmyiBXnrqKK8RlFUjWw
X-Proofpoint-ORIG-GUID: YI1yPYGnfRzUzgmyiBXnrqKK8RlFUjWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_11,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307180144
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 15:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103949

Refresh 0001-Disable-running-gyp-files-for-bundled-deps.patch against 18.16.1

License-Update: Add missing licenses for Ada [1] BSD, Simduf [2] BSD, posteject
[3] MIT

[1] https://github.com/nodejs/node/commit/0bc4c17e5705ea042cda392343d7301bb91873ed
[2] https://github.com/nodejs/node/commit/c9845fc3341fcdce298ad7f1630e329d71a6e746
[3] https://github.com/nodejs/node/commit/4aaec0726694ad0d3cb05d7f2593a90363c32f32

The list of the CVEs are fixed in this relase:

    CVE-2023-30581
    CVE-2023-30585
    CVE-2023-30588
    CVE-2023-30589
    CVE-2023-30590

https://github.com/nodejs/node/releases/tag/v18.16.1
https://github.com/nodejs/node/releases/tag/v18.16.0
https://github.com/nodejs/node/releases/tag/v18.15.0

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../oe-npm-cache                                           | 0
 ...che-native_18.14.bb => nodejs-oe-cache-native_18.16.bb} | 0
 .../0001-Disable-running-gyp-files-for-bundled-deps.patch  | 7 ++++++-
 .../nodejs/{nodejs_18.14.2.bb => nodejs_18.16.1.bb}        | 4 ++--
 4 files changed, 8 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-18.14 => nodejs-oe-cache-18.16}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_18.14.bb => nodejs-oe-cache-native_18.16.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_18.14.2.bb => nodejs_18.16.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.14/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.16/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.14/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.16/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.14.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.16.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.14.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.16.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
index 356c98d17..059b5cc07 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
@@ -29,10 +29,13 @@ python prune_sources() {
 }
 do_unpack[postfuncs] += "prune_sources"
 
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/Makefile b/Makefile
+index 0be0659d..3c442014 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -169,7 +169,7 @@ with-code-cache test-code-cache:
@@ -41,6 +44,8 @@ do_unpack[postfuncs] += "prune_sources"
  out/Makefile: config.gypi common.gypi node.gyp \
 -	deps/uv/uv.gyp deps/llhttp/llhttp.gyp deps/zlib/zlib.gyp \
 +	deps/llhttp/llhttp.gyp \
- 	deps/simdutf/simdutf.gyp \
+	deps/simdutf/simdutf.gyp deps/ada/ada.gyp \
  	tools/v8_gypfiles/toolchain.gypi tools/v8_gypfiles/features.gypi \
  	tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.16.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_18.16.1.bb
index 19df7d542..bc289001c 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.16.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2dff1ccca11e333f1388e34f7e2d1de3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0be148d0e7298c5c94f7501affafbce5"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -39,7 +39,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "fbc364dd25fee2cacc0f2033db2d86115fc07575310ea0e64408b8170d09c685"
+SRC_URI[sha256sum] = "e8404f8c8d89fdfdf7e95bbbc6066bd0e571acba58f54492599b615fbeefe272"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.40.0


