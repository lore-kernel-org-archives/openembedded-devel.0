Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C865C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 08:39:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8628.1678351186540987345
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 00:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Uz7ndM8K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2432b52167=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3298ASQ2022413
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Mar 2023 08:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=SFDEvGG4h/QwMv+InGpSBLRlkmsLjMV6lbl9wIGLVzs=;
 b=Uz7ndM8KZToyA2aAsmN2zkBwlkITwCkxuF48SsFu1EqJHCs1c5gFUbYV5WY0W/mMhXb/
 R+1Sabd7ZySmnlDLiNfL/l6EY3qpkGuQoLV/fXOjed5p5XqH+hX9yslXtavOmRp731+z
 Me4515puC3/2qSQXwExCPxrwRh/lB5vHImWe11mPrQk5MR7MLbTvKrGnpRJTUPNDSgqO
 SErB20LTFKn40krOwMLiINvz/235mt0xGD6AvL/PnrtEL/sYk0KWcOs8y3bG3phL36h0
 +GQHUhzLub/XZova+7vi39EnojI98j1ZZAMgrxtbUi79U3Wak8MEjfDaFoLGjh7YgWI8 HA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p76amr7m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 08:39:45 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Thu, 9 Mar 2023 00:39:44 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 9 Mar 2023 00:39:43 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] redis: upgrade 7.0.8 -> 7.0.9
Date: Thu, 9 Mar 2023 16:39:41 +0800
Message-ID: <20230309083942.1182203-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: gM5PvzgkJldj6emH8immGYv1LhQq2Dch
X-Proofpoint-ORIG-GUID: gM5PvzgkJldj6emH8immGYv1LhQq2Dch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_04,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=618 clxscore=1015 lowpriorityscore=0 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 08:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101438

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/redis/{redis_7.0.8.bb => redis_7.0.9.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.8.bb => redis_7.0.9.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0.8.bb b/meta-oe/recipes-extended/redis/redis_7.0.9.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.8.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.9.bb
index fe1db9f98..423bc2199 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.9.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "06a339e491306783dcf55b97f15a5dbcbdc01ccbde6dc23027c475cab735e914"
+SRC_URI[sha256sum] = "f77135c2a47c9151d4028bfea3b34470ab4d324d1484f79a84c6f32a3cfb9f65"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


