Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IX3Yi-0007M6-9B
	for openembedded-devel@openembedded.org; Mon, 17 Sep 2007 01:29:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8GNQ60O017135;
	Mon, 17 Sep 2007 00:26:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16528-08; Mon, 17 Sep 2007 00:26:02 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8GNPvqp017129
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 17 Sep 2007 00:25:57 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Mon, 17 Sep 2007 00:25:56 +0100
Message-Id: <1189985156.9658.38.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Ross Burton <ross@openedhand.com>
Subject: RFC: Staging layout and pkgconfig sysroot support
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
X-List-Received-Date: Sun, 16 Sep 2007 23:29:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The sed code in pkgconfig.bbclass has always struck me as ugly. In an
ideal world we shouldn't have to rewrite the contents of the pkgconfig
files to make them work with OE.

Packages like dbus and eds are starting to add paths to runtime module
and state directories into the pkgconfig files and OE's current approach
totally breaks these.

Assuming our staging directory looked like our target systems, the paths
in the pkgconfig files would just need a path prepending to them to make
them work properly. Convention in other places refers to this as a
"sysroot". I found such a patch for pkgconfig on its mailing list which
does this for -L and -I compiler options so I thought experiment a bit
with it.

The big question is therefore whether we want staging to look like the
target system? It simplifies some things and complicates others. The
creation of two lib directories means more compiler options and more
STAGING* variables. As yet I haven't touched on the up to four bin
directories that could result (/bin, /sbin, /usr/bin, /usb/sbin)
although thankfully its more native binaries we're interested in. In
theory we could keep the existing layout for native packages and just
change the layout of target systems...

I've experimented a bit and the changes below show what needed changes
in poky to build up to gtk+. As can be seen, assumptions about the
staging layout are spread about the metadata quite a bit. Having said
that I think there is scope for some valid cleanups here regardless of
which layout we end up choosing.

As I see it, changing to match the target system structure has the
advantages:

 * "make install" could be used more directly with staging instead of 
   the current two step system since the autoconf bindir / libdir / 
   includedir paths will match
 * Less manipulation of staged files should be needed since the 
   directory structures match more
 * pkgconfig with a sysroot option will "just work"
 * libtool could in theory be patched to support the idea of a sysroot
 * Package files match the layout in staging resulting in possibly 
   simplified packages staging in the future
 * Eventually might allow qemu to "boot" staging
 * Simplifies meta-toolchain slightly

and the disadvantages:

 * Breaks compatibility with existing builds quite fundamentally
 * Will take a while to iron out all the bugs the change will introduce
 * The existing different layout system stresses the packages and 
   highlights bad assumptions in them which we lose.

I'm interested in people's views on whether this would be a worthwhile
change or not? Should we change all staging layouts or leave say native
packages as they are?

As a first step I will investigate removing some of the hardcoded layout
assumptions I've found so far as I think they're good to remove
regardless of whether we change staging layout or not. In theory people
or distros could maybe then choose their own layout even!

Cheers,

Richard


Index: conf/bitbake.conf
===================================================================
--- conf/bitbake.conf	(revision 2734)
+++ conf/bitbake.conf	(working copy)
@@ -167,17 +167,26 @@
 B = "${S}"
 
 STAGING_DIR = "${TMPDIR}/staging"
-STAGING_BINDIR = "${STAGING_DIR}/${HOST_SYS}/bin"
-STAGING_BINDIR_CROSS = "${STAGING_DIR}/${BUILD_SYS}/bin/${HOST_SYS}"
-STAGING_BINDIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}/bin"
-STAGING_LIBDIR = "${STAGING_DIR}/${HOST_SYS}/lib"
-STAGING_LIBDIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}/lib"
+
+STAGING_BINDIR_CROSS = "${STAGING_DIR}/${BUILD_SYS}/usr/bin/${HOST_SYS}"
+STAGING_BINDIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}/usr/bin"
+STAGING_LIBDIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}/usr/lib"
+STAGING_INCDIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}/usr/include"
 STAGING_ETCDIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}/etc"
