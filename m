Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC77-0007Gp-7m
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:56:33 +0200
Received: from localhost (077233226018.hef.nianet.dk [77.233.226.18] (may be
	forged))
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m97CpkgO021266;
	Tue, 7 Oct 2008 14:51:51 +0200
Received: from esben by localhost with local (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>)
	id 1KnC2U-00015A-Da; Tue, 07 Oct 2008 14:51:46 +0200
From: eha@doredevelopment.dk
To: openembedded-devel@openembedded.org
Date: Tue,  7 Oct 2008 14:51:39 +0200
Message-Id: <cc617cfc6a87cb5e145ace9c07d91a4cf4853600.1223383759.git.eha@doredevelopment.dk>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <d01d019899790eefd7fb6742174f2c359022b4fa.1223383759.git.eha@doredevelopment.dk>
References: <> <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
	<b011d8abd4dd7f517da3f835736cce56a1acd919.1223383759.git.eha@doredevelopment.dk>
	<c00c0e996ed9eff33dae83236a28a88f6bcf9a73.1223383759.git.eha@doredevelopment.dk>
	<2c0637f3c20a6f84ea03f1fdb9212b970ef9c371.1223383759.git.eha@doredevelopment.dk>
	<d01d019899790eefd7fb6742174f2c359022b4fa.1223383759.git.eha@doredevelopment.dk>
In-Reply-To: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
Cc: Esben Haabendal <eha@doredevelopment.dk>
Subject: [PATCH 06/13] canadian-cross.bbclass, canadian-native.bbclass, canadian-sdk.bbclass added
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


Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 classes/canadian-cross.bbclass  |   68 +++++++++++++++++++++++++++
 classes/canadian-native.bbclass |   90 ++++++++++++++++++++++++++++++++++++
 classes/canadian-sdk.bbclass    |   97 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 255 insertions(+), 0 deletions(-)
 create mode 100644 classes/canadian-cross.bbclass
 create mode 100644 classes/canadian-native.bbclass
 create mode 100644 classes/canadian-sdk.bbclass

