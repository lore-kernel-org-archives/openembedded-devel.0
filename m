Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2993.1591841304060234295
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 19:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05B282Kb001329
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 19:08:13 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 10 Jun 2020 19:07:40 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][PATCH] python-django: set CVE_PRODUCT to be django
Date: Thu, 11 Jun 2020 10:07:39 +0800
Message-ID: <20200611020739.37612-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-django.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 54c77c827..3f8c19fb5 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -29,3 +29,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-unixadmin \
     ${PYTHON_PN}-xml \
 "
+
+CVE_PRODUCT = "django"
-- 
2.17.1