-STAGING_INCDIR = "${STAGING_DIR}/${HOST_SYS}/include"
-STAGING_DATADIR = "${STAGING_DIR}/${HOST_SYS}/share"
+
+STAGING_BASELIBDIR_TARGET = "${STAGING_DIR}/${TARGET_SYS}/lib"
+STAGING_LIBDIR_TARGET = "${STAGING_DIR}/${TARGET_SYS}/usr/lib"
+STAGING_INCDIR_TARGET = "${STAGING_DIR}/${TARGET_SYS}/usr/include"
+
+STAGING_BINDIR = "${STAGING_DIR}/${HOST_SYS}/usr/bin"
+STAGING_BASELIBDIR = "${STAGING_DIR}/${HOST_SYS}/lib"
+STAGING_LIBDIR = "${STAGING_DIR}/${HOST_SYS}/usr/lib"
+STAGING_INCDIR = "${STAGING_DIR}/${HOST_SYS}/usr/include"
+STAGING_DATADIR = "${STAGING_DIR}/${HOST_SYS}/usr/share"
+
 STAGING_LOADER_DIR = "${STAGING_DIR}/${HOST_SYS}/loader"
 STAGING_FIRMWARE_DIR = "${STAGING_DIR}/${HOST_SYS}/firmware"
-STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"
+STAGING_PYDIR = "${STAGING_DIR}/usr/lib/python2.4"
 
 DEPLOY_DIR = "${TMPDIR}/deploy"
 DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
@@ -290,9 +299,9 @@
 # Build flags and options.
 ##################################################################
 
-export BUILD_CPPFLAGS = "-isystem${STAGING_DIR}/${BUILD_SYS}/include"
+export BUILD_CPPFLAGS = "-isystem${STAGING_INCDIR_NATIVE}"
 export CPPFLAGS = "${TARGET_CPPFLAGS}"
-export TARGET_CPPFLAGS = "-isystem${STAGING_DIR}/${TARGET_SYS}/include"
+export TARGET_CPPFLAGS = "-isystem${STAGING_INCDIR_TARGET}"
 
 export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
 export CFLAGS = "${TARGET_CFLAGS}"
@@ -302,12 +311,14 @@
 export CXXFLAGS = "${TARGET_CXXFLAGS}"
 export TARGET_CXXFLAGS = "${TARGET_CFLAGS} -fpermissive"
 
-export BUILD_LDFLAGS = "-L${STAGING_DIR}/${BUILD_SYS}/lib \
-                        -Wl,-rpath-link,${STAGING_DIR}/${BUILD_SYS}/lib \
-                        -Wl,-rpath,${STAGING_DIR}/${BUILD_SYS}/lib -Wl,-O1"
+export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
+                        -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
+                        -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"
 export LDFLAGS = "${TARGET_LDFLAGS}"
-export TARGET_LDFLAGS = "-L${STAGING_DIR}/${TARGET_SYS}/lib \
-                         -Wl,-rpath-link,${STAGING_DIR}/${TARGET_SYS}/lib \
+export TARGET_LDFLAGS = "-L${STAGING_BASELIBDIR_TARGET} \
+                         -Wl,-rpath-link,${STAGING_BASELIBDIR_TARGET} \
+                         -L${STAGING_LIBDIR_TARGET} \
+                         -Wl,-rpath-link,${STAGING_LIBDIR_TARGET} \
                          -Wl,-O1"
 
 # Which flags to leave by strip-flags() in bin/build/oebuild.sh ?
@@ -437,6 +448,7 @@
 
 export PKG_CONFIG_DIR = "${STAGING_LIBDIR}/pkgconfig"
 export PKG_CONFIG_PATH = "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig"
+export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR}/${TARGET_SYS}"
 export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 
 export QMAKE_MKSPEC_PATH = "${STAGING_DIR}/${BUILD_SYS}/share/qmake"
Index: classes/pkgconfig.bbclass
===================================================================
--- classes/pkgconfig.bbclass	(revision 2734)
+++ classes/pkgconfig.bbclass	(working copy)
@@ -6,19 +6,21 @@
 def get_pkgconfig_mangle(d):
 	import bb.data
 	s = "-e ''"
