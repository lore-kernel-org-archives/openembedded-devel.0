Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A55C9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 06:54:58 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2767.1790319289372072925
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2026 23:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=mLSicnOY;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout04.t-online.de (Postfix) with SMTP id 760AE3FD
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 08:54:46 +0200 (CEST)
Received: from [192.168.178.36] ([79.219.226.236]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x9zpV-2JWhgu0; Fri, 25 Sep 2026 08:54:45 +0200
Date: Fri, 25 Sep 2026 08:54:38 +0200
From: "Markus Volk" <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] ibus: upgrade 1.5.26 -> 1.5.34
To: openembedded-devel@lists.openembedded.org
Message-Id: <27RWLT.S28XN5BVXU3I@t-online>
In-Reply-To: <18D87D5FDC1B6D88.1273419@lists.openembedded.org>
References: <18D87D5FDC1B6D88.1273419@lists.openembedded.org>
X-Mailer: net.donnybeelo.Convey/50.2-1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-t1yh+k1hVZ/seu8I4Pbg"
X-TOI-EXPURGATEID: 150726::1790319285-0D7F9950-0A8C96B8/0/0 CLEAN NORMAL
X-TOI-MSGID: f4e3b722-005f-49f2-9bd4-cfca002dd796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790319286; i=f_l_k@t-online.de;
	bh=mghMmk3T0rzkcVc0eC4VnP9V6L+vlpS91Aruy4bAyjg=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=mLSicnOYVOVS92nX8FJvHCWVR6OGA4m7YDjclc3wK9wqoSZDsJ204L5IfGb//S8B5
	 0WxJCX71Hvpx6vEx2UkUyLyxIUa6kWiug3JlJAr99wZIECv1shBNeJbCeKQdzyKryD
	 tfbNA1pf9keaG3EZGvBaV+3nPwjgiVHg3XWHiFFKfMcj9um3sSHRArGFdCypINqUlI
	 xiD6e2KwIig+aAifccbSMExdSWvOHpdiq+pbmrpoY0EX6HuBOVCHL6+EsugUC+VgZx
	 c6evnVYbvlcRNofZ5yomGTd43hUlJp+KDmEYlQj4Nqy4I+fUWEIFP0kUtqI/+8DvSA
	 vN4yiW3K9J6Ew==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 06:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130290

--=-t1yh+k1hVZ/seu8I4Pbg
Content-Type: text/plain; charset=iso-8859-1; format=flowed

This update requires a patch for libx11 in oe-core

