Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1PJIgy-0001YY-H9
	for Openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 05:35:21 +0100
Received: by gwaa11 with SMTP id a11so2526220gwa.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 20:34:12 -0800 (PST)
Received: by 10.150.202.12 with SMTP id z12mr2820324ybf.110.1290141250780;
	Thu, 18 Nov 2010 20:34:10 -0800 (PST)
Received: from [192.168.10.100] (cm152.psi156.maxonline.com.sg
	[58.146.156.152])
	by mx.google.com with ESMTPS id 62sm248857yhl.9.2010.11.18.20.34.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 18 Nov 2010 20:34:09 -0800 (PST)
From: Sean Cross <sean@chumby.com>
Date: Fri, 19 Nov 2010 12:34:05 +0800
Message-Id: <F8F69BD6-3BBB-4F09-B9E1-B172C31B4B96@chumby.com>
To: Openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1081)
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,
	MIME_QP_LONG_LINE,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: emacs: Add emacs 23.2
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
X-List-Received-Date: Fri, 19 Nov 2010 04:35:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Emacs 23.2 is the first version that cleanly builds with gcc-4.5.  This =
patch adds support for Emacs 23.2.

---
 recipes/emacs/emacs_23.2.bb                  |   15 ++++
 recipes/emacs/files/emacs23.2-use-qemu.patch |  102 =
++++++++++++++++++++++++++
 2 files changed, 117 insertions(+), 0 deletions(-)
 create mode 100644 recipes/emacs/emacs_23.2.bb
 create mode 100644 recipes/emacs/files/emacs23.2-use-qemu.patch

diff --git a/recipes/emacs/emacs_23.2.bb b/recipes/emacs/emacs_23.2.bb
new file mode 100644
index 0000000..d57351a
--- /dev/null
+++ b/recipes/emacs/emacs_23.2.bb
@@ -0,0 +1,15 @@
+require emacs.inc
+
+EXTRA_OECONF =3D "--without-sound --without-x"
+
+#/!\warning untested recipe
+DEFAULT_PREFERENCE =3D "-2"=20
+
+SRC_URI =3D "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=3Dtarball \
+	   file://emacs23.2-use-qemu.patch \
+	   file://nostdlib-unwind.patch"
+SRC_URI[tarball.md5sum] =3D "b6691852dae0bc142b3c12749f6b7ade"
+SRC_URI[tarball.sha256sum] =3D =
"1617b8289e403bc6345f8fcc4b3ec01755962cf8842b505d971efe08c9bf7919"
+
+
+S =3D "${WORKDIR}/emacs-${PV}"
diff --git a/recipes/emacs/files/emacs23.2-use-qemu.patch =
b/recipes/emacs/files/emacs23.2-use-qemu.patch
new file mode 100644
index 0000000..2c3c195
--- /dev/null
+++ b/recipes/emacs/files/emacs23.2-use-qemu.patch
@@ -0,0 +1,102 @@
+diff -ur emacs-23.2-stock/Makefile.in emacs-23.2/Makefile.in
+--- emacs-23.2-stock/Makefile.in	2010-11-19 02:52:08.102072074 =
+0000
++++ emacs-23.2/Makefile.in	2010-11-19 02:52:15.282048950 +0000
+@@ -336,7 +336,7 @@
+ # all preloaded elisp files, and only then dump the actual src/emacs, =
which
+ # is not wrong, but is overkill in 99.99% of the cases.
+ src: Makefile FRC
+-	boot=3Dbootstrap-emacs$(EXEEXT);                         \
++	boot=3D${QEMU} bootstrap-emacs$(EXEEXT);                         =
\
+ 	if [ ! -x "src/$$boot" ]; then                                   =
  \
+ 	    cd $@; $(MAKE) all $(MFLAGS)                                 =
  \
+ 	      CC=3D'${CC}' CFLAGS=3D'${CFLAGS}' CPPFLAGS=3D'${CPPFLAGS}' =
        \
