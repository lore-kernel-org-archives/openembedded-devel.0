Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.11119.1615305553886644122
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Mar 2021 07:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 129Fx2ZK008126
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Mar 2021 07:59:07 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Mar 2021 07:59:01 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Tue, 9 Mar 2021 07:59:01 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] nss: upgrade 3.60.1 -> 3.62
Date: Tue, 9 Mar 2021 10:58:58 -0500
Message-ID: <20210309155858.234449-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The patch: nss-fix-nsinstall-build.patch is embedded specific
so set it's Upstream-Status to inappropriate.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch | 2 +-
 meta-oe/recipes-support/nss/{nss_3.60.1.bb => nss_3.62.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.60.1.bb => nss_3.62.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch b/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
index fbfa828b2..224a5d236 100644
--- a/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
+++ b/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
@@ -15,7 +15,7 @@ on host to install built files, it doesn't need any cross-compling or
 multilib build options. Just clean the ARCHFLAG and LDFLAGS to fix this
 error.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 ===================================================
diff --git a/meta-oe/recipes-support/nss/nss_3.60.1.bb b/meta-oe/recipes-support/nss/nss_3.62.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.60.1.bb
rename to meta-oe/recipes-support/nss/nss_3.62.bb
index 344cc3472..439a6ae66 100644
--- a/meta-oe/recipes-support/nss/nss_3.60.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.62.bb
@@ -32,7 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "2051c20b61112df24bad533ac37f6c66c1bc0d6ea70bb9d9cad102d20324279d"
+SRC_URI[sha256sum] = "86d6df7cece25b8d4efa53e4c19af903c484eb79871163f37b5232bb406a5478"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.27.0

