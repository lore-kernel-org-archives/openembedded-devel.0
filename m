Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.1406.1591683600875632968
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 23:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0596JdE4010414
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Jun 2020 23:19:50 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 8 Jun 2020 23:19:28 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 1/2] python-django: add RDEPENDS
Date: Tue, 9 Jun 2020 14:18:05 +0800
Message-ID: <20200609061806.310291-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix error:
ModuleNotFoundError: No module named 'distutils'

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-python/recipes-devtools/python/python-django.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 54c77c827..73b7ac99f 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -28,4 +28,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-unixadmin \
     ${PYTHON_PN}-xml \
+    ${PYTHON_PN}-distutils \
 "
-- 
2.17.1

