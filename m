Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41237C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 11:53:37 +0000 (UTC)
Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.43234.1635767615606555056
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 04:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=neutral (domain: fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@fujitsu.com)
IronPort-Data: =?us-ascii?q?A9a23=3ARzkKIKmOpuot0Ds97ecsVQTo5gyoJERdPkR7XQ2?=
 =?us-ascii?q?eYbTBsI5bp2MEx2dJUGHTPauLZ2XzKNojboXl90lQ7ZTVzt5qGgQ/+CA2RRqmi?=
 =?us-ascii?q?+KfW43BcR2Y0wB+jyH7ZBs+qZ1YM7EsFehsJpPnjkrrYueJQUVUj/nSH+OlULe?=
 =?us-ascii?q?cY0ideCc/IMsfoUM68wIGqt4w6TSJK1vlVeLa+6UzCnf8s9JHGj58B5a4lf9al?=
 =?us-ascii?q?K+aVAX0EbAJTasjUFf2zxH5BX+ETE27ByOQroJ8RoZWSwtfpYxV8F81/z91Yj+?=
 =?us-ascii?q?kur39NEMXQL/OJhXIgX1TM0SgqkEa4HVsjeBgb7xBAatUo2zhc9RZ2tVAs5OqU?=
 =?us-ascii?q?EEnOLbQsOoAURhECDw4NqpDkFPCCSHm75PJlBWWIxMAxN0rVinaJ7Yw/f56B2x?=
 =?us-ascii?q?L//EUJD0BKxyOme+y6La6UfV3wMM7Ic/mOYkStn1twXfeF/lOfHxpa80m/vcBh?=
 =?us-ascii?q?HFp2J8IRq2YOqIkhfNUREyoS3Vy1p0/UfrSRNuVu0Q=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A5WR9z6A/OrawTErlHemQ55DYdb4zR+YMi2TD?=
 =?us-ascii?q?tnoBLSC9F/b0qynAppomPGDP4gr5NEtApTniAtjkfZq/z+8X3WB5B97LMzUO01?=
 =?us-ascii?q?HYTr2Kg7GD/xTQXwX69sN4kZxrarVCDrTLZmRSvILX5xaZHr8brOW6zA=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.87,199,1631548800";
   d="scan'208";a="116723088"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Nov 2021 19:53:34 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 5EC844D0DC7C
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  1 Nov 2021 19:53:30 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 1 Nov 2021 19:53:23 +0800
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 1 Nov 2021 19:53:26 +0800
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.41.0 ->
 1.41.1
Date: Tue, 2 Nov 2021 04:52:56 +0800
Message-ID: <1635799976-101837-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202)
X-yoursite-MailScanner-ID: 5EC844D0DC7C.A2A78
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@fujitsu.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 11:53:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93736

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...n3-grpcio-tools_1.41.0.bb => python3-grpcio-tools_1.41.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.41.0.bb => python3-grpcio-tools_1.41.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.41.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.41.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.41.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.41.1.bb
index 55b8890997..fdc4ad9cc2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.41.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.41.1.bb
@@ -11,7 +11,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 
-SRC_URI[sha256sum] = "3891b1df82369acbc8451d4952cd20755f49a82398dce62437511ad17b47290e"
+SRC_URI[sha256sum] = "f16e4c63996ca8fe0af1eb9c4a07e5207874c4a69f890ccb824cd858521d981f"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1




