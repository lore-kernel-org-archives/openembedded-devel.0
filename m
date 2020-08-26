Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.15055.1598456440609813408
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 08:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50396 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAxXS-0002yf-0Q; Wed, 26 Aug 2020 18:40:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-flask-wtf: Consolidate in a single file
Date: Wed, 26 Aug 2020 18:40:17 +0300
Message-Id: <20200826154020.29208-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826154020.29208-1-leon.anavi@konsulko.com>
References: <20200826154020.29208-1-leon.anavi@konsulko.com>
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
 .../python/python-flask-wtf.inc                 | 15 ---------------
 .../python/python3-flask-wtf_0.14.2.bb          | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-wtf.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-wtf.inc b/meta-python/recipes-devtools/python/python-flask-wtf.inc
deleted file mode 100644
index 863671153..000000000
--- a/meta-python/recipes-devtools/python/python-flask-wtf.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Simple integration of Flask and WTForms."
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80"
-
-SRC_URI[md5sum] = "586f50f233926cade42e3d744aca3e8f"
-SRC_URI[sha256sum] = "5d14d55cfd35f613d99ee7cba0fc3fbbe63ba02f544d349158c14ca15561cc36"
-
-PYPI_PACKAGE = "Flask-WTF"
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-flask \
-    ${PYTHON_PN}-itsdangerous \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-wtforms \
-"
diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
index 52362a865..33387045e 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
@@ -1,2 +1,17 @@
+DESCRIPTION = "Simple integration of Flask and WTForms."
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80"
+
+SRC_URI[md5sum] = "586f50f233926cade42e3d744aca3e8f"
+SRC_URI[sha256sum] = "5d14d55cfd35f613d99ee7cba0fc3fbbe63ba02f544d349158c14ca15561cc36"
+
+PYPI_PACKAGE = "Flask-WTF"
+
 inherit pypi setuptools3
-require python-flask-wtf.inc
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-flask \
+    ${PYTHON_PN}-itsdangerous \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-wtforms \
+"
-- 
2.17.1

