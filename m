Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7052E616C7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 15:04:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01NF3lQk020811
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 07:04:08 -0800
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 23 Feb 2020 07:03:45 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 23 Feb 2020 23:03:43 +0800
Message-ID: <20200223150343.16458-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [meta-python][PATCH] python3-networkx: upgrade 2.3 -> 2.4
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
X-List-Received-Date: Sun, 23 Feb 2020 15:04:17 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-python/recipes-devtools/python/python-networkx.inc   | 2 --
 .../recipes-devtools/python/python3-networkx_2.3.bb       | 8 --------
 .../recipes-devtools/python/python3-networkx_2.4.bb       | 8 ++++++++
 3 files changed, 8 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-networkx_2.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-networkx_2.4.bb

diff --git a/meta-python/recipes-devtools/python/python-networkx.inc b/meta-python/recipes-devtools/python/python-networkx.inc
index a4c31b2b2..4bca636dc 100644
--- a/meta-python/recipes-devtools/python/python-networkx.inc
+++ b/meta-python/recipes-devtools/python/python-networkx.inc
@@ -3,8 +3,6 @@ LICENSE = "BSD-3-Clause"
 
 inherit pypi
 
-PYPI_PACKAGE_EXT = "zip"
-
 RDEPENDS_${PN} += "\
                    ${PYTHON_PN}-decorator \
                    "
diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.3.bb b/meta-python/recipes-devtools/python/python3-networkx_2.3.bb
deleted file mode 100644
index 8feb6daa3..000000000
--- a/meta-python/recipes-devtools/python/python3-networkx_2.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require python-networkx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b68290ee1026b204170a23bbdb27a4fd"
-
-SRC_URI[md5sum] = "320d3f6c7872732baa63cedafddadea9"
-SRC_URI[sha256sum] = "8311ddef63cf5c5c5e7c1d0212dd141d9a1fe3f474915281b73597ed5f1d4e3d"
-
-inherit setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.4.bb b/meta-python/recipes-devtools/python/python3-networkx_2.4.bb
new file mode 100644
index 000000000..efa82e21c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.4.bb
@@ -0,0 +1,8 @@
+require python-networkx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b68290ee1026b204170a23bbdb27a4fd"
+
+SRC_URI[md5sum] = "63e3fdc9d3a46bcabc776acc5ea5fe48"
+SRC_URI[sha256sum] = "f8f4ff0b6f96e4f9b16af6b84622597b5334bf9cae8cf9b2e42e7985d5c95c64"
+
+inherit setuptools3
-- 
2.17.1


