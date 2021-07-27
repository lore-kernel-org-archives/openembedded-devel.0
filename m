Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.7778.1627367664801947488
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jul 2021 23:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 16R6YNqA018980
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 23:34:23 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 26 Jul 2021 23:34:21 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 26 Jul 2021 23:34:20 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
Date: Tue, 27 Jul 2021 14:32:16 +0800
Message-ID: <20210727063216.35570-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
WARNING: mariadb-10.5.9-r0 do_fetch: Failed to fetch URL https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mariadb-10.5.9.tar.gz, attempting MIRRORS if available

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 2974341bf..e8ff41461 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b1becf0cfa3366e0f4d854d1d264f311"
 
-SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz \
+SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://my.cnf \
            file://mysqld.service \
            file://install_db.service \
-- 
2.17.1

