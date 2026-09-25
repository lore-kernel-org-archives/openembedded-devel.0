Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B716AC9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 09:23:33 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4133.1790328203698473817
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 02:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=BS2Pv3Qv;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout06.t-online.de (Postfix) with SMTP id 8B44643E
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 11:23:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.226.236]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xA29F-2nGBZA0; Fri, 25 Sep 2026 11:23:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] ibus: upgrade 1.5.26 -> 1.5.34
Date: Fri, 25 Sep 2026 11:23:07 +0200
Message-ID: <20260925092311.764729-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1790328197-7BFFC86D-6AB95A77/0/0 CLEAN NORMAL
X-TOI-MSGID: ad99ccce-44c3-42ae-ab56-f1b771becc15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790328201; i=f_l_k@t-online.de;
	bh=O0PDx7TqTY+0bgdnvHPOeqVqZPYxjNj6WrnDc1Dz4rI=;
	h=From:To:Subject:Date;
	b=BS2Pv3QvX/vOKM3MXnGMP12PQfzlubhNYGphm75OeKyV+sKPZUuoc8TovpNIFKbSJ
	 cfKmFdS6eX9mRDHWgR3Vo0bGlJUIiaC9pJgTVWb4pokWSg++bJcWBudONRt4YSrCfW
	 9x2LshdIxFxVTWfPuQdoRetPSfqT69eVWiXBwrTCR0xgiHP85CZDZiMpCd076NcfBZ
	 24PGLP016yI3qyH0/FP+3Vmb9+NpGTne7tOfOCAD/MgFhZuAq1TXtsGzaRmjsBL5kM
	 kZvHCWq6p9I18QM18Ul1szIhLvLBB6l+aAUhyOpjLOgq0ckAoyj2jnhllG6BqYhfFu
	 xrL4tXX22VBVg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 09:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130293

Drop the three backports, which are part of the release, and rebase the
dbus-launch patch onto the reworked make-dconf-override-db.sh.

libnotify is now checked unconditionally unless disabled, so add a
libnotify PACKAGECONFIG, enabled with x11 since only the X11 panel
uses it. ibus-native needs the generated ibusresources.h. The internal
compose table is generated at build time and reads ./Compose before
the X11 locale dir, so copy it from libx11-native instead of touching
the host's. The wayland GIR needs libibus from the build tree on the
qemu library path.

Tested by building ibus and ibus-native for x86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/ibus/ibus-native.bb       |   1 +
 meta-gnome/recipes-support/ibus/ibus.bb       |   5 +
 meta-gnome/recipes-support/ibus/ibus.inc      |  16 +-
 ...start-dbus-we-do-not-have-dbus-lauch.patch |  17 +-
 ...01-makefile-don-t-gzip-the-man-pages.patch | 164 ------------------
 ...c-Fix-declaration-errors-with-GCC-15.patch |  36 ----
 ...incompatible-pointer-types-in-Transp.patch | 109 ------------
 7 files changed, 27 insertions(+), 321 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-makefile-do=
n-t-gzip-the-man-pages.patch
 delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-dec=
laration-errors-with-GCC-15.patch
 delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit=
-Fix-incompatible-pointer-types-in-Transp.patch

diff --git a/meta-gnome/recipes-support/ibus/ibus-native.bb b/meta-gnome/=
recipes-support/ibus/ibus-native.bb
index ca65114c4d..7ba9b57617 100644
--- a/meta-gnome/recipes-support/ibus/ibus-native.bb
+++ b/meta-gnome/recipes-support/ibus/ibus-native.bb
@@ -21,6 +21,7 @@ do_compile() {
     # necessary step by step
     oe_runmake ibusenumtypes.h
     oe_runmake ibusmarshalers.h
+    oe_runmake ibusresources.h
     oe_runmake ibusenumtypes.c
     oe_runmake unicode-parser
 }
