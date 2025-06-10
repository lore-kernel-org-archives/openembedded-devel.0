Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAE7C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 07:55:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.81582.1749542131724967334
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jun 2025 00:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8256ed4fc1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A4PZ11002709;
	Tue, 10 Jun 2025 07:55:30 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2jqxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 10 Jun 2025 07:55:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 10 Jun 2025 00:55:29 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 10 Jun 2025 00:55:28 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] xmlrpc-c: switch to advanced release
Date: Tue, 10 Jun 2025 15:55:27 +0800
Message-ID: <20250610075527.4191425-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA1OCBTYWx0ZWRfX/phFA9pJf9jD rkiBbT8UOElCTC/OsKirYtxdfW3G/p8VP+Fg7K8gmr7hwYY/7MK+k9vJRodtfbbZE4IIbG0D9eZ oVMAcqOm4xMHNKlSgZcYhWQOVrIcBrHpJuNOeRBwy0OOLWfYFBNT4qq7BIoGRC0IypYaDMHXIgw
 IRzXtAajwdwwo3K6bhThYnXxcq1e3xG01d8mryJ/dCYdNv0qHGor5Yat38BGvq9ycICqaYH11RW b6EaHGmRmklP1tluAg4h8iw6ZHNiQ7E/flBn2nOha/HqPdawp8LVfYLot09ARjgFTq27YBRyoeh j3tUz0NSYAv6ZggthpB3K9w670pYejhYafqtWPY1JXaRm9qD8gXIu6SBVdcduQIDn7K3xdheIHY
 txIloEBoI3PAkMtkXKjw443hjZ9vuPAKFMSl2N08+SIVsGY8x0cOyS+3Tc6wz4xXq7Bmca/q
X-Proofpoint-GUID: d0T8TDA6znfWr6saibhKy8lwyl8E3Ikz
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=6847e4f2 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=ZkvPBPLQAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=UOSdimr6BellZEzb2poA:9 a=SFr2u9Cu4sbnRqnMvguH:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: d0T8TDA6znfWr6saibhKy8lwyl8E3Ikz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506100058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 07:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117862

According to [1], there are 3 Xmlrpc-c releases: Super Stable,
Stable and Advanced, and Advanced is newly updated.

The version in stable sub directory is 1.60.0 which is mismatch
with recipe version

Switch to advanced sub directory, in which the version is 1.64.0

root@intel-x86-64:~# xmlrpc-c-config  --version
1.64.0

[1] https://xmlrpc-c.sourceforge.io/downloading.php

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
index 298c84bb2c..e9442697fa 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
@@ -11,10 +11,9 @@ SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
            file://0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch \
            file://0001-fix-bool-reserved-word-error-in-gcc-15.patch;striplevel=2 \
            "
-# one more commit after Release 1.64.0 in the Stable series
 SRCREV = "8ce36bce2438df9b02fcaafd19efa90a56426601"
 
-S = "${WORKDIR}/git/stable"
+S = "${WORKDIR}/git/advanced"
 
 inherit autotools-brokensep binconfig pkgconfig
 
-- 
2.34.1


