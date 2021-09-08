Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.8766.1631091342121573406
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 01:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1888te8i009931
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Sep 2021 01:55:40 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 8 Sep 2021 01:55:39 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 8 Sep 2021 01:55:39 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] polkit: add the CVE tag
Date: Wed, 8 Sep 2021 16:51:31 +0800
Message-ID: <20210908085131.9920-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch b/meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch
index daf0b1edb..76308ffdb 100644
--- a/meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch
+++ b/meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] GHSL-2021-074: authentication bypass vulnerability in polkit
 
 initial values returned if error caught
 
+CVE: CVE-2021-3560
+
 Upstream-Status: Backport [https://gitlab.freedesktop.org/polkit/polkit/-/commit/a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-- 
2.17.1

