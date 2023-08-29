Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059D0C83F14
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 11:35:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15127.1693308927276925008
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Aug 2023 04:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FoycwxGZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7605a3e163=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37TAoATb024745
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 04:35:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=C8Dvi
	XvBBlYz6HNMXwSx2TxucLd7Abt71ygOvTfRLlk=; b=FoycwxGZv2GSmd0Pr4Spj
	PEtA//q9ateHT/QDbue+AGHBHHKaPD6UiE/p9BQNoHFMCxoa5EDIboxt90qw8VK0
	70534QJMwOSE3560wQ5fec7XntcLa/l86mJn0C95h0myO+XQ4wxeTAoe195cPHlY
	1kLHtccBwYiBgCIIc+7zamkDsbpo4mP8+4OxHRZW99zIfgrJmpnDxUJPohs1uw6V
	dl9X28eQRGS1p+Yx1GRhkCMvmsmaUomqpC1C56wPzGpR0HaCxlVskj+T9ipzh9gg
	QXjxhbvFt19IzXC6WraxG2AfmuBA4rBoi38sJvx9F+P8flWFf63B0/olQ5R4/108
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqgwfj9au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 04:35:26 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 04:35:24 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][mickledore][PATCH 1/2] nodejs: upgrade 18.16.1 -> 18.17.1
Date: Tue, 29 Aug 2023 11:35:12 +0000
Message-ID: <20230829113513.276561-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: zgBbW01X0jOL3oo9WmrhlMAZzUTcKkKw
X-Proofpoint-ORIG-GUID: zgBbW01X0jOL3oo9WmrhlMAZzUTcKkKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_08,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=905
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2308290099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Aug 2023 11:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104639

Update to latest release of latest LTS 18 release

License-Update: [1] [2] [3]

The following CVEs are fixed in this release:
    CVE-2023-32002
    CVE-2023-32006
    CVE-2023-32559

[1] https://github.com/nodejs/node/commit/0cfdb3affa518bf55cfd8120f0286099fabfb22a
[2] https://github.com/nodejs/node/commit/2ea6e030038d86376dea748f702ed14018f99aba
[3] https://github.com/nodejs/node/commit/261e1d23d11053b373ea51745f6c1187440c2b08

https://github.com/nodejs/node/releases/tag/v18.17.1

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_18.16.bb => nodejs-oe-cache-native_18.17.bb} | 0
 .../nodejs/{nodejs_18.16.1.bb => nodejs_18.17.1.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-18.16 => nodejs-oe-cache-18.17}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_18.16.bb => nodejs-oe-cache-native_18.17.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_18.16.1.bb => nodejs_18.17.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.16/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.17/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.16/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.17/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.16.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.17.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.16.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.17.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.16.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_18.16.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
index bc289001c..402cf5671 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.16.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0be148d0e7298c5c94f7501affafbce5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bc1f9ebe76be76f163e3b675303ad9cd"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -39,7 +39,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "e8404f8c8d89fdfdf7e95bbbc6066bd0e571acba58f54492599b615fbeefe272"
+SRC_URI[sha256sum] = "f215cf03d0f00f07ac0b674c6819f804c1542e16f152da04980022aeccf5e65a"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.40.0


