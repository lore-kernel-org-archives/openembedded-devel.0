Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EC7C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 17:00:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1630.1683046830137990605
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 10:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A8C3340C60;
	Tue,  2 May 2023 17:00:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2xWc7AHHxvfM; Tue,  2 May 2023 17:00:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4D3C240C13;
	Tue,  2 May 2023 17:00:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4C96A163893; Tue,  2 May 2023 12:59:39 -0400 (EDT)
Date: Tue, 2 May 2023 12:59:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Randolph Sapp <rs@ti.com>, Martin Jansa <martin.jansa@gmail.com>,
	akuster808 <akuster808@gmail.com>, afd@ti.com, detheridge@ti.com,
	reatmon@ti.com, Openembedded-devel@lists.openembedded.org
Subject: Re: [EXTERNAL] Re: [oe] [meta-oe][kirkstone][PATCHv2] glfw: add
 packageconfig and wayland dependencies
Message-ID: <20230502165939.GA9226@denix.org>
References: <20230427164723.863197-1-rs@ti.com>
 <36d695de-8152-c528-4b17-f85ff1e4c4ff@gmail.com>
 <df484615-b1eb-d368-f48e-f9da599cd4c4@ti.com>
 <CA+chaQfpAZwtAk4kOG56xiCmOm62MGW6YPEG661-n7XqC08Rxg@mail.gmail.com>
 <055e898a-d85e-2f86-da85-b7b00db1cf54@ti.com>
 <CAMKF1squ-NOf4+qgDGVV3yPjX95Kp_nCOq0zK5QWGeqxb=h9OQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMKF1squ-NOf4+qgDGVV3yPjX95Kp_nCOq0zK5QWGeqxb=h9OQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 17:00:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102272

On Tue, May 02, 2023 at 09:08:07AM -0700, Khem Raj wrote:
> On Tue, May 2, 2023 at 9:06=E2=80=AFAM Randolph Sapp <rs@ti.com> wrote:
> >
> > On 5/2/23 10:56, Martin Jansa wrote:
> > > The version which was merged with:
> > >
> > > PACKAGECONFIG ??=3D "x11"
> > >
> > > Should still respect x11 in DISTRO_FEATURES, now this causes:
> > >
> > > ERROR: Nothing PROVIDES 'libxi' (but
> > > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS =
on or
> > > otherwise requires it)
> > > libxi was skipped: missing required distro feature 'x11' (not in
> > > DISTRO_FEATURES)
> > > ERROR: Nothing PROVIDES 'libxinerama' (but
> > > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS =
on or
> > > otherwise requires it)
> > > libxinerama was skipped: missing required distro feature 'x11' (not=
 in
> > > DISTRO_FEATURES)
> > > ERROR: Nothing PROVIDES 'libxrandr' (but
> > > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS =
on or
> > > otherwise requires it)
> > > libxrandr was skipped: missing required distro feature 'x11' (not i=
n
> > > DISTRO_FEATURES)
> > > ERROR: Nothing PROVIDES 'libglu' (but
> > > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS =
on or
> > > otherwise requires it)
> > > libglu was skipped: missing required distro feature 'x11' (not in
> > > DISTRO_FEATURES)
> > > ERROR: Nothing PROVIDES 'libxcursor' (but
> > > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS =
on or
> > > otherwise requires it)
> > > libxcursor was skipped: missing required distro feature 'x11' (not =
in
> > > DISTRO_FEATURES)
> > >
> > > when wayland and opengl are in DISTRO_FEATURES, but x11 isn't.
> > >
> >
> > Yeah, that's expected behavior at this point. You need to manually
> > override the PACKAGECONFIG for wayland in this patch. Just slightly
> > better than no wayland at all.
> >
> > The only way we can get around it is if this layer or one of it's
> > dependencies decides to adopt extra-cmake-modules. They the
> > packageconfig can automatically configure itself. Discussion on who's
> > job it is to carry this package has yet to conclude.
> >
>=20
> May be bring it to meta-oe at this point.

I wonder if it would be better/cleaner to extract a single CMake module t=
his=20
glfw package needs to configure wayland support and carry it locally, ins=
tead=20
of bringing in the entire KDE-specific set of such CMake modules and be o=
n the=20
hook for updating it forever?
https://api.kde.org/frameworks/extra-cmake-modules/html/index.html
https://invent.kde.org/frameworks/extra-cmake-modules


> > > REQUIRED_DISTRO_FEATURES is satisfied by "opengl" and
> > > ANY_OF_DISTRO_FEATURES by "wayland", but the default PACKAGECONFIG
> > > doesn't match with that.
> > >
> > > On Fri, Apr 28, 2023 at 6:32=E2=80=AFPM Randolph Sapp via lists.ope=
nembedded.org
> > > <http://lists.openembedded.org> <rs=3Dti.com@lists.openembedded.org
> > > <mailto:ti.com@lists.openembedded.org>> wrote:
> > >
> > >     On 4/28/23 06:16, akuster808 wrote:
> > >      > Doesn't this need to land it Master first? Kirkstone is in t=
he
> > >     subject
> > >      >
> > >      > - armin
> > >      >
> > >
> > >     Perhaps, but I've only had a chance to test it against kirkston=
e so I
> > >     flagged it as such. At this point I'm still vetting solutions t=
o this
> > >     dependency chain though. Looking for something this layer would
> > >     actually
> > >     like to carry.
> > >
> > >      > On 4/27/23 12:47 PM, rs@ti.com <mailto:rs@ti.com> wrote:
> > >      >> From: Randolph Sapp <rs@ti.com <mailto:rs@ti.com>>
> > >      >>
> > >      >> GLFW has the ability to use a wayland backend. This patch a=
dds a
> > >     config
> > >      >> for it, but does not enable it by default because it has a
> > >     dependency on
> > >      >> extra-cmake-modules which is provided (most commonly) by
> > >     meta-qt5-extra.
> > >      >>
> > >      >> Signed-off-by: Randolph Sapp <rs@ti.com <mailto:rs@ti.com>>
> > >      >> ---
> > >      >>   meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb=
> |
> > >     14 ++++++++++++--
> > >      >>   1 file changed, 12 insertions(+), 2 deletions(-)
> > >      >>
> > >      >> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb
> > >     <http://glfw_3.3.bb>
> > >      >> b/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb=
>
> > >      >> index b31bba6b6b..5b0d61241e 100644
> > >      >> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.=
3.bb>
> > >      >> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.=
3.bb>
> > >      >> @@ -20,7 +20,17 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3D=
ON
> > >      >> -DGLFW_BUILD_DOCS=3DOFF"
> > >      >>   CFLAGS +=3D "-fPIC"
> > >      >> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libx=
i
> > >     libxcursor"
> > >      >> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> > >      >> +DEPENDS =3D "libpng libglu zlib"
> > >      >> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> > >      >> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
> > >      >> +
> > >      >> +# upstream considers x11 and wayland backends mutually
> > >     exclusive and
> > >      >> will
> > >      >> +# prioritize wayland if it is enabled, but wayland has
> > >     dependencies
> > >      >> that cannot
> > >      >> +# be satisfied by this layer so it is disabled by default
> > >      >> +
> > >      >> +PACKAGECONFIG ??=3D "x11"
> > >      >> +
> > >      >> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayla=
nd
> > >      >> wayland-native wayland-protocols extra-cmake-modules libxkb=
common"
> > >      >> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libx=
cursor"
> > >      >>   COMPATIBLE_HOST:libc-musl =3D "null"

