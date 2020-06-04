Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.12400.1591272761704368898
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2020 05:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50342 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jgoje-0002zK-T2; Thu, 04 Jun 2020 15:12:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-dnspython: Consolidate in a single file
Date: Thu,  4 Jun 2020 15:12:19 +0300
Message-Id: <20200604121223.3818-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604121223.3818-1-leon.anavi@konsulko.com>
References: <20200604121223.3818-1-leon.anavi@konsulko.com>
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
 .../python/python-dnspython.inc               | 20 -----------------
 .../python/python3-dnspython_1.16.0.bb        | 22 +++++++++++++++++--
 2 files changed, 20 insertions(+), 22 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-dnspython.inc

diff --git a/meta-python/recipes-devtools/python/python-dnspython.inc b/meta-python/recipes-devtools/python/python-dnspython.inc
deleted file mode 100644
index 84502affe..000000000
--- a/meta-python/recipes-devtools/python/python-dnspython.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "DNS toolkit for Python"
-HOMEPAGE = "http://www.dnspython.org/"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
-
-SRC_URI[md5sum] = "bc9ca3b3a82164667d5730ec6d5248a2"
-SRC_URI[sha256sum] = "36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01"
-
-PYPI_PACKAGE_EXT = "zip"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
-"
diff --git a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
index ce4dfdc74..cb255442f 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
@@ -1,2 +1,20 @@
-inherit setuptools3
-require python-dnspython.inc
+DESCRIPTION = "DNS toolkit for Python"
+HOMEPAGE = "http://www.dnspython.org/"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
+
+SRC_URI[md5sum] = "bc9ca3b3a82164667d5730ec6d5248a2"
+SRC_URI[sha256sum] = "36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01"
+
+PYPI_PACKAGE_EXT = "zip"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-threading \
+"
-- 
2.17.1

