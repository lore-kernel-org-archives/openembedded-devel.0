Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC77-0007Go-7B
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:56:33 +0200
Received: from localhost (077233226018.hef.nianet.dk [77.233.226.18] (may be
	forged))
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m97CpkoK021263;
	Tue, 7 Oct 2008 14:51:51 +0200
Received: from esben by localhost with local (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>)
	id 1KnC2U-000157-DB; Tue, 07 Oct 2008 14:51:46 +0200
From: eha@doredevelopment.dk
To: openembedded-devel@openembedded.org
Date: Tue,  7 Oct 2008 14:51:38 +0200
Message-Id: <d01d019899790eefd7fb6742174f2c359022b4fa.1223383759.git.eha@doredevelopment.dk>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <2c0637f3c20a6f84ea03f1fdb9212b970ef9c371.1223383759.git.eha@doredevelopment.dk>
References: <> <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
	<b011d8abd4dd7f517da3f835736cce56a1acd919.1223383759.git.eha@doredevelopment.dk>
	<c00c0e996ed9eff33dae83236a28a88f6bcf9a73.1223383759.git.eha@doredevelopment.dk>
	<2c0637f3c20a6f84ea03f1fdb9212b970ef9c371.1223383759.git.eha@doredevelopment.dk>
In-Reply-To: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
Cc: Esben Haabendal <eha@doredevelopment.dk>
Subject: [PATCH 05/13] bitbake.conf: prepare for canadian sdk support
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
X-List-Received-Date: Tue, 07 Oct 2008 12:56:33 -0000

From: Esben Haabendal <eha@doredevelopment.dk>

* rename SDK_PREFIX to SDK_PATH
* add various SDK_* variables
* add sdk-${SDK_OS} to OVERRIDES
* sdk.bbclass fixed for change from SDK_PREFIX to SDK_PATH

Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 classes/sdk.bbclass                 |    2 +-
 conf/bitbake.conf                   |   20 ++++++++++++++++++--
 packages/meta/external-toolchain.bb |    2 +-
 packages/meta/meta-toolchain.bb     |    4 ++--
 4 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/classes/sdk.bbclass b/classes/sdk.bbclass
index b746426..3897349 100644
--- a/classes/sdk.bbclass
+++ b/classes/sdk.bbclass
@@ -19,7 +19,7 @@ CXXFLAGS = "${BUILD_CFLAGS}"
 LDFLAGS = "${BUILD_LDFLAGS}"
 
 # Path prefixes
-prefix = "${SDK_PREFIX}"
+prefix = "${SDK_PATH}"
 exec_prefix = "${prefix}"
 base_prefix = "${prefix}"
 
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 51a18fd..3a8a12c 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -89,6 +89,14 @@ TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = ""
 TARGET_EXEEXT = ""
 
+SDK_ARCH ?= "${BUILD_ARCH}"
+SDK_OS ?= "${BUILD_OS}"
+SDK_VENDOR ?= "${BUILD_VENDOR}"
+SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK_OS', d, 1), ''][bb.data.getVar('SDK_OS', d, 1) == ('' or 'custom')]}"
+SDK_PREFIX = "${SDK_SYS}-"
+SDK_CC_ARCH ?= "${BUILD_CC_ARCH}"
+SDK_EXEEXT = ""
+
 BASE_PACKAGE_ARCH = "${HOST_ARCH}"
 PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
 MACHINE_ARCH = "${@[bb.data.getVar('HOST_ARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))]}"
@@ -255,6 +263,8 @@ STAGING_LOADER_DIR = "${STAGING_DIR_HOST}/loader"
 STAGING_FIRMWARE_DIR = "${STAGING_DIR_HOST}/firmware"
 STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"
 
+STAGING_DIR_SDK = "${STAGING_DIR}/${SDK_SYS}"
+
 STAGING_DIR_TARGET = "${STAGING_DIR}/${TARGET_SYS}"
 
 DEPLOY_DIR = "${TMPDIR}/deploy"
@@ -268,7 +278,7 @@ DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 PKGDATA_DIR = "${STAGING_DIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
 
 SDK_NAME = "${DISTRO}/${TARGET_ARCH}"
