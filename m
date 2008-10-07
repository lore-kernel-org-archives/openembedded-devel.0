Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC71-0007GF-70
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:56:27 +0200
Received: from localhost (077233226018.hef.nianet.dk [77.233.226.18] (may be
	forged))
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m97CpkMt021281;
	Tue, 7 Oct 2008 14:51:51 +0200
Received: from esben by localhost with local (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>)
	id 1KnC2U-00015S-Gh; Tue, 07 Oct 2008 14:51:46 +0200
From: eha@doredevelopment.dk
To: openembedded-devel@openembedded.org
Date: Tue,  7 Oct 2008 14:51:45 +0200
Message-Id: <6f8742b61ff8e48ed77c91bc9573711e0d3c6f53.1223383759.git.eha@doredevelopment.dk>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <dd0ef3bb331e249a81458281dabe93098943e0a3.1223383759.git.eha@doredevelopment.dk>
References: <> <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
	<b011d8abd4dd7f517da3f835736cce56a1acd919.1223383759.git.eha@doredevelopment.dk>
	<c00c0e996ed9eff33dae83236a28a88f6bcf9a73.1223383759.git.eha@doredevelopment.dk>
	<2c0637f3c20a6f84ea03f1fdb9212b970ef9c371.1223383759.git.eha@doredevelopment.dk>
	<d01d019899790eefd7fb6742174f2c359022b4fa.1223383759.git.eha@doredevelopment.dk>
	<cc617cfc6a87cb5e145ace9c07d91a4cf4853600.1223383759.git.eha@doredevelopment.dk>
	<5b160cf460453dfb437c1b2c8972e4f3678e6aad.1223383759.git.eha@doredevelopment.dk>
	<93d0cbbfbf07239138d3b25f7a411ab8409fc67a.1223383759.git.eha@doredevelopment.dk>
	<8d921520e115ee5aeb40f0b1dc2b4fd2a6abea29.1223383759.git.eha@doredevelopment.dk>
	<eb9f8974f6c3f5c6f86634656ccc0be509e9ad6f.1223383759.git.eha@doredevelopment.dk>
	<dd0ef3bb331e249a81458281dabe93098943e0a3.1223383759.git.eha@doredevelopment.dk>
In-Reply-To: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
Cc: Esben Haabendal <eha@doredevelopment.dk>
Subject: [PATCH 12/13] gcc-canadian-sdk_4.2.2.bb
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
X-List-Received-Date: Tue, 07 Oct 2008 12:56:27 -0000

From: Esben Haabendal <eha@doredevelopment.dk>


Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 .../canadian-build-modules-configure.patch         |   22 +++++
 packages/gcc/gcc-canadian-sdk-build.inc            |   81 ++++++++++++++++++++
 packages/gcc/gcc-canadian-sdk-package.inc          |   36 +++++++++
 packages/gcc/gcc-canadian-sdk_4.2.2.bb             |   27 +++++++
 4 files changed, 166 insertions(+), 0 deletions(-)
 create mode 100644 packages/gcc/gcc-4.2.2/canadian-build-modules-configure.patch
 create mode 100644 packages/gcc/gcc-canadian-sdk-build.inc
 create mode 100644 packages/gcc/gcc-canadian-sdk-package.inc
 create mode 100644 packages/gcc/gcc-canadian-sdk_4.2.2.bb

