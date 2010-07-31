Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Of4iZ-0005uW-6R
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 07:34:45 +0200
Received: by pzk2 with SMTP id 2so830764pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 22:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=pGHl376nwntbekKzpE04XylnJQSjHSkwenUtqN2s6ns=;
	b=D2N2EsawV8yjtyIXrdCfDM7GTw0EQ8r8rpoTblBaZ15daOUkY48Pg52LfLAuycwzbf
	3qS/uy76z8bm2+YzECFGLd0+gaJSrXeEbxCBWPD4QAXJYQ6RIeYwj1Dc0lb/Qv8+TVhz
	V9rc4mpaXrCAk4hRZlkmxJRhssvRSk00iXNvE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TEpu6hAB8GGIOSw2w9Qtq3JbWJqFWi40gC3nEsuFXzZjWVTY7iKmVP1N1bhjPptOrJ
	8X8rSWcdq+YpEzldEC/nXT40WCIjcgKLri18KtDeM6fyFt1z7pL0hEPt9Zj9bbKRB0L9
	QHYInSbhZ79ixcMq8FXLg4wmL6uXeSHZfTdRI=
Received: by 10.114.103.8 with SMTP id a8mr3551364wac.159.1280554458098;
	Fri, 30 Jul 2010 22:34:18 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n32sm5308381wag.23.2010.07.30.22.34.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 30 Jul 2010 22:34:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 22:34:07 -0700
Message-Id: <1280554451-27780-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/5] bitbake.conf, cmake.bbclass, cross.bbclass, icecc.bbclass: Point the toolchain paths to new multi-machine friendly toolchain install location.
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
X-List-Received-Date: Sat, 31 Jul 2010 05:34:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/cmake.bbclass |    2 +-
 classes/cross.bbclass |    4 ++--
 classes/icecc.bbclass |    6 +++---
 conf/bitbake.conf     |    5 ++---
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index 2376012..4d53e47 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -37,7 +37,7 @@ cmake_do_generate_toolchain_file() {
 
 # only search in the paths provided (from openembedded) so cmake doesnt pick
 # up libraries and tools from the native build machine
-  echo "set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${STAGING_DIR_NATIVE}${prefix_native} )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${STAGING_DIR_NATIVE}${prefix_native}/${BASE_PACKAGE_ARCH} )" >> ${WORKDIR}/toolchain.cmake
   echo "set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )" >> ${WORKDIR}/toolchain.cmake
   echo "set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )" >> ${WORKDIR}/toolchain.cmake
   echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )" >> ${WORKDIR}/toolchain.cmake
diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index db86192..99f4ede 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -44,9 +44,9 @@ target_base_libdir := "${base_libdir}"
 target_prefix := "${prefix}"
 
 # Overrides for paths
-prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 base_prefix = "${STAGING_DIR_NATIVE}"
-exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
+prefix = "${base_prefix}${prefix_native}/${BASE_PACKAGE_ARCH}"
+exec_prefix = "${prefix}"
 base_sbindir = "${base_prefix}/bin"
 sbindir = "${exec_prefix}/bin"
 
diff --git a/classes/icecc.bbclass b/classes/icecc.bbclass
index 938f199..cd5a25b 100644
--- a/classes/icecc.bbclass
+++ b/classes/icecc.bbclass
@@ -46,7 +46,7 @@ def create_cross_env(bb,d):
         return ""
 
     import tarfile, socket, time
-    ice_dir = bb.data.expand('${STAGING_DIR_NATIVE}${prefix_native}', d)
+    ice_dir = bb.data.expand('${STAGING_DIR_NATIVE}${prefix_native}/${BASE_PACKAGE_ARCH}', d)
     staging_dir = bb.data.expand('${STAGING_DIR_TARGET}', d)
     prefix  = bb.data.expand('${HOST_PREFIX}' , d)
     distro  = bb.data.expand('${DISTRO}', d)
@@ -96,7 +96,7 @@ def create_cross_env(bb,d):
 
 def create_native_env(bb,d):
     import tarfile, socket, time
-    ice_dir = bb.data.expand('${STAGING_DIR_NATIVE}${prefix_native}', d)
+    ice_dir = bb.data.expand('${STAGING_DIR_NATIVE}${prefix_native}/${BASE_PACKAGE_ARCH}', d)
     prefix  = bb.data.expand('${HOST_PREFIX}' , d)
     distro  = bb.data.expand('${DISTRO}', d)
     target_sys = bb.data.expand('${TARGET_SYS}',  d)
@@ -143,7 +143,7 @@ def get_cross_kernel_cc(bb,d):
 
 def create_cross_kernel_env(bb,d):
     import tarfile, socket, time
-    ice_dir = bb.data.expand('${STAGING_DIR_NATIVE}${prefix_native}', d)
+    ice_dir = bb.data.expand('${STAGING_DIR_NATIVE}${prefix_native}/${BASE_PACKAGE_ARCH}', d)
     prefix  = bb.data.expand('${HOST_PREFIX}' , d)
     distro  = bb.data.expand('${DISTRO}', d)
     target_sys = bb.data.expand('${TARGET_SYS}',  d)
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index d523519..8ddba15 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -299,8 +299,7 @@ STAGING_DIR_JAVA = "${STAGING_DIR}/java"
 STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
 STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
 STAGING_SBINDIR_NATIVE = "${STAGING_DIR_NATIVE}${sbindir_native}"
-STAGING_BINDIR_CROSS  = "${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"
-STAGING_BINDIR_CROSS_BASEPKG = "${STAGING_DIR_NATIVE}${bindir_native}/${BASEPKG_TARGET_SYS}"
+STAGING_BINDIR_CROSS  = "${STAGING_DIR_NATIVE}${prefix_native}/${BASE_PACKAGE_ARCH}${base_bindir_native}"
 STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdir_native}"
 STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${includedir_native}"
 STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${sysconfdir_native}"
@@ -419,7 +418,7 @@ export PATH
 
 CCACHE ?= ""
 TOOLCHAIN_OPTIONS = ""
-TOOLCHAIN_PATH ?= "${STAGING_DIR_NATIVE}${prefix_native}"
+TOOLCHAIN_PATH ?= "${STAGING_DIR_NATIVE}${prefix_native}/${BASE_PACKAGE_ARCH}"
 TOOLCHAIN_SYSPATH ?= "${TOOLCHAIN_PATH}/${TARGET_SYS}"
 
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-- 
1.7.1



