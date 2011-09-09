Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <errordeveloper@gmail.com>) id 1R21VM-0003Wh-A7
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 15:52:28 +0200
Received: by wwi18 with SMTP id 18so1680755wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 06:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=sq++7KiYI/IynQLBps7VWOmLh7oNHTkMCnEstoV14G4=;
	b=bI4jq5pODc4TdbX9ndfHcwTKoRspQ6fYVtJBWWnzzl/4Pgu93AjlqyCdKq7uSy3uGo
	g+/SuRiJh15v2PPeIk95HDxLS1gw3ppFxDI4rCA2xh87FcXsy18zEz18UAB7ffWP00MM
	L1TP0jG/uMzhZKvxYiolcppxp5v1lPmc2kzKI=
Received: by 10.227.143.66 with SMTP id t2mr2041161wbu.50.1315576029449;
	Fri, 09 Sep 2011 06:47:09 -0700 (PDT)
Received: from localhost.localdomain
	(host86-135-215-249.range86-135.btcentralplus.com [86.135.215.249])
	by mx.google.com with ESMTPS id r3sm1342649wbm.18.2011.09.09.06.47.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 06:47:08 -0700 (PDT)
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2011 15:46:50 +0100
Message-Id: <1315579610-3943-1-git-send-email-errordeveloper@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1315434958-5042-1-git-send-email-errordeveloper@gmail.com>
References: <1315434958-5042-1-git-send-email-errordeveloper@gmail.com>
Subject: [PATCH] binutils: Update from 2.20.1 to 2.20.1a
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
X-List-Received-Date: Fri, 09 Sep 2011 13:52:28 -0000

Signed-off-by: Ilya Dmitrichenko <errordeveloper@gmail.com>
---
 recipes/binutils/binutils-cross-sdk_2.20.1.bb  |    4 ---
 recipes/binutils/binutils-cross-sdk_2.20.1a.bb |    4 +++
 recipes/binutils/binutils-cross_2.20.1.bb      |    4 ---
 recipes/binutils/binutils-cross_2.20.1a.bb     |    4 +++
 recipes/binutils/binutils_2.20.1.bb            |   33 ------------------------
 recipes/binutils/binutils_2.20.1a.bb           |   33 ++++++++++++++++++++++++
 6 files changed, 41 insertions(+), 41 deletions(-)
 delete mode 100644 recipes/binutils/binutils-cross-sdk_2.20.1.bb
 create mode 100644 recipes/binutils/binutils-cross-sdk_2.20.1a.bb
 delete mode 100644 recipes/binutils/binutils-cross_2.20.1.bb
 create mode 100644 recipes/binutils/binutils-cross_2.20.1a.bb
 delete mode 100644 recipes/binutils/binutils_2.20.1.bb
 create mode 100644 recipes/binutils/binutils_2.20.1a.bb

diff --git a/recipes/binutils/binutils-cross-sdk_2.20.1.bb b/recipes/binutils/binutils-cross-sdk_2.20.1.bb
deleted file mode 100644
index 2b1ac30..0000000
--- a/recipes/binutils/binutils-cross-sdk_2.20.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require binutils_${PV}.bb
-require binutils-cross-sdk.inc
-PR = "${INC_PR}.0"
-
diff --git a/recipes/binutils/binutils-cross-sdk_2.20.1a.bb b/recipes/binutils/binutils-cross-sdk_2.20.1a.bb
new file mode 100644
index 0000000..2b1ac30
--- /dev/null
+++ b/recipes/binutils/binutils-cross-sdk_2.20.1a.bb
@@ -0,0 +1,4 @@
+require binutils_${PV}.bb
+require binutils-cross-sdk.inc
+PR = "${INC_PR}.0"
+
diff --git a/recipes/binutils/binutils-cross_2.20.1.bb b/recipes/binutils/binutils-cross_2.20.1.bb
deleted file mode 100644
index ca7fe05..0000000
--- a/recipes/binutils/binutils-cross_2.20.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-FILESPATHPKG =. "binutils-${PV}:"
-require binutils_${PV}.bb
-require binutils-cross.inc
-
diff --git a/recipes/binutils/binutils-cross_2.20.1a.bb b/recipes/binutils/binutils-cross_2.20.1a.bb
new file mode 100644
index 0000000..ca7fe05
--- /dev/null
+++ b/recipes/binutils/binutils-cross_2.20.1a.bb
@@ -0,0 +1,4 @@
+FILESPATHPKG =. "binutils-${PV}:"
+require binutils_${PV}.bb
+require binutils-cross.inc
+
diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binutils_2.20.1.bb
deleted file mode 100644
index 5154e2d..0000000
--- a/recipes/binutils/binutils_2.20.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-require binutils.inc
-LICENSE = "GPLv3"
-
-PR = "${INC_PR}.4"
-EXTRA_OECONF += "--disable-werror"
-
-#COMPATIBLE_TARGET_SYS = "."
-
-SRC_URI = "\
-     ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2;name=tarball \
-     file://binutils-uclibc-100-uclibc-conf.patch \
-     file://110-arm-eabi-conf.patch \
-     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
-     file://binutils-uclibc-300-006_better_file_error.patch \
-     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
-     file://binutils-uclibc-gas-needs-libm.patch \
-     file://binutils-x86_64_i386_biarch.patch \
-     ${@['file://libtool-update.patch','file://libtool-2.4-update.patch'][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == 'yes']} \
-     file://binutils-2.19.1-ld-sysroot.patch \
-     "
-
-SRC_URI_append_nios2 =" \
-	file://binutils-nios2-files.patch \
-	file://binutils-nios2.patch \
-	"
-
-SRC_URI[tarball.sha256sum] = "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53df906498afe6f6f8"
-SRC_URI[tarball.md5sum] = "9cdfb9d6ec0578c166d3beae5e15c4e5"
-
-# powerpc patches
-SRC_URI += "\
-     file://binutils-2.16.1-e300c2c3.patch \
-     "
diff --git a/recipes/binutils/binutils_2.20.1a.bb b/recipes/binutils/binutils_2.20.1a.bb
new file mode 100644
index 0000000..f40b676
--- /dev/null
+++ b/recipes/binutils/binutils_2.20.1a.bb
@@ -0,0 +1,33 @@
+require binutils.inc
+LICENSE = "GPLv3"
+
+PR = "${INC_PR}.4"
+EXTRA_OECONF += "--disable-werror"
+
+#COMPATIBLE_TARGET_SYS = "."
+
+SRC_URI = "\
+     ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2;name=tarball \
+     file://binutils-uclibc-100-uclibc-conf.patch \
+     file://110-arm-eabi-conf.patch \
+     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
+     file://binutils-uclibc-300-006_better_file_error.patch \
+     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
+     file://binutils-uclibc-gas-needs-libm.patch \
+     file://binutils-x86_64_i386_biarch.patch \
+     ${@['file://libtool-update.patch','file://libtool-2.4-update.patch'][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == 'yes']} \
+     file://binutils-2.19.1-ld-sysroot.patch \
+     "
+
+SRC_URI_append_nios2 =" \
+	file://binutils-nios2-files.patch \
+	file://binutils-nios2.patch \
+	"
+
+SRC_URI[tarball.sha256sum] = "71d37c96451333c5c0b84b170169fdcb138bbb27397dc06281905d9717c8ed64"
+SRC_URI[tarball.md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
+
+# powerpc patches
+SRC_URI += "\
+     file://binutils-2.16.1-e300c2c3.patch \
+     "
-- 
1.7.3.4



