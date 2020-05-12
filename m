Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.407.1589314968897943683
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 13:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04CKMB3a009670
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 13:22:32 -0700
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Tue, 12 May 2020 13:22:14 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pytoml: add datetime and stringold to RDEPENDS
Date: Tue, 12 May 2020 16:22:13 -0400
Message-ID: <20200512202213.3966452-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Error messages like the following are encountered if datetime and stringold
are not in RDEPENDS for pytoml, so add them:

|Python 3.8.2 (default, Apr 27 2020, 08:51:00)
|[GCC 9.3.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import pytoml
|Traceback (most recent call last):
|File "<stdin>", line 1, in <module>
|File "/usr/lib64/python3.8/site-packages/pytoml/_init_.py", line 2, in <module>
|from .parser import load, loads
|File "/usr/lib64/python3.8/site-packages/pytoml/parser.py", line 3, in <module>
|from .utils import rfc3339_re, parse_rfc3339_re
|File "/usr/lib64/python3.8/site-packages/pytoml/utils.py", line 1, in <module>
|import datetime
|ModuleNotFoundError: No module named 'datetime'

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb b/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
index b09005ec9..1533a895f 100644
--- a/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
+++ b/meta-python/recipes-devtools/python/python3-pytoml_0.1.21.bb
@@ -15,6 +15,11 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-stringold \
+    "
+
 RDEPENDS_${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
-- 
2.25.4

