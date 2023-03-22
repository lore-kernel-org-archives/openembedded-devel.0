Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB3FC6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 08:29:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.37824.1679473765059188896
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 01:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JQPI2Ga8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2445ee82b3=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M7VcXK028164
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 08:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=woMap25PXSZnzBo33mDYUu+blONqYI+6Vr2wsj+bJXs=;
 b=JQPI2Ga8tIRIGUGUzx6sYA7Rmv1VFLFa1GKhbnntlfTdJb/kqMUWgjyEw+5rprs1eKe1
 1lL669BWs15HplFc/bJ2YsEVC2RjI6LxfLvGp4n2aqKJrZVDt2n8LsfC3oTShHWxgoKC
 XGn67pmwkxBvATuBblM6p8qp9ZqNCVBRz4f9oddCkBCWfVJrp7klfvcfR6jpzMQYUmzn
 kxmN3Ji5HX7fjw4nWVq49ncZMAdxH1T1q97A6D4L5XKFDWU2W44F143Yyr9yuMPYEzh5
 DwKwn9a6tghVVobnM3C0z2uX0A5If83+N/Ua977nswZwD8Wpq59HXhmH+m7A7T1IopIE 3A== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqsmra36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 08:29:24 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 22 Mar 2023 01:29:22 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Wed, 22 Mar 2023 01:29:22 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH] redis: upgrade 7.0.9 -> 7.0.10
Date: Wed, 22 Mar 2023 16:29:21 +0800
Message-ID: <20230322082921.2464069-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: MRVK8axCKlp_yze9PRgREQR3ub-MUmUP
X-Proofpoint-GUID: MRVK8axCKlp_yze9PRgREQR3ub-MUmUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxlogscore=522 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303220059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 08:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101631

From: Changqing Li <changqing.li@windriver.com>

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:

(CVE-2023-28425) Specially crafted MSETNX command can lead to assertion and denial-of-service

Bug Fixes
Large blocks of replica client output buffer may lead to PSYNC loops and unnecessary memory usage (#11666)
Fix CLIENT REPLY OFF|SKIP to not silence push notifications (#11875)
Trim excessive memory usage in stream nodes when exceeding stream-node-max-bytes (#11885)
Fix module RM_Call commands failing with OOM when maxmemory is changed to zero (#11319)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/redis/{redis_7.0.9.bb => redis_7.0.10.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.9.bb => redis_7.0.10.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0.9.bb b/meta-oe/recipes-extended/redis/redis_7.0.10.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.9.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.10.bb
index e4b2d45a4..5f972033f 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.9.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.10.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "f77135c2a47c9151d4028bfea3b34470ab4d324d1484f79a84c6f32a3cfb9f65"
+SRC_URI[sha256sum] = "1dee4c6487341cae7bd6432ff7590906522215a061fdef87c7d040a0cb600131"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


