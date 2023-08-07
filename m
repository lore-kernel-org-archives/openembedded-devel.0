Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFDAC41513
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 06:52:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.28902.1691391169374096458
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Aug 2023 23:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XwyVX+oO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7583208e38=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3775rO4P020516
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Aug 2023 06:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=4IfwWPdmJStoL/llfNI1mF+mNeMuOm5tcY9dtCji15I=; b=
	XwyVX+oO1P447lxyv8XxlLhkZGTcErh4GrTNP9q9ZTBFfYuGBA3Q+X49/RaV/tu9
	ZZD16zOKKBu0LQu61AzW6ncDWNiTQ0ca8vwK0VeC3GxRNaF2+vwvhrL8slF1yqDm
	p4FX2ldXZkUCjmbz+SHl0NXJshyjrMydzCntur3iwT7klG/0tHFqoNNYj0gOiQLr
	BiGzIDQN0fdrPbF5BNybqi90seWQmD7TESDV8ivPLvO7jZLKFsyHHgkfP6tholgf
	R5GArAOmIYgErRqRSWJ/zi6Sq75zsZ0Gxo35oS4YNkWIi+TsTWbImwetD62z1/mv
	GpJhkVeEevW8N/hFg9i8ug==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9dd61byp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 06:52:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 6 Aug 2023 23:52:46 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Sun, 6 Aug 2023 23:52:46 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [mickledore][meta-oe][PATCH 2/2] redis: upgrade 6.2.12 -> 6.2.13
Date: Mon, 7 Aug 2023 14:52:44 +0800
Message-ID: <20230807065244.2825586-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230807065244.2825586-1-changqing.li@windriver.com>
References: <20230807065244.2825586-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PUdVq1byfGHLz8HlwP5nxaU3eJ4cSAn5
X-Proofpoint-ORIG-GUID: PUdVq1byfGHLz8HlwP5nxaU3eJ4cSAn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_05,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=795 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308070062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 06:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104299

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://github.com/redis/redis/releases/tag/6.2.13

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/redis/{redis_6.2.12.bb => redis_6.2.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.12.bb => redis_6.2.13.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.12.bb b/meta-oe/recipes-extended/redis/redis_6.2.13.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.12.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.13.bb
index 3ed6867816..640831c525 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.13.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "75352eef41e97e84bfa94292cbac79e5add5345fc79787df5cbdff703353fb1b"
+SRC_URI[sha256sum] = "89ff27c80d420456a721ccfb3beb7cc628d883c53059803513749e13214a23d1"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


