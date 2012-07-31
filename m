Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1wI-0007iA-Mo
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:12:02 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so2102689wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 19:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Pjp3MEVQIQjqqrPhqX9i9U0yuxHMe/I2Sz9/hfhA31E=;
	b=MVE3e5itOY3LowVjWxH0Iy2GsmRY/otqIHNYyxNEpuYt9v1sNemh0V2wLB0H7N4VD7
	fhIkFIXs8J1a6V94lASw2pS72ECnH3s2f8QDbnyqMDi2J1p8hYlCdd89I3sJvYqRPErj
	FxHrqp9Ecj7fU5La+nK4b4IHNPLEHviFwxF6iDBu+wYm4zoM02XeSgW+7vM6+PjVyDUe
	KEiVN2yhKz3qkt/8QYawaoOUAcgGggBTlSEt+v+UcIxYUELQi44UIzYy6USLMWkIC53A
	TebiunUH8YAVOe5HwwX1J5vpf0Uf3JH3VVuaYL+vJfiIMqfvuiPQ6m/sVVqXnhJOhyAw
	BRww==
Received: by 10.180.79.229 with SMTP id m5mr2685194wix.13.1343700028253;
	Mon, 30 Jul 2012 19:00:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dc3sm19602839wib.7.2012.07.30.19.00.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 19:00:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:43 +0200
Message-Id: <f2afdd2b988af8d0b4d822c7c03529b725fe24ba.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 18/24] emacs: import from meta-smartphone
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
X-List-Received-Date: Tue, 31 Jul 2012 02:12:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../emacs-23.1/configure.in.lost.backslashes.patch |   24 +++++
 .../emacs/emacs-23.1/nostdlib-unwind.patch         |   16 +++
 .../emacs/emacs-23.1/use-qemu.patch                |  107 ++++++++++++++++++++
 meta-oe/recipes-support/emacs/emacs.inc            |   68 +++++++++++++
 meta-oe/recipes-support/emacs/emacs_23.1.bb        |    8 ++
 5 files changed, 223 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/emacs/emacs-23.1/configure.in.lost.backslashes.patch
 create mode 100644 meta-oe/recipes-support/emacs/emacs-23.1/nostdlib-unwind.patch
 create mode 100644 meta-oe/recipes-support/emacs/emacs-23.1/use-qemu.patch
 create mode 100644 meta-oe/recipes-support/emacs/emacs.inc
 create mode 100644 meta-oe/recipes-support/emacs/emacs_23.1.bb

