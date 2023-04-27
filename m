Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3182C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 16:03:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.24990.1682611411908975266
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 09:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB3E640C76;
	Thu, 27 Apr 2023 16:03:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ryBiqREeAbYC; Thu, 27 Apr 2023 16:03:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8328740031;
	Thu, 27 Apr 2023 16:03:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 530F1163842; Thu, 27 Apr 2023 12:02:43 -0400 (EDT)
Date: Thu, 27 Apr 2023 12:02:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: rs@ti.com, openembedded-devel@lists.openembedded.org, afd@ti.com,
	reatmon@ti.com, akuster808@gmail.com, detheridge@ti.com
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] glfw: add packageconfig and
 wayland dependencies
Message-ID: <20230427160243.GK9226@denix.org>
References: <20230426203453.3497409-1-rs@ti.com>
 <20230426203453.3497409-2-rs@ti.com>
 <CAMKF1soDfEAhBYq91JVt9xhvQFr6yV2gsiOAcebCvX5wNio8iw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMKF1soDfEAhBYq91JVt9xhvQFr6yV2gsiOAcebCvX5wNio8iw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 16:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102209

On Thu, Apr 27, 2023 at 01:22:16AM -0700, Khem Raj wrote:
> fails layer check perhaps it has some cross layer deps
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2693
>=20
> On Wed, Apr 26, 2023 at 1:35=E2=80=AFPM Randolph Sapp via
> lists.openembedded.org <rs=3Dti.com@lists.openembedded.org> wrote:
> >
> > From: Randolph Sapp <rs@ti.com>
> >
> > GLFW has the ability to use a wayland backend. This patch adds a conf=
ig
> > for it and attempts to automatically resolve the most common collisio=
n
> > since the wayland and x11 backends are mutually exclusive.
> >
> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > ---
> >  meta-oe/recipes-core/glfw/glfw_3.3.bb | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-=
core/glfw/glfw_3.3.bb
> > index b31bba6b6b..29d7b5de42 100644
> > --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
> > +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
> > @@ -20,7 +20,18 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DGLF=
W_BUILD_DOCS=3DOFF"
> >
> >  CFLAGS +=3D "-fPIC"
> >
> > -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libxi libxcurs=
or"
> > -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> > +DEPENDS =3D "libpng libglu zlib"
> > +REQUIRED_DISTRO_FEATURES =3D "opengl"
> > +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
> > +
> > +# upstream considers x11 and wayland backends mutually exclusive and=
 will
> > +# prioritize wayland if it is enabled
> > +
> > +PACKAGECONFIG ??=3D " \
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'x=
11', d)} \
> > +"
> > +
> > +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayland wayland=
-native wayland-protocols extra-cmake-modules libxkbcommon"

^^^ extra-cmake-modules is a KDE piece and available from these layers:
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dext=
ra-cmake-modules


> > +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcursor"
> >
> >  COMPATIBLE_HOST:libc-musl =3D "null"
> > --
> > 2.40.0

