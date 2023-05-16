Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F7FC7EE22
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 02:31:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11785.1684204273079183766
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 19:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=45003921a1=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34G1MJLa003659
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 19:31:12 -0700
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qj5u2tad0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 19:31:12 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 19:30:56 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 19:30:56 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] minicoredumper: correct the sysvinit service file attribute
Date: Tue, 16 May 2023 10:30:55 +0800
Message-ID: <20230516023055.3504738-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: uAfKGwjCVkEwN8Jj00UHdiA0lUHaswpl
X-Proofpoint-GUID: uAfKGwjCVkEwN8Jj00UHdiA0lUHaswpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_21,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 impostorscore=0 mlxlogscore=793 spamscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305160020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 02:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102609

From: Mingli Yu <mingli.yu@windriver.com>

Add the execute attribute for sysvinit service file to fix the
below error:
  $ service minicoredumper status
  minicoredumper: unrecognized service

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb
index 2c4111bc3..1e8ce7e69 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb
@@ -37,7 +37,7 @@ do_install:append() {
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 ${WORKDIR}/minicoredumper.service ${D}${systemd_system_unitdir}
     install -d ${D}${sysconfdir}/init.d
-    install -m 0644 ${WORKDIR}/minicoredumper.init ${D}${sysconfdir}/init.d/minicoredumper
+    install -m 0755 ${WORKDIR}/minicoredumper.init ${D}${sysconfdir}/init.d/minicoredumper
 
     # correct path of minicoredumper
     sed -i -e s:/usr/bin/minicoredumper:${sbindir}/minicoredumper:g ${D}${sysconfdir}/init.d/minicoredumper
-- 
2.25.1