-	if not bb.data.inherits_class('native', d):
-		s += " -e 's:=${libdir}:=OELIBDIR:;'"
-		s += " -e 's:=${includedir}:=OEINCDIR:;'"
-		s += " -e 's:=${datadir}:=OEDATADIR:'"
-		s += " -e 's:=${prefix}:=OEPREFIX:'"
-		s += " -e 's:=${exec_prefix}:=OEEXECPREFIX:'"
-		s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
-		s += " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
-		s += " -e 's:OEDATADIR:${STAGING_DATADIR}:'"
-		s += " -e 's:OEPREFIX:${STAGING_LIBDIR}/..:'"
-		s += " -e 's:OEEXECPREFIX:${STAGING_LIBDIR}/..:'"
 	return s
 
+#	if not bb.data.inherits_class('native', d):
+#		s += " -e 's:=${libdir}:=OELIBDIR:;'"
+#		s += " -e 's:=${includedir}:=OEINCDIR:;'"
+#		s += " -e 's:=${datadir}:=OEDATADIR:'"
+#		s += " -e 's:=${prefix}:=OEPREFIX:'"
+#		s += " -e 's:=${exec_prefix}:=OEEXECPREFIX:'"
+#		s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
+#		s += " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
+#		s += " -e 's:OEDATADIR:${STAGING_DATADIR}:'"
+#		s += " -e 's:OEPREFIX:${STAGING_LIBDIR}/..:'"
+#		s += " -e 's:OEEXECPREFIX:${STAGING_LIBDIR}/..:'"
+
+
 do_stage_append () {
 	for pc in `find ${S} -name '*.pc' -type f | grep -v -- '-uninstalled.pc$'`; do
 		pcname=`basename $pc`
Index: classes/base.bbclass
===================================================================
--- classes/base.bbclass	(revision 2734)
+++ classes/base.bbclass	(working copy)
@@ -673,11 +673,9 @@
 	:
 }
 
-do_populate_staging[dirs] = "${STAGING_DIR}/${TARGET_SYS}/bin ${STAGING_DIR}/${TARGET_SYS}/lib \
-			     ${STAGING_DIR}/${TARGET_SYS}/include \
-			     ${STAGING_DIR}/${BUILD_SYS}/bin ${STAGING_DIR}/${BUILD_SYS}/lib \
-			     ${STAGING_DIR}/${BUILD_SYS}/include \
-			     ${STAGING_DATADIR} \
+do_populate_staging[dirs] = "${STAGING_BINDIR} ${STAGING_LIBDIR} ${STAGING_INCDIR} ${STAGING_DATADIR} \
+			     ${STAGING_BINDIR_NATIVE} ${STAGING_LIBDIR_NATIVE} \
+			     ${STAGING_DIR}/${BUILD_SYS}/usr/include \
 			     ${S} ${B}"
 
 # Could be compile but populate_staging and do_install shouldn't run at the same time
Index: classes/autotools.bbclass
===================================================================
--- classes/autotools.bbclass	(revision 2734)
+++ classes/autotools.bbclass	(working copy)
@@ -97,9 +97,9 @@
 			AUTOV=`automake --version |head -n 1 |sed "s/.* //;s/\.[0-9]\+$//"`
 			automake --version
 			echo "AUTOV is $AUTOV"
-			install -d ${STAGING_DIR}/${HOST_SYS}/share/aclocal
-			install -d ${STAGING_DIR}/${HOST_SYS}/share/aclocal-$AUTOV
-			acpaths="$acpaths -I ${STAGING_DIR}/${HOST_SYS}/share/aclocal-$AUTOV -I ${STAGING_DIR}/${HOST_SYS}/share/aclocal"
+			install -d ${STAGING_DIR}/${HOST_SYS}/usr/share/aclocal
+			install -d ${STAGING_DIR}/${HOST_SYS}/usr/share/aclocal-$AUTOV
+			acpaths="$acpaths -I ${STAGING_DIR}/${HOST_SYS}/usr/share/aclocal-$AUTOV -I ${STAGING_DIR}/${HOST_SYS}/usr/share/aclocal"
 			# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
 			# like it was auto-generated.  Work around this by blowing it away
 			# by hand, unless the package specifically asked not to run aclocal.
