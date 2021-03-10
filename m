Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.6276.1615367500851789490
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 01:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12A9BOPa017190
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Mar 2021 01:11:30 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 10 Mar 2021 01:11:28 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 10 Mar 2021 01:11:27 -0800
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 2/2] geoip-perl: Switch to use the main branch
Date: Wed, 10 Mar 2021 17:11:25 +0800
Message-ID: <20210310091125.26609-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310091125.26609-1-mingli.yu@windriver.com>
References: <20210310091125.26609-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fix the below do_fetch warning:
WARNING: geoip-perl-1.51-r0 do_fetch: Failed to fetch URL git://github.com/maxmind/geoip-api-perl.git;protocol=https;, attempting MIRRORS if available

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-support/geoip/geoip-perl_1.51.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
index ed5c3a979..944c00576 100644
--- a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4f3ea6e9b28af88dc0321190a1f8250"
 
 S = "${WORKDIR}/git"
 SRCREV = "4cdfdc38eca237c19c22a8b90490446ce6d970fa"
-SRC_URI = "git://github.com/maxmind/geoip-api-perl.git;protocol=https; \
+SRC_URI = "git://github.com/maxmind/geoip-api-perl.git;branch=main \
     file://run-ptest \
 "
 
-- 
2.29.2

