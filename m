Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B6737CFCE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2019 01:34:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x311YujJ000078
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Mar 2019 18:34:56 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 31 Mar 2019 18:34:55 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Apr 2019 09:34:28 +0800
Message-ID: <1554082469-11465-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554082469-11465-1-git-send-email-yi.zhao@windriver.com>
References: <1554082469-11465-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-python][PATCH 2/3] python-socketio: add recipe
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
X-List-Received-Date: Mon, 01 Apr 2019 01:34:55 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-demo/recipes-devtools/python/python-socketio.inc   | 17 +++++++++++++++++
 .../recipes-devtools/python/python-socketio_4.0.0.bb    |  2 ++
 .../recipes-devtools/python/python3-socketio_4.0.0.bb   |  2 ++
 3 files changed, 21 insertions(+)
 create mode 100644 meta-demo/recipes-devtools/python/python-socketio.inc
 create mode 100644 meta-demo/recipes-devtools/python/python-socketio_4.0.0.bb
 create mode 100644 meta-demo/recipes-devtools/python/python3-socketio_4.0.0.bb

diff --git a/meta-demo/recipes-devtools/python/python-socketio.inc b/meta-demo/recipes-devtools/python/python-socketio.inc
new file mode 100644
index 0000000..a23e780
--- /dev/null
+++ b/meta-demo/recipes-devtools/python/python-socketio.inc
@@ -0,0 +1,17 @@
+SUMMARY = "Socket.IO server"
+HOMEPAGE = "https://github.com/miguelgrinberg/python-socketio/"
+SECTION = "devel/python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=42d0a9e728978f0eeb759c3be91536b8"
+
+inherit pypi
+
+PYPI_PACKAGE = "python-socketio"
+
+SRC_URI[md5sum] = "0b57da61a9464d2e0dc9a8d0164d86d2"
+SRC_URI[sha256sum] = "64feb0817f1bf7e3e7fc05f6f65e28d76146d8061cb7de25b63502717f80e908"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-engineio \
+    "
diff --git a/meta-demo/recipes-devtools/python/python-socketio_4.0.0.bb b/meta-demo/recipes-devtools/python/python-socketio_4.0.0.bb
new file mode 100644
index 0000000..e25a6b3
--- /dev/null
+++ b/meta-demo/recipes-devtools/python/python-socketio_4.0.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-socketio.inc
diff --git a/meta-demo/recipes-devtools/python/python3-socketio_4.0.0.bb b/meta-demo/recipes-devtools/python/python3-socketio_4.0.0.bb
new file mode 100644
index 0000000..ce83d09
--- /dev/null
+++ b/meta-demo/recipes-devtools/python/python3-socketio_4.0.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-socketio.inc
-- 
2.7.4


