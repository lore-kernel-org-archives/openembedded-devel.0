Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D20CC433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 11:51:36 +0000 (UTC)
Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.42926.1635767494858646084
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 04:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=neutral (domain: fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@fujitsu.com)
IronPort-Data: =?us-ascii?q?A9a23=3ABIS4HaNG3TO02FHvrR2MlcFynXyQoLVcMsFnjC/?=
 =?us-ascii?q?WdVXt0Dgq1DMFx2AXUDjQPPmNNzD1e9lwPY6w8EkG6sDUm99gGjLY11k3ESsS9?=
 =?us-ascii?q?pCt6fd1j6vIF3rLaJWFFSqL1u1GAjX7BJ1yHiC0SiuFaOC79CAljfjQH9IQNca?=
 =?us-ascii?q?fUsxPbV49IMseoUI78wIJqtYAbemRW2thi/uryyHsEAPNNwpPD44hw/nrRCWDE?=
 =?us-ascii?q?xjFkGhwUlQWPZintbJF/pUfJMp3yaqZdxMUTmTId9NWSdovzJnhlo/Y1xwrTN2?=
 =?us-ascii?q?4kLfnaVBMSbnXVeSMoiMOHfH83V4Z/Wpvuko4HKN0hUN/mTWEmd9r0ZNDs4esY?=
 =?us-ascii?q?Qk0PKzQg/lbWB5de817FfQfpuCdeiDk7qR/yGWDKRMA2c5GC1k7O4Ad8Ot7DWx?=
 =?us-ascii?q?CsPAVNj0JRhSCnP6thrWjR+9hg84uIMXmMMUYoH4I8N1zJZ7KWriaG+OTu4Aeh?=
 =?us-ascii?q?2x226hz8T/lT5JxQVJSgN7oOnWj4msqNa8=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A+nWSl6pSD8F2KpVIu6LU//YaV5rdeYIsimQD?=
 =?us-ascii?q?101hICG9E/bo9fxG88506faZslsssRIb6LO90cu7IE80nKQdieJ6AV7IZmbbUQ?=
 =?us-ascii?q?WTQL2LuuDZslnd8lXFltK1gp0QFpSWFueAdWRSvILr5hWiCdY8zJ2i+KCsv+3X?=
 =?us-ascii?q?yHBgVmhRGsddxjY8GgCGCVd3WQUDIZI4EaCX7s1BqyHlVm8Qaq2AdwA4dtmGt9?=
 =?us-ascii?q?vWj4jnfBJDIxYm7TOFhTSu5KW/MzXw5GZ4bw9y?=
X-IronPort-AV: E=Sophos;i="5.87,199,1631548800";
   d="scan'208";a="116723037"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Nov 2021 19:51:33 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id ECD4D4D0F93D
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  1 Nov 2021 19:51:31 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 1 Nov 2021 19:51:30 +0800
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-engineio: upgrade 4.2.1 -> 4.3.0
Date: Tue, 2 Nov 2021 04:51:03 +0800
Message-ID: <1635799863-101746-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: ECD4D4D0F93D.A5343
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@fujitsu.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 11:51:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93733

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-engineio_4.2.1.bb => python3-engineio_4.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.2.1.bb => python3-engineio_4.3.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.2.1.bb b/meta-python/recipes-devtools/python/python3-engineio_4.3.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-engineio_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.3.0.bb
index 2eb82e8fc8..95edb860ac 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.3.0.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "d510329b6d8ed5662547862f58bc73659ae62defa66b66d745ba021de112fa62"
+SRC_URI[sha256sum] = "fed35eeacfa21f53f1fc05ef0cadd65a50780364da3a2be7650eb92f928fdb11"
-- 
2.25.1