Index: classes/native.bbclass
===================================================================
--- classes/native.bbclass	(revision 2734)
+++ classes/native.bbclass	(working copy)
@@ -47,39 +47,38 @@
 export RANLIB = "${HOST_PREFIX}ranlib"
 export STRIP = "${HOST_PREFIX}strip"
 
-
 # Path prefixes
-base_prefix = "${exec_prefix}"
-prefix = "${STAGING_DIR}"
-exec_prefix = "${STAGING_DIR}/${BUILD_ARCH}-${BUILD_OS}"
+base_prefix = "${STAGING_DIR}/${BUILD_ARCH}-${BUILD_OS}"
+prefix = "${base_prefix}/usr"
+exec_prefix = "${prefix}"
 
 # Base paths
-base_bindir = "${base_prefix}/bin"
-base_sbindir = "${base_prefix}/bin"
-base_libdir = "${base_prefix}/lib"
+#base_bindir = "${base_prefix}/bin"
+#base_sbindir = "${base_prefix}/bin"
+#base_libdir = "${base_prefix}/lib"
 
 # Architecture independent paths
-sysconfdir = "${prefix}/etc"
-sharedstatedir = "${prefix}/com"
-localstatedir = "${prefix}/var"
-infodir = "${datadir}/info"
-mandir = "${datadir}/man"
-docdir = "${datadir}/doc"
-servicedir = "${prefix}/srv"
+sysconfdir = "${base_prefix}/etc"
+# sharedstatedir = "${base_prefix}/com"
+localstatedir = "${base_prefix}/var"
+#infodir = "${datadir}/info"
+#mandir = "${datadir}/man"
+#docdir = "${datadir}/doc"
+servicedir = "${base_prefix}/srv"
 
 # Architecture dependent paths
-bindir = "${exec_prefix}/bin"
-sbindir = "${exec_prefix}/bin"
-libexecdir = "${exec_prefix}/libexec"
-libdir = "${exec_prefix}/lib"
-includedir = "${exec_prefix}/include"
-oldincludedir = "${exec_prefix}/include"
+#bindir = "${exec_prefix}/bin"
+#sbindir = "${exec_prefix}/bin"
+#libexecdir = "${exec_prefix}/libexec"
+#libdir = "${exec_prefix}/lib"
+#includedir = "${exec_prefix}/include"
+#oldincludedir = "${exec_prefix}/include"
 
 # Datadir is made arch dependent here, primarily
 # for autoconf macros, and other things that
 # may be manipulated to handle crosscompilation
 # issues.
-datadir = "${exec_prefix}/share"
+#datadir = "${exec_prefix}/share"
 
 do_stage () {
 	if [ "${INHIBIT_NATIVE_STAGE_INSTALL}" != "1" ]
@@ -93,3 +92,4 @@
 }
 
 PKG_CONFIG_PATH .= "${EXTRA_NATIVE_PKGCONFIG_PATH}"
+export PKG_CONFIG_SYSROOT_DIR = ""
\ No newline at end of file
Index: packages/db/db_4.2.52.bb
===================================================================
--- packages/db/db_4.2.52.bb	(revision 2734)
+++ packages/db/db_4.2.52.bb	(working copy)
@@ -71,7 +71,7 @@
 CONFIG_SITE = ""
 do_configure() {
 	rm -f ${S}/config.sub
-	cp ${STAGING_DIR}/${BUILD_SYS}/share/gnu-config/config.sub ${S}/config.sub 
+	cp ${STAGING_DIR}/${BUILD_SYS}/usr/share/gnu-config/config.sub ${S}/config.sub 
 	oe_runconf
 }
 
