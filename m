Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 97C416E8E2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2014 02:57:36 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id y10so6546256wgg.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 19:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Fe4SF58FgQ0OhIyqTKo/nqYzMqXjCOyPvC1EfgXcuS8=;
	b=w3WaSN0keHMbURaMUmdWdTy5lWTeLzjy750X5uPF19QNNkxl6vvo24J7DVRGdQjwNt
	vJtJT9mXlah4Y4pVQsQ+KektA9DIGpoYVGC9aKoZdvnFb9zuuB10keGi+xFKfKjaLKZD
	v76iKXtBk0Q/CarXTUYPKAJScaTynjH95Mx5Zh3vj9oIjIhc06c1iieGfK79GKW0pLmS
	XV/IMGGWg+i06ECVG6FwfHJ20rb/GpfpK3OcbD8Sa3Wk1qyu9LKEUGRQ2/ozt/X0GjIJ
	SWQSRjOcwMjZWkhcG5l2wLYfuk40+yfo73voyptqAP9Ld5WhqOgNLKG15V8GXRPN3ZMx
	+udg==
MIME-Version: 1.0
X-Received: by 10.180.89.211 with SMTP id bq19mr17058593wib.58.1395197856994; 
	Tue, 18 Mar 2014 19:57:36 -0700 (PDT)
Received: by 10.216.117.6 with HTTP; Tue, 18 Mar 2014 19:57:36 -0700 (PDT)
In-Reply-To: <CALbNGRSynkvxFUPNDCoQhPMnK7HHgNuM1sBOh8gPnJZXaW4r+Q@mail.gmail.com>
References: <1395133748-1211-1-git-send-email-stephen.arnold42@gmail.com>
	<CALbNGRSynkvxFUPNDCoQhPMnK7HHgNuM1sBOh8gPnJZXaW4r+Q@mail.gmail.com>
Date: Tue, 18 Mar 2014 19:57:36 -0700
Message-ID: <CAOLEWZW0=OLt2oyRzeQY_3kfGfSYAwf9iOiYwGQ5JqDYZmJzuw@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-graphics][PATCH v3] recipes-graphics/lxdm: autotools and config updates
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Mar 2014 02:57:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On --enable-password=3Dyes:

The upstream docs say "enable to load autologin password store at config
file" and it's part of the default config on my gentoo arm builds.  I
haven't actually tried it in oe yet, since I wanted a default user with a
password in my rpi build.  It sounds like the oe method doesn't need that
option, so I can remove it if that's what you want.

On the extra CFLAGS:

I suppose they're not strictly necessary either, but they do help reduce
configure warnings.  Some of the build failures didn't really have any
obvious errors (just a boat-load of warnings) so it helps in getting to the
true error.  But as I said, it should be okay to remove them now.

Do you want a new version of the patch minus the above?

Steve


On Tue, Mar 18, 2014 at 2:32 AM, Andreas M=FCller <
schnitzeltony@googlemail.com> wrote:

> On Tue, Mar 18, 2014 at 10:09 AM, Stephen Arnold
> <stephen.arnold42@gmail.com> wrote:
> > lxdm_git.bb: Upstream changes required autotools and gettext (intl)
> updates;
> > the package autogen script doesn't create the makefile in po, but
> autotools
> > by itself is missing the input file (thus, the configure_prepend). Ther=
e
> > were also missing depends (from upstream docs and configure checks) and
> > some configure options were added to ensure the desired X/gtk2 config a=
nd
> > enable (optional) auto-login.
> For my interest since I have autologin working as expected (with
> oe-core updated last in january -> autotools not updated). What is
> this --enable-password for?
> >
> > Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
> >
> > ---
> >  meta-oe/recipes-graphics/lxdm/lxdm_git.bb | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bbb/meta-oe/recipes=
-graphics/lxdm/
> lxdm_git.bb
> > index c12eddf..c602ad3 100644
> > --- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> > +++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> > @@ -16,17 +16,24 @@ SRCREV =3D "07fb151a99ef99318b71f3de0afbba977b1e626=
7"
> >  PV =3D "0.5.0+git${SRCPV}"
> >  PE =3D "1"
> >
> > -DEPENDS =3D "cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb
> pango"
> > +DEPENDS =3D "virtual/libintl intltool-native cairo dbus gdk-pixbuf
> glib-2.0 gtk+ virtual/libx11 libxcb pango iso-codes"
> >  DEPENDS +=3D "${@base_contains("DISTRO_FEATURES", "systemd", "",
> "consolekit", d)}"
> >
> >  # combine oe-core way with angstrom DISTRO_TYPE
> >  DISTRO_TYPE ?=3D "${@base_contains("IMAGE_FEATURES", "debug-tweaks",
> "debug", "",d)}"
> >
> > -inherit autotools gettext systemd
> > +inherit autotools pkgconfig gettext systemd
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'systemd',
> '--with-systemdsystemunitdir=3D${systemd_unitdir}/system/
> --disable-consolekit', '--without-systemdsystemunitdir', d)}"
> > +CFLAGS_append =3D " -fno-builtin-fork -fno-builtin-memset
> -fno-builtin-strstr "
> Why these extra flags - I found no hint in commit message.
> > +
> > +EXTRA_OECONF +=3D "--enable-gtk3=3Dno --enable-password=3Dyes --with-x
> -with-xconn=3Dxcb \
> > +    ${@base_contains('DISTRO_FEATURES', 'systemd',
> '--with-systemdsystemunitdir=3D${systemd_unitdir}/system/
> --disable-consolekit', '--without-systemdsystemunitdir', d)}"
> > +
> > +do_configure_prepend() {
> > +    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
> > +}
> >
> >  do_compile_append() {
> >      # default background configured not available / no password field
> available / no default screensaver
> > --
> regards
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

