Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E33AD7826B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 07:37:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4Q7bdY0022210
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 May 2017 00:37:39 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 26 May 2017 00:37:39 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 May 2017 03:37:31 -0400
Message-ID: <fe84640a1a0b883c0c07c25b9b75f0fab3d9a9c9.1495783956.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1495783956.git.hongxu.jia@windriver.com>
References: <cover.1495783956.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/4] python3-pyudev: add a python3 recipe
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
X-List-Received-Date: Fri, 26 May 2017 07:37:39 -0000
Content-Type: text/plain

- Split to a common python-pyudev.inc for python2 and python3

- The contextlib module is moved to python3-lang.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python-pyudev.inc      | 19 +++++++++++++++++++
 .../python/python-pyudev_0.21.0.bb                 | 22 ++++------------------
 .../python/python3-pyudev_0.21.0.bb                |  8 ++++++++
 3 files changed, 31 insertions(+), 18 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pyudev.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pyudev.inc b/meta-python/recipes-devtools/python/python-pyudev.inc
new file mode 100644
index 0000000..ab4c5fd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyudev.inc
@@ -0,0 +1,19 @@
+SUMMARY = "A libudev binding"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
+SRC_URI[sha256sum] = "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
+
+do_configure_prepend() {
+    sed -i "/import pyudev/d" ${S}/setup.py
+    sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
+}
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-threading \
+"
diff --git a/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
index b0a1acb..32573b7 100644
--- a/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
@@ -1,22 +1,8 @@
-SUMMARY = "A libudev binding"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
-SRC_URI[sha256sum] = "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
-
-inherit pypi setuptools
-
-do_configure_prepend() {
-    sed -i "/import pyudev/d" ${S}/setup.py
-    sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
-}
+require python-pyudev.inc
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-contextlib \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-subprocess \
-    ${PYTHON_PN}-threading \
 "
+
+inherit pypi setuptools
+
diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
new file mode 100644
index 0000000..0292555
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
@@ -0,0 +1,8 @@
+require python-pyudev.inc
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-lang \
+"
+
+inherit pypi setuptools3
+
-- 
2.8.1