diff --git a/meta-oe/recipes-support/emacs/emacs-23.1/configure.in.lost.backslashes.patch b/meta-oe/recipes-support/emacs/emacs-23.1/configure.in.lost.backslashes.patch
new file mode 100644
index 0000000..2d29f17
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/emacs-23.1/configure.in.lost.backslashes.patch
@@ -0,0 +1,24 @@
+pending upstream, fixed in 23.2
+http://debbugs.gnu.org/cgi-bin/bugreport.cgi?bug=5047
+https://bugzilla.redhat.com/show_bug.cgi?id=540921
+diff -up emacs-23.1/configure.in.cpp emacs-23.1/configure.in
+--- emacs-23.1/configure.in.cpp	2009-11-30 13:24:53.000000000 +0100
++++ emacs-23.1/configure.in	2009-11-30 13:25:45.000000000 +0100
+@@ -2983,7 +2983,7 @@ echo creating lib-src/Makefile
+   sed -e '1,/start of cpp stuff/d'\
+       -e 's,/\*\*/#\(.*\)$,/* \1 */,' \
+       < Makefile.c > junk.c
+-  $CPP $cpp_undefs -I. -I$srcdir/src $CPPFLAGS junk.c | \
++  $CPP -P $cpp_undefs -I. -I$srcdir/src $CPPFLAGS junk.c | \
+       sed -e 's/^ /	/' -e '/^#/d' -e '/^[ 	]*$/d' > junk2.c
+   cat junk1.c junk2.c > Makefile.new
+   rm -f junk.c junk1.c junk2.c
+@@ -2999,7 +2999,7 @@ echo creating src/Makefile
+   sed -e '1,/start of cpp stuff/d'\
+       -e 's,/\*\*/#\(.*\)$,/* \1 */,' \
+       < Makefile.c > junk.c
+-  $CPP $cpp_undefs -I. -I$srcdir/src $CPPFLAGS junk.c | \
++  $CPP -P $cpp_undefs -I. -I$srcdir/src $CPPFLAGS junk.c | \
+       sed -e 's/^ /	/' -e '/^#/d' -e '/^[ 	]*$/d' > junk2.c
+   cat junk1.c junk2.c > Makefile.new
+   rm -f junk.c junk1.c junk2.c
diff --git a/meta-oe/recipes-support/emacs/emacs-23.1/nostdlib-unwind.patch b/meta-oe/recipes-support/emacs/emacs-23.1/nostdlib-unwind.patch
new file mode 100644
index 0000000..4200301
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/emacs-23.1/nostdlib-unwind.patch
@@ -0,0 +1,16 @@
+Fix linking problem:
+undefined reference to `__aeabi_unwind_cpp_pr0'
+undefined reference to `__aeabi_unwind_cpp_pr1'
+Index: emacs/src/Makefile.in
+===================================================================
+--- emacs.orig/src/Makefile.in	2008-08-16 14:20:18.000000000 +0000
++++ emacs/src/Makefile.in	2008-08-16 14:51:25.000000000 +0000
+@@ -443,7 +443,7 @@
+    ask GCC explicitly where to find libgcc.a.  */
+ 
+ #ifndef LINKER
+-#define LINKER $(CC) -nostdlib
++#define LINKER $(CC) -nostdlib -lgcc_s
+ #endif
+ 
+ #ifndef LIB_GCC
diff --git a/meta-oe/recipes-support/emacs/emacs-23.1/use-qemu.patch b/meta-oe/recipes-support/emacs/emacs-23.1/use-qemu.patch
new file mode 100644
index 0000000..255b07f
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/emacs-23.1/use-qemu.patch
@@ -0,0 +1,107 @@
+Index: emacs-23.1/leim/Makefile.in
+===================================================================
+--- emacs-23.1.orig/leim/Makefile.in
++++ emacs-23.1/leim/Makefile.in
+@@ -51,7 +51,7 @@ buildlisppath=${srcdir}/${dot}${dot}/lis
+ 
+ # How to run Emacs.
+ RUN-EMACS = EMACSLOADPATH=$(buildlisppath) LC_ALL=C \
+-	${BUILT-EMACS} -batch --no-init-file --no-site-file --multibyte
++	${QEMU} ${BUILT-EMACS} -batch --no-init-file --no-site-file --multibyte
+ 
+ # Subdirectories to be made if ${srcdir} is different from the current
+ # directory.
+Index: emacs-23.1/lib-src/Makefile.in
+===================================================================
+--- emacs-23.1.orig/lib-src/Makefile.in
++++ emacs-23.1/lib-src/Makefile.in
+@@ -23,7 +23,7 @@
+ SHELL = /bin/sh
+ 
+ # Following ../lisp/Makefile.in.
+-EMACS = ../src/emacs
++EMACS = ${QEMU} ../src/emacs
+ EMACSOPT = -batch --no-site-file --multibyte
+ 
+ # ==================== Things `configure' will edit ====================
+@@ -371,7 +371,7 @@ TAGS: etags${EXEEXT}
+    clobbered too.  */
+ test-distrib${EXEEXT}: ${srcdir}/test-distrib.c
+ 	$(CC) ${ALL_CFLAGS} -o test-distrib ${srcdir}/test-distrib.c
+-	./test-distrib ${srcdir}/testfile
++	${QEMU} ./test-distrib ${srcdir}/testfile
+ 
+ /* We need the following in order to create a <getopt.h> when the system
+    does not have one that works with the given compiler.  */
+Index: emacs-23.1/lisp/Makefile.in
+===================================================================
+--- emacs-23.1.orig/lisp/Makefile.in
++++ emacs-23.1/lisp/Makefile.in
+@@ -26,8 +26,7 @@ srcdir=@srcdir@/..
+ # You can specify a different executable on the make command line,
+ # e.g. "make EMACS=../src/emacs ...".
+ 
+-EMACS = ../src/emacs
+-
++EMACS = "${QEMU} ../src/emacs"
+ # Command line flags for Emacs.  This must include --multibyte,
+ # otherwise some files will not compile.
+ 
+Index: emacs-23.1/Makefile.in
+===================================================================
+--- emacs-23.1.orig/Makefile.in
++++ emacs-23.1/Makefile.in
+@@ -336,7 +336,7 @@ lib-src lisp: Makefile FRC
+ # all preloaded elisp files, and only then dump the actual src/emacs, which
+ # is not wrong, but is overkill in 99.99% of the cases.
+ src: Makefile FRC
+-	boot=bootstrap-emacs$(EXEEXT);                         \
++	boot=${QEMU} bootstrap-emacs$(EXEEXT);                         \
+ 	if [ ! -x "src/$$boot" ]; then                                     \
+ 	    cd $@; $(MAKE) all $(MFLAGS)                                   \
+ 	      CC='${CC}' CFLAGS='${CFLAGS}' CPPFLAGS='${CPPFLAGS}'         \
+Index: emacs-23.1/src/Makefile.in
+===================================================================
+--- emacs-23.1.orig/src/Makefile.in
++++ emacs-23.1/src/Makefile.in
+@@ -497,7 +497,7 @@
+    this with the shell''s ``for'' construct.
+    Note that some people do not have '.'  in their paths, so we must
+    use ./prefix-args.  */
+-#define YMF_PASS_LDFLAGS(flags) `./prefix-args -Xlinker flags`
++#define YMF_PASS_LDFLAGS(flags) `${QEMU} ./prefix-args -Xlinker flags`
+ #else
+ #define YMF_PASS_LDFLAGS(flags) flags
+ #endif
+@@ -895,9 +895,9 @@ LIBES = $(LOADLIBES) $(LIBS) $(LIBX) $(L
+ #endif
+ 
+ #ifdef HAVE_SHM
+-RUN_TEMACS = `/bin/pwd`/temacs -nl
++RUN_TEMACS = ${QEMU} temacs -nl
+ #else
+-RUN_TEMACS = `/bin/pwd`/temacs
++RUN_TEMACS = ${QEMU} temacs
+ #endif
+ 
+ all: emacs${EXEEXT} OTHER_FILES
+@@ -912,7 +912,7 @@ emacs${EXEEXT}: temacs${EXEEXT} ${etc}DO
+ 	@: bootstrap-emacs, so let us replace it.
+ 	-ln -f emacs${EXEEXT} bootstrap-emacs${EXEEXT}
+ #endif /* ! defined (CANNOT_DUMP) */
+-	-./emacs -q -batch -f list-load-path-shadows
++	-${QEMU} ./emacs -q -batch -f list-load-path-shadows
+ 
+ /* We run make-docfile twice because the command line may get too long
+    on some systems.  */
+@@ -929,8 +929,8 @@ emacs${EXEEXT}: temacs${EXEEXT} ${etc}DO
+    only in order to reduce the command line length.  --Stef  */
+ ${etc}DOC: ${libsrc}make-docfile${EXEEXT} ${obj} ${lisp} ${SOME_MACHINE_LISP}
+ 	-rm -f ${etc}DOC
+-	${libsrc}make-docfile -d ${srcdir} ${SOME_MACHINE_OBJECTS} ${obj} > ${etc}DOC
+-	${libsrc}make-docfile -a ${etc}DOC -d ${srcdir} ${SOME_MACHINE_LISP} ${shortlisp}
++	${QEMU}${libsrc}make-docfile -d ${srcdir} ${SOME_MACHINE_OBJECTS} ${obj} > ${etc}DOC
++	${QEMU} ${libsrc}make-docfile -a ${etc}DOC -d ${srcdir} ${SOME_MACHINE_LISP} ${shortlisp}
+ 
+ ${libsrc}make-docfile${EXEEXT}:
+ 	cd ${libsrc}; ${MAKE} ${MFLAGS} make-docfile${EXEEXT}
diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
new file mode 100644
index 0000000..5883719
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -0,0 +1,68 @@
+DESCRIPTION = "Emacs"
+HOMEPAGE = "http://www.gnu.org/software/emacs/"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+SECTION = "editor"
+# and it needs to run some generated binaries..
+DEPENDS += "qemu-native"
+
+DEPENDS +=" liblockfile"
+
+X11DEPENDS = "gtk+ libungif dbus"
+
+EXTRA_OECONF =  "--without-sound "
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG[x11] = "--with-x-toolkit=gtk,--without-x,${X11DEPENDS}"
+
+inherit autotools
+
+PACKAGES =+ "${PN}-el"
+
+FILES_${PN}-el = "${datadir}/emacs/*/*/*.el.gz \
+                  ${datadir}/emacs/*/*/*/*.el.gz"
+
+FILES_${PN} += "${datadir}/emacs"
+
+FILES_${PN}-dbg += "${libexecdir}/emacs/*/*/.debug ${datadir}/emacs/*/*/.debug"
+
+TREEDIR = "${WORKDIR}/qemu-treedir"
+
+QEMUARCH= "${TARGET_ARCH}"
+QEMUARCH_i486 = "i386"
+QEMUARCH_i586 = "i386"
+QEMUARCH_i686 = "i386"
+
+# Large stack is required at least on x86_64 host, otherwise random segfaults appear:
+QEMU = "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L ${TREEDIR} "
+
+export LOGNAME = "$(whoami)"
+
+do_compile_prepend() {
+	sed -i ':1;s:\(START.* \|LIB_STANDARD.* \|LIBES.* \)/usr/lib:\1${STAGING_LIBDIR}:;t1' ${S}/src/s/gnu-linux.h `find "${S}" -name Makefile`
+	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
+# Ugly hack, see files/use-qemu.patch for more:
+	ln -sf ../src/emacs lisp/emacs
+	ln -sf ../src/emacs lib-src/emacs
+	ln -sf ../src/emacs leim/emacs
+#copy STAGING_DIR_TARGET and libgcc_s.so* to WORKDIR/qemu-treedir #copied code from glibc-package.bbclass
+	treedir=${TREEDIR}
+	if [ -e $treedir ];then
+		rm -rf $treedir
+	fi
+	mkdir $treedir
+	cp -pPR ${STAGING_DIR_TARGET}/* $treedir
+	if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so ]; then
+                cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so $treedir/lib
+        fi
+        if [ -f ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so.* ]; then
+                cp -pPR ${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so.* $treedir/lib
+        fi
+	# stupid hack, but without it, it tries to use /usr/lib/libc.so from host and fails
+	# temacs: error while loading shared libraries: /usr/lib/libc.so: ELF file version does not match current one
+	if [ ! -f $treedir/lib/libc.so ]; then
+		ln -s libc.so.6 $treedir/lib/libc.so
+	fi
+}
+
+EXTRA_OEMAKE += 'QEMU="${QEMU}"'
diff --git a/meta-oe/recipes-support/emacs/emacs_23.1.bb b/meta-oe/recipes-support/emacs/emacs_23.1.bb
new file mode 100644
index 0000000..fe134f8
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/emacs_23.1.bb
@@ -0,0 +1,8 @@
+require emacs.inc
+
+SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
+           file://use-qemu.patch \
+           file://nostdlib-unwind.patch \
+           file://configure.in.lost.backslashes.patch"
+SRC_URI[tarball.md5sum] = "a620d4452769d04ad8864d662f34f8dd"
+SRC_URI[tarball.sha256sum] = "a94cd46301f000d2d1dcd3fd7ef08ad952846d01ca5d4168b4ec3e38e857da47"
-- 
1.7.8.6



