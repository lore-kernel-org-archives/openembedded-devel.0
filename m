Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FFFC6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 08:35:35 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4887.1663835731436168566
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 01:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182,
 mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com
 [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6718A208EF3B;
	Thu, 22 Sep 2022 01:35:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6718A208EF3B
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] emacs: Update to version 28.2
Date: Thu, 22 Sep 2022 02:35:22 -0600
Message-Id: <20220922083522.1737184-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 08:35:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98923

- Remove upstreamed patch emacs-glibc-2.34.patch
- Rebase usemake-docfile-native.patch
- Emacs isnt aware we are cross compiling, detects host arch, e.g. x86
  and tries to build seccomp-filter using cross-compiler even though
  it wont work for the target arch, explicitly disable seccomp to avoid
  configure script from wronfully enabling it for target.
- Fix emacs-minimal package runtime issue.
- Fix target pollution (buildpaths) reference to TMPDIR.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../emacs/{emacs_27.2.bb =3D> emacs_28.2.bb}    | 289 +++++++++---------
 .../emacs/files/emacs-glibc-2.34.patch        |  40 ---
 .../emacs/files/usemake-docfile-native.patch  |  30 +-
 3 files changed, 165 insertions(+), 194 deletions(-)
 rename meta-oe/recipes-support/emacs/{emacs_27.2.bb =3D> emacs_28.2.bb} =
(93%)
 delete mode 100644 meta-oe/recipes-support/emacs/files/emacs-glibc-2.34.=
patch

diff --git a/meta-oe/recipes-support/emacs/emacs_27.2.bb b/meta-oe/recipe=
s-support/emacs/emacs_28.2.bb
similarity index 93%
rename from meta-oe/recipes-support/emacs/emacs_27.2.bb
rename to meta-oe/recipes-support/emacs/emacs_28.2.bb
index 4a7e7aba5..7b0a422be 100644
--- a/meta-oe/recipes-support/emacs/emacs_27.2.bb
+++ b/meta-oe/recipes-support/emacs/emacs_28.2.bb
@@ -5,11 +5,10 @@ LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
=20
 SRC_URI =3D "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
-           file://emacs-glibc-2.34.patch \
           "
 SRC_URI:append:class-target =3D " file://usemake-docfile-native.patch"
=20
-SRC_URI[sha256sum] =3D "b4a7cc4e78e63f378624e0919215b910af5bb2a0afc819fa=
d298272e9f40c1b9"
+SRC_URI[sha256sum] =3D "ee21182233ef3232dc97b486af2d86e14042dbb65bbc535d=
f562c3a858232488"
=20
 CVE_CHECK_IGNORE =3D "\
     CVE-2007-6109 \
@@ -23,13 +22,23 @@ PACKAGECONFIG ??=3D "gnutls kerberos libgmp"
=20
 # We could use --without-all but its better to
 # split it into several packages (size of minimal doesnt change)
-EXTRA_OECONF =3D " --with-x=3Dno --with-dumping=3Dnone"
+EXTRA_OECONF =3D " --with-x=3Dno --with-dumping=3Dnone --disable-build-d=
etails"
+
+# Disable seccomp, as its a default dependency for gnutls but it doesnt =
work when cross-compiling emacs
+EXTRA_OECONF:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'gnutls'=
, 'ac_cv_have_decl_SECCOMP_FILTER_FLAG_TSYNC=3Dno ac_cv_have_decl_SECCOMP=
_SET_MODE_FILTER=3Dno', '', d)}"
+
=20
 DEPENDS =3D "ncurses"
 DEPENDS:append:class-target =3D " emacs-native"
=20
 inherit autotools mime-xdg pkgconfig
