Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8A5EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 21:43:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2279.1689198220372854044
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 14:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=O1V5BSna;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6557242ad9=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CKk51s008897
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 14:43:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=6d3M9
	Ypay/bbnAWtIkUk28Rn+SWGYGd2v4bncuVSgwU=; b=O1V5BSnare/2kVFYlrPLU
	P7rq5w6uMigxZX3CrNQTjLRMuQyGR2tmtXmXAbGCTZy5cZSsNpq3H4T8om4qDVOL
	ivmkIC6WVqT8qK2DYvhK1hbu2Uy4TzDT88E3h2s2YO3kNc+alhNZt+TmaVl4KX/o
	oa1mq2t7YW8IHJ0IKh+VVgCbJov+vhlRDDm0gELCb5fcO4QJZLr8NsxtkXAWpF4f
	vSIiwrBA69wY03i2WKX4wn+VMiTuy9Frk7LTv9e1PJNFL0RZfgWePahKIg+T6aJt
	7H4jFdF9LawZV91An8dVtXMWcc2lJxJXBbvR6YPhze9/fG33TNLMIEf5R1SEdEWO
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rq32ykwvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 14:43:39 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 14:43:36 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Wed, 12 Jul 2023 14:43:36 -0700
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] libgpiod: modify RDEPENDS for ptest
Date: Wed, 12 Jul 2023 14:43:36 -0700
Message-ID: <20230712214336.33952-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0cdYi4TKhxd0bZaIpRM3SrjL919xpilu
X-Proofpoint-ORIG-GUID: 0cdYi4TKhxd0bZaIpRM3SrjL919xpilu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_15,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 mlxlogscore=631 priorityscore=1501 mlxscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2307120191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 21:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103847

From: Joe Slater <joe.slater@windriver.com>

The current use of RDEPENDS to add a dependency on bats results
in the QA warning/error

 lib32-libgpiod package lib32-libgpiod-ptest-dev - suspicious values
  'bats-dev' in RRECOMMENDS [multilib]

when building lib32-libgpiod with ptest not enabled.  We add the
dependency only if ptest is enabled.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index a2d1f57a8b..cb19bc5fb8 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -34,7 +34,7 @@ FILES:${PN}-tools += " \
 FILES:libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
 
 RRECOMMENDS:${PN}-ptest += "coreutils"
-RDEPENDS:${PN}-ptest += "bats"
+RDEPENDS:${PN}-ptest += "${@bb.utils.contains('PTEST_ENABLED', '1', 'bats', '', d)}"
 
 do_install:append() {
     rm -f ${D}${bindir}/gpiod-test
-- 
2.25.1


