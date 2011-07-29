Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QmuOw-0003az-Sc
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 23:15:22 +0200
Received: (qmail invoked by alias); 29 Jul 2011 21:11:05 -0000
Received: from p4FDF15A5.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.21.165]
	by mail.gmx.net (mp003) with SMTP; 29 Jul 2011 23:11:05 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/XtAI1nD3XjDAhh1fAqsuK3J3DAW5tSMTrP7quDc
	/FLPfV4/sQVj33
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jul 2011 23:13:42 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1311966065.3882.90.camel@mattotaupa>
	<201107292248.49790.schnitzeltony@gmx.de>
	<1311973524.3882.135.camel@mattotaupa>
In-Reply-To: <1311973524.3882.135.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201107292313.43192.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 2/2] iceauth: Add `LICENSE = "MIT-X"`
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jul 2011 21:15:23 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday, July 29, 2011 11:05:24 PM Paul Menzel wrote:
> Am Freitag, den 29.07.2011, 22:48 +0200 schrieb Andreas Mueller:
> > On Friday, July 29, 2011 09:01:05 PM Paul Menzel wrote:
> > > Date: Fri, 29 Jul 2011 20:47:22 +0200
> > >=20
> > > This license is listed online for example at the Web site of XFree86
> > > [1], Debian [2]. No name of the license is mentioned there. Gentoo
> > > just uses =BBMIT=AB [3].
> > >=20
> > > There are some packages in OpenEmbedded using `MIT-X` and I guess they
> > > refer to the same license. I prefer =BBX/MIT=AB derived from the chap=
ter
> > > name of [1] =BBMIT/X Licenses=AB.
> > >=20
> > > [1] http://www.xfree86.org/current/LICENSE5.html
> > > [2]
> > > http://packages.debian.org/changelogs/pool/main/x/x11-xserver-utils/x=
11
> > > -xs erver-utils_7.6+3/x11-xserver-utils.copyright [3]
> > > http://gpo.zugaina.org/x11-apps/iceauth/euscan
> >=20
> > oe-core seems to prefer MIT too [1].
>=20
> They named the file name MIT. But a lot of `xorg*` packages seem to use
> `MIT-X`, especially `xorg-app/xorg-app-common.inc`.
>=20
>         $ git grep MIT-X
>         meta/classes/license.bbclass:SPDXLICENSEMAP[MIT-X] =3D "MIT"
>         meta/recipes-graphics/xcb/libxcb.inc:LICENSE =3D "MIT-X"
>         meta/recipes-graphics/xcb/xcb-proto.inc:LICENSE =3D "MIT-X"
>         meta/recipes-graphics/xorg-app/xorg-app-common.inc:LICENSE =3D
> "MIT-X" meta/recipes-graphics/xorg-driver/xf86-driver-common.inc:LICENSE =
=3D
> "MIT-X" meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb:LICENSE
> =3D "MIT-X" meta/recipes-graphics/xorg-font/xorg-font-common.inc:LICENSE =
=3D
> "MIT-X" meta/recipes-graphics/xorg-lib/xorg-lib-common.inc:LICENSE =3D
> "MIT-X" meta/recipes-graphics/xorg-proto/xorg-proto-common.inc:LICENSE =3D
> "MIT-X" meta/recipes-graphics/xorg-util/xorg-util-common.inc:LICENSE =3D
> "MIT-X" meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc:LICENSE
> =3D "MIT-X"
> meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:LICENSE =3D
> "MIT-X"
>=20
> So is this patch superfluous, because `LICENSE` is defined in the
> include file?
>=20
> Regarding the name, in oe.dev most other recipes from The Open Group
> have `LICENSE =3D "MIT"`.
>=20
> Is it useful to set `LICENSE` in an include file? We should decide that
> first.
>=20
> > iceauth license looks same but appends additional sentence.
>=20
> Actually the wording is quite different besides the capitalized
> paragraph.
>=20
> > So if no objections I will coose MIT in next version of patch for
> > meta-oe.
>=20
> It is even inconsistent in oe-core, so I really do not care much. But
> first the question above needs to be answered.
>=20
> And Andreas, you could wait until I update the recipe in oe.dev and just
> copy it then to save you some time.
>=20
Sure :-)

Andreas


