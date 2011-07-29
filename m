Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QmuJR-0003MO-By for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 23:09:41 +0200
Received: from f053039036.adsl.alicedsl.de ([78.53.39.36]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QmuGT-0003ni-7k for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 21:06:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201107292248.49790.schnitzeltony@gmx.de>
References: <1311966065.3882.90.camel@mattotaupa>
	<201107292248.49790.schnitzeltony@gmx.de>
Date: Fri, 29 Jul 2011 23:05:24 +0200
Message-ID: <1311973524.3882.135.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
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
X-List-Received-Date: Fri, 29 Jul 2011 21:09:41 -0000
X-Groupsio-MsgNum: 33400
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-LyWO1AN2dnYWwT0OBO2S"

--=-LyWO1AN2dnYWwT0OBO2S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 29.07.2011, 22:48 +0200 schrieb Andreas Mueller:
> On Friday, July 29, 2011 09:01:05 PM Paul Menzel wrote:
> > Date: Fri, 29 Jul 2011 20:47:22 +0200
> >=20
> > This license is listed online for example at the Web site of XFree86 [1=
],
> > Debian [2]. No name of the license is mentioned there. Gentoo just uses
> > =C2=BBMIT=C2=AB [3].
> >=20
> > There are some packages in OpenEmbedded using `MIT-X` and I guess they
> > refer to the same license. I prefer =C2=BBX/MIT=C2=AB derived from the =
chapter name
> > of [1] =C2=BBMIT/X Licenses=C2=AB.
> >=20
> > [1] http://www.xfree86.org/current/LICENSE5.html
> > [2]
> > http://packages.debian.org/changelogs/pool/main/x/x11-xserver-utils/x11=
-xs
> > erver-utils_7.6+3/x11-xserver-utils.copyright [3]
> > http://gpo.zugaina.org/x11-apps/iceauth/euscan
> oe-core seems to prefer MIT too [1].

They named the file name MIT. But a lot of `xorg*` packages seem to use
`MIT-X`, especially `xorg-app/xorg-app-common.inc`.

        $ git grep MIT-X
        meta/classes/license.bbclass:SPDXLICENSEMAP[MIT-X] =3D "MIT"
        meta/recipes-graphics/xcb/libxcb.inc:LICENSE =3D "MIT-X"
        meta/recipes-graphics/xcb/xcb-proto.inc:LICENSE =3D "MIT-X"
        meta/recipes-graphics/xorg-app/xorg-app-common.inc:LICENSE =3D "MIT=
-X"
        meta/recipes-graphics/xorg-driver/xf86-driver-common.inc:LICENSE =
=3D "MIT-X"
        meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb:LICENSE =
=3D "MIT-X"
        meta/recipes-graphics/xorg-font/xorg-font-common.inc:LICENSE =3D "M=
IT-X"
        meta/recipes-graphics/xorg-lib/xorg-lib-common.inc:LICENSE =3D "MIT=
-X"
        meta/recipes-graphics/xorg-proto/xorg-proto-common.inc:LICENSE =3D =
"MIT-X"
        meta/recipes-graphics/xorg-util/xorg-util-common.inc:LICENSE =3D "M=
IT-X"
        meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc:LICENSE =
=3D "MIT-X"
        meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:LICEN=
SE =3D "MIT-X"

So is this patch superfluous, because `LICENSE` is defined in the
include file?

Regarding the name, in oe.dev most other recipes from The Open Group
have `LICENSE =3D "MIT"`.

Is it useful to set `LICENSE` in an include file? We should decide that
first.

> iceauth license looks same but appends additional sentence.

Actually the wording is quite different besides the capitalized
paragraph.

> So if no objections I will coose MIT in next version of patch for
> meta-oe.

It is even inconsistent in oe-core, so I really do not care much. But
first the question above needs to be answered.

And Andreas, you could wait until I update the recipe in oe.dev and just
copy it then to save you some time.


Thanks,

Paul


> [1] http://cgit.openembedded.org/cgit.cgi/openembedded-core/tree/meta/fil=
es/common-licenses/MIT

--=-LyWO1AN2dnYWwT0OBO2S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4zIJQACgkQPX1aK2wOHVjl/wCcDaHswCMpFpGMlY2i+ydgFNaT
e0EAn3uiChLNlWKpnSQNbiztzs5Iz8ET
=PK76
-----END PGP SIGNATURE-----

--=-LyWO1AN2dnYWwT0OBO2S--
