Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.22813.1595348504263908169
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2020 09:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06LGLCPJ015566
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2020 09:21:33 -0700
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Jul 2020 09:21:23 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pint: add setuptools and packaging to RDEPENDS
Date: Tue, 21 Jul 2020 12:21:22 -0400
Message-ID: <20200721162122.3070902-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

pint needs setuptools and packaging to be imported correctly:

>>> import pint
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.8/site-packages/pint/__init__.py", line 28, in <module>
    from .registry import LazyRegistry, UnitRegistry
  File "/usr/lib/python3.8/site-packages/pint/registry.py", line 49, in <module>
    import pkg_resources
ModuleNotFoundError: No module named 'pkg_resources'

Add them to RDEPENDS to fix this.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pint_0.14.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.14.bb b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
index 8e1630476..333b015a9 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.14.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.14.bb
@@ -21,6 +21,11 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-packaging \
+"
+
 RDEPENDS_${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
-- 
2.26.2