Index: packages/fontconfig/fontconfig_2.4.2.bb
===================================================================
--- packages/fontconfig/fontconfig_2.4.2.bb	(revision 2734)
+++ packages/fontconfig/fontconfig_2.4.2.bb	(working copy)
@@ -44,7 +44,7 @@
 	for i in ${S}/fontconfig/*.h; do install -m 0644 $i ${STAGING_INCDIR}/fontconfig/; done
 }
 
-BUILD_CFLAGS += " -I${STAGING_DIR}/${BUILD_SYS}/include/freetype2"
+BUILD_CFLAGS += " -I${STAGING_DIR}/${BUILD_SYS}/usr/include/freetype2"
 
 do_configure_append () {
 	sed -i 's|LDFLAGS =.*|LDFLAGS =|' fc-case/Makefile
Index: packages/glibc/glibc_2.5.bb
===================================================================
--- packages/glibc/glibc_2.5.bb	(revision 2734)
+++ packages/glibc/glibc_2.5.bb	(working copy)
@@ -154,10 +154,11 @@
 }
 
 do_stage() {
-	rm -f ${STAGING_LIBDIR}/libc.so.6
+	STAGING_BASE_LIBDIR='${STAGING_DIR}/${HOST_SYS}${base_libdir}'
+	rm -f $STAGING_BASE_LIBDIR/libc.so.6
 	oe_runmake 'install_root=${STAGING_DIR}/${HOST_SYS}' \
-		   'includedir=/include' 'libdir=/lib' 'slibdir=/lib' \
-		   '${STAGING_LIBDIR}/libc.so.6' \
+		   'includedir=${includedir}' 'libdir=${libdir}' 'slibdir=${base_libdir}' \
+		   "$STAGING_BASE_LIBDIR/libc.so.6" \
 		   install-headers install-lib
 
 	install -d ${STAGING_INCDIR}/gnu \
@@ -171,10 +172,10 @@
 		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${STAGING_INCDIR}/rpcsvc/
 	done
 	for i in libc.a libc_pic.a libc_nonshared.a; do
-		install -m 0644 ${B}/$i ${STAGING_LIBDIR}/ || die "failed to install $i"
+		install -m 0644 ${B}/$i $STAGING_BASE_LIBDIR/ || die "failed to install $i"
 	done
-	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${STAGING_LIBDIR}/libpthread.so
-	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${STAGING_LIBDIR}/libc.so
+	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > $STAGING_BASE_LIBDIR/libpthread.so
+	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > $STAGING_BASE_LIBDIR/libc.so
 
 	rm -f ${CROSS_DIR}/${TARGET_SYS}/lib/libc.so.6
 	oe_runmake 'install_root=${CROSS_DIR}/${TARGET_SYS}' \
Index: packages/pkgconfig/pkgconfig.inc
===================================================================
--- packages/pkgconfig/pkgconfig.inc	(revision 2736)
+++ packages/pkgconfig/pkgconfig.inc	(working copy)
@@ -8,6 +8,7 @@
 PR = "r1"
 
 SRC_URI = "http://pkgconfig.freedesktop.org/releases/pkg-config-${PV}.tar.gz \
+           file://sysroot-support.patch;patch=1 \
            file://glibconfig-sysdefs.h"
 
 S = "${WORKDIR}/pkg-config-${PV}/"
Index: packages/pkgconfig/pkgconfig-0.22/sysroot-support.patch
===================================================================
--- packages/pkgconfig/pkgconfig-0.22/sysroot-support.patch	(revision 0)
+++ packages/pkgconfig/pkgconfig-0.22/sysroot-support.patch	(revision 0)
@@ -0,0 +1,102 @@
+Add support for PKG_CONFIG_SYSROOT_DIR to pkgconfig
+
+---
+ main.c       |    5 ++++-
+ pkg-config.1 |    9 +++++++++
+ pkg.c        |   14 +++++++++++++-
+ pkg.h        |    3 +++
+ 4 files changed, 29 insertions(+), 2 deletions(-)
+
+Index: pkg-config-0.22/main.c
+===================================================================
+--- pkg-config-0.22.orig/main.c	2007-09-14 10:20:15.000000000 +0100
++++ pkg-config-0.22/main.c	2007-09-14 10:22:41.000000000 +0100
+@@ -46,6 +46,8 @@
+ static int want_debug_spew = 0;
+ static int want_verbose_errors = 0;
+ static int want_stdout_errors = 0;
++char *pcsysrootdir = NULL;
++
+ 
+ void
+ debug_spew (const char *format, ...)
+@@ -196,7 +198,7 @@ main (int argc, char **argv)
+   GString *str;
+   GSList *packages = NULL;
+   char *search_path;
+-  char *pcbuilddir;
++	char *pcbuilddir;
+   const char *pkglibdir;
+   char **search_dirs;
+   char **iter;
+@@ -345,6 +347,7 @@ main (int argc, char **argv)
+       }
+   }
+ #endif
++  pcsysrootdir = getenv ("PKG_CONFIG_SYSROOT_DIR");
+ 
+   pcbuilddir = getenv ("PKG_CONFIG_TOP_BUILD_DIR");
+   if (pcbuilddir)
+Index: pkg-config-0.22/pkg.c
+===================================================================
+--- pkg-config-0.22.orig/pkg.c	2007-09-14 10:20:15.000000000 +0100
++++ pkg-config-0.22/pkg.c	2007-09-14 10:22:41.000000000 +0100
+@@ -479,11 +479,23 @@ string_list_to_string (GSList *list)
+   GSList *tmp;
+   GString *str = g_string_new ("");
+   char *retval;
++	int offset=0;
+   
+   tmp = list;
+   while (tmp != NULL)
+     {
+-      g_string_append (str, tmp->data);
++			if (pcsysrootdir != NULL)
++				{
++					if (!strncmp(tmp->data,"-I",2) ||
++							!strncmp(tmp->data,"-L",2))
++						{
++							offset=2;
++							g_string_append_c (str,((char*)tmp->data)[0]);
++							g_string_append_c (str,((char*)tmp->data)[1]);
++							g_string_append (str,pcsysrootdir);
++						}
++				}
++      g_string_append (str, tmp->data+offset);
+       g_string_append_c (str, ' ');
+       
+       tmp = g_slist_next (tmp);
+Index: pkg-config-0.22/pkg-config.1
+===================================================================
+--- pkg-config-0.22.orig/pkg-config.1	2007-09-14 10:20:15.000000000 +0100
++++ pkg-config-0.22/pkg-config.1	2007-09-14 10:23:08.000000000 +0100
+@@ -260,6 +260,15 @@ Don't strip -I/usr/include out of cflags
+ Don't strip -L/usr/lib out of libs
+ 
+ .TP
++.I "PKG_CONFIG_SYSROOT_DIR"
++Modify -I and -L to use the directories located in target sysroot.
++this option is usefull when crosscompiling package that use pkg-config
++to determine CFLAGS anf LDFLAGS. -I and -L are modified to point to
++the new system root. this means that a -I/usr/include/libfoo will
++become -I/var/target/usr/include/libfoo with a PKG_CONFIG_SYSROOT_DIR
++equal to /var/target (same rule apply to -L)
++
++.TP
+ .I "PKG_CONFIG_LIBDIR"
+ Replaces the default \fIpkg-config\fP search directory.
+ 
+Index: pkg-config-0.22/pkg.h
+===================================================================
+--- pkg-config-0.22.orig/pkg.h	2007-09-14 10:20:15.000000000 +0100
++++ pkg-config-0.22/pkg.h	2007-09-14 10:22:41.000000000 +0100
+@@ -123,6 +123,9 @@ void disable_private_libs(void);
+ /* If TRUE, do not automatically prefer uninstalled versions */
+ extern gboolean disable_uninstalled;
+ 
++/* string that contain environment */
++extern char* pcsysrootdir;
++
+ #ifdef G_OS_WIN32
+ /* If TRUE, do not automatically define "prefix"  while
+  * parsing each .pc file */
Index: packages/qemu/qemu-native_20070613.bb
===================================================================
--- packages/qemu/qemu-native_20070613.bb	(revision 2734)
+++ packages/qemu/qemu-native_20070613.bb	(working copy)
@@ -1,7 +1,7 @@
 require qemu_${PV}.bb
 inherit native
 DEPENDS = "zlib-native"
-prefix = "${STAGING_DIR}/${BUILD_SYS}"
+#prefix = "${STAGING_DIR}/${BUILD_SYS}"
 
 python __anonymous() {
     from bb import which, data



