Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.15873.1593011817142975991
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 08:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53538 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jo78w-00035d-Hc; Wed, 24 Jun 2020 18:16:58 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-ndg-httpsclient: Consolidate in a single file
Date: Wed, 24 Jun 2020 18:16:23 +0300
Message-Id: <20200624151628.547-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624151628.547-1-leon.anavi@konsulko.com>
References: <20200624151628.547-1-leon.anavi@konsulko.com>
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
Fix the HOMEPAGE to point to the GitHub repository.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-ndg-httpsclient.inc         | 25 -----------------
 .../python/python3-ndg-httpsclient_0.5.1.bb   | 27 ++++++++++++++++++-
 2 files changed, 26 insertions(+), 26 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-ndg-httpsclient.inc

diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
deleted file mode 100644
index bca58f764..000000000
--- a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL"
-HOMEPAGE = "http://python-requests.org"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0"
-
-SRC_URI[md5sum] = "b0fc8ea38f87d2c1ab1ed79a95c078f9"
-SRC_URI[sha256sum] = "d72faed0376ab039736c2ba12e30695e2788c4aa569c9c3e3d72131de2592210"
-
-PYPI_PACKAGE = "ndg_httpsclient"
-
-DEPENDS += " \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-pyasn1 \
-"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-pyasn1 \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-
-UPSTREAM_CHECK_REGEX = ""
diff --git a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
index 65a8c816f..23e1868c2 100644
--- a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
@@ -1,5 +1,30 @@
+DESCRIPTION = "Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL"
+HOMEPAGE = "https://github.com/cedadev/ndg_httpsclient/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0"
+
+SRC_URI[md5sum] = "b0fc8ea38f87d2c1ab1ed79a95c078f9"
+SRC_URI[sha256sum] = "d72faed0376ab039736c2ba12e30695e2788c4aa569c9c3e3d72131de2592210"
+
 inherit pypi setuptools3 update-alternatives
-require python-ndg-httpsclient.inc
+
+PYPI_PACKAGE = "ndg_httpsclient"
+
+DEPENDS += " \
+    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-pyasn1 \
+"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-pyasn1 \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
+UPSTREAM_CHECK_REGEX = ""
 
 ALTERNATIVE_${PN} = "ndg_httpclient"
 ALTERNATIVE_LINK_NAME[ndg_httpclient] = "${bindir}/ndg_httpclient"
-- 
2.17.1

