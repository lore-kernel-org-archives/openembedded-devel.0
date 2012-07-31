Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1wq-0008M1-Iw
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:12:36 +0200
Received: by wgbdr1 with SMTP id dr1so4765940wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 19:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8fFB5LJcSVPGH7XTe3QRYe39P/msLlyGAx98XtzG+iI=;
	b=0L7fXNXO2XgcvKt8tvp3rhpgh55/IBgYIVaeZEztLuR9avT+K/35axXoW0odofYd7T
	f/UBb9cU+uQY6mdkK+e1UOXAf8jAkv7MBzSsjKBVW71SiWMECejcqW01ZVhTWLJPCMCe
	mPNHO5HKl3U9fmWGF6+Zqgq0y6FHTR/A1vbKIsy2yeVY1oRV6oWjpTfSyb9GssjGui8D
	Fu1RPFHkkMzhOuTavfy1RgselOE95I/JA/Fw6d3plpNyYlaOrcyVuuo/GYL7j6Twz9Zw
	0IgVaaMktEcRzfnTk7zUYV/L3wf6K0m8375DyTllTgRwndFKsBvPVp/2U48LqIatvmDs
	sacg==
Received: by 10.180.100.133 with SMTP id ey5mr2748533wib.4.1343700060402;
	Mon, 30 Jul 2012 19:01:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm19603092wib.5.2012.07.30.19.00.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 19:00:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:47 +0200
Message-Id: <aa558bc2e839edc6dd816b2ce301d8fe0de87a69.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 22/24] emacs: upgrade to 23.4
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
X-List-Received-Date: Tue, 31 Jul 2012 02:12:36 -0000

* package icons in PN
* pass --with-crt-dir option to resolve crt* used from host system

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../emacs/emacs-23.4/nostdlib-unwind.patch         |   16 +++
 .../emacs/emacs-23.4/use-qemu.patch                |  104 ++++++++++++++++++++
 meta-oe/recipes-support/emacs/emacs.inc            |    4 +-
 meta-oe/recipes-support/emacs/emacs_23.4.bb        |   10 ++
 4 files changed, 132 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/emacs/emacs-23.4/nostdlib-unwind.patch
 create mode 100644 meta-oe/recipes-support/emacs/emacs-23.4/use-qemu.patch
 create mode 100644 meta-oe/recipes-support/emacs/emacs_23.4.bb

