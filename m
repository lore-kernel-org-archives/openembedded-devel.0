Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 941D577B96
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 13:20:21 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v3LDKM6l029965
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 15:20:22 +0200
Received: from dev.sbt.siemens.com ([139.16.73.59])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v3LDKMxN029767;
	Fri, 21 Apr 2017 15:20:22 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Apr 2017 15:20:15 +0200
Message-Id: <1492780816-20242-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-python][PATCH 1/2] python3-setuptools-scm: make version available for both Python 2 & 3
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
X-List-Received-Date: Fri, 21 Apr 2017 13:20:23 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../recipes-devtools/python/python-setuptools-scm.inc   | 14 ++++++++++++++
 .../python/python-setuptools-scm_1.15.0.bb              | 17 ++---------------
 .../python/python3-setuptools-scm_1.15.0.bb             |  2 ++
 3 files changed, 18 insertions(+), 15 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-setuptools-scm.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-setuptools-scm_1.15.0.bb

diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm.inc b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
new file mode 100644
index 0000000..3249870
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
@@ -0,0 +1,14 @@
+SUMMARY = "the blessed package to manage your versions by scm tags"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
+
+SRC_URI[md5sum] = "b6916c78ed6253d6602444fad4279c5b"
+SRC_URI[sha256sum] = "daf12d05aa2155a46aa357453757ffdc47d87f839e62114f042bceac6a619e2f"
+
+PYPI_PACKAGE = "setuptools_scm"
+inherit pypi
+
+RDEPENDS_${PN}_class-target = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-argparse ${PYTHON_PN}-debugger ${PYTHON_PN}-json"
+RDEPENDS_${PN}_class-native = "${PYTHON_PN}-setuptools-native"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
index 08008ce..5f9bb0b 100644
--- a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
@@ -1,15 +1,2 @@
-SUMMARY = "the blessed package to manage your versions by scm tags"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
-
-SRC_URI[md5sum] = "b6916c78ed6253d6602444fad4279c5b"
-SRC_URI[sha256sum] = "daf12d05aa2155a46aa357453757ffdc47d87f839e62114f042bceac6a619e2f"
-
-PYPI_PACKAGE = "setuptools_scm"
-
-RDEPENDS_${PN}_class-target = "python-py python-setuptools python-argparse python-debugger python-json"
-RDEPENDS_${PN}_class-native = "python-setuptools-native"
-
-BBCLASSEXTEND = "native"
-
-inherit pypi setuptools
+inherit setuptools
+require python-setuptools-scm.inc
diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_1.15.0.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_1.15.0.bb
new file mode 100644
index 0000000..5bf5983
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-setuptools-scm_1.15.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-setuptools-scm.inc
-- 
2.1.4


