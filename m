Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E9FEB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 07:54:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8049.1689839669960718012
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jul 2023 00:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65658e6de2=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36K6JFOU023972
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jul 2023 07:54:29 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run8acekm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jul 2023 07:54:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 00:54:27 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 00:54:27 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-initramfs][PATCH] dracut: Remove busybox from RRECOMMENDS
Date: Thu, 20 Jul 2023 15:54:26 +0800
Message-ID: <20230720075426.180084-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9mq1Grr_tOPshW_TZxKHiL4tATHK7joH
X-Proofpoint-ORIG-GUID: 9mq1Grr_tOPshW_TZxKHiL4tATHK7joH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_02,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=696 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307200064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jul 2023 07:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103967

From: Mingli Yu <mingli.yu@windriver.com>

The coreutils which defined in RRECOMMENDS has already provide the basic
command and it conflicts with busybox.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-initramfs/recipes-devtools/dracut/dracut_056.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_056.bb b/meta-initramfs/recipes-devtools/dracut/dracut_056.bb
index 364beec5d..989a37a87 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_056.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_056.bb
@@ -65,7 +65,6 @@ RDEPENDS:${PN} = "findutils cpio util-linux-blkid util-linux-getopt util-linux b
 # This could be optimized a bit, but let's avoid non-booting systems :)
 RRECOMMENDS:${PN} = " \
                      kernel-modules \
-                     busybox \
                      coreutils \
                     "
 
-- 
2.35.5


