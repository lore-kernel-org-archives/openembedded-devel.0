Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02285C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 17:25:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.644.1720113951445366950
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jul 2024 10:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=79154f57d5=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464H0VVu029618;
	Thu, 4 Jul 2024 17:25:50 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jrsgq63-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 04 Jul 2024 17:25:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 4 Jul 2024 10:25:47 -0700
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 4 Jul 2024 10:25:46 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <akuster808@gmail.com>, <peng.zhang1.cn@windriver.com>
Subject: [meta-python][scarthgap][PATCH v2] python3-pyyaml-include: support native and nativesdk build
Date: Thu, 4 Jul 2024 13:25:45 -0400
Message-ID: <20240704172545.2300157-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: z_vgYnFY-mFgUTNWmR4QIyLGwfcvYbJV
X-Proofpoint-ORIG-GUID: z_vgYnFY-mFgUTNWmR4QIyLGwfcvYbJV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_13,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2407040126
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jul 2024 17:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111256

From: Randy MacLeod <Randy.MacLeod@windriver.com>

backport from master:
   56e2e5df9 python3-pyyaml-include: support native and nativesdk build

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pyyaml-include_1.3.2.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
index 3a5bd99a7..309d0ac59 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
@@ -26,4 +26,4 @@ RDEPENDS:${PN}-ptest += " \
     python3-pytest \
     python3-unittest-automake-output \
 "
-
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


