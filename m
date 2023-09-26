Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8A8E81811
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 02:22:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10200.1695694959116217500
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 19:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kJlziYvq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=763376595a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38Q2Diik028064
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 02:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=uQAlU
	/1KDrONUC/XqRXoXUnAawS2bdOjBvGLaaAQ284=; b=kJlziYvqw6Qg5JWEJA/G1
	NFtAi04FrO3SsHqZvzTo+sIL/dClIKb3A7KeF6v6fVVe5vHbr66iraMPrVxqjpZ8
	CEIg6lnHHCX1gEq3JkcQuQBeo6du2QDUE085vIaxdjpsHQLHev0BJgZuaFooECL/
	XUe35KUBRv4m9O4CraBexRNTq4pkEAs0WqqmNEn58OZ1Gg25KYCF+zoAjdb5G15h
	RkL3ifl+WSeYPLUtL+ZYITImqKalFzgdWnK7Cy5ptCBtvlxLMV7aO5iIA0XSZ0/e
	iAGx2rYGZl0MBYC6kO2uGW2bDwvtQ7yiG7sKA7ZJbdmnx6Mw48EhPxz7E4tQXG1X
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9q06a9j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 02:22:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 19:22:34 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 19:22:33 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [mickledore][meta-networking][PATCH] dhcp-relay: dev subpackage conflicts with bind-dev
Date: Tue, 26 Sep 2023 10:22:35 +0800
Message-ID: <20230926022235.395110-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ZPf0RD5nCbeMefB-pJA33AK_AwQsYfs3
X-Proofpoint-ORIG-GUID: ZPf0RD5nCbeMefB-pJA33AK_AwQsYfs3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_01,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=565 mlxscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309260019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 02:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105137

From: Zhang Xiao <xiao.zhang@windriver.com>

dhcp-relay contains a bundled bind thus their development packages
conflict each other.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(cherry picked from master commit 93892e8413da230e14c70d20f0d46b513fdd8787)
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb            | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
index 2fd86bc28a..d36646c0d7 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
@@ -60,3 +60,6 @@ do_install:append () {
 }
 
 PARALLEL_MAKE = ""
+
+# dhcp-relay contains a bundled "bind", thus their dev packages conflict each other
+RCONFLICTS:${PN}-dev = "bind-dev"
-- 
2.25.1