=20
+# Remove build host references to avoid target pollution
+do_compile:prepend () {
+    sed -i -e 's|${TMPDIR}||g' ${B}/src/config.h
+    sed -i -e 's|${B}||g' ${B}/src/epaths.h
+}
+
 do_compile:class-native (){
     cd ${B}/lib-src
     oe_runmake make-docfile
@@ -53,7 +62,6 @@ do_install:append(){
     chown -R root:root ${D}${datadir}
 }
=20
-
 # Use a similar strategy to how we build python:
 # Create three packages
 # minimal - A working lisp based text editor
@@ -68,191 +76,194 @@ RDEPENDS:${PN}-full:class-target =3D "${PN}"
=20
=20
 # A minimal version of emacs that works
+# These are kept sorted in alphabetical order
 FILES:${PN}-minimal =3D " \
-    ${datadir}/${BPN}/${PV}/lisp/loadup.el \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/byte-run.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/backquote.elc \
-    ${datadir}/${BPN}/${PV}/lisp/subr.elc \
-    ${datadir}/${BPN}/${PV}/lisp/version.elc \
-    ${datadir}/${BPN}/${PV}/lisp/widget.elc \
-    ${datadir}/${BPN}/${PV}/lisp/custom.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/map-ynp.elc \
-    ${datadir}/${BPN}/${PV}/lisp/international/mule.elc \
-    ${datadir}/${BPN}/${PV}/lisp/international/mule-conf.elc \
-    ${datadir}/${BPN}/${PV}/lisp/env.elc \
-    ${datadir}/${BPN}/${PV}/lisp/format.elc \
+    ${bindir}/emacs* \
+    ${datadir}/${BPN}/${PV}/etc/charsets/ \
+    ${datadir}/${BPN}/${PV}/lisp/abbrev.elc \
     ${datadir}/${BPN}/${PV}/lisp/bindings.elc \
-    ${datadir}/${BPN}/${PV}/lisp/window.elc \
-    ${datadir}/${BPN}/${PV}/lisp/files.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/macroexp.elc \
-    ${datadir}/${BPN}/${PV}/lisp/cus-face.elc \
-    ${datadir}/${BPN}/${PV}/lisp/faces.elc \
+    ${datadir}/${BPN}/${PV}/lisp/buff-menu.elc \
     ${datadir}/${BPN}/${PV}/lisp/button.elc \
-    ${datadir}/${BPN}/${PV}/lisp/loaddefs.el \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/nadvice.elc \
+    ${datadir}/${BPN}/${PV}/lisp/case-table.elc \
+    ${datadir}/${BPN}/${PV}/lisp/composite.elc \
+    ${datadir}/${BPN}/${PV}/lisp/cus-face.elc \
+    ${datadir}/${BPN}/${PV}/lisp/cus-start.elc \
+    ${datadir}/${BPN}/${PV}/lisp/custom.elc \
+    ${datadir}/${BPN}/${PV}/lisp/disp-table.elc \
+    ${datadir}/${BPN}/${PV}/lisp/electric.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/backquote.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/byte-opt.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/byte-run.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/bytecomp.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cconv.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-generic.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-preloaded.elc \
-    ${datadir}/${BPN}/${PV}/lisp/obarray.elc \
-    ${datadir}/${BPN}/${PV}/lisp/abbrev.elc \
-    ${datadir}/${BPN}/${PV}/lisp/simple.elc \
-    ${datadir}/${BPN}/${PV}/lisp/jka-cmpr-hook.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/easymenu.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eldoc.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/float-sup.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/gv.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/lisp-mode.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/lisp.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/macroexp.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/map-ynp.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/map.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/nadvice.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/regexp-opt.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/seq.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/shorthands.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/subr-x.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/syntax.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/tabulated-list.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/timer.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/vc/warnings.elc \
+    ${datadir}/${BPN}/${PV}/lisp/env.elc \
     ${datadir}/${BPN}/${PV}/lisp/epa-hook.elc \
-    ${datadir}/${BPN}/${PV}/lisp/international/mule-cmds.elc \
-    ${datadir}/${BPN}/${PV}/lisp/case-table.elc \
-    ${datadir}/${BPN}/${PV}/lisp/international/charprop.el \
+    ${datadir}/${BPN}/${PV}/lisp/facemenu.elc \
+    ${datadir}/${BPN}/${PV}/lisp/faces.elc \
+    ${datadir}/${BPN}/${PV}/lisp/files.elc \
+    ${datadir}/${BPN}/${PV}/lisp/font-core.elc \
+    ${datadir}/${BPN}/${PV}/lisp/font-lock.elc \
+    ${datadir}/${BPN}/${PV}/lisp/format.elc \
+    ${datadir}/${BPN}/${PV}/lisp/frame.elc \
+    ${datadir}/${BPN}/${PV}/lisp/help.elc \
+    ${datadir}/${BPN}/${PV}/lisp/image.elc \
+    ${datadir}/${BPN}/${PV}/lisp/indent.elc \
     ${datadir}/${BPN}/${PV}/lisp/international/characters.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/charprop.el \
     ${datadir}/${BPN}/${PV}/lisp/international/charscript.elc \
-    ${datadir}/${BPN}/${PV}/lisp/composite.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/cp51932.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/emoji-zwj.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/eucjp-ms.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/iso-transl.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/mule-cmds.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/mule-conf.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/mule.elc \
+    ${datadir}/${BPN}/${PV}/lisp/international/uni*.el \
+    ${datadir}/${BPN}/${PV}/lisp/isearch.elc \
+    ${datadir}/${BPN}/${PV}/lisp/jit-lock.elc \
+    ${datadir}/${BPN}/${PV}/lisp/jka-cmpr-hook.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/burmese.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/cham.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/chinese.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/cyrillic.elc \
-    ${datadir}/${BPN}/${PV}/lisp/language/indian.elc \
-    ${datadir}/${BPN}/${PV}/lisp/language/sinhala.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/czech.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/english.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/ethiopic.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/european.elc \
-    ${datadir}/${BPN}/${PV}/lisp/language/czech.elc \
-    ${datadir}/${BPN}/${PV}/lisp/language/slovak.elc \
-    ${datadir}/${BPN}/${PV}/lisp/language/romanian.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/georgian.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/greek.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/hebrew.elc \
-    ${datadir}/${BPN}/${PV}/lisp/international/cp51932.elc \
-    ${datadir}/${BPN}/${PV}/lisp/international/eucjp-ms.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/indian.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/japanese.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/khmer.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/korean.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/lao.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/misc-lang.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/romanian.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/sinhala.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/slovak.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/tai-viet.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/thai.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/tibetan.elc \
-    ${datadir}/${BPN}/${PV}/lisp/language/vietnamese.elc \
-    ${datadir}/${BPN}/${PV}/lisp/language/misc-lang.elc \
     ${datadir}/${BPN}/${PV}/lisp/language/utf-8-lang.elc \
-    ${datadir}/${BPN}/${PV}/lisp/language/georgian.elc \
-    ${datadir}/${BPN}/${PV}/lisp/language/khmer.elc \
-    ${datadir}/${BPN}/${PV}/lisp/language/burmese.elc \
-    ${datadir}/${BPN}/${PV}/lisp/language/cham.elc \
-    ${datadir}/${BPN}/${PV}/lisp/indent.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-generic.elc \
+    ${datadir}/${BPN}/${PV}/lisp/language/vietnamese.elc \
+    ${datadir}/${BPN}/${PV}/lisp/ldefs-boot.el \
+    ${datadir}/${BPN}/${PV}/lisp/loaddefs.el \
+    ${datadir}/${BPN}/${PV}/lisp/loadup.el \
+    ${datadir}/${BPN}/${PV}/lisp/menu-bar.elc \
     ${datadir}/${BPN}/${PV}/lisp/minibuffer.elc \
-    ${datadir}/${BPN}/${PV}/lisp/frame.elc \
-    ${datadir}/${BPN}/${PV}/lisp/startup.elc \
-    ${datadir}/${BPN}/${PV}/lisp/term/tty-colors.elc \
-    ${datadir}/${BPN}/${PV}/lisp/font-core.elc \
-    ${datadir}/${BPN}/${PV}/lisp/facemenu.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/syntax.elc \
-    ${datadir}/${BPN}/${PV}/lisp/font-lock.elc \
-    ${datadir}/${BPN}/${PV}/lisp/jit-lock.elc \
     ${datadir}/${BPN}/${PV}/lisp/mouse.elc \
-    ${datadir}/${BPN}/${PV}/lisp/select.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/timer.elc \
-    ${datadir}/${BPN}/${PV}/lisp/isearch.elc \
+    ${datadir}/${BPN}/${PV}/lisp/newcomment.elc \
+    ${datadir}/${BPN}/${PV}/lisp/obarray.elc \
+    ${datadir}/${BPN}/${PV}/lisp/paren.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/elisp-mode.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/prog-mode.elc \
+    ${datadir}/${BPN}/${PV}/lisp/register.elc \
+    ${datadir}/${BPN}/${PV}/lisp/replace.elc \
     ${datadir}/${BPN}/${PV}/lisp/rfn-eshadow.elc \
-    ${datadir}/${BPN}/${PV}/lisp/menu-bar.elc \
+    ${datadir}/${BPN}/${PV}/lisp/select.elc \
+    ${datadir}/${BPN}/${PV}/lisp/simple.elc \
+    ${datadir}/${BPN}/${PV}/lisp/simple.elc \
+    ${datadir}/${BPN}/${PV}/lisp/startup.elc \
+    ${datadir}/${BPN}/${PV}/lisp/subr.elc \
     ${datadir}/${BPN}/${PV}/lisp/tab-bar.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/lisp.elc \
+    ${datadir}/${BPN}/${PV}/lisp/term/tty-colors.elc \
+    ${datadir}/${BPN}/${PV}/lisp/term/xterm.elc \
+    ${datadir}/${BPN}/${PV}/lisp/textmodes/fill.elc \
     ${datadir}/${BPN}/${PV}/lisp/textmodes/page.elc \
-    ${datadir}/${BPN}/${PV}/lisp/register.elc \
     ${datadir}/${BPN}/${PV}/lisp/textmodes/paragraphs.elc \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/prog-mode.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/lisp-mode.elc \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/elisp-mode.elc \
     ${datadir}/${BPN}/${PV}/lisp/textmodes/text-mode.elc \
-    ${datadir}/${BPN}/${PV}/lisp/textmodes/fill.elc \
-    ${datadir}/${BPN}/${PV}/lisp/newcomment.elc \
-    ${datadir}/${BPN}/${PV}/lisp/replace.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/tabulated-list.elc \
-    ${datadir}/${BPN}/${PV}/lisp/buff-menu.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/float-sup.elc \
-    ${datadir}/${BPN}/${PV}/lisp/vc/vc-hooks.elc \
-    ${datadir}/${BPN}/${PV}/lisp/vc/ediff-hook.elc \
-    ${datadir}/${BPN}/${PV}/lisp/uniquify.elc \
-    ${datadir}/${BPN}/${PV}/lisp/electric.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eldoc.elc \
-    ${datadir}/${BPN}/${PV}/lisp/cus-start.elc \
     ${datadir}/${BPN}/${PV}/lisp/tooltip.elc \
-    ${datadir}/${BPN}/${PV}/lisp/simple.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/regexp-opt.elc \
-    ${datadir}/${BPN}/${PV}/lisp/term/xterm.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/bytecomp.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cconv.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/gv.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/byte-opt.elc \
-    ${datadir}/${BPN}/${PV}/lisp/image.elc \
-    ${datadir}/${BPN}/${PV}/lisp/ldefs-boot.el \
-    ${datadir}/${BPN}/${PV}/lisp/help.elc \
-    ${datadir}/${BPN}/${PV}/lisp/international/uni*.el \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/vc/warnings.elc \
-    ${datadir}/${BPN}/${PV}/etc/charsets/ \
-    ${datadir}/${BPN}/${PV}/lisp/disp-table.elc \
-    ${bindir}/emacs* \
+    ${datadir}/${BPN}/${PV}/lisp/uniquify.elc \
+    ${datadir}/${BPN}/${PV}/lisp/vc/ediff-hook.elc \
+    ${datadir}/${BPN}/${PV}/lisp/vc/vc-hooks.elc \
+    ${datadir}/${BPN}/${PV}/lisp/version.elc \
+    ${datadir}/${BPN}/${PV}/lisp/widget.elc \
+    ${datadir}/${BPN}/${PV}/lisp/window.elc \
     ${prefix}/libexec \
 "
=20
-
 # What works for "most" is relative, but this can be easily extended if =
needed
 FILES:${PN}-base =3D " \
-    ${datadir}/${BPN}/${PV}/etc/srecode \
     ${datadir}/${BPN}/${PV}/etc/e \
     ${datadir}/${BPN}/${PV}/etc/forms \
+    ${datadir}/${BPN}/${PV}/etc/srecode \
+    ${datadir}/${BPN}/${PV}/etc/themes/adwaita-theme.el \
+    ${datadir}/${BPN}/${PV}/etc/themes/deeper-blue-theme.el \
+    ${datadir}/${BPN}/${PV}/etc/themes/light-blue-theme.el \
+    ${datadir}/${BPN}/${PV}/etc/themes/misterioso-theme.el \
+    ${datadir}/${BPN}/${PV}/etc/themes/tango-theme.el \
+    ${datadir}/${BPN}/${PV}/etc/themes/wheatgrass-theme.el \
+    ${datadir}/${BPN}/${PV}/etc/themes/wombat-theme.el \
+    ${datadir}/${BPN}/${PV}/lisp/ansi-color.elc \
+    ${datadir}/${BPN}/${PV}/lisp/auth-source.elc \
+    ${datadir}/${BPN}/${PV}/lisp/calendar/iso8601.elc \
+    ${datadir}/${BPN}/${PV}/lisp/calendar/parse-time.elc \
+    ${datadir}/${BPN}/${PV}/lisp/calendar/time-date.elc \
     ${datadir}/${BPN}/${PV}/lisp/cedet \
-    ${datadir}/${BPN}/${PV}/site-lisp/ \
-    ${datadir}/${BPN}/${PV}/lisp/subdirs.el \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-mode.elc \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-defs.elc \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-vars.elc \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-engine.elc \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-styles.elc \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-fonts.elc \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-cmds.elc \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-align.elc \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-menus.elc \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-guess.elc \
+    ${datadir}/${BPN}/${PV}/lisp/comint.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-lib.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-macs.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/pcase.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/inline.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-seq.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/easymenu.elc \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/python* \
-    ${datadir}/${BPN}/${PV}/lisp/ansi-color.elc \
-    ${datadir}/${BPN}/${PV}/lisp/comint.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eieio-core.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eieio.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/inline.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/pcase.elc \
     ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/ring.elc \
+    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/smie.elc \
+    ${datadir}/${BPN}/${PV}/lisp/files-x.elc \
+    ${datadir}/${BPN}/${PV}/lisp/format-spec.elc \
     ${datadir}/${BPN}/${PV}/lisp/json.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/map.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/seq.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/subr-x.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/seq.elc \
+    ${datadir}/${BPN}/${PV}/lisp/ls-lisp.elc \
+    ${datadir}/${BPN}/${PV}/lisp/net/tramp-compat.elc \
+    ${datadir}/${BPN}/${PV}/lisp/net/tramp-integration.elc \
+    ${datadir}/${BPN}/${PV}/lisp/net/tramp-loaddefs.el \
     ${datadir}/${BPN}/${PV}/lisp/net/tramp-sh.elc \
     ${datadir}/${BPN}/${PV}/lisp/net/tramp.elc \
-    ${datadir}/${BPN}/${PV}/lisp/net/tramp-compat.elc \
-    ${datadir}/${BPN}/${PV}/lisp/auth-source.elc \
+    ${datadir}/${BPN}/${PV}/lisp/net/trampver.elc \
     ${datadir}/${BPN}/${PV}/lisp/password-cache.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eieio.elc \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eieio-core.elc \
-    ${datadir}/${BPN}/${PV}/lisp/format-spec.elc \
-    ${datadir}/${BPN}/${PV}/lisp/ls-lisp.elc \
-    ${datadir}/${BPN}/${PV}/lisp/calendar/parse-time.elc \
-    ${datadir}/${BPN}/${PV}/lisp/calendar/iso8601.elc \
-    ${datadir}/${BPN}/${PV}/lisp/calendar/time-date.elc \
-    ${datadir}/${BPN}/${PV}/lisp/shell.elc \
     ${datadir}/${BPN}/${PV}/lisp/pcomplete.elc \
-    ${datadir}/${BPN}/${PV}/lisp/net/tramp-integration.elc \
-    ${datadir}/${BPN}/${PV}/lisp/files-x.elc \
-    ${datadir}/${BPN}/${PV}/lisp/net/trampver.elc \
-    ${datadir}/${BPN}/${PV}/lisp/net/tramp-loaddefs.el \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/*perl* \
-    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/smie.elc \
     ${datadir}/${BPN}/${PV}/lisp/progmodes/*asm* \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/*perl* \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-align.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-cmds.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-defs.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-engine.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-fonts.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-guess.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-menus.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-mode.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-styles.elc \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-vars.elc \
     ${datadir}/${BPN}/${PV}/lisp/progmodes/cpp* \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/executable* \
     ${datadir}/${BPN}/${PV}/lisp/progmodes/make* \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/sh-script* \
-    ${datadir}/${BPN}/${PV}/etc/themes/adwaita-theme.el \
-    ${datadir}/${BPN}/${PV}/etc/themes/wheatgrass-theme.el \
-    ${datadir}/${BPN}/${PV}/etc/themes/deeper-blue-theme.el \
-    ${datadir}/${BPN}/${PV}/etc/themes/light-blue-theme.el \
-    ${datadir}/${BPN}/${PV}/etc/themes/misterioso-theme.el \
-    ${datadir}/${BPN}/${PV}/etc/themes/tango-theme.el \
-    ${datadir}/${BPN}/${PV}/etc/themes/wombat-theme.el \
     ${datadir}/${BPN}/${PV}/lisp/progmodes/prog* \
-    ${datadir}/${BPN}/${PV}/lisp/progmodes/executable* \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/python* \
+    ${datadir}/${BPN}/${PV}/lisp/progmodes/sh-script* \
+    ${datadir}/${BPN}/${PV}/lisp/shell.elc \
+    ${datadir}/${BPN}/${PV}/lisp/subdirs.el \
+    ${datadir}/${BPN}/${PV}/site-lisp/ \
 "
=20
 # Restore FILES for the full package to catch everything left
diff --git a/meta-oe/recipes-support/emacs/files/emacs-glibc-2.34.patch b=
/meta-oe/recipes-support/emacs/files/emacs-glibc-2.34.patch
deleted file mode 100644
index 6d764aa26..000000000
--- a/meta-oe/recipes-support/emacs/files/emacs-glibc-2.34.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f97e07ea807cc6d38774a3888a15091b20645ac6 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Tue, 9 Mar 2021 11:22:59 -0800
-Subject: [PATCH] Port alternate signal stack to upcoming glibc 2.34
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-* src/sysdep.c (sigsegv_stack): Increase size to 64 KiB and align
-it to max_align_t.  This copies from Gnulib=E2=80=99s c-stack.c, and wor=
ks
-around a portability bug in draft glibc 2.34, which no longer
-defines SIGSTKSZ when _GNU_SOURCE is defined.
----
- src/sysdep.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/src/sysdep.c b/src/sysdep.c
-index 941b4e2fa2..24d8832b2f 100644
---- a/src/sysdep.c
-+++ b/src/sysdep.c
-@@ -1785,7 +1785,15 @@ handle_arith_signal (int sig)
-=20
- /* Alternate stack used by SIGSEGV handler below.  */
-=20
--static unsigned char sigsegv_stack[SIGSTKSZ];
-+/* Storage for the alternate signal stack.
-+   64 KiB is not too large for Emacs, and is large enough
-+   for all known platforms.  Smaller sizes may run into trouble.
-+   For example, libsigsegv 2.6 through 2.8 have a bug where some
-+   architectures use more than the Linux default of an 8 KiB alternate
-+   stack when deciding if a fault was caused by stack overflow.  */
-+static max_align_t sigsegv_stack[(64 * 1024
-+				  + sizeof (max_align_t) - 1)
-+				 / sizeof (max_align_t)];
-=20
-=20
- /* Return true if SIGINFO indicates a stack overflow.  */
---=20
-2.29.2
-
diff --git a/meta-oe/recipes-support/emacs/files/usemake-docfile-native.p=
atch b/meta-oe/recipes-support/emacs/files/usemake-docfile-native.patch
index cc0b05c79..95b428183 100644
--- a/meta-oe/recipes-support/emacs/files/usemake-docfile-native.patch
+++ b/meta-oe/recipes-support/emacs/files/usemake-docfile-native.patch
@@ -11,11 +11,11 @@ version of the recipe instead.
=20
 Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.=
org>
=20
-Index: emacs-27.1/src/Makefile.in
+Index: emacs-28.2/src/Makefile.in
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- emacs-27.1.orig/src/Makefile.in
-+++ emacs-27.1/src/Makefile.in
-@@ -472,7 +472,7 @@ ifeq ($(CHECK_STRUCTS),true)
+--- emacs-28.2.orig/src/Makefile.in
++++ emacs-28.2/src/Makefile.in
+@@ -462,7 +462,7 @@ ifeq ($(CHECK_STRUCTS),true)
  pdumper.o: dmpstruct.h
  endif
  dmpstruct.h: $(srcdir)/dmpstruct.awk
@@ -24,7 +24,7 @@ Index: emacs-27.1/src/Makefile.in
  	$(AM_V_GEN)POSIXLY_CORRECT=3D1 awk -f $(srcdir)/dmpstruct.awk \
  		$(dmpstruct_headers) > $@
 =20
-@@ -566,8 +566,7 @@ ${lispintdir}/characters.elc: ${charscri
+@@ -563,8 +563,7 @@ SYSTEM_TYPE =3D @SYSTEM_TYPE@
  ## Strictly speaking, emacs does not depend directly on all of $lisp,
  ## since not all pieces are used on all platforms.  But DOC depends
  ## on all of $lisp, and emacs depends on DOC, so it is ok to use $lisp =
here.
@@ -32,9 +32,9 @@ Index: emacs-27.1/src/Makefile.in
 -                lisp.mk $(etc)/DOC $(lisp) \
 +emacs$(EXEEXT): lisp.mk $(etc)/DOC $(lisp) \
                  $(lispsource)/international/charprop.el ${charsets}
- ifeq ($(DUMPING),unexec)
- 	LC_ALL=3DC $(RUN_TEMACS) -batch $(BUILD_DETAILS) -l loadup --temacs=3D=
dump
-@@ -596,15 +595,15 @@ endif
+ ifeq ($(SYSTEM_TYPE),cygwin)
+ 	find ${top_builddir} -name '*.eln' | rebase -v -O -T -
+@@ -597,15 +596,15 @@ endif
  ## for the first time, this prevents any variation between configuratio=
ns
  ## in the contents of the DOC file.
  ##
@@ -54,9 +54,9 @@ Index: emacs-27.1/src/Makefile.in
    $(lib)/libgnu.a
  	$(MAKE) -C $(dir $@) $(notdir $@)
 =20
-@@ -622,8 +621,8 @@ am__v_GLOBALS_ =3D $(am__v_GLOBALS_@AM_DEF
- am__v_GLOBALS_0 =3D @echo "  GEN     " globals.h;
- am__v_GLOBALS_1 =3D
+@@ -618,8 +617,8 @@ buildobj.h: Makefile
+=20
+ GLOBAL_SOURCES =3D $(base_obj:.o=3D.c) $(NS_OBJC_OBJ:.o=3D.m)
 =20
 -gl-stamp: $(libsrc)/make-docfile$(EXEEXT) $(GLOBAL_SOURCES)
 -	$(AM_V_GLOBALS)$(libsrc)/make-docfile -d $(srcdir) -g $(obj) > globals=
.tmp
@@ -65,7 +65,7 @@ Index: emacs-27.1/src/Makefile.in
  	$(AM_V_at)$(top_srcdir)/build-aux/move-if-change globals.tmp globals.h
  	$(AM_V_at)echo timestamp > $@
 =20
-@@ -637,7 +636,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)
+@@ -633,7 +632,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)
  	$(MAKE) -C $(dir $@) all
 =20
  ifeq ($(HAVE_PDUMPER),yes)
@@ -74,12 +74,12 @@ Index: emacs-27.1/src/Makefile.in
  else
    MAKE_PDUMPER_FINGERPRINT =3D
  endif
-@@ -647,7 +646,7 @@ endif
+@@ -643,7 +642,7 @@ endif
  ## This goes on to affect various things, and the emacs binary fails
  ## to start if Vinstallation_directory has the wrong value.
  temacs$(EXEEXT): $(LIBXMENU) $(ALLOBJS) $(LIBEGNU_ARCHIVE) $(EMACSRES) =
\
--  $(charsets) $(charscript) $(MAKE_PDUMPER_FINGERPRINT)
-+  $(charsets) $(charscript)
+-  $(charsets) $(charscript) ${emoji-zwj} $(MAKE_PDUMPER_FINGERPRINT)
++  $(charsets) $(charscript) ${emoji-zwj}
  	$(AM_V_CCLD)$(CC) -o $@.tmp \
  	  $(ALL_CFLAGS) $(TEMACS_LDFLAGS) $(LDFLAGS) \
  	  $(ALLOBJS) $(LIBEGNU_ARCHIVE) $(W32_RES_LINK) $(LIBES)
--=20
2.25.1


