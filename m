Return-Path: <xiao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839EEC7EE39
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 06:38:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2828.1684910323453659555
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 23:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YOTCm49P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4508a17f3f=xiao.zhang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34O5vowR015782
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 23:38:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=yZfAyRwP5116Kyr5NS5tIS3wLBrMUuwnoq67wm9D+nc=;
 b=YOTCm49PuM4yvea1pWuu9p0WRiro/yFhjMMX9pC/JtDtGUUlNZ9PjJ0XhrVin+0DfNXM
 Jn8pxnKn269IsS7IOZI8GGa6L/KLOMaDuEdW6E1vuXO7duflef3LZ48SDbwQnaCHQLAz
 GAxH7wER8s766yqZWVCQyrsgRKfoSws+fnnYPcXVQ7V7DLupZEWyWzpuhyL6YvdqV44G
 +kblW1au49NjQ9qK2nB+mpPuCBzjrekifps9bwDMtKWEutGohqQ/Vwb2UpoUwaEuxVM4
 4Wf5jkWXkfpU8xd7GZSqKYSjeP10+axcM5CU5B9a+bL6wJvTv0QDTwQrxKwS75xijnaK 1w== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpwqhbcu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 23:38:42 -0700
Received: from ala-lpggp5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 23:38:42 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Yi.Zhao@windriver.com>
Subject: [PATCH] dhcp-relay: dev subpackage conflicts with bind-dev
Date: Tue, 23 May 2023 23:38:36 -0700
Message-ID: <20230524063836.4147882-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: JSZlzFaF8PGhFRqD_SEcvKjzQjNbPmND
X-Proofpoint-ORIG-GUID: JSZlzFaF8PGhFRqD_SEcvKjzQjNbPmND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_02,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=608
 lowpriorityscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305240056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 06:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102753

dhcp-relay contains a bundled bind thus their development packages
conflict each other.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 .../recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb            | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
index 2fd86bc28..d36646c0d 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
@@ -60,3 +60,6 @@ do_install:append () {
 }
 
 PARALLEL_MAKE = ""
+
+# dhcp-relay contains a bundled "bind", thus their dev packages conflict each other
+RCONFLICTS:${PN}-dev = "bind-dev"
-- 
2.39.1


