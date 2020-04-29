Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.1666.1588191496347060541
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 13:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: tgamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03TJ6wQw015732
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2020 12:07:30 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Apr 2020
 12:07:02 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id D2934900659;
 Wed, 29 Apr 2020 12:07:02 -0700 (PDT)
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pysocks: add python3-logging to RDEPENDS
Date: Wed, 29 Apr 2020 12:07:02 -0700
Message-ID: <20200429190702.179844-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

python3-pysocks uses the logging module, but it isn't in the
RDEPENDS list:

root@qemux86-64:~# python3
Python 3.8.2 (default, Feb 25 2020, 10:39:28)
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import socks
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.8/site-packages/socks.py", line 9, in <module>
    import logging
ModuleNotFoundError: No module named 'logging'

Add it to RDEPENDS to fix the ModuleNotFoundError.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb
index e311904fc..d0db8a063 100644
--- a/meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb
@@ -12,6 +12,7 @@ inherit pypi setuptools3
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-email \
     ${PYTHON_PN}-io \
+    ${PYTHON_PN}-logging \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-shell \
 "
-- 
2.17.1

