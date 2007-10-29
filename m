Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1ImXZ3-0005RY-Uo
	for openembedded-devel@openembedded.org; Mon, 29 Oct 2007 17:34:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9TGQNgT008716
	for <openembedded-devel@openembedded.org>; Mon, 29 Oct 2007 16:26:23 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08445-05 for <openembedded-devel@openembedded.org>;
	Mon, 29 Oct 2007 16:26:19 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9TGQFiA008694
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 29 Oct 2007 16:26:15 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Mon, 29 Oct 2007 16:26:15 +0000
Message-Id: <1193675175.6161.60.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Staging changes
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
X-List-Received-Date: Mon, 29 Oct 2007 16:34:11 -0000
X-Groupsio-MsgNum: 3242
Content-Type: multipart/mixed; boundary="=-59BdVIp8zIwsb9W2/73I"

--=-59BdVIp8zIwsb9W2/73I
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

At OEDEM, there was basic agreement amongst the core devs that OE's
current staging needs to evolve.

The aim of this evolution is to head towards a staging that looks like
the target system. This allows using the sysroot options of gcc/binutils
to help us remove hacks like the symlinks in cross and the sed "magic"
in pkgconfig.bbclass. In the future is could also lead to a staging task
which just copies files from ${WORKDIR}/image to staging, speeding up
builds a lot (make install is slow) as well as giving much more
possibilities to packaged staging.

I've had this working up to image generation with Poky. It does work and
does lead to clean easier to understand build structures. I've pulled
out a subset of my patches to Poky and checked them into OE. So far
there are no behaviour changes, just several new variables become
available to help us try and clean up the current staging references in
the metadata.

An example of these cleanups are those I've made to gnome-common as a
random example:

--- gnome-common_2.20.0.bb      (revision 2988)
+++ gnome-common_2.20.0.bb      (working copy)
@@ -19,7 +19,7 @@
        rm -rf ${STAGE_TEMP}
        mkdir -p ${STAGE_TEMP}
        make DESTDIR="${STAGE_TEMP}" install
