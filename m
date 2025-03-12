Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C758C35FF3
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 01:00:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.26664.1741741196768393651
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 17:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5166cf4169=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C0w3Xg028772
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 00:59:56 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45au8y09gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 00:59:55 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 11 Mar 2025 17:59:54 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 11 Mar 2025 17:59:54 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/9] tbb: upgrade 2021.13.0 -> 2022.0.0
Date: Wed, 12 Mar 2025 08:59:45 +0800
Message-ID: <20250312005952.1469547-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312005952.1469547-1-changqing.li@windriver.com>
References: <20250312005952.1469547-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ggH3Zpd4gJ7tzZTi7hz1tKQpJzKuMZgS
X-Proofpoint-ORIG-GUID: ggH3Zpd4gJ7tzZTi7hz1tKQpJzKuMZgS
X-Authority-Analysis: v=2.4 cv=ILoCChvG c=1 sm=1 tr=0 ts=67d0dc8b cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=jaZxdeQiGCCnhpEc10cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_07,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2503120005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 01:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115898

From: Changqing Li <changqing.li@windriver.com>

Updated to the latest version
Refer:
https://github.com/uxlfoundation/oneTBB/releases/tag/v2022.0.0

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-support/tbb/{tbb_2021.13.0.bb => tbb_2022.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/tbb/{tbb_2021.13.0.bb => tbb_2022.0.0.bb} (97%)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.13.0.bb b/meta-oe/recipes-support/tbb/tbb_2022.0.0.bb
similarity index 97%
rename from meta-oe/recipes-support/tbb/tbb_2021.13.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2022.0.0.bb
index 4d0f80ca8e..7442843f39 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.13.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2022.0.0.bb
@@ -12,8 +12,8 @@ DEPENDS:append:class-target = " hwloc"
 
 PE = "1"
 
-BRANCH = "onetbb_2021"
-SRCREV = "1c4c93fc5398c4a1acb3492c02db4699f3048dea"
+BRANCH = "onetbb_2022"
+SRCREV = "0c0ff192a2304e114bc9e6557582dfba101360ff"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
           "
 
-- 
2.34.1


