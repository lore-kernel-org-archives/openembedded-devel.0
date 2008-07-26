Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KMqM0-0002Om-5n
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jul 2008 22:27:00 +0200
Received: (qmail invoked by alias); 26 Jul 2008 20:25:32 -0000
Received: from e178069098.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.69.98]
	by mail.gmx.net (mp013) with SMTP; 26 Jul 2008 22:25:32 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18DDzwVS4oD7yNWqaCnJrcoCL+D5HYfi0MF97kLS8
	9k6/3XC9CumSd/
Message-ID: <488B8878.70905@gmx.net>
Date: Sat, 26 Jul 2008 22:26:32 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Henning Heinold <heinold@inf.fu-berlin.de>
References: <20080726202735.E89F2189327@amethyst.openembedded.net>
In-Reply-To: <20080726202735.E89F2189327@amethyst.openembedded.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.51
Subject: Re: [oe-commits] org.oe.dev classpath-initial: fix libtool2 error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 26 Jul 2008 20:27:00 -0000
X-Groupsio-MsgNum: 5619
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig7659D96C9592984729033256"

--------------enig7659D96C9592984729033256
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Henning,
nice you found it finally!

woglinde2 commit schrieb:
> classpath-initial: fix libtool2 error
> * when compiling with libtool2 config.rpath is needed and fix this erro=
r
> libtool: link: unsupported hardcode properties
> libtool: link: See the libtool documentation for more information.
> libtool: link: Fatal configuration error.
> * config.rpath is coming from gettext so let depend on it
> * bump PR

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/classpath/classpath-initial_0.93.bb	dcbd137250c9fd6e2ca0ca=
88afc7404e9ede289c
> +++ packages/classpath/classpath-initial_0.93.bb	e8d4723f96ff6828015eaf=
cabc845d6122cf304f
> @@ -5,7 +5,7 @@ DESCRIPTION=3D"Java1.4-compatible GNU Clas
> =20
>  DESCRIPTION=3D"Java1.4-compatible GNU Classpath variant that is used a=
s bootclasspath for jikes-native."
> =20
> -PR =3D "r0"
> +PR =3D "r2"
> =20
>  DEPENDS =3D "zip-native fastjar-native jikes-native"
> =20
> @@ -25,4 +25,3 @@ EXTRA_OECONF =3D "\
>    --with-native-libdir=3D${STAGING_LIBDIR}/classpath-initial \
>    --includedir=3D${STAGING_INCDIR}/classpath-initial \
>    "
> -
>=20
But I do not see any dramatic changes here ... ?!?

Regards
Robert


--------------enig7659D96C9592984729033256
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkiLiHkACgkQG9cfwmwwEto21ACePGeWHlliROiiNLT2U51Rdq/B
yGQAnR5ktxacuJKkLVTKpQmtNE7NqACy
=+hn8
-----END PGP SIGNATURE-----

--------------enig7659D96C9592984729033256--
