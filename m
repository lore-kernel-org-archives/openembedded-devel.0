Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id E7E417FCA2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 17:25:20 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id a194so11353941qkg.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 10:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YjYa67PZc8Bw6UFY1gwIcZm9ijvMf5axgJGzTBaPMNQ=;
	b=KMLgUDSo2jri44PSVLmmWWcG4uSBT5FOk5s79bJ/NxmEHIwZMg9f13/nfospnzrO6n
	dcHyL8mbnApscHsKievrPcTcX1Dtu+lCqp118+WXlclOxfUSXogkQhHsfHKKvBnI5Kcb
	hCIUySoaW9ypwoCwmLoNfonrcXN3azh4nAmzRFmakSmtgzOS5fytOHJ60ifZxT/NwSNK
	9ipiEDJH4SjiCPSJam+HI3Z9gLoJwC1WLYqAeFp7sgzeI9BXEvqk8ekWysrLq4C8U0dF
	+cd2TaSK1jnlfBkHXrB4ZD24924fasZzwDT+JG6+pA0akQp/iRncDyHckCDjyCcaXeas
	N3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YjYa67PZc8Bw6UFY1gwIcZm9ijvMf5axgJGzTBaPMNQ=;
	b=TkaOSX8gCIMMt/PBOjLT4b7/hY5pQbNiK8U/+RVt899H/5MdAETBEvx4L/AbyBIynM
	0AOK2UaG5AUJs3z9WoAbx8Gc/HFYprut6alfq+yS6wT/KUWZQoXhxlORXsqEUZTOhpRw
	KNwx+XhJkzvpxeA+rBptULmuowD6W2mz2OCOJvA5GuPfS1NH4qhIbxyQKTEv6kMP7P1n
	FJ4EkVO93cjFQWKhcSfIHW40og/aXcaocyrmjYhlc4fUvRhstU5nbEVsq3mR01pLVdi3
	xZpGXYX8QwZpLWvunW+n5y6q45QfvG5vD8Z/V++5FnXs/5JIbsU0XZgke36elJkcpr5i
	zG7A==
X-Gm-Message-State: APjAAAXq3h28V3x6fhsR5BDjrmXhFIQOs8PIkZVSpFq6in2DPLD8tBjk
	0l5aENGacjIWs2M/DKbQQx9QqO7Awoq8fRE934ko3WPw
X-Google-Smtp-Source: APXvYqx9qP2tS70aALK5mEx2dUTFhVSv/ORxJAdf2l4I3hQJuGwsQXh1rSVx6a4J0h3gmiC71HAwtpHJendVlF3RA9Y=
X-Received: by 2002:a37:6554:: with SMTP id z81mr789925qkb.9.1572629121280;
	Fri, 01 Nov 2019 10:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <1572616775-69362-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CANNYZj_aty2tpJ6qttT3phqktydh_xz0sVPwv-n4hfYQjKHr-Q@mail.gmail.com>
	<CALbNGRSOUYZyLs54vKNQV9PurhnxugMmjn6kj6cb1nkos5O+8Q@mail.gmail.com>
In-Reply-To: <CALbNGRSOUYZyLs54vKNQV9PurhnxugMmjn6kj6cb1nkos5O+8Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Nov 2019 10:24:54 -0700
Message-ID: <CAMKF1soOz5=rJEcLM_VNpMOfUto8d3yQo-8bO1Xz8RVqh3Qxpw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] glibmm: upgrade 2.62.0 -> 2.63.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Nov 2019 17:25:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2019 at 5:09 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On Fri, Nov 1, 2019 at 11:55 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Is 2.63.1 a pre-release version? As a gnome project, it's probably
> > following the odd-even scheme.
> >
> > Alex
> >
> form [1]
>
> | 2.63.1: (unstable):
> | Distro packagers should probably not package this yet.
>
> So why should we?
>
> [1] http://ftp.gnome.org/pub/gnome/sources/glibmm/2.63/glibmm-2.63.1.news
>

