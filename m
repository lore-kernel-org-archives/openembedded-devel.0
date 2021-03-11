Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web08.8326.1615478212547918306
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 07:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12BFuZxo022277
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Mar 2021 07:56:45 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 07:56:34 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 11 Mar 2021 07:56:34 -0800
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] grpc: upgrade 1.36.1 -> 1.36.2
Date: Thu, 11 Mar 2021 10:56:34 -0500
Message-ID: <20210311155634.5130-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Changelog:
https://github.com/grpc/grpc/releases/tag/v1.36.2

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../recipes-devtools/grpc/{grpc_1.36.1.bb => grpc_1.36.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.36.1.bb => grpc_1.36.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
index eb137bef5..17e70aebf 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN}-compiler = "${PN}"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "3b7f86e3516746c5f0db1947e0d65e94159bcb12"
+SRCREV_grpc = "c3438a0c5d7bc499eb31fd4853ca72c771f758a5"
 BRANCH = "v1.36.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            "
-- 
2.29.2

