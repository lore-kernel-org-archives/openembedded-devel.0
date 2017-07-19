Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id A2A2378301
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 15:33:50 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v6JFXpDZ030713
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 19 Jul 2017 17:33:51 +0200
Received: from dev.sbt.siemens.com ([139.16.24.9])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v6JFXoJ3016027;
	Wed, 19 Jul 2017 17:33:50 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jul 2017 17:33:46 +0200
Message-Id: <1500478426-18392-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-oe][PATCH] python-requests, python3-requests: update to 2.28.1
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
X-List-Received-Date: Wed, 19 Jul 2017 15:33:51 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

The copyright year changed in the license file.

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-requests.inc        | 10 +++++++---
 .../{python-requests_2.13.0.bb => python-requests_2.18.1.bb}   |  2 +-
 .../{python3-requests_2.13.0.bb => python3-requests_2.18.1.bb} |  2 +-
 3 files changed, 9 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python-requests_2.13.0.bb => python-requests_2.18.1.bb} (73%)
 rename meta-python/recipes-devtools/python/{python3-requests_2.13.0.bb => python3-requests_2.18.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index b66f66e..81819bf 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -1,10 +1,12 @@
 DESCRIPTION = "Python HTTP for Humans."
 HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d9bb3515869c0f426cb8441c899ae7f5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=979d6a23b143e13ea0e5e3aa81248820"
 
-SRC_URI[md5sum] = "921ec6b48f2ddafc8bb6160957baf444"
-SRC_URI[sha256sum] = "5722cd09762faa01276230270ff16af7acf7c5c45d623868d9ba116f15791ce8"
+SRC_URI[md5sum] = "40f723ed01dddeaf990d0609d073f021"
+SRC_URI[sha256sum] = "c6f3bdf4a4323ac7b45d01e04a6f6c20e32a052cd04de81e05103abc049ad9b9"
+
+inherit pypi
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-email \
@@ -15,6 +17,8 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-pyopenssl \
     ${PYTHON_PN}-pysocks \
     ${PYTHON_PN}-urllib3 \
+    ${PYTHON_PN}-chardet \
+    ${PYTHON_PN}-idna \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-requests_2.13.0.bb b/meta-python/recipes-devtools/python/python-requests_2.18.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python-requests_2.13.0.bb
rename to meta-python/recipes-devtools/python/python-requests_2.18.1.bb
index 627bc95..0d7a29f 100644
--- a/meta-python/recipes-devtools/python/python-requests_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python-requests_2.18.1.bb
@@ -1,4 +1,4 @@
-inherit pypi setuptools
+inherit setuptools
 require python-requests.inc
 
 RDEPENDS_${PN} += "${PYTHON_PN}-zlib"
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.13.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.18.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-requests_2.13.0.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.18.1.bb
index 5e869b7..d91d993 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.18.1.bb
@@ -1,4 +1,4 @@
-inherit pypi setuptools3
+inherit setuptools3
 require python-requests.inc
 
 # Add the runtime depends for selectors.py
-- 
2.1.4