diff --git a/meta-oe/recipes-support/emacs/emacs-23.4/nostdlib-unwind.patch b/meta-oe/recipes-support/emacs/emacs-23.4/nostdlib-unwind.patch
new file mode 100644
index 0000000..4200301
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/emacs-23.4/nostdlib-unwind.patch
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
diff --git a/meta-oe/recipes-support/emacs/emacs-23.4/use-qemu.patch b/meta-oe/recipes-support/emacs/emacs-23.4/use-qemu.patch
new file mode 100644
index 0000000..c15207a
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/emacs-23.4/use-qemu.patch
@@ -0,0 +1,104 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+diff -uNr emacs-23.4/Makefile.in emacs-23.4.new/Makefile.in
+--- emacs-23.4/Makefile.in	2012-01-11 13:35:01.000000000 +0100
++++ emacs-23.4.new/Makefile.in	2012-07-31 00:54:07.223590866 +0200
+@@ -336,7 +336,7 @@
+ # all preloaded elisp files, and only then dump the actual src/emacs, which
+ # is not wrong, but is overkill in 99.99% of the cases.
+ src: Makefile FRC
+-	boot=bootstrap-emacs$(EXEEXT);                         \
++	boot=${QEMU} bootstrap-emacs$(EXEEXT);                         \
+ 	if [ ! -x "src/$$boot" ]; then                                     \
+ 	    cd $@; $(MAKE) all $(MFLAGS)                                   \
+ 	      CC='${CC}' CFLAGS='${CFLAGS}' CPPFLAGS='${CPPFLAGS}'         \
+diff -uNr emacs-23.4/leim/Makefile.in emacs-23.4.new/leim/Makefile.in
+--- emacs-23.4/leim/Makefile.in	2012-01-11 13:35:01.000000000 +0100
++++ emacs-23.4.new/leim/Makefile.in	2012-07-31 00:54:07.179590866 +0200
+@@ -51,7 +51,7 @@
+ 
+ # How to run Emacs.
+ RUN-EMACS = EMACSLOADPATH=$(buildlisppath) LC_ALL=C \
+-	${BUILT-EMACS} -batch --no-init-file --no-site-file --multibyte
++	${QEMU} ${BUILT-EMACS} -batch --no-init-file --no-site-file --multibyte
+ 
+ # Subdirectories to be made if ${srcdir} is different from the current
+ # directory.
+diff -uNr emacs-23.4/lib-src/Makefile.in emacs-23.4.new/lib-src/Makefile.in
+--- emacs-23.4/lib-src/Makefile.in	2012-01-11 13:35:01.000000000 +0100
++++ emacs-23.4.new/lib-src/Makefile.in	2012-07-31 00:54:07.180590866 +0200
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
+diff -uNr emacs-23.4/lisp/Makefile.in emacs-23.4.new/lisp/Makefile.in
+--- emacs-23.4/lisp/Makefile.in	2012-01-11 13:35:01.000000000 +0100
++++ emacs-23.4.new/lisp/Makefile.in	2012-07-31 00:54:07.195590866 +0200
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
+diff -uNr emacs-23.4/src/Makefile.in emacs-23.4.new/src/Makefile.in
+--- emacs-23.4/src/Makefile.in	2012-01-12 11:27:54.000000000 +0100
++++ emacs-23.4.new/src/Makefile.in	2012-07-31 00:55:30.344593847 +0200
+@@ -482,7 +482,7 @@
+    this with the shell''s ``for'' construct.
+    Note that some people do not have '.'  in their paths, so we must
+    use ./prefix-args.  */
+-#define YMF_PASS_LDFLAGS(flags) `./prefix-args -Xlinker flags`
++#define YMF_PASS_LDFLAGS(flags) `${QEMU} ./prefix-args -Xlinker flags`
+ #else
+ #define YMF_PASS_LDFLAGS(flags) flags
+ #endif
+@@ -919,9 +919,9 @@
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
+@@ -936,7 +936,7 @@
+ 	@: This new Emacs is as functional and more efficient then
+ 	@: bootstrap-emacs, so let us replace it.
+ 	-ln -f emacs${EXEEXT} bootstrap-emacs${EXEEXT}
+-	-./emacs -q -batch -f list-load-path-shadows
++	-${QEMU} ./emacs -q -batch -f list-load-path-shadows
+ #endif /* ! defined (CANNOT_DUMP) */
+ 
+ /* We run make-docfile twice because the command line may get too long
+@@ -954,8 +954,8 @@
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
index 5883719..f6cd461 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -10,7 +10,7 @@ DEPENDS +=" liblockfile"
 
 X11DEPENDS = "gtk+ libungif dbus"
 
-EXTRA_OECONF =  "--without-sound "
+EXTRA_OECONF =  "--without-sound --with-crt-dir=${STAGING_LIBDIR} "
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-x-toolkit=gtk,--without-x,${X11DEPENDS}"
@@ -22,7 +22,7 @@ PACKAGES =+ "${PN}-el"
 FILES_${PN}-el = "${datadir}/emacs/*/*/*.el.gz \
                   ${datadir}/emacs/*/*/*/*.el.gz"
 
-FILES_${PN} += "${datadir}/emacs"
+FILES_${PN} += "${datadir}/emacs ${datadir}/icons"
 
 FILES_${PN}-dbg += "${libexecdir}/emacs/*/*/.debug ${datadir}/emacs/*/*/.debug"
 
diff --git a/meta-oe/recipes-support/emacs/emacs_23.4.bb b/meta-oe/recipes-support/emacs/emacs_23.4.bb
new file mode 100644
index 0000000..3c97e9e
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
@@ -0,0 +1,10 @@
+require emacs.inc
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
+           file://use-qemu.patch \
+           file://nostdlib-unwind.patch \
+"
+SRC_URI[tarball.md5sum] = "34405165fcd978fbc8b304cbd99ccf4f"
+SRC_URI[tarball.sha256sum] = "b9a2b8434052771f797d2032772eba862ff9aa143029efc72295170607289c18"
-- 
1.7.8.6



