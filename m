Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE1C65CC1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 16:48:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Jul 2014 09:42:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,702,1400050800"; d="scan'208";a="546721304"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 21 Jul 2014 09:48:26 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jul 2014 16:48:20 +0000
Message-Id: <8ac84d2fa6e192a7452cab5814c5877dc104d7e2.1405961300.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH] mercurial: Update mercurial to 3.0.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jul 2014 16:48:32 -0000

Update the mercurial version to 3.0.1.
Update the checksums.
Remove the PR per current best-practice.

This resolves an issue with Mercurial 1.9 where fetching from behind a
proxy breaks with a python stack trace. The current python
httpconnection class no longer has the port setter method.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../mercurial/mercurial-native_1.9.bb              | 27 ----------------------
 .../mercurial/mercurial-native_3.0.1.bb            | 26 +++++++++++++++++++++
 2 files changed, 26 insertions(+), 27 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
 create mode 100644 meta-oe/recipes-devtools/mercurial/mercurial-native_3.0.1.bb

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb b/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
deleted file mode 100644
index 516a9ec..0000000
--- a/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "The Mercurial distributed SCM"
-HOMEPAGE = "http://mercurial.selenic.com/"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "python-native"
-PR = "r2"
-
-SRC_URI = "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz"
-SRC_URI[md5sum] = "d4842129fa2732eb6ed1180467bc32e2"
-SRC_URI[sha256sum] = "711e4b1cd2924a7a88499d6c431a9122390183bf554d4e153edbb3b2f30123e0"
-
-S = "${WORKDIR}/mercurial-${PV}"
-
-inherit native
-
-EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
-    BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} PREFIX=${prefix}"
-
-do_configure_append () {
-    sed -i -e 's:PYTHON=python:PYTHON=${STAGING_BINDIR_NATIVE}/python-native/python:g' ${S}/Makefile
-}
-
-do_install () {
-    oe_runmake -e install-bin DESTDIR=${D} PREFIX=${prefix}
-}
-
diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_3.0.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial-native_3.0.1.bb
new file mode 100644
index 0000000..9a5eebe
--- /dev/null
+++ b/meta-oe/recipes-devtools/mercurial/mercurial-native_3.0.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "The Mercurial distributed SCM"
+HOMEPAGE = "http://mercurial.selenic.com/"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "python-native"
+
+SRC_URI = "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz"
+SRC_URI[md5sum] = "15de301a673b77f839325dba10ed4fc0"
+SRC_URI[sha256sum] = "36e48b59a84ef5a222d06596971e955ac8217e56b076dfb94c8ce5a0c29fd705"
+
+S = "${WORKDIR}/mercurial-${PV}"
+
+inherit native
+
+EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
+    BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} PREFIX=${prefix}"
+
+do_configure_append () {
+    sed -i -e 's:PYTHON=python:PYTHON=${STAGING_BINDIR_NATIVE}/python-native/python:g' ${S}/Makefile
+}
+
+do_install () {
+    oe_runmake -e install-bin DESTDIR=${D} PREFIX=${prefix}
+}
+
-- 
2.0.0


