Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.484.1589325644584924971
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 16:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04CNKCHf014978
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 16:20:33 -0700
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Tue, 12 May 2020 16:20:17 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pyyaml: add python3-netclient to RDEPENDS
Date: Tue, 12 May 2020 19:20:16 -0400
Message-ID: <20200512232016.4055077-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

pyyaml relies on the base64 module (which is in python3-netclient),
but it is not in RDEPENDS, so add it:

|Python 3.8.2 (default, Apr 27 2020, 08:51:00)
|[GCC 9.3.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import yaml
|Traceback (most recent call last):
|File "<stdin>", line 1, in <module>
|File "/usr/lib64/python3.8/site-packages/yaml/_init_.py", line 8, in <module>
|from .loader import *
|File "/usr/lib64/python3.8/site-packages/yaml/loader.py", line 8, in <module>
|from .constructor import *
|File "/usr/lib64/python3.8/site-packages/yaml/constructor.py", line 14, in <module>
|import collections.abc, datetime, base64, binascii, re, sys, types
|ModuleNotFoundError: No module named 'base64'

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
index b5425b8c9..17868a25d 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
@@ -13,6 +13,7 @@ SRC_URI[sha256sum] = "e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-netclient \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.4

