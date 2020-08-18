Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.68140.1597764900478400272
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 08:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45392 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k83da-0004rN-U7; Tue, 18 Aug 2020 18:34:59 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-djangorestframework: Consolidate in a single file
Date: Tue, 18 Aug 2020 18:34:43 +0300
Message-Id: <20200818153444.15728-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818153444.15728-1-leon.anavi@konsulko.com>
References: <20200818153444.15728-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.7
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-djangorestframework.inc      | 16 ----------------
 .../python3-djangorestframework_3.9.0.bb       | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-djangorestframework.inc

diff --git a/meta-python/recipes-devtools/python/python-djangorestframework.inc b/meta-python/recipes-devtools/python/python-djangorestframework.inc
deleted file mode 100644
index 8551a8341..000000000
--- a/meta-python/recipes-devtools/python/python-djangorestframework.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY =  "djangorestframework"
-DESCRIPTION = "pip3 install djangorestframework"
-HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
-
-SRC_URI[md5sum] = "0d481bf8dbb87bb927b46798edc1a9bd"
-SRC_URI[sha256sum] = "607865b0bb1598b153793892101d881466bd5a991de12bd6229abb18b1c86136"
-PYPI_PACKAGE = "djangorestframework"
-
-inherit pypi
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-django \
-"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
index 9ed6d1726..438a5e19a 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
@@ -1,2 +1,16 @@
-require python-djangorestframework.inc
-inherit setuptools3
\ No newline at end of file
+SUMMARY =  "djangorestframework"
+DESCRIPTION = "pip3 install djangorestframework"
+HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
+
+SRC_URI[md5sum] = "0d481bf8dbb87bb927b46798edc1a9bd"
+SRC_URI[sha256sum] = "607865b0bb1598b153793892101d881466bd5a991de12bd6229abb18b1c86136"
+PYPI_PACKAGE = "djangorestframework"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-django \
+"
-- 
2.17.1

