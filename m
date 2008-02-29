Received: from [67.19.73.58] (helo=pug.o-hand.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <richard@openedhand.com>) id 1JV8Nw-0006ql-SD
	for openembedded-devel@openembedded.org; Fri, 29 Feb 2008 17:47:07 +0100
Received: from [192.168.1.3] (tim.rpsys.net [194.106.48.114])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id EA665E2AF83
	for <openembedded-devel@openembedded.org>;
	Fri, 29 Feb 2008 11:46:04 -0500 (EST)
From: Richard Purdie <richard@openedhand.com>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Fri, 29 Feb 2008 16:46:04 +0000
Message-Id: <1204303564.8126.38.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-SA-Exim-Connect-IP: 67.19.73.58
X-SA-Exim-Mail-From: richard@openedhand.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE Staging ABI Change Warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Feb 2008 16:47:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

OE.dev is now just about ready to switch to using sysroot. The compilers
have been updated to activate sysroot and the fixes I/Poky have for
various pkgconfig issues have been committed. The final change is to
actually change the layout.

I've attached the patch I have locally for doing this. Since it changes
the layout of staging I've gone for changing the ABI and warning users
using the newly added mechanism.

insane.bbclass will warn about potentially problematic .pc files and I
suspect a few people will hit that since there are a lot of broken ones
around. I'll give a summary of the problem and the way to solve it:

The changes activate the sysroot mode of pkgconfig. This means the .pc
files no longer have to be mangled and are quite safe containing
"libdir=/usr/lib" (or whatever $libdir is). pkgconfig itself takes care
of adding the contents of the PKG_CONFIG_SYSROOT_DIR variable
(${STAGING_DIR}/${TARGET_SYS}) to -L and -I options in --libs and
--cflags return values.

The problem comes when apps do broken things with the results from
pkgconfig like adding it to the Libraries line in a .pc file, e.g.:

Libraries: -L/my/path/to/staging

since when pkgconfig returns --libs, you see
-L/my/path/to/staging/my/path/to/staging/ which makes no sense.

The correct fix is usually for apps to add the right package to the
Requires: line, or if the required package doesn't use pkgconfig, use an
expression which uses $libdir.

I'm not likely to be around much over the weekend so I'll hold off
committing this to OE.dev until Monday.

Cheers,

Richard


#
# old_revision [295199ba5efc8ddca9453992b8304f356f385efd]
#
# patch "classes/insane.bbclass"
#  from [00d6311affb65ec365a80a9b833de2945df35660]
#    to [0712df99743c442ed311e6b4d4be0d28f29d525f]
# 
# patch "classes/native.bbclass"
#  from [242e5b275af07bc3c8f5d3d1a6003d852ba72ec6]
#    to [1b40b57b08d22639dfa0d4f7dd05dc5a77f5d82b]
# 
# patch "classes/pkgconfig.bbclass"
#  from [2c935b7d38f7e8274e938105750194e864d60cf7]
#    to [825125168a0e350351266996b570279b35dc175f]
# 
# patch "classes/sdk.bbclass"
#  from [c676bc74ec4f1990541362dca4fe5698aca8eba8]
#    to [3d79f34a1ba3589e0d005c39cdaa6758bf8507f4]
# 
# patch "conf/bitbake.conf"
#  from [ea1e16116ff065e62f58aa7bb32a1757f5aa0695]
#    to [0864432a275e29411be3ab7d16a689c895783c2f]
# 
# patch "conf/sanity.conf"
#  from [19e2e5d9bfa5113b4c25577b445fd588b4a0999b]
#    to [0b8a4c4acfe94430a373d0c7c51dc052f45c98a7]
# 
# patch "packages/gcc/gcc3-build-cross.inc"
#  from [6b61dc663b321ffd6f1992e3587e47c2440c31fe]
#    to [5d07bedf9a0e89893e190e81c7733cbe6d78177b]
# 
# patch "packages/gcc/gcc3-build-sdk.inc"
#  from [e80775fa7cdad10299b39edefff6b5cdb7120bda]
#    to [59b69e7b5420254f92421122abe64c1bafc7ca71]
# 
# patch "packages/gcc/gcc4-build-sdk.inc"
#  from [87829c7148dd1ac08f628d6ee4be53f410490e7b]
#    to [4bccd43b332808cf66e56b0cfcdcc722e35df86c]
# 
# patch "packages/linux-libc-headers/linux-libc-headers.inc"
#  from [87128c42990e29e5ae8b7fb5934036d4c2f46337]
#    to [8d23279cdfe7a7a9d3b20655625b2c6424e25069]
# 
# patch "packages/openssl/openssl.inc"
#  from [e2020c55f48ae6edb2b96f7cb705f900d58ecc79]
#    to [a0a61df4d6fc5943c3fb8c9f885caea1ebd2cb7c]
#
============================================================
--- classes/insane.bbclass	00d6311affb65ec365a80a9b833de2945df35660
+++ classes/insane.bbclass	0712df99743c442ed311e6b4d4be0d28f29d525f
@@ -333,12 +333,15 @@ def package_qa_check_staged(path,d):
     import os, bb
 
     sane = True
