Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.7215.1632414938749341966
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 09:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18NGZbKD026691
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 09:35:37 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 23 Sep 2021 09:35:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 23 Sep 2021 09:35:36 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 23 Sep 2021 09:35:36 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] lmdb: replace tag with commit id in SRCREV
Date: Thu, 23 Sep 2021 12:35:35 -0400
Message-ID: <20210923163535.4446-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Using tag in SRCREV does not work when the git source
is added to the PREMIRRORS and set BB_NO_NETWORK = "1".

This is because there is no SRCREV, and bitbake needs
check the original url to get it.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
index 3c6ffe04e..fb1b18c18 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1 \
            file://0001-Makefile-use-libprefix-instead-of-libdir.patch \
            "
 
-SRCREV = "LMDB_${PV}"
+SRCREV = "8ad7be2510414b9506ec9f9e24f24d04d9b04a1a"
 
 inherit base ptest
 
-- 
2.33.0

