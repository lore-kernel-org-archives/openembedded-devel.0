Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1x3-00087O-SW
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:12:49 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so3664117wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 19:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wwtgaEwEIFYdMtg5voBNDhu9RVFJT4oPnUPo6zTiy0I=;
	b=b3j75fxAiryl5/9Lo0H2e5wOWiHL/uJ521WRW1KenFcp2qyMlOL9cqmD0oryD9VkMg
	A/7ficUnHAJi7vYg+W7m6k4d+3WdThz+t2PsVL11o8i/6/Qlae8H1PyDRd4/o08kf1Xu
	FpbLTCnv2LN6b5mJ9nEZZZghM0pni3L6fNX77+sPs/0iUuE/qFujqACgMTZL+0Z091eX
	mzlHsSdXVyRgENzAOo5meuvL8u/ezL7z/nVSEyKCyelFsdlubpjMn+tOhkeG0OzsUvPh
	+UWWeZOq84NUSfHENbDh3srh8jXQ3qEL41XYgBwxGdi+ZJsQ0Z3AL2Qt1TN9bDgpBwze
	XKeA==
Received: by 10.180.81.133 with SMTP id a5mr2665161wiy.17.1343700075657;
	Mon, 30 Jul 2012 19:01:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm19601733wiz.1.2012.07.30.19.01.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 19:01:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:49 +0200
Message-Id: <d028be056c973b9235269a678d983ba6d244fd5d.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 24/24] emacs: drop older version 23.1
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
X-List-Received-Date: Tue, 31 Jul 2012 02:12:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../emacs-23.1/configure.in.lost.backslashes.patch |   24 -----
 .../emacs/emacs-23.1/fix.dso.build.patch           |   39 -------
 .../emacs/emacs-23.1/nostdlib-unwind.patch         |   16 ---
 .../emacs/emacs-23.1/use-qemu.patch                |  107 --------------------
 meta-oe/recipes-support/emacs/emacs_23.1.bb        |   10 --
 meta-oe/recipes-support/emacs/emacs_23.4.bb        |    2 -
 6 files changed, 0 insertions(+), 198 deletions(-)
 delete mode 100644 meta-oe/recipes-support/emacs/emacs-23.1/configure.in.lost.backslashes.patch
 delete mode 100644 meta-oe/recipes-support/emacs/emacs-23.1/fix.dso.build.patch
 delete mode 100644 meta-oe/recipes-support/emacs/emacs-23.1/nostdlib-unwind.patch
 delete mode 100644 meta-oe/recipes-support/emacs/emacs-23.1/use-qemu.patch
 delete mode 100644 meta-oe/recipes-support/emacs/emacs_23.1.bb