-    workdir = os.path.join(bb.data.getVar('TMPDIR', d, True), "work")
+    tmpdir = bb.data.getVar('TMPDIR', d, True)
+    workdir = os.path.join(tmpdir, "work")
 
-    if bb.data.inherits_class("native", d):
+    if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
         installed = "installed=no"
+        pkgconfigcheck = workdir
     else:
         installed = "installed=yes"
+        pkgconfigcheck = tmpdir
 
     # find all .la and .pc files
     # read the content
@@ -356,8 +359,8 @@ def package_qa_check_staged(path,d):
                     sane = package_qa_handle_error(8, error_msg, "staging", path, d)
             elif file[-2:] == "pc":
                 file_content = open(path).read()
-                if workdir in file_content:
-                    error_msg = "%s failed sanity test (workdir) in path %s" % (file,root)
+                if pkgconfigcheck in file_content:
+                    error_msg = "%s failed sanity test (tmpdir) in path %s" % (file,root)
                     sane = package_qa_handle_error(6, error_msg, "staging", path, d)
 
     return sane
============================================================
--- classes/native.bbclass	242e5b275af07bc3c8f5d3d1a6003d852ba72ec6
+++ classes/native.bbclass	1b40b57b08d22639dfa0d4f7dd05dc5a77f5d82b
@@ -47,40 +47,34 @@ export STRIP = "${HOST_PREFIX}strip"
 export RANLIB = "${HOST_PREFIX}ranlib"
 export STRIP = "${HOST_PREFIX}strip"
 
-
 # Path prefixes
-base_prefix = "${STAGING_DIR}/${BUILD_ARCH}-${BUILD_OS}"
-prefix = "${base_prefix}"
-exec_prefix = "${base_prefix}"
+export base_prefix = "${STAGING_DIR_NATIVE}"
+export prefix = "${STAGING_DIR_NATIVE}${layout_prefix}"
+export exec_prefix = "${STAGING_DIR_NATIVE}${layout_exec_prefix}"
 
 # Base paths
-base_bindir = "${base_prefix}/bin"
-base_sbindir = "${base_prefix}/bin"
-base_libdir = "${base_prefix}/lib"
+export base_bindir = "${STAGING_DIR_NATIVE}${layout_base_bindir}"
+export base_sbindir = "${STAGING_DIR_NATIVE}${layout_base_sbindir}"
+export base_libdir = "${STAGING_DIR_NATIVE}${layout_base_libdir}"
 
 # Architecture independent paths
