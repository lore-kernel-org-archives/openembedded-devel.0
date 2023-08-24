Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC17C7113B
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 09:30:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7180.1692869415255852805
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 02:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lUOQ6sH9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=760001ddf9=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37O6K17Y008507
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 09:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ec/vy
	lCdhM9AuC5w26+Zjd77f4+JdgzI4HDckuaZnBs=; b=lUOQ6sH9hodtt++p5bliD
	tHcC0oaf7NdLBlnZsNyEDJbS7rcjzj4ZPckpiYNQHkQRqeH5waXyDBivGB6NS7IO
	UL04sko8ssG+zlVFN5JmnORJ3SPBBHgsgRnORJDhkOUf9nprydTxoVMEQSdz2N3x
	syKYJdEQBe7LtaPG0jbj1T5dQZT1q90bd5j7pAQhkzLRuHniPgJGGleOwqnxJ5yS
	odL9WzvS1S2RcL9252NQ6TOof91qlHiQ7WQ997e9f4AKQfSNlytqoSRJyC7x4ox5
	UsFS9Z+eufeXk8z1LGsQ/Lqbpv7XMNt5/9L1c2ZKtXxpBWlXmtHT8ny4BS0Kl3wl
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn21mhmsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 09:30:14 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 02:30:12 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 02:30:12 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] dialog: Update the SRC_URI
Date: Thu, 24 Aug 2023 17:30:11 +0800
Message-ID: <20230824093011.3855332-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: L034bnJzNzq78jjcuFGER32Xf0df1Ilk
X-Proofpoint-GUID: L034bnJzNzq78jjcuFGER32Xf0df1Ilk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_06,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308240076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 09:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104587

From: Mingli Yu <mingli.yu@windriver.com>

Update the SRC_URI to fix the do_fetch error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb
index 0b1e7e608..d67156e1f 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb
@@ -8,7 +8,7 @@ DEPENDS = "ncurses"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz"
+SRC_URI = "https://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
 SRC_URI[sha256sum] = "ae478fe7d5fca82bcf4b51684641e07d2ee68489d319710fe1e81f41a197bd66"
 
 # hardcoded here for use in dialog-static recipe
-- 
2.25.1


