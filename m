Received: from smtp203.alice.it ([82.57.200.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QApiS-0007N3-6L
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 22:34:08 +0200
Received: from localhost.localdomain (95.249.56.93) by smtp203.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4C1A2A960886AACC; Fri, 15 Apr 2011 22:31:51 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Apr 2011 22:31:45 +0200
Message-Id: <1302899505-22207-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302899505-22207-1-git-send-email-GNUtoo@no-log.org>
References: <1302899505-22207-1-git-send-email-GNUtoo@no-log.org>
Subject: [PATCH] emacs: add emacs 23.2,remove old emacs
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
X-List-Received-Date: Fri, 15 Apr 2011 20:34:08 -0000

From: Sean Cross <sean@chumby.com>

This patch was made using an old patch found on patchwork.

Here's the original commit message(made by Sean Cross <sean@chumby.com>):

  emacs: Add emacs 23.2

  Emacs 23.2 is the first version that cleanly builds with gcc-4.5.
  This patch adds support for Emacs 23.2.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/emacs/emacs-22.3/use-qemu.patch            |   93 ------------------
 .../configure.in.lost.backslashes.patch            |   24 -----
 recipes/emacs/emacs-x11_20060801.bb                |    5 -
 recipes/emacs/emacs-x11_22.3.bb                    |   18 ----
 recipes/emacs/emacs-x11_23.1.bb                    |   23 -----
 recipes/emacs/emacs-x11_23.2.bb                    |   20 ++++
 recipes/emacs/emacs-x11_cvs.bb                     |    8 --
 recipes/emacs/emacs.inc                            |    3 +
 recipes/emacs/emacs_20060801.bb                    |    3 -
 recipes/emacs/emacs_22.3.bb                        |   14 ---
 recipes/emacs/emacs_23.1.bb                        |   15 ---
 recipes/emacs/emacs_23.2.bb                        |   13 +++
 recipes/emacs/emacs_cvs.bb                         |   52 ----------
 recipes/emacs/files/emacs23.2-use-qemu.patch       |  102 ++++++++++++++++++++
 14 files changed, 138 insertions(+), 255 deletions(-)
 delete mode 100644 recipes/emacs/emacs-22.3/use-qemu.patch
 delete mode 100644 recipes/emacs/emacs-x11-23.1/configure.in.lost.backslashes.patch
 delete mode 100644 recipes/emacs/emacs-x11_20060801.bb
 delete mode 100644 recipes/emacs/emacs-x11_22.3.bb
 delete mode 100644 recipes/emacs/emacs-x11_23.1.bb
 create mode 100644 recipes/emacs/emacs-x11_23.2.bb
 delete mode 100644 recipes/emacs/emacs-x11_cvs.bb
 delete mode 100644 recipes/emacs/emacs_20060801.bb
 delete mode 100644 recipes/emacs/emacs_22.3.bb
 delete mode 100644 recipes/emacs/emacs_23.1.bb
 create mode 100644 recipes/emacs/emacs_23.2.bb
 delete mode 100644 recipes/emacs/emacs_cvs.bb
 create mode 100644 recipes/emacs/files/emacs23.2-use-qemu.patch

diff --git a/recipes/emacs/emacs-22.3/use-qemu.patch b/recipes/emacs/emacs-22.3/use-qemu.patch
deleted file mode 100644
index 3b85dc3..0000000
--- a/recipes/emacs/emacs-22.3/use-qemu.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-Warning: When editing the patch, see the ugly hack (removal of pwd) when calling temacs and emacs.
-For unknown reason, qemu-arm is not able to recognize binary correctly.
-
-Index: emacs-22.3/lib-src/Makefile.in
-===================================================================
---- emacs-22.3.orig/lib-src/Makefile.in	2008-04-24 05:38:12.000000000 +0000
-+++ emacs-22.3/lib-src/Makefile.in	2008-11-21 15:51:14.000000000 +0000
-@@ -24,7 +24,7 @@
- SHELL = /bin/sh
- 
- # Following ../lisp/Makefile.in.
--EMACS = ../src/emacs
-+EMACS = ${QEMU} emacs
- EMACSOPT = -batch --no-site-file --multibyte
- 
- # ==================== Things `configure' will edit ====================
-@@ -388,7 +388,7 @@
-    clobbered too.  */
- test-distrib${EXEEXT}: ${srcdir}/test-distrib.c
- 	$(CC) ${ALL_CFLAGS} -o test-distrib ${srcdir}/test-distrib.c
--	./test-distrib ${srcdir}/testfile
-+	${QEMU} ./test-distrib ${srcdir}/testfile
- 
- /* We need the following in order to create a <getopt.h> when the system
-    doesn't have one that works with the given compiler.  */
-Index: emacs-22.3/lisp/Makefile.in
-===================================================================
---- emacs-22.3.orig/lisp/Makefile.in	2008-08-12 18:35:42.000000000 +0000
-+++ emacs-22.3/lisp/Makefile.in	2008-11-21 15:54:38.000000000 +0000
-@@ -63,7 +63,7 @@
- 
- # The actual Emacs command run in the targets below.
- 
--emacs = EMACSLOADPATH=$(lisp) $(EMACS) $(EMACSOPT)
-+emacs = EMACSLOADPATH=$(lisp) ${QEMU} emacs $(EMACSOPT)
- 
- # Common command to find subdirectories
- 
-Index: emacs-22.3/src/Makefile.in
-===================================================================
---- emacs-22.3.orig/src/Makefile.in	2008-07-11 08:52:53.000000000 +0000
-+++ emacs-22.3/src/Makefile.in	2008-11-21 15:52:09.000000000 +0000
-@@ -497,7 +497,7 @@
-    this with the shell''s ``for'' construct.
-    Note that some people do not have '.'  in their paths, so we must
-    use ./prefix-args.  */
--#define YMF_PASS_LDFLAGS(flags) `./prefix-args -Xlinker flags`
-+#define YMF_PASS_LDFLAGS(flags) `${QEMU} ./prefix-args -Xlinker flags`
- #else
- #define YMF_PASS_LDFLAGS(flags) flags
- #endif
-@@ -949,7 +949,7 @@
- #define OBJECTS_MACHINE
- #endif
- 
--RUN_TEMACS = ./temacs
-+RUN_TEMACS = ${QEMU} temacs
- 
- all: emacs${EXEEXT} OTHER_FILES
- 
-@@ -964,7 +964,7 @@
- 	LC_ALL=C $(RUN_TEMACS) -batch -l loadup dump
- #endif /* ! defined (HAVE_SHM) */
- #endif /* ! defined (CANNOT_DUMP) */
--	-./emacs -q -batch -f list-load-path-shadows
-+	-${QEMU} emacs -q -batch -f list-load-path-shadows
- 
- /* We run make-docfile twice because the command line may get too long
-    on some systems.  */
-@@ -976,8 +976,8 @@
-    Likewise for ${SOME_MACHINE_LISP}.  */
- ${etc}DOC: ${libsrc}make-docfile${EXEEXT} ${obj} ${shortlisp} ${SOME_MACHINE_LISP}
- 	-rm -f ${etc}DOC
--	${libsrc}make-docfile -d ${srcdir} ${SOME_MACHINE_OBJECTS} ${obj} > ${etc}DOC
--	${libsrc}make-docfile -a ${etc}DOC -d ${srcdir} ${SOME_MACHINE_LISP} ${shortlisp}
-+	${QEMU} ${libsrc}make-docfile -d ${srcdir} ${SOME_MACHINE_OBJECTS} ${obj} > ${etc}DOC
-+	${QEMU} ${libsrc}make-docfile -a ${etc}DOC -d ${srcdir} ${SOME_MACHINE_LISP} ${shortlisp}
- 
- ${libsrc}make-docfile${EXEEXT}:
- 	cd ${libsrc}; ${MAKE} ${MFLAGS} make-docfile${EXEEXT}
-Index: emacs-22.3/leim/Makefile.in
-===================================================================
---- emacs-22.3.orig/leim/Makefile.in	2008-01-07 08:09:43.000000000 +0000
-+++ emacs-22.3/leim/Makefile.in	2008-11-21 15:52:50.000000000 +0000
-@@ -51,7 +51,7 @@
- 
- # How to run Emacs.
- RUN-EMACS = EMACSLOADPATH=$(buildlisppath) LC_ALL=C\
--	${BUILT-EMACS} -batch --no-init-file --no-site-file --multibyte
-+	${QEMU} emacs -batch --no-init-file --no-site-file --multibyte
- 
- # Subdirectories to be made if ${srcdir} is different from the current
- # directory.
diff --git a/recipes/emacs/emacs-x11-23.1/configure.in.lost.backslashes.patch b/recipes/emacs/emacs-x11-23.1/configure.in.lost.backslashes.patch
deleted file mode 100644
index 2d29f17..0000000
--- a/recipes/emacs/emacs-x11-23.1/configure.in.lost.backslashes.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-pending upstream, fixed in 23.2
-http://debbugs.gnu.org/cgi-bin/bugreport.cgi?bug=5047
-https://bugzilla.redhat.com/show_bug.cgi?id=540921
-diff -up emacs-23.1/configure.in.cpp emacs-23.1/configure.in
---- emacs-23.1/configure.in.cpp	2009-11-30 13:24:53.000000000 +0100
-+++ emacs-23.1/configure.in	2009-11-30 13:25:45.000000000 +0100
-@@ -2983,7 +2983,7 @@ echo creating lib-src/Makefile
-   sed -e '1,/start of cpp stuff/d'\
-       -e 's,/\*\*/#\(.*\)$,/* \1 */,' \
-       < Makefile.c > junk.c
--  $CPP $cpp_undefs -I. -I$srcdir/src $CPPFLAGS junk.c | \
-+  $CPP -P $cpp_undefs -I. -I$srcdir/src $CPPFLAGS junk.c | \
-       sed -e 's/^ /	/' -e '/^#/d' -e '/^[ 	]*$/d' > junk2.c
-   cat junk1.c junk2.c > Makefile.new
-   rm -f junk.c junk1.c junk2.c
-@@ -2999,7 +2999,7 @@ echo creating src/Makefile
-   sed -e '1,/start of cpp stuff/d'\
-       -e 's,/\*\*/#\(.*\)$,/* \1 */,' \
-       < Makefile.c > junk.c
--  $CPP $cpp_undefs -I. -I$srcdir/src $CPPFLAGS junk.c | \
-+  $CPP -P $cpp_undefs -I. -I$srcdir/src $CPPFLAGS junk.c | \
-       sed -e 's/^ /	/' -e '/^#/d' -e '/^[ 	]*$/d' > junk2.c
-   cat junk1.c junk2.c > Makefile.new
-   rm -f junk.c junk1.c junk2.c
diff --git a/recipes/emacs/emacs-x11_20060801.bb b/recipes/emacs/emacs-x11_20060801.bb
deleted file mode 100644
index a6ed4e7..0000000
--- a/recipes/emacs/emacs-x11_20060801.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require emacs-x11_cvs.bb
-
-SRCDATE = "20060801"
-
-DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/emacs/emacs-x11_22.3.bb b/recipes/emacs/emacs-x11_22.3.bb
deleted file mode 100644
index c198a1f..0000000
--- a/recipes/emacs/emacs-x11_22.3.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require emacs.inc
-
-# full X (non-diet) is needed for X support
-DEPENDS += "gtk+ libungif"
-
-EXTRA_OECONF = "--without-sound --with-x-toolkit=gtk"
-
-RREPLACES_${PN} = "emacs"
-
-FILESPATHPKG =. "emacs-${PV}:"
-SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz \
-	   file://use-qemu.patch \
-	   file://nostdlib-unwind.patch"
-
-S = "${WORKDIR}/emacs-${PV}"
-
-SRC_URI[md5sum] = "aa8ba34f548cd78b35914ae5a7bb87eb"
-SRC_URI[sha256sum] = "7bd9b719db8ee20c75ee0d256737f7fd2c0e2ea30a285a3afbfc32c856420d16"
diff --git a/recipes/emacs/emacs-x11_23.1.bb b/recipes/emacs/emacs-x11_23.1.bb
deleted file mode 100644
index a2a22af..0000000
--- a/recipes/emacs/emacs-x11_23.1.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require emacs.inc
-
-# full X (non-diet) is needed for X support
-DEPENDS += "gtk+ libungif dbus"
-
-PR = "r3"
-
-EXTRA_OECONF = "--without-sound --with-x-toolkit=gtk"
-
-DEFAULT_PREFERENCE = "-1"
-
-RREPLACES_${PN} = "emacs"
-
-FILESPATHPKG =. "emacs-${PV}:"
-SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
-           file://emacs23.1-use-qemu.patch \
-           file://nostdlib-unwind.patch \
-           file://configure.in.lost.backslashes.patch"
-SRC_URI[tarball.md5sum] = "a620d4452769d04ad8864d662f34f8dd"
-SRC_URI[tarball.sha256sum] = "a94cd46301f000d2d1dcd3fd7ef08ad952846d01ca5d4168b4ec3e38e857da47"
-
-
-S = "${WORKDIR}/emacs-${PV}"
diff --git a/recipes/emacs/emacs-x11_23.2.bb b/recipes/emacs/emacs-x11_23.2.bb
new file mode 100644
index 0000000..09e3e37
--- /dev/null
+++ b/recipes/emacs/emacs-x11_23.2.bb
@@ -0,0 +1,20 @@
+require emacs.inc
+
+# full X (non-diet) is needed for X support
+DEPENDS += "gtk+ libungif dbus"
+
+RREPLACES_${PN} = "emacs"
+
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/emacs-${PV}"
+
+EXTRA_OECONF = "--without-sound --with-x-toolkit=gtk"
+
+SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
+	   file://emacs23.2-use-qemu.patch \
+	   file://nostdlib-unwind.patch"
+
+SRC_URI[tarball.md5sum] = "b6691852dae0bc142b3c12749f6b7ade"
+SRC_URI[tarball.sha256sum] = "1617b8289e403bc6345f8fcc4b3ec01755962cf8842b505d971efe08c9bf7919"
+
diff --git a/recipes/emacs/emacs-x11_cvs.bb b/recipes/emacs/emacs-x11_cvs.bb
deleted file mode 100644
index 92dcce1..0000000
--- a/recipes/emacs/emacs-x11_cvs.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require emacs_cvs.bb
-
-# full X (non-diet) is needed for X support
-DEPENDS += "libx11"
-
-EXTRA_OECONF = "--without-sound"
-
-RREPLACES_${PN} = "emacs"
diff --git a/recipes/emacs/emacs.inc b/recipes/emacs/emacs.inc
index 3db264e..4a8d6f1 100644
--- a/recipes/emacs/emacs.inc
+++ b/recipes/emacs/emacs.inc
@@ -3,6 +3,9 @@ HOMEPAGE = "http://www.gnu.org/software/emacs/"
 LICENSE = "GPLv2"
 SECTION = "editor"
 # and it needs to run some generated binaries..
+
+INC_PR = "r1"
+
 DEPENDS += "qemu-native"
 
 DEPENDS +=" liblockfile"
diff --git a/recipes/emacs/emacs_20060801.bb b/recipes/emacs/emacs_20060801.bb
deleted file mode 100644
index fe472b4..0000000
--- a/recipes/emacs/emacs_20060801.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require emacs_cvs.bb
-SRCDATE = "20060801"
-DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/emacs/emacs_22.3.bb b/recipes/emacs/emacs_22.3.bb
deleted file mode 100644
index 5360483..0000000
--- a/recipes/emacs/emacs_22.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require emacs.inc
-
-PR="r1"
-
-EXTRA_OECONF = "--without-sound --without-x"
-
-SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz \
-	   file://use-qemu.patch \
-	   file://nostdlib-unwind.patch"
-
-S = "${WORKDIR}/emacs-${PV}"
-
-SRC_URI[md5sum] = "aa8ba34f548cd78b35914ae5a7bb87eb"
-SRC_URI[sha256sum] = "7bd9b719db8ee20c75ee0d256737f7fd2c0e2ea30a285a3afbfc32c856420d16"
diff --git a/recipes/emacs/emacs_23.1.bb b/recipes/emacs/emacs_23.1.bb
deleted file mode 100644
index 9ea320d..0000000
--- a/recipes/emacs/emacs_23.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require emacs.inc
-
-EXTRA_OECONF = "--without-sound --without-x"
-
-#/!\warning untested recipe
-DEFAULT_PREFERENCE = "-2" 
-
-SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
-	   file://emacs23.1-use-qemu.patch \
-	   file://nostdlib-unwind.patch"
-SRC_URI[tarball.md5sum] = "a620d4452769d04ad8864d662f34f8dd"
-SRC_URI[tarball.sha256sum] = "a94cd46301f000d2d1dcd3fd7ef08ad952846d01ca5d4168b4ec3e38e857da47"
-
-
-S = "${WORKDIR}/emacs-${PV}"
diff --git a/recipes/emacs/emacs_23.2.bb b/recipes/emacs/emacs_23.2.bb
new file mode 100644
index 0000000..194e959
--- /dev/null
+++ b/recipes/emacs/emacs_23.2.bb
@@ -0,0 +1,13 @@
+require emacs.inc
+
+PR = "${INC_PR}.0"
+
+#S = "${WORKDIR}/${PN}-${PV}"
+
+EXTRA_OECONF = "--without-sound --without-x"
+
+SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
+	   file://emacs23.2-use-qemu.patch \
+	   file://nostdlib-unwind.patch"
+SRC_URI[tarball.md5sum] = "b6691852dae0bc142b3c12749f6b7ade"
+SRC_URI[tarball.sha256sum] = "1617b8289e403bc6345f8fcc4b3ec01755962cf8842b505d971efe08c9bf7919"
diff --git a/recipes/emacs/emacs_cvs.bb b/recipes/emacs/emacs_cvs.bb
deleted file mode 100644
index 8ffc22f..0000000
--- a/recipes/emacs/emacs_cvs.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-DESCRIPTION = "Emacs"
-HOMEPAGE = "http://www.gnu.org/software/emacs/"
-LICENSE = "GPLv2"
-SECTION = "editor"
-# and it needs to run some generated binaries..
-DEPENDS += "qemu-native"
-#NOTE: I have found that this only works with qemu-0.8.0. If I use 0.8.1 or 0.8.2
-# the build gets hung up on compiling certain .el files
-
-PV = "22.0.50+cvs${SRCDATE}" 
-PE = "1"
-PR = "r9"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "cvs://anoncvs:anonymous@cvs.savannah.gnu.org/sources/emacs;module=emacs \
-           file://use-qemu.patch"
-S = "${WORKDIR}/emacs"
-
-inherit autotools
-
-PACKAGES =+ "${PN}-el"
-
-FILES_${PN}-el = "${datadir}/emacs/*/*/*.el.gz \
-                  ${datadir}/emacs/*/*/*/*.el.gz"
-
-FILES_${PN} += "${datadir}/emacs"
-
-QEMU = "qemu-${TARGET_ARCH} -L ${STAGING_DIR_TARGET}"
-LDFLAGS += "-L${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
-
-EXTRA_OECONF = "--without-sound --without-x"
-
-do_bootstrap() {
-    cp "${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so.1" "${S}"
-    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${S}"
-    export QEMU="${QEMU}"
-
-    sed -i 's:/usr/lib:${STAGING_LIBDIR}:g' ${S}/src/s/gnu-linux.h
-    find "${S}" -name Makefile | xargs sed -i 's:/usr/lib:${STAGING_LIBDIR}:g'
-
-    cd "${S}"
-    make bootstrap
-}
-
-addtask bootstrap before do_compile after do_configure
-
-do_compile_prepend() {
-    cp "${TOOLCHAIN_PATH}/${TARGET_SYS}/lib/libgcc_s.so.1" "${S}"
-    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${S}"
-    export QEMU="${QEMU}"
-}
diff --git a/recipes/emacs/files/emacs23.2-use-qemu.patch b/recipes/emacs/files/emacs23.2-use-qemu.patch
new file mode 100644
index 0000000..2c3c195
--- /dev/null
+++ b/recipes/emacs/files/emacs23.2-use-qemu.patch
@@ -0,0 +1,102 @@
+diff -ur emacs-23.2-stock/Makefile.in emacs-23.2/Makefile.in
+--- emacs-23.2-stock/Makefile.in	2010-11-19 02:52:08.102072074 +0000
++++ emacs-23.2/Makefile.in	2010-11-19 02:52:15.282048950 +0000
+@@ -336,7 +336,7 @@
+ # all preloaded elisp files, and only then dump the actual src/emacs, which
+ # is not wrong, but is overkill in 99.99% of the cases.
+ src: Makefile FRC
+-	boot=bootstrap-emacs$(EXEEXT);                         \
++	boot=${QEMU} bootstrap-emacs$(EXEEXT);                         \
+ 	if [ ! -x "src/$$boot" ]; then                                     \
+ 	    cd $@; $(MAKE) all $(MFLAGS)                                   \
+ 	      CC='${CC}' CFLAGS='${CFLAGS}' CPPFLAGS='${CPPFLAGS}'         \
+diff -ur emacs-23.2-stock/leim/Makefile.in emacs-23.2/leim/Makefile.in
+--- emacs-23.2-stock/leim/Makefile.in	2010-11-19 02:52:08.202082146 +0000
++++ emacs-23.2/leim/Makefile.in	2010-11-19 02:52:15.282048950 +0000
+@@ -51,7 +51,7 @@
+ 
+ # How to run Emacs.
+ RUN-EMACS = EMACSLOADPATH=$(buildlisppath) LC_ALL=C \
+-	${BUILT-EMACS} -batch --no-init-file --no-site-file --multibyte
++	${QEMU} ${BUILT-EMACS} -batch --no-init-file --no-site-file --multibyte
+ 
+ # Subdirectories to be made if ${srcdir} is different from the current
+ # directory.
+diff -ur emacs-23.2-stock/lib-src/Makefile.in emacs-23.2/lib-src/Makefile.in
+--- emacs-23.2-stock/lib-src/Makefile.in	2010-11-19 02:52:08.082052237 +0000
++++ emacs-23.2/lib-src/Makefile.in	2010-11-19 02:52:15.282048950 +0000
+@@ -23,7 +23,7 @@
+ SHELL = /bin/sh
+ 
+ # Following ../lisp/Makefile.in.
+-EMACS = ../src/emacs
++EMACS = ${QEMU} ../src/emacs
+ EMACSOPT = -batch --no-site-file --multibyte
+ 
+ # ==================== Things `configure' will edit ====================
+@@ -372,7 +372,7 @@
+    clobbered too.  */
+ test-distrib${EXEEXT}: ${srcdir}/test-distrib.c
+ 	$(CC) ${ALL_CFLAGS} -o test-distrib ${srcdir}/test-distrib.c
+-	./test-distrib ${srcdir}/testfile
++	${QEMU} ./test-distrib ${srcdir}/testfile
+ 
+ /* We need the following in order to create a <getopt.h> when the system
+    does not have one that works with the given compiler.  */
+diff -ur emacs-23.2-stock/lisp/Makefile.in emacs-23.2/lisp/Makefile.in
+--- emacs-23.2-stock/lisp/Makefile.in	2010-11-19 02:52:07.922057070 +0000
++++ emacs-23.2/lisp/Makefile.in	2010-11-19 02:52:15.282048950 +0000
+@@ -26,8 +26,7 @@
+ # You can specify a different executable on the make command line,
+ # e.g. "make EMACS=../src/emacs ...".
+ 
+-EMACS = ../src/emacs
+-
++EMACS = "${QEMU} ../src/emacs"
+ # Command line flags for Emacs.  This must include --multibyte,
+ # otherwise some files will not compile.
+ 
+diff -ur emacs-23.2-stock/src/Makefile.in emacs-23.2/src/Makefile.in
+--- emacs-23.2-stock/src/Makefile.in	2010-11-19 02:52:08.182079361 +0000
++++ emacs-23.2/src/Makefile.in	2010-11-19 02:55:09.762049503 +0000
+@@ -479,7 +479,7 @@
+    this with the shell''s ``for'' construct.
+    Note that some people do not have '.'  in their paths, so we must
+    use ./prefix-args.  */
+-#define YMF_PASS_LDFLAGS(flags) `./prefix-args -Xlinker flags`
++#define YMF_PASS_LDFLAGS(flags) `${QEMU} ./prefix-args -Xlinker flags`
+ #else
+ #define YMF_PASS_LDFLAGS(flags) flags
+ #endif
+@@ -916,9 +916,9 @@
+    $(GNULIB_VAR) LIB_MATH LIB_STANDARD $(GNULIB_VAR)
+ 
+ #ifdef HAVE_SHM
+-RUN_TEMACS = `/bin/pwd`/temacs -nl
++RUN_TEMACS = ${QEMU} temacs -nl
+ #else
+-RUN_TEMACS = `/bin/pwd`/temacs
++RUN_TEMACS = ${QEMU} temacs
+ #endif
+ 
+ all: emacs${EXEEXT} $(OTHER_FILES)
+@@ -933,7 +933,7 @@
+ 	@: This new Emacs is as functional and more efficient then
+ 	@: bootstrap-emacs, so let us replace it.
+ 	-ln -f emacs${EXEEXT} bootstrap-emacs${EXEEXT}
+-	-./emacs -q -batch -f list-load-path-shadows
++	-${QEMU} ./emacs -q -batch -f list-load-path-shadows
+ #endif /* ! defined (CANNOT_DUMP) */
+ 
+ /* We run make-docfile twice because the command line may get too long
+@@ -951,8 +951,8 @@
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
-- 
1.7.0.4



