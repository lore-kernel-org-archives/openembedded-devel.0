Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7083ECD6E68
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 05:18:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3276.1780542181064879015
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 20:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QuqCeoda;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06156ed005=haiqing.bai@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540xnn21370861
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Jun 2026 02:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SGvheZtBeFv+v4rWAAXp
	SKKdvQDMBdvGZ9r1bvRjOTs=; b=QuqCeodaxuGGUuCiRjjxeCUWyONLelTEpFdY
	AOzxox6+bw3f2hu/WrWPypbNyBVGsRCYiTijl8RdK0noZQ18xNgmShFTVthUok7P
	jiy4dK2jcIeyH/lHsPP3JdtQYlTd9U9RNxrkifr2yiG73NihO6hK9ipFEi7lTPqE
	4octEgTXDzkhlfUBC7dPBmhvS31OgRskp7zbhG2o7gtojquqLkDMMdlmt5Jvf9Qn
	WrXP2pj6/q6J04/q2zAIoEgu8ghhf8MNhQBr6zunrYD/KiSEVyxQA2ziWw7Zz8bO
	aV63quByWJ22eSONIhpJblnCl1yU35RY+sqaHYAnRPZEuelyMg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efn407yjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 02:41:51 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Jun 2026 19:41:49 -0700
Received: from ala-lpd-susbld.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Jun 2026 19:41:49 -0700
From: <haiqing.bai@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <haiqing.bai@windriver.com>
Subject: [meta-openembedded][PATCH] python3-pyelftools: upgrade 0.32 -> 0.33
Date: Thu, 4 Jun 2026 02:41:49 +0000
Message-ID: <20260604024149.1798484-1-haiqing.bai@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: -ylvf4dz09KOzjvsQEWpzFo2TYeJKHqq
X-Proofpoint-GUID: -ylvf4dz09KOzjvsQEWpzFo2TYeJKHqq
X-Authority-Analysis: v=2.4 cv=GI441ONK c=1 sm=1 tr=0 ts=6a20e5ef cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=Sig2_LplLtoQ1QJjY5YA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAyNCBTYWx0ZWRfX8lx9jDtQl+al
 IrshJifw0TUc4p2vrwlyJhsyH3qf8WetDo22gUDxoeNHmidgITCoWXZibj93pOQEywfiyyMHbjs
 /xbJPYn0hfP1xM221DXQwY29dLBAiycyH7TyzPWzZCN/uqGCj1ej0R+FcQWLHK4bMKA50QUoanz
 JCi91SD5M3eYlLqOxGdkOF3Eh8ODVaMzKHKqycx9q50by6d0axfl+hCpyB1MDcfHwge/CddX6VD
 xuNc1TE+c3Mv5pMqJvi8mWhTZLNQnGXD+OlRfxtyCdZafHlp7fvg1AAQkFo/fJvf0qMG0E/6XJ0
 djMUo1+yI8GbjZgR96mXqlH6Veq7QNOc+BJVkkkI4GOjgDBNx23Ctx7vXivlyHQjSKUYDK5jgYR
 0VQWedbj5lTDVYJITxCmZDDAw4p2aW9MLzw0wmocn0gxNr3s5Me9SZAoP8kPHIFli07AVwgDhxz
 IDiCx1bs6NDoLgfPYDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040024
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 05:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127394

From: Haiqing Bai <haiqing.bai@windriver.com>

Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>
---
 .../{python3-pyelftools_0.32.bb => python3-pyelftools_0.33.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyelftools_0.32.bb => python3-pyelftools_0.33.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb b/meta/recipes-devtools/python/python3-pyelftools_0.33.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pyelftools_0.32.bb
rename to meta/recipes-devtools/python/python3-pyelftools_0.33.bb
index 447c8ad6af..5de2812813 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.33.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
-SRC_URI[sha256sum] = "6de90ee7b8263e740c8715a925382d4099b354f29ac48ea40d840cf7aa14ace5"
+SRC_URI[sha256sum] = "660d82dcbeb8e83d1702bd97f223f761625da06111c0cc988eac6b8ab0c1b61f"
 
 PYPI_PACKAGE = "pyelftools"
 
-- 
2.53.0


