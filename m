Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 44E977D003
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2019 01:35:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x311YxKO011561
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Mar 2019 18:34:59 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 31 Mar 2019 18:34:58 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Apr 2019 09:34:29 +0800
Message-ID: <1554082469-11465-3-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554082469-11465-1-git-send-email-yi.zhao@windriver.com>
References: <1554082469-11465-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-python][PATCH 3/3] python-flask-socketio
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2019 01:35:02 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python-flask-socketio.inc  | 18 ++++++++++++++++++
 .../python/python-flask-socketio_3.3.2.bb              |  2 ++
 .../python/python3-flask-socketio_3.3.2.bb             |  2 ++
 3 files changed, 22 insertions(+)
 create mode 100644 meta-demo/recipes-devtools/python/python-flask-socketio.inc
 create mode 100644 meta-demo/recipes-devtools/python/python-flask-socketio_3.3.2.bb
 create mode 100644 meta-demo/recipes-devtools/python/python3-flask-socketio_3.3.2.bb

diff --git a/meta-demo/recipes-devtools/python/python-flask-socketio.inc b/meta-demo/recipes-devtools/python/python-flask-socketio.inc
new file mode 100644
index 0000000..251d13e
--- /dev/null
+++ b/meta-demo/recipes-devtools/python/python-flask-socketio.inc
@@ -0,0 +1,18 @@
+SUMMARY = "Socket.IO integration for Flask applications"
+HOMEPAGE = "https://github.com/miguelgrinberg/Flask-SocketIO/"
+SECTION = "devel/python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=38cc21254909604298ce763a6e4440a0"
+
+inherit pypi
+
+PYPI_PACKAGE = "Flask-SocketIO"
+
+SRC_URI[md5sum] = "298965a43f6534e8a5b24d1ba1fc4186"
+SRC_URI[sha256sum] = "8d8f9f104db5ddff1b06ba322d8e158881d590144199c993fe26cf53218c7edd"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-flask \
+    ${PYTHON_PN}-socketio \
+    "
diff --git a/meta-demo/recipes-devtools/python/python-flask-socketio_3.3.2.bb b/meta-demo/recipes-devtools/python/python-flask-socketio_3.3.2.bb
new file mode 100644
index 0000000..3b9ad33
--- /dev/null
+++ b/meta-demo/recipes-devtools/python/python-flask-socketio_3.3.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-flask-socketio.inc
diff --git a/meta-demo/recipes-devtools/python/python3-flask-socketio_3.3.2.bb b/meta-demo/recipes-devtools/python/python3-flask-socketio_3.3.2.bb
new file mode 100644
index 0000000..ffc4aa7
--- /dev/null
+++ b/meta-demo/recipes-devtools/python/python3-flask-socketio_3.3.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-flask-socketio.inc
-- 
2.7.4


