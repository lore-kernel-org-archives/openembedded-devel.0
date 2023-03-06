Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CBDC6FA9E
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 01:41:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23620.1678066872170574914
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Mar 2023 17:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EAPFEq02;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=242994acc1=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3261e95u005144
	for <openembedded-devel@lists.openembedded.org>; Sun, 5 Mar 2023 17:41:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=wYXoNGWeTkK183rgtgfMqjvZpkIsQQ76KLfGFdXviDU=;
 b=EAPFEq02EY3NQ0ex5hu/GqO7V0xi5Xanuz/DNis5npO+L1bfcBAAYNjU4dWd97LiHJ7X
 AV6SNSkmrmU1s4J2HvVo5PZ8kWDBuxh+GeSc6OTatuTxz+DtZXksWh/0d3mq5D/LZCIf
 EINFr5kIbQWMk4KANEggcReMnuUc+H4h5ugBvcM2cnt97EGG+iUL+sKhnTRr/+dHoQQl
 jZhA+04lBVAEBdHSC4BZ7oXj0qh9UeTutItZpe+hg6L8PFBiwrDZzOeLoBBF2Zef4t8q
 Mqaq9NZ/X/qs9cdBtIz0p5f52bKrNV9D788BZ0CLfVqHoExpiEEsndMQVfDVaH4QJYmI Cg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p4258sb0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 05 Mar 2023 17:41:11 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Sun, 5 Mar 2023 17:41:11 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sun, 5 Mar 2023 17:41:10 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH V2] redis: upgrade 6.2.8 -> 6.2.11
Date: Mon, 6 Mar 2023 09:41:09 +0800
Message-ID: <20230306014109.2841856-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1748C30CB906DE70.26202@lists.openembedded.org>
References: <1748C30CB906DE70.26202@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: I87paIB_ihW9Us42BJvvJARzYnhoGRfh
X-Proofpoint-ORIG-GUID: I87paIB_ihW9Us42BJvvJARzYnhoGRfh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-05_12,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=669 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303060012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 01:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101390

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/redis/{redis_6.2.8.bb => redis_6.2.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.8.bb => redis_6.2.11.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.8.bb b/meta-oe/recipes-extended/redis/redis_6.2.11.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.8.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.11.bb
index 02ee19fb7..5a410bf4c 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.11.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "f91ab24bcb42673cb853292eb5d43c2017d11d659854808ed6a529c97297fdfe"
+SRC_URI[sha256sum] = "8c75fb9cdd01849e92c23f30cb7fe205ea0032a38d11d46af191014e9acc3098"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


