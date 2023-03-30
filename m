Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03C1C74A5B
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 06:05:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18493.1680156317719860655
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 23:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34538e5162=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32U5bvMp000473
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 23:05:17 -0700
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phv85wppn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 23:05:17 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Wed, 29 Mar 2023 23:05:16 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Wed, 29 Mar 2023 23:05:16 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mcelog: improve the ptest output
Date: Thu, 30 Mar 2023 14:05:15 +0800
Message-ID: <20230330060515.3968306-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9F9JjZ3L9XH1rlDmDps2K2Roti_TEC7g
X-Proofpoint-ORIG-GUID: 9F9JjZ3L9XH1rlDmDps2K2Roti_TEC7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_02,2023-03-30_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=882 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303300047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 06:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101829

From: Mingli Yu <mingli.yu@windriver.com>

Before:
 # ./run-ptest
 [snip]
 code 0xd2d: [PASS]

 After:
 # ./run-ptest
  [snip]
  PASS: code 0xd2d

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/mcelog/mcelog/run-ptest | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mcelog/mcelog/run-ptest b/meta-oe/recipes-support/mcelog/mcelog/run-ptest
index ba7a2c768..320240f27 100644
--- a/meta-oe/recipes-support/mcelog/mcelog/run-ptest
+++ b/meta-oe/recipes-support/mcelog/mcelog/run-ptest
@@ -1,3 +1,9 @@
 #!/bin/sh
 
-make -C tests test
+make -C tests test | sed -e '/\[PASS\]/ s/^/PASS: /g' \
+                         -e '/\[FAIL\]/ s/^/FAIL: /g' \
+                         -e '/\[IGNORE\]/ s/^/SKIP: /g' \
+                         -e 's/IGNORE:/SKIP:/' \
+                         -e 's/: \[PASS\]//' \
+                         -e 's/: \[FAIL\]//' \
+                         -e 's/: \[IGNORE\]//'
-- 
2.25.1


