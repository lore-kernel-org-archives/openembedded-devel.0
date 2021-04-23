Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.5800.1619156887711330570
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 22:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13N5m6rP027812
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 22:48:07 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 22 Apr 2021 22:48:06 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 22 Apr 2021 22:48:06 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][hardknott][PATCH 2/2] python3-cryptography: Upgrade to 3.3.2
Date: Fri, 23 Apr 2021 13:48:04 +0800
Message-ID: <20210423054804.28633-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210423054804.28633-1-mingli.yu@windriver.com>
References: <20210423054804.28633-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fix a security issue CVE-2020-36242 where certain sequences of
``update()`` calls when symmetrically encrypting very large
payloads (>2GB) could result in an integer overflow, leading to
buffer overflows.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...hon3-cryptography_3.3.1.bb => python3-cryptography_3.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography_3.3.1.bb => python3-cryptography_3.3.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
index 79a7ac1bf..0a36ffe1b 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba"
 
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "7e177e4bea2de937a584b13645cab32f25e3d96fc0bc4a4cf99c27dc77682be6"
+SRC_URI[sha256sum] = "5a60d3780149e13b7a6ff7ad6526b38846354d11a15e21068e57073e29e19bed"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

