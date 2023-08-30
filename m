Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FF7C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 06:25:30 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.8276.1693376724910698381
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Aug 2023 23:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-173-175-175-24.elp.res.rr.com [173.175.175.24])
	by linux.microsoft.com (Postfix) with ESMTPSA id E81CB2127C8B;
	Tue, 29 Aug 2023 23:25:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E81CB2127C8B
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Cc: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] emacs: update to 29.1
Date: Wed, 30 Aug 2023 00:25:17 -0600
Message-Id: <20230830062517.2700246-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 06:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104645

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

- Rebase (and rename) use-emacs-native-tools-for-cross-compiling.patch
- Build bootstrap-emacs for emacs-native
- Use bootstrap-emacs (native) for cross compiling.
  - We need to pass EMACSLOADPATH and EMACSDATA so we can control the
  directories being used by bootstrap-emacs.
- Create avoid-running-host-binaries-for-sanity.patch to avoid running
  the newly integrated santity-check by emacs since it tries to run targe=
t
  binaries on the host.
- Fix emacs-minimal packaging for new version.

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 .../emacs/{emacs_28.2.bb =3D> emacs_29.1.bb}    |  52 +++++++--
 ...oid-running-host-binaries-for-sanity.patch |  38 +++++++
 ...acs-native-tools-for-cross-compiling.patch | 106 ++++++++++++++++++
 .../emacs/files/usemake-docfile-native.patch  |  85 --------------
 4 files changed, 187 insertions(+), 94 deletions(-)
 rename meta-oe/recipes-support/emacs/{emacs_28.2.bb =3D> emacs_29.1.bb} =
(88%)
 create mode 100644 meta-oe/recipes-support/emacs/files/avoid-running-hos=
t-binaries-for-sanity.patch
 create mode 100644 meta-oe/recipes-support/emacs/files/use-emacs-native-=
tools-for-cross-compiling.patch
 delete mode 100644 meta-oe/recipes-support/emacs/files/usemake-docfile-n=
ative.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_28.2.bb b/meta-oe/recipe=
s-support/emacs/emacs_29.1.bb
similarity index 88%
rename from meta-oe/recipes-support/emacs/emacs_28.2.bb
rename to meta-oe/recipes-support/emacs/emacs_29.1.bb
index d44026536..ae35367ac 100644
--- a/meta-oe/recipes-support/emacs/emacs_28.2.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -5,11 +5,13 @@ LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
=20
 SRC_URI =3D "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
-           file://0001-largefile.m4-Update-from-latest-gnulib.patch \
           "
-SRC_URI:append:class-target =3D " file://usemake-docfile-native.patch"
+SRC_URI:append:class-target =3D " \
+    file://use-emacs-native-tools-for-cross-compiling.patch \
+    file://avoid-running-host-binaries-for-sanity.patch \
+"
=20
-SRC_URI[sha256sum] =3D "ee21182233ef3232dc97b486af2d86e14042dbb65bbc535d=
f562c3a858232488"
+SRC_URI[sha256sum] =3D "d2f881a5cc231e2f5a03e86f4584b0438f83edd7598a09d2=
4a21bd8d003e2e01"
=20
 CVE_STATUS[CVE-2007-6109] =3D "fixed-version: The CPE in the NVD databas=
e doesn't reflect correctly the vulnerable versions."
=20
@@ -32,24 +34,42 @@ DEPENDS:append:class-target =3D " emacs-native"
=20
 inherit autotools mime-xdg pkgconfig
=20
-# Remove build host references to avoid target pollution
-do_compile:prepend () {
-    sed -i -e 's|${TMPDIR}||g' ${B}/src/config.h
-    sed -i -e 's|${B}||g' ${B}/src/epaths.h
-}
=20
+# Create the required native tools for the target build
 do_compile:class-native (){
     cd ${B}/lib-src
     oe_runmake make-docfile
     oe_runmake make-fingerprint
+    cd ${B}/src
+    oe_runmake bootstrap-emacs
 }
+
 do_install:class-native(){
     install -d ${D}${bindir}
     install -m 755 ${B}/lib-src/make-docfile ${D}/${bindir}/
     install -m 755 ${B}/lib-src/make-fingerprint ${D}/${bindir}/
+    install -m 755 ${B}/src/bootstrap-emacs ${D}/${bindir}/
+}
+
+do_compile:prepend:class-target () {
+   # export EMACS env variables for the native tools to use to allow cal=
ling bootstrap-emacs
+    export EMACSLOADPATH=3D${S}/lisp
+    export EMACSDATA=3D${S}/etc
 }