diff --git a/classes/canadian-cross.bbclass b/classes/canadian-cross.bbclass
new file mode 100644
index 0000000..9091ed8
--- /dev/null
+++ b/classes/canadian-cross.bbclass
@@ -0,0 +1,68 @@
+# SDK Cross packages are built indirectly via dependency,
+# no need for them to be a direct target of 'world'
+EXCLUDE_FROM_WORLD = "1"
+
+# Save PACKAGE_ARCH before changing HOST_ARCH
+OLD_PACKAGE_ARCH := ${PACKAGE_ARCH}
+PACKAGE_ARCH = ${SDK_ARCH}
+
+PACKAGES = ""
+
+HOST_ARCH = "${BUILD_ARCH}"
+HOST_VENDOR = "${BUILD_VENDOR}"
+HOST_OS = "${BUILD_OS}"
+HOST_PREFIX = "${BUILD_PREFIX}"
+HOST_CC_ARCH = "${BUILD_CC_ARCH}"
+HOST_EXEEXT = "${BUILD_EXEEXT}"
+
+TARGET_ARCH = "${SDK_ARCH}"
+TARGET_VENDOR = "${SDK_VENDOR}"
+TARGET_OS = "${SDK_OS}"
+TARGET_PREFIX = "${SDK_PREFIX}"
+TARGET_CC_ARCH = "${SDK_CC_ARCH}"
+TARGET_EXEEXT = "${SDK_EXEEXT}"
+
+CPPFLAGS = "${BUILD_CPPFLAGS}"
+CFLAGS = "${BUILD_CFLAGS}"
+CXXFLAGS = "${BUILD_CFLAGS}"
+LDFLAGS = "${BUILD_LDFLAGS}"
+
+TOOLCHAIN_OPTIONS = ""
+
+# Overrides for paths
+
+# Path prefixes
+base_prefix = "${exec_prefix}"
+prefix = "${CROSS_DIR}"
+exec_prefix = "${prefix}"
+
+# Base paths
+base_bindir = "${base_prefix}/bin"
+base_sbindir = "${base_prefix}/bin"
+base_libdir = "${base_prefix}/lib"
+
+# Architecture independent paths
+datadir = "${prefix}/share"
+sysconfdir = "${prefix}/etc"
+sharedstatedir = "${prefix}/com"
+localstatedir = "${prefix}/var"
+infodir = "${datadir}/info"
+mandir = "${datadir}/man"
+docdir = "${datadir}/doc"
+servicedir = "${prefix}/srv"
+
+# Architecture dependent paths
+bindir = "${exec_prefix}/bin"
+sbindir = "${exec_prefix}/bin"
+libexecdir = "${exec_prefix}/libexec"
+libdir = "${exec_prefix}/lib"
+includedir = "${STAGING_DIR_TARGET}${layout_includedir}"
+oldincludedir = "${STAGING_DIR_TARGET}${layout_includedir}"
+
+do_stage () {
+	oe_runmake install
+}
+
+do_install () {
+	:
+}
diff --git a/classes/canadian-native.bbclass b/classes/canadian-native.bbclass
new file mode 100644
index 0000000..6a3cd45
--- /dev/null
+++ b/classes/canadian-native.bbclass
@@ -0,0 +1,90 @@
+inherit base
+
+# SDK packages are built either explicitly by the user,
+# or indirectly via dependency.  No need to be in 'world'.
+EXCLUDE_FROM_WORLD = "1"
+
+# Save PACKAGE_ARCH before changing HOST_ARCH
+OLD_PACKAGE_ARCH := ${PACKAGE_ARCH}
+PACKAGE_ARCH = "${SDK_ARCH}"
+
+PACKAGES = ""
+
+HOST_ARCH = "${SDK_ARCH}"
+HOST_VENDOR = "${SDK_VENDOR}"
+HOST_OS = "${SDK_OS}"
+HOST_PREFIX = "${SDK_PREFIX}"
+HOST_CC_ARCH = "${SDK_CC_ARCH}"
+HOST_EXEEXT = "${SDK_EXEEXT}"
+
+TARGET_ARCH = "${SDK_ARCH}"
+TARGET_VENDOR = "${SDK_VENDOR}"
+TARGET_OS = "${SDK_OS}"
+TARGET_PREFIX = "${SDK_PREFIX}"
+TARGET_CC_ARCH = "${SDK_CC_ARCH}"
+TARGET_EXEEXT = "${SDK_EXEEXT}"
+
+CPPFLAGS = "${SDK_CPPFLAGS}"
+CFLAGS = "${SDK_CFLAGS}"
+CXXFLAGS = "${SDK_CFLAGS}"
+LDFLAGS = "${SDK_LDFLAGS}"
+
+# FIXME: looks broken, but seemed to work...  TBD if they can be deleted.
+#STAGING_BINDIR = "${STAGING_BINDIR_SDK}"
+#STAGING_BINDIR_CROSS = "${STAGING_BINDIR_SDK}"
+
+# set the compiler as well. It could have been set to something else
+export CC = "${CCACHE}${SDK_PREFIX}gcc ${HOST_CC_ARCH}"
+export CXX = "${CCACHE}${SDK_PREFIX}g++ ${HOST_CC_ARCH}"
+export F77 = "${CCACHE}${SDK_PREFIX}g77 ${HOST_CC_ARCH}"
+export CPP = "${SDK_PREFIX}gcc -E"
+export LD = "${SDK_PREFIX}ld"
+#export CCLD = "${CC}"
+export AR = "${SDK_PREFIX}ar"
+export AS = "${SDK_PREFIX}as"
+export RANLIB = "${SDK_PREFIX}ranlib"
+export STRIP = "${SDK_PREFIX}strip"
+
+# Path prefixes
+export base_prefix = "${STAGING_DIR_HOST}"
+export prefix = "${STAGING_DIR_HOST}${layout_prefix}"
+export exec_prefix = "${STAGING_DIR_HOST}${layout_exec_prefix}"
+
+# Base paths
+export base_bindir = "${STAGING_DIR_HOST}${layout_base_bindir}"
+export base_sbindir = "${STAGING_DIR_HOST}${layout_base_sbindir}"
+export base_libdir = "${STAGING_DIR_HOST}${layout_base_libdir}"
+
+# Architecture independent paths
+export datadir = "${STAGING_DIR_HOST}${layout_datadir}"
+export sysconfdir = "${STAGING_DIR_HOST}${layout_sysconfdir}"
+export sharedstatedir = "${STAGING_DIR_HOST}${layout_sharedstatedir}"
+export localstatedir = "${STAGING_DIR_HOST}${layout_localstatedir}"
+export infodir = "${STAGING_DIR_HOST}${layout_infodir}"
+export mandir = "${STAGING_DIR_HOST}${layout_mandir}"
+export docdir = "${STAGING_DIR_HOST}${layout_docdir}"
+export servicedir = "${STAGING_DIR_HOST}${layout_servicedir}"
+
+# Architecture dependent paths
+export bindir = "${STAGING_DIR_HOST}${layout_bindir}"
+export sbindir = "${STAGING_DIR_HOST}${layout_sbindir}"
+export libexecdir = "${STAGING_DIR_HOST}${layout_libexecdir}"
+export libdir = "${STAGING_DIR_HOST}${layout_libdir}"
+export includedir = "${STAGING_DIR_HOST}${layout_includedir}"
+export oldincludedir = "${STAGING_DIR_HOST}${layout_includedir}"
+
+do_stage () {
+        if [ "${INHIBIT_NATIVE_STAGE_INSTALL}" != "1" ]
+        then
+                if [ "${AUTOTOOLS_NATIVE_STAGE_INSTALL}" != "1" ]
+                then
+                        oe_runmake install
+                else
+                        autotools_stage_all
+                fi
+        fi
+}
+
+do_install () {
+	true
+}
diff --git a/classes/canadian-sdk.bbclass b/classes/canadian-sdk.bbclass
new file mode 100644
index 0000000..09ddde1
--- /dev/null
+++ b/classes/canadian-sdk.bbclass
@@ -0,0 +1,97 @@
+# SDK packages are built either explicitly by the user,
+# or indirectly via dependency.  No need to be in 'world'.
+EXCLUDE_FROM_WORLD = "1"
+
+OLD_PACKAGE_ARCH := ${PACKAGE_ARCH}
+PACKAGE_ARCH = "${SDK_SYS}-sdk-${OLD_PACKAGE_ARCH}"
+
+HOST_ARCH = "${SDK_ARCH}"
+HOST_VENDOR = "${SDK_VENDOR}"
+HOST_OS = "${SDK_OS}"
+HOST_PREFIX = "${SDK_PREFIX}"
+HOST_CC_ARCH = "${SDK_CC_ARCH}"
+HOST_EXEEXT = "${SDK_EXEEXT}"
+
+CPPFLAGS = "${SDK_CPPFLAGS}"
+CFLAGS = "${SDK_CFLAGS}"
+CXXFLAGS = "${SDK_CFLAGS}"
+LDFLAGS = "${SDK_LDFLAGS}"
+
+# TODO: add logic to add the following unless PN ~= gcc*
+#DEPENDS_prepend = "virtual/${HOST_PREFIX}binutils virtual/${HOST_PREFIX}gcc "
+# and otherwise just
+DEPENDS_prepend = "virtual/${HOST_PREFIX}binutils "
+
+SDK_PATH_sdk-mingw32 = "/OpenEmbedded/${SDK_NAME}"
+SDK_REALPATH = "${SDK_PATH}"
+SDK_REALPATH_sdk-mingw32 = "C:/OpenEmbedded/${SDK_NAME}"
+
+# Path prefixes
+prefix = "${SDK_PATH}"
+exec_prefix = "${prefix}"
+base_prefix = "${prefix}"
+
+# Base paths
+export base_bindir = "${prefix}/bin"
+export base_sbindir = "${prefix}/bin"
+export base_libdir = "${prefix}/lib"
+
+# Architecture independent paths
+export datadir = "${prefix}/share"
+export sysconfdir = "${prefix}/etc"
+export sharedstatedir = "${datadir}/com"
+export localstatedir = "${prefix}/var"
+export infodir = "${datadir}/info"
+export mandir = "${datadir}/man"
+export docdir = "${datadir}/doc"
+export servicedir = "${prefix}/srv"
+
+# Architecture dependent paths
+export bindir = "${prefix}/bin"
+export sbindir = "${prefix}/bin"
+export libexecdir = "${prefix}/libexec"
+export libdir = "${prefix}/lib"
+export includedir = "${prefix}/include"
+export oldincludedir = "${prefix}/include"
+
+export dollar = "$"
+
+canadian_sdk_runconf() {
+	# modified oe_runconf()
+	# 1. Override prefix with SDK_REALPATH
+	# 2. Pass '${prefix}' to configure, to allow for prefix override
+	# 3. But don't do that for infodir and mandir, as they will
+	#    break gcc makefiles for windows/dos SDK_REALPATH
+	if [ -x ${S}/configure ] ; then
+		cfgcmd="${S}/configure \
+		    --build=${BUILD_SYS} \
+		    --host=${HOST_SYS} \
+		    --target=${TARGET_SYS} \
+		    --prefix=${SDK_REALPATH} \
+		    --exec-prefix=$dollar{prefix} \
+		    --bindir=$dollar{prefix}/bin \
+		    --sbindir=$dollar{prefix}/bin \
+		    --libexecdir=$dollar{prefix}/libexec \
+		    --datadir=$dollar{prefix}/share \
+		    --sysconfdir=$dollar{prefix}/etc \
+		    --sharedstatedir=$dollar{prefix}/com \
+		    --localstatedir=$dollar{prefix}/var \
+		    --libdir=$dollar{prefix}/lib \
+		    --includedir=$dollar{prefix}/include \
+		    --oldincludedir=$dollar{prefix}/include \
+		    --infodir=${prefix}/share/info \
+		    --mandir=${prefix}/share/man \
+		    --enable-mainainer-mode \
+		    ${EXTRA_OECONF} \
+		    $@"
+		oenote "Running $cfgcmd..."
+		$cfgcmd || oefatal "oe_runconf failed" 
+	else
+		oefatal "no configure script found"
+	fi
+}
+
+FILES_${PN} = "${prefix}"
+FILES_${PN}-dbg += "${prefix}/.debug \
+                    ${prefix}/bin/.debug \
+                   "
-- 
1.5.4.3