diff --git a/meta-oe/recipes-support/emacs/emacs-23.1/configure.in.lost.backslashes.patch b/meta-oe/recipes-support/emacs/emacs-23.1/configure.in.lost.backslashes.patch
deleted file mode 100644
index 2d29f17..0000000
--- a/meta-oe/recipes-support/emacs/emacs-23.1/configure.in.lost.backslashes.patch
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
diff --git a/meta-oe/recipes-support/emacs/emacs-23.1/fix.dso.build.patch b/meta-oe/recipes-support/emacs/emacs-23.1/fix.dso.build.patch
deleted file mode 100644
index 0396c0c..0000000
--- a/meta-oe/recipes-support/emacs/emacs-23.1/fix.dso.build.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Backport
-
-from bzr changeset 99307
-
-=== modified file 'ChangeLog'
---- ChangeLog	2010-01-12 05:11:05 +0000
-+++ ChangeLog	2010-01-12 16:25:08 +0000
-@@ -1,3 +1,7 @@
-+2010-01-12  Chong Yidong  <cyd@stupidchicken.com>
-+
-+	* configure.in: Explicitly check for and link to -lXrender.
-+
- 2010-01-12  Glenn Morris  <rgm@gnu.org>
- 
- 	* INSTALL.BZR, README: Use bug-gnu-emacs rather than emacs-pretest-bug
-
-=== modified file 'configure.in'
---- configure.in	2010-01-04 05:35:18 +0000
-+++ configure.in	2010-01-12 16:25:08 +0000
-@@ -1984,12 +1984,17 @@
-     if test "x${with_xft}" != "xno"; then
- 
-       PKG_CHECK_MODULES(XFT, xft >= 0.13.0, , HAVE_XFT=no)
--      if test "$HAVE_XFT" != no; then
-+      ## Because xftfont.c uses XRenderQueryExtension, we also
-+      ## need to link to -lXrender.
-+      HAVE_XRENDER=no
-+      AC_CHECK_LIB(Xrender, XRenderQueryExtension, HAVE_XRENDER=yes)
-+      if test "$HAVE_XFT" != no && test "$HAVE_XRENDER" != no; then
- 	OLD_CPPFLAGS="$CPPFLAGS"
- 	OLD_CFLAGS="$CFLAGS"
- 	OLD_LIBS="$LIBS"
- 	CPPFLAGS="$CPPFLAGS $XFT_CFLAGS"
- 	CFLAGS="$CFLAGS $XFT_CFLAGS"
-+	XFT_LIBS="-lXrender $XFT_LIBS"
- 	LIBS="$XFT_LIBS $LIBS"
- 	AC_CHECK_HEADER(X11/Xft/Xft.h,
- 	  AC_CHECK_LIB(Xft, XftFontOpen, HAVE_XFT=yes, , $XFT_LIBS))
-
diff --git a/meta-oe/recipes-support/emacs/emacs-23.1/nostdlib-unwind.patch b/meta-oe/recipes-support/emacs/emacs-23.1/nostdlib-unwind.patch
deleted file mode 100644
index 4200301..0000000
--- a/meta-oe/recipes-support/emacs/emacs-23.1/nostdlib-unwind.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix linking problem:
-undefined reference to `__aeabi_unwind_cpp_pr0'
-undefined reference to `__aeabi_unwind_cpp_pr1'
-Index: emacs/src/Makefile.in
-===================================================================
---- emacs.orig/src/Makefile.in	2008-08-16 14:20:18.000000000 +0000
-+++ emacs/src/Makefile.in	2008-08-16 14:51:25.000000000 +0000
-@@ -443,7 +443,7 @@
-    ask GCC explicitly where to find libgcc.a.  */
- 
- #ifndef LINKER
--#define LINKER $(CC) -nostdlib
-+#define LINKER $(CC) -nostdlib -lgcc_s
- #endif
- 
- #ifndef LIB_GCC
diff --git a/meta-oe/recipes-support/emacs/emacs-23.1/use-qemu.patch b/meta-oe/recipes-support/emacs/emacs-23.1/use-qemu.patch
deleted file mode 100644
index 255b07f..0000000
--- a/meta-oe/recipes-support/emacs/emacs-23.1/use-qemu.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-Index: emacs-23.1/leim/Makefile.in
-===================================================================
---- emacs-23.1.orig/leim/Makefile.in
-+++ emacs-23.1/leim/Makefile.in
-@@ -51,7 +51,7 @@ buildlisppath=${srcdir}/${dot}${dot}/lis
- 
- # How to run Emacs.
- RUN-EMACS = EMACSLOADPATH=$(buildlisppath) LC_ALL=C \
--	${BUILT-EMACS} -batch --no-init-file --no-site-file --multibyte
-+	${QEMU} ${BUILT-EMACS} -batch --no-init-file --no-site-file --multibyte
- 
- # Subdirectories to be made if ${srcdir} is different from the current
- # directory.
-Index: emacs-23.1/lib-src/Makefile.in
-===================================================================
---- emacs-23.1.orig/lib-src/Makefile.in
-+++ emacs-23.1/lib-src/Makefile.in
-@@ -23,7 +23,7 @@
- SHELL = /bin/sh
- 
- # Following ../lisp/Makefile.in.
--EMACS = ../src/emacs
-+EMACS = ${QEMU} ../src/emacs
- EMACSOPT = -batch --no-site-file --multibyte
- 
- # ==================== Things `configure' will edit ====================
-@@ -371,7 +371,7 @@ TAGS: etags${EXEEXT}
-    clobbered too.  */
- test-distrib${EXEEXT}: ${srcdir}/test-distrib.c
- 	$(CC) ${ALL_CFLAGS} -o test-distrib ${srcdir}/test-distrib.c
--	./test-distrib ${srcdir}/testfile
-+	${QEMU} ./test-distrib ${srcdir}/testfile
- 
- /* We need the following in order to create a <getopt.h> when the system
-    does not have one that works with the given compiler.  */
-Index: emacs-23.1/lisp/Makefile.in
-===================================================================
---- emacs-23.1.orig/lisp/Makefile.in
-+++ emacs-23.1/lisp/Makefile.in
-@@ -26,8 +26,7 @@ srcdir=@srcdir@/..
- # You can specify a different executable on the make command line,
- # e.g. "make EMACS=../src/emacs ...".
- 
--EMACS = ../src/emacs
--
-+EMACS = "${QEMU} ../src/emacs"
- # Command line flags for Emacs.  This must include --multibyte,
- # otherwise some files will not compile.
- 
-Index: emacs-23.1/Makefile.in
-===================================================================
---- emacs-23.1.orig/Makefile.in
-+++ emacs-23.1/Makefile.in
-@@ -336,7 +336,7 @@ lib-src lisp: Makefile FRC
- # all preloaded elisp files, and only then dump the actual src/emacs, which
- # is not wrong, but is overkill in 99.99% of the cases.
- src: Makefile FRC
--	boot=bootstrap-emacs$(EXEEXT);                         \
-+	boot=${QEMU} bootstrap-emacs$(EXEEXT);                         \
- 	if [ ! -x "src/$$boot" ]; then                                     \
- 	    cd $@; $(MAKE) all $(MFLAGS)                                   \
- 	      CC='${CC}' CFLAGS='${CFLAGS}' CPPFLAGS='${CPPFLAGS}'         \
-Index: emacs-23.1/src/Makefile.in
-===================================================================
---- emacs-23.1.orig/src/Makefile.in
-+++ emacs-23.1/src/Makefile.in
-@@ -497,7 +497,7 @@
-    this with the shell''s ``for'' construct.
-    Note that some people do not have '.'  in their paths, so we must
-    use ./prefix-args.  */
--#define YMF_PASS_LDFLAGS(flags) `./prefix-args -Xlinker flags`
-+#define YMF_PASS_LDFLAGS(flags) `${QEMU} ./prefix-args -Xlinker flags`
- #else
- #define YMF_PASS_LDFLAGS(flags) flags
- #endif
-@@ -895,9 +895,9 @@ LIBES = $(LOADLIBES) $(LIBS) $(LIBX) $(L
- #endif
- 
- #ifdef HAVE_SHM
--RUN_TEMACS = `/bin/pwd`/temacs -nl
-+RUN_TEMACS = ${QEMU} temacs -nl
- #else
--RUN_TEMACS = `/bin/pwd`/temacs
-+RUN_TEMACS = ${QEMU} temacs
- #endif
- 
- all: emacs${EXEEXT} OTHER_FILES
-@@ -912,7 +912,7 @@ emacs${EXEEXT}: temacs${EXEEXT} ${etc}DO
- 	@: bootstrap-emacs, so let us replace it.
- 	-ln -f emacs${EXEEXT} bootstrap-emacs${EXEEXT}
- #endif /* ! defined (CANNOT_DUMP) */
--	-./emacs -q -batch -f list-load-path-shadows
-+	-${QEMU} ./emacs -q -batch -f list-load-path-shadows
- 
- /* We run make-docfile twice because the command line may get too long
-    on some systems.  */
-@@ -929,8 +929,8 @@ emacs${EXEEXT}: temacs${EXEEXT} ${etc}DO
-    only in order to reduce the command line length.  --Stef  */
- ${etc}DOC: ${libsrc}make-docfile${EXEEXT} ${obj} ${lisp} ${SOME_MACHINE_LISP}
- 	-rm -f ${etc}DOC
--	${libsrc}make-docfile -d ${srcdir} ${SOME_MACHINE_OBJECTS} ${obj} > ${etc}DOC
--	${libsrc}make-docfile -a ${etc}DOC -d ${srcdir} ${SOME_MACHINE_LISP} ${shortlisp}
-+	${QEMU}${libsrc}make-docfile -d ${srcdir} ${SOME_MACHINE_OBJECTS} ${obj} > ${etc}DOC
-+	${QEMU} ${libsrc}make-docfile -a ${etc}DOC -d ${srcdir} ${SOME_MACHINE_LISP} ${shortlisp}
- 
- ${libsrc}make-docfile${EXEEXT}:
- 	cd ${libsrc}; ${MAKE} ${MFLAGS} make-docfile${EXEEXT}
diff --git a/meta-oe/recipes-support/emacs/emacs_23.1.bb b/meta-oe/recipes-support/emacs/emacs_23.1.bb
deleted file mode 100644
index fa7c872..0000000
--- a/meta-oe/recipes-support/emacs/emacs_23.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require emacs.inc
-
-SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
-           file://use-qemu.patch \
-           file://nostdlib-unwind.patch \
-           file://configure.in.lost.backslashes.patch \
-           file://fix.dso.build.patch \
-"
-SRC_URI[tarball.md5sum] = "a620d4452769d04ad8864d662f34f8dd"
-SRC_URI[tarball.sha256sum] = "a94cd46301f000d2d1dcd3fd7ef08ad952846d01ca5d4168b4ec3e38e857da47"
diff --git a/meta-oe/recipes-support/emacs/emacs_23.4.bb b/meta-oe/recipes-support/emacs/emacs_23.4.bb
index 3c97e9e..625a4b9 100644
--- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
+++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
@@ -1,7 +1,5 @@
 require emacs.inc
 
-DEFAULT_PREFERENCE = "-1"
-
 SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
            file://use-qemu.patch \
            file://nostdlib-unwind.patch \
-- 
1.7.8.6



