Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web08.5798.1615363224222423208
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 00:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12A80BAi002762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Mar 2021 00:00:12 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Mar 2021 23:59:42 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 9 Mar 2021 23:59:41 -0800
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] bridge-utils: Switch to use the main branch
Date: Wed, 10 Mar 2021 15:59:40 +0800
Message-ID: <20210310075940.475-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fix the below do_fetch warning:
WARNING: bridge-utils-1.7-r0 do_fetch: Failed to fetch URL git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git, attempting MIRRORS if available

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-support/bridge-utils/bridge-utils_1.7.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.bb
index 369232343..cf7185864 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37"
 SRCREV = "ab8a2cc330253321be7bc69dea88bfaa3d48415e"
 
 SRC_URI = "\
-    git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git \
+    git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git;branch=main \
     file://kernel-headers.patch \
     file://0005-build-don-t-ignore-CFLAGS-from-environment.patch \
     file://0006-libbridge-Modifying-the-AR-to-cross-toolchain.patch \
-- 
2.29.2

