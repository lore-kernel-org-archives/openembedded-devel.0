Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2149.1588840494284575719
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2020 01:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0478YVG7028875
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 May 2020 01:34:42 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 01:34:14 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pkgconfig: add missing rdepends
Date: Thu, 7 May 2020 16:34:13 +0800
Message-ID: <1588840453-331865-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add missing rdepends to fix below error:
 # python3
 [snip]
 >>> import pkgconfig
 [snip]
 ModuleNotFoundError: No module named 'shlex'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
index 92eb8bf..fc7a47a 100644
--- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/matze/pkgconfig.git"
 SRCREV ?= "8af0102346847e8873af8e76ab3f34ba9da806e2"
 
 RDEPENDS_${PN} = "pkgconfig \
+                 ${PYTHON_PN}-shell \
                  "
 
 inherit setuptools3
-- 
2.7.4