-sysconfdir = "${prefix}/etc"
-sharedstatedir = "${prefix}/com"
-localstatedir = "${prefix}/var"
-infodir = "${datadir}/info"
-mandir = "${datadir}/man"
-docdir = "${datadir}/doc"
-servicedir = "${prefix}/srv"
+export datadir = "${STAGING_DIR_NATIVE}${layout_datadir}"
+export sysconfdir = "${STAGING_DIR_NATIVE}${layout_sysconfdir}"
+export sharedstatedir = "${STAGING_DIR_NATIVE}${layout_sharedstatedir}"
+export localstatedir = "${STAGING_DIR_NATIVE}${layout_localstatedir}"
+export infodir = "${STAGING_DIR_NATIVE}${layout_infodir}"
+export mandir = "${STAGING_DIR_NATIVE}${layout_mandir}"
+export docdir = "${STAGING_DIR_NATIVE}${layout_docdir}"
+export servicedir = "${STAGING_DIR_NATIVE}${layout_servicedir}"
 
 # Architecture dependent paths
-bindir = "${exec_prefix}/bin"
-sbindir = "${exec_prefix}/bin"
-libexecdir = "${exec_prefix}/libexec"
-libdir = "${exec_prefix}/lib"
-includedir = "${exec_prefix}/include"
-oldincludedir = "${exec_prefix}/include"
+export bindir = "${STAGING_DIR_NATIVE}${layout_bindir}"
+export sbindir = "${STAGING_DIR_NATIVE}${layout_sbindir}"
+export libexecdir = "${STAGING_DIR_NATIVE}${layout_libexecdir}"
+export libdir = "${STAGING_DIR_NATIVE}${layout_libdir}"
+export includedir = "${STAGING_DIR_NATIVE}${layout_includedir}"
+export oldincludedir = "${STAGING_DIR_NATIVE}${layout_includedir}"
 
-# Datadir is made arch dependent here, primarily
-# for autoconf macros, and other things that
-# may be manipulated to handle crosscompilation
-# issues.
-datadir = "${exec_prefix}/share"
-
 do_stage () {
 	if [ "${INHIBIT_NATIVE_STAGE_INSTALL}" != "1" ]
 	then
@@ -93,3 +87,4 @@ PKG_CONFIG_PATH .= "${EXTRA_NATIVE_PKGCO
 }
 
 PKG_CONFIG_PATH .= "${EXTRA_NATIVE_PKGCONFIG_PATH}"
+PKG_CONFIG_SYSROOT_DIR = ""
============================================================
--- classes/pkgconfig.bbclass	2c935b7d38f7e8274e938105750194e864d60cf7
+++ classes/pkgconfig.bbclass	825125168a0e350351266996b570279b35dc175f
@@ -1,37 +1,11 @@ DEPENDS_prepend = "pkgconfig-native "
 inherit base
 
 DEPENDS_prepend = "pkgconfig-native "
 