+diff -ur emacs-23.2-stock/leim/Makefile.in emacs-23.2/leim/Makefile.in
+--- emacs-23.2-stock/leim/Makefile.in	2010-11-19 02:52:08.202082146 =
+0000
++++ emacs-23.2/leim/Makefile.in	2010-11-19 02:52:15.282048950 =
+0000
+@@ -51,7 +51,7 @@
+=20
+ # How to run Emacs.
+ RUN-EMACS =3D EMACSLOADPATH=3D$(buildlisppath) LC_ALL=3DC \
+-	${BUILT-EMACS} -batch --no-init-file --no-site-file --multibyte
++	${QEMU} ${BUILT-EMACS} -batch --no-init-file --no-site-file =
--multibyte
+=20
+ # Subdirectories to be made if ${srcdir} is different from the current
+ # directory.
+diff -ur emacs-23.2-stock/lib-src/Makefile.in =
emacs-23.2/lib-src/Makefile.in
+--- emacs-23.2-stock/lib-src/Makefile.in	2010-11-19 =
02:52:08.082052237 +0000
++++ emacs-23.2/lib-src/Makefile.in	2010-11-19 02:52:15.282048950 =
+0000
+@@ -23,7 +23,7 @@
+ SHELL =3D /bin/sh
+=20
+ # Following ../lisp/Makefile.in.
+-EMACS =3D ../src/emacs
++EMACS =3D ${QEMU} ../src/emacs
+ EMACSOPT =3D -batch --no-site-file --multibyte
+=20
+ # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Things =
`configure' will edit =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+@@ -372,7 +372,7 @@
+    clobbered too.  */
+ test-distrib${EXEEXT}: ${srcdir}/test-distrib.c
+ 	$(CC) ${ALL_CFLAGS} -o test-distrib ${srcdir}/test-distrib.c
+-	./test-distrib ${srcdir}/testfile
++	${QEMU} ./test-distrib ${srcdir}/testfile
+=20
+ /* We need the following in order to create a <getopt.h> when the =
system
+    does not have one that works with the given compiler.  */
+diff -ur emacs-23.2-stock/lisp/Makefile.in emacs-23.2/lisp/Makefile.in
+--- emacs-23.2-stock/lisp/Makefile.in	2010-11-19 02:52:07.922057070 =
+0000
++++ emacs-23.2/lisp/Makefile.in	2010-11-19 02:52:15.282048950 =
+0000
+@@ -26,8 +26,7 @@
+ # You can specify a different executable on the make command line,
+ # e.g. "make EMACS=3D../src/emacs ...".
+=20
+-EMACS =3D ../src/emacs
+-
++EMACS =3D "${QEMU} ../src/emacs"
+ # Command line flags for Emacs.  This must include --multibyte,
+ # otherwise some files will not compile.
+=20
+diff -ur emacs-23.2-stock/src/Makefile.in emacs-23.2/src/Makefile.in
+--- emacs-23.2-stock/src/Makefile.in	2010-11-19 02:52:08.182079361 =
+0000
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
+=20
+ #ifdef HAVE_SHM
+-RUN_TEMACS =3D `/bin/pwd`/temacs -nl
++RUN_TEMACS =3D ${QEMU} temacs -nl
+ #else
+-RUN_TEMACS =3D `/bin/pwd`/temacs
++RUN_TEMACS =3D ${QEMU} temacs
+ #endif
+=20
+ all: emacs${EXEEXT} $(OTHER_FILES)
+@@ -933,7 +933,7 @@
+ 	@: This new Emacs is as functional and more efficient then
+ 	@: bootstrap-emacs, so let us replace it.
+ 	-ln -f emacs${EXEEXT} bootstrap-emacs${EXEEXT}
+-	-./emacs -q -batch -f list-load-path-shadows
++	-${QEMU} ./emacs -q -batch -f list-load-path-shadows
+ #endif /* ! defined (CANNOT_DUMP) */
+=20
+ /* We run make-docfile twice because the command line may get too long
+@@ -951,8 +951,8 @@
+    only in order to reduce the command line length.  --Stef  */
+ ${etc}DOC: ${libsrc}make-docfile${EXEEXT} ${obj} ${lisp} =
${SOME_MACHINE_LISP}
+ 	-rm -f ${etc}DOC
+-	${libsrc}make-docfile -d ${srcdir} ${SOME_MACHINE_OBJECTS} =
${obj} > ${etc}DOC
+-	${libsrc}make-docfile -a ${etc}DOC -d ${srcdir} =
${SOME_MACHINE_LISP} ${shortlisp}
++	${QEMU}${libsrc}make-docfile -d ${srcdir} =
${SOME_MACHINE_OBJECTS} ${obj} > ${etc}DOC
++	${QEMU} ${libsrc}make-docfile -a ${etc}DOC -d ${srcdir} =
${SOME_MACHINE_LISP} ${shortlisp}
+=20
+ ${libsrc}make-docfile${EXEEXT}:
+ 	cd ${libsrc}; ${MAKE} ${MFLAGS} make-docfile${EXEEXT}
--=20
1.7.0.4