diff --git a/meta-gnome/recipes-support/ibus/ibus.bb b/meta-gnome/recipes=
-support/ibus/ibus.bb
index 479498d82f..08a7804ea9 100644
--- a/meta-gnome/recipes-support/ibus/ibus.bb
+++ b/meta-gnome/recipes-support/ibus/ibus.bb
@@ -17,10 +17,15 @@ PACKAGECONFIG ??=3D " \
     dconf vala \
     ${@bb.utils.contains_any('DISTRO_FEATURES', [ 'wayland', 'x11' ], 'g=
tk3 gtk4', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libnotify', '', d)} =
\
 "
=20
 REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'gtk=
4', 'opengl', '', d)}"
=20
+do_compile:prepend() {
+    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
+}
+
 do_configure:prepend() {
     # run native unicode-parser
     sed -i 's:$(builddir)/unicode-parser:unicode-parser:g' ${S}/src/Make=
file.am
diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipe=
s-support/ibus/ibus.inc
index 1344cb1981..d9d8b70861 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -5,24 +5,22 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857=
fcd118f065f900982c24"
=20
 inherit autotools-brokensep pkgconfig gobject-introspection gettext gtk-=
doc vala
=20
-PV =3D "1.5.26"
+PV =3D "1.5.34"
=20
-DEPENDS =3D "unicode-ucd"
+DEPENDS =3D "unicode-ucd libx11-native"
=20
 SRC_URI =3D " \
-    git://github.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps \
+    git://github.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps;tag=3D=
${PV} \
     file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch=
 \
-    file://0001-makefile-don-t-gzip-the-man-pages.patch \
-    file://0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.pat=
ch \
-    file://0001-src-Fix-declaration-errors-with-GCC-15.patch \
 "
-SRCREV =3D "6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3"
+SRCREV =3D "1f7af28437afd62a6d145bfc81035e698a37411d"
=20
 PACKAGECONFIG[appindicator] =3D "--enable-appindicator,--disable-appindi=
cator,qtbase"
 PACKAGECONFIG[dconf] =3D "--enable-dconf,--disable-dconf,dconf"
 PACKAGECONFIG[gtk2] =3D "--enable-gtk2,--disable-gtk2,gtk+"
 PACKAGECONFIG[gtk3] =3D "--enable-gtk3,--disable-gtk3,gtk+3"
 PACKAGECONFIG[gtk4] =3D "--enable-gtk4,--disable-gtk4,gtk4"
+PACKAGECONFIG[libnotify] =3D "--enable-libnotify,--disable-libnotify,lib=
notify"
 PACKAGECONFIG[systemd] =3D "--enable-systemd-services,--disable-systemd-=
services,systemd"
 PACKAGECONFIG[wayland]  =3D "--enable-wayland,--disable-wayland,wayland"
 PACKAGECONFIG[vala]  =3D "--enable-vala,--disable-vala"
@@ -43,3 +41,7 @@ do_configure:prepend() {
     # Remove vapigen.m4 bundled with sources so that the one shipped by =
vala is used instead.
     rm -f ${S}/m4/vapigen.m4
 }
+
+do_compile:prepend() {
+    cp ${STAGING_DATADIR_NATIVE}/X11/locale/en_US.UTF-8/Compose ${B}/src=
/Compose
+}
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-star=
t-dbus-we-do-not-have-dbus-lauch.patch b/meta-gnome/recipes-support/ibus/=
ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
index aec9e7abec..64ad6b0857 100644
--- a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-=
we-do-not-have-dbus-lauch.patch
+++ b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-=
we-do-not-have-dbus-lauch.patch
@@ -10,23 +10,30 @@ Upstream-Status: Inappropriate [OE specific]
=20
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
 ---
- data/dconf/make-dconf-override-db.sh | 6 ------
- 1 file changed, 6 deletions(-)
+ data/dconf/make-dconf-override-db.sh | 11 -----------
+ 1 file changed, 11 deletions(-)
=20
+diff --git a/data/dconf/make-dconf-override-db.sh b/data/dconf/make-dcon=
f-override-db.sh
+index 32cb153..375baa4 100755
 --- a/data/dconf/make-dconf-override-db.sh
 +++ b/data/dconf/make-dconf-override-db.sh
-@@ -12,10 +12,6 @@ export XDG_CACHE_HOME=3D"$TMPDIR/cache"
+@@ -12,15 +12,6 @@ export XDG_CACHE_HOME=3D"$TMPDIR/cache"
  export GSETTINGS_SCHEMA_DIR=3D"$TMPDIR/schemas"
  mkdir -p $XDG_CONFIG_HOME $XDG_CACHE_HOME $GSETTINGS_SCHEMA_DIR
 =20
 -eval `dbus-launch --sh-syntax`
 -
--trap 'rm -rf $TMPDIR; kill $DBUS_SESSION_BUS_PID' ERR
+-trap cleanup EXIT
+-
+-cleanup() {
+-  test $? -eq 0 && exit
+-  rm -rf $TMPDIR; kill $DBUS_SESSION_BUS_PID
+-}
 -
  # in case that schema is not installed on the system
  glib-compile-schemas --targetdir "$GSETTINGS_SCHEMA_DIR" "$PWD"
 =20
-@@ -52,5 +48,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then
+@@ -57,5 +48,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then
      umount $TMPDIR/cache/gvfs
  fi
  rm -rf $TMPDIR
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzi=
p-the-man-pages.patch b/meta-gnome/recipes-support/ibus/ibus/0001-makefil=
e-don-t-gzip-the-man-pages.patch
deleted file mode 100644
index 105e34873a..0000000000
--- a/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-m=
an-pages.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 5307c3b310fabeaa52fafe743c5efaca73ccce46 Mon Sep 17 00:00:00 2001
-From: Emil Velikov <emil.l.velikov@gmail.com>
-Date: Sun, 11 Jun 2023 16:16:35 +0900
-Subject: [PATCH] makefile: don't gzip the man pages
-
-Drop the gzip step from the manpages - distributions already do that as
-needed. In addition this resolves the final reproducibility issue with
-ibus.
-
-BUG=3Dhttps://github.com/ibus/ibus/pull/2514
-
-Upstream-Status: Backport [https://github.com/ibus/ibus/commit/1a25975d9=
f55f18eab609e4d147dd32689e367f3]
-Note: This commit is included in version >=3D 1.5.29 and can be dropped
-after upgrading.
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
----
- bus/Makefile.am        | 6 +-----
- data/dconf/Makefile.am | 6 +-----
- setup/Makefile.am      | 6 +-----
- tools/Makefile.am      | 6 +-----
- ui/gtk3/Makefile.am    | 6 +-----
- 5 files changed, 5 insertions(+), 25 deletions(-)
-
-diff --git a/bus/Makefile.am b/bus/Makefile.am
-index e173ee25..d0445d02 100644
---- a/bus/Makefile.am
-+++ b/bus/Makefile.am
-@@ -169,7 +169,6 @@ EXTRA_DIST =3D                \
-=20
- CLEANFILES =3D \
- 	$(man_one_DATA)            \
--	$(man_one_files)        \
- 	$(NULL)
-=20
- $(libibus):
-@@ -181,14 +180,11 @@ test: ibus-daemon
- 		$(builddir)/ibus-daemon -v
-=20
- man_one_in_files =3D ibus-daemon.1.in
--man_one_files =3D $(man_one_in_files:.1.in=3D.1)
--man_one_DATA =3D$(man_one_files:.1=3D.1.gz)=20
-+man_one_DATA =3D $(man_one_in_files:.1.in=3D.1)
- man_onedir =3D $(mandir)/man1
- %.1: %.1.in
- 	$(AM_V_GEN) sed \
- 		-e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
- 		mv $@.tmp $@
--%.1.gz: %.1
--	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
-=20
- -include $(top_srcdir)/git.mk
-diff --git a/data/dconf/Makefile.am b/data/dconf/Makefile.am
-index 5360f033..2352f770 100644
---- a/data/dconf/Makefile.am
-+++ b/data/dconf/Makefile.am
-@@ -38,15 +38,12 @@ dconfdb_DATA =3D 00-upstream-settings
- 		{ rc=3D$$?; $(RM) -rf $@; exit $$rc; }
-=20
- man_5_in_files =3D 00-upstream-settings.5.in ibus.5.in
--man_5_files =3D $(man_5_in_files:.5.in=3D.5)
--man_5_DATA =3D$(man_5_files:.5=3D.5.gz)
-+man_5_DATA =3D $(man_5_in_files:.5.in=3D.5)
- man_5dir =3D $(mandir)/man5
- %.5: %.5.in
- 	$(AM_V_GEN) sed \
- 	    -e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
- 	    mv $@.tmp $@
--%.5.gz: %.5
--	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
-=20
- install-data-hook:
- 	if test -z "$(DESTDIR)"; then \
-@@ -63,7 +60,6 @@ EXTRA_DIST =3D \
-=20
- CLEANFILES =3D \
-     $(man_5_DATA) \
--    $(man_5_files) \
-     $(NULL)
-=20
- MAINTAINERCLEANFILES =3D \
-diff --git a/setup/Makefile.am b/setup/Makefile.am
-index 34c8f136..b34aa8fc 100644
---- a/setup/Makefile.am
-+++ b/setup/Makefile.am
-@@ -56,20 +56,16 @@ org.freedesktop.IBus.Setup.desktop: ibus-setup.deskt=
op
- 	$(AM_V_GEN) $(MSGFMT) --desktop --template $< -d $(top_srcdir)/po -o $=
@
-=20
- man_one_in_files =3D ibus-setup.1.in
--man_one_files =3D $(man_one_in_files:.1.in=3D.1)
--man_one_DATA =3D$(man_one_files:.1=3D.1.gz)=20
-+man_one_DATA =3D $(man_one_in_files:.1.in=3D.1)
- man_onedir =3D $(mandir)/man1
- %.1: %.1.in
- 	$(AM_V_GEN) sed \
- 		-e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
- 		mv $@.tmp $@
--%.1.gz: %.1
--	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
-=20
- CLEANFILES =3D \
-     $(desktop_DATA) \
-     $(man_one_DATA) \
--    $(man_one_files) \
-     *.pyc \
-     ibus-setup \
-     $(NULL)
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 5c18d3d6..1c716136 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
-@@ -79,15 +79,12 @@ bash_completion_DATA=3D \
- bash_completiondir=3D@datadir@/bash-completion/completions
-=20
- man_one_in_files =3D ibus.1.in
--man_one_files =3D $(man_one_in_files:.1.in=3D.1)
--man_one_DATA =3D$(man_one_files:.1=3D.1.gz)=20
-+man_one_DATA =3D $(man_one_in_files:.1.in=3D.1)
- man_onedir =3D $(mandir)/man1
- %.1: %.1.in
- 	$(AM_V_GEN) sed \
- 		-e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
- 		mv $@.tmp $@
--%.1.gz: %.1
--	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
-=20
- EXTRA_DIST =3D \
- 	$(man_one_in_files) \
-@@ -96,7 +93,6 @@ EXTRA_DIST =3D \
-=20
- CLEANFILES =3D \
- 	$(man_one_DATA) \
--	$(man_one_files) \
- 	$(NULL)
-=20
- if ENABLE_EMOJI_DICT
-diff --git a/ui/gtk3/Makefile.am b/ui/gtk3/Makefile.am
-index ab379328..aff035da 100644
---- a/ui/gtk3/Makefile.am
-+++ b/ui/gtk3/Makefile.am
-@@ -242,15 +242,12 @@ panelbinding.o: $(srcdir)/panelbinding.c
-=20
- MAINTAINERCLEANFILES +=3D extension.c panelbinding.c
-=20
--man_seven_files =3D $(man_seven_in_files:.7.in=3D.7)
--man_seven_DATA =3D$(man_seven_files:.7=3D.7.gz)
-+man_seven_DATA =3D $(man_seven_in_files:.7.in=3D.7)
- man_sevendir =3D $(mandir)/man7
- %.7: %.7.in
- 	$(AM_V_GEN) sed \
- 	    -e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
- 	    mv $@.tmp $@
--%.7.gz: %.7
--	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
-=20
- desktop_in_files =3D \
-     ibus-ui-emojier.desktop.in \
-@@ -278,7 +275,6 @@ CLEANFILES +=3D \
-     $(desktop_DATA) \
-     $(desktop_notrans_files) \
-     $(man_seven_DATA) \
--    $(man_seven_files) \
-     $(NULL)
-=20
- endif
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaratio=
n-errors-with-GCC-15.patch b/meta-gnome/recipes-support/ibus/ibus/0001-sr=
c-Fix-declaration-errors-with-GCC-15.patch
deleted file mode 100644
index 150ff631ba..0000000000
--- a/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-error=
s-with-GCC-15.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0f5407f8a3846477fcaa73505437e805467901e1 Mon Sep 17 00:00:00 2001
-From: fujiwarat <takao.fujiwara1@gmail.com>
-Date: Fri, 24 Jan 2025 09:40:31 +0900
-Subject: [PATCH] src: Fix declaration errors with GCC 15
-
-
-BUG=3Drhbz#2340629
-
-Upstream-Status: Backport [https://github.com/ibus/ibus/commit/aac5446e8=
c98db934912b9b15a1ef92c3b7e4c8c]
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
----
- src/ibusenginesimple.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/ibusenginesimple.c b/src/ibusenginesimple.c
-index c57a3ea5..60e7fb34 100644
---- a/src/ibusenginesimple.c
-+++ b/src/ibusenginesimple.c
-@@ -477,7 +477,7 @@ check_hex (IBusEngineSimple *simple,
- }
-=20
- static IBusEngineDict *
--load_emoji_dict ()
-+load_emoji_dict (void)
- {
-     IBusEngineDict *emoji_dict;
-     GList *keys;
-@@ -520,7 +520,7 @@ check_emoji_table (IBusEngineSimple       *simple,
-         g_object_ref_sink (priv->lookup_table);
-     }
-     if (emoji_dict =3D=3D NULL)
--        emoji_dict =3D priv->emoji_dict =3D load_emoji_dict (simple);
-+        emoji_dict =3D priv->emoji_dict =3D load_emoji_dict ();
-=20
-     if (emoji_dict =3D=3D NULL || emoji_dict->dict =3D=3D NULL)
-         return FALSE;
diff --git a/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-in=
compatible-pointer-types-in-Transp.patch b/meta-gnome/recipes-support/ibu=
s/ibus/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch
deleted file mode 100644
index 229a9d34aa..0000000000
--- a/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompati=
ble-pointer-types-in-Transp.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From b0a554d7c9d4d52bd34a85fe66a85adf9542a2ec Mon Sep 17 00:00:00 2001
-From: fujiwarat <takao.fujiwara1@gmail.com>
-Date: Fri, 24 Jan 2025 10:01:11 +0900
-Subject: [PATCH] util/IMdkit: Fix incompatible-pointer-types in
- TransportSW.checkAddr
-
-
-BUG=3Drhbz#2340629
-
-Upstream-Status: Backport [https://github.com/ibus/ibus/commit/d039b95b1=
af14fd34167a4ca038938cef2ea41ca]
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
----
- util/IMdkit/Xi18n.h           | 18 ++++++++++--------
- util/IMdkit/i18nMethod.c      |  3 ++-
- util/IMdkit/i18nOffsetCache.c | 10 ++++++----
- 3 files changed, 18 insertions(+), 13 deletions(-)
-
-diff --git a/util/IMdkit/Xi18n.h b/util/IMdkit/Xi18n.h
-index 79dd9619..09097bb6 100644
---- a/util/IMdkit/Xi18n.h
-+++ b/util/IMdkit/Xi18n.h
-@@ -3,7 +3,7 @@
-          Copyright (C) 1994-1995 Sun Microsystems, Inc.
-          Copyright (C) 1993-1994 Hewlett-Packard Company
-          Copyright (C) 2014 Peng Huang <shawn.p.huang@gmail.com>
--         Copyright (C) 2014 Red Hat, Inc.
-+         Copyright (C) 2014-2025 Red Hat, Inc.
- =20
- Permission to use, copy, modify, distribute, and sell this software
- and its documentation for any purpose is hereby granted without fee,
-@@ -71,13 +71,6 @@ IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOF=
TWARE.
- #define I18N_SET	1
- #define I18N_GET	2
-=20
--typedef struct
--{
--    char        *transportname;
--    int         namelen;
--    Bool        (*checkAddr) ();
--} TransportSW;
--
- typedef struct _XIMPending
- {
-     unsigned    char *p;
-@@ -172,6 +165,15 @@ typedef struct _Xi18nClient
-=20
- typedef struct _Xi18nCore *Xi18n;
-=20
-+typedef struct _TransportSW TransportSW;
-+
-+struct _TransportSW
-+{
-+    char        *transportname;
-+    int         namelen;
-+    Bool        (*checkAddr) (Xi18n, TransportSW *, char *);
-+};
-+
- /*
-  * Callback Struct for XIM Protocol
-  */
-diff --git a/util/IMdkit/i18nMethod.c b/util/IMdkit/i18nMethod.c
-index 9c44e7fe..7f343d87 100644
---- a/util/IMdkit/i18nMethod.c
-+++ b/util/IMdkit/i18nMethod.c
-@@ -2,6 +2,7 @@
- =20
-          Copyright 1994, 1995 by Sun Microsystems, Inc.
-          Copyright 1993, 1994 by Hewlett-Packard Company
-+         Copyright (C) 2014-2025 Red Hat, Inc.
- =20
- Permission to use, copy, modify, distribute, and sell this software
- and its documentation for any purpose is hereby granted without fee,
-@@ -89,7 +90,7 @@ TransportSW _TransR[] =3D
- #ifdef DNETCONN
-     {"decnet",          6, _Xi18nCheckTransAddress},
- #endif
--    {(char *) NULL,     0, (Bool (*) ()) NULL}
-+    {(char *) NULL,     0, (Bool (*) (Xi18n, TransportSW *, char *))NUL=
L}
- };
-=20
- static Bool GetInputStyles (Xi18n i18n_core, XIMStyles **p_style)
-diff --git a/util/IMdkit/i18nOffsetCache.c b/util/IMdkit/i18nOffsetCache=
.c
-index e2fe8c6b..cab974c7 100644
---- a/util/IMdkit/i18nOffsetCache.c
-+++ b/util/IMdkit/i18nOffsetCache.c
-@@ -1,6 +1,6 @@
- /*
-  * Copyright (C) 2014 Peng Huang <shawn.p.huang@gmail.com>
-- * Copyright (C) 2014 Red Hat, Inc.
-+ * Copyright (C) 2014-2025 Red Hat, Inc.
-  *
-  * Permission to use, copy, modify, distribute, and sell this
-  * software and its documentation for any purpose is hereby granted
-@@ -83,10 +83,12 @@ void _Xi18nSetPropertyOffset (Xi18nOffsetCache *offs=
et_cache, Atom key,
-     }
-=20
-     if (++offset_cache->size > offset_cache->capacity) {
--        offset_cache->capacity *=3D OFFSET_CACHE_GROWTH_FACTOR;
--        offset_cache->data =3D (Xi18nAtomOffsetPair *) realloc (data,
-+        Xi18nAtomOffsetPair *pair =3D (Xi18nAtomOffsetPair *) realloc (=
data,
-                 offset_cache->capacity * sizeof (Xi18nAtomOffsetPair));
--        if (offset_cache->data =3D=3D NULL) {
-+        offset_cache->capacity *=3D OFFSET_CACHE_GROWTH_FACTOR;
-+        if (pair) {
-+            offset_cache->data =3D pair;
-+        } else {
-             offset_cache->data =3D data;
-             --offset_cache->size;
-         }
--=20
2.55.0


