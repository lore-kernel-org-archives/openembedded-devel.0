Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1Kg4Wl-0005mn-Px
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Sep 2008 23:25:35 +0200
Received: (qmail invoked by alias); 17 Sep 2008 21:22:26 -0000
Received: from e178068198.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.68.198]
	by mail.gmx.net (mp027) with SMTP; 17 Sep 2008 23:22:26 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/fVm4MmSXfHjRdEnok75QpKkuTjuk9QuGitkN8F0
	BExEKGqjBXm6jb
Message-ID: <48D17512.8020408@gmx.net>
Date: Wed, 17 Sep 2008 23:22:26 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080910191312.F3DC51880C1@amethyst.openembedded.net>
In-Reply-To: <20080910191312.F3DC51880C1@amethyst.openembedded.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.53
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [oe-commits] : angstrom 2008: make gtk 2.14.1 default, it feels a lot snappier than 2. 12
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
X-List-Received-Date: Wed, 17 Sep 2008 21:25:35 -0000
X-Groupsio-MsgNum: 5906
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig5D331782F5C4A57D24BAAE64"

--------------enig5D331782F5C4A57D24BAAE64
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
I am unhappy about this as it breaks libgnomeui (just found this out
today). libgnomeui wants to access gtk/gtkfilesystem.h which seems to be
private.

We put those headers into staging for gtk 2.10 but not for 2.12+. When I
changed gtk+.inc locally to do so I still got compilation errors.

Perhaps a newer version of libgnomeui is compatible with gtk+ 2.14.

Regards
Robert

OE GIT Trial schrieb:
> Module: OE.dev
> Branch: org.openembedded.dev
> Commit: e0458a5a61b26bb508df80718c8e832717a4d80e
> URL:    http://gitweb.openembedded.net//OE.dev.git/?a=3Dcommit;h=3De045=
8a5a61b26bb508df80718c8e832717a4d80e
>=20
> Author:  <koen@openembedded.org>
> Date:   Wed Sep 10 19:09:07 2008 +0000
>=20
> angstrom 2008: make gtk 2.14.1 default, it feels a lot snappier than 2.=
12
>=20
> ---
>=20
>  .../include/angstrom-2008-preferred-versions.inc   |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b=
/conf/distro/include/angstrom-2008-preferred-versions.inc
> index 6a3498a..b5c13e1 100644
> --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
> @@ -7,7 +7,7 @@ PREFERRED_VERSION_fontconfig	=3D "2.4.1"
>  PREFERRED_VERSION_glib-2.0 	=3D "2.18.0"
>  PREFERRED_VERSION_glib-2.0-native =3D "2.18.0"
>  PREFERRED_VERSION_gst-pulse 	=3D "0.9.7"
> -PREFERRED_VERSION_gtk+		=3D "2.12.11"
> +PREFERRED_VERSION_gtk+		=3D "2.14.1"
>  PREFERRED_VERSION_libsdl-x11	=3D "1.2.11"
>  PREFERRED_VERSION_libtool 	=3D "2.2.4"
>  PREFERRED_VERSION_libtool-native =3D "2.2.4"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commit=
s
>=20



--------------enig5D331782F5C4A57D24BAAE64
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkjRdRIACgkQG9cfwmwwEtop9QCfeSotvR7kSs/LYqx0/uvP0DXX
tssAoJvxycOP8KxhUqr96tCVW3l9JP2i
=YgID
-----END PGP SIGNATURE-----

--------------enig5D331782F5C4A57D24BAAE64--
