Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.179.1588872018041890283
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2020 10:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 047HJkVn016057
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 May 2020 10:20:07 -0700
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 10:19:41 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <trevor.gamblin@windriver.com>
Subject: [meta-python][PATCH] python3-markdown: add logging and setuptools to RDEPENDS
Date: Thu, 7 May 2020 13:19:41 -0400
Message-ID: <20200507171941.3159257-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Importing the markdown module causes standard ModuleNotFoundErrors
if the logging and pkg_resources modules are unavailable:

root@qemux86-64:~# python3
Python 3.8.2 (default, Apr 27 2020, 08:51:00)
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import markdown
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
File "/usr/lib64/python3.8/site-packages/markdown/_init_.py", line 25, in <module>
from .core import Markdown, markdown, markdownFromFile
File "/usr/lib64/python3.8/site-packages/markdown/core.py", line 27, in <module>
import logging
ModuleNotFoundError: No module named 'logging'

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb b/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
index 68cd723ac..cdfe5496a 100644
--- a/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
@@ -10,3 +10,5 @@ SRC_URI[md5sum] = "72219f46ca440b657bf227500731bdf1"
 SRC_URI[sha256sum] = "d02e0f9b04c500cde6637c11ad7c72671f359b87b9fe924b2383649d8841db7c"
 
 BBCLASSEXTEND = "native"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-logging ${PYTHON_PN}-setuptools"
-- 
2.25.4

