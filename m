Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68822C9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 20:33:46 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7309.1790368418836109100
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 13:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZGFAW4eV;
 spf=pass (domain: gmail.com, ip: 74.125.224.141, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66fb93aee5eso1586278d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 13:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790368418; cv=none;
        d=google.com; s=arc-20260327;
        b=g+FkRCpZf2ujcuJ21u5yEuZ96gAAkIxfKcJ7tI+Kmz5782Pt6mJD6p2hEoQX/O426f
         hnbwnnBdgAO4K89Xvb1TYYRwOCjjThhrlm7N7GoS790NkNyjTMs8N95fGE4yrL58VsIT
         UyT24GKTW0vY8mVo94ltm5IPYzn59RPuTNlGjzIXoPrJFDvOX6vtAQgozTDbrAS6eErC
         jLXd+HOuvfp5EJencRaRkmoepoJD+5SHaSngCF7ZcFoF4BZ0X3q5el1DbPd9T3bZGd3L
         XnrFFiRAMj/VyBJ88pmiZpxiKFDdrpiYb6Be7LzjRv1Fzef2lM6rE2MK7YG77akrokUt
         pZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qdEGoUuC8CmOCTyhgpjkt/OjE6IUBKHUGzBdisc2NVk=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=ZM9PcYCAUINOOdUOrToyCsHDF7EAG6yvGHecxan3aV8MyJoHKs9G3pWxaLK+u3v2ak
         gz16yaWYKCpT/oUzg3oiDg/5JkEI7nMqOPAjaSF9vc4wOZcWaTckBxfkrY6QpjE415Wj
         G4PlrkfZkRSggmTvWxWu/f6vdDnc2l5jGawlZd9m3tXUizPQ7dYE4atgqNjXEAuFW7Xq
         t7Zncu0pOKK7nE6QGBzEOx96ionvjPRQAOoMugX/XCkZW1X8fdHGcWEBjwc2jzBPYzR4
         TryLte9D/EAVo6snS8kmAPzYyyVcfVFULU/ct7+vE7pl4Wr2pH7XDHk5Bvz1qB/P/xOz
         +nNQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790368418; x=1790973218; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdEGoUuC8CmOCTyhgpjkt/OjE6IUBKHUGzBdisc2NVk=;
        b=ZGFAW4eV891EQwpV4+EO+zZZqH7sVOMXVzjMf+HyLeK+LADljZ1UBQfumL6XJzrHC7
         JczDXl4ZwfltcdVb1XvXJ7JSD6DM3pUu1myeVXA1LjWIehsxOK0+SHiseg7+nuC+2OfJ
         k5zATl3fGMU5HwmLJc52fVjTnchUJwp2sRCR3pN64/Cv/AonxwjMWBeHmg6IyEzAN1y5
         ltlU9SPNsfpmcmxzaU4XhIv5iQLLCbJtJod4o3tG1yYaqiVbkAl8GwI4NV7vGbxr33hi
         YIUyx6JKPCS3HO+gjF62wOfbZ/SKLv64C33TZEABsI2ZqEfAytVL/velEBCGpZYZ7WbM
         K5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790368418; x=1790973218;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qdEGoUuC8CmOCTyhgpjkt/OjE6IUBKHUGzBdisc2NVk=;
        b=V/VnN4cHBR9ZxoMvcEuzIejwkAqjAVCmZKxHtTZBH8KR4JCGN6qW9SCFtu79pys6GA
         bhvMc5YC3aHjdHAqfmWkeIg0c5bExjzi+k4pkdxNT6Bt0PvuOgF5eSE3EEHhf0br/LKU
         z/Ck7hKz3fgZ6h/A6OmzflI+cc2laayCgXiRQrQvoeshaq9S2X2+nnU2j0F5IwrQCija
         mmdZ9NTSCWTGtGG6eG+xvVeQpcxg0Z+3a+IonSgyOQ5qmktjVWxC+VM6q773pJ21ZKRj
         gpD1/87p2JAU0e32+n1tIQhM1nCumjGlYPDAM12gx0BRCmFTwruY+GS3rmL9bafLWarw
         aMCw==
X-Gm-Message-State: AFuF++lMn0TYqmk60+ci30/apWIny9mI6xaYIfuO+zFj37EGzROzysf/
	z7CwkCdPIj9U02Alj5wfL54gOuth9ckwlTZ7dt9KpedC+UGcLVSY9T2XrLqPTJJ1pda6lXOdVuE
	stNiQVhYO8WIoLjhwDLmkEUK71P9fB0Q=
X-Gm-Gg: AYBFou32C0vE9n0bplmMUxnMF5ekAxIyIQeR60f+chJ6se/fwv2KN2ZKdfTNBpaxL5V
	yjtlYkFk9dN/iq5gwovyX1bIfM//erYi4ymPdcDw79Ei1qIQTLjyBnyUKLa5zADCkK/pvlzDRPW
	2F/qQHIhNEz58yef9E9lg5qXGS/qk+J/+Vkn67GZLPI3YxqvtwXvzbNNxCbL/rZtjkqjowUu4E2
	LnRQf6cQNQpOv1fmjPFzVj+Psy9YwdFdt9p7Bu/kXushdaU1aCI5OCKh+8RfPNTsi/+mGLfcEnr
	PzchaHjr+N/9G3+7gvcJ89B+xrhjWlOz/8x/yI1cV/o/wWuGR9Hqb3yOP0Q5vOOLru+6f2cWO8D
	pczhRfaKRbbuwyUsRkWtvnWD2/mnv8WjxEBrq6HnFCiw8R2bwOcoY+DAe5fF7qUp1mBtjDLKizh
	zR8bWQP1V6FoAcWJLI365PTyjC35N05xrFfIh4PArAiRT/UjlxYX152Y4Y1ewh3olE9+Bmu3dRw
	GtGZ//8INQ2HWSrmnxyPCaq8gjLvNfvsjB6GJlF17R65vYsyaYu50bxPPtMvvWxrv7LSyWvNhAY
	5U93t0ym4PRPQB7v1g==
X-Received: by 2002:a05:690e:1686:b0:66f:b07f:58ee with SMTP id
 956f58d0204a3-672ed1cba3amr2907932d50.1.1790368417577; Fri, 25 Sep 2026
 13:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260925092311.764729-1-f_l_k@t-online.de>
In-Reply-To: <20260925092311.764729-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Sep 2026 13:33:11 -0700
X-Gm-Features: AclHuK_lFmVMP2xrf1y7mHJgYzhFT9oqocQGrShs3YLj0kJq3oAMAwPjq03J7A0
Message-ID: <CAMKF1sosmYaYwcaxnhPVECKKXTJfirtO3SBSqD2DBnMJX0MKEw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] ibus: upgrade 1.5.26 -> 1.5.34
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008c02cc065c54a18f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 20:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130314

