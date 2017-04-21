Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 9E64777B96
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 13:20:24 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v3LDKOo4003861
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 15:20:25 +0200
Received: from dev.sbt.siemens.com ([139.16.73.59])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v3LDKMxO029767;
	Fri, 21 Apr 2017 15:20:24 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Apr 2017 15:20:16 +0200
Message-Id: <1492780816-20242-2-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1492780816-20242-1-git-send-email-pascal.bach@siemens.com>
References: <1492780816-20242-1-git-send-email-pascal.bach@siemens.com>
Subject: [meta-python][PATCH 2/2] python3-pytest-runner: make available for both Python 2 & 3
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
X-List-Received-Date: Fri, 21 Apr 2017 13:20:25 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../recipes-devtools/python/python-pytest-runner.inc    | 17 +++++++++++++++++
 .../python/python-pytest-runner_2.11.1.bb               | 17 ++++-------------
 .../python/python3-pytest-runner_2.11.1.bb              |  2 ++
 3 files changed, 23 insertions(+), 13 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pytest-runner.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-runner_2.11.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pytest-runner.inc b/meta-python/recipes-devtools/python/python-pytest-runner.inc
new file mode 100644
index 0000000..85a8de1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest-runner.inc
@@ -0,0 +1,17 @@
+SUMMARY = "Invoke py.test as distutils command with dependency resolution"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e38b971c2b4c33b978d1b9c9ece9ae63"
+
+SRC_URI[md5sum] = "bdb73eb18eca2727944a2dcf963c5a81"
+SRC_URI[sha256sum] = "983a31eab45e375240e250161a556163bc8d250edaba97960909338c273a89b3"
+
+
+inherit pypi
+
+DEPENDS += " \
+    ${PYTHON_PN}-setuptools-scm-native"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-argparse ${PYTHON_PN}-debugger ${PYTHON_PN}-json \
+                  ${PYTHON_PN}-io"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pytest-runner_2.11.1.bb b/meta-python/recipes-devtools/python/python-pytest-runner_2.11.1.bb
index 188ef2b..0a5055c 100644
--- a/meta-python/recipes-devtools/python/python-pytest-runner_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python-pytest-runner_2.11.1.bb
@@ -1,14 +1,5 @@
-SUMMARY = "Invoke py.test as distutils command with dependency resolution"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e38b971c2b4c33b978d1b9c9ece9ae63"
+inherit setuptools
+require python-pytest-runner.inc
 
-SRC_URI[md5sum] = "bdb73eb18eca2727944a2dcf963c5a81"
-SRC_URI[sha256sum] = "983a31eab45e375240e250161a556163bc8d250edaba97960909338c273a89b3"
-
-DEPENDS += " \
-    python-setuptools-scm"
-
-RDEPENDS_${PN} = "python-py python-setuptools python-argparse python-debugger python-json \
-                  python-compiler python-io"
-
-inherit pypi setuptools
+# Dependency only exists for python2
+RDEPENDS_${PN} += "python-compiler"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_2.11.1.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_2.11.1.bb
new file mode 100644
index 0000000..df56ba6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-runner_2.11.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pytest-runner.inc
-- 
2.1.4


