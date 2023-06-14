Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7C7EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 22:06:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4774.1686780360414060277
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jun 2023 15:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=APhnXfCl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5529f8cb46=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35EM5oBj030722;
	Wed, 14 Jun 2023 22:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=MOwgb38s35wt+KTdEjwwCA4DOj0C7SfVWaUvRlLmANs=;
 b=APhnXfCl/ICR/rqVww7TGj4+aOxDp9Xhhrhi75mnyp564AZ0hLA6IrapvNHQTGKFW4mr
 6+B3YB1CzJ30pavY8DF797/RZ9Bj1XLz5Q7+Y1y6rjKOE3+spx8YIb9aVikdMP94juR+
 1hncIHie18PD6/fA/g+dfK65cftWG4dvjO+pLzcuTIdeEQtZ2GkDcjsW/RCsBE0V17MZ
 ubNymmcVgv7TmfJdFfDqriOeAN3C07kD/dx6txREnJ/MypYnC63EhgB1Swp1VmxTuXV8
 tRgulZrG1KYod/qWatn2ocItw9ZZAcqhh76U+XWvv7mPs+cI04H7+x0HoYHtKUp9dn66 yQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4ed04cte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 14 Jun 2023 22:05:59 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 15:05:57 -0700
Received: from vme.wrs.com (172.25.44.4) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Wed, 14 Jun 2023 15:05:57 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [kirkstone][PATCH] lapack: add packageconfig for lapacke
Date: Wed, 14 Jun 2023 18:05:56 -0400
Message-ID: <20230614220556.606007-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OIU8TXVQ-Ah3CjcU9Ld8z1MuLPulG__u
X-Proofpoint-ORIG-GUID: OIU8TXVQ-Ah3CjcU9Ld8z1MuLPulG__u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_14,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=940
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 22:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103289

From: Adrian Zaharia <Adrian.Zaharia@windriver.com>

backport of commit:
   d799db35d lapack: add packageconfig for lapacke

Signed-off-by: Adrian Zaharia <Adrian.Zaharia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb
index c82761ac3..87d51d8a4 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb
@@ -17,6 +17,9 @@ SRCREV = "aa631b4b4bd13f6ae2dbab9ae9da209e1e05b0fc"
 SRC_URI = "git://github.com/Reference-LAPACK/lapack.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[lapacke] = "-DLAPACKE=ON,-DLAPACKE=OFF"
+
 EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=ON "
 OECMAKE_GENERATOR = "Unix Makefiles"
 
-- 
2.34.1


