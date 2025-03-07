Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BCDC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 17:07:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16520.1741367251310859794
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 09:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5161eb5657=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5275BFaV017046;
	Fri, 7 Mar 2025 09:07:26 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456csa3k9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 07 Mar 2025 09:07:26 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 7 Mar 2025 09:07:25 -0800
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Fri, 7 Mar 2025 09:07:24 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <akuster808@gmail.com>, <piotr.l.lewicki@hitachienergy.com>
Subject: [meta-oe][kirkstone][PATCH] lapack: upgrade 3.10.0 -> 3.10.1
Date: Fri, 7 Mar 2025 12:07:24 -0500
Message-ID: <20250307170724.1794425-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <AM0PR06MB42602AD86B9D3F0F567027CEABC22@AM0PR06MB4260.eurprd06.prod.outlook.com>
References: <AM0PR06MB42602AD86B9D3F0F567027CEABC22@AM0PR06MB4260.eurprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: p59spB-Ri0hl8E5l47L1J_q24iervXEo
X-Proofpoint-GUID: p59spB-Ri0hl8E5l47L1J_q24iervXEo
X-Authority-Analysis: v=2.4 cv=d4wPyQjE c=1 sm=1 tr=0 ts=67cb27ce cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=ozQi6Qy7AAAA:8 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=LN_l4lcLAAAA:8 a=NEAV23lmAAAA:8
 a=QFtB4FFVfBaHzDooPqsA:9 a=iEZG5NWwHLoA:10 a=5011TGWGUjXZ4oUQxJtK:22 a=V6Cww4xsrPVQPwKtnwcs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_06,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1011
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503070128
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 17:07:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115796

From: wangmy <wangmy@fujitsu.com>

Changelog:
http://netlib.org/lapack/lapack-3.10.1.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Piotr Lewicki <piotr.l.lewicki@hitachienergy.com>
---
 .../lapack/{lapack_3.10.0.bb => lapack_3.10.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/lapack/{lapack_3.10.0.bb => lapack_3.10.1.bb} (86%)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb
similarity index 86%
rename from meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb
rename to meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb
index 87d51d8a4d..15f394e13e 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Linear Algebra PACKage"
 URL = "http://www.netlib.org/lapack"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=39902829ba0c2cbac1b0debfb75a416b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a32c99f24d097c72d1857e533b55642b"
 
 # Recipe needs FORTRAN support (copied from conf/local.conf.sample.extended)
 # Enabling FORTRAN
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=39902829ba0c2cbac1b0debfb75a416b"
 
 DEPENDS = "libgfortran"
 
-SRCREV = "aa631b4b4bd13f6ae2dbab9ae9da209e1e05b0fc"
+SRCREV = "32b062a33352e05771dcc01b981ebe961bf2e42f"
 SRC_URI = "git://github.com/Reference-LAPACK/lapack.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.34.1


