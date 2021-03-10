Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.6275.1615367491093311375
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 01:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12A9BOPZ017190
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Mar 2021 01:11:29 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 10 Mar 2021 01:11:27 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 10 Mar 2021 01:11:26 -0800
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 1/2] geoip: Switch to use the main branch
Date: Wed, 10 Mar 2021 17:11:24 +0800
Message-ID: <20210310091125.26609-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fix the below do_fetch warning:
WARNING: geoip-1.6.12-r0 do_fetch: Failed to fetch URL git://github.com/maxmind/geoip-api-c.git, attempting MIRRORS if available

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-support/geoip/geoip_1.6.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 4271c2e15..143100e48 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -10,7 +10,7 @@ SECTION = "libdevel"
 
 GEOIP_DATABASE_VERSION = "20181205"
 
-SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
+SRC_URI = "git://github.com/maxmind/geoip-api-c.git;branch=main \
            http://sources.openembedded.org/GeoIP.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoIP-dat; \
            http://sources.openembedded.org/GeoIPv6.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoIPv6-dat; \
            http://sources.openembedded.org/GeoLiteCity.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoLiteCity-dat; \
-- 
2.29.2

