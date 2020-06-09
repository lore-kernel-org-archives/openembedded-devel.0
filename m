Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.1421.1591683621111717601
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 23:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0596JdE7010414
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Jun 2020 23:20:10 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 8 Jun 2020 23:19:51 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 2/2] python-m2crypto: Add RDEPENDS
Date: Tue, 9 Jun 2020 14:18:06 +0800
Message-ID: <20200609061806.310291-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609061806.310291-1-changqing.li@windriver.com>
References: <20200609061806.310291-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix errors:
ModuleNotFoundError: No module named 'distutils'
ModuleNotFoundError: No module named 'asyncore'
ModuleNotFoundError: No module named 'xmlrpc'

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-python/recipes-devtools/python/python-m2crypto.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
index 76dd58ce0..881fdf1cc 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto.inc
+++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
@@ -17,7 +17,11 @@ PYPI_PACKAGE = "M2Crypto"
 inherit pypi siteinfo
 
 DEPENDS += "openssl swig-native"
-RDEPENDS_${PN} += "${PYTHON_PN}-typing"
+RDEPENDS_${PN} += "${PYTHON_PN}-typing \
+                   ${PYTHON_PN}-distutils \
+                   ${PYTHON_PN}-smtpd \
+                   ${PYTHON_PN}-xmlrpc \
+"
 
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}"
 DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR}"
-- 
2.17.1

