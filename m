Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.1477.1614109099891366197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 11:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 11NJbcr0001053
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Feb 2021 11:37:54 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Feb 2021 11:37:38 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 23 Feb 2021 11:37:38 -0800
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python2][PATCH] python-pyyaml: upgrade v5.3 -> v5.4.1
Date: Tue, 23 Feb 2021 14:37:29 -0500
Message-ID: <20210223193729.19889-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade python-pyyaml from v5.3 to v5.4.1 which contains
fix for CVE-2020-14343.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../python/{python-pyyaml_5.3.bb => python-pyyaml_5.4.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-devtools/python/{python-pyyaml_5.3.bb => python-pyyaml_5.4.1.bb} (59%)

diff --git a/recipes-devtools/python/python-pyyaml_5.3.bb b/recipes-devtools/python/python-pyyaml_5.4.1.bb
similarity index 59%
rename from recipes-devtools/python/python-pyyaml_5.3.bb
rename to recipes-devtools/python/python-pyyaml_5.4.1.bb
index 9b26c62..2873d25 100644
--- a/recipes-devtools/python/python-pyyaml_5.3.bb
+++ b/recipes-devtools/python/python-pyyaml_5.4.1.bb
@@ -2,15 +2,15 @@ SUMMARY = "Python support for YAML"
 HOMEPAGE = "http://www.pyyaml.org"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d8242660a8371add5fe547adf083079"
 DEPENDS = "libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}"
 
 PYPI_PACKAGE = "PyYAML"
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "adbb0d336b509d6472d3b095a0f1cf30"
-SRC_URI[sha256sum] = "e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615"
+SRC_URI[md5sum] = "46e25294c7efec23d4072ed6a7777f46"
+SRC_URI[sha256sum] = "607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
-- 
2.29.2

