Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.482.1588020860661137960
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2020 13:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03RKrmsu018945
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2020 13:54:09 -0700
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Mon, 27 Apr 2020 13:53:45 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-asn1crypto: add python3-numbers to RDEPENDS
Date: Mon, 27 Apr 2020 16:53:44 -0400
Message-ID: <20200427205344.1600566-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The asn1crypto module relies on the fractions module from the
standard library, which is contained in the python3-numbers package,
but it is not in asn1crypto's RDEPENDS:

|>>> import asn1crypto.pdf
|Traceback (most recent call last):
|  File "<stdin>", line 1, in <module>
|  File "/usr/lib64/python3.8/site-packages/asn1crypto/pdf.py", line 10, in <module>
|    from .cms import CMSAttributeType, CMSAttribute
|  File "/usr/lib64/python3.8/site-packages/asn1crypto/cms.py", line 29, in <module>
|    from .algos import (
|  File "/usr/lib64/python3.8/site-packages/asn1crypto/algos.py", line 26, in <module>
|    from .core import (
|  File "/usr/lib64/python3.8/site-packages/asn1crypto/core.py", line 52, in <module>
|    from fractions import Fraction
|ModuleNotFoundError: No module named 'fractions'

Add it to fix the error.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb
index 1b03c666a..0d38da989 100644
--- a/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb
@@ -18,6 +18,7 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-shell \
 "
 
-- 
2.24.1

