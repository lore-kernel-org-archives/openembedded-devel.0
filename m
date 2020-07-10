Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.1969.1594404997212112606
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06AIGFM2014812
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 11:16:26 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 10 Jul 2020
 11:16:06 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 94BCF20131;
 Fri, 10 Jul 2020 14:16:06 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 1/4] python3-mock: add recipe for v4.0.1
Date: Fri, 10 Jul 2020 14:15:52 -0400
Message-ID: <20200710181555.29809-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710181555.29809-1-sakib.sajal@windriver.com>
References: <20200710181555.29809-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Recipe is brought in from meta-cloud-services

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../python/python3-mock_4.0.1.bb                | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-mock_4.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb b/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
new file mode 100644
index 000000000..eebfcdade
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "A Python Mocking and Patching Library for Testing"
+HOMEPAGE = "https://pypi.python.org/pypi/mock"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=de9dfbf780446b18aab11f00baaf5b7e"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
+            ${PYTHON_PN}-cmd2 \
+            ${PYTHON_PN}-pyparsing \
+            ${PYTHON_PN}-mccabe \
+            ${PYTHON_PN}-pep8 \
+            ${PYTHON_PN}-pyflakes"
+
+SRC_URI[md5sum] = "8f48ba3fd059e7cfad92f8354064adfd"
+SRC_URI[sha256sum] = "2a572b715f09dd2f0a583d8aeb5bb67d7ed7a8fd31d193cf1227a99c16a67bc3"
-- 
2.27.0