--0000000000008c02cc065c54a18f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am seeing

DEBUG: Executing shell function do_compile
cp: cannot stat
'/home/ubuntu/yoe/build/tmp/work/x86_64-linux/ibus-native/1.5.34/recipe-sys=
root-native/usr/share/X11/locale/en_US.UTF-8/Compose':
No such file or directory
WARNING: exit code 1 from a shell command.

On Fri, Sep 25, 2026 at 2:23=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

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
>  meta-gnome/recipes-support/ibus/ibus.inc      |  16 +-
>  ...start-dbus-we-do-not-have-dbus-lauch.patch |  17 +-
>  ...01-makefile-don-t-gzip-the-man-pages.patch | 164 ------------------
>  ...c-Fix-declaration-errors-with-GCC-15.patch |  36 ----
>  ...incompatible-pointer-types-in-Transp.patch | 109 ------------
>  7 files changed, 27 insertions(+), 321 deletions(-)
>  delete mode 100644
> meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-pag=
es.patch
>  delete mode 100644
> meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-with=
-GCC-15.patch
>  delete mode 100644
> meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-po=
inter-types-in-Transp.patch
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
> @@ -17,10 +17,15 @@ PACKAGECONFIG ??=3D " \
>      dconf vala \
>      ${@bb.utils.contains_any('DISTRO_FEATURES', [ 'wayland', 'x11' ],
> 'gtk3 gtk4', '', d)} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libnotify', '', d)} =
\
>  "
>
>  REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'gtk=
4',
> 'opengl', '', d)}"
>
> +do_compile:prepend() {
> +    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
> +}
> +
>  do_configure:prepend() {
>      # run native unicode-parser
>      sed -i 's:$(builddir)/unicode-parser:unicode-parser:g'
> ${S}/src/Makefile.am
> diff --git a/meta-gnome/recipes-support/ibus/ibus.inc
> b/meta-gnome/recipes-support/ibus/ibus.inc
> index 1344cb1981..d9d8b70861 100644
> --- a/meta-gnome/recipes-support/ibus/ibus.inc
> +++ b/meta-gnome/recipes-support/ibus/ibus.inc
> @@ -5,24 +5,22 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dfbc093901857fcd118f065f900982c24"
>
>  inherit autotools-brokensep pkgconfig gobject-introspection gettext
> gtk-doc vala
>
> -PV =3D "1.5.26"
> +PV =3D "1.5.34"
>
> -DEPENDS =3D "unicode-ucd"
> +DEPENDS =3D "unicode-ucd libx11-native"
>
>  SRC_URI =3D " \
> -    git://github.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps \
> +    git://github.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps;tag=3D=
${PV}
> <http://github.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps;tag=3D$%7=
BPV%7D>
> \
>      file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch=
 \
> -    file://0001-makefile-don-t-gzip-the-man-pages.patch \
> -
> file://0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch \
> -    file://0001-src-Fix-declaration-errors-with-GCC-15.patch \
>  "
> -SRCREV =3D "6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3"
> +SRCREV =3D "1f7af28437afd62a6d145bfc81035e698a37411d"
>
>  PACKAGECONFIG[appindicator] =3D
> "--enable-appindicator,--disable-appindicator,qtbase"
>  PACKAGECONFIG[dconf] =3D "--enable-dconf,--disable-dconf,dconf"
>  PACKAGECONFIG[gtk2] =3D "--enable-gtk2,--disable-gtk2,gtk+"
>  PACKAGECONFIG[gtk3] =3D "--enable-gtk3,--disable-gtk3,gtk+3"
>  PACKAGECONFIG[gtk4] =3D "--enable-gtk4,--disable-gtk4,gtk4"
> +PACKAGECONFIG[libnotify] =3D
> "--enable-libnotify,--disable-libnotify,libnotify"
>  PACKAGECONFIG[systemd] =3D
> "--enable-systemd-services,--disable-systemd-services,systemd"
>  PACKAGECONFIG[wayland]  =3D "--enable-wayland,--disable-wayland,wayland"
>  PACKAGECONFIG[vala]  =3D "--enable-vala,--disable-vala"
> @@ -43,3 +41,7 @@ do_configure:prepend() {
>      # Remove vapigen.m4 bundled with sources so that the one shipped by
> vala is used instead.
>      rm -f ${S}/m4/vapigen.m4
>  }
> +
> +do_compile:prepend() {
> +    cp ${STAGING_DATADIR_NATIVE}/X11/locale/en_US.UTF-8/Compose
> ${B}/src/Compose
> +}
> diff --git
> a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-d=
o-not-have-dbus-lauch.patch
> b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-d=
o-not-have-dbus-lauch.patch
> index aec9e7abec..64ad6b0857 100644
> ---
> a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-d=
o-not-have-dbus-lauch.patch
> +++
> b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-d=
o-not-have-dbus-lauch.patch
> @@ -10,23 +10,30 @@ Upstream-Status: Inappropriate [OE specific]
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
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
> diff --git
> a/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-p=
ages.patch
> b/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-p=
ages.patch
> deleted file mode 100644
> index 105e34873a..0000000000
> ---
> a/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-p=
ages.patch
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
> -Upstream-Status: Backport [
> https://github.com/ibus/ibus/commit/1a25975d9f55f18eab609e4d147dd32689e36=
7f3
> ]
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
> -       $(AM_V_GEN) $(MSGFMT) --desktop --template $< -d $(top_srcdir)/po
> -o $@
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
> diff --git
> a/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-wi=
th-GCC-15.patch
> b/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-wi=
th-GCC-15.patch
> deleted file mode 100644
> index 150ff631ba..0000000000
> ---
> a/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-wi=
th-GCC-15.patch
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
> -Upstream-Status: Backport [
> https://github.com/ibus/ibus/commit/aac5446e8c98db934912b9b15a1ef92c3b7e4=
c8c
> ]
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
> diff --git
> a/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-=
pointer-types-in-Transp.patch
> b/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-=
pointer-types-in-Transp.patch
> deleted file mode 100644
> index 229a9d34aa..0000000000
> ---
> a/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatible-=
pointer-types-in-Transp.patch
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
> -Upstream-Status: Backport [
> https://github.com/ibus/ibus/commit/d039b95b1af14fd34167a4ca038938cef2ea4=
1ca
> ]
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
> -@@ -71,13 +71,6 @@ IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
> SOFTWARE.
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
> -@@ -83,10 +83,12 @@ void _Xi18nSetPropertyOffset (Xi18nOffsetCache
> *offset_cache, Atom key,
> -     }
> -
> -     if (++offset_cache->size > offset_cache->capacity) {
> --        offset_cache->capacity *=3D OFFSET_CACHE_GROWTH_FACTOR;
> --        offset_cache->data =3D (Xi18nAtomOffsetPair *) realloc (data,
> -+        Xi18nAtomOffsetPair *pair =3D (Xi18nAtomOffsetPair *) realloc
> (data,
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
> View/Reply Online (#130293):
> https://lists.openembedded.org/g/openembedded-devel/message/130293
> Mute This Topic: https://lists.openembedded.org/mt/121423657/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008c02cc065c54a18f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am seeing<div><br></div><div>DEBUG: Executing shell func=
tion do_compile<br>cp: cannot stat &#39;/home/ubuntu/yoe/build/tmp/work/x86=
_64-linux/ibus-native/1.5.34/recipe-sysroot-native/usr/share/X11/locale/en_=
US.UTF-8/Compose&#39;: No such file or directory<br>WARNING: exit code 1 fr=
om a shell command.<br></div></div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 25, 2026 at =
2:23=E2=80=AFAM Markus Volk via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.o=
penembedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Drop the three backports=
, which are part of the release, and rebase the<br>
dbus-launch patch onto the reworked make-dconf-override-db.sh.<br>
<br>
libnotify is now checked unconditionally unless disabled, so add a<br>
libnotify PACKAGECONFIG, enabled with x11 since only the X11 panel<br>
uses it. ibus-native needs the generated ibusresources.h. The internal<br>
compose table is generated at build time and reads ./Compose before<br>
the X11 locale dir, so copy it from libx11-native instead of touching<br>
the host&#39;s. The wayland GIR needs libibus from the build tree on the<br=
>
qemu library path.<br>
<br>
Tested by building ibus and ibus-native for x86-64.<br>
<br>
AI-Generated: Uses Claude Code (Claude Opus 5.5)<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/ibus/<a href=3D"http://ibus-native.bb" rel=3D"nor=
eferrer" target=3D"_blank">ibus-native.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0meta-gnome/recipes-support/ibus/<a href=3D"http://ibus.bb" rel=3D"nor=
eferrer" target=3D"_blank">ibus.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A05 +<br>
=C2=A0meta-gnome/recipes-support/ibus/ibus.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
16 +-<br>
=C2=A0...start-dbus-we-do-not-have-dbus-lauch.patch |=C2=A0 17 +-<br>
=C2=A0...01-makefile-don-t-gzip-the-man-pages.patch | 164 -----------------=
-<br>
=C2=A0...c-Fix-declaration-errors-with-GCC-15.patch |=C2=A0 36 ----<br>
=C2=A0...incompatible-pointer-types-in-Transp.patch | 109 ------------<br>
=C2=A07 files changed, 27 insertions(+), 321 deletions(-)<br>
=C2=A0delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-makefile=
-don-t-gzip-the-man-pages.patch<br>
=C2=A0delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-=
declaration-errors-with-GCC-15.patch<br>
=C2=A0delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0002-util-IMd=
kit-Fix-incompatible-pointer-types-in-Transp.patch<br>
<br>
diff --git a/meta-gnome/recipes-support/ibus/<a href=3D"http://ibus-native.=
bb" rel=3D"noreferrer" target=3D"_blank">ibus-native.bb</a> b/meta-gnome/re=
cipes-support/ibus/<a href=3D"http://ibus-native.bb" rel=3D"noreferrer" tar=
get=3D"_blank">ibus-native.bb</a><br>
index ca65114c4d..7ba9b57617 100644<br>
--- a/meta-gnome/recipes-support/ibus/<a href=3D"http://ibus-native.bb" rel=
=3D"noreferrer" target=3D"_blank">ibus-native.bb</a><br>
+++ b/meta-gnome/recipes-support/ibus/<a href=3D"http://ibus-native.bb" rel=
=3D"noreferrer" target=3D"_blank">ibus-native.bb</a><br>
@@ -21,6 +21,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0# necessary step by step<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake ibusenumtypes.h<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake ibusmarshalers.h<br>
+=C2=A0 =C2=A0 oe_runmake ibusresources.h<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake ibusenumtypes.c<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake unicode-parser<br>
=C2=A0}<br>
diff --git a/meta-gnome/recipes-support/ibus/<a href=3D"http://ibus.bb" rel=
=3D"noreferrer" target=3D"_blank">ibus.bb</a> b/meta-gnome/recipes-support/=
ibus/<a href=3D"http://ibus.bb" rel=3D"noreferrer" target=3D"_blank">ibus.b=
b</a><br>
index 479498d82f..08a7804ea9 100644<br>
--- a/meta-gnome/recipes-support/ibus/<a href=3D"http://ibus.bb" rel=3D"nor=
eferrer" target=3D"_blank">ibus.bb</a><br>
+++ b/meta-gnome/recipes-support/ibus/<a href=3D"http://ibus.bb" rel=3D"nor=
eferrer" target=3D"_blank">ibus.bb</a><br>
@@ -17,10 +17,15 @@ PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0dconf vala \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains_any(&#39;DISTRO_FEATURES&#39;, [ &=
#39;wayland&#39;, &#39;x11&#39; ], &#39;gtk3 gtk4&#39;, &#39;&#39;, d)} \<b=
r>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;syst=
emd wayland x11&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39=
;, &#39;libnotify&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;${@bb.utils.contains(&#39;PACKAGEC=
ONFIG&#39;, &#39;gtk4&#39;, &#39;opengl&#39;, &#39;&#39;, d)}&quot;<br>
<br>
+do_compile:prepend() {<br>
+=C2=A0 =C2=A0 export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/src/.libs&quot;<br>
+}<br>
+<br>
=C2=A0do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0# run native unicode-parser<br>
=C2=A0 =C2=A0 =C2=A0sed -i &#39;s:$(builddir)/unicode-parser:unicode-parser=
:g&#39; ${S}/src/Makefile.am<br>
diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-=
support/ibus/ibus.inc<br>
index 1344cb1981..d9d8b70861 100644<br>
--- a/meta-gnome/recipes-support/ibus/ibus.inc<br>
+++ b/meta-gnome/recipes-support/ibus/ibus.inc<br>
@@ -5,24 +5,22 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dfbc093901=
857fcd118f065f900982c24&quot;<br>
<br>
=C2=A0inherit autotools-brokensep pkgconfig gobject-introspection gettext g=
tk-doc vala<br>
<br>
-PV =3D &quot;1.5.26&quot;<br>
+PV =3D &quot;1.5.34&quot;<br>
<br>
-DEPENDS =3D &quot;unicode-ucd&quot;<br>
+DEPENDS =3D &quot;unicode-ucd libx11-native&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://github.com/ibus/ibus.git;branch=3Dma=
in;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/ibus/i=
bus.git;branch=3Dmain;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/ibus/ibus.git;branch=3Dma=
in;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps;tag=3D${PV}</a> \<br=
>
=C2=A0 =C2=A0 =C2=A0file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbu=
s-lauch.patch \<br>
-=C2=A0 =C2=A0 file://0001-makefile-don-t-gzip-the-man-pages.patch \<br>
-=C2=A0 =C2=A0 file://0002-util-IMdkit-Fix-incompatible-pointer-types-in-Tr=
ansp.patch \<br>
-=C2=A0 =C2=A0 file://0001-src-Fix-declaration-errors-with-GCC-15.patch \<b=
r>
=C2=A0&quot;<br>
-SRCREV =3D &quot;6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3&quot;<br>
+SRCREV =3D &quot;1f7af28437afd62a6d145bfc81035e698a37411d&quot;<br>
<br>
=C2=A0PACKAGECONFIG[appindicator] =3D &quot;--enable-appindicator,--disable=
-appindicator,qtbase&quot;<br>
=C2=A0PACKAGECONFIG[dconf] =3D &quot;--enable-dconf,--disable-dconf,dconf&q=
uot;<br>
=C2=A0PACKAGECONFIG[gtk2] =3D &quot;--enable-gtk2,--disable-gtk2,gtk+&quot;=
<br>
=C2=A0PACKAGECONFIG[gtk3] =3D &quot;--enable-gtk3,--disable-gtk3,gtk+3&quot=
;<br>
=C2=A0PACKAGECONFIG[gtk4] =3D &quot;--enable-gtk4,--disable-gtk4,gtk4&quot;=
<br>
+PACKAGECONFIG[libnotify] =3D &quot;--enable-libnotify,--disable-libnotify,=
libnotify&quot;<br>
=C2=A0PACKAGECONFIG[systemd] =3D &quot;--enable-systemd-services,--disable-=
systemd-services,systemd&quot;<br>
=C2=A0PACKAGECONFIG[wayland]=C2=A0 =3D &quot;--enable-wayland,--disable-way=
land,wayland&quot;<br>
=C2=A0PACKAGECONFIG[vala]=C2=A0 =3D &quot;--enable-vala,--disable-vala&quot=
;<br>
@@ -43,3 +41,7 @@ do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0# Remove vapigen.m4 bundled with sources so that the on=
e shipped by vala is used instead.<br>
=C2=A0 =C2=A0 =C2=A0rm -f ${S}/m4/vapigen.m4<br>
=C2=A0}<br>
+<br>
+do_compile:prepend() {<br>
+=C2=A0 =C2=A0 cp ${STAGING_DATADIR_NATIVE}/X11/locale/en_US.UTF-8/Compose =
${B}/src/Compose<br>
+}<br>
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-=
dbus-we-do-not-have-dbus-lauch.patch b/meta-gnome/recipes-support/ibus/ibus=
/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch<br>
index aec9e7abec..64ad6b0857 100644<br>
--- a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we=
-do-not-have-dbus-lauch.patch<br>
+++ b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we=
-do-not-have-dbus-lauch.patch<br>
@@ -10,23 +10,30 @@ Upstream-Status: Inappropriate [OE specific]<br>
<br>
=C2=A0Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzelton=
y@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
=C2=A0---<br>
- data/dconf/make-dconf-override-db.sh | 6 ------<br>
- 1 file changed, 6 deletions(-)<br>
+ data/dconf/make-dconf-override-db.sh | 11 -----------<br>
+ 1 file changed, 11 deletions(-)<br>
<br>
+diff --git a/data/dconf/make-dconf-override-db.sh b/data/dconf/make-dconf-=
override-db.sh<br>
+index 32cb153..375baa4 100755<br>
=C2=A0--- a/data/dconf/make-dconf-override-db.sh<br>
=C2=A0+++ b/data/dconf/make-dconf-override-db.sh<br>
-@@ -12,10 +12,6 @@ export XDG_CACHE_HOME=3D&quot;$TMPDIR/cache&quot;<br>
+@@ -12,15 +12,6 @@ export XDG_CACHE_HOME=3D&quot;$TMPDIR/cache&quot;<br>
=C2=A0 export GSETTINGS_SCHEMA_DIR=3D&quot;$TMPDIR/schemas&quot;<br>
=C2=A0 mkdir -p $XDG_CONFIG_HOME $XDG_CACHE_HOME $GSETTINGS_SCHEMA_DIR<br>
<br>
=C2=A0-eval `dbus-launch --sh-syntax`<br>
=C2=A0-<br>
--trap &#39;rm -rf $TMPDIR; kill $DBUS_SESSION_BUS_PID&#39; ERR<br>
+-trap cleanup EXIT<br>
+-<br>
+-cleanup() {<br>
+-=C2=A0 test $? -eq 0 &amp;&amp; exit<br>
+-=C2=A0 rm -rf $TMPDIR; kill $DBUS_SESSION_BUS_PID<br>
+-}<br>
=C2=A0-<br>
=C2=A0 # in case that schema is not installed on the system<br>
=C2=A0 glib-compile-schemas --targetdir &quot;$GSETTINGS_SCHEMA_DIR&quot; &=
quot;$PWD&quot;<br>
<br>
-@@ -52,5 +48,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then<br>
+@@ -57,5 +48,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then<br>
=C2=A0 =C2=A0 =C2=A0 umount $TMPDIR/cache/gvfs<br>
=C2=A0 fi<br>
=C2=A0 rm -rf $TMPDIR<br>
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-=
the-man-pages.patch b/meta-gnome/recipes-support/ibus/ibus/0001-makefile-do=
n-t-gzip-the-man-pages.patch<br>
deleted file mode 100644<br>
index 105e34873a..0000000000<br>
--- a/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man=
-pages.patch<br>
+++ /dev/null<br>
@@ -1,164 +0,0 @@<br>
-From 5307c3b310fabeaa52fafe743c5efaca73ccce46 Mon Sep 17 00:00:00 2001<br>
-From: Emil Velikov &lt;<a href=3D"mailto:emil.l.velikov@gmail.com" target=
=3D"_blank">emil.l.velikov@gmail.com</a>&gt;<br>
-Date: Sun, 11 Jun 2023 16:16:35 +0900<br>
-Subject: [PATCH] makefile: don&#39;t gzip the man pages<br>
-<br>
-Drop the gzip step from the manpages - distributions already do that as<br=
>
-needed. In addition this resolves the final reproducibility issue with<br>
-ibus.<br>
-<br>
-BUG=3D<a href=3D"https://github.com/ibus/ibus/pull/2514" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/ibus/ibus/pull/2514</a><br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/ibus/ibus/commit/=
1a25975d9f55f18eab609e4d147dd32689e367f3" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/ibus/ibus/commit/1a25975d9f55f18eab609e4d147dd32689e=
367f3</a>]<br>
-Note: This commit is included in version &gt;=3D 1.5.29 and can be dropped=
<br>
-after upgrading.<br>
-Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
----<br>
- bus/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 +-----<br>
- data/dconf/Makefile.am | 6 +-----<br>
- setup/Makefile.am=C2=A0 =C2=A0 =C2=A0 | 6 +-----<br>
- tools/Makefile.am=C2=A0 =C2=A0 =C2=A0 | 6 +-----<br>
- ui/gtk3/Makefile.am=C2=A0 =C2=A0 | 6 +-----<br>
- 5 files changed, 5 insertions(+), 25 deletions(-)<br>
-<br>
-diff --git a/bus/Makefile.am b/bus/Makefile.am<br>
-index e173ee25..d0445d02 100644<br>
---- a/bus/Makefile.am<br>
-+++ b/bus/Makefile.am<br>
-@@ -169,7 +169,6 @@ EXTRA_DIST =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
- <br>
- CLEANFILES =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(man_one_DATA)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
--=C2=A0 =C2=A0 =C2=A0 $(man_one_files)=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(NULL)<br>
- <br>
- $(libibus):<br>
-@@ -181,14 +180,11 @@ test: ibus-daemon<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(builddir)/ibus-da=
emon -v<br>
- <br>
- man_one_in_files =3D <a href=3D"http://ibus-daemon.1.in" rel=3D"noreferre=
r" target=3D"_blank">ibus-daemon.1.in</a><br>
--man_one_files =3D $(man_one_in_files:.<a href=3D"http://1.in" rel=3D"nore=
ferrer" target=3D"_blank">1.in</a>=3D.1)<br>
--man_one_DATA =3D$(man_one_files:.1=3D.1.gz) <br>
-+man_one_DATA =3D $(man_one_in_files:.<a href=3D"http://1.in" rel=3D"noref=
errer" target=3D"_blank">1.in</a>=3D.1)<br>
- man_onedir =3D $(mandir)/man1<br>
- %.1: %.<a href=3D"http://1.in" rel=3D"noreferrer" target=3D"_blank">1.in<=
/a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AM_V_GEN) sed \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|@VERSION[=
@]|$(VERSION)|g&#39; $&lt; &gt; $@.tmp &amp;&amp; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv $@.tmp $@<br>
--%.1.gz: %.1<br>
--=C2=A0 =C2=A0 =C2=A0 $(AM_V_GEN) gzip -c $&lt; &gt; $@.tmp &amp;&amp; mv =
$@.tmp $@<br>
- <br>
- -include $(top_srcdir)/<a href=3D"http://git.mk" rel=3D"noreferrer" targe=
t=3D"_blank">git.mk</a><br>
-diff --git a/data/dconf/Makefile.am b/data/dconf/Makefile.am<br>
-index 5360f033..2352f770 100644<br>
---- a/data/dconf/Makefile.am<br>
-+++ b/data/dconf/Makefile.am<br>
-@@ -38,15 +38,12 @@ dconfdb_DATA =3D 00-upstream-settings<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ rc=3D$$?; $(RM) -=
rf $@; exit $$rc; }<br>
- <br>
- man_5_in_files =3D <a href=3D"http://00-upstream-settings.5.in" rel=3D"no=
referrer" target=3D"_blank">00-upstream-settings.5.in</a> <a href=3D"http:/=
/ibus.5.in" rel=3D"noreferrer" target=3D"_blank">ibus.5.in</a><br>
--man_5_files =3D $(man_5_in_files:.<a href=3D"http://5.in" rel=3D"noreferr=
er" target=3D"_blank">5.in</a>=3D.5)<br>
--man_5_DATA =3D$(man_5_files:.5=3D.5.gz)<br>
-+man_5_DATA =3D $(man_5_in_files:.<a href=3D"http://5.in" rel=3D"noreferre=
r" target=3D"_blank">5.in</a>=3D.5)<br>
- man_5dir =3D $(mandir)/man5<br>
- %.5: %.<a href=3D"http://5.in" rel=3D"noreferrer" target=3D"_blank">5.in<=
/a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AM_V_GEN) sed \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|@VERSION[@]|$(VERSION)|=
g&#39; $&lt; &gt; $@.tmp &amp;&amp; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv $@.tmp $@<br>
--%.5.gz: %.5<br>
--=C2=A0 =C2=A0 =C2=A0 $(AM_V_GEN) gzip -c $&lt; &gt; $@.tmp &amp;&amp; mv =
$@.tmp $@<br>
- <br>
- install-data-hook:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test -z &quot;$(DESTDIR)&quot;; then \<br>
-@@ -63,7 +60,6 @@ EXTRA_DIST =3D \<br>
- <br>
- CLEANFILES =3D \<br>
-=C2=A0 =C2=A0 =C2=A0$(man_5_DATA) \<br>
--=C2=A0 =C2=A0 $(man_5_files) \<br>
-=C2=A0 =C2=A0 =C2=A0$(NULL)<br>
- <br>
- MAINTAINERCLEANFILES =3D \<br>
-diff --git a/setup/Makefile.am b/setup/Makefile.am<br>
-index 34c8f136..b34aa8fc 100644<br>
---- a/setup/Makefile.am<br>
-+++ b/setup/Makefile.am<br>
-@@ -56,20 +56,16 @@ org.freedesktop.IBus.Setup.desktop: ibus-setup.desktop=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AM_V_GEN) $(MSGFMT) --desktop --template $&lt=
; -d $(top_srcdir)/po -o $@<br>
- <br>
- man_one_in_files =3D <a href=3D"http://ibus-setup.1.in" rel=3D"noreferrer=
" target=3D"_blank">ibus-setup.1.in</a><br>
--man_one_files =3D $(man_one_in_files:.<a href=3D"http://1.in" rel=3D"nore=
ferrer" target=3D"_blank">1.in</a>=3D.1)<br>
--man_one_DATA =3D$(man_one_files:.1=3D.1.gz) <br>
-+man_one_DATA =3D $(man_one_in_files:.<a href=3D"http://1.in" rel=3D"noref=
errer" target=3D"_blank">1.in</a>=3D.1)<br>
- man_onedir =3D $(mandir)/man1<br>
- %.1: %.<a href=3D"http://1.in" rel=3D"noreferrer" target=3D"_blank">1.in<=
/a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AM_V_GEN) sed \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|@VERSION[=
@]|$(VERSION)|g&#39; $&lt; &gt; $@.tmp &amp;&amp; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv $@.tmp $@<br>
--%.1.gz: %.1<br>
--=C2=A0 =C2=A0 =C2=A0 $(AM_V_GEN) gzip -c $&lt; &gt; $@.tmp &amp;&amp; mv =
$@.tmp $@<br>
- <br>
- CLEANFILES =3D \<br>
-=C2=A0 =C2=A0 =C2=A0$(desktop_DATA) \<br>
-=C2=A0 =C2=A0 =C2=A0$(man_one_DATA) \<br>
--=C2=A0 =C2=A0 $(man_one_files) \<br>
-=C2=A0 =C2=A0 =C2=A0*.pyc \<br>
-=C2=A0 =C2=A0 =C2=A0ibus-setup \<br>
-=C2=A0 =C2=A0 =C2=A0$(NULL)<br>
-diff --git a/tools/Makefile.am b/tools/Makefile.am<br>
-index 5c18d3d6..1c716136 100644<br>
---- a/tools/Makefile.am<br>
-+++ b/tools/Makefile.am<br>
-@@ -79,15 +79,12 @@ bash_completion_DATA=3D \<br>
- bash_completiondir=3D@datadir@/bash-completion/completions<br>
- <br>
- man_one_in_files =3D <a href=3D"http://ibus.1.in" rel=3D"noreferrer" targ=
et=3D"_blank">ibus.1.in</a><br>
--man_one_files =3D $(man_one_in_files:.<a href=3D"http://1.in" rel=3D"nore=
ferrer" target=3D"_blank">1.in</a>=3D.1)<br>
--man_one_DATA =3D$(man_one_files:.1=3D.1.gz) <br>
-+man_one_DATA =3D $(man_one_in_files:.<a href=3D"http://1.in" rel=3D"noref=
errer" target=3D"_blank">1.in</a>=3D.1)<br>
- man_onedir =3D $(mandir)/man1<br>
- %.1: %.<a href=3D"http://1.in" rel=3D"noreferrer" target=3D"_blank">1.in<=
/a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AM_V_GEN) sed \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|@VERSION[=
@]|$(VERSION)|g&#39; $&lt; &gt; $@.tmp &amp;&amp; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv $@.tmp $@<br>
--%.1.gz: %.1<br>
--=C2=A0 =C2=A0 =C2=A0 $(AM_V_GEN) gzip -c $&lt; &gt; $@.tmp &amp;&amp; mv =
$@.tmp $@<br>
- <br>
- EXTRA_DIST =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(man_one_in_files) \<br>
-@@ -96,7 +93,6 @@ EXTRA_DIST =3D \<br>
- <br>
- CLEANFILES =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(man_one_DATA) \<br>
--=C2=A0 =C2=A0 =C2=A0 $(man_one_files) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(NULL)<br>
- <br>
- if ENABLE_EMOJI_DICT<br>
-diff --git a/ui/gtk3/Makefile.am b/ui/gtk3/Makefile.am<br>
-index ab379328..aff035da 100644<br>
---- a/ui/gtk3/Makefile.am<br>
-+++ b/ui/gtk3/Makefile.am<br>
-@@ -242,15 +242,12 @@ panelbinding.o: $(srcdir)/panelbinding.c<br>
- <br>
- MAINTAINERCLEANFILES +=3D extension.c panelbinding.c<br>
- <br>
--man_seven_files =3D $(man_seven_in_files:.<a href=3D"http://7.in" rel=3D"=
noreferrer" target=3D"_blank">7.in</a>=3D.7)<br>
--man_seven_DATA =3D$(man_seven_files:.7=3D.7.gz)<br>
-+man_seven_DATA =3D $(man_seven_in_files:.<a href=3D"http://7.in" rel=3D"n=
oreferrer" target=3D"_blank">7.in</a>=3D.7)<br>
- man_sevendir =3D $(mandir)/man7<br>
- %.7: %.<a href=3D"http://7.in" rel=3D"noreferrer" target=3D"_blank">7.in<=
/a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AM_V_GEN) sed \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|@VERSION[@]|$(VERSION)|=
g&#39; $&lt; &gt; $@.tmp &amp;&amp; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv $@.tmp $@<br>
--%.7.gz: %.7<br>
--=C2=A0 =C2=A0 =C2=A0 $(AM_V_GEN) gzip -c $&lt; &gt; $@.tmp &amp;&amp; mv =
$@.tmp $@<br>
- <br>
- desktop_in_files =3D \<br>
-=C2=A0 =C2=A0 =C2=A0<a href=3D"http://ibus-ui-emojier.desktop.in" rel=3D"n=
oreferrer" target=3D"_blank">ibus-ui-emojier.desktop.in</a> \<br>
-@@ -278,7 +275,6 @@ CLEANFILES +=3D \<br>
-=C2=A0 =C2=A0 =C2=A0$(desktop_DATA) \<br>
-=C2=A0 =C2=A0 =C2=A0$(desktop_notrans_files) \<br>
-=C2=A0 =C2=A0 =C2=A0$(man_seven_DATA) \<br>
--=C2=A0 =C2=A0 $(man_seven_files) \<br>
-=C2=A0 =C2=A0 =C2=A0$(NULL)<br>
- <br>
- endif<br>
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-=
errors-with-GCC-15.patch b/meta-gnome/recipes-support/ibus/ibus/0001-src-Fi=
x-declaration-errors-with-GCC-15.patch<br>
deleted file mode 100644<br>
index 150ff631ba..0000000000<br>
--- a/meta-gnome/recipes-support/ibus/ibus/0001-src-Fix-declaration-errors-=
with-GCC-15.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 0f5407f8a3846477fcaa73505437e805467901e1 Mon Sep 17 00:00:00 2001<br>
-From: fujiwarat &lt;<a href=3D"mailto:takao.fujiwara1@gmail.com" target=3D=
"_blank">takao.fujiwara1@gmail.com</a>&gt;<br>
-Date: Fri, 24 Jan 2025 09:40:31 +0900<br>
-Subject: [PATCH] src: Fix declaration errors with GCC 15<br>
-<br>
-<br>
-BUG=3Drhbz#2340629<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/ibus/ibus/commit/=
aac5446e8c98db934912b9b15a1ef92c3b7e4c8c" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/ibus/ibus/commit/aac5446e8c98db934912b9b15a1ef92c3b7=
e4c8c</a>]<br>
-Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
----<br>
- src/ibusenginesimple.c | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/ibusenginesimple.c b/src/ibusenginesimple.c<br>
-index c57a3ea5..60e7fb34 100644<br>
---- a/src/ibusenginesimple.c<br>
-+++ b/src/ibusenginesimple.c<br>
-@@ -477,7 +477,7 @@ check_hex (IBusEngineSimple *simple,<br>
- }<br>
- <br>
- static IBusEngineDict *<br>
--load_emoji_dict ()<br>
-+load_emoji_dict (void)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0IBusEngineDict *emoji_dict;<br>
-=C2=A0 =C2=A0 =C2=A0GList *keys;<br>
-@@ -520,7 +520,7 @@ check_emoji_table (IBusEngineSimple=C2=A0 =C2=A0 =C2=
=A0 =C2=A0*simple,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_object_ref_sink (priv-&gt;lookup_table=
);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0if (emoji_dict =3D=3D NULL)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 emoji_dict =3D priv-&gt;emoji_dict =3D load_e=
moji_dict (simple);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 emoji_dict =3D priv-&gt;emoji_dict =3D load_e=
moji_dict ();<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (emoji_dict =3D=3D NULL || emoji_dict-&gt;dict =3D=
=3D NULL)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return FALSE;<br>
diff --git a/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-inco=
mpatible-pointer-types-in-Transp.patch b/meta-gnome/recipes-support/ibus/ib=
us/0002-util-IMdkit-Fix-incompatible-pointer-types-in-Transp.patch<br>
deleted file mode 100644<br>
index 229a9d34aa..0000000000<br>
--- a/meta-gnome/recipes-support/ibus/ibus/0002-util-IMdkit-Fix-incompatibl=
e-pointer-types-in-Transp.patch<br>
+++ /dev/null<br>
@@ -1,109 +0,0 @@<br>
-From b0a554d7c9d4d52bd34a85fe66a85adf9542a2ec Mon Sep 17 00:00:00 2001<br>
-From: fujiwarat &lt;<a href=3D"mailto:takao.fujiwara1@gmail.com" target=3D=
"_blank">takao.fujiwara1@gmail.com</a>&gt;<br>
-Date: Fri, 24 Jan 2025 10:01:11 +0900<br>
-Subject: [PATCH] util/IMdkit: Fix incompatible-pointer-types in<br>
- TransportSW.checkAddr<br>
-<br>
-<br>
-BUG=3Drhbz#2340629<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/ibus/ibus/commit/=
d039b95b1af14fd34167a4ca038938cef2ea41ca" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/ibus/ibus/commit/d039b95b1af14fd34167a4ca038938cef2e=
a41ca</a>]<br>
-Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
----<br>
- util/IMdkit/Xi18n.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++=
++--------<br>
- util/IMdkit/i18nMethod.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
- util/IMdkit/i18nOffsetCache.c | 10 ++++++----<br>
- 3 files changed, 18 insertions(+), 13 deletions(-)<br>
-<br>
-diff --git a/util/IMdkit/Xi18n.h b/util/IMdkit/Xi18n.h<br>
-index 79dd9619..09097bb6 100644<br>
---- a/util/IMdkit/Xi18n.h<br>
-+++ b/util/IMdkit/Xi18n.h<br>
-@@ -3,7 +3,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Copyright (C) 1994-1995 Sun Microsystem=
s, Inc.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Copyright (C) 1993-1994 Hewlett-Packard=
 Company<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Copyright (C) 2014 Peng Huang &lt;<a hr=
ef=3D"mailto:shawn.p.huang@gmail.com" target=3D"_blank">shawn.p.huang@gmail=
.com</a>&gt;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Copyright (C) 2014 Red Hat, Inc.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Copyright (C) 2014-2025 Red Hat, Inc.<b=
r>
-=C2=A0 <br>
- Permission to use, copy, modify, distribute, and sell this software<br>
- and its documentation for any purpose is hereby granted without fee,<br>
-@@ -71,13 +71,6 @@ IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTW=
ARE.<br>
- #define I18N_SET=C2=A0 =C2=A0 =C2=A0 1<br>
- #define I18N_GET=C2=A0 =C2=A0 =C2=A0 2<br>
- <br>
--typedef struct<br>
--{<br>
--=C2=A0 =C2=A0 char=C2=A0 =C2=A0 =C2=A0 =C2=A0 *transportname;<br>
--=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0namelen;<br>
--=C2=A0 =C2=A0 Bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 (*checkAddr) ();<br>
--} TransportSW;<br>
--<br>
- typedef struct _XIMPending<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0unsigned=C2=A0 =C2=A0 char *p;<br>
-@@ -172,6 +165,15 @@ typedef struct _Xi18nClient<br>
- <br>
- typedef struct _Xi18nCore *Xi18n;<br>
- <br>
-+typedef struct _TransportSW TransportSW;<br>
-+<br>
-+struct _TransportSW<br>
-+{<br>
-+=C2=A0 =C2=A0 char=C2=A0 =C2=A0 =C2=A0 =C2=A0 *transportname;<br>
-+=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0namelen;<br>
-+=C2=A0 =C2=A0 Bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 (*checkAddr) (Xi18n, Transp=
ortSW *, char *);<br>
-+};<br>
-+<br>
- /*<br>
-=C2=A0 * Callback Struct for XIM Protocol<br>
-=C2=A0 */<br>
-diff --git a/util/IMdkit/i18nMethod.c b/util/IMdkit/i18nMethod.c<br>
-index 9c44e7fe..7f343d87 100644<br>
---- a/util/IMdkit/i18nMethod.c<br>
-+++ b/util/IMdkit/i18nMethod.c<br>
-@@ -2,6 +2,7 @@<br>
-=C2=A0 <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Copyright 1994, 1995 by Sun Microsystem=
s, Inc.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Copyright 1993, 1994 by Hewlett-Packard=
 Company<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Copyright (C) 2014-2025 Red Hat, Inc.<b=
r>
-=C2=A0 <br>
- Permission to use, copy, modify, distribute, and sell this software<br>
- and its documentation for any purpose is hereby granted without fee,<br>
-@@ -89,7 +90,7 @@ TransportSW _TransR[] =3D<br>
- #ifdef DNETCONN<br>
-=C2=A0 =C2=A0 =C2=A0{&quot;decnet&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 6, _Xi18nCheckTransAddress},<br>
- #endif<br>
--=C2=A0 =C2=A0 {(char *) NULL,=C2=A0 =C2=A0 =C2=A00, (Bool (*) ()) NULL}<b=
r>
-+=C2=A0 =C2=A0 {(char *) NULL,=C2=A0 =C2=A0 =C2=A00, (Bool (*) (Xi18n, Tra=
nsportSW *, char *))NULL}<br>
- };<br>
- <br>
- static Bool GetInputStyles (Xi18n i18n_core, XIMStyles **p_style)<br>
-diff --git a/util/IMdkit/i18nOffsetCache.c b/util/IMdkit/i18nOffsetCache.c=
<br>
-index e2fe8c6b..cab974c7 100644<br>
---- a/util/IMdkit/i18nOffsetCache.c<br>
-+++ b/util/IMdkit/i18nOffsetCache.c<br>
-@@ -1,6 +1,6 @@<br>
- /*<br>
-=C2=A0 * Copyright (C) 2014 Peng Huang &lt;<a href=3D"mailto:shawn.p.huang=
@gmail.com" target=3D"_blank">shawn.p.huang@gmail.com</a>&gt;<br>
-- * Copyright (C) 2014 Red Hat, Inc.<br>
-+ * Copyright (C) 2014-2025 Red Hat, Inc.<br>
-=C2=A0 *<br>
-=C2=A0 * Permission to use, copy, modify, distribute, and sell this<br>
-=C2=A0 * software and its documentation for any purpose is hereby granted<=
br>
-@@ -83,10 +83,12 @@ void _Xi18nSetPropertyOffset (Xi18nOffsetCache *offset=
_cache, Atom key,<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (++offset_cache-&gt;size &gt; offset_cache-&gt;capa=
city) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset_cache-&gt;capacity *=3D OFFSET_CACHE_G=
ROWTH_FACTOR;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset_cache-&gt;data =3D (Xi18nAtomOffsetPai=
r *) realloc (data,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Xi18nAtomOffsetPair *pair =3D (Xi18nAtomOffse=
tPair *) realloc (data,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset_cache=
-&gt;capacity * sizeof (Xi18nAtomOffsetPair));<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (offset_cache-&gt;data =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset_cache-&gt;capacity *=3D OFFSET_CACHE_G=
ROWTH_FACTOR;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pair) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset_cache-&gt;data =3D pair;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset_cache-&gt;data =3D =
data;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--offset_cache-&gt;size;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130293): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130293" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130293</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121423657/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121423657/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008c02cc065c54a18f--

