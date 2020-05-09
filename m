Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.4901.1588999346935606992
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 21:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0494gP4H019887
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 May 2020 21:42:25 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 May 2020 21:42:24 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-zipp: add the missing rdepends
Date: Sat, 9 May 2020 12:42:23 +0800
Message-ID: <1588999343-169651-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import zipp
 ModuleNotFoundError: No module named 'zipfile'
 ModuleNotFoundError: No module named 'random' python3-math

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb b/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb
index 1019081..40db3c0 100644
--- a/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zipp_0.6.0.bb
@@ -10,6 +10,8 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
 inherit pypi setuptools3
 
-RDEPENDS_${PN} += "${PYTHON_PN}-more-itertools"
+RDEPENDS_${PN} += "${PYTHON_PN}-compression \
+                   ${PYTHON_PN}-math \
+                   ${PYTHON_PN}-more-itertools"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

