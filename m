Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.15264.1598456446965546571
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 08:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50396 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAxXX-0002yf-VG; Wed, 26 Aug 2020 18:40:46 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-flask-socketio: Consolidate in a single file
Date: Wed, 26 Aug 2020 18:40:19 +0300
Message-Id: <20200826154020.29208-5-leon.anavi@konsulko.com>
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
 .../python/python-flask-socketio.inc          | 18 -----------------
 .../python/python3-flask-socketio_4.2.1.bb    | 20 +++++++++++++++++--
 2 files changed, 18 insertions(+), 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-socketio.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-socketio.inc b/meta-python/recipes-devtools/python/python-flask-socketio.inc
deleted file mode 100644
index 8d778d4bf..000000000
--- a/meta-python/recipes-devtools/python/python-flask-socketio.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Socket.IO integration for Flask applications"
-HOMEPAGE = "https://github.com/miguelgrinberg/Flask-SocketIO/"
-SECTION = "devel/python"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=38cc21254909604298ce763a6e4440a0"
-
-inherit pypi
-
-PYPI_PACKAGE = "Flask-SocketIO"
-
-SRC_URI[md5sum] = "b23222fb7dd2f0676d78bbe24153fd80"
-SRC_URI[sha256sum] = "2172dff1e42415ba480cee02c30c2fc833671ff326f1598ee3d69aa02cf768ec"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-flask \
-    ${PYTHON_PN}-socketio \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
index ffc4aa7fd..e5fc54136 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
@@ -1,2 +1,18 @@
-inherit setuptools3
-require python-flask-socketio.inc
+SUMMARY = "Socket.IO integration for Flask applications"
+HOMEPAGE = "https://github.com/miguelgrinberg/Flask-SocketIO/"
+SECTION = "devel/python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=38cc21254909604298ce763a6e4440a0"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "Flask-SocketIO"
+
+SRC_URI[md5sum] = "b23222fb7dd2f0676d78bbe24153fd80"
+SRC_URI[sha256sum] = "2172dff1e42415ba480cee02c30c2fc833671ff326f1598ee3d69aa02cf768ec"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-flask \
+    ${PYTHON_PN}-socketio \
+    "
-- 
2.17.1

