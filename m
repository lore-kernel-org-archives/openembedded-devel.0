Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3A98C6E78E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 03:46:43 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so3099104wiw.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 20:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=KBR4bU+pO0A+8Wdyr/o3fnxxxze50hEb0DO7q5cZyrk=;
	b=mkIZ8Cm2fj+N9g4zVPoyIhTVDz9Nvt1j7JWm6Yv3oCEa2Ed00NM/tbr4KjH8iBuflM
	z/GZYh2A6zWjcf65S/xqlod7kSWB+/ORTkAFZA129nqH+SYVZlUR6n6WPnmzkiu9P3qv
	q5/A3/Ac+S1yzr9UT+e3bFMDiUzKi7+lHLFkDkn/6E992qE2ReVNF5WW4H6WHL+lu115
	wlTGhG8wktNEpyRuNboY80coPYEnQfuJODwytf7zPR1ZJa5dwSryWU2BqiE2Q833QSH/
	7OXd4ISF0K3zEU9Cdrj8kfffthphIUv/grLc35oiwh4UTNWKtAYU9Cm8O/YExzMEYbxX
	3lgw==
MIME-Version: 1.0
X-Received: by 10.180.164.229 with SMTP id yt5mr12536819wib.49.1395114403977; 
	Mon, 17 Mar 2014 20:46:43 -0700 (PDT)
Received: by 10.194.59.228 with HTTP; Mon, 17 Mar 2014 20:46:43 -0700 (PDT)
In-Reply-To: <CALbNGRQHS16u634VZgjk4nHy=LiRowK2pc1J1xW6eXNDds_7Xg@mail.gmail.com>
References: <1395016995-19191-1-git-send-email-stephen.arnold42@gmail.com>
	<CALbNGRQHS16u634VZgjk4nHy=LiRowK2pc1J1xW6eXNDds_7Xg@mail.gmail.com>
Date: Mon, 17 Mar 2014 20:46:43 -0700
Message-ID: <CAOLEWZX-s-Cu5vG6+1EF7XuW4_+=2zuFmB5Y7svG0=gCZCD-zQ@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-xfce][PATCH v2 1/1] recipes-xfce/libxfce4ui: build fixes
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
X-List-Received-Date: Tue, 18 Mar 2014 03:46:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Somehow doing it in configure_prepend makes it blow up like this:

| NOTE: Executing ACLOCAL=3D"aclocal
--system-acdir=3D/home/sarnold/poky/build-rpihf/tmp/work/arm1176jzfshf-vfp-=
poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-c=
opy/"
autoreconf --verbose --install --force --exclude=3Dautopoint
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal
--system-acdir=3D/home/sarnold/poky/build-rpihf/tmp/work/arm1176jzfshf-vfp-=
poky-linux-gnueabi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-c=
opy/
--force
| aclocal: error: couldn't open directory
'/home/sarnold/poky/build-rpihf/tmp/work/arm1176jzfshf-vfp-poky-linux-gnuea=
bi/libxfce4ui/4.10.0+gitAUTOINC+530b72f50f-r0/git/aclocal-copy/':
No such file or directory
| autoreconf: aclocal failed with exit status: 1
| ERROR: autoreconf execution failed.



On Mon, Mar 17, 2014 at 1:39 AM, Andreas M=FCller <
schnitzeltony@googlemail.com> wrote:

> On Mon, Mar 17, 2014 at 1:43 AM, Stephen Arnold
> <stephen.arnold42@gmail.com> wrote:
> > From: "Stephen Arnold" <stephen.arnold42@gmail.com>
> >
> > libxfce4ui build fixes:
> >  - updated depends
> >  - set SRCREV to 4.10.0 tag
> AFAICR this will break xfce4-settings see commit
> b3a2a01b40affbedc2b0951f7180c1212d24d532.
> >  - added missing inherit
> >  - added pre-config task
> >
> > Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
> >
> > ---
> >  .../recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb   | 23
> ++++++++++++++--------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
> >
> > diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bbb/me=
ta-xfce/recipes-xfce/libxfce4ui/
> libxfce4ui_4.10.0.bb
> > index cc63a9f..b17ebc1 100644
> > --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
> > +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
> > @@ -2,23 +2,28 @@ SUMMARY =3D "Xfce4 Widget library and X Window System
> interaction"
> >  SECTION =3D "x11/libs"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D252890d9eee26aab7b432e8b8a6=
16475"
> > -DEPENDS =3D "gtk+ intltool libxfce4util startup-notification xfconf
> glade3"
> > +DEPENDS =3D "perl-native glib-2.0 gtk+ intltool libxfce4util xfconf
> xfce4-dev-tools virtual/libx11 libsm libice"
> >
> > -inherit xfce
> > +inherit autotools gettext xfce
> >
> >  SRC_URI =3D " \
> >      git://git.xfce.org/xfce/libxfce4ui;protocol=3Dgit \
> >
>  file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
> > -    file://0002-configure.ac.in-remove-optional-gtk3-support.patch \
> >  "
> > -SRCREV =3D "530b72f50fcbd8cb4b970fcc97be0321bf78183e"
> > -PV =3D "4.10.0+git${SRCPV}"
> > +
> > +SRCREV =3D "cf85eac7804e09b24f3e8fb4165f60b1c9f8cf49"
> > +PV =3D "4.10.0"
> >  S =3D "${WORKDIR}/git"
> >
> > -EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
> > +PACKAGECONFIG ??=3D ""
> > +PACKAGECONFIG[gladeui] =3D "--enable-gladeui,--disable-gladeui,glade3"
> > +PACKAGECONFIG[startup-notification] =3D
> "--enable-startup-notification,--disable-startup-notification,startup-not=
ification"
> > +
> > +EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug
> --with-vendor-info=3D${DISTRO}"
> >
> > -do_configure_prepend() {
> > -       NOCONFIGURE=3Dyes ./autogen.sh
> > +do_patch_extra() {
> > +    sed -i /GTK3/d ${S}/configure.ac.in
> > +    NOCONFIGURE=3Dyes ./autogen.sh
> >  }
> >
> >  FILES_${PN}-dbg +=3D "${libdir}/glade3/modules/.debug"
> > @@ -27,3 +32,5 @@ FILES_${PN}-dev +=3D "${libdir}/glade3/modules/*.la \
> >  PACKAGES +=3D "${PN}-glade"
> >  FILES_${PN}-glade =3D "${libdir}/glade3 \
> >                       ${datadir}/glade3"
> > +
> > +addtask do_patch_extra before do_configure after do_patch
> why not do_configure_prepend?
>
> You say 'build fixes'. Could you append a log showing why these
> changes are necessary?
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

