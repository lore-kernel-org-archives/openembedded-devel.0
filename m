Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.3608.1588904801719934193
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2020 19:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0482QemF006518
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 May 2020 19:26:40 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 19:26:27 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pathlib2: add the missing rdepends
Date: Fri, 8 May 2020 10:26:26 +0800
Message-ID: <1588904786-443784-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import pathlib2
 [snip]
 ModuleNotFoundError: No module named 'ctypes'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python-pathlib2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pathlib2.inc b/meta-python/recipes-devtools/python/python-pathlib2.inc
index 3199b56..d69d527 100644
--- a/meta-python/recipes-devtools/python/python-pathlib2.inc
+++ b/meta-python/recipes-devtools/python/python-pathlib2.inc
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a"
 SRC_URI[md5sum] = "f2bd0a363eb0f8fa0556f35c1d9e66fb"
 SRC_URI[sha256sum] = "6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-six"
+RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-ctypes"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

