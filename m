Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2039.1594404997211374740
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06AIGFM3014812
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 11:16:26 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 10 Jul 2020
 11:16:07 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 6E4E62018B;
 Fri, 10 Jul 2020 14:16:07 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 2/4] python3-pep8: add recipe for v1.7.1
Date: Fri, 10 Jul 2020 14:15:53 -0400
Message-ID: <20200710181555.29809-3-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710181555.29809-1-sakib.sajal@windriver.com>
References: <20200710181555.29809-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Recipe is brought in from meta-cloud-services

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../python/python3-pep8_1.7.1.bb                | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
new file mode 100644
index 000000000..8291281ca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Python style guide checker"
+HOMEPAGE = "https://github.com/dreamhost/cliff"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e"
+
+SRC_URI[md5sum] = "a03bb494859e87b42601b61b1b043a0c"
+SRC_URI[sha256sum] = "603a46e5c358ce20ac4807a0eeafac7505d1125a4c1bd8378757ada06f61bed8"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
+            ${PYTHON_PN}-cmd2 \
+            ${PYTHON_PN}-pyparsing"
+
+SRC_URI[md5sum] = "603821d06db945c71d811b5a8d78423c"
+SRC_URI[sha256sum] = "fe249b52e20498e59e0b5c5256aa52ee99fc295b26ec9eaa85776ffdb9fe6374"
-- 
2.27.0

