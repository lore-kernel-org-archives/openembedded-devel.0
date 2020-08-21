Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.144286.1598050082008303336
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 15:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from ALSAMON-X.corp.microsoft.com (unknown [131.107.159.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id E00F520B4908
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 15:48:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E00F520B4908
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2] emacs: Create a new recipe for emacs
Date: Fri, 21 Aug 2020 15:47:56 -0700
Message-Id: <20200821224756.2551-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.17.1

Emacs is for obvious reasons one of the most important
and powerful editors, being the first program released
by the GNU project and being maintained for many years.

Its not the obvious choice when being used on a small
or resource constrained device, but, on this recipe
I was able to split it into three different packages
to fit different needs for those who decide to use it,
the emacs-minimal package would install a working emacs
requiring around 2 MB of storage space, the emacs-base
package includes some themes, syntax highlighting for
some of the most used programming languages, as well
as some extra functionality like a working shell,
requiring less than 5 MB, which should work for a wide
spectrum of workflows, and lasty, the emacs-full
package contains the a fully working emacs using around
30 MB of space trading off size for functionality.

This recipe also uses BBCLASSEXTEND=native to build some
tools that emacs itself requires to build for target,
but does not build a full native emacs since that is not
necessary.

Simply installing emacs will use the emacs-base package
as default.

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 meta-oe/recipes-support/emacs/emacs_27.1.bb   | 261 ++++++++++++++++++
 .../emacs/files/usemake-docfile-native.patch  |  85 ++++++
 2 files changed, 346 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/emacs_27.1.bb
 create mode 100644 meta-oe/recipes-support/emacs/files/usemake-docfile-native.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_27.1.bb b/meta-oe/recipes-support/emacs/emacs_27.1.bb
new file mode 100644
index 000000000..9b3adcf9d
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/emacs_27.1.bb
@@ -0,0 +1,261 @@
+SUMMARY = "Emacs is the extensible, customizable, self-documenting real-time display editor"
+HOMEPAGE = "https://www.gnu.org/software/emacs/"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz"
+
+SRC_URI_append_class-target = " file://usemake-docfile-native.patch"
+
+SRC_URI[sha256sum] = "4a4c128f915fc937d61edfc273c98106711b540c9be3cd5d2e2b9b5b2f172e41"
+
+PACKAGECONFIG[gnutls] = "--with-gnutls=yes,--with-gnutls=no,gnutls"
+PACKAGECONFIG[kerberos] = "--with-kerberos=yes,--with-kerberos=no,krb5"
+PACKAGECONFIG[libgmp] = "--with-libgmp=yes,--with-libgmp=no,gmp"
+
+PACKAGECONFIG ??= "gnutls kerberos libgmp"
+
+# We could use --without-all but its better to
+# split it into several packages (size of minimal doesnt change)
+EXTRA_OECONF = " --with-x=no --with-dumping=none"
+
+DEPENDS = "ncurses"
+DEPENDS_append_class-target = " emacs-native"
+
+inherit autotools mime-xdg
+
+
+do_compile_class-native (){
+    cd ${B}/lib-src
+    oe_runmake make-docfile
+    oe_runmake make-fingerprint
+}
+do_install_class-native(){
+    install -d ${D}${bindir}
+    install -m 755 ${B}/lib-src/make-docfile ${D}/${bindir}/
+    install -m 755 ${B}/lib-src/make-fingerprint ${D}/${bindir}/
+}
+
+
+do_install_append(){
+    # Delete systemd stuff, extend using DISTRO_FEATURES?
+    rm -rf ${D}/${libdir}
+    # Extra stuff which isnt needed
+    rm -rf ${D}/${datadir}/metainfo
+    rm -rf ${D}/${datadir}/info
+    # Emacs copies files to ${D} while building, which were unpacked
+    # by a different user, we need to restore those
+    chown -R root:root ${D}${datadir}
+}
+
+
+# Use a similar strategy to how we build python:
+# Create three packages
+# minimal - A working lisp based text editor
+# base - What would probably work for most
+# full - A fully working emacs
+# The lists of files are long but are worth it
+# Installing "emacs" installs the base package
+PACKAGE_BEFORE_PN = "${PN}-minimal ${PN}-base ${PN}-full"
+RPROVIDES_${PN}-base = "${PN}"
+RDEPENDS_${PN}-base_class-target = "${PN}-minimal"
+RDEPENDS_${PN}-full_class-target = "${PN}"
+
+
+# A minimal version of emacs that works
+FILES_${PN}-minimal = " \
+    ${datadir}/${BPN}/${PV}/lisp/loadup.el \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/byte-run.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/backquote.elc \
+    ${datadir}/${BPN}/${PV}/lisp/subr.elc \
+    ${datadir}/${BPN}/${PV}/lisp/version.elc \
+    ${datadir}/${BPN}/${PV}/lisp/widget.elc \
+    ${datadir}/${BPN}/${PV}/lisp/custom.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/map-ynp.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/mule.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/mule-conf.elc \
+    ${datadir}/${BPN}/${PV}/lisp/env.elc \
+    ${datadir}/${BPN}/${PV}/lisp/format.elc \
+    ${datadir}/${BPN}/${PV}/lisp/bindings.elc \
+    ${datadir}/${BPN}/${PV}/lisp/window.elc \
+    ${datadir}/${BPN}/${PV}/lisp/files.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/macroexp.elc \
+    ${datadir}/${BPN}/${PV}/lisp/cus-face.elc \
+    ${datadir}/${BPN}/${PV}/lisp/faces.elc \
+    ${datadir}/${BPN}/${PV}/lisp/button.elc \
+    ${datadir}/${BPN}/${PV}/lisp/loaddefs.el \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/nadvice.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-preloaded.elc \
+    ${datadir}/${BPN}/${PV}/lisp/obarray.elc \
+    ${datadir}/${BPN}/${PV}/lisp/abbrev.elc \
+    ${datadir}/${BPN}/${PV}/lisp/simple.elc \
+    ${datadir}/${BPN}/${PV}/lisp/jka-cmpr-hook.elc \
+    ${datadir}/${BPN}/${PV}/lisp/epa-hook.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/mule-cmds.elc \
+    ${datadir}/${BPN}/${PV}/lisp/case-table.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/charprop.el \
+    ${datadir}/${BPN}/${PV}/lisp/international/characters.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/charscript.elc \
+    ${datadir}/${BPN}/${PV}/lisp/composite.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/chinese.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/cyrillic.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/indian.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/sinhala.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/english.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/ethiopic.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/european.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/czech.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/slovak.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/romanian.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/greek.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/hebrew.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/cp51932.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/eucjp-ms.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/japanese.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/korean.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/lao.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/tai-viet.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/thai.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/tibetan.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/vietnamese.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/misc-lang.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/utf-8-lang.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/georgian.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/khmer.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/burmese.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/cham.elc \
+    ${datadir}/${BPN}/${PV}/lisp/indent.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-generic.elc \
+    ${datadir}/${BPN}/${PV}/lisp/minibuffer.elc \
+    ${datadir}/${BPN}/${PV}/lisp/frame.elc \
+    ${datadir}/${BPN}/${PV}/lisp/startup.elc \
+    ${datadir}/${BPN}/${PV}/lisp/term/tty-colors.elc \
+    ${datadir}/${BPN}/${PV}/lisp/font-core.elc \
+    ${datadir}/${BPN}/${PV}/lisp/facemenu.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/syntax.elc \
+    ${datadir}/${BPN}/${PV}/lisp/font-lock.elc \
+    ${datadir}/${BPN}/${PV}/lisp/jit-lock.elc \
+    ${datadir}/${BPN}/${PV}/lisp/mouse.elc \
+    ${datadir}/${BPN}/${PV}/lisp/select.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/timer.elc \
+    ${datadir}/${BPN}/${PV}/lisp/isearch.elc \
+    ${datadir}/${BPN}/${PV}/lisp/rfn-eshadow.elc \
+    ${datadir}/${BPN}/${PV}/lisp/menu-bar.elc \
+    ${datadir}/${BPN}/${PV}/lisp/tab-bar.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/lisp.elc \
+    ${datadir}/${BPN}/${PV}/lisp/textmodes/page.elc \
+    ${datadir}/${BPN}/${PV}/lisp/register.elc \
+    ${datadir}/${BPN}/${PV}/lisp/textmodes/paragraphs.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/prog-mode.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/lisp-mode.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/elisp-mode.elc \
+    ${datadir}/${BPN}/${PV}/lisp/textmodes/text-mode.elc \
+    ${datadir}/${BPN}/${PV}/lisp/textmodes/fill.elc \
+    ${datadir}/${BPN}/${PV}/lisp/newcomment.elc \
+    ${datadir}/${BPN}/${PV}/lisp/replace.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/tabulated-list.elc \
+    ${datadir}/${BPN}/${PV}/lisp/buff-menu.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/float-sup.elc \
+    ${datadir}/${BPN}/${PV}/lisp/vc/vc-hooks.elc \
+    ${datadir}/${BPN}/${PV}/lisp/vc/ediff-hook.elc \
+    ${datadir}/${BPN}/${PV}/lisp/uniquify.elc \
+    ${datadir}/${BPN}/${PV}/lisp/electric.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eldoc.elc \
+    ${datadir}/${BPN}/${PV}/lisp/cus-start.elc \
+    ${datadir}/${BPN}/${PV}/lisp/tooltip.elc \
+    ${datadir}/${BPN}/${PV}/lisp/simple.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/regexp-opt.elc \
+    ${datadir}/${BPN}/${PV}/lisp/term/xterm.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/bytecomp.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cconv.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/gv.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/byte-opt.elc \
+    ${datadir}/${BPN}/${PV}/lisp/image.elc \
+    ${datadir}/${BPN}/${PV}/lisp/ldefs-boot.el \
+    ${datadir}/${BPN}/${PV}/lisp/help.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/uni*.el \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/vc/warnings.elc \
+    ${datadir}/${BPN}/${PV}/etc/charsets/ \
+    ${bindir}/emacs* \
+    ${prefix}/libexec \
+"
+
+
+# What works for "most" is relative, but this can be easily extended if needed
+FILES_${PN}-base = " \
+    ${datadir}/${BPN}/${PV}/etc/srecode \
+    ${datadir}/${BPN}/${PV}/etc/e \
+    ${datadir}/${BPN}/${PV}/etc/forms \
+    ${datadir}/${BPN}/${PV}/lisp/cedet \
+    ${datadir}/${BPN}/${PV}/site-lisp/ \
+    ${datadir}/${BPN}/${PV}/lisp/subdirs.el \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-mode.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-defs.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-vars.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-engine.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-styles.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-fonts.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-cmds.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-align.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-menus.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-guess.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-lib.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-macs.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/pcase.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/inline.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-seq.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/easymenu.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/python* \
+    ${datadir}/${BPN}/${PV}/lisp/ansi-color.elc \
+    ${datadir}/${BPN}/${PV}/lisp/comint.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/ring.elc \
+    ${datadir}/${BPN}/${PV}/lisp/json.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/map.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/seq.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/subr-x.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/seq.elc \
+    ${datadir}/${BPN}/${PV}/lisp/net/tramp-sh.elc \
+    ${datadir}/${BPN}/${PV}/lisp/net/tramp.elc \
+    ${datadir}/${BPN}/${PV}/lisp/net/tramp-compat.elc \
+    ${datadir}/${BPN}/${PV}/lisp/auth-source.elc \
+    ${datadir}/${BPN}/${PV}/lisp/password-cache.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eieio.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eieio-core.elc \
+    ${datadir}/${BPN}/${PV}/lisp/format-spec.elc \
+    ${datadir}/${BPN}/${PV}/lisp/ls-lisp.elc \
+    ${datadir}/${BPN}/${PV}/lisp/calendar/parse-time.elc \
+    ${datadir}/${BPN}/${PV}/lisp/calendar/iso8601.elc \
+    ${datadir}/${BPN}/${PV}/lisp/calendar/time-date.elc \
+    ${datadir}/${BPN}/${PV}/lisp/shell.elc \
+    ${datadir}/${BPN}/${PV}/lisp/pcomplete.elc \
+    ${datadir}/${BPN}/${PV}/lisp/net/tramp-integration.elc \
+    ${datadir}/${BPN}/${PV}/lisp/files-x.elc \
+    ${datadir}/${BPN}/${PV}/lisp/net/trampver.elc \
+    ${datadir}/${BPN}/${PV}/lisp/net/tramp-loaddefs.el \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/*perl* \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/smie.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/*asm* \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cpp* \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/make* \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/sh-script* \
+    ${datadir}/${BPN}/${PV}/etc/themes/adwaita-theme.el \
+    ${datadir}/${BPN}/${PV}/etc/themes/wheatgrass-theme.el \
+    ${datadir}/${BPN}/${PV}/etc/themes/deeper-blue-theme.el \
+    ${datadir}/${BPN}/${PV}/etc/themes/light-blue-theme.el \
+    ${datadir}/${BPN}/${PV}/etc/themes/misterioso-theme.el \
+    ${datadir}/${BPN}/${PV}/etc/themes/tango-theme.el \
+    ${datadir}/${BPN}/${PV}/etc/themes/wombat-theme.el \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/prog* \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/executable* \
+"
+
+# Restore FILES for the full package to catch everything left
+FILES_${PN}-full = "${FILES_${PN}}"
+FILES_${PN}-full_append = " ${datadir}/icons"
+
+
+# The following does NOT build a native emacs.
+# It only builds some parts of it that are
+# required to by the build for target emacs.
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/emacs/files/usemake-docfile-native.patch b/meta-oe/recipes-support/emacs/files/usemake-docfile-native.patch
new file mode 100644
index 000000000..cc0b05c79
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/files/usemake-docfile-native.patch
@@ -0,0 +1,85 @@
+Upstream-Status: Inappropriate  [OE-Specific]
+
+When building emacs, it builds some tools for the HOST
+that are then used to build for target, such as
+make-fingerprint and make-docfile, this needs to be
+adapted to be used by bitbake, otherwise the compiled
+executables arent compatible with the HOST.
+
+Use the above mentioned tools provided by the native
+version of the recipe instead.
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
+
+Index: emacs-27.1/src/Makefile.in
+===================================================================
+--- emacs-27.1.orig/src/Makefile.in
++++ emacs-27.1/src/Makefile.in
+@@ -472,7 +472,7 @@ ifeq ($(CHECK_STRUCTS),true)
+ pdumper.o: dmpstruct.h
+ endif
+ dmpstruct.h: $(srcdir)/dmpstruct.awk
+-dmpstruct.h: $(libsrc)/make-fingerprint$(EXEEXT) $(dmpstruct_headers)
++dmpstruct.h:  $(dmpstruct_headers)
+ 	$(AM_V_GEN)POSIXLY_CORRECT=1 awk -f $(srcdir)/dmpstruct.awk \
+ 		$(dmpstruct_headers) > $@
+ 
+@@ -566,8 +566,7 @@ ${lispintdir}/characters.elc: ${charscri
+ ## Strictly speaking, emacs does not depend directly on all of $lisp,
+ ## since not all pieces are used on all platforms.  But DOC depends
+ ## on all of $lisp, and emacs depends on DOC, so it is ok to use $lisp here.
+-emacs$(EXEEXT): temacs$(EXEEXT) \
+-                lisp.mk $(etc)/DOC $(lisp) \
++emacs$(EXEEXT): lisp.mk $(etc)/DOC $(lisp) \
+                 $(lispsource)/international/charprop.el ${charsets}
+ ifeq ($(DUMPING),unexec)
+ 	LC_ALL=C $(RUN_TEMACS) -batch $(BUILD_DETAILS) -l loadup --temacs=dump
+@@ -596,15 +595,15 @@ endif
+ ## for the first time, this prevents any variation between configurations
+ ## in the contents of the DOC file.
+ ##
+-$(etc)/DOC: lisp.mk $(libsrc)/make-docfile$(EXEEXT) $(obj) $(lisp)
++$(etc)/DOC: lisp.mk $(obj) $(lisp)
+ 	$(AM_V_GEN)$(MKDIR_P) $(etc)
+ 	$(AM_V_at)rm -f $(etc)/DOC
+-	$(AM_V_at)$(libsrc)/make-docfile -d $(srcdir) \
++	make-docfile -d $(srcdir) \
+ 	  $(SOME_MACHINE_OBJECTS) $(obj) > $(etc)/DOC
+-	$(AM_V_at)$(libsrc)/make-docfile -a $(etc)/DOC -d $(lispsource) \
++	make-docfile -a $(etc)/DOC -d $(lispsource) \
+ 	  $(shortlisp)
+ 
+-$(libsrc)/make-docfile$(EXEEXT) $(libsrc)/make-fingerprint$(EXEEXT): \
++$(libsrc)/make-fingerprint$(EXEEXT): \
+   $(lib)/libgnu.a
+ 	$(MAKE) -C $(dir $@) $(notdir $@)
+ 
+@@ -622,8 +621,8 @@ am__v_GLOBALS_ = $(am__v_GLOBALS_@AM_DEF
+ am__v_GLOBALS_0 = @echo "  GEN     " globals.h;
+ am__v_GLOBALS_1 =
+ 
+-gl-stamp: $(libsrc)/make-docfile$(EXEEXT) $(GLOBAL_SOURCES)
+-	$(AM_V_GLOBALS)$(libsrc)/make-docfile -d $(srcdir) -g $(obj) > globals.tmp
++gl-stamp: $(GLOBAL_SOURCES)
++	make-docfile -d $(srcdir) -g $(obj) > globals.tmp
+ 	$(AM_V_at)$(top_srcdir)/build-aux/move-if-change globals.tmp globals.h
+ 	$(AM_V_at)echo timestamp > $@
+ 
+@@ -637,7 +636,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)
+ 	$(MAKE) -C $(dir $@) all
+ 
+ ifeq ($(HAVE_PDUMPER),yes)
+-  MAKE_PDUMPER_FINGERPRINT = $(libsrc)/make-fingerprint$(EXEEXT)
++  MAKE_PDUMPER_FINGERPRINT = make-fingerprint
+ else
+   MAKE_PDUMPER_FINGERPRINT =
+ endif
+@@ -647,7 +646,7 @@ endif
+ ## This goes on to affect various things, and the emacs binary fails
+ ## to start if Vinstallation_directory has the wrong value.
+ temacs$(EXEEXT): $(LIBXMENU) $(ALLOBJS) $(LIBEGNU_ARCHIVE) $(EMACSRES) \
+-  $(charsets) $(charscript) $(MAKE_PDUMPER_FINGERPRINT)
++  $(charsets) $(charscript)
+ 	$(AM_V_CCLD)$(CC) -o $@.tmp \
+ 	  $(ALL_CFLAGS) $(TEMACS_LDFLAGS) $(LDFLAGS) \
+ 	  $(ALLOBJS) $(LIBEGNU_ARCHIVE) $(W32_RES_LINK) $(LIBES)
-- 
2.17.1

