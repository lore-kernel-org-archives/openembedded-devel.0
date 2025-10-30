Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C73BCCF9EA
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 05:15:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20581.1761801309191260047
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 22:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bLrHpzg0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=339869172a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U4o2Tv097681
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 05:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=K2qVrlORnomjBhScsAJ5Fkz72VyhVeI3fSOxThugl/Q=; b=bLrHpzg0laIK
	3lvq/eefDGz4uIrtpO9quoQgyniIArioY6aqVGI1DprKb7mSRXIdys62AW+RoDKo
	v1+Nk6PdKuwRUQtFkcH9mOB4H8Nmx578waxCXq+id1ZQR+CxX27qVfA6fi3/1dF4
	Dk6lwipGT61tQ0oY5OS7uHHRgCwrnc9tPE/BYR/9cjS3gVfdraUL8WqLDQqLyd0x
	Iq8tP8LhYejr/sKU0U7rIxiEe7glNQ8grGyVQngXr828OAgiQ/BXykapevOQow4p
	UudUHMuR8FETQreu1KQV/QMZESWZMQPV8rt56bSk2PgaDuDEApxCqJrnn4WbP6Cf
	8lKGiUhRVA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3w7hg5t7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 05:15:08 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 29 Oct 2025 22:15:07 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 29 Oct 2025 22:15:07 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 2/2] python3-aiohttp: apply compile option -flax-vector-conversions for gcc
Date: Thu, 30 Oct 2025 13:15:05 +0800
Message-ID: <20251030051505.1693030-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030051505.1693030-1-hongxu.jia@windriver.com>
References: <20251030051505.1693030-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA0MCBTYWx0ZWRfX3Inqw7LFy3ee
 UG7i73VSpA/Dxs6LtQr4taa1JJhBhtL5gFGc/jUPgCHbxrTvWt0x4+p5+h6qAanZ4Z1xawZuIMT
 7/ye7D1tgsvKge98zxBba+DZGvZccD04oWJHB4S3n10ZoU8jawnymtc72JsOoNkPJErED2Y58kN
 8zcOifWFU+s+nwD8HhzWf0vI2v5OYLedzOhmi93WmNCb2t9j4MSh3CkxHudTMTHi5Fk3uN9Aq8f
 VjmU8zqyKGX23kY9wunXVrlFwAF/P8AbhTSlekDHG9eW9W2PkXisZKlmZTCmhTwbzmB4PgDRQXL
 GgnFVDA9q0ukb/btjBLlav83+7DM6Yyowyj03bIaZkF4GYV5I5HzzgcAdk5XNw7CW2dr2XeCCPz
 q5HMk27yGsbARnQcAgI+/dII0/yvQQ==
X-Proofpoint-ORIG-GUID: PMgwMRiiDXIDN9OdErujH5JqgIvwJhSI
X-Authority-Analysis: v=2.4 cv=UatciaSN c=1 sm=1 tr=0 ts=6902f45c cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=vqFYvhl4Ty9kz2qvG1cA:9 a=zZCYzV9kfG8A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: PMgwMRiiDXIDN9OdErujH5JqgIvwJhSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300040
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 05:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121189

The clang does not need option -flax-vector-conversions to
avoid build failure for 32bit arm target

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
index 6ca05d0596..b6344d4c68 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
@@ -22,4 +22,4 @@ RDEPENDS:${PN} = "\
     python3-aiodns \
 "
 
-CFLAGS:append:arm = " -flax-vector-conversions"
+CFLAGS:append:toolchain-gcc:arm = " -flax-vector-conversions"
-- 
2.34.1


