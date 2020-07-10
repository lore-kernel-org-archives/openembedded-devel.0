Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.1975.1594404997211749907
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06AIGFM4014812
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 11:16:26 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 10 Jul 2020
 11:16:08 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 41220201DE;
 Fri, 10 Jul 2020 14:16:08 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 3/4] python3-mccabe: add recipe for v0.2.1
Date: Fri, 10 Jul 2020 14:15:54 -0400
Message-ID: <20200710181555.29809-4-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710181555.29809-1-sakib.sajal@windriver.com>
References: <20200710181555.29809-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Recipe is brought in from meta-cloud-services

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../python/python3-mccabe_0.2.1.bb                | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb b/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb
new file mode 100644
index 000000000..d3a9971e4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "McCabe checker, plugin for flake8"
+HOMEPAGE = "https://github.com/dreamhost/cliff"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4"
+
+SRC_URI[md5sum] = "5a3f3fa6a4bad126c88aaaa7dab682f5"
+SRC_URI[sha256sum] = "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
+            ${PYTHON_PN}-cmd2 \
+            ${PYTHON_PN}-pyparsing \
+           "
-- 
2.27.0

