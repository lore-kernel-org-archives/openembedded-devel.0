Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id AEB1771B32
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Oct 2017 12:03:50 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v94C3pfF011826
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 4 Oct 2017 14:03:51 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.76.113])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v94C3pTS024676;
	Wed, 4 Oct 2017 14:03:51 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Oct 2017 14:03:49 +0200
Message-Id: <1507118629-23176-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH] python3-ujson: support Python 3
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
X-List-Received-Date: Wed, 04 Oct 2017 12:03:51 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-ujson.inc    | 15 +++++++++++++++
 .../recipes-devtools/python/python-ujson_1.35.bb        | 17 ++---------------
 .../recipes-devtools/python/python3-ujson_1.35.bb       |  2 ++
 3 files changed, 19 insertions(+), 15 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-ujson.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-ujson_1.35.bb

diff --git a/meta-python/recipes-devtools/python/python-ujson.inc b/meta-python/recipes-devtools/python/python-ujson.inc
new file mode 100644
index 0000000..9654d5a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ujson.inc
@@ -0,0 +1,15 @@
+SUMMARY  = "Ultra fast JSON encoder and decoder for Python"
+DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3."
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;startline=8;endline=9;md5=4f369b3c3c290b4aede8796a4065e5ab"
+
+SRC_URI[md5sum] = "42f77b0cce686dfa4da2e68480b1dd24"
+SRC_URI[sha256sum] = "f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86"
+
+inherit pypi
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-numbers \
+    "
diff --git a/meta-python/recipes-devtools/python/python-ujson_1.35.bb b/meta-python/recipes-devtools/python/python-ujson_1.35.bb
index 238dc92..b3c6ae6 100644
--- a/meta-python/recipes-devtools/python/python-ujson_1.35.bb
+++ b/meta-python/recipes-devtools/python/python-ujson_1.35.bb
@@ -1,15 +1,2 @@
-SUMMARY  = "Ultra fast JSON encoder and decoder for Python"
-DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3."
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;startline=8;endline=9;md5=4f369b3c3c290b4aede8796a4065e5ab"
-
-SRC_URI[md5sum] = "42f77b0cce686dfa4da2e68480b1dd24"
-SRC_URI[sha256sum] = "f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-numbers \
-    "
+inherit setuptools
+require python-ujson.inc
diff --git a/meta-python/recipes-devtools/python/python3-ujson_1.35.bb b/meta-python/recipes-devtools/python/python3-ujson_1.35.bb
new file mode 100644
index 0000000..ae4cc0a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ujson_1.35.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-ujson.inc
-- 
2.1.4


