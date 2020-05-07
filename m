Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.1147.1588832565460165794
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2020 23:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0476MiOs017680
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 May 2020 23:22:45 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 6 May 2020 23:22:34 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v2] python3-ntplib: add missing python3-io RDEPENDS
Date: Thu, 7 May 2020 14:22:33 +0800
Message-ID: <1588832553-58023-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing python3-io RDEPENDS to fix
below error:
 # python3
Python 3.8.2 (default, Apr 27 2020, 08:51:00)
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
 >>> import ntplib
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
File "/usr/lib64/python3.8/site-packages/ntplib.py", line 32, in <module>
import socket
ModuleNotFoundError: No module named 'socket'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb b/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
index 93df83a..ce2618b 100644
--- a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
@@ -11,4 +11,4 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools3 python3native pypi
 
-RDEPENDS_${PN} += "${PYTHON_PN}-datetime"
+RDEPENDS_${PN} += "${PYTHON_PN}-datetime ${PYTHON_PN}-io"
-- 
2.7.4

