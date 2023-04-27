Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F422CC77B7F
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 02:11:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11112.1682561491292021817
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Apr 2023 19:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=D3StBNjd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3481b1ee74=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33R2BUGA007075
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 02:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=nP21L+5X5+x1KC4iGv4f5voAJq98AwCeryE/Evjnuns=;
 b=D3StBNjdB/SoJlznHnSwUnGngtX8j9Zln4011Hz2Utyz4WKzS28epPhy8OruWNRD+pIC
 N2jX+9nVRQ9JN+QfdW4yAexTXvURC2ME0jNom/N/7+YSJ53YeYso6Tb5WenWYlsJU3ov
 ja1xIurfQO1942c3Hb9WnqAskLkEd8XEXP5Lomt+2MPZllfgH8BgWQFgzNn7ESTSHKYN
 aq0mpVNwUWay80L4XO9Z5xijzddKIxRZjogff59+eXJDfCrlpXT5akbh3+AJPn98uL6w
 k3nIH0GwczgjS3c7DZygftq1nxm45s5Yh8vqbbXTflX+RJJKz59Cs2E8J1q9Yip2hS7n gA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q44t3w7au-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 02:11:30 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 19:11:29 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 19:11:28 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH 2/2] redis: upgrade 7.0.10 -> 7.0.11
Date: Thu, 27 Apr 2023 10:11:26 +0800
Message-ID: <20230427021126.3398663-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427021126.3398663-1-changqing.li@windriver.com>
References: <20230427021126.3398663-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kW845pm0xtKlieC0-gNrpgNiT4fiq3De
X-Proofpoint-ORIG-GUID: kW845pm0xtKlieC0-gNrpgNiT4fiq3De
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_11,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=529 lowpriorityscore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 02:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102205

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/redis/{redis_7.0.10.bb => redis_7.0.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.10.bb => redis_7.0.11.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0.10.bb b/meta-oe/recipes-extended/redis/redis_7.0.11.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.10.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.11.bb
index 5f972033f..e6bfa227a 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.10.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.11.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "1dee4c6487341cae7bd6432ff7590906522215a061fdef87c7d040a0cb600131"
+SRC_URI[sha256sum] = "ce250d1fba042c613de38a15d40889b78f7cb6d5461a27e35017ba39b07221e3"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


