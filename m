Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1SDDBd-0005kH-7y
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 13:06:37 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id 146D8F8121B; Thu, 29 Mar 2012 04:57:35 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Mar 2012 04:57:30 -0600
Message-Id: <1333018650-987-2-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1333018650-987-1-git-send-email-gary@mlbassoc.com>
References: <1333018650-987-1-git-send-email-gary@mlbassoc.com>
Subject: [meta-oe 2/2] python-zopeinterface: update to latest upstream version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2012 11:06:37 -0000

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .../python/python-zopeinterface_3.5.1.bb           |   22 --------------------
 .../python/python-zopeinterface_3.8.0.bb           |   22 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 22 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-zopeinterface_3.8.0.bb

diff --git a/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb b/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb
deleted file mode 100644
index 106e836..0000000
--- a/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Interface definitions for Zope products"
-SECTION = "console/network"
-
-LICENSE = "ZPL-2.1"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
-
-SRC_URI = "http://pypi.python.org/packages/source/z/zope.interface/zope.interface-${PV}.tar.gz"
-SRC_URI[md5sum] = "685fc532550abb07cca6190c9cd2b901"
-SRC_URI[sha256sum] = "b81d898532c47f73475c2d0c23580e289eed25923d007eca8e62750c0998bba0"
-
-S = "${WORKDIR}/zope.interface-${PV}"
-
-inherit setuptools
-
-RPROVIDES_${PN} += "zope-interfaces"
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"
-FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.c"
-FILES_${PN}-doc += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.txt"
-FILES_${PN}-tests = " \
-        ${PYTHON_SITEPACKAGES_DIR}/zope/interface/tests \
-        ${PYTHON_SITEPACKAGES_DIR}/zope/interface/common/tests \
-"
diff --git a/meta-oe/recipes-devtools/python/python-zopeinterface_3.8.0.bb b/meta-oe/recipes-devtools/python/python-zopeinterface_3.8.0.bb
new file mode 100644
index 0000000..106e836
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-zopeinterface_3.8.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Interface definitions for Zope products"
+SECTION = "console/network"
+
+LICENSE = "ZPL-2.1"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
+
+SRC_URI = "http://pypi.python.org/packages/source/z/zope.interface/zope.interface-${PV}.tar.gz"
+SRC_URI[md5sum] = "685fc532550abb07cca6190c9cd2b901"
+SRC_URI[sha256sum] = "b81d898532c47f73475c2d0c23580e289eed25923d007eca8e62750c0998bba0"
+
+S = "${WORKDIR}/zope.interface-${PV}"
+
+inherit setuptools
+
+RPROVIDES_${PN} += "zope-interfaces"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"
+FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.c"
+FILES_${PN}-doc += "${PYTHON_SITEPACKAGES_DIR}/zope/interface/*.txt"
+FILES_${PN}-tests = " \
+        ${PYTHON_SITEPACKAGES_DIR}/zope/interface/tests \
+        ${PYTHON_SITEPACKAGES_DIR}/zope/interface/common/tests \
+"
-- 
1.7.7.6