thanks for calling it out. I agree I think we should wait for 2.64 stable.

> Andreas
> > On Fri, 1 Nov 2019 at 11:20, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > wrote:
> >
> > > 1) Update DEPEND from libsigc++-2.0 to libsigc++-3.
> > >
> > > 2) Update install dir from glibmm-2.4 to glibmm-2.64.
> > >
> > > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > > ---
> > >  .../glib-2.0/{glibmm_2.62.0.bb =3D> glibmm_2.63.1.bb}        | 14
> > > +++++++-------
> > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > >  rename meta-oe/recipes-core/glib-2.0/{glibmm_2.62.0.bb =3D>
> > > glibmm_2.63.1.bb} (68%)
> > >
> > > diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
> > > b/meta-oe/recipes-core/glib-2.0/glibmm_2.63.1.bb
> > > similarity index 68%
> > > rename from meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
> > > rename to meta-oe/recipes-core/glib-2.0/glibmm_2.63.1.bb
> > > index 75eea4e..99f5cf9 100644
> > > --- a/meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
> > > +++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.63.1.bb
> > > @@ -5,7 +5,7 @@ LICENSE =3D "LGPLv2.1 & GPLv2"
> > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D42dfffebc56fec7527aac53b7=
a89d1d8 \
> > >
> > >  file://COPYING.tools;md5=3D751419260aa954499f7abaabaa882bbe"
> > >
> > > -DEPENDS =3D "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
> > > +DEPENDS =3D "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
> > >  inherit gnomebase
> > >
> > >  SHRT_VER =3D
> > > "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
> > > @@ -13,23 +13,23 @@ SHRT_VER =3D
> > > "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
> > >  SRC_URI +=3D " \
> > >      file://remove-examples.patch \
> > >  "
> > > -SRC_URI[archive.md5sum] =3D "7da228e3f0c6a10024b9a7708c53691e"
> > > -SRC_URI[archive.sha256sum] =3D
> > > "36659f13cc73282392d1305858f3bbca46fbd1ce2f078cc9db8b9f79b2e93cfe"
> > > +SRC_URI[archive.md5sum] =3D "6d00da9e119d3cd1a27caaae4b00114e"
> > > +SRC_URI[archive.sha256sum] =3D
> > > "4f99e29bd0a67afd94c0d6fdad2b86bc5cd944cd5d4ff097520dc58b6c997ada"
> > >
> > >  do_install_append() {
> > > -    install -d ${D}${datadir}/glibmm-2.4
> > > +    install -d ${D}${datadir}/glibmm-2.64
> > >      install -d ${D}${datadir}/aclocal
> > >
> > > -    install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.4/
> > > +    install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.64/
> > >      install -m 0644 scripts/glibmm_check_perl.m4 ${D}${datadir}/aclo=
cal/
> > > || true
> > >
> > >      for i in generate_wrap_init.pl gmmproc; do
> > > -        sed -i -e '1s,.*,#!${bindir}/env perl,'
> > > ${D}${libdir}/glibmm-2.4/proc/$i
> > > +        sed -i -e '1s,.*,#!${bindir}/env perl,'
> > > ${D}${libdir}/glibmm-2.64/proc/$i
> > >      done
> > >  }
> > >
> > >  FILES_${PN} =3D "${libdir}/lib*.so.*"
> > > -FILES_${PN}-dev +=3D "${datadir}/glibmm-* ${libdir}/glibmm-2.4/inclu=
de/
> > > ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
> > > +FILES_${PN}-dev +=3D "${datadir}/glibmm-* ${libdir}/glibmm-2.64/incl=
ude/
> > > ${libdir}/glibmm-2.64/proc/ ${libdir}/giomm-2.64/include/"
> > >
> > >  RDEPENDS_${PN}-dev =3D "perl"
> > >  SECURITY_CFLAGS =3D "${SECURITY_NO_PIE_CFLAGS}"
> > > --
> > > 2.7.4
> > >
> > >
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

