Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F25C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 07:57:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.8359.1660291015326280678
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 00:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MY7xi+q4;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5223643dcc=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27C7cvh5018044
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 00:56:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=VvD+aj/xnyrvEybL+/AZ7UY7PMlk5TOlb7VjJCPZh2M=;
 b=MY7xi+q4MLZuq8fqhrqIVTv6XG1h857pZ/YAITFbokvubyFGVf4dAWi89Kvadl5eW4QF
 7GVdK67pT4weOOOJxewJR0lu8mMscs49VIEeJqi6RZh+HghYLDIr7eNV0sZrQ3x9q4aj
 GZwUAJu3JqPVKvUe0zLCVqGqgxSw4y4q6UbAmtMXKvdAyd2eGAN5Zh5e5umK/II9zP2I
 xvuWaB5boDQ3gngpSnincopWjxC3qjlX6fuTkKaU/07famse+HmOxt3e/vTOdyVXpiG1
 aa3NkfZ9ssqITYzaebaUVGO7KkMiPjYz3X9/6Ssl5Jm8hwwrX5iauOJZZ/oXdpUEjgn7 oQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hvqhs92wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 00:56:54 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 12 Aug 2022 00:56:54 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 12 Aug 2022 00:56:54 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 12 Aug 2022 00:56:53 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-filesystems][PATCH] fuse3: support ptest
Date: Fri, 12 Aug 2022 15:56:52 +0800
Message-ID: <20220812075652.1347872-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: C4S66oCvclVXb1AhW7njvsxvp3QEPcdv
X-Proofpoint-ORIG-GUID: C4S66oCvclVXb1AhW7njvsxvp3QEPcdv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=970
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Aug 2022 07:57:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98208

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
 .../recipes-support/fuse/fuse3_3.10.5.bb      | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
index 0b9164fd79..8055fb06d3 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
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


