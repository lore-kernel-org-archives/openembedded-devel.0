Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.4290.1588908241995811976
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2020 20:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0483O0V2011225
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 May 2020 20:24:01 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 20:23:59 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pydbus: add the missing rdepends
Date: Fri, 8 May 2020 11:23:58 +0800
Message-ID: <1588908238-443178-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import pydbus
 [snip]
 ModuleNotFoundError: No module named 'socket'
 ModuleNotFoundError: No module named 'logging'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
index 931bc6f..807e7b2 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
@@ -14,4 +14,6 @@ inherit pypi setuptools3
 
 S = "${WORKDIR}/pydbus-${PV}"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-pygobject"
+RDEPENDS_${PN} = "${PYTHON_PN}-pygobject \
+                  ${PYTHON_PN}-io \
+                  ${PYTHON_PN}-logging"
-- 
2.7.4

