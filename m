Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13574.1598362013965713288
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 06:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56752 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAYyS-0001xr-7s; Tue, 25 Aug 2020 16:26:53 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-flask: Consolidate in a single file
Date: Tue, 25 Aug 2020 16:26:32 +0300
Message-Id: <20200825132633.875-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825132633.875-1-leon.anavi@konsulko.com>
References: <20200825132633.875-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-flask.inc   | 16 ----------------
 .../python/python3-flask_1.1.1.bb              | 18 +++++++++++++++++-
 2 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask.inc

diff --git a/meta-python/recipes-devtools/python/python-flask.inc b/meta-python/recipes-devtools/python/python-flask.inc
deleted file mode 100644
index 1263383da..000000000
--- a/meta-python/recipes-devtools/python/python-flask.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "A microframework based on Werkzeug, Jinja2 and good intentions"
-DESCRIPTION = "\
-Flask is a microframework for Python based on Werkzeug, Jinja 2 and good \
-intentions. And before you ask: It’s BSD licensed!"
-HOMEPAGE = "https://github.com/mitsuhiko/flask/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
-
-SRC_URI[md5sum] = "0e3ed44ece1c489ed835d1b7047e349c"
-SRC_URI[sha256sum] = "13f9f196f330c7c2c5d7a5cf91af894110ca0215ac051b5844701f2bfd934d52"
-
-CLEANBROKEN = "1"
-
-PYPI_PACKAGE = "Flask"
-
-RDEPENDS_${PN} = "${PYTHON_PN}-werkzeug ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous ${PYTHON_PN}-click"
diff --git a/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb b/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
index cd439900c..fbe1ca00e 100644
--- a/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
@@ -1,2 +1,18 @@
+SUMMARY = "A microframework based on Werkzeug, Jinja2 and good intentions"
+DESCRIPTION = "\
+Flask is a microframework for Python based on Werkzeug, Jinja 2 and good \
+intentions. And before you ask: It’s BSD licensed!"
+HOMEPAGE = "https://github.com/mitsuhiko/flask/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
+
+SRC_URI[md5sum] = "0e3ed44ece1c489ed835d1b7047e349c"
+SRC_URI[sha256sum] = "13f9f196f330c7c2c5d7a5cf91af894110ca0215ac051b5844701f2bfd934d52"
+
+PYPI_PACKAGE = "Flask"
+
 inherit pypi setuptools3
-require python-flask.inc
+
+CLEANBROKEN = "1"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-werkzeug ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous ${PYTHON_PN}-click"
-- 
2.17.1