=20
=20
+do_install:prepend:class-target(){
+    # export EMACS env variables for the native tools to use to allow ca=
lling bootstrap-emacs
+    export EMACSLOADPATH=3D${S}/lisp
+    export EMACSDATA=3D${S}/etc
+}
+
+# Remove build host references to avoid target pollution
+do_compile:prepend () {
+    sed -i -e 's|${TMPDIR}||g' ${B}/src/config.h
+    sed -i -e 's|${B}||g' ${B}/src/epaths.h
+}
+
 do_install:append(){
     # Delete systemd stuff, extend using DISTRO_FEATURES?
     rm -rf ${D}/${libdir}
@@ -96,18 +116,28 @@ FILES:${PN}-minimal =3D " \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/bytecomp.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cconv.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-generic.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-lib.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-macs.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-preloaded.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-seq.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/debug-early.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/easy-mmode.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/easymenu.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eldoc.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/float-sup.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/gv.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/inline.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/lisp-mode.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/lisp.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/macroexp.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/map-ynp.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/map.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/nadvice.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/oclosure.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/pcase.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/regexp-opt.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/rmc.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/rx.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/seq.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/shorthands.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/subr-x.elc \
@@ -141,6 +171,8 @@ FILES:${PN}-minimal =3D " \
     ${datadir}/${BPN}/${PV}/lisp/isearch.elc \
     ${datadir}/${BPN}/${PV}/lisp/jit-lock.elc \
     ${datadir}/${BPN}/${PV}/lisp/jka-cmpr-hook.elc \
+    ${datadir}/${BPN}/${PV}/lisp/jka-compr.elc \
+    ${datadir}/${BPN}/${PV}/lisp/keymap.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/burmese.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/cham.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/chinese.elc \
@@ -153,11 +185,13 @@ FILES:${PN}-minimal =3D " \
     ${datadir}/${BPN}/${PV}/lisp/language/greek.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/hebrew.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/indian.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/indonesian.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/japanese.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/khmer.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/korean.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/lao.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/misc-lang.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/philippine.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/romanian.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/sinhala.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/slovak.elc \
@@ -182,7 +216,6 @@ FILES:${PN}-minimal =3D " \
     ${datadir}/${BPN}/${PV}/lisp/rfn-eshadow.elc \
     ${datadir}/${BPN}/${PV}/lisp/select.elc \
     ${datadir}/${BPN}/${PV}/lisp/simple.elc \
-    ${datadir}/${BPN}/${PV}/lisp/simple.elc \
     ${datadir}/${BPN}/${PV}/lisp/startup.elc \
     ${datadir}/${BPN}/${PV}/lisp/subr.elc \
     ${datadir}/${BPN}/${PV}/lisp/tab-bar.elc \
@@ -192,6 +225,7 @@ FILES:${PN}-minimal =3D " \
     ${datadir}/${BPN}/${PV}/lisp/textmodes/page.elc \
     ${datadir}/${BPN}/${PV}/lisp/textmodes/paragraphs.elc \
     ${datadir}/${BPN}/${PV}/lisp/textmodes/text-mode.elc \
+    ${datadir}/${BPN}/${PV}/lisp/thingatpt.elc \
     ${datadir}/${BPN}/${PV}/lisp/tooltip.elc \
     ${datadir}/${BPN}/${PV}/lisp/uniquify.elc \
     ${datadir}/${BPN}/${PV}/lisp/vc/ediff-hook.elc \
diff --git a/meta-oe/recipes-support/emacs/files/avoid-running-host-binar=
ies-for-sanity.patch b/meta-oe/recipes-support/emacs/files/avoid-running-=
host-binaries-for-sanity.patch
new file mode 100644
index 000000000..719ee4bce
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/files/avoid-running-host-binaries-for=
-sanity.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Inappropriate  [OE-Specific]
+
+Emacs introduced a sanity-check for the build artifacts, where it
+runs the newly built emacs to perform some checks.
+
+This is not going to work for us since we are cross-compiling,
+we need to avoid running target binaries on the host
+
+Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
+
+Index: emacs-29.1/Makefile.in
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- emacs-29.1.orig/Makefile.in
++++ emacs-29.1/Makefile.in
+@@ -416,19 +416,10 @@ advice-on-failure:
+ 	@exit ${exit-status}
+=20
+ sanity-check:
+-	@[ -f .no-advice-on-failure ] && exit 0; true
+-	@v=3D$$(src/emacs${EXEEXT} --batch --eval \
+-	  '(progn (defun f (n) (if (=3D 0 n) 1 (* n (f (- n 1))))) (princ (f 1=
0)))' \
+-	  2> /dev/null); \
+-	[ "X$$v" =3D "X3628800" ] && exit 0; \
+-	echo >&2 '***'; \
+-	echo >&2 '*** '"\"make ${make-target}\" succeeded, but Emacs is not fu=
nctional."; \
+-	echo >&2 '***'; \
+-	cat Makefile | \
+-	  sed -n '/^# ADVICE-ON-FAILURE-BEGIN:${make-target}/,$${p;/^# ADVICE-=
ON-FAILURE-END:${make-target}/q;};' | \
+-	  sed 's/^# /*** /' | grep -v '^\*\*\* ADVICE-ON-FAILURE-' >&2; \
+-	echo >&2 '***'; \
+-	exit 1
++# The Makefile will try to call the newly built emacs to perform some c=
hecks
++# this is not going to work since it was (probably) built for a differe=
nt architecture.
++# Avoid calling target binaries from the host and simply assume our bui=
ld artifacts work.
++	exit 0
+=20
+ .PHONY: all ${SUBDIR} blessmail epaths-force epaths-force-w32 epaths-fo=
rce-ns-self-contained etc-emacsver
+=20
diff --git a/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-f=
or-cross-compiling.patch b/meta-oe/recipes-support/emacs/files/use-emacs-=
native-tools-for-cross-compiling.patch
new file mode 100644
index 000000000..df5e4bd25
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/files/use-emacs-native-tools-for-cros=
s-compiling.patch
@@ -0,0 +1,106 @@
+Upstream-Status: Inappropriate  [OE-Specific]
+
+When building emacs, it builds some tools for the HOST
+that are then used to build for target, such as
+make-fingerprint and make-docfile and bootstrap-emacs,
+this needs to be adapted to be used by bitbake, otherwise
+the compiled executables arent compatible with the HOST.
+
+We also need to be able to use emacs env variables to
+control how bootstrap-emacs is used when cross-compiling.
+
+Use the above mentioned tools provided by the native
+version of the recipe instead.
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.=
org>
+
+Index: emacs-29.1/src/Makefile.in
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- emacs-29.1.orig/src/Makefile.in
++++ emacs-29.1/src/Makefile.in
+@@ -1,3 +1,4 @@
++
+ ### @configure_input@
+=20
+ # Copyright (C) 1985, 1987-1988, 1993-1995, 1999-2023 Free Software
+@@ -508,7 +509,7 @@ ifeq ($(CHECK_STRUCTS),true)
+ pdumper.o: dmpstruct.h
+ endif
+ dmpstruct.h: $(srcdir)/dmpstruct.awk
+-dmpstruct.h: $(libsrc)/make-fingerprint$(EXEEXT) $(dmpstruct_headers)
++dmpstruct.h:  $(dmpstruct_headers)
+ 	$(AM_V_GEN)POSIXLY_CORRECT=3D1 awk -f $(srcdir)/dmpstruct.awk \
+ 		$(dmpstruct_headers) > $@
+=20
+@@ -610,8 +611,7 @@ SYSTEM_TYPE =3D @SYSTEM_TYPE@
+ ## Strictly speaking, emacs does not depend directly on all of $lisp,
+ ## since not all pieces are used on all platforms.  But DOC depends
+ ## on all of $lisp, and emacs depends on DOC, so it is ok to use $lisp =
here.
+-emacs$(EXEEXT): temacs$(EXEEXT) \
+-                lisp.mk $(etc)/DOC $(lisp) \
++emacs$(EXEEXT): lisp.mk $(etc)/DOC $(lisp) \
+                 $(lispsource)/international/charprop.el ${charsets}
+ ifeq ($(SYSTEM_TYPE),cygwin)
+ 	find ${top_builddir} -name '*.eln' | rebase -v -O -T -
+@@ -654,7 +654,7 @@ endif
+ $(etc)/DOC: $(libsrc)/make-docfile$(EXEEXT) $(doc_obj)
+ 	$(AM_V_GEN)$(MKDIR_P) $(etc)
+ 	$(AM_V_at)rm -f $(etc)/DOC
+-	$(AM_V_at)$(libsrc)/make-docfile -d $(srcdir) \
++	make-docfile -d $(srcdir) \
+ 	  $(SOME_MACHINE_OBJECTS) $(doc_obj) > $(etc)/DOC
+=20
+ $(libsrc)/make-docfile$(EXEEXT) $(libsrc)/make-fingerprint$(EXEEXT): \
+@@ -671,7 +671,7 @@ buildobj.h: Makefile
+ GLOBAL_SOURCES =3D $(base_obj:.o=3D.c) $(NS_OBJC_OBJ:.o=3D.m)
+=20
+ gl-stamp: $(libsrc)/make-docfile$(EXEEXT) $(GLOBAL_SOURCES)
+-	$(AM_V_GLOBALS)$(libsrc)/make-docfile -d $(srcdir) -g $(doc_obj) > glo=
bals.tmp
++	make-docfile -d $(srcdir) -g $(doc_obj) > globals.tmp
+ 	$(AM_V_at)$(top_srcdir)/build-aux/move-if-change globals.tmp globals.h
+ 	$(AM_V_at)echo timestamp > $@
+=20
+@@ -685,7 +685,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)
+ 	$(MAKE) -C $(dir $@) all
+=20
+ ifeq ($(HAVE_PDUMPER),yes)
+-MAKE_PDUMPER_FINGERPRINT =3D $(libsrc)/make-fingerprint$(EXEEXT)
++MAKE_PDUMPER_FINGERPRINT =3D make-fingerprint
+ else
+ MAKE_PDUMPER_FINGERPRINT =3D
+ endif
+Index: emacs-29.1/lisp/Makefile.in
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- emacs-29.1.orig/lisp/Makefile.in
++++ emacs-29.1/lisp/Makefile.in
+@@ -53,7 +53,7 @@ FIND_DELETE =3D @FIND_DELETE@
+ # We never change directory before running Emacs, so a relative file
+ # name is fine, and makes life easier.  If we need to change
+ # directory, we can use emacs --chdir.
+-EMACS =3D ../src/emacs${EXEEXT}
++EMACS =3D bootstrap-emacs
+=20
+ # Command line flags for Emacs.
+=20
+@@ -109,7 +109,7 @@ MAIN_FIRST =3D ./emacs-lisp/eieio.el ./ema
+   ./org/oc.el ./org/ol.el ./emacs-lisp/cl-lib.el
+=20
+ # Prevent any settings in the user environment causing problems.
+-unexport EMACSDATA EMACSDOC EMACSLOADPATH EMACSPATH
++unexport EMACSDOC EMACSPATH
+=20
+ # The actual Emacs command run in the targets below.
+ emacs =3D '$(EMACS)' $(EMACSOPT)
+Index: emacs-29.1/Makefile.in
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- emacs-29.1.orig/Makefile.in
++++ emacs-29.1/Makefile.in
+@@ -328,7 +328,7 @@ GLIB_COMPILE_SCHEMAS =3D glib-compile-sche
+ TRANSFORM =3D @program_transform_name@
+=20
+ # Prevent any settings in the user environment causing problems.
+-unexport EMACSDATA EMACSDOC EMACSLOADPATH EMACSPATH
++unexport  EMACSDOC EMACSPATH
+=20
+ # What emacs should be called when installed.
+ EMACS_NAME =3D `echo emacs | sed '$(TRANSFORM)'`
diff --git a/meta-oe/recipes-support/emacs/files/usemake-docfile-native.p=
atch b/meta-oe/recipes-support/emacs/files/usemake-docfile-native.patch
deleted file mode 100644
index 95b428183..000000000
--- a/meta-oe/recipes-support/emacs/files/usemake-docfile-native.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-Upstream-Status: Inappropriate  [OE-Specific]
-
-When building emacs, it builds some tools for the HOST
-that are then used to build for target, such as
-make-fingerprint and make-docfile, this needs to be
-adapted to be used by bitbake, otherwise the compiled
-executables arent compatible with the HOST.
-
-Use the above mentioned tools provided by the native
-version of the recipe instead.
-
-Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.=
org>
-
-Index: emacs-28.2/src/Makefile.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- emacs-28.2.orig/src/Makefile.in
-+++ emacs-28.2/src/Makefile.in
-@@ -462,7 +462,7 @@ ifeq ($(CHECK_STRUCTS),true)
- pdumper.o: dmpstruct.h
- endif
- dmpstruct.h: $(srcdir)/dmpstruct.awk
--dmpstruct.h: $(libsrc)/make-fingerprint$(EXEEXT) $(dmpstruct_headers)
-+dmpstruct.h:  $(dmpstruct_headers)
- 	$(AM_V_GEN)POSIXLY_CORRECT=3D1 awk -f $(srcdir)/dmpstruct.awk \
- 		$(dmpstruct_headers) > $@
-=20
-@@ -563,8 +563,7 @@ SYSTEM_TYPE =3D @SYSTEM_TYPE@
- ## Strictly speaking, emacs does not depend directly on all of $lisp,
- ## since not all pieces are used on all platforms.  But DOC depends
- ## on all of $lisp, and emacs depends on DOC, so it is ok to use $lisp =
here.
--emacs$(EXEEXT): temacs$(EXEEXT) \
--                lisp.mk $(etc)/DOC $(lisp) \
-+emacs$(EXEEXT): lisp.mk $(etc)/DOC $(lisp) \
-                 $(lispsource)/international/charprop.el ${charsets}
- ifeq ($(SYSTEM_TYPE),cygwin)
- 	find ${top_builddir} -name '*.eln' | rebase -v -O -T -
-@@ -597,15 +596,15 @@ endif
- ## for the first time, this prevents any variation between configuratio=
ns
- ## in the contents of the DOC file.
- ##
--$(etc)/DOC: lisp.mk $(libsrc)/make-docfile$(EXEEXT) $(obj) $(lisp)
-+$(etc)/DOC: lisp.mk $(obj) $(lisp)
- 	$(AM_V_GEN)$(MKDIR_P) $(etc)
- 	$(AM_V_at)rm -f $(etc)/DOC
--	$(AM_V_at)$(libsrc)/make-docfile -d $(srcdir) \
-+	make-docfile -d $(srcdir) \
- 	  $(SOME_MACHINE_OBJECTS) $(obj) > $(etc)/DOC
--	$(AM_V_at)$(libsrc)/make-docfile -a $(etc)/DOC -d $(lispsource) \
-+	make-docfile -a $(etc)/DOC -d $(lispsource) \
- 	  $(shortlisp)
-=20
--$(libsrc)/make-docfile$(EXEEXT) $(libsrc)/make-fingerprint$(EXEEXT): \
-+$(libsrc)/make-fingerprint$(EXEEXT): \
-   $(lib)/libgnu.a
- 	$(MAKE) -C $(dir $@) $(notdir $@)
-=20
-@@ -618,8 +617,8 @@ buildobj.h: Makefile
-=20
- GLOBAL_SOURCES =3D $(base_obj:.o=3D.c) $(NS_OBJC_OBJ:.o=3D.m)
-=20
--gl-stamp: $(libsrc)/make-docfile$(EXEEXT) $(GLOBAL_SOURCES)
--	$(AM_V_GLOBALS)$(libsrc)/make-docfile -d $(srcdir) -g $(obj) > globals=
.tmp
-+gl-stamp: $(GLOBAL_SOURCES)
-+	make-docfile -d $(srcdir) -g $(obj) > globals.tmp
- 	$(AM_V_at)$(top_srcdir)/build-aux/move-if-change globals.tmp globals.h
- 	$(AM_V_at)echo timestamp > $@
-=20
-@@ -633,7 +632,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)
- 	$(MAKE) -C $(dir $@) all
-=20
- ifeq ($(HAVE_PDUMPER),yes)
--  MAKE_PDUMPER_FINGERPRINT =3D $(libsrc)/make-fingerprint$(EXEEXT)
-+  MAKE_PDUMPER_FINGERPRINT =3D make-fingerprint
- else
-   MAKE_PDUMPER_FINGERPRINT =3D
- endif
-@@ -643,7 +642,7 @@ endif
- ## This goes on to affect various things, and the emacs binary fails
- ## to start if Vinstallation_directory has the wrong value.
- temacs$(EXEEXT): $(LIBXMENU) $(ALLOBJS) $(LIBEGNU_ARCHIVE) $(EMACSRES) =
\
--  $(charsets) $(charscript) ${emoji-zwj} $(MAKE_PDUMPER_FINGERPRINT)
-+  $(charsets) $(charscript) ${emoji-zwj}
- 	$(AM_V_CCLD)$(CC) -o $@.tmp \
- 	  $(ALL_CFLAGS) $(TEMACS_LDFLAGS) $(LDFLAGS) \
- 	  $(ALLOBJS) $(LIBEGNU_ARCHIVE) $(W32_RES_LINK) $(LIBES)
--=20
2.34.1