diff --git a/packages/gcc/gcc-4.2.2/canadian-build-modules-configure.patch b/packages/gcc/gcc-4.2.2/canadian-build-modules-configure.patch
new file mode 100644
index 0000000..8aede10
--- /dev/null
+++ b/packages/gcc/gcc-4.2.2/canadian-build-modules-configure.patch
@@ -0,0 +1,22 @@
+diff -urN gcc-4.2.2-orig/gcc/configure gcc-4.2.2/gcc/configure
+--- gcc-4.2.2-orig/gcc/configure	2008-08-31 23:10:56.000000000 +0200
++++ gcc-4.2.2/gcc/configure	2008-08-31 23:03:02.000000000 +0200
+@@ -12716,6 +12716,7 @@
+ 	esac
+ 	saved_CFLAGS="${CFLAGS}"
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
++	CPP="${CPP_FOR_BUILD}" CPPFLAGS="${CPPFLAGS_FOR_BUILD}" \
+ 	CONFIG_SITE= ${realsrcdir}/configure --cache-file=./other.cache \
+ 		--enable-languages=${enable_languages-all} \
+ 		--target=$target_alias --host=$build_alias --build=$build_alias
+diff -urN gcc-4.2.2-orig/gcc/configure.ac gcc-4.2.2/gcc/configure.ac
+--- gcc-4.2.2-orig/gcc/configure.ac	2008-08-31 23:10:53.000000000 +0200
++++ gcc-4.2.2/gcc/configure.ac	2008-08-31 23:03:29.000000000 +0200
+@@ -1490,6 +1490,7 @@
+ 	esac
+ 	saved_CFLAGS="${CFLAGS}"
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
++	CPP="${CPP_FOR_BUILD}" CPPFLAGS="${CPPFLAGS_FOR_BUILD}" \
+ 	${realsrcdir}/configure \
+ 		--enable-languages=${enable_languages-all} \
+ 		--target=$target_alias --host=$build_alias --build=$build_alias
diff --git a/packages/gcc/gcc-canadian-sdk-build.inc b/packages/gcc/gcc-canadian-sdk-build.inc
new file mode 100644
index 0000000..aba2067
--- /dev/null
+++ b/packages/gcc/gcc-canadian-sdk-build.inc
@@ -0,0 +1,81 @@
+USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
+USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibcgnueabi", "no", "", d )}'
+
+ARCH_FLAGS_FOR_TARGET=""
+
+# Tools for build
+export CC_FOR_BUILD="${BUILD_CC}"
+export CFLAGS_FOR_BUILD="${BUILD_CFLAGS}"
+export CPP_FOR_BUILD="${BUILD_CPP}"
+export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
+export CXX_FOR_BUILD="${BUILD_CXX}"
+export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
+export LD_FOR_BUILD="${BUILD_LD}"
+export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
+export AS_FOR_BUILD="${BUILD_PREFIX}as"
+export AR_FOR_BUILD="${BUILD_PREFIX}ar"
+export NM_FOR_BUILD="${BUILD_PREFIX}nm"
+export RANLIB_FOR_BUILD="${BUILD_PREFIX}ranlib"
+export GCJ_FOR_BUILD="${BUILD_PREFIX}gcj"
+export GFORTRAN_FOR_BUILD="${BUILD_PREFIX}gfortran"
+export DLLTOOL_FOR_BUILD="${BUILD_PREFIX}dlltool"
+export WINDRES_FOR_BUILD="${BUILD_PREFIX}windres"
+
+# Tools for host
+#CC
+#CFLAGS
+#CXX
+#CXXFLAGS
+#LD
+LDFLAGS=""
+#AS
+#AR
+#NM
+#RANLIB
+#GCJ
+#GFORTRAN
+export DLLTOOL="${HOST_PREFIX}dlltool"
+export WINDRES="${HOST_PREFIX}windres"
+
+# Tools for target
+export CC_FOR_TARGET="${TARGET_CC}"
+export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
+export CXX_FOR_TARGET="${TARGET_CXX}"
+export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
+export LD_FOR_TARGET="${TARGET_LD}"
+export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
+export AS_FOR_TARGET="${TARGET_PREFIX}as"
+export AR_FOR_TARGET="${TARGET_PREFIX}ar"
+export NM_FOR_TARGET="${TARGET_PREFIX}nm"
+export RANLIB_FOR_TARGET="${TARGET_PREFIX}ranlib"
+export GCJ_FOR_TARGET="${TARGET_PREFIX}gcj"
+export GFORTRAN_FOR_TARGET="${TARGET_PREFIX}gfortran"
+export DLLTOOL_FOR_TARGET="${TARGET_PREFIX}dlltool"
+export WINDRES_FOR_TARGET="${TARGET_PREFIX}windres"
+
+EXTRA_OECONF_DEP ?= ""
+
+SYSROOT = "${WORKDIR}/sysroot"
+EXTRA_OECONF += ""
+EXTRA_OECONF_PATHS = " \
+	--with-local-prefix=$dollar{prefix}/local \
+	--with-gxx-include-dir=$dollar{prefix}/${TARGET_SYS}/usr/include/c++/${BINV} \
+	--with-build-sysroot=${SYSROOT} \
+	--with-sysroot=${SDK_REALPATH}/${TARGET_SYS} \
+"
+
+do_configure () {
+	# Work around Hardcoded path assumptions in gcc
+	mkdir -p ${SYSROOT}/usr
+	ln -sf ${STAGING_DIR_SDK}${layout_includedir} \
+		${SYSROOT}/usr/include
+	ln -sf ${STAGING_DIR_SDK}${layout_libdir} \
+		${SYSROOT}/usr/lib
+	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
+	(cd ${S}/libstdc++-v3 && autoreconf)
+	canadian_sdk_runconf
+}
+
+do_compile () {
+	oe_runmake
+}
diff --git a/packages/gcc/gcc-canadian-sdk-package.inc b/packages/gcc/gcc-canadian-sdk-package.inc
new file mode 100644
index 0000000..5889821
--- /dev/null
+++ b/packages/gcc/gcc-canadian-sdk-package.inc
@@ -0,0 +1,36 @@
+# Packages emitted by our gcc-cross builds.
+#
+INHIBIT_PACKAGE_STRIP ?= ""
+OLD_INHIBIT_PACKAGE_STRIP := "${INHIBIT_PACKAGE_STRIP}"
+INHIBIT_PACKAGE_STRIP = "1"
+
+python do_package() {
+	if bb.data.getVar('DEBIAN_NAMES', d, 1):
+		bb.data.setVar('PKG_libgcc', 'libgcc1', d)
+	bb.build.exec_func('package_do_package', d)
+}
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' 'prefix=${SDK_PATH}' install
+
+	# Manually run the target stripper since we won't get it run by
+	# the packaging.
+	if [ "x${OLD_INHIBIT_PACKAGE_STRIP}" != "x1" ]; then
+		${TARGET_PREFIX}strip ${D}${prefix}/${TARGET_SYS}/lib/libstdc++.so.*
+		${TARGET_PREFIX}strip ${D}${prefix}/${TARGET_SYS}/lib/libg2c.so.* || true
+		${TARGET_PREFIX}strip ${D}${prefix}/${TARGET_SYS}/lib/libgcc_s.so.*
+	fi
+}
+
+FILES_libgcc = "${prefix}/${TARGET_SYS}/lib/libgcc*.so.*"
+FILES_libgcc-dev = "${prefix}/${TARGET_SYS}/lib/libgcc*.so"
+
+FILES_libstdc++ = "${prefix}/${TARGET_SYS}/lib/libstdc++.so.*"
+FILES_libstdc++-dev = "${prefix}/${TARGET_SYS}/usr/include/c++/${BINV} \
+                       ${prefix}/${TARGET_SYS}/lib/libstdc++.so \
+                       ${prefix}/${TARGET_SYS}/lib/libstdc++.a \
+                       ${prefix}/${TARGET_SYS}/lib/libsupc++.a"
+
+FILES_libmudflap = "${prefix}/${TARGET_SYS}/lib/libmudflap*.so.*"
+FILES_libmudflap-dev = "${prefix}/${TARGET_SYS}/lib/libmudflap*.so \
+                        ${prefix}/${TARGET_SYS}/lib/libmudflap*.a"
diff --git a/packages/gcc/gcc-canadian-sdk_4.2.2.bb b/packages/gcc/gcc-canadian-sdk_4.2.2.bb
new file mode 100644
index 0000000..f94863f
--- /dev/null
+++ b/packages/gcc/gcc-canadian-sdk_4.2.2.bb
@@ -0,0 +1,27 @@
+inherit canadian-sdk
+
+DEPENDS="\
+	virtual/${HOST_PREFIX}binutils \
+	virtual/${HOST_PREFIX}gcc \
+	virtual/${TARGET_PREFIX}binutils \
+	virtual/${TARGET_PREFIX}gcc \
+	virtual/${TARGET_PREFIX}libc-for-gcc \
+	gmp-native mpfr-native \
+"
+
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gcc-${PV}"
+
+PACKAGES = "${PN}"
+
+require gcc_${PV}.bb
+
+SRC_URI_append =+ "\
+	file://canadian-build-modules-configure.patch;patch=1 \
+"
+
+require gcc-canadian-sdk-build.inc
+require gcc-canadian-sdk-package.inc
+
+EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
+		--disable-libgomp --disable-libmudflap \
+		--with-mpfr=${STAGING_DIR_NATIVE}${layout_exec_prefix}"
-- 
1.5.4.3



