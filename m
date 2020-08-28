Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.43308.1598622710158230627
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 06:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49752 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBenE-0004K0-GA; Fri, 28 Aug 2020 16:51:49 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-flask-user: Consolidate in a single file
Date: Fri, 28 Aug 2020 16:51:31 +0300
Message-Id: <20200828135131.26321-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828135131.26321-1-leon.anavi@konsulko.com>
References: <20200828135131.26321-1-leon.anavi@konsulko.com>
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
 .../python/python-flask-user.inc              | 17 -----------------
 .../python/python3-flask-user_0.6.19.bb       | 19 ++++++++++++++++++-
 2 files changed, 18 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-user.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-user.inc b/meta-python/recipes-devtools/python/python-flask-user.inc
deleted file mode 100644
index adef32cc8..000000000
--- a/meta-python/recipes-devtools/python/python-flask-user.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Customizable user account management for Flask"
-DESCRIPTION = "Customizable User Account Management for Flask; Register \
-Confirm email, Login, Change username, Change password, Forgot Password \
-and more."
-HOMEPAGE = " https://github.com/lingthio/Flask-User"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
-
-SRC_URI[md5sum] = "f7965e66ca139c8436896da07e66c21f"
-SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
-
-PYPI_PACKAGE = "Flask-User"
-
-RDEPENDS_${PN} = "${PYTHON_PN}-flask \
-    ${PYTHON_PN}-flask-login \
-    ${PYTHON_PN}-flask-mail \
-    ${PYTHON_PN}-babel"
diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index 251017f81..a59019af8 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -1,2 +1,19 @@
+SUMMARY = "Customizable user account management for Flask"
+DESCRIPTION = "Customizable User Account Management for Flask; Register \
+Confirm email, Login, Change username, Change password, Forgot Password \
+and more."
+HOMEPAGE = " https://github.com/lingthio/Flask-User"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
+
+SRC_URI[md5sum] = "f7965e66ca139c8436896da07e66c21f"
+SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
+
+PYPI_PACKAGE = "Flask-User"
+
 inherit pypi setuptools3
-require python-flask-user.inc
+
+RDEPENDS_${PN} = "${PYTHON_PN}-flask \
+    ${PYTHON_PN}-flask-login \
+    ${PYTHON_PN}-flask-mail \
+    ${PYTHON_PN}-babel"
-- 
2.17.1

