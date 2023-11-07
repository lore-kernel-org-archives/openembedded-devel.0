Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91BCC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 10:05:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6968.1699351538925290063
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 02:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BMoksXLG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9675e4824b=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A79MYXx008132
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 10:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=1vVHo
	nBqlsZx70kvfdgPLbgTUEBKd4zZNzNqNaUnRas=; b=BMoksXLGePufBHObqIEzA
	B4JKtYZFJi68F9Yu9TSXzI+Ne15EYrd/eiu4NjcJY0g3Bh+kyOWh2jA9RBZpGC/k
	FbTWP1qbWVCKEqRy+SmZOGGFZ5/nxfYtrbKpskd9iUfsXR2oPNNpBnAWyspx93Q/
	ZKWYsavmNQ76GEYq4FZLnXdvWokqCuuHOjC4O0lxeOWa2EaxAVnIbwrN+LVKdBDz
	/g6e8sqIWLbE5CKKx4/Uki6Vq2Ak1xTHcKZXjWhsLahRUZK1pcyRq5hzHAaYTBeo
	QYt7zJPY1jIjvqS1K7vEHOG7+8UHhqnXys8JQntsuaOcyinqs5vnH9L2ABLpzqFX
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u5b5x2mm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 10:05:37 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 02:05:38 -0800
From: apolampa <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][mickledore][PATCH 1/1] nodejs: Upgrade 18.17.1 -> 18.18.2
Date: Tue, 7 Nov 2023 10:05:19 +0000
Message-ID: <20231107100519.3582169-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: NoyF-Xxdyeb8ayMODOBARzneQzgO5GDe
X-Proofpoint-ORIG-GUID: NoyF-Xxdyeb8ayMODOBARzneQzgO5GDe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_15,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=688 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311070083
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 10:05:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106445

From: Archana Polampalli <archana.polampalli@windriver.com>

Update to latest release of latest LTS 18 release

The following CVEs are fixed in this release:
    CVE-2023-44487
    CVE-2023-45143
    CVE-2023-38552
    CVE-2023-39333

License-Update: [1] [2]
 [1] https://github.com/nodejs/node/commit/06513585dc9bad6e9deb00d5f30bf3af0930295d
 [2] https://github.com/nodejs/node/commit/fbe89e632005e06ecafa7a34f75a0ac01ad3b885

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_18.17.bb => nodejs-oe-cache-native_18.18.bb} | 0
 .../nodejs/{nodejs_18.17.1.bb => nodejs_18.18.2.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-18.17 => nodejs-oe-cache-18.18}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_18.17.bb => nodejs-oe-cache-native_18.18.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_18.17.1.bb => nodejs_18.18.2.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.17/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.18/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.17/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.18/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.17.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.18.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.17.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.18.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.18.2.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_18.18.2.bb
index 402cf5671..512e66a62 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.18.2.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bc1f9ebe76be76f163e3b675303ad9cd"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=059ecf3a6f87111685e51b611b9563e5"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -39,7 +39,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "f215cf03d0f00f07ac0b674c6819f804c1542e16f152da04980022aeccf5e65a"
+SRC_URI[sha256sum] = "7249e2f0af943ec38599504f4b2a2bd31fb938787291b6ccca6c8badf01e3b56"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.40.0


