Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NuUwg-0008PS-1q
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 19:04:50 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NuUtd-0008PP-OE
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 21:01:38 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Mar 2010 20:58:56 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <201003211505.39554.roman@khimov.ru>
	<201003242026.22169.roman@khimov.ru>
	<201003241841.01034.marcin@juszkiewicz.com.pl>
In-Reply-To: <201003241841.01034.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <201003242058.56943.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 01/44] cpan-base: add perl version to PR
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
X-List-Received-Date: Wed, 24 Mar 2010 18:04:54 -0000
X-Groupsio-MsgNum: 18095
Content-Type: multipart/signed; boundary="nextPart1699291.vjjNY6iK8m";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1699291.vjjNY6iK8m
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 24 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2010 20:41=
:00 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Marcin Juszkiewicz =D0=BD=D0=B0=D0=BF=D0=
=B8=D1=81=D0=B0=D0=BB:
> Dnia =C5=9Broda, 24 marca 2010 o 18:26:16 Roman I Khimov napisa=C5=82(a):
> > OK. Pushed perl 5.10.1, everybody, have fun!
>=20
> 18:39 hrw@home:angstrom$ bitbake perl
> NOTE: Handling BitBake files: - (0975/8143) [11 %]NOTE: <type
> 'exceptions.TypeError'>:cannot concatenate 'str' and 'NoneType' objects
>  while evaluating:
> r0${@perl_get_version_suffix(d)}

Argh! Sure, I have perl built already and it's get_perl_version that gives=
=20
None here. Ugh. Sorry, thinking on better fix.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1699291.vjjNY6iK8m
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkuqUuAACgkQXJ70z+XgVcPM2QCgs9455tpdJnq82ee1wsPN38jc
SdgAoKFrpRFAstSNauUs2wLaEE9pq/s7
=8VQI
-----END PGP SIGNATURE-----

--nextPart1699291.vjjNY6iK8m--
