Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 15E3C60123
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jan 2017 09:33:22 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v099XMad015452
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 9 Jan 2017 10:33:23 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.79.145])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v099XMMx007595;
	Mon, 9 Jan 2017 10:33:22 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jan 2017 10:33:17 +0100
Message-Id: <1483954397-4175-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH] python-sqlalchemy: update to 1.1.4 and provide python2 and python3 package
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
X-List-Received-Date: Mon, 09 Jan 2017 09:33:23 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

The license hash change is due to a bump in the copyright year

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-sqlalchemy.inc  | 13 +++++++++++++
 .../recipes-devtools/python/python-sqlalchemy_0.7.9.bb     | 14 --------------
 .../recipes-devtools/python/python-sqlalchemy_1.1.4.bb     |  2 ++
 .../recipes-devtools/python/python3-sqlalchemy_1.1.4.bb    |  2 ++
 4 files changed, 17 insertions(+), 14 deletions(-)
 create mode 100755 meta-python/recipes-devtools/python/python-sqlalchemy.inc
 delete mode 100644 meta-python/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
 create mode 100755 meta-python/recipes-devtools/python/python-sqlalchemy_1.1.4.bb
 create mode 100755 meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.4.bb

diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
new file mode 100755
index 0000000..471c109
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
+application developers the full power and flexibility of SQL"
+HOMEPAGE = "http://www.sqlalchemy.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d7dba1721bc8ce05d421f7279cb87971"
+
+PYPI_PACKAGE = "SQLAlchemy"
+inherit pypi
+
+SRC_URI[md5sum] = "be5af1bebe595206b71b513a14836e4f"
+SRC_URI[sha256sum] = "701b57d628b9fa1cfb82f10665e7214d5d2db23251ca6f23b91c5f56fcdbdeb5"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-numbers"
diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_0.7.9.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
deleted file mode 100644
index 43b4b7e..0000000
--- a/meta-python/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
-application developers the full power and flexibility of SQL"
-HOMEPAGE = "http://www.sqlalchemy.org/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=baffc5e5f4804c92fc9be155fed70d41"
-RDEPENDS_${PN} += "python-numbers"
-
-SRCNAME = "SQLAlchemy"
-SRC_URI = "${SOURCEFORGE_MIRROR}/sqlalchemy/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "c4852d586d95a59fbc9358f4467875d5"
-SRC_URI[sha256sum] = "f7a305ad122144f364ce09a2d9ed5159d5f46ec43650653593e7dfa05d3294a1"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.4.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.4.bb
new file mode 100755
index 0000000..53c8fec
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-sqlalchemy.inc
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.4.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.4.bb
new file mode 100755
index 0000000..86cf9ed
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-sqlalchemy.inc
-- 
2.1.4


