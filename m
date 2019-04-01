Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC8C7D010
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2019 01:35:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x311YgU1010532
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Mar 2019 18:34:53 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 31 Mar 2019 18:34:31 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Apr 2019 09:34:27 +0800
Message-ID: <1554082469-11465-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-python][PATCH 1/3] python-engineio: add recipe
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
X-List-Received-Date: Mon, 01 Apr 2019 01:35:03 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-demo/recipes-devtools/python/python-engineio.inc       | 13 +++++++++++++
 meta-demo/recipes-devtools/python/python-engineio_3.5.0.bb  |  2 ++
 meta-demo/recipes-devtools/python/python3-engineio_3.5.0.bb |  2 ++
 3 files changed, 17 insertions(+)
 create mode 100644 meta-demo/recipes-devtools/python/python-engineio.inc
 create mode 100644 meta-demo/recipes-devtools/python/python-engineio_3.5.0.bb
 create mode 100644 meta-demo/recipes-devtools/python/python3-engineio_3.5.0.bb

diff --git a/meta-demo/recipes-devtools/python/python-engineio.inc b/meta-demo/recipes-devtools/python/python-engineio.inc
new file mode 100644
index 0000000..c399d7d
--- /dev/null
+++ b/meta-demo/recipes-devtools/python/python-engineio.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Engine.IO server"
+HOMEPAGE = "https://github.com/miguelgrinberg/python-engineio/"
+SECTION = "devel/python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=42d0a9e728978f0eeb759c3be91536b8"
+
+inherit pypi
+
+PYPI_PACKAGE = "python-engineio"
+
+SRC_URI[md5sum] = "011a61f1ee84755043cf862c8cc24f21"
+SRC_URI[sha256sum] = "b2756ce53076163eb24f59c1d1a903ac72f071ad4fb7b3ef6dab1b1b9ae9a44f"
diff --git a/meta-demo/recipes-devtools/python/python-engineio_3.5.0.bb b/meta-demo/recipes-devtools/python/python-engineio_3.5.0.bb
new file mode 100644
index 0000000..7dd6ec0
--- /dev/null
+++ b/meta-demo/recipes-devtools/python/python-engineio_3.5.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-engineio.inc
diff --git a/meta-demo/recipes-devtools/python/python3-engineio_3.5.0.bb b/meta-demo/recipes-devtools/python/python3-engineio_3.5.0.bb
new file mode 100644
index 0000000..028d110
--- /dev/null
+++ b/meta-demo/recipes-devtools/python/python3-engineio_3.5.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-engineio.inc
-- 
2.7.4


