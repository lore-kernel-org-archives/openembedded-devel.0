Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.16569.1591955291972657464
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 02:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45372 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjgIA-0001HN-Dx; Fri, 12 Jun 2020 12:48:08 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-packaging: Consolidate in a single file
Date: Fri, 12 Jun 2020 12:47:54 +0300
Message-Id: <20200612094757.22146-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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
 .../recipes-devtools/python/python-packaging.inc     | 10 ----------
 .../python/python3-packaging_20.3.bb                 | 12 +++++++++++-
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-packaging.inc

diff --git a/meta-python/recipes-devtools/python/python-packaging.inc b/meta-python/recipes-devtools/python/python-packaging.inc
deleted file mode 100644
index 418483f4e..000000000
--- a/meta-python/recipes-devtools/python/python-packaging.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Core utilities for Python packages"
-HOMEPAGE = "https://github.com/pypa/packaging"
-LICENSE = "Apache-2.0 & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
-
-SRC_URI[md5sum] = "19e0d1f82a9007b448650ccfeffd0a26"
-SRC_URI[sha256sum] = "3c292b474fda1671ec57d46d739d072bfd495a4f51ad01a055121d81e952b7a3"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
diff --git a/meta-python/recipes-devtools/python/python3-packaging_20.3.bb b/meta-python/recipes-devtools/python/python3-packaging_20.3.bb
index aa20fb26f..9eee84b1b 100644
--- a/meta-python/recipes-devtools/python/python3-packaging_20.3.bb
+++ b/meta-python/recipes-devtools/python/python3-packaging_20.3.bb
@@ -1,2 +1,12 @@
+DESCRIPTION = "Core utilities for Python packages"
+HOMEPAGE = "https://github.com/pypa/packaging"
+LICENSE = "Apache-2.0 & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
+
+SRC_URI[md5sum] = "19e0d1f82a9007b448650ccfeffd0a26"
+SRC_URI[sha256sum] = "3c292b474fda1671ec57d46d739d072bfd495a4f51ad01a055121d81e952b7a3"
+
 inherit pypi setuptools3
-require python-packaging.inc
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-pyparsing"
-- 
2.17.1

