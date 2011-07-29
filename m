Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QmuNU-0003UD-Ir for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 23:13:52 +0200
Received: from f053039036.adsl.alicedsl.de ([78.53.39.36]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QmuKW-0003oT-NK for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 21:10:48 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAPhnLPCgMbBuDOns-YYQRvgV-b3WW6cHLi3Tjxhc2zC00Z=zrA@mail.gmail.com>
References: <1311966065.3882.90.camel@mattotaupa>
	<CAPhnLPCgMbBuDOns-YYQRvgV-b3WW6cHLi3Tjxhc2zC00Z=zrA@mail.gmail.com>
Date: Fri, 29 Jul 2011 23:09:36 +0200
Message-ID: <1311973776.3882.139.camel@mattotaupa>
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
X-List-Received-Date: Fri, 29 Jul 2011 21:13:52 -0000
X-Groupsio-MsgNum: 33401
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-sG/+nU7IvUF9PG+opI1T"

--=-sG/+nU7IvUF9PG+opI1T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 29.07.2011, 13:38 -0700 schrieb Flanagan, Elizabeth:
> On Fri, Jul 29, 2011 at 12:01 PM, Paul Menzel wrote:
> > Date: Fri, 29 Jul 2011 20:47:22 +0200
> >
> > This license is listed online for example at the Web site of XFree86 [1=
], Debian [2]. No name of the license is mentioned there. Gentoo just uses =
=C2=BBMIT=C2=AB [3].
> >
> > There are some packages in OpenEmbedded using `MIT-X` and I guess they =
refer to the same license. I prefer =C2=BBX/MIT=C2=AB derived from the chap=
ter name of [1] =C2=BBMIT/X Licenses=C2=AB.
>=20
> The LICENSE field generally has a few requirements to work correctly
> for license.bbclass. One, it should be python-esque to parse
> correctly. Two, it should use one of two standards. If you look in
> meta/files/common-licenses you'll see a list of license text from
> SPDX. If you look in license.bbclass, you'll also see a bunch of
> mappings for backwards compatability:
>=20
> SPDXLICENSEMAP[MIT-X] =3D "MIT"
>=20
> LICENSE should use either the file name in common-licenses, or, the
> mapping. In this case, we have the mapping for LICENSE, so MIT-X is
> perfectly valid.

Thank you for the detailed explanation.

> > [1] http://www.xfree86.org/current/LICENSE5.html
> > [2] http://packages.debian.org/changelogs/pool/main/x/x11-xserver-utils=
/x11-xserver-utils_7.6+3/x11-xserver-utils.copyright
> > [3] http://gpo.zugaina.org/x11-apps/iceauth/euscan
> >
> > Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> > ---
> > I do not know anything about license names and just checked the WWW. It=
 would be great if the OE crowd could decide on one name and use it consist=
ently.
>=20
> Agreed.

As replied to Andreas, oe-core also seems to use that inconsistently =E2=80=
=93
just from a style point of course. It would be great to get your opinion
on the other issue like licenses in include files too.

[=E2=80=A6]


Thanks,

Paul

--=-sG/+nU7IvUF9PG+opI1T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4zIZAACgkQPX1aK2wOHVhbcgCeLUPsbbnSzajYqS6A1kho/0cc
YAMAn1pBDUaS5UjIZe1J5qwBqFRr2j8F
=GI10
-----END PGP SIGNATURE-----

--=-sG/+nU7IvUF9PG+opI1T--
