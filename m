Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59C3C04A94
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 03:06:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5936.1689735976197688224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 20:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6564ce24fe=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36J1vGiW003434
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jul 2023 03:06:15 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run8ab8w5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jul 2023 03:06:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 20:06:14 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 20:06:14 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][mickledore][PATCH 2/2] gnulib: Update SRC_URI
Date: Wed, 19 Jul 2023 11:06:12 +0800
Message-ID: <20230719030612.1288053-2-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20230719030612.1288053-1-mingli.yu@eng.windriver.com>
References: <20230719030612.1288053-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jX2oYzVZ4_MKydxczzW3Q6Mnni-7vCxF
X-Proofpoint-ORIG-GUID: jX2oYzVZ4_MKydxczzW3Q6Mnni-7vCxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_19,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=735 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307190028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jul 2023 03:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103955

From: Mingli Yu <mingli.yu@windriver.com>

Update the SRC_URI to fix the do_fetch warning.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb b/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
index a27968079..9e09b971c 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
@@ -13,7 +13,7 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=56a22a6e5bcce45e2c8ac184f81412b5"
 SRCREV = "0d6e3307bbdb8df4d56043d5f373eeeffe4cbef3"
 
-SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=master \
+SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=master;protocol=https \
 "
 
 S = "${WORKDIR}/git"
-- 
2.35.5


