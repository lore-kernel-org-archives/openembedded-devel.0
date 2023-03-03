Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFB4C7EE30
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 01:02:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11737.1677805318131422191
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 17:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SEhNwPUh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2426aef11b=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3230vwfn017803
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Mar 2023 17:01:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=OCqGCqo4LLa2q9rbV6pjCDruYtjs2wJEaxih++WgsMI=;
 b=SEhNwPUhIRYtgS9StjLmBXnp8sKjM9K3b+7Z+yClzG7haEs2yXGlt5z0ANSFkU3uut/Y
 y8QfxLTTeiECodkU+uN2lF2wZdg9P8l/+tqDz4JhoykwhGqvblxIJb8YMu97ISV9nmd0
 7xe6vaLaTuwVcqK3gsgGG5V5A72uErU+CaeECp0227HBFfV6M+QmL0MeDqVDkIO5pp8O
 QN23XlTIMxRQKV/iLsJA0Aa2rOvQMKaQLs9t+LqNnogo7AuNpjb6j6wYwH2DYVI7++k/
 yA7wpptPRnPmaW4fc9s5Hpjs9g0/Ck33xESq11zLy//b7FicrgFgjy8L83CyXvuA3jNM Tw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyeg8e029-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 17:01:57 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 2 Mar 2023 17:01:57 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 2 Mar 2023 17:01:56 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH 1/2] redis: upgrade 7.0.7 -> 7.0.9
Date: Fri, 3 Mar 2023 09:01:54 +0800
Message-ID: <20230303010155.3878197-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5REOKf27HP_HKuj4DwhCA10q-g8ORk3j
X-Proofpoint-ORIG-GUID: 5REOKf27HP_HKuj4DwhCA10q-g8ORk3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_16,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0 mlxlogscore=701
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303030006
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 01:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101340

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/redis/{redis_7.0.7.bb => redis_7.0.9.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.7.bb => redis_7.0.9.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0.7.bb b/meta-oe/recipes-extended/redis/redis_7.0.9.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.7.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.9.bb
index 83e617c71..e4b2d45a4 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.7.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.9.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "8d327d7e887d1bb308fc37aaf717a0bf79f58129e3739069aaeeae88955ac586"
+SRC_URI[sha256sum] = "f77135c2a47c9151d4028bfea3b34470ab4d324d1484f79a84c6f32a3cfb9f65"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


