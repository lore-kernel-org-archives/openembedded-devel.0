Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0B4C25B0F
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 07:56:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.8257.1660290998464855965
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 00:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qikX9Ssl;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5223643dcc=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27C7E7oE026637
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 07:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=AdSkuP6pZSmB67SN1QkoQsditTeR43S7LbEZjo0vwN4=;
 b=qikX9SslYNojHx+pgB66frvteQvYVvCu93k1vzqbmowbeubYxVBUmtaD9q0vFVZj73EB
 95buaL6ppoJJIY/aFvrXzRmxMiFtg++CZOyzSLVEvznnxSQsd1u2RyxOHB/ui/HAXxsb
 056U17vXA9iQDr0TLYFH3ZIHPQ1A0IleU2CrgSuv+sDJeVTbTfkhJF1sJr4aPKHJglYM
 opbUXqweQ4OWeBVOLi0L6nvc0NGhRyBMQe2XCKTatzs/hVxNCTJG0s+ukfMjO3PrwfVM
 /flDft9w4P6rPrkREaJT/d1e+kuoWsE90vBijymE4q2Dh876iheiztmLIV8wivK2SY+S Zw==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hvqe6s2w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 07:56:37 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 12 Aug 2022 00:56:30 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 12 Aug 2022 00:56:30 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 12 Aug 2022 00:56:29 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [master][meta-filesystems][PATCH] fuse3: support ptest
Date: Fri, 12 Aug 2022 15:56:28 +0800
Message-ID: <20220812075628.1347747-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: HZBsPQz0x3uDVDpYsRFyamwmNFPg19Sb
X-Proofpoint-GUID: HZBsPQz0x3uDVDpYsRFyamwmNFPg19Sb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Aug 2022 07:56:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98207

From: Changqing Li <changqing.li@windriver.com>

fuse3 test is designed to run under source dir, there are
many places like "progname = pjoin(basename, 'example', 'ioctl')"
in the testcases, which will try to find compiled program. As
our S != B, and the don't run test under source dir. Test will fail
with following errors:
No such file or directory: '/usr/lib64/fuse3/ptest/test/../example/printcap'

Fix by install needed programs for the test

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-support/fuse/fuse3_3.11.0.bb      | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.11.0.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.11.0.bb
index 0b9164fd79..8055fb06d3 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.11.0.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.11.0.bb
@@ -35,7 +35,28 @@ RDEPENDS:${PN}-ptest += " \
 
 do_install_ptest() {
         install -d ${D}${PTEST_PATH}/test
+        install -d ${D}${PTEST_PATH}/example
+        install -d ${D}${PTEST_PATH}/util
         cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+
+        example_excutables=`find ${B}/example -type f -executable`
+        util_excutables=`find ${B}/util -type f -executable`
+        test_excutables=`find ${B}/test -type f -executable`
+
+        for e in $example_excutables
+        do
+            cp -rf $e  ${D}${PTEST_PATH}/example/
+         done
+
+        for e in $util_excutables
+        do
+            cp -rf $e  ${D}${PTEST_PATH}/util/
+        done
+
+        for e in $test_excutables
+        do
+            cp -rf $e  ${D}${PTEST_PATH}/test
+        done
 }
 
 DEPENDS = "udev"
@@ -49,10 +70,6 @@ RRECOMMENDS:${PN}:class-target = "kernel-module-fuse fuse3-utils"
 FILES:${PN} += "${libdir}/libfuse3.so.*"
 FILES:${PN}-dev += "${libdir}/libfuse3*.la"
 
-EXTRA_OEMESON += " \
-     -Dexamples=false \
-"
-
 # Forbid auto-renaming to libfuse3-utils
 FILES:fuse3-utils = "${bindir} ${base_sbindir}"
 DEBIAN_NOAUTONAME:fuse3-utils = "1"
-- 
2.25.1


