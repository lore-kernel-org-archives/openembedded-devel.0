Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DDAC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 08:43:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8660.1678351397644259784
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 00:43:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=na4Zbkas;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2432b52167=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3297mUEI002619
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Mar 2023 08:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=vFAd2/xA3YmBHkkSmUaTsA0pgnXE1lzXbpMDSN0YR8A=;
 b=na4ZbkasxGJx2+keZ7D/YydkGqXmHsfZpqiKD/M7D8vvFDWRjNDg+qu0ZQD0540f9tDW
 QkzGHm+BQV1oH/QuGvaMLsSxC/bLLeHYDjwEu/OcG6M3GltsJ2p5XcdantN3m/3xWl4X
 3Vm1oj5wWuiK5K5isrT+m/G15BRs1c9MKHv+LztsntFBRr9HCkX9DDDTk43YQkSySlVu
 nG0t1WCTNTD4B3rB29S8bdx5x1Lq1775xIMhipR4OO7EfAqvoeU5E/dVrw+6tOTVcM79
 mNSTZBi9kPTH1sm5QLuOgShUYdvLYjsW7Low2Nc0aaGRpo4YU5sCf6ID+aSR8uDbBkCS gQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fg6hdqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 08:43:16 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Thu, 9 Mar 2023 00:43:15 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 9 Mar 2023 00:43:14 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] sg3-utils: upgrade 1.45 -> 1.47
Date: Thu, 9 Mar 2023 16:43:14 +0800
Message-ID: <20230309084314.1187137-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: r476X-logUCfqmqav6n1XIrJSGGxLRCK
X-Proofpoint-GUID: r476X-logUCfqmqav6n1XIrJSGGxLRCK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_04,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 08:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101443

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../sg3-utils/{sg3-utils_1.45.bb => sg3-utils_1.47.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.45.bb => sg3-utils_1.47.bb} (72%)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
similarity index 72%
rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
index ac12f9561..713c9f27d 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.45.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.47.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://sg.danny.cz/sg/sg3_utils.html"
 SECTION = "console/admin"
 
 LICENSE = "GPL-2.0-or-later & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f90da7fc52172599dbf082d7620f18ca"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f685699d3ac82f108aa880043fa3feb7"
 
 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz \
 "
@@ -14,8 +14,8 @@ MIRRORS += "http://sg.danny.cz/sg/p https://fossies.org/linux/misc"
 
 UPSTREAM_CHECK_REGEX = "sg3_utils-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-SRC_URI[md5sum] = "2e71d7cd925dcc48acb24afaaaac7990"
-SRC_URI[sha256sum] = "0b87c971af52af7cebebcce343eac6bd3d73febb3c72af9ce41a4552f1605a61"
+SRC_URI[md5sum] = "5c6f6315f36ecf3499e49b1b6dbdc034"
+SRC_URI[sha256sum] = "8673c7faca849b6b34764332d2aa91f72db05bff7382bb836d0688795199c3e1"
 
 inherit autotools-brokensep
 
-- 
2.25.1


