Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C392FEB64DA
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 09:56:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12485.1687946179311788481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jun 2023 02:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=R00zXwoz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5543b5408e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35S7bqjc015274
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 02:56:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=gnC2s
	U5Aqyh7fgOTsuCk6JMbIq3UDHbqMqzuwoGAKv8=; b=R00zXwozR+qtubbr5tq1l
	cQHYF07f7srA7bp8k14tE2gPiv5cva42m2E35fwUhF5PBHGBS3dULW37XI+A5/nC
	Xi6I4VjImelmUxq5Vi5XNKOr/SdrAICZ2IWUdgm467gQX99iO502WhnnDZYcRd4s
	fYTleXlDpOPoxoj7j1aW9gAIAX0K5FNTrkSJaD47pymU2OZ+JS/FiSRqtPtIG3wb
	r37pV5E30s9ctim8vrWok9TyUzNAZbQ6IryI7dlHeGcEC2jcDPJMRDGMXsQe/RFS
	2PLzediPtKD4d0tWNdaeA3vD9igv6fP1TnttgVIYtIQUlg7+BW8KEHFvVNqNgA87
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdurxumc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 02:56:18 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 02:56:05 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] tcpreplay: upgrade 4.4.2 -> 4.4.4
Date: Wed, 28 Jun 2023 09:55:48 +0000
Message-ID: <20230628095548.1062348-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: npte4rXkxm_nT7SMTj0Gva9oWK6IX7mS
X-Proofpoint-GUID: npte4rXkxm_nT7SMTj0Gva9oWK6IX7mS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_06,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306280087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 09:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103626

This release contains bug fixes only.
The following CVEs have been addressed:

CVE-2023-27783
CVE-2023-27784
CVE-2023-27785
CVE-2023-27786
CVE-2023-27787
CVE-2023-27788
CVE-2023-27789

Changelog:
=========
dlt_jnpr_ether_cleanup: check subctx before cleanup by @Marsman1996 in #781
Bug #780 assert tcpedit dlt cleanup by @fklassen in #800
Fix bugs caused by strtok_r by @Marsman1996 in #783
Bug #782 #784 #785 #786 #787 #788 strtok r isuses by @fklassen in #801
Update en10mb.c by @david-guti in #793
PR #793 ip6 unicast flood by @fklassen in #802
Bug #719 fix overflow check for parse_mpls() by @fklassen in #804
PR #793 - update tests for corrected IPv6 MAC by @fklassen in #805
PR #793 - update tests for vlandel by @fklassen in #806
Feature #773 gh actions ci by @fklassen in #807
Feature #759: Upgrade autogen/libopts to 5.18.16 by @fklassen in #760
Bug #751 don't exit after send error by @fklassen in #761
Bug #750: configure: libpcap version robustness by @fklassen in #764
Bug #749 flow stats: avoid overstating flow packet count by @fklassen in #765
Bug #750 more libpcap version updates by @fklassen in #766
Bug #767 tests: support for out-of-tree tests by @fklassen in #768
Bug #750 - fix macOS test failure by @fklassen in #770
4.4.3 by @fklassen in #769 and #771

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../tcpreplay/{tcpreplay_4.4.2.bb => tcpreplay_4.4.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.4.2.bb => tcpreplay_4.4.4.bb} (85%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
similarity index 85%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index 165a0e735..1e2495efd 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
 SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "5b272cd83b67d6288a234ea15f89ecd93b4fadda65eddc44e7b5fcb2f395b615"
+SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 
-- 
2.40.0


