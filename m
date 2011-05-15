Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLe63-0006Zx-U8 for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 18:23:11 +0200
Received: from f053043231.adsl.alicedsl.de ([78.53.43.231]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLe4l-0001b9-4R for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 16:21:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1303134465.3910.63.camel@mattotaupa>
References: <1303134465.3910.63.camel@mattotaupa>
Date: Sun, 15 May 2011 18:20:20 +0200
Message-ID: <1305476420.5838.612.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/2] pkgconfig: refactor to include file `pkgconfig-0.23.inc`
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
X-List-Received-Date: Sun, 15 May 2011 16:23:12 -0000
X-Groupsio-MsgNum: 32059
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Hw4w93I9frhKfAqhRIHK"

--=-Hw4w93I9frhKfAqhRIHK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 18.04.2011, 15:47 +0200 schrieb Paul Menzel:
> Date: Sun, 17 Apr 2011 22:44:04 +0200
>=20
> In pkg-config releases after 0.23 no patches need to be applied and OE de=
faults can be used. Since `pkgconfig-{native,sdk}` also need the common bit=
s factor those out into `pkgconfig-0.23.inc`.
>=20
> This patch is build tested using `angstrom-2010.x` and `minimal{,-uclibc}=
` for `MACHINE =3D "beagleboard"`.
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  recipes/pkgconfig/pkgconfig-0.23.inc       |   14 ++++++++++++++
>  recipes/pkgconfig/pkgconfig-native_0.23.bb |    6 +-----
>  recipes/pkgconfig/pkgconfig-sdk_0.23.bb    |    6 +-----
>  recipes/pkgconfig/pkgconfig.inc            |   11 +++--------
>  recipes/pkgconfig/pkgconfig_0.23.bb        |    7 ++-----
>  5 files changed, 21 insertions(+), 23 deletions(-)
>  create mode 100644 recipes/pkgconfig/pkgconfig-0.23.inc

[=E2=80=A6]

I committed this in 34cb3c31 so that others maybe trying to package the
just released pkg-config 0.26 can use it.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D34cb3c3=
1bfd81035870a8242850884edac80aa11

--=-Hw4w93I9frhKfAqhRIHK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3P/UQACgkQPX1aK2wOHVi4HACfVVWZZAQB7fIYXC0KtHMgShD1
I/0AnjsaYUILHreG+ZSl2JSbkez0qi1W
=oWuy
-----END PGP SIGNATURE-----

--=-Hw4w93I9frhKfAqhRIHK--
