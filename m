Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93EC6780A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 16:53:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4JGr0w9015882
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 19 May 2017 09:53:01 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 19 May 2017 09:53:00 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <derek@asterius.io>, <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 May 2017 12:52:56 -0400
Message-ID: <1495212776-27436-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495212776-27436-1-git-send-email-mark.asselstine@windriver.com>
References: <1495212776-27436-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/2] python3-zopeinterface: add python3 packaging
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
X-List-Received-Date: Fri, 19 May 2017 16:53:01 -0000
Content-Type: text/plain

Matching what has been done with other python packages, move the
existing recipe into a .inc file and then create python and python3
specific bb files to allow the generation of python2 or python3
versions.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-zopeinterface.inc                 | 20 ++++++++++++++++++++
 .../python/python-zopeinterface_4.3.3.bb            | 21 +--------------------
 .../python/python3-zopeinterface_4.3.3.bb           |  4 ++++
 3 files changed, 25 insertions(+), 20 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-zopeinterface.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-zopeinterface_4.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python-zopeinterface.inc b/meta-python/recipes-devtools/python/python-zopeinterface.inc
new file mode 100644
index 0000000..1ea6114
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-zopeinterface.inc
@@ -0,0 +1,20 @@
+SUMMARY = "Interface definitions for Zope products"
+LICENSE = "ZPL-2.1"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
+
+SRC_URI[md5sum] = "ba3f32eacaea66094b7e2ae2788cec89"
+SRC_URI[sha256sum] = "8780ef68ca8c3fe1abb30c058a59015129d6e04a6b02c2e56b9c7de6078dfa88"
+
+PYPI_PACKAGE = "zope.interface"
+
+PACKAGES =. "${PN}-test "
+
+RPROVIDES_${PN} += "zope-interfaces"
+
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"
+FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.c"
+FILES_${PN}-doc += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.txt"
+FILES_${PN}-test += " \
+        ${PYTHON_SITEPACKAGES_DIR}/zope/interface/tests \
+        ${PYTHON_SITEPACKAGES_DIR}/zope/interface/common/tests \
+"
diff --git a/meta-python/recipes-devtools/python/python-zopeinterface_4.3.3.bb b/meta-python/recipes-devtools/python/python-zopeinterface_4.3.3.bb
index 8ad1250..1bdfd4d 100644
--- a/meta-python/recipes-devtools/python/python-zopeinterface_4.3.3.bb
+++ b/meta-python/recipes-devtools/python/python-zopeinterface_4.3.3.bb
@@ -1,23 +1,4 @@
-SUMMARY = "Interface definitions for Zope products"
-LICENSE = "ZPL-2.1"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
-
-SRC_URI[md5sum] = "ba3f32eacaea66094b7e2ae2788cec89"
-SRC_URI[sha256sum] = "8780ef68ca8c3fe1abb30c058a59015129d6e04a6b02c2e56b9c7de6078dfa88"
-
-PYPI_PACKAGE = "zope.interface"
 inherit pypi setuptools
-
-PACKAGES =. "${PN}-test "
-
-RPROVIDES_${PN} += "zope-interfaces"
+require python-zopeinterface.inc
 
 RDEPENDS_${PN}-test += "python-unittest python-doctest"
-
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"
-FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.c"
-FILES_${PN}-doc += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.txt"
-FILES_${PN}-test += " \
-        ${PYTHON_SITEPACKAGES_DIR}/zope/interface/tests \
-        ${PYTHON_SITEPACKAGES_DIR}/zope/interface/common/tests \
-"
diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_4.3.3.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_4.3.3.bb
new file mode 100644
index 0000000..be11858
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_4.3.3.bb
@@ -0,0 +1,4 @@
+inherit pypi setuptools3
+require python-zopeinterface.inc
+
+RDEPENDS_${PN}-test += "python3-unittest python3-doctest"
-- 
2.7.4


