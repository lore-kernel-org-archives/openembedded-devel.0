Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.1806.1588183305515934729
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 11:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: tgamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 03TI1hgQ004050
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2020 11:01:44 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Apr 2020
 11:01:43 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 20B32900659;
 Wed, 29 Apr 2020 11:01:43 -0700 (PDT)
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v2] python3-iso8601: add python3-numbers to RDEPENDS
Date: Wed, 29 Apr 2020 11:01:43 -0700
Message-ID: <20200429180143.168910-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Sending v2 to fix commit message.

python3-iso8601 relies on the decimal module from the standard
library, but it is not in iso8601's RDEPENDS:

root@qemux86-64:~# python3
Python 3.8.2 (default, Feb 25 2020, 10:39:28)
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import iso8601
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.8/site-packages/iso8601/__init__.py", line 1, in <module>
    from .iso8601 import *
  File "/usr/lib/python3.8/site-packages/iso8601/iso8601.py", line 12, in <module>
    from decimal import Decimal
ModuleNotFoundError: No module named 'decimal'

Add it to RDEPENDS to fix the import error.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python-iso8601.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-iso8601.inc b/meta-python/recipes-devtools/python/python-iso8601.inc
index 61e9abbac..b6e021c5b 100644
--- a/meta-python/recipes-devtools/python/python-iso8601.inc
+++ b/meta-python/recipes-devtools/python/python-iso8601.inc
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098ed
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-numbers \ 
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

