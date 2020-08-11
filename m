Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13102.1597146305156938256
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 04:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37052 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5SiF-0004It-Mw; Tue, 11 Aug 2020 14:45:04 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-flask-login: Consolidate in a single file
Date: Tue, 11 Aug 2020 14:44:29 +0300
Message-Id: <20200811114430.27916-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811114430.27916-1-leon.anavi@konsulko.com>
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-flask-login.inc                | 14 --------------
 .../python/python3-flask-login_0.4.1.bb          | 16 +++++++++++++++-
 2 files changed, 15 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-login.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-login.inc b/meta-python/recipes-devtools/python/python-flask-login.inc
deleted file mode 100644
index 59eb64f77..000000000
--- a/meta-python/recipes-devtools/python/python-flask-login.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "User session management for Flask"
-DESCRIPTION = "Flask-Login provides user session management for Flask. \
-It handles the common tasks of logging in, logging out, and remembering \
-your users’ sessions over extended periods of time."
-HOMEPAGE = " https://github.com/maxcountryman/flask-login"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
-
-SRC_URI[md5sum] = "25b34c74bd509792f291c16e184225df"
-SRC_URI[sha256sum] = "c815c1ac7b3e35e2081685e389a665f2c74d7e077cb93cecabaea352da4752ec"
-
-PYPI_PACKAGE = "Flask-Login"
-
-RDEPENDS_${PN}_class-target = "${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
index 2d23fe167..ba335579b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
@@ -1,2 +1,16 @@
+SUMMARY = "User session management for Flask"
+DESCRIPTION = "Flask-Login provides user session management for Flask. \
+It handles the common tasks of logging in, logging out, and remembering \
+your users’ sessions over extended periods of time."
+HOMEPAGE = " https://github.com/maxcountryman/flask-login"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
+
+SRC_URI[md5sum] = "25b34c74bd509792f291c16e184225df"
+SRC_URI[sha256sum] = "c815c1ac7b3e35e2081685e389a665f2c74d7e077cb93cecabaea352da4752ec"
+
+PYPI_PACKAGE = "Flask-Login"
+
 inherit pypi setuptools3
-require python-flask-login.inc
+
+RDEPENDS_${PN}_class-target = "${PYTHON_PN}-flask"
-- 
2.17.1

