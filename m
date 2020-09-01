Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.8494.1598947925628273308
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 01:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39232 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kD1Od-0002Vq-Io; Tue, 01 Sep 2020 11:12:04 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-flask-pymongo: Consolidate in a single file
Date: Tue,  1 Sep 2020 11:11:47 +0300
Message-Id: <20200901081147.13556-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901081147.13556-1-leon.anavi@konsulko.com>
References: <20200901081147.13556-1-leon.anavi@konsulko.com>
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
 .../python/python-flask-pymongo.inc             | 15 ---------------
 .../python/python3-flask-pymongo_2.3.0.bb       | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-pymongo.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo.inc b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
deleted file mode 100644
index 5fc35c193..000000000
--- a/meta-python/recipes-devtools/python/python-flask-pymongo.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "PyMongo support for Flask applications"
-DESCRIPTION = "PyMongo support for Flask applications."
-HOMEPAGE = "https://github.com/mitsuhiko/flask/"
-SECTION = "devel/python"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;beginline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d"
-
-SRC_URI[md5sum] = "94df71e6800b1d7915cc91a74b70f959"
-SRC_URI[sha256sum] = "620eb02dc8808a5fcb90f26cab6cba9d6bf497b15032ae3ca99df80366e33314"
-
-PYPI_PACKAGE = "Flask-PyMongo"
-
-DEPENDS = "${PYTHON_PN}-vcversioner ${PYTHON_PN}-vcversioner-native"
-
-RDEPENDS_${PN} = "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
index 2102554b6..e3c744d92 100644
--- a/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
@@ -1,2 +1,17 @@
+SUMMARY = "PyMongo support for Flask applications"
+DESCRIPTION = "PyMongo support for Flask applications."
+HOMEPAGE = "https://github.com/mitsuhiko/flask/"
+SECTION = "devel/python"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;beginline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d"
+
+SRC_URI[md5sum] = "94df71e6800b1d7915cc91a74b70f959"
+SRC_URI[sha256sum] = "620eb02dc8808a5fcb90f26cab6cba9d6bf497b15032ae3ca99df80366e33314"
+
+PYPI_PACKAGE = "Flask-PyMongo"
+
 inherit pypi setuptools3
-require python-flask-pymongo.inc
+
+DEPENDS = "${PYTHON_PN}-vcversioner ${PYTHON_PN}-vcversioner-native"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
-- 
2.17.1

