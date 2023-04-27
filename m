Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C6DC77B60
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 02:11:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11130.1682561490845658148
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Apr 2023 19:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jXakWxxV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3481b1ee74=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33R2BUG9007075
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 02:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=B17+6NbdO3tueb1FksYSN3EwR8nKpDfZMxqqEywK2I8=;
 b=jXakWxxVpieFUsyBEGJE1XZAklNGxVs/UOLPdx3NOaeDbdlZJ0aHQ5NgXRcPexYQHOae
 Bok0WpKx2kVi9kYSGByOMs2QOR/vz6cBhPmwiE2hF725PnmuUeRqVfndOv93q613hG0p
 tC3mpac0gihrgUth/3Vk9QOb49IZ0y3YUVl3WS0vhqLYz4p3Ac0Of7eY1LZRDM5fhOJW
 VgbtqsTlNxYMcJoO0Axg2rKd3Vd2/COy2aZz8AsVa5P9KyIb7nKCAh2jF8JabUIyhwAZ
 t+6PAvgSVm1Xn8MhU9rrm8FySmoEPM2+6foGk2sF6mpu73akz1V4TR60LX7w4AM+VCN+ pQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q44t3w7au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 02:11:29 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 19:11:28 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 19:11:27 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH 1/2] redis: upgrade 6.2.11 -> 6.2.12
Date: Thu, 27 Apr 2023 10:11:25 +0800
Message-ID: <20230427021126.3398663-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: aghbLVE6PkzFZ9e_1dJtpxbBN5R4BA4z
X-Proofpoint-ORIG-GUID: aghbLVE6PkzFZ9e_1dJtpxbBN5R4BA4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_11,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=726 lowpriorityscore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 02:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102204

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/redis/{redis_6.2.11.bb => redis_6.2.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.11.bb => redis_6.2.12.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.11.bb b/meta-oe/recipes-extended/redis/redis_6.2.12.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.11.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.12.bb
index 5a410bf4c..3ed686781 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.11.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.12.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "8c75fb9cdd01849e92c23f30cb7fe205ea0032a38d11d46af191014e9acc3098"
+SRC_URI[sha256sum] = "75352eef41e97e84bfa94292cbac79e5add5345fc79787df5cbdff703353fb1b"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


