Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.2011.1588839228668166480
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2020 01:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0478DlM2019179
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 May 2020 01:13:47 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 01:13:34 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-parallax: add the missing rdepends
Date: Thu, 7 May 2020 16:13:33 +0800
Message-ID: <1588839213-241077-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import parallax
 [snip]
 ModuleNotFoundError: No module named 'fcntl'
 ModuleNotFoundError: No module named 'Queue'
 ModuleNotFoundError: No module named 'getpass'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb b/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
index d658bd6..60631d4 100644
--- a/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
@@ -8,4 +8,6 @@ SRC_URI[sha256sum] = "e9e4dc500f1306a638df0f19d4ef976a623b260fc614c55cb1fd0d8410
 
 inherit pypi setuptools3
 
+RDEPENDS_${PN} += "${PYTHON_PN}-fcntl ${PYTHON_PN}-threading ${PYTHON_PN}-unixadmin"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

