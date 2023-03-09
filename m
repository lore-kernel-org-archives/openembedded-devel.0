Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9AFC6FD1F
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 08:40:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8634.1678351211436944290
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 00:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Lbk/qtBi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2432b52167=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3296kKYI027980
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Mar 2023 08:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=jK2czHo1YVL2HfhDcwpIS+rafZEGrRW6YP26617Zlx4=;
 b=Lbk/qtBihzHpD5L6m4B4IJWo9LD5xSYz8UFrYUTFD5kC5VdbaGtxaensQDz33C8Q1l3j
 3LRV+TGRxvVXuV17KLSeRycQfTzCTxv4eZOYN6KQfpeDLDp+WeVKNAAksA0iqXdigX7o
 VNQR6lZyxygBbwy1L7Bjisl81VbKyktru69JQPhMboLPamKu79lHbIT6c4uwK2FVg58B
 9q8+9R34e9knPdY0fu8/ufkwyJRHLd9nmB9udqFDpQMEolgqWnW/hDl/AoLjyeBgP2a2
 Zi1SGx1rRGKWvZnaVzheNxu0olDX1wlGqqEmtO1aPa4i3B9oqM5JZiIydyM8g0Pa9DMn 5w== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p76amr7mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 08:40:10 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Thu, 9 Mar 2023 00:40:09 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 9 Mar 2023 00:40:08 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] rabbitmq-c: upgrade 0.11.0 -> 0.13.0
Date: Thu, 9 Mar 2023 16:40:07 +0800
Message-ID: <20230309084007.1182344-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ba_Iyz_rcbKeZzLEYgtNc5MwjYMNpQ39
X-Proofpoint-ORIG-GUID: ba_Iyz_rcbKeZzLEYgtNc5MwjYMNpQ39
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_04,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=872 clxscore=1015 lowpriorityscore=0 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 08:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101440

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{rabbitmq-c_0.11.0.bb => rabbitmq-c_0.13.0.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.11.0.bb => rabbitmq-c_0.13.0.bb} (76%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.13.0.bb
similarity index 76%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.13.0.bb
index 304171c88..f9c2b2c8a 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.13.0.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "A C-language AMQP client library for use with v2.0+ of the RabbitMQ broker"
 HOMEPAGE = "https://github.com/alanxz/rabbitmq-c"
-LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=6b7424f9db80cfb11fdd5c980b583f53"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7e12f6e40e662e039e2f02b4893011ec"
 LICENSE = "MIT"
 
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https"
-# v0.11.0-master
-SRCREV = "a64c08c68aff34d49a2ac152f04988cd921084f9"
+# v0.13.0-master
+SRCREV = "974d71adceae6d742ae20a4c880d99c131f1460a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


