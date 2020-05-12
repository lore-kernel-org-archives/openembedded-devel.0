Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.181.1589326505388743299
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 16:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04CNYSb3015345
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 16:34:54 -0700
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Tue, 12 May 2020 16:34:18 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-werkzeug: add python3-logging to RDEPENDS
Date: Tue, 12 May 2020 19:34:18 -0400
Message-ID: <20200512233418.4083342-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

werkzeug relies on the logging module, but it is not in RDEPENDS,
so add it:

|Python 3.8.2 (default, Apr 27 2020, 08:51:00)
|[GCC 9.3.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import werkzeug
|Traceback (most recent call last):
|File "<stdin>", line 1, in <module>
|File "/usr/lib64/python3.8/site-packages/werkzeug/_init_.py", line 15, in <module>
|from .serving import run_simple
|File "/usr/lib64/python3.8/site-packages/werkzeug/serving.py", line 50, in <module>
|from ._internal import _log
|File "/usr/lib64/python3.8/site-packages/werkzeug/_internal.py", line 12, in <module>
|import logging
|ModuleNotFoundError: No module named 'logging'

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
index b54399e1c..58735c1c0 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_1.0.1.bb
@@ -26,6 +26,7 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-html \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-json \
+    ${PYTHON_PN}-logging \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-numbers \
-- 
2.25.4

