Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PTr6j-0002rS-An
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 08:21:33 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PTr6g-0006Ew-IL
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 10:21:32 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Dec 2010 10:21:25 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <1292520711-25044-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1292520711-25044-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Message-Id: <201012181021.29229.roman@khimov.ru>
Subject: Re: [PATCH] openssl: create package for openssl configuration file
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
X-List-Received-Date: Sat, 18 Dec 2010 07:21:33 -0000
X-Groupsio-MsgNum: 27253
Content-Type: multipart/signed; boundary="nextPart1696085.9zVdoLMH5u";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1696085.9zVdoLMH5u
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 16 =D0=B4=D0=B5=D0=BA=D0=B0=D0=
=B1=D1=80=D1=8F 2010 20:31:51 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Chase Maupin =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> * Add the openssl-conf package to the list of packages to
>   be created.  This package contains the openssl.cnf file
>   which is used by both the openssl executable in the
>   openssl package and the libcrypto library.
> * This is to avoid messages like:
>     WARNING: can't open config file: /usr/lib/ssl/openssl.cnf
> * When running "openssl req" to request and generate a certificate
>   the command will fail without the openssl.cnf file being
>   installed on the target system.
> * Made this package an RRECOMMENDS for libcrypto since:
>     * libcrypto is a RDEPENDS for the openssl package
>     * Users can specify a configuration file at another
>       location so it is not stricly required and many
>       commands will work without it (with warnings)
> * Bumped the PR
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Acked-by: Roman I Khimov <khimov@altell.ru>

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1696085.9zVdoLMH5u
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0MYPkACgkQXJ70z+XgVcPgagCfcvcnIyFrBeMHYx6lTfzm4nSu
9FkAnA33YI83zHHzo/jaJs7hzMVrnTPA
=5gXN
-----END PGP SIGNATURE-----

--nextPart1696085.9zVdoLMH5u--