-       cp -pPR ${STAGE_TEMP}${bindir}/* ${STAGING_DIR}/${BUILD_SYS}/bin
+       cp -pPR ${STAGE_TEMP}${bindir}/* ${STAGING_BINDIR_NATIVE}
        install -d ${STAGING_DATADIR}/gnome-common
        install -d ${STAGING_DATADIR}/aclocal
        cp -pPR ${STAGE_TEMP}${datadir}/gnome-common/* ${STAGING_DATADIR}/gnome-common

Why? This will break if we switch to /usr/bin...

The next step is to go through the metadata doing one of two things:

* correcting things where we have variables we can use
* listing problem areas (e.g. gcc configure options)

Bad references which can be grepped for are:

${STAGING_DIR}/${BUILD_SYS}
${STAGING_DIR}/${HOST_SYS}
${STAGING_LIBDIR}/.. (anything with a .. in is likely to cause problems)
${STAGING_DIR}

Python and Perl look like they're going to need special attention.

As an idea of where this leads, see my the attached patch to Poky which
gets it as far as generating images. It does not correct all the entries
that need fixing though.

As my attached patch hints, ultimately, we'll have access to variables
like ${STAGING_DIR_TARGET}${layout_libdir}. I've not introduced them
into OE yet but I could be tempted to, mirroring the staging layout so
the switchover will be one simple set of changes to bitbake.conf.

Cheers,

Richard

--=-59BdVIp8zIwsb9W2/73I
Content-Disposition: attachment; filename=staging-layout.patch
Content-Type: text/x-patch; name=staging-layout.patch; charset=us-ascii
Content-Transfer-Encoding: 7bit

Index: conf/bitbake.conf
===================================================================
--- conf/bitbake.conf   (revision 3015)
+++ conf/bitbake.conf   (working copy)
@@ -1,34 +1,65 @@
 ##################################################################
+# Standard target filesystem layout.
+##################################################################
+
+# Path prefixes
+layout_prefix = "/usr"
+layout_exec_prefix = "/usr"
+layout_base_prefix = ""
+
+# Base paths
+layout_base_bindir = "${layout_base_prefix}/bin"
+layout_base_sbindir = "${layout_base_prefix}/sbin"
+layout_base_libdir = "${layout_base_prefix}/lib"
+
+# Architecture independent paths
+layout_sysconfdir = "/etc"
+layout_localstatedir = "/var"
+layout_servicedir = "/srv"
+layout_sharedstatedir = "${layout_prefix}/com"
+layout_datadir = "${layout_prefix}/share"
+layout_infodir = "${layout_datadir}/info"
+layout_mandir = "${layout_datadir}/man"
+layout_docdir = "${layout_datadir}/doc"
+
+# Architecture dependent paths
+layout_bindir = "${layout_exec_prefix}/bin"
+layout_sbindir = "${layout_exec_prefix}/sbin"
+layout_libdir = "${layout_exec_prefix}/lib"
+layout_includedir = "${layout_exec_prefix}/include"
+layout_libexecdir = "${layout_exec_prefix}/libexec"
+
+##################################################################
 # Standard target filesystem paths.
 ##################################################################
 
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
@@ -169,18 +200,18 @@
 STAGING_DIR = "${TMPDIR}/staging"
 
 STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
-STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}/bin"
-STAGING_BINDIR_CROSS = "${STAGING_DIR_NATIVE}/bin/${HOST_SYS}"
-STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}/lib"
-STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}/include"
-STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}/etc"
-STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}/share"
+STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${layout_bindir}"
+STAGING_BINDIR_CROSS  = "${STAGING_DIR_NATIVE}${layout_bindir}/${HOST_SYS}"
+STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${layout_libdir}"
+STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${layout_includedir}"
+STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${layout_sysconfdir}"
+STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}${layout_datadir}"
 
 STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_SYS}"
-STAGING_BINDIR = "${STAGING_DIR_HOST}/bin"
-STAGING_LIBDIR = "${STAGING_DIR_HOST}/lib"
-STAGING_INCDIR = "${STAGING_DIR_HOST}/include"
-STAGING_DATADIR = "${STAGING_DIR_HOST}/share"
+STAGING_BINDIR = "${STAGING_DIR_HOST}${layout_bindir}"
+STAGING_LIBDIR = "${STAGING_DIR_HOST}${layout_libdir}"
+STAGING_INCDIR = "${STAGING_DIR_HOST}${layout_includedir}"
+STAGING_DATADIR = "${STAGING_DIR_HOST}${layout_datadir}"
 STAGING_LOADER_DIR = "${STAGING_DIR_HOST}/loader"
 STAGING_FIRMWARE_DIR = "${STAGING_DIR_HOST}/firmware"
 STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"
@@ -300,7 +331,7 @@
 
 export BUILD_CPPFLAGS = "-isystem${STAGING_INCDIR_NATIVE}"
 export CPPFLAGS = "${TARGET_CPPFLAGS}"
-export TARGET_CPPFLAGS = "-isystem${STAGING_DIR_TARGET}/include"
+export TARGET_CPPFLAGS = "-isystem${STAGING_DIR_TARGET}${layout_includedir}"
 
 export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
 export CFLAGS = "${TARGET_CFLAGS}"
@@ -314,8 +345,8 @@
                         -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"
 export LDFLAGS = "${TARGET_LDFLAGS}"
-export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}/lib \
-                         -Wl,-rpath-link,${STAGING_DIR_TARGET}/lib \
+export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${layout_libdir} \
+                         -Wl,-rpath-link,${STAGING_DIR_TARGET}${layout_libdir} \
                          -Wl,-O1"
 
 # Which flags to leave by strip-flags() in bin/build/oebuild.sh ?
Index: classes/base.bbclass
===================================================================
--- classes/base.bbclass        (revision 3018)
+++ classes/base.bbclass        (working copy)
@@ -684,8 +684,8 @@
        :
 }
 
-do_populate_staging[dirs] = "${STAGING_DIR_TARGET}/bin ${STAGING_DIR_TARGET}/lib \
-                            ${STAGING_DIR_TARGET}/include \
+do_populate_staging[dirs] = "${STAGING_DIR_TARGET}/${layout_bindir} ${STAGING_DIR_TARGET}/${layout_libdir} \
+                            ${STAGING_DIR_TARGET}/${layout_includedir} \
                             ${STAGING_BINDIR_NATIVE} ${STAGING_LIBDIR_NATIVE} \
                             ${STAGING_INCDIR_NATIVE} \
                             ${STAGING_DATADIR} \
Index: classes/native.bbclass
===================================================================
--- classes/native.bbclass      (revision 3018)
+++ classes/native.bbclass      (working copy)
@@ -47,40 +47,34 @@
 export RANLIB = "${HOST_PREFIX}ranlib"
 export STRIP = "${HOST_PREFIX}strip"
 
-
 # Path prefixes
-base_prefix = "${exec_prefix}"
-prefix = "${STAGING_DIR}"
-exec_prefix = "${STAGING_DIR}/${BUILD_ARCH}-${BUILD_OS}"
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
Index: packages/shasum/shasum-native.bb
===================================================================
--- packages/shasum/shasum-native.bb    (revision 2988)
+++ packages/shasum/shasum-native.bb    (working copy)
@@ -7,5 +7,6 @@
 
 do_fetch[depends] = ""
 do_populate_staging() {
+    install -d ${STAGING_BINDIR}
     install ${S}/oe_sha256sum ${STAGING_BINDIR}
 }
Index: packages/dbus/dbus-glib_0.74.bb
===================================================================
--- packages/dbus/dbus-glib_0.74.bb     (revision 2988)
+++ packages/dbus/dbus-glib_0.74.bb     (working copy)
@@ -15,8 +15,8 @@
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 
 do_configure_prepend() {
-       install -m 0644 ${STAGING_DIR}/${BUILD_SYS}/share/dbus/dbus-bus-introspect.xml ${S}/tools/
-       install -m 0644 ${STAGING_DIR}/${BUILD_SYS}/share/dbus/dbus-glib-bindings.h ${S}/tools/
+       install -m 0644 ${STAGING_DIR_NATIVE}${layout_datadir}/dbus/dbus-bus-introspect.xml ${S}/tools/
+       install -m 0644 ${STAGING_DIR_NATIVE}${layout_datadir}/dbus/dbus-glib-bindings.h ${S}/tools/
 }
 
 do_stage () {
Index: packages/binutils/binutils-cross.inc
===================================================================
--- packages/binutils/binutils-cross.inc        (revision 2988)
+++ packages/binutils/binutils-cross.inc        (working copy)
@@ -3,7 +3,7 @@
 DEPENDS += "flex-native bison-native"
 PROVIDES = "virtual/${TARGET_PREFIX}binutils"
 PACKAGES = ""
-EXTRA_OECONF = "--with-sysroot=${CROSS_DIR}/${TARGET_SYS} \
+EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
                --program-prefix=${TARGET_PREFIX}"
 
 do_stage () {
Index: packages/fontconfig/fontconfig_2.4.2.bb
===================================================================
--- packages/fontconfig/fontconfig_2.4.2.bb     (revision 2988)
+++ packages/fontconfig/fontconfig_2.4.2.bb     (working copy)
@@ -44,7 +44,7 @@
        for i in ${S}/fontconfig/*.h; do install -m 0644 $i ${STAGING_INCDIR}/fontconfig/; done
 }
 
-BUILD_CFLAGS += " -I${STAGING_DIR}/${BUILD_SYS}/include/freetype2"
+BUILD_CFLAGS += " -I${STAGING_DIR_NATIVE}${layout_includedir}/freetype2"
 
 do_configure_append () {
        sed -i 's|LDFLAGS =.*|LDFLAGS =|' fc-case/Makefile
Index: packages/glibc/glibc_2.5.bb
===================================================================
--- packages/glibc/glibc_2.5.bb (revision 2988)
+++ packages/glibc/glibc_2.5.bb (working copy)
@@ -152,10 +152,10 @@
 }
 
 do_stage() {
-       rm -f ${STAGING_LIBDIR}/libc.so.6
-       oe_runmake 'install_root=${STAGING_DIR}/${HOST_SYS}' \
-                  'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-                  '${STAGING_LIBDIR}/libc.so.6' \
+       rm -f ${STAGING_DIR_HOST}/${layout_base_libdir}/libc.so.6
+       oe_runmake 'install_root=${STAGING_DIR_HOST}' \
+                  'includedir=${layout_includedir}' 'libdir=${layout_libdir}' 'slibdir=${layout_base_libdir}' \
+                  '${STAGING_DIR_HOST}${layout_base_libdir}/libc.so.6' \
                   install-headers install-lib
 
        install -d ${STAGING_INCDIR}/gnu \
@@ -169,10 +169,10 @@
                install -m 0644 ${S}/sunrpc/rpcsvc/$h ${STAGING_INCDIR}/rpcsvc/
        done
        for i in libc.a libc_pic.a libc_nonshared.a; do
-               install -m 0644 ${B}/$i ${STAGING_LIBDIR}/ || die "failed to install $i"
+               install -m 0644 ${B}/$i ${STAGING_DIR_HOST}/${layout_base_libdir} || die "failed to install $i"
        done
-       echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIBDIR}/libpthread.so
-       echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
+       echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_DIR_HOST}/${layout_base_libdir}/libpthread.so
+       echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_DIR_HOST}/${layout_base_libdir}/libc.so
 }
 
 require glibc-package.bbclass
Index: packages/qemu/qemu-native_20070613.bb
===================================================================
--- packages/qemu/qemu-native_20070613.bb       (revision 2988)
+++ packages/qemu/qemu-native_20070613.bb       (working copy)
@@ -1,6 +1,5 @@
 require qemu_${PV}.bb
 inherit native
 DEPENDS = "zlib-native"
-prefix = "${STAGING_DIR}/${BUILD_SYS}"
 
 require qemu-gcc3-check.inc
Index: packages/db/db_4.2.52.bb
===================================================================
--- packages/db/db_4.2.52.bb    (revision 2988)
+++ packages/db/db_4.2.52.bb    (working copy)
@@ -71,7 +71,7 @@
 CONFIG_SITE = ""
 do_configure() {
        rm -f ${S}/config.sub
-       cp ${STAGING_DIR}/${BUILD_SYS}/share/gnu-config/config.sub ${S}/config.sub 
+       cp ${STAGING_DIR_NATIVE}/${layout_datadir}/gnu-config/config.sub ${S}/config.sub 
        oe_runconf
 }
 
Index: packages/gcc/gcc-cross_4.1.2.bb
===================================================================
--- packages/gcc/gcc-cross_4.1.2.bb     (revision 2988)
+++ packages/gcc/gcc-cross_4.1.2.bb     (working copy)
@@ -15,6 +15,6 @@
 # cross packaging
 require gcc-package-cross.inc
 
-SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "
+#SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "
 
 EXTRA_OECONF += "--disable-libunwind-exceptions --with-mpfr=${STAGING_DIR}/${BUILD_SYS}"
Index: packages/gcc/gcc3-build-cross.inc
===================================================================
--- packages/gcc/gcc3-build-cross.inc   (revision 2988)
+++ packages/gcc/gcc3-build-cross.inc   (working copy)
@@ -1,7 +1,9 @@
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
 
-EXTRA_OECONF_PATHS = "--with-local-prefix=${STAGING_DIR}/${TARGET_SYS} \
-                     --with-gxx-include-dir=${STAGING_DIR}/${TARGET_SYS}/include/c++"
+EXTRA_OECONF_PATHS = "--with-local-prefix=${STAGING_DIR_TARGET} \
+                     --with-gxx-include-dir=${STAGING_DIR}/${TARGET_SYS}/include/c++ \
+                      --with-sysroot=${STAGING_DIR_TARGET} \
+                      --with-build-sysroot=${STAGING_DIR_TARGET}"
 
 do_configure_prepend () {
        rm -f ${CROSS_DIR}/lib/gcc/${TARGET_SYS}/${BINV}/libgcc_eh.a


--=-59BdVIp8zIwsb9W2/73I--
