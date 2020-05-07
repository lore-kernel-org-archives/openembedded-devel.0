Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.9592.1588868199082441190
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2020 09:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: tgamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 047GGbpR023927
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 May 2020 09:16:38 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 09:16:37 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 6ED1B900DB1;
 Thu,  7 May 2020 09:16:37 -0700 (PDT)
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <trevor.gamblin@windriver.com>
Subject: [meta-python][PATCH] python3-py: add python3-netclient to RDEPENDS
Date: Thu, 7 May 2020 09:16:37 -0700
Message-ID: <20200507161637.69223-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

python3-py requires the uuid.py module, which is contained in
python3-netclient. Without it:

root@qemux86-64:~# python3

>>> import py._path.local
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
File "/usr/lib64/python3.8/site-packages/py/_path/local.py", line 7, in <module>
import sys, os, atexit, io, uuid
ModuleNotFoundError: No module named 'uuid'

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-py_1.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-py_1.8.1.bb b/meta-python/recipes-devtools/python/python3-py_1.8.1.bb
index 73aaf9e46..ff66aeaa2 100644
--- a/meta-python/recipes-devtools/python/python3-py_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-py_1.8.1.bb
@@ -11,3 +11,5 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-netclient"
-- 
2.17.1

