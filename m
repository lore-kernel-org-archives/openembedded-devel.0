Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.1809.1593024336249551778
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 11:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 05OIjYqg026572
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2020 11:45:35 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 24 Jun 2020
 11:45:34 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 09D49200D3;
 Wed, 24 Jun 2020 14:45:34 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [meta-python][PATCH] python3-requests-toolbelt: add recipe for v0.9.1
Date: Wed, 24 Jun 2020 14:45:33 -0400
Message-ID: <20200624184533.1438-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../python/python3-requests-toolbelt_0.9.1.bb    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
new file mode 100644
index 000000000..3beb39718
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "A utility belt for advanced users of python-requests."
+HOMEPAGE = "https://toolbelt.readthedocs.org"
+AUTHOR = "Ian Cordasco, Cory Benfield"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571"
+
+SRC_URI[md5sum] = "b1509735c4b4cf95df2619facbc3672e"
+SRC_URI[sha256sum] = "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
+
+inherit setuptools3
+inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-requests (>=2.0.1) \
+"
-- 
2.27.0

