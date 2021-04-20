Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.7776.1618908439700303094
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 01:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13K8lHJV001150
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Apr 2021 01:47:18 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 20 Apr 2021 01:47:17 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Tue, 20 Apr 2021 01:47:16 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] onig: add oniguruma to PROVIDES
Date: Tue, 20 Apr 2021 16:47:15 +0800
Message-ID: <20210420084715.35022-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add oniguruma to PROVIDES.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/onig/onig_6.9.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/onig/onig_6.9.4.bb b/meta-oe/recipes-support/onig/onig_6.9.4.bb
index 50d9f5235..701f65c29 100644
--- a/meta-oe/recipes-support/onig/onig_6.9.4.bb
+++ b/meta-oe/recipes-support/onig/onig_6.9.4.bb
@@ -31,3 +31,5 @@ do_install_ptest() {
     mkdir -p ${D}${PTEST_PATH}/tests
     install -m 0755 -t ${D}${PTEST_PATH}/tests/ ${B}/test/.libs/*
 }
+
+PROVIDES += "oniguruma"
-- 
2.29.2