-# The namespaces can clash here hence the two step replace
-def get_pkgconfig_mangle(d):
-	import bb.data
-	s = "-e ''"
-	if not bb.data.inherits_class('native', d):
-		s += " -e 's:=${libdir}:=OELIBDIR:;'"
-		s += " -e 's:=${includedir}:=OEINCDIR:;'"
-		s += " -e 's:=${datadir}:=OEDATADIR:'"
-		s += " -e 's:=${prefix}:=OEPREFIX:'"
-		s += " -e 's:=${exec_prefix}:=OEEXECPREFIX:'"
-		s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
-		s += " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
-		s += " -e 's:OEDATADIR:${STAGING_DATADIR}:'"
-		s += " -e 's:OEPREFIX:${STAGING_DIR_HOST}${layout_prefix}:'"
-		s += " -e 's:OEEXECPREFIX:${STAGING_DIR_HOST}${layout_exec_prefix}:'"
-		s += " -e 's:-L${WORKDIR}\S*: :g'"
-		s += " -e 's:-I${WORKDIR}\S*: :g'"
-
-	return s
-
-do_install_append () {
-        for pc in `find ${D} -name '*.pc' -type f | grep -v -- '-uninstalled.pc$'`; do
-                sed -i ${@get_pkgconfig_mangle(d)} -e 's:${D}::g' -e 's:${STAGING_LIBDIR}:${libdir}:g' -e 's:${STAGING_INCDIR}:${includedir}:g' -e 's:${STAGING_DIR_TARGET}:${prefix}:g' ${pc}
-        done
-}
-
 do_stage_append () {
+	install -d ${PKG_CONFIG_DIR}
 	for pc in `find ${S} -name '*.pc' -type f | grep -v -- '-uninstalled.pc$'`; do
 		pcname=`basename $pc`
-		install -d ${PKG_CONFIG_DIR}
-		cat $pc | sed ${@get_pkgconfig_mangle(d)} -e 's:${D}${libdir}\S*:${STAGING_LIBDIR}:g' -e 's:${D}${prefix}/include\S*:${STAGING_INCDIR}:g' > ${PKG_CONFIG_DIR}/$pcname
+		cat $pc > ${PKG_CONFIG_DIR}/$pcname
 	done
 }
============================================================
--- classes/sdk.bbclass	c676bc74ec4f1990541362dca4fe5698aca8eba8
+++ classes/sdk.bbclass	3d79f34a1ba3589e0d005c39cdaa6758bf8507f4
@@ -6,15 +6,15 @@ HOST_ARCH = "${BUILD_ARCH}"
 PACKAGE_ARCH = "${BUILD_ARCH}-${OLD_PACKAGE_ARCH}-sdk"
 
 HOST_ARCH = "${BUILD_ARCH}"
-HOST_VENDOR = "${BUILD_VENDOR}"
+HOST_VENDOR = "${TARGET_VENDOR}"
 HOST_OS = "${BUILD_OS}"
 HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
 
-CPPFLAGS = "${BUILD_CPPFLAGS}"
-CFLAGS = "${BUILD_CFLAGS}"
-CXXFLAGS = "${BUILD_CFLAGS}"
-LDFLAGS = "${BUILD_LDFLAGS}"
+CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
+CFLAGS = "${BUILDSDK_CFLAGS}"
+CXXFLAGS = "${BUILDSDK_CFLAGS}"
+LDFLAGS = "${BUILDSDK_LDFLAGS}"
 
 # Path prefixes
 prefix = "${SDK_PREFIX}"
@@ -49,3 +49,4 @@ FILES_${PN}-dbg += "${prefix}/.debug \
                     ${prefix}/bin/.debug \
                    "
 
+export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR}/${HOST_SYS}"
============================================================
--- conf/bitbake.conf	ea1e16116ff065e62f58aa7bb32a1757f5aa0695
+++ conf/bitbake.conf	0864432a275e29411be3ab7d16a689c895783c2f
@@ -1,24 +1,21 @@
 ##################################################################
 # Standard target filesystem layout.
 ##################################################################
 
-# Note these currently match the existing staging layout but this 
-# is planned to change, see the oe-dev mailing list
-
 # Path prefixes
-layout_prefix = ""
-layout_exec_prefix = ""
+layout_prefix = "/usr"
+layout_exec_prefix = "/usr"
 layout_base_prefix = ""
 
 # Base paths
 layout_base_bindir = "${layout_base_prefix}/bin"
-layout_base_sbindir = "${layout_base_prefix}/bin"
+layout_base_sbindir = "${layout_base_prefix}/sbin"
 layout_base_libdir = "${layout_base_prefix}/lib"
 
 # Architecture independent paths
-layout_sysconfdir = "/etc"
-layout_localstatedir = "/var"
-layout_servicedir = "/srv"
+layout_sysconfdir = "${layout_base_prefix}/etc"
+layout_localstatedir = "${layout_base_prefix}/var"
+layout_servicedir = "${layout_base_prefix}/srv"
 layout_sharedstatedir = "${layout_prefix}/com"
 layout_datadir = "${layout_prefix}/share"
 layout_infodir = "${layout_datadir}/info"
