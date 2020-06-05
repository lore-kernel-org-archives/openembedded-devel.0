Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.3612.1591328031967169064
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2020 20:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0553XK1x010375
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Jun 2020 20:33:41 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 4 Jun 2020 20:33:19 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-webcolors: add the missing rdepends
Date: Fri, 5 Jun 2020 11:32:09 +0800
Message-ID: <20200605033209.2999925-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import webcolors
 [snip]
 ModuleNotFoundError: No module named 'typing'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
index e567e0ba2..b950d6f63 100644
--- a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
@@ -9,6 +9,7 @@ inherit pypi setuptools3 ptest
 
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-typing \
 "
 
 SRC_URI += " \
-- 
2.24.1

