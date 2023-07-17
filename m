Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C46EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 14:54:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10382.1689605673501476368
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 07:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JpvadvDY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6562ceb229=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36HCQmaF030208
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 07:54:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=34VCA
	xaOyBpURihCZLVsCr6xi7/OXmvyZGDwW3ngjTw=; b=JpvadvDYQJ1ywsO13YlTI
	3cNVG/CxpavwV33QDy0CB95maPeZLiw7LVzKf0R/7EVeNveyBH1ahNFHJZKJa8u5
	rggMNCWNWkMUZWXmV5ZEiKCa2lk/xY7cvPVRiKjNI098IXKgUovQeIvppfQ+fwgj
	xwajMCK0sAFGAWoCHy5vCNMH0ZLH9o4HCyE3nTupdLHKJhXqjRdz71TDsMwu80+X
	BP5Mqi3o+MYZZLdBcJ3xmBE+OWAzLLZQEI1d0MkJXC5mY1jkFkJdzWgmRsRFCXMk
	LePlaqWL3JRe7jPiJCaAmmZEqcBsMARpdxf0TNj512AdbUjn2XQ91/u+z2FGZdHL
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rutyesg83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 07:54:32 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 07:54:32 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 07:54:32 -0700
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [mickledore][meta-oe][PATCH 1/1] libgpiod: modify RDEPENDS for ptest
Date: Mon, 17 Jul 2023 07:54:32 -0700
Message-ID: <20230717145432.348980-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xeq9jiCVX88UBK_6ehmtoSLjqcsUFTv_
X-Proofpoint-GUID: xeq9jiCVX88UBK_6ehmtoSLjqcsUFTv_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_11,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=679 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307170136
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 14:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103877

From: Joe Slater <joe.slater@windriver.com>

The current use of RDEPENDS to add a dependency on bats results
in the QA warning/error

 lib32-libgpiod package lib32-libgpiod-ptest-dev - suspicious values
  'bats-dev' in RRECOMMENDS [multilib]

when building lib32-libgpiod with ptest not enabled.  We add the
dependency only if ptest is enabled.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9904bd6a24ed9327bd05926ba28f9c2ea49e34dd)
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index abb6544ec2..cf6c0ae0f6 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -38,7 +38,7 @@ FILES:${PN}-ptest += " \
 FILES:libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
 
 RRECOMMENDS:${PN}-ptest += "coreutils"
-RDEPENDS:${PN}-ptest += "bats"
+RDEPENDS:${PN}-ptest += "${@bb.utils.contains('PTEST_ENABLED', '1', 'bats', '', d)}"
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests/
-- 
2.25.1