On Fri, Sep 25 2026 at 08:44:35 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Drop the three backports, which are part of the release, and rebase 
> the
> dbus-launch patch onto the reworked make-dconf-override-db.sh.
> 
> libnotify is now checked unconditionally unless disabled, so add a
> libnotify PACKAGECONFIG, enabled with x11 since only the X11 panel
> uses it. ibus-native needs the generated ibusresources.h. The internal
> compose table is generated at build time and reads ./Compose before
> the X11 locale dir, so copy it from libx11-native instead of touching
> the host's. The wayland GIR needs libibus from the build tree on the
> qemu library path.
> 
> Tested by building ibus and ibus-native for x86-64.
> 
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-support/ibus/ibus-native.bb       |   1 +
>  meta-gnome/recipes-support/ibus/ibus.bb       |   5 +
>  meta-gnome/recipes-support/ibus/ibus.inc      |  14 +-
>  ...start-dbus-we-do-not-have-dbus-lauch.patch |  17 +-
>  ...01-makefile-don-t-gzip-the-man-pages.patch | 164 
> ------------------
>  ...c-Fix-declaration-errors-with-GCC-15.patch |  36 ----
>  ...incompatible-pointer-types-in-Transp.patch | 109 ------------
>  7 files changed, 26 insertions(+), 320 deletions(-)
>  delete mode 100644 
> meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-pages.patch
>  delete mode 100644 
> meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-with-GCC-15.patch
>  delete mode 100644 
> meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch
> 
> diff --git a/meta-gnome/recipes-support/ibus/ibus-native.bb 
> b/meta-gnome/recipes-support/ibus/ibus-native.bb
> index ca65114c4d..7ba9b57617 100644
> --- a/meta-gnome/recipes-support/ibus/ibus-native.bb
> +++ b/meta-gnome/recipes-support/ibus/ibus-native.bb
> @@ -21,6 +21,7 @@ do_compile() {
>      # necessary step by step
>      oe_runmake ibusenumtypes.h
>      oe_runmake ibusmarshalers.h
> +    oe_runmake ibusresources.h
>      oe_runmake ibusenumtypes.c
>      oe_runmake unicode-parser
>  }
> diff --git a/meta-gnome/recipes-support/ibus/ibus.bb 
> b/meta-gnome/recipes-support/ibus/ibus.bb
> index 479498d82f..08a7804ea9 100644
> --- a/meta-gnome/recipes-support/ibus/ibus.bb
> +++ b/meta-gnome/recipes-support/ibus/ibus.bb
> @@ -17,10 +17,15 @@ PACKAGECONFIG ??= " \
>      dconf vala \
>      ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>_any('DISTRO_FEATURES', [ 'wayland', 
> 'x11' ], 'gtk3 gtk4', '', d)} \
>      ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd wayland x11', 
> d)} \
> +    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', 'libnotify', 
> '', d)} \
>  "
> 
>  REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'gtk4', 'opengl', '', 
> d)}"
> 
> +do_compile:prepend() {
> +    export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
> +}
> +
>  do_configure:prepend() {
>      # run native unicode-parser
>      sed -i 's:$(builddir)/unicode-parser:unicode-parser:g' 
> ${S}/src/Makefile.am
> diff --git a/meta-gnome/recipes-support/ibus/ibus.inc 
> b/meta-gnome/recipes-support/ibus/ibus.inc
> index 1344cb1981..0e1397e6bb 100644
> --- a/meta-gnome/recipes-support/ibus/ibus.inc
> +++ b/meta-gnome/recipes-support/ibus/ibus.inc
> @@ -5,24 +5,22 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
> 
>  inherit autotools-brokensep pkgconfig gobject-introspection gettext 
> gtk-doc vala
> 
> -PV = "1.5.26"
> +PV = "1.5.34"
> 
> -DEPENDS = "unicode-ucd"
> +DEPENDS = "unicode-ucd libx11-native"
> 
>  SRC_URI = " \
>      git://github.com/ibus/ibus.git;branch=main;protocol=https \
>      
> file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch 
> <file://0001-do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch/> 
> \
> -    file://0001-makefile-don-t-gzip-the-man-pages.patch 
> <file://0001-makefile-don-t-gzip-the-man-pages.patch/> \
> -    
> file://0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch 
> <file://0002-util-imdkit-fix-incompatible-pointer-types-in-transp.patch/> 
> \
> -    file://0001-src-Fix-declaration-errors-with-GCC-15.patch 
> <file://0001-src-fix-declaration-errors-with-gcc-15.patch/> \
>  "
> -SRCREV = "6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3"
> +SRCREV = "1f7af28437afd62a6d145bfc81035e698a37411d"
> 
>  PACKAGECONFIG[appindicator] = 
> "--enable-appindicator,--disable-appindicator,qtbase"
>  PACKAGECONFIG[dconf] = "--enable-dconf,--disable-dconf,dconf"
>  PACKAGECONFIG[gtk2] = "--enable-gtk2,--disable-gtk2,gtk+"
>  PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
>  PACKAGECONFIG[gtk4] = "--enable-gtk4,--disable-gtk4,gtk4"
> +PACKAGECONFIG[libnotify] = 
> "--enable-libnotify,--disable-libnotify,libnotify"
>  PACKAGECONFIG[systemd] = 
> "--enable-systemd-services,--disable-systemd-services,systemd"
>  PACKAGECONFIG[wayland]  = 
> "--enable-wayland,--disable-wayland,wayland"
>  PACKAGECONFIG[vala]  = "--enable-vala,--disable-vala"
> @@ -43,3 +41,7 @@ do_configure:prepend() {
>      # Remove vapigen.m4 bundled with sources so that the one shipped 
> by vala is used instead.
>      rm -f ${S}/m4/vapigen.m4
>  }
> +
> +do_compile:prepend() {
> +    cp ${STAGING_DATADIR_NATIVE}/X11/locale/en_US.UTF-8/Compose 
> ${B}/src/Compose
> +}
> diff --git 
> a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch 
> b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
> index aec9e7abec..64ad6b0857 100644
> --- 
> a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
> +++ 
> b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
> @@ -10,23 +10,30 @@ Upstream-Status: Inappropriate [OE specific]
> 
>  Signed-off-by: Andreas M�ller <schnitzeltony@gmail.com 
> <mailto:schnitzeltony@gmail.com>>
>  ---
> - data/dconf/make-dconf-override-db.sh | 6 ------
> - 1 file changed, 6 deletions(-)
> + data/dconf/make-dconf-override-db.sh | 11 -----------
> + 1 file changed, 11 deletions(-)
> 
> +diff --git a/data/dconf/make-dconf-override-db.sh 
> b/data/dconf/make-dconf-override-db.sh
> +index 32cb153..375baa4 100755
>  --- a/data/dconf/make-dconf-override-db.sh
>  +++ b/data/dconf/make-dconf-override-db.sh
> -@@ -12,10 +12,6 @@ export XDG_CACHE_HOME="$TMPDIR/cache"
> +@@ -12,15 +12,6 @@ export XDG_CACHE_HOME="$TMPDIR/cache"
>   export GSETTINGS_SCHEMA_DIR="$TMPDIR/schemas"
>   mkdir -p $XDG_CONFIG_HOME $XDG_CACHE_HOME $GSETTINGS_SCHEMA_DIR
> 
>  -eval `dbus-launch --sh-syntax`
>  -
> --trap 'rm -rf $TMPDIR; kill $DBUS_SESSION_BUS_PID' ERR
> +-trap cleanup EXIT
> +-
> +-cleanup() {
> +-  test $? -eq 0 && exit
> +-  rm -rf $TMPDIR; kill $DBUS_SESSION_BUS_PID
> +-}
>  -
>   # in case that schema is not installed on the system
>   glib-compile-schemas --targetdir "$GSETTINGS_SCHEMA_DIR" "$PWD"
> 
> -@@ -52,5 +48,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then
> +@@ -57,5 +48,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then
>       umount $TMPDIR/cache/gvfs
>   fi
>   rm -rf $TMPDIR
> diff --git 
> a/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-pages.patch 
> b/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-pages.patch
> deleted file mode 100644
> index 105e34873a..0000000000
> --- 
> a/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-pages.patch
> +++ /dev/null
> @@ -1,164 +0,0 @@
> -From 5307c3b310fabeaa52fafe743c5efaca73ccce46 Mon Sep 17 00:00:00 
> 2001
> -From: Emil Velikov <emil.l.velikov@gmail.com 
> <mailto:emil.l.velikov@gmail.com>>
> -Date: Sun, 11 Jun 2023 16:16:35 +0900
> -Subject: [PATCH] makefile: don't gzip the man pages
> -
> -Drop the gzip step from the manpages - distributions already do that 
> as
> -needed. In addition this resolves the final reproducibility issue 
> with
> -ibus.
> -
> -BUG=<https://github.com/ibus/ibus/pull/2514>
> -
> -Upstream-Status: Backport 
> [<https://github.com/ibus/ibus/commit/1a25975d9f55f18eab609e4d147dd32689e367f3>]
> -Note: This commit is included in version >= 1.5.29 and can be dropped
> -after upgrading.
> -Signed-off-by: Yoann Congal <yoann.congal@smile.fr 
> <mailto:yoann.congal@smile.fr>>
> ----
> - bus/Makefile.am        | 6 +-----
> - data/dconf/Makefile.am | 6 +-----
> - setup/Makefile.am      | 6 +-----
> - tools/Makefile.am      | 6 +-----
> - ui/gtk3/Makefile.am    | 6 +-----
> - 5 files changed, 5 insertions(+), 25 deletions(-)
> -
> -diff --git a/bus/Makefile.am b/bus/Makefile.am
> -index e173ee25..d0445d02 100644
> ---- a/bus/Makefile.am
> -+++ b/bus/Makefile.am
> -@@ -169,7 +169,6 @@ EXTRA_DIST =                \
> -
> - CLEANFILES = \
> - 	$(man_one_DATA)            \
> --	$(man_one_files)        \
> - 	$(NULL)
> -
> - $(libibus):
> -@@ -181,14 +180,11 @@ test: ibus-daemon
> - 		$(builddir)/ibus-daemon -v
> -
> - man_one_in_files = ibus-daemon.1.in
> --man_one_files = $(man_one_in_files:.1.in=.1)
> --man_one_DATA =$(man_one_files:.1=.1.gz)
> -+man_one_DATA = $(man_one_in_files:.1.in=.1)
> - man_onedir = $(mandir)/man1
> - %.1: %.1.in
> - 	$(AM_V_GEN) sed \
> - 		-e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
> - 		mv $@.tmp $@
> --%.1.gz: %.1
> --	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
> -
> - -include $(top_srcdir)/git.mk
> -diff --git a/data/dconf/Makefile.am b/data/dconf/Makefile.am
> -index 5360f033..2352f770 100644
> ---- a/data/dconf/Makefile.am
> -+++ b/data/dconf/Makefile.am
> -@@ -38,15 +38,12 @@ dconfdb_DATA = 00-upstream-settings
> - 		{ rc=$$?; $(RM) -rf $@; exit $$rc; }
> -
> - man_5_in_files = 00-upstream-settings.5.in ibus.5.in
> --man_5_files = $(man_5_in_files:.5.in=.5)
> --man_5_DATA =$(man_5_files:.5=.5.gz)
> -+man_5_DATA = $(man_5_in_files:.5.in=.5)
> - man_5dir = $(mandir)/man5
> - %.5: %.5.in
> - 	$(AM_V_GEN) sed \
> - 	    -e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
> - 	    mv $@.tmp $@
> --%.5.gz: %.5
> --	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
> -
> - install-data-hook:
> - 	if test -z "$(DESTDIR)"; then \
> -@@ -63,7 +60,6 @@ EXTRA_DIST = \
> -
> - CLEANFILES = \
> -     $(man_5_DATA) \
> --    $(man_5_files) \
> -     $(NULL)
> -
> - MAINTAINERCLEANFILES = \
> -diff --git a/setup/Makefile.am b/setup/Makefile.am
> -index 34c8f136..b34aa8fc 100644
> ---- a/setup/Makefile.am
> -+++ b/setup/Makefile.am
> -@@ -56,20 +56,16 @@ org.freedesktop.IBus.Setup.desktop: 
> ibus-setup.desktop
> - 	$(AM_V_GEN) $(MSGFMT) --desktop --template $< -d $(top_srcdir)/po 
> -o $@
> -
> - man_one_in_files = ibus-setup.1.in
> --man_one_files = $(man_one_in_files:.1.in=.1)
> --man_one_DATA =$(man_one_files:.1=.1.gz)
> -+man_one_DATA = $(man_one_in_files:.1.in=.1)
> - man_onedir = $(mandir)/man1
> - %.1: %.1.in
> - 	$(AM_V_GEN) sed \
> - 		-e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
> - 		mv $@.tmp $@
> --%.1.gz: %.1
> --	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
> -
> - CLEANFILES = \
> -     $(desktop_DATA) \
> -     $(man_one_DATA) \
> --    $(man_one_files) \
> -     *.pyc \
> -     ibus-setup \
> -     $(NULL)
> -diff --git a/tools/Makefile.am b/tools/Makefile.am
> -index 5c18d3d6..1c716136 100644
> ---- a/tools/Makefile.am
> -+++ b/tools/Makefile.am
> -@@ -79,15 +79,12 @@ bash_completion_DATA= \
> - bash_completiondir=@datadir@/bash-completion/completions
> -
> - man_one_in_files = ibus.1.in
> --man_one_files = $(man_one_in_files:.1.in=.1)
> --man_one_DATA =$(man_one_files:.1=.1.gz)
> -+man_one_DATA = $(man_one_in_files:.1.in=.1)
> - man_onedir = $(mandir)/man1
> - %.1: %.1.in
> - 	$(AM_V_GEN) sed \
> - 		-e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
> - 		mv $@.tmp $@
> --%.1.gz: %.1
> --	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
> -
> - EXTRA_DIST = \
> - 	$(man_one_in_files) \
> -@@ -96,7 +93,6 @@ EXTRA_DIST = \
> -
> - CLEANFILES = \
> - 	$(man_one_DATA) \
> --	$(man_one_files) \
> - 	$(NULL)
> -
> - if ENABLE_EMOJI_DICT
> -diff --git a/ui/gtk3/Makefile.am b/ui/gtk3/Makefile.am
> -index ab379328..aff035da 100644
> ---- a/ui/gtk3/Makefile.am
> -+++ b/ui/gtk3/Makefile.am
> -@@ -242,15 +242,12 @@ panelbinding.o: $(srcdir)/panelbinding.c
> -
> - MAINTAINERCLEANFILES += extension.c panelbinding.c
> -
> --man_seven_files = $(man_seven_in_files:.7.in=.7)
> --man_seven_DATA =$(man_seven_files:.7=.7.gz)
> -+man_seven_DATA = $(man_seven_in_files:.7.in=.7)
> - man_sevendir = $(mandir)/man7
> - %.7: %.7.in
> - 	$(AM_V_GEN) sed \
> - 	    -e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
> - 	    mv $@.tmp $@
> --%.7.gz: %.7
> --	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
> -
> - desktop_in_files = \
> -     ibus-ui-emojier.desktop.in \
> -@@ -278,7 +275,6 @@ CLEANFILES += \
> -     $(desktop_DATA) \
> -     $(desktop_notrans_files) \
> -     $(man_seven_DATA) \
> --    $(man_seven_files) \
> -     $(NULL)
> -
> - endif
> diff --git 
> a/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-with-GCC-15.patch 
> b/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-with-GCC-15.patch
> deleted file mode 100644
> index 150ff631ba..0000000000
> --- 
> a/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-with-GCC-15.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 0f5407f8a3846477fcaa73505437e805467901e1 Mon Sep 17 00:00:00 
> 2001
> -From: fujiwarat <takao.fujiwara1@gmail.com 
> <mailto:takao.fujiwara1@gmail.com>>
> -Date: Fri, 24 Jan 2025 09:40:31 +0900
> -Subject: [PATCH] src: Fix declaration errors with GCC 15
> -
> -
> -BUG=rhbz#2340629
> -
> -Upstream-Status: Backport 
> [<https://github.com/ibus/ibus/commit/aac5446e8c98db934912b9b15a1ef92c3b7e4c8c>]
> -Signed-off-by: Yoann Congal <yoann.congal@smile.fr 
> <mailto:yoann.congal@smile.fr>>
> ----
> - src/ibusenginesimple.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/ibusenginesimple.c b/src/ibusenginesimple.c
> -index c57a3ea5..60e7fb34 100644
> ---- a/src/ibusenginesimple.c
> -+++ b/src/ibusenginesimple.c
> -@@ -477,7 +477,7 @@ check_hex (IBusEngineSimple *simple,
> - }
> -
> - static IBusEngineDict *
> --load_emoji_dict ()
> -+load_emoji_dict (void)
> - {
> -     IBusEngineDict *emoji_dict;
> -     GList *keys;
> -@@ -520,7 +520,7 @@ check_emoji_table (IBusEngineSimple       
> *simple,
> -         g_object_ref_sink (priv->lookup_table);
> -     }
> -     if (emoji_dict == NULL)
> --        emoji_dict = priv->emoji_dict = load_emoji_dict (simple);
> -+        emoji_dict = priv->emoji_dict = load_emoji_dict ();
> -
> -     if (emoji_dict == NULL || emoji_dict->dict == NULL)
> -         return FALSE;
> diff --git 
> a/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch 
> b/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch
> deleted file mode 100644
> index 229a9d34aa..0000000000
> --- 
> a/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch
> +++ /dev/null
> @@ -1,109 +0,0 @@
> -From b0a554d7c9d4d52bd34a85fe66a85adf9542a2ec Mon Sep 17 00:00:00 
> 2001
> -From: fujiwarat <takao.fujiwara1@gmail.com 
> <mailto:takao.fujiwara1@gmail.com>>
> -Date: Fri, 24 Jan 2025 10:01:11 +0900
> -Subject: [PATCH] util/IMdkit: Fix incompatible-pointer-types in
> - TransportSW.checkAddr
> -
> -
> -BUG=rhbz#2340629
> -
> -Upstream-Status: Backport 
> [<https://github.com/ibus/ibus/commit/d039b95b1af14fd34167a4ca038938cef2ea41ca>]
> -Signed-off-by: Yoann Congal <yoann.congal@smile.fr 
> <mailto:yoann.congal@smile.fr>>
> ----
> - util/IMdkit/Xi18n.h           | 18 ++++++++++--------
> - util/IMdkit/i18nMethod.c      |  3 ++-
> - util/IMdkit/i18nOffsetCache.c | 10 ++++++----
> - 3 files changed, 18 insertions(+), 13 deletions(-)
> -
> -diff --git a/util/IMdkit/Xi18n.h b/util/IMdkit/Xi18n.h
> -index 79dd9619..09097bb6 100644
> ---- a/util/IMdkit/Xi18n.h
> -+++ b/util/IMdkit/Xi18n.h
> -@@ -3,7 +3,7 @@
> -          Copyright (C) 1994-1995 Sun Microsystems, Inc.
> -          Copyright (C) 1993-1994 Hewlett-Packard Company
> -          Copyright (C) 2014 Peng Huang <shawn.p.huang@gmail.com 
> <mailto:shawn.p.huang@gmail.com>>
> --         Copyright (C) 2014 Red Hat, Inc.
> -+         Copyright (C) 2014-2025 Red Hat, Inc.
> -
> - Permission to use, copy, modify, distribute, and sell this software
> - and its documentation for any purpose is hereby granted without fee,
> -@@ -71,13 +71,6 @@ IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS 
> SOFTWARE.
> - #define I18N_SET	1
> - #define I18N_GET	2
> -
> --typedef struct
> --{
> --    char        *transportname;
> --    int         namelen;
> --    Bool        (*checkAddr) ();
> --} TransportSW;
> --
> - typedef struct _XIMPending
> - {
> -     unsigned    char *p;
> -@@ -172,6 +165,15 @@ typedef struct _Xi18nClient
> -
> - typedef struct _Xi18nCore *Xi18n;
> -
> -+typedef struct _TransportSW TransportSW;
> -+
> -+struct _TransportSW
> -+{
> -+    char        *transportname;
> -+    int         namelen;
> -+    Bool        (*checkAddr) (Xi18n, TransportSW *, char *);
> -+};
> -+
> - /*
> -  * Callback Struct for XIM Protocol
> -  */
> -diff --git a/util/IMdkit/i18nMethod.c b/util/IMdkit/i18nMethod.c
> -index 9c44e7fe..7f343d87 100644
> ---- a/util/IMdkit/i18nMethod.c
> -+++ b/util/IMdkit/i18nMethod.c
> -@@ -2,6 +2,7 @@
> -
> -          Copyright 1994, 1995 by Sun Microsystems, Inc.
> -          Copyright 1993, 1994 by Hewlett-Packard Company
> -+         Copyright (C) 2014-2025 Red Hat, Inc.
> -
> - Permission to use, copy, modify, distribute, and sell this software
> - and its documentation for any purpose is hereby granted without fee,
> -@@ -89,7 +90,7 @@ TransportSW _TransR[] =
> - #ifdef DNETCONN
> -     {"decnet",          6, _Xi18nCheckTransAddress},
> - #endif
> --    {(char *) NULL,     0, (Bool (*) ()) NULL}
> -+    {(char *) NULL,     0, (Bool (*) (Xi18n, TransportSW *, char 
> *))NULL}
> - };
> -
> - static Bool GetInputStyles (Xi18n i18n_core, XIMStyles **p_style)
> -diff --git a/util/IMdkit/i18nOffsetCache.c 
> b/util/IMdkit/i18nOffsetCache.c
> -index e2fe8c6b..cab974c7 100644
> ---- a/util/IMdkit/i18nOffsetCache.c
> -+++ b/util/IMdkit/i18nOffsetCache.c
> -@@ -1,6 +1,6 @@
> - /*
> -  * Copyright (C) 2014 Peng Huang <shawn.p.huang@gmail.com 
> <mailto:shawn.p.huang@gmail.com>>
> -- * Copyright (C) 2014 Red Hat, Inc.
> -+ * Copyright (C) 2014-2025 Red Hat, Inc.
> -  *
> -  * Permission to use, copy, modify, distribute, and sell this
> -  * software and its documentation for any purpose is hereby granted
> -@@ -83,10 +83,12 @@ void _Xi18nSetPropertyOffset (Xi18nOffsetCache 
> *offset_cache, Atom key,
> -     }
> -
> -     if (++offset_cache->size > offset_cache->capacity) {
> --        offset_cache->capacity *= OFFSET_CACHE_GROWTH_FACTOR;
> --        offset_cache->data = (Xi18nAtomOffsetPair *) realloc (data,
> -+        Xi18nAtomOffsetPair *pair = (Xi18nAtomOffsetPair *) realloc 
> (data,
> -                 offset_cache->capacity * sizeof 
> (Xi18nAtomOffsetPair));
> --        if (offset_cache->data == NULL) {
> -+        offset_cache->capacity *= OFFSET_CACHE_GROWTH_FACTOR;
> -+        if (pair) {
> -+            offset_cache->data = pair;
> -+        } else {
> -             offset_cache->data = data;
> -             --offset_cache->size;
> -         }
> --
> 2.55.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130289): 
> <https://lists.openembedded.org/g/openembedded-devel/message/130289>
> Mute This Topic: <https://lists.openembedded.org/mt/121422699/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-t1yh+k1hVZ/seu8I4Pbg
Content-Type: text/html; charset=iso-8859-1

<div id="convey-body" dir="auto"><div>This update requires a patch for libx11 in oe-core</div></div><div id="convey-quote" dir="auto"><br>On Fri, Sep 25 2026 at 08:44:35 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Drop the three backports, which are part of the release, and rebase the
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
Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-support/ibus/ibus-native.bb       |   1 +
 meta-gnome/recipes-support/ibus/ibus.bb       |   5 +
 meta-gnome/recipes-support/ibus/ibus.inc      |  14 +-
 ...start-dbus-we-do-not-have-dbus-lauch.patch |  17 +-
 ...01-makefile-don-t-gzip-the-man-pages.patch | 164 ------------------
 ...c-Fix-declaration-errors-with-GCC-15.patch |  36 ----
 ...incompatible-pointer-types-in-Transp.patch | 109 ------------
 7 files changed, 26 insertions(+), 320 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-pages.patch
 delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-with-GCC-15.patch
 delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch

diff --git a/meta-gnome/recipes-support/ibus/ibus-native.bb b/meta-gnome/recipes-support/ibus/ibus-native.bb
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
diff --git a/meta-gnome/recipes-support/ibus/ibus.bb b/meta-gnome/recipes-support/ibus/ibus.bb
index 479498d82f..08a7804ea9 100644
--- a/meta-gnome/recipes-support/ibus/ibus.bb
+++ b/meta-gnome/recipes-support/ibus/ibus.bb
@@ -17,10 +17,15 @@ PACKAGECONFIG ??= " \
     dconf vala \
     <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>_any('DISTRO_FEATURES', [ 'wayland', 'x11' ], 'gtk3 gtk4', '', d)} \
     <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd wayland x11', d)} \
+    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', 'libnotify', '', d)} \
 "
 
 REQUIRED_DISTRO_FEATURES = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'gtk4', 'opengl', '', d)}"
 
+do_compile:prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
+}
+
 do_configure:prepend() {
     # run native unicode-parser
     sed -i 's:$(builddir)/unicode-parser:unicode-parser:g' ${S}/src/Makefile.am
diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
index 1344cb1981..0e1397e6bb 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -5,24 +5,22 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 inherit autotools-brokensep pkgconfig gobject-introspection gettext gtk-doc vala
 
-PV = "1.5.26"
+PV = "1.5.34"
 
-DEPENDS = "unicode-ucd"
+DEPENDS = "unicode-ucd libx11-native"
 
 SRC_URI = " \
     git://github.com/ibus/ibus.git;branch=main;protocol=https \
     <a href="file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch">file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch</a> \
-    <a href="file://0001-makefile-don-t-gzip-the-man-pages.patch">file://0001-makefile-don-t-gzip-the-man-pages.patch</a> \
-    <a href="file://0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch">file://0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch</a> \
-    <a href="file://0001-src-Fix-declaration-errors-with-GCC-15.patch">file://0001-src-Fix-declaration-errors-with-GCC-15.patch</a> \
 "
-SRCREV = "6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3"
+SRCREV = "1f7af28437afd62a6d145bfc81035e698a37411d"
 
 PACKAGECONFIG[appindicator] = "--enable-appindicator,--disable-appindicator,qtbase"
 PACKAGECONFIG[dconf] = "--enable-dconf,--disable-dconf,dconf"
 PACKAGECONFIG[gtk2] = "--enable-gtk2,--disable-gtk2,gtk+"
 PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
 PACKAGECONFIG[gtk4] = "--enable-gtk4,--disable-gtk4,gtk4"
+PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
 PACKAGECONFIG[systemd] = "--enable-systemd-services,--disable-systemd-services,systemd"
 PACKAGECONFIG[wayland]  = "--enable-wayland,--disable-wayland,wayland"
 PACKAGECONFIG[vala]  = "--enable-vala,--disable-vala"
@@ -43,3 +41,7 @@ do_configure:prepend() {
     # Remove vapigen.m4 bundled with sources so that the one shipped by vala is used instead.
     rm -f ${S}/m4/vapigen.m4
 }
+
+do_compile:prepend() {
+    cp ${STAGING_DATADIR_NATIVE}/X11/locale/en_US.UTF-8/Compose ${B}/src/Compose
+}
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
index aec9e7abec..64ad6b0857 100644
--- a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
+++ b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
@@ -10,23 +10,30 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andreas M�ller &lt;<a href="mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt;
 ---
- data/dconf/make-dconf-override-db.sh | 6 ------
- 1 file changed, 6 deletions(-)
+ data/dconf/make-dconf-override-db.sh | 11 -----------
+ 1 file changed, 11 deletions(-)
 
+diff --git a/data/dconf/make-dconf-override-db.sh b/data/dconf/make-dconf-override-db.sh
+index 32cb153..375baa4 100755
 --- a/data/dconf/make-dconf-override-db.sh
 +++ b/data/dconf/make-dconf-override-db.sh
-@@ -12,10 +12,6 @@ export XDG_CACHE_HOME="$TMPDIR/cache"
+@@ -12,15 +12,6 @@ export XDG_CACHE_HOME="$TMPDIR/cache"
  export GSETTINGS_SCHEMA_DIR="$TMPDIR/schemas"
  mkdir -p $XDG_CONFIG_HOME $XDG_CACHE_HOME $GSETTINGS_SCHEMA_DIR
  
 -eval `dbus-launch --sh-syntax`
 -
--trap 'rm -rf $TMPDIR; kill $DBUS_SESSION_BUS_PID' ERR
+-trap cleanup EXIT
+-
+-cleanup() {
+-  test $? -eq 0 &amp;&amp; exit
+-  rm -rf $TMPDIR; kill $DBUS_SESSION_BUS_PID
+-}
 -
  # in case that schema is not installed on the system
  glib-compile-schemas --targetdir "$GSETTINGS_SCHEMA_DIR" "$PWD"
  
-@@ -52,5 +48,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then
+@@ -57,5 +48,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then
      umount $TMPDIR/cache/gvfs
  fi
  rm -rf $TMPDIR
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-pages.patch b/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-pages.patch
deleted file mode 100644
index 105e34873a..0000000000
--- a/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-pages.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 5307c3b310fabeaa52fafe743c5efaca73ccce46 Mon Sep 17 00:00:00 2001
-From: Emil Velikov &lt;<a href="mailto:emil.l.velikov@gmail.com">emil.l.velikov@gmail.com</a>&gt;
-Date: Sun, 11 Jun 2023 16:16:35 +0900
-Subject: [PATCH] makefile: don't gzip the man pages
-
-Drop the gzip step from the manpages - distributions already do that as
-needed. In addition this resolves the final reproducibility issue with
-ibus.
-
-BUG=<a href="https://github.com/ibus/ibus/pull/2514">https://github.com/ibus/ibus/pull/2514</a>
-
-Upstream-Status: Backport [<a href="https://github.com/ibus/ibus/commit/1a25975d9f55f18eab609e4d147dd32689e367f3">https://github.com/ibus/ibus/commit/1a25975d9f55f18eab609e4d147dd32689e367f3</a>]
-Note: This commit is included in version &gt;= 1.5.29 and can be dropped
-after upgrading.
-Signed-off-by: Yoann Congal &lt;<a href="mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt;
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
-@@ -169,7 +169,6 @@ EXTRA_DIST =                \
- 
- CLEANFILES = \
- 	$(man_one_DATA)            \
--	$(man_one_files)        \
- 	$(NULL)
- 
- $(libibus):
-@@ -181,14 +180,11 @@ test: ibus-daemon
- 		$(builddir)/ibus-daemon -v
- 
- man_one_in_files = ibus-daemon.1.in
--man_one_files = $(man_one_in_files:.1.in=.1)
--man_one_DATA =$(man_one_files:.1=.1.gz) 
-+man_one_DATA = $(man_one_in_files:.1.in=.1)
- man_onedir = $(mandir)/man1
- %.1: %.1.in
- 	$(AM_V_GEN) sed \
- 		-e 's|@VERSION[@]|$(VERSION)|g' $&lt; &gt; $@.tmp &amp;&amp; \
- 		mv $@.tmp $@
--%.1.gz: %.1
--	$(AM_V_GEN) gzip -c $&lt; &gt; $@.tmp &amp;&amp; mv $@.tmp $@
- 
- -include $(top_srcdir)/git.mk
-diff --git a/data/dconf/Makefile.am b/data/dconf/Makefile.am
-index 5360f033..2352f770 100644
---- a/data/dconf/Makefile.am
-+++ b/data/dconf/Makefile.am
-@@ -38,15 +38,12 @@ dconfdb_DATA = 00-upstream-settings
- 		{ rc=$$?; $(RM) -rf $@; exit $$rc; }
- 
- man_5_in_files = 00-upstream-settings.5.in ibus.5.in
--man_5_files = $(man_5_in_files:.5.in=.5)
--man_5_DATA =$(man_5_files:.5=.5.gz)
-+man_5_DATA = $(man_5_in_files:.5.in=.5)
- man_5dir = $(mandir)/man5
- %.5: %.5.in
- 	$(AM_V_GEN) sed \
- 	    -e 's|@VERSION[@]|$(VERSION)|g' $&lt; &gt; $@.tmp &amp;&amp; \
- 	    mv $@.tmp $@
--%.5.gz: %.5
--	$(AM_V_GEN) gzip -c $&lt; &gt; $@.tmp &amp;&amp; mv $@.tmp $@
- 
- install-data-hook:
- 	if test -z "$(DESTDIR)"; then \
-@@ -63,7 +60,6 @@ EXTRA_DIST = \
- 
- CLEANFILES = \
-     $(man_5_DATA) \
--    $(man_5_files) \
-     $(NULL)
- 
- MAINTAINERCLEANFILES = \
-diff --git a/setup/Makefile.am b/setup/Makefile.am
-index 34c8f136..b34aa8fc 100644
---- a/setup/Makefile.am
-+++ b/setup/Makefile.am
-@@ -56,20 +56,16 @@ org.freedesktop.IBus.Setup.desktop: ibus-setup.desktop
- 	$(AM_V_GEN) $(MSGFMT) --desktop --template $&lt; -d $(top_srcdir)/po -o $@
- 
- man_one_in_files = ibus-setup.1.in
--man_one_files = $(man_one_in_files:.1.in=.1)
--man_one_DATA =$(man_one_files:.1=.1.gz) 
-+man_one_DATA = $(man_one_in_files:.1.in=.1)
- man_onedir = $(mandir)/man1
- %.1: %.1.in
- 	$(AM_V_GEN) sed \
- 		-e 's|@VERSION[@]|$(VERSION)|g' $&lt; &gt; $@.tmp &amp;&amp; \
- 		mv $@.tmp $@
--%.1.gz: %.1
--	$(AM_V_GEN) gzip -c $&lt; &gt; $@.tmp &amp;&amp; mv $@.tmp $@
- 
- CLEANFILES = \
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
-@@ -79,15 +79,12 @@ bash_completion_DATA= \
- bash_completiondir=@datadir@/bash-completion/completions
- 
- man_one_in_files = ibus.1.in
--man_one_files = $(man_one_in_files:.1.in=.1)
--man_one_DATA =$(man_one_files:.1=.1.gz) 
-+man_one_DATA = $(man_one_in_files:.1.in=.1)
- man_onedir = $(mandir)/man1
- %.1: %.1.in
- 	$(AM_V_GEN) sed \
- 		-e 's|@VERSION[@]|$(VERSION)|g' $&lt; &gt; $@.tmp &amp;&amp; \
- 		mv $@.tmp $@
--%.1.gz: %.1
--	$(AM_V_GEN) gzip -c $&lt; &gt; $@.tmp &amp;&amp; mv $@.tmp $@
- 
- EXTRA_DIST = \
- 	$(man_one_in_files) \
-@@ -96,7 +93,6 @@ EXTRA_DIST = \
- 
- CLEANFILES = \
- 	$(man_one_DATA) \
--	$(man_one_files) \
- 	$(NULL)
- 
- if ENABLE_EMOJI_DICT
-diff --git a/ui/gtk3/Makefile.am b/ui/gtk3/Makefile.am
-index ab379328..aff035da 100644
---- a/ui/gtk3/Makefile.am
-+++ b/ui/gtk3/Makefile.am
-@@ -242,15 +242,12 @@ panelbinding.o: $(srcdir)/panelbinding.c
- 
- MAINTAINERCLEANFILES += extension.c panelbinding.c
- 
--man_seven_files = $(man_seven_in_files:.7.in=.7)
--man_seven_DATA =$(man_seven_files:.7=.7.gz)
-+man_seven_DATA = $(man_seven_in_files:.7.in=.7)
- man_sevendir = $(mandir)/man7
- %.7: %.7.in
- 	$(AM_V_GEN) sed \
- 	    -e 's|@VERSION[@]|$(VERSION)|g' $&lt; &gt; $@.tmp &amp;&amp; \
- 	    mv $@.tmp $@
--%.7.gz: %.7
--	$(AM_V_GEN) gzip -c $&lt; &gt; $@.tmp &amp;&amp; mv $@.tmp $@
- 
- desktop_in_files = \
-     ibus-ui-emojier.desktop.in \
-@@ -278,7 +275,6 @@ CLEANFILES += \
-     $(desktop_DATA) \
-     $(desktop_notrans_files) \
-     $(man_seven_DATA) \
--    $(man_seven_files) \
-     $(NULL)
- 
- endif
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-with-GCC-15.patch b/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-with-GCC-15.patch
deleted file mode 100644
index 150ff631ba..0000000000
--- a/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-with-GCC-15.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0f5407f8a3846477fcaa73505437e805467901e1 Mon Sep 17 00:00:00 2001
-From: fujiwarat &lt;<a href="mailto:takao.fujiwara1@gmail.com">takao.fujiwara1@gmail.com</a>&gt;
-Date: Fri, 24 Jan 2025 09:40:31 +0900
-Subject: [PATCH] src: Fix declaration errors with GCC 15
-
-
-BUG=rhbz#2340629
-
-Upstream-Status: Backport [<a href="https://github.com/ibus/ibus/commit/aac5446e8c98db934912b9b15a1ef92c3b7e4c8c">https://github.com/ibus/ibus/commit/aac5446e8c98db934912b9b15a1ef92c3b7e4c8c</a>]
-Signed-off-by: Yoann Congal &lt;<a href="mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt;
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
- 
- static IBusEngineDict *
--load_emoji_dict ()
-+load_emoji_dict (void)
- {
-     IBusEngineDict *emoji_dict;
-     GList *keys;
-@@ -520,7 +520,7 @@ check_emoji_table (IBusEngineSimple       *simple,
-         g_object_ref_sink (priv-&gt;lookup_table);
-     }
-     if (emoji_dict == NULL)
--        emoji_dict = priv-&gt;emoji_dict = load_emoji_dict (simple);
-+        emoji_dict = priv-&gt;emoji_dict = load_emoji_dict ();
- 
-     if (emoji_dict == NULL || emoji_dict-&gt;dict == NULL)
-         return FALSE;
diff --git a/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch b/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch
deleted file mode 100644
index 229a9d34aa..0000000000
--- a/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From b0a554d7c9d4d52bd34a85fe66a85adf9542a2ec Mon Sep 17 00:00:00 2001
-From: fujiwarat &lt;<a href="mailto:takao.fujiwara1@gmail.com">takao.fujiwara1@gmail.com</a>&gt;
-Date: Fri, 24 Jan 2025 10:01:11 +0900
-Subject: [PATCH] util/IMdkit: Fix incompatible-pointer-types in
- TransportSW.checkAddr
-
-
-BUG=rhbz#2340629
-
-Upstream-Status: Backport [<a href="https://github.com/ibus/ibus/commit/d039b95b1af14fd34167a4ca038938cef2ea41ca">https://github.com/ibus/ibus/commit/d039b95b1af14fd34167a4ca038938cef2ea41ca</a>]
-Signed-off-by: Yoann Congal &lt;<a href="mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt;
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
-          Copyright (C) 2014 Peng Huang &lt;<a href="mailto:shawn.p.huang@gmail.com">shawn.p.huang@gmail.com</a>&gt;
--         Copyright (C) 2014 Red Hat, Inc.
-+         Copyright (C) 2014-2025 Red Hat, Inc.
-  
- Permission to use, copy, modify, distribute, and sell this software
- and its documentation for any purpose is hereby granted without fee,
-@@ -71,13 +71,6 @@ IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
- #define I18N_SET	1
- #define I18N_GET	2
- 
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
- 
- typedef struct _Xi18nCore *Xi18n;
- 
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
-  
-          Copyright 1994, 1995 by Sun Microsystems, Inc.
-          Copyright 1993, 1994 by Hewlett-Packard Company
-+         Copyright (C) 2014-2025 Red Hat, Inc.
-  
- Permission to use, copy, modify, distribute, and sell this software
- and its documentation for any purpose is hereby granted without fee,
-@@ -89,7 +90,7 @@ TransportSW _TransR[] =
- #ifdef DNETCONN
-     {"decnet",          6, _Xi18nCheckTransAddress},
- #endif
--    {(char *) NULL,     0, (Bool (*) ()) NULL}
-+    {(char *) NULL,     0, (Bool (*) (Xi18n, TransportSW *, char *))NULL}
- };
- 
- static Bool GetInputStyles (Xi18n i18n_core, XIMStyles **p_style)
-diff --git a/util/IMdkit/i18nOffsetCache.c b/util/IMdkit/i18nOffsetCache.c
-index e2fe8c6b..cab974c7 100644
---- a/util/IMdkit/i18nOffsetCache.c
-+++ b/util/IMdkit/i18nOffsetCache.c
-@@ -1,6 +1,6 @@
- /*
-  * Copyright (C) 2014 Peng Huang &lt;<a href="mailto:shawn.p.huang@gmail.com">shawn.p.huang@gmail.com</a>&gt;
-- * Copyright (C) 2014 Red Hat, Inc.
-+ * Copyright (C) 2014-2025 Red Hat, Inc.
-  *
-  * Permission to use, copy, modify, distribute, and sell this
-  * software and its documentation for any purpose is hereby granted
-@@ -83,10 +83,12 @@ void _Xi18nSetPropertyOffset (Xi18nOffsetCache *offset_cache, Atom key,
-     }
- 
-     if (++offset_cache-&gt;size &gt; offset_cache-&gt;capacity) {
--        offset_cache-&gt;capacity *= OFFSET_CACHE_GROWTH_FACTOR;
--        offset_cache-&gt;data = (Xi18nAtomOffsetPair *) realloc (data,
-+        Xi18nAtomOffsetPair *pair = (Xi18nAtomOffsetPair *) realloc (data,
-                 offset_cache-&gt;capacity * sizeof (Xi18nAtomOffsetPair));
--        if (offset_cache-&gt;data == NULL) {
-+        offset_cache-&gt;capacity *= OFFSET_CACHE_GROWTH_FACTOR;
-+        if (pair) {
-+            offset_cache-&gt;data = pair;
-+        } else {
-             offset_cache-&gt;data = data;
-             --offset_cache-&gt;size;
-         }
<div>-- 
</div>2.55.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#130289): <a href="https://lists.openembedded.org/g/openembedded-devel/message/130289">https://lists.openembedded.org/g/openembedded-devel/message/130289</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/121422699/3618223">https://lists.openembedded.org/mt/121422699/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-t1yh+k1hVZ/seu8I4Pbg--


