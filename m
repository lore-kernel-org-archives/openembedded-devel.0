Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9FCC9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 08:29:18 +0000 (UTC)
Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3595.1790324955193131640
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 01:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kme2U8G8;
 spf=pass (domain: gmail.com, ip: 74.125.231.165, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-8137b129131so366232a34.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 01:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790324954; cv=none;
        d=google.com; s=arc-20260327;
        b=eXRbaVgsRu8VJY/C9mzqZLlLEmezQcjFFPJYMJP7FlePH9iXZ3OFfMzOstZOjov+OE
         23ekw6CV7e2Jj++85a0bCnwT8a3pbiOevYb2Bi63wLlfV+u4C/Am6HkO/lXrLVIiEUUQ
         pTELFWcO4Lse8Ywc6+31+5oiYEWQ93+iAJbAlCj16eH5Sfqh+C3povjxZigSVgrQkt0I
         NKXSivq2LwVyfAR9asFdrOG2ug1rM3hOAMnX96Acqxv3BgGE8v2KbtmJWOVant/CDYSt
         nxSAE4QZv60sa3k6Ce27WurJl+6+V50S7d3QV8373mfAR8H8edJ7TbM0Jv66IbD3isG6
         VC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Olef12FNCixTe0b5oB/WLYL6M8+Tg6oc4vJFZk7d9G0=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=gpfP14AA2bgn0jypv40BbHKw25/Y1lBkV8M5qPU0fIM43YmOXYVURI0396RQzOWWb8
         p6NafRreODOxox89jj1cUCCqcwQLUTy1XxdV0Q5EzyLnSn6QpKKkR+RW8SRYpSpGR6Ym
         WWbqKtLYS4gDouBDH4EH7RsZDbdsnAtpjayUjQvqvWPxzDTO9WIQqCDgNEJQSR0ZYzx4
         NnMrE3Eqy2ZmwKROJiUHjaB2Mp49shcwa01ne5tfVurLeFj5i34JCmz21s6YBK7sLsYR
         uQJ1GqkHwaQBCq6eYP2YxJG1oJ0ELnR4lzT2MtZ1Tw5C2uCj1Q2L2wj1mGMl5Z2M1rfm
         IkFw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790324954; x=1790929754; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Olef12FNCixTe0b5oB/WLYL6M8+Tg6oc4vJFZk7d9G0=;
        b=kme2U8G8BAEFt+vxI4KBLf7+EMM4LCUOtwadZHmfiYtmuWLALs26H1V+C0r/Kkp1AK
         eySvF/F6bn/Putllw0ALpbpd2a/qCB50v0GyuppC7kyiMM2mjxDhix95IzIuybpoT2oy
         32tYB1AxQ+OYXKiUfwcJq4M9p7aoJw8dPJ7oYBH+/lmcn31Jc1qGPZ0VoxIMq44Qbbd4
         Z824YGRP60uimVNWct4muQJzMEAiXx5mIAkjnb90tYVop7ZUfDC86lgMrV+xvj9W0QLm
         F/GrRAW4+sccQ1S/HS7ONEMPekFCC/W8yycxtyMQNGDW4SVTO/Yfmke1AA5/Dz+uPQkb
         JqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324954; x=1790929754;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Olef12FNCixTe0b5oB/WLYL6M8+Tg6oc4vJFZk7d9G0=;
        b=Ug6VCCOC9h9FMeXhOHu6jJdBLc59kPT0X6CKWDjdRiAlf+So09TuLft3fKRa6M0EQ3
         jnyIFDcqb7ofwVlag4K9mh58/hxxS5HnTj5/liBOG5XM4ib7YCsGRLsN2tYM81eo693J
         YFJI5Alij1/jkHXaqJYxmhoCqPTcVSGGhiiJy/iyEJEHnAe8UZw4WIAj54flF2W3PjHP
         Ps9ltaCYvZK1Rq1IBxhAqBJeaeBo/UyKWQqIjZw7eLYiAVPTepq2YBWpSUsBsMPf+bG2
         OLwChJ5UerGX8Y517RgH1w5+PacI+6r33KUl+UIYNGdbXpGXqX975GFGGZFtZRLQhtUr
         S1hg==
X-Gm-Message-State: AFuF++mCp+7Ejs49uwTJrcwVwm9RCPCiB+CUmGQyQoszXqNVU96xXs1j
	vkOv7KFAu3lz49ugFMD3WCNA/NPRMEEsxKHpoMgwf1AmsWrrdtReIie3R6ciAnusOp+HReu0LEe
	Q5h4W933k18pH0bCm8eo0Eez4OIUKTqw=
X-Gm-Gg: AYBFou2syjFs/0JgQjLHVYtXvN0jSUQpm0cjwMVdJFlVOh0zFE3lJ8Pz7xn6B0wARpP
	01FSsawenMaUhUrhfHXjOfhbE2ZZizs7zO9Pd5OJ/9vc77Fi812hP3eI6ElDTIRDIFL3IBdL3HY
	E0i0U6/+seE9PTKqJ3wi7A4XLKrZgN2DKLkKieARhjGZakNVPNrY//hYEwApmmvm54ihqdCu8SU
	4TRXbPyO9Dfd5YtGvyurN4AAhqKAB+QnDDVBLV/1cifnybONLQuahz6ln+IpprTb4zHYCSIQX7o
	5F89M8FcotmrteWrrg5IZ/iCw1qw2eH9vUrImX3zpXv5BYNaNA6pG3wjCe52PWA3ZTTq/4WJ8vA
	Wq/pa
X-Received: by 2002:a05:6820:2216:b0:6b1:6c11:686a with SMTP id
 006d021491bc7-6d43f98fd33mr5300196eaf.29.1790324954059; Fri, 25 Sep 2026
 01:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260925064440.1870690-1-f_l_k@t-online.de>
In-Reply-To: <20260925064440.1870690-1-f_l_k@t-online.de>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 25 Sep 2026 20:29:02 +1200
X-Gm-Features: AclHuK9eJJG_kR3Z0K4sLJiz5ZHSdkJi718ajZ2RwYfP8Jjyw1KstebLCkIm6Lc
Message-ID: <CADySD0FaNVdeSP-u=kMViJfTFmCBCX3-rr+Fxz1Jz8ZnWDA4=Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ibus: upgrade 1.5.26 -> 1.5.34
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 08:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130292

On Fri, Sep 25, 2026 at 6:45=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Drop the three backports, which are part of the release, and rebase the
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
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-support/ibus/ibus-native.bb       |   1 +
>  meta-gnome/recipes-support/ibus/ibus.bb       |   5 +
>  meta-gnome/recipes-support/ibus/ibus.inc      |  14 +-
>  ...start-dbus-we-do-not-have-dbus-lauch.patch |  17 +-
>  ...01-makefile-don-t-gzip-the-man-pages.patch | 164 ------------------
>  ...c-Fix-declaration-errors-with-GCC-15.patch |  36 ----
>  ...incompatible-pointer-types-in-Transp.patch | 109 ------------
>  7 files changed, 26 insertions(+), 320 deletions(-)
>  delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-makefile-do=
n-t-gzip-the-man-pages.patch
>  delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-dec=
laration-errors-with-GCC-15.patch
>  delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit=
-Fix-incompatible-pointer-types-in-Transp.patch
>
> diff --git a/meta-gnome/recipes-support/ibus/ibus-native.bb b/meta-gnome/=
recipes-support/ibus/ibus-native.bb
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
> diff --git a/meta-gnome/recipes-support/ibus/ibus.bb b/meta-gnome/recipes=
-support/ibus/ibus.bb
> index 479498d82f..08a7804ea9 100644
> --- a/meta-gnome/recipes-support/ibus/ibus.bb
> +++ b/meta-gnome/recipes-support/ibus/ibus.bb
> @@ -17,10 +17,15 @@ PACKAGECONFIG ??=3D " \
>      dconf vala \
>      ${@bb.utils.contains_any('DISTRO_FEATURES', [ 'wayland', 'x11' ], 'g=
tk3 gtk4', '', d)} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libnotify', '', d)} =
\
>  "
>
>  REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'gtk=
4', 'opengl', '', d)}"
>
> +do_compile:prepend() {
> +    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
> +}
> +
>  do_configure:prepend() {
>      # run native unicode-parser
>      sed -i 's:$(builddir)/unicode-parser:unicode-parser:g' ${S}/src/Make=
file.am
> diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipe=
s-support/ibus/ibus.inc
> index 1344cb1981..0e1397e6bb 100644
> --- a/meta-gnome/recipes-support/ibus/ibus.inc
> +++ b/meta-gnome/recipes-support/ibus/ibus.inc
> @@ -5,24 +5,22 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857=
fcd118f065f900982c24"
>
>  inherit autotools-brokensep pkgconfig gobject-introspection gettext gtk-=
doc vala
>
> -PV =3D "1.5.26"
> +PV =3D "1.5.34"
>
> -DEPENDS =3D "unicode-ucd"
> +DEPENDS =3D "unicode-ucd libx11-native"
>
>  SRC_URI =3D " \
>      git://github.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps \

can please also include tag=3D${PV} in the SRC_URI

>      file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch=
 \
> -    file://0001-makefile-don-t-gzip-the-man-pages.patch \
> -    file://0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.pat=
ch \
> -    file://0001-src-Fix-declaration-errors-with-GCC-15.patch \
>  "
> -SRCREV =3D "6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3"
> +SRCREV =3D "1f7af28437afd62a6d145bfc81035e698a37411d"
>
>  PACKAGECONFIG[appindicator] =3D "--enable-appindicator,--disable-appindi=
cator,qtbase"
>  PACKAGECONFIG[dconf] =3D "--enable-dconf,--disable-dconf,dconf"
>  PACKAGECONFIG[gtk2] =3D "--enable-gtk2,--disable-gtk2,gtk+"
>  PACKAGECONFIG[gtk3] =3D "--enable-gtk3,--disable-gtk3,gtk+3"
>  PACKAGECONFIG[gtk4] =3D "--enable-gtk4,--disable-gtk4,gtk4"
> +PACKAGECONFIG[libnotify] =3D "--enable-libnotify,--disable-libnotify,lib=
notify"
>  PACKAGECONFIG[systemd] =3D "--enable-systemd-services,--disable-systemd-=
services,systemd"
>  PACKAGECONFIG[wayland]  =3D "--enable-wayland,--disable-wayland,wayland"
>  PACKAGECONFIG[vala]  =3D "--enable-vala,--disable-vala"
> @@ -43,3 +41,7 @@ do_configure:prepend() {
>      # Remove vapigen.m4 bundled with sources so that the one shipped by =
vala is used instead.
>      rm -f ${S}/m4/vapigen.m4
>  }
> +
> +do_compile:prepend() {
> +    cp ${STAGING_DATADIR_NATIVE}/X11/locale/en_US.UTF-8/Compose ${B}/src=
/Compose
> +}
> diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-star=
t-dbus-we-do-not-have-dbus-lauch.patch b/meta-gnome/recipes-support/ibus/ib=
us/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
> index aec9e7abec..64ad6b0857 100644
> --- a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-=
we-do-not-have-dbus-lauch.patch
> +++ b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-=
we-do-not-have-dbus-lauch.patch
> @@ -10,23 +10,30 @@ Upstream-Status: Inappropriate [OE specific]
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>  ---
> - data/dconf/make-dconf-override-db.sh | 6 ------
> - 1 file changed, 6 deletions(-)
> + data/dconf/make-dconf-override-db.sh | 11 -----------
> + 1 file changed, 11 deletions(-)
>
> +diff --git a/data/dconf/make-dconf-override-db.sh b/data/dconf/make-dcon=
f-override-db.sh
> +index 32cb153..375baa4 100755
>  --- a/data/dconf/make-dconf-override-db.sh
>  +++ b/data/dconf/make-dconf-override-db.sh
> -@@ -12,10 +12,6 @@ export XDG_CACHE_HOME=3D"$TMPDIR/cache"
> +@@ -12,15 +12,6 @@ export XDG_CACHE_HOME=3D"$TMPDIR/cache"
>   export GSETTINGS_SCHEMA_DIR=3D"$TMPDIR/schemas"
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
> diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzi=
p-the-man-pages.patch b/meta-gnome/recipes-support/ibus/ibus/0001-makefile-=
don-t-gzip-the-man-pages.patch
> deleted file mode 100644
> index 105e34873a..0000000000
> --- a/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-m=
an-pages.patch
> +++ /dev/null
> @@ -1,164 +0,0 @@
> -From 5307c3b310fabeaa52fafe743c5efaca73ccce46 Mon Sep 17 00:00:00 2001
> -From: Emil Velikov <emil.l.velikov@gmail.com>
> -Date: Sun, 11 Jun 2023 16:16:35 +0900
> -Subject: [PATCH] makefile: don't gzip the man pages
> -
> -Drop the gzip step from the manpages - distributions already do that as
> -needed. In addition this resolves the final reproducibility issue with
> -ibus.
> -
> -BUG=3Dhttps://github.com/ibus/ibus/pull/2514
> -
> -Upstream-Status: Backport [https://github.com/ibus/ibus/commit/1a25975d9=
f55f18eab609e4d147dd32689e367f3]
> -Note: This commit is included in version >=3D 1.5.29 and can be dropped
> -after upgrading.
> -Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
> -@@ -169,7 +169,6 @@ EXTRA_DIST =3D                \
> -
> - CLEANFILES =3D \
> -       $(man_one_DATA)            \
> --      $(man_one_files)        \
> -       $(NULL)
> -
> - $(libibus):
> -@@ -181,14 +180,11 @@ test: ibus-daemon
> -               $(builddir)/ibus-daemon -v
> -
> - man_one_in_files =3D ibus-daemon.1.in
> --man_one_files =3D $(man_one_in_files:.1.in=3D.1)
> --man_one_DATA =3D$(man_one_files:.1=3D.1.gz)
> -+man_one_DATA =3D $(man_one_in_files:.1.in=3D.1)
> - man_onedir =3D $(mandir)/man1
> - %.1: %.1.in
> -       $(AM_V_GEN) sed \
> -               -e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
> -               mv $@.tmp $@
> --%.1.gz: %.1
> --      $(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
> -
> - -include $(top_srcdir)/git.mk
> -diff --git a/data/dconf/Makefile.am b/data/dconf/Makefile.am
> -index 5360f033..2352f770 100644
> ---- a/data/dconf/Makefile.am
> -+++ b/data/dconf/Makefile.am
> -@@ -38,15 +38,12 @@ dconfdb_DATA =3D 00-upstream-settings
> -               { rc=3D$$?; $(RM) -rf $@; exit $$rc; }
> -
> - man_5_in_files =3D 00-upstream-settings.5.in ibus.5.in
> --man_5_files =3D $(man_5_in_files:.5.in=3D.5)
> --man_5_DATA =3D$(man_5_files:.5=3D.5.gz)
> -+man_5_DATA =3D $(man_5_in_files:.5.in=3D.5)
> - man_5dir =3D $(mandir)/man5
> - %.5: %.5.in
> -       $(AM_V_GEN) sed \
> -           -e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
> -           mv $@.tmp $@
> --%.5.gz: %.5
> --      $(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
> -
> - install-data-hook:
> -       if test -z "$(DESTDIR)"; then \
> -@@ -63,7 +60,6 @@ EXTRA_DIST =3D \
> -
> - CLEANFILES =3D \
> -     $(man_5_DATA) \
> --    $(man_5_files) \
> -     $(NULL)
> -
> - MAINTAINERCLEANFILES =3D \
> -diff --git a/setup/Makefile.am b/setup/Makefile.am
> -index 34c8f136..b34aa8fc 100644
> ---- a/setup/Makefile.am
> -+++ b/setup/Makefile.am
> -@@ -56,20 +56,16 @@ org.freedesktop.IBus.Setup.desktop: ibus-setup.deskt=
op
> -       $(AM_V_GEN) $(MSGFMT) --desktop --template $< -d $(top_srcdir)/po=
 -o $@
> -
> - man_one_in_files =3D ibus-setup.1.in
> --man_one_files =3D $(man_one_in_files:.1.in=3D.1)
> --man_one_DATA =3D$(man_one_files:.1=3D.1.gz)
> -+man_one_DATA =3D $(man_one_in_files:.1.in=3D.1)
> - man_onedir =3D $(mandir)/man1
> - %.1: %.1.in
> -       $(AM_V_GEN) sed \
> -               -e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
> -               mv $@.tmp $@
> --%.1.gz: %.1
> --      $(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
> -
> - CLEANFILES =3D \
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
> -@@ -79,15 +79,12 @@ bash_completion_DATA=3D \
> - bash_completiondir=3D@datadir@/bash-completion/completions
> -
> - man_one_in_files =3D ibus.1.in
> --man_one_files =3D $(man_one_in_files:.1.in=3D.1)
> --man_one_DATA =3D$(man_one_files:.1=3D.1.gz)
> -+man_one_DATA =3D $(man_one_in_files:.1.in=3D.1)
> - man_onedir =3D $(mandir)/man1
> - %.1: %.1.in
> -       $(AM_V_GEN) sed \
> -               -e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
> -               mv $@.tmp $@
> --%.1.gz: %.1
> --      $(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
> -
> - EXTRA_DIST =3D \
> -       $(man_one_in_files) \
> -@@ -96,7 +93,6 @@ EXTRA_DIST =3D \
> -
> - CLEANFILES =3D \
> -       $(man_one_DATA) \
> --      $(man_one_files) \
> -       $(NULL)
> -
> - if ENABLE_EMOJI_DICT
> -diff --git a/ui/gtk3/Makefile.am b/ui/gtk3/Makefile.am
> -index ab379328..aff035da 100644
> ---- a/ui/gtk3/Makefile.am
> -+++ b/ui/gtk3/Makefile.am
> -@@ -242,15 +242,12 @@ panelbinding.o: $(srcdir)/panelbinding.c
> -
> - MAINTAINERCLEANFILES +=3D extension.c panelbinding.c
> -
> --man_seven_files =3D $(man_seven_in_files:.7.in=3D.7)
> --man_seven_DATA =3D$(man_seven_files:.7=3D.7.gz)
> -+man_seven_DATA =3D $(man_seven_in_files:.7.in=3D.7)
> - man_sevendir =3D $(mandir)/man7
> - %.7: %.7.in
> -       $(AM_V_GEN) sed \
> -           -e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
> -           mv $@.tmp $@
> --%.7.gz: %.7
> --      $(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
> -
> - desktop_in_files =3D \
> -     ibus-ui-emojier.desktop.in \
> -@@ -278,7 +275,6 @@ CLEANFILES +=3D \
> -     $(desktop_DATA) \
> -     $(desktop_notrans_files) \
> -     $(man_seven_DATA) \
> --    $(man_seven_files) \
> -     $(NULL)
> -
> - endif
> diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaratio=
n-errors-with-GCC-15.patch b/meta-gnome/recipes-support/ibus/ibus/0001-src-=
Fix-declaration-errors-with-GCC-15.patch
> deleted file mode 100644
> index 150ff631ba..0000000000
> --- a/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-error=
s-with-GCC-15.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 0f5407f8a3846477fcaa73505437e805467901e1 Mon Sep 17 00:00:00 2001
> -From: fujiwarat <takao.fujiwara1@gmail.com>
> -Date: Fri, 24 Jan 2025 09:40:31 +0900
> -Subject: [PATCH] src: Fix declaration errors with GCC 15
> -
> -
> -BUG=3Drhbz#2340629
> -
> -Upstream-Status: Backport [https://github.com/ibus/ibus/commit/aac5446e8=
c98db934912b9b15a1ef92c3b7e4c8c]
> -Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
> -@@ -520,7 +520,7 @@ check_emoji_table (IBusEngineSimple       *simple,
> -         g_object_ref_sink (priv->lookup_table);
> -     }
> -     if (emoji_dict =3D=3D NULL)
> --        emoji_dict =3D priv->emoji_dict =3D load_emoji_dict (simple);
> -+        emoji_dict =3D priv->emoji_dict =3D load_emoji_dict ();
> -
> -     if (emoji_dict =3D=3D NULL || emoji_dict->dict =3D=3D NULL)
> -         return FALSE;
> diff --git a/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-in=
compatible-pointer-types-in-Transp.patch b/meta-gnome/recipes-support/ibus/=
ibus/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch
> deleted file mode 100644
> index 229a9d34aa..0000000000
> --- a/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompati=
ble-pointer-types-in-Transp.patch
> +++ /dev/null
> @@ -1,109 +0,0 @@
> -From b0a554d7c9d4d52bd34a85fe66a85adf9542a2ec Mon Sep 17 00:00:00 2001
> -From: fujiwarat <takao.fujiwara1@gmail.com>
> -Date: Fri, 24 Jan 2025 10:01:11 +0900
> -Subject: [PATCH] util/IMdkit: Fix incompatible-pointer-types in
> - TransportSW.checkAddr
> -
> -
> -BUG=3Drhbz#2340629
> -
> -Upstream-Status: Backport [https://github.com/ibus/ibus/commit/d039b95b1=
af14fd34167a4ca038938cef2ea41ca]
> -Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
> -          Copyright (C) 2014 Peng Huang <shawn.p.huang@gmail.com>
> --         Copyright (C) 2014 Red Hat, Inc.
> -+         Copyright (C) 2014-2025 Red Hat, Inc.
> -
> - Permission to use, copy, modify, distribute, and sell this software
> - and its documentation for any purpose is hereby granted without fee,
> -@@ -71,13 +71,6 @@ IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOF=
TWARE.
> - #define I18N_SET      1
> - #define I18N_GET      2
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
> -@@ -89,7 +90,7 @@ TransportSW _TransR[] =3D
> - #ifdef DNETCONN
> -     {"decnet",          6, _Xi18nCheckTransAddress},
> - #endif
> --    {(char *) NULL,     0, (Bool (*) ()) NULL}
> -+    {(char *) NULL,     0, (Bool (*) (Xi18n, TransportSW *, char *))NUL=
L}
> - };
> -
> - static Bool GetInputStyles (Xi18n i18n_core, XIMStyles **p_style)
> -diff --git a/util/IMdkit/i18nOffsetCache.c b/util/IMdkit/i18nOffsetCache=
.c
> -index e2fe8c6b..cab974c7 100644
> ---- a/util/IMdkit/i18nOffsetCache.c
> -+++ b/util/IMdkit/i18nOffsetCache.c
> -@@ -1,6 +1,6 @@
> - /*
> -  * Copyright (C) 2014 Peng Huang <shawn.p.huang@gmail.com>
> -- * Copyright (C) 2014 Red Hat, Inc.
> -+ * Copyright (C) 2014-2025 Red Hat, Inc.
> -  *
> -  * Permission to use, copy, modify, distribute, and sell this
> -  * software and its documentation for any purpose is hereby granted
> -@@ -83,10 +83,12 @@ void _Xi18nSetPropertyOffset (Xi18nOffsetCache *offs=
et_cache, Atom key,
> -     }
> -
> -     if (++offset_cache->size > offset_cache->capacity) {
> --        offset_cache->capacity *=3D OFFSET_CACHE_GROWTH_FACTOR;
> --        offset_cache->data =3D (Xi18nAtomOffsetPair *) realloc (data,
> -+        Xi18nAtomOffsetPair *pair =3D (Xi18nAtomOffsetPair *) realloc (=
data,
> -                 offset_cache->capacity * sizeof (Xi18nAtomOffsetPair));
> --        if (offset_cache->data =3D=3D NULL) {
> -+        offset_cache->capacity *=3D OFFSET_CACHE_GROWTH_FACTOR;
> -+        if (pair) {
> -+            offset_cache->data =3D pair;
> -+        } else {
> -             offset_cache->data =3D data;
> -             --offset_cache->size;
> -         }
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130289): https://lists.openembedded.org/g/openembedde=
d-devel/message/130289
> Mute This Topic: https://lists.openembedded.org/mt/121422699/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

