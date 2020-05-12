Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2969.1589313649581165129
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 13:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04CK0BQp008456
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 13:00:38 -0700
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Tue, 12 May 2020 13:00:18 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pyrsistent: add python3-numbers to RDEPENDS
Date: Tue, 12 May 2020 16:00:17 -0400
Message-ID: <20200512200017.3924599-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

python3-pyrsistent requires python3-numbers, so add it to RDEPENDS:

|Python 3.8.2 (default, Apr 27 2020, 08:51:00)
|[GCC 9.3.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import pyrsistent
|Traceback (most recent call last):
|File "<stdin>", line 1, in <module>
|File "/usr/lib64/python3.8/site-packages/pyrsistent/_init_.py", line 3, in <module>
|from pyrsistent._pmap import pmap, m, PMap
|File "/usr/lib64/python3.8/site-packages/pyrsistent/_pmap.py", line 4, in <module>
|from pyrsistent._pvector import pvector
|File "/usr/lib64/python3.8/site-packages/pyrsistent/_pvector.py", line 3, in <module>
|from numbers import Integral
|ModuleNotFoundError: No module named 'numbers'

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
index 5ef714028..53251aa55 100644
--- a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "cdc7b5e3ed77bed61270a47d35434a30617b9becdf2478af76ad2c6ade
 inherit pypi setuptools3
 
 RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-six \
 "
 
-- 
2.25.4

