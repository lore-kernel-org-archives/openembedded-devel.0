Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00348C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 05:43:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.44165.1671515030720216108
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 21:43:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=E5neWaVl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93534972cd=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BK5cdE8005146
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 21:43:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=UHexdE0fq7U+5YoitM2XLvXIe9iDb/DZvlRtWz1O0AY=;
 b=E5neWaVltevKH95rXsFaePRYZjMRPqx+x0vGSXC/Zxt01wmInsHvouyhJV3YqRN7wekT
 b3TWcmK3RMafFThQh/KBswYpGa7KYp79gWdGB1Lq1+oRhbT6/aJxVgSxLyANhwp94Mxp
 Y/FClBP6f2QqvbTfGpxKzZNaEBHTpagUt/1Dw0OqmVY/+MokKrYKmSmndYhfub/3qJJW
 nlDWkCEkFp4cuhJhQUW+A7wU7aMMCYCUXOcSLGgA3noP9UdQl18wipoqzgFhMutmfErJ
 Ms3xl/iRb4RFOGELqoBC4XVKB42n4rb0davdunDgZP5HSqybsW4XYmMTvpZJGQU4CuPc CA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mhe5q9rsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 21:43:50 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 19 Dec 2022 21:43:40 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 19 Dec 2022 21:43:39 -0800
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Archana Polampalli <archana.polampalli@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] Nodejs: Fixed python3 DeprecationWarning
Date: Tue, 20 Dec 2022 05:43:23 +0000
Message-ID: <20221220054323.509951-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xeUNP7egqat7ZGRSbDMbC1UvuGlr9ij-
X-Proofpoint-GUID: xeUNP7egqat7ZGRSbDMbC1UvuGlr9ij-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_05,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=884 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212200047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 05:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100120

Distutils package and pipes are deprecated and slated for removal in Python 3.13 for Nodejs 16.18
Replaced distutils with setuptools

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...odejs-Fixed-pipes-DeprecationWarning.patch | 35 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.18.1.bb |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Nodejs-Fixed-pipes-DeprecationWarning.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Nodejs-Fixed-pipes-DeprecationWarning.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Nodejs-Fixed-pipes-DeprecationWarning.patch
new file mode 100644
index 000000000..1f54d444d
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Nodejs-Fixed-pipes-DeprecationWarning.patch
@@ -0,0 +1,35 @@
+From 70a008c59992b0ac6a868530bc3e249b7777ab95 Mon Sep 17 00:00:00 2001
+From: Archana Polampalli <archana.polampalli@windriver.com>
+Date: Fri, 16 Dec 2022 05:19:06 +0000
+Subject: [PATCH] Nodejs: Fixed pipes DeprecationWarning
+
+DeprecationWarning: 'pipes' is deprecated and slated for removal in Python 3.13
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ configure.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.py b/configure.py
+index d3192ca04c..8d279220fd 100755
+--- a/configure.py
++++ b/configure.py
+@@ -5,7 +5,6 @@ import sys
+ import errno
+ import argparse
+ import os
+-import pipes
+ import pprint
+ import re
+ import shlex
+@@ -2041,7 +2040,7 @@ write('config.gypi', do_not_edit +
+       pprint.pformat(output, indent=2, width=1024) + '\n')
+
+ write('config.status', '#!/bin/sh\nset -x\nexec ./configure ' +
+-      ' '.join([pipes.quote(arg) for arg in original_argv]) + '\n')
++      ' '.join([shlex.quote(arg) for arg in original_argv]) + '\n')
+ os.chmod('config.status', 0o775)
+
+
+--
+2.34.1
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
index a67948320..e755d0c9a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
@@ -7,7 +7,7 @@ DEPENDS = "openssl"
 DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
 
-inherit pkgconfig python3native qemu
+inherit pkgconfig python3native qemu setuptools3
 
 COMPATIBLE_MACHINE:armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE:armv5 = "(!.*armv5).*"
@@ -25,6 +25,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
            file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
+           file://0001-Nodejs-Fixed-pipes-DeprecationWarning.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.25.1


