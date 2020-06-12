Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.12733.1591933722630606002
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 20:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05C3mbD4024530
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 20:48:40 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 11 Jun 2020 20:48:18 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-m2crypto: add the missing rdepends
Date: Fri, 12 Jun 2020 11:46:46 +0800
Message-ID: <20200612034646.3659830-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix the error such as below:
 # python3
 [snip]
 >>> import M2Crypto
 ModuleNotFoundError: No module named 'decimal'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-devtools/python/python-m2crypto.inc    | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
index 881fdf1cc..81c81645a 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto.inc
+++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
@@ -17,10 +17,16 @@ PYPI_PACKAGE = "M2Crypto"
 inherit pypi siteinfo
 
 DEPENDS += "openssl swig-native"
-RDEPENDS_${PN} += "${PYTHON_PN}-typing \
-                   ${PYTHON_PN}-distutils \
-                   ${PYTHON_PN}-smtpd \
-                   ${PYTHON_PN}-xmlrpc \
+RDEPENDS_${PN} += "\
+  ${PYTHON_PN}-datetime \
+  ${PYTHON_PN}-distutils \
+  ${PYTHON_PN}-logging \
+  ${PYTHON_PN}-netclient \
+  ${PYTHON_PN}-netserver \
+  ${PYTHON_PN}-numbers \
+  ${PYTHON_PN}-smtpd \
+  ${PYTHON_PN}-typing \
+  ${PYTHON_PN}-xmlrpc \
 "
 
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}"
-- 
2.24.1