-SDK_PREFIX = "/usr/local/${SDK_NAME}"
+SDK_PATH = "/usr/local/${SDK_NAME}"
 
 ##################################################################
 # Kernel info.
@@ -377,14 +387,17 @@ PATCHRESOLVE = 'noop'
 export BUILD_CPPFLAGS = "-isystem${STAGING_INCDIR_NATIVE}"
 export CPPFLAGS = "${TARGET_CPPFLAGS}"
 export TARGET_CPPFLAGS = "-isystem${STAGING_DIR_TARGET}${layout_includedir}"
+export SDK_CPPFLAGS = "-isystem${STAGING_DIR_SDK}${layout_includedir}"
 
 export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
 export CFLAGS = "${TARGET_CFLAGS}"
 export TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
+export SDK_CFLAGS = "${SDK_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
 
 export BUILD_CXXFLAGS = "${BUILD_CFLAGS} -fpermissive"
 export CXXFLAGS = "${TARGET_CXXFLAGS}"
 export TARGET_CXXFLAGS = "${TARGET_CFLAGS} -fpermissive"
+export SDK_CXXFLAGS = "${SDK_CFLAGS} -fpermissive"
 
 export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
@@ -394,6 +407,9 @@ export LDFLAGS = "${TARGET_LDFLAGS}"
 export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${layout_libdir} \
                          -Wl,-rpath-link,${STAGING_DIR_TARGET}${layout_libdir} \
                          -Wl,-O1"
+export SDK_LDFLAGS = "-L${STAGING_DIR_SDK}${layout_libdir} \
+                         -Wl,-rpath-link,${STAGING_DIR_SDK}${layout_libdir} \
+                         -Wl,-O1"
 
 # Which flags to leave by strip-flags() in bin/build/oebuild.sh ?
 ALLOWED_FLAGS = "-O -mcpu -march -pipe"
@@ -547,7 +563,7 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
+OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:sdk-${SDK_OS}:build-${BUILD_OS}:fail-fast:pn-${PN}"
 # Alternative OVERRIDES definition without "fail fast", usually only for native building and Scratchbox toolchains.
 #OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}"
 
diff --git a/packages/meta/external-toolchain.bb b/packages/meta/external-toolchain.bb
index e1dae5a..4c70054 100644
--- a/packages/meta/external-toolchain.bb
+++ b/packages/meta/external-toolchain.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "This package allows OE to work with an external toolchain generated \
                by meta-toolchain instead of building its own. It expects that toolchain \
-               to be located in SDK_PREFIX/prefix."
+               to be located in SDK_PATH/prefix."
 
 PROVIDES = "\
     linux-libc-headers \
diff --git a/packages/meta/meta-toolchain.bb b/packages/meta/meta-toolchain.bb
index 1fa4cdb..9b91f0d 100644
--- a/packages/meta/meta-toolchain.bb
+++ b/packages/meta/meta-toolchain.bb
@@ -10,7 +10,7 @@ SDK_OUTPUT2 = "${SDK_DIR}/image-extras"
 SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 
 IPKG_HOST = "opkg-cl -f ${IPKGCONF_SDK} -o ${SDK_OUTPUT}"
-IPKG_TARGET = "opkg-cl -f ${IPKGCONF_TARGET} -o ${SDK_OUTPUT}/${SDK_PREFIX}/${TARGET_SYS}"
+IPKG_TARGET = "opkg-cl -f ${IPKGCONF_TARGET} -o ${SDK_OUTPUT}/${SDK_PATH}/${TARGET_SYS}"
 
 TOOLCHAIN_HOST_TASK ?= "task-sdk-host"
 TOOLCHAIN_TARGET_TASK ?= "task-sdk-bare"
@@ -35,7 +35,7 @@ do_populate_sdk() {
 	${IPKG_HOST} update
 	${IPKG_HOST} -force-depends install ${TOOLCHAIN_HOST_TASK}
 
-	mkdir -p ${SDK_OUTPUT}/${SDK_PREFIX}/${TARGET_SYS}/usr/lib/opkg
+	mkdir -p ${SDK_OUTPUT}/${SDK_PATH}/${TARGET_SYS}/usr/lib/opkg
 	${IPKG_TARGET} update
 	${IPKG_TARGET} install ${TOOLCHAIN_TARGET_TASK}
 
-- 
1.5.4.3