@@ -27,7 +24,7 @@ layout_bindir = "${layout_exec_prefix}/b
 
 # Architecture dependent paths
 layout_bindir = "${layout_exec_prefix}/bin"
-layout_sbindir = "${layout_exec_prefix}/bin"
+layout_sbindir = "${layout_exec_prefix}/sbin"
 layout_libdir = "${layout_exec_prefix}/lib"
 layout_includedir = "${layout_exec_prefix}/include"
 layout_libexecdir = "${layout_exec_prefix}/libexec"
@@ -38,31 +35,31 @@ export base_prefix = ""
 
 # Path prefixes
 export base_prefix = ""
-export prefix = "/usr"
-export exec_prefix = "${prefix}"
+export prefix = "${layout_prefix}"
+export exec_prefix = "${layout_exec_prefix}"
 
 # Base paths
-export base_bindir = "${base_prefix}/bin"
-export base_sbindir = "${base_prefix}/sbin"
-export base_libdir = "${base_prefix}/lib"
+export base_bindir = "${layout_base_bindir}"
+export base_sbindir = "${layout_base_sbindir}"
+export base_libdir = "${layout_base_libdir}"
 
 # Architecture independent paths
-export datadir = "${prefix}/share"
-export sysconfdir = "/etc"
-export sharedstatedir = "${prefix}/com"
-export localstatedir = "/var"
-export infodir = "${datadir}/info"
-export mandir = "${datadir}/man"
-export docdir = "${datadir}/doc"
-export servicedir = "/srv"
+export datadir = "${layout_datadir}"
+export sysconfdir = "${layout_sysconfdir}"
+export sharedstatedir = "${layout_sharedstatedir}"
+export localstatedir = "${layout_localstatedir}"
+export infodir = "${layout_infodir}"
+export mandir = "${layout_mandir}"
+export docdir = "${layout_docdir}"
+export servicedir = "${layout_servicedir}"
 
 # Architecture dependent paths
-export bindir = "${exec_prefix}/bin"
-export sbindir = "${exec_prefix}/sbin"
-export libexecdir = "${exec_prefix}/libexec"
-export libdir = "${exec_prefix}/lib"
-export includedir = "${exec_prefix}/include"
-export oldincludedir = "${exec_prefix}/include"
+export bindir = "${layout_bindir}"
+export sbindir = "${layout_sbindir}"
+export libexecdir = "${layout_libexecdir}"
+export libdir = "${layout_libdir}"
+export includedir = "${layout_includedir}"
+export oldincludedir = "${layout_includedir}"
 
 ##################################################################
 # Architecture-dependent build variables.
@@ -506,6 +503,7 @@ export PKG_CONFIG_PATH = "${PKG_CONFIG_D
 
 export PKG_CONFIG_DIR = "${STAGING_LIBDIR}/pkgconfig"
 export PKG_CONFIG_PATH = "${PKG_CONFIG_DIR}"
+export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR}/${TARGET_SYS}"
 export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 
 export QMAKE_MKSPEC_PATH = "${STAGING_DATADIR_NATIVE}/qmake"
============================================================
--- conf/sanity.conf	19e2e5d9bfa5113b4c25577b445fd588b4a0999b
+++ conf/sanity.conf	0b8a4c4acfe94430a373d0c7c51dc052f45c98a7
@@ -11,7 +11,7 @@ BB_MIN_VERSION = "1.8.10"
 # that breaks the format and have been previously discussed on the mailing list 
 # with general agreement from the core team.
 #
-SANITY_ABI = "0"
+SANITY_ABI = "1"
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
 INHERIT += "sanity"
