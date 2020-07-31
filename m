Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.871.1596213603823659981
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 09:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06VGe2lV018411
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 09:40:02 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 31 Jul 2020
 09:40:01 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-python][PATCH 1/1] python3-cryptography: fix two tests
Date: Fri, 31 Jul 2020 09:40:01 -0700
Message-ID: <20200731164001.16113-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Tests depending on the hypothesis module should be skipped
if the module is not available.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../recipes-devtools/python/python3-cryptography/h-test.patch  | 10 ++++++++++
 .../recipes-devtools/python/python3-cryptography_2.8.bb        |  1 +
 2 files changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography/h-test.patch

diff --git a/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch b/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
new file mode 100644
index 0000000..9f07c73
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
@@ -0,0 +1,10 @@
+--- a/tests/hypothesis/__init__.py
++++ b/tests/hypothesis/__init__.py
+@@ -3,3 +3,7 @@
+ # for complete details.
+ 
+ from __future__ import absolute_import, division, print_function
++
++import pytest
++hypothesis = pytest.importorskip("hypothesis")
++
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
index c75dabb..95e903b 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
@@ -11,6 +11,7 @@ SRC_URI[sha256sum] = "3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02
 
 SRC_URI += " \
     file://run-ptest \
+    file://h-test.patch \
 "
 
 inherit pypi setuptools3
-- 
2.7.4

