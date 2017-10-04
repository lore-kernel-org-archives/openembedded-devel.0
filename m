Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 0E67071975
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Oct 2017 12:02:40 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v94C2fMG005219
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 4 Oct 2017 14:02:41 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.76.113])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v94C2fBn008446;
	Wed, 4 Oct 2017 14:02:41 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Oct 2017 14:02:34 +0200
Message-Id: <1507118554-23040-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH] python3-protobuf: add python3 version
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
X-List-Received-Date: Wed, 04 Oct 2017 12:02:41 -0000

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 .../recipes-devtools/python/python-protobuf.inc        | 16 ++++++++++++++++
 .../recipes-devtools/python/python-protobuf_3.4.0.bb   | 18 ++----------------
 .../recipes-devtools/python/python3-protobuf_3.4.0.bb  |  2 ++
 3 files changed, 20 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-protobuf.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-protobuf_3.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
new file mode 100644
index 0000000..2f59ef9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-protobuf.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Protocol Buffers"
+HOMEPAGE = "https://developers.google.com/protocol-buffers/"
+SECTION = "devel/python"
+
+RDEPENDS_${PN} = "python-six"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+
+inherit pypi
+
+SRC_URI[md5sum] = "bfc0c61c156a995e909521697e755780"
+SRC_URI[sha256sum] = "ef02609ef445987976a3a26bff77119c518e0915c96661c3a3b17856d0ef6374"
+
+# For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-protobuf_3.4.0.bb b/meta-python/recipes-devtools/python/python-protobuf_3.4.0.bb
index cde62b7..f04fc48 100644
--- a/meta-python/recipes-devtools/python/python-protobuf_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python-protobuf_3.4.0.bb
@@ -1,16 +1,2 @@
-DESCRIPTION = "Protocol Buffers"
-HOMEPAGE = "https://developers.google.com/protocol-buffers/"
-SECTION = "devel/python"
-
-RDEPENDS_${PN} = "python-six"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
-
-inherit pypi setuptools
-
-SRC_URI[md5sum] = "bfc0c61c156a995e909521697e755780"
-SRC_URI[sha256sum] = "ef02609ef445987976a3a26bff77119c518e0915c96661c3a3b17856d0ef6374"
-
-# For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
-BBCLASSEXTEND = "native"
+inherit setuptools
+require python-protobuf.inc
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.4.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.4.0.bb
new file mode 100644
index 0000000..781d1dc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.4.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-protobuf.inc
-- 
2.1.4