============================================================
--- packages/gcc/gcc3-build-cross.inc	6b61dc663b321ffd6f1992e3587e47c2440c31fe
+++ packages/gcc/gcc3-build-cross.inc	5d07bedf9a0e89893e190e81c7733cbe6d78177b
@@ -23,11 +23,6 @@ do_stage_append () {
 		rm -rf ${CROSS_DIR}/$d
 	done
 
-    # Hack to be removed when staging layout matches the target layout
-    if [ ! -e ${STAGING_DIR_TARGET}/usr ]; then
-        ln -s ${STAGING_DIR_TARGET} ${STAGING_DIR_TARGET}/usr
-    fi
-
 	# Fix a few include links so cross builds are happier
 	if [ ! -e ${STAGING_INCDIR}/c++ ]; then
 		mkdir -p ${STAGING_INCDIR}
============================================================
--- packages/gcc/gcc3-build-sdk.inc	e80775fa7cdad10299b39edefff6b5cdb7120bda
+++ packages/gcc/gcc3-build-sdk.inc	59b69e7b5420254f92421122abe64c1bafc7ca71
@@ -5,6 +5,8 @@ STAGING_TARGET_LIBDIR = "${STAGING_DIR_T
 STAGING_TARGET_INCDIR = "${STAGING_DIR_TARGET}${layout_includedir}"
 STAGING_TARGET_LIBDIR = "${STAGING_DIR_TARGET}${layout_libdir}"
 
+EXTRA_OECONF += "--with-sysroot=${prefix}/${TARGET_SYS} --with-build-sysroot=${STAGING_DIR_TARGET}"
+
 do_configure () {
        (cd ${S} && gnu-configize) || die "failure running gnu-configize"
        (cd ${S}/libstdc++-v3 && autoreconf)
============================================================
--- packages/gcc/gcc4-build-sdk.inc	87829c7148dd1ac08f628d6ee4be53f410490e7b
+++ packages/gcc/gcc4-build-sdk.inc	4bccd43b332808cf66e56b0cfcdcc722e35df86c
@@ -1,13 +1,9 @@ do_configure () {
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibcgnueabi", "no", "", d )}'
 
 EXTRA_OECONF += "--with-sysroot=${prefix}/${TARGET_SYS} --with-build-sysroot=${STAGING_DIR_TARGET}"
 
 do_configure () {
-       # Hack to be removed when staging layout matches the target layout
-       if [ ! -e ${STAGING_DIR_TARGET}/usr ]; then
-           ln -s ${STAGING_DIR_TARGET} ${STAGING_DIR_TARGET}/usr
-       fi
        (cd ${S} && gnu-configize) || die "failure running gnu-configize"
        (cd ${S}/libstdc++-v3 && autoreconf)
        oe_runconf
============================================================
--- packages/linux-libc-headers/linux-libc-headers.inc	87128c42990e29e5ae8b7fb5934036d4c2f46337
+++ packages/linux-libc-headers/linux-libc-headers.inc	8d23279cdfe7a7a9d3b20655625b2c6424e25069
@@ -1,5 +1,3 @@ LICENSE = "GPL"
 DESCRIPTION = "Sanitized set of 2.6 kernel headers for the C library's use."
 SECTION = "devel"
 LICENSE = "GPL"
-
-DEPENDS = "cross-linkage"
============================================================
--- packages/openssl/openssl.inc	e2020c55f48ae6edb2b96f7cb705f900d58ecc79
+++ packages/openssl/openssl.inc	a0a61df4d6fc5943c3fb8c9f885caea1ebd2cb7c
@@ -14,7 +14,7 @@ export DIRS = "crypto ssl apps"
 export CFLAG_mtx-2 := "${@'${CFLAG}'.replace('-O2', '')}"
 
 export DIRS = "crypto ssl apps"
-export EX_LIBS = "-lgcc -ldl ${TARGET_LDFLAGS}"
+export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
 
 PACKAGES =+ "libcrypto libssl"



