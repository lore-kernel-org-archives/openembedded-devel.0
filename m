Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1PSy9U-0007Z5-0U
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 21:40:44 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PSy7v-0000bg-In
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 23:39:08 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Dec 2010 23:39:02 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <131E5DFBE7373E4C8D813795A6AA7F080329DB6BBC@dlee06.ent.ti.com>
	<201012152240.45068.roman@khimov.ru>
	<131E5DFBE7373E4C8D813795A6AA7F080329DB6BEA@dlee06.ent.ti.com>
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080329DB6BEA@dlee06.ent.ti.com>
MIME-Version: 1.0
Message-Id: <201012152339.06515.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move openssl.cnf file into base openssl package
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
X-List-Received-Date: Wed, 15 Dec 2010 20:40:44 -0000
X-Groupsio-MsgNum: 27204
Content-Type: multipart/signed; boundary="nextPart2387002.UMzqUyZRKb";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2387002.UMzqUyZRKb
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 15 =D0=B4=D0=B5=D0=BA=D0=B0=D0=B1=D1=80=D1=
=8F 2010 22:47:05 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Maupin, Chase =D0=BD=D0=B0=
=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > Missed that change. Seems wrong to me. And I still think that it belongs
> > to
> > libcrypto, not openssl since you can easily not install openssl binary
> > and still use it with tuned openssl.cnf in your apps.
>=20
> So it seems like there are two packages that need this default openssl.cnf
>  file, the libcrypto and openssl packages.  Would it perhaps be a better
>  idea to pull the configuration file into its own package and then set the
>  RDEPENDS for the libcrypto and openssl packages to use the openssl
>  configuration package? That way you can still have multiple versions of
>  libcrypto (like Koen was trying to do) and have the default file shared
>  between both packages that need it.

openssl is rdepending on libcrypto anyway (it's linked with it and I don't=
=20
think it'll change any time soon). But configs for different versions can b=
e=20
conflicting, so I'm not sure this kind of approach solves anything.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2387002.UMzqUyZRKb
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0JJ2oACgkQXJ70z+XgVcONYwCdE5k7lP/DozVr1hy2P3QR+Eak
o0YAoL3hjqzLqsBwfKaAfwy9leorZjXA
=gpjR
-----END PGP SIGNATURE-----

--nextPart2387002.UMzqUyZRKb--
