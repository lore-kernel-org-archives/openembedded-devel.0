Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OYCsG-0004lT-LK
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 08:53:29 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OYCnU-0000fG-Vh
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 10:47:26 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jul 2010 10:47:19 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <201007111103.21110.roman@khimov.ru>
	<1278913254-30180-2-git-send-email-khimov@altell.ru>
	<AANLkTin5ott-60Mn_j6a7iPGhr30gQ9R1JaeuYOCezM-@mail.gmail.com>
In-Reply-To: <AANLkTin5ott-60Mn_j6a7iPGhr30gQ9R1JaeuYOCezM-@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201007121047.23699.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] perl 5.10.1: fix standard module rdependencies
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
X-List-Received-Date: Mon, 12 Jul 2010 06:54:07 -0000
X-Groupsio-MsgNum: 20894
Content-Type: multipart/signed; boundary="nextPart1801211.4h1PIDCsaf";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1801211.4h1PIDCsaf
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA 12 =D0=
=B8=D1=8E=D0=BB=D1=8F 2010 10:31:56 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj=
 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On Sun, Jul 11, 2010 at 10:40 PM, Roman I Khimov <khimov@altell.ru> wrote:
> > Automatic dependency extraction script made some errors thus perl-modul=
es
> > wasn't installable.
> >
> >  * s/perl-module-encode-kr-2022_kr/perl-module-encode-kr-2022-kr/
> >  * perl-module-your-module-here came from example in script, dropped it
> >  *
> > s/perl-module-cpan-exception-yaml_not_installed/perl-module-cpan-except=
io
> >n-yaml-not-installed/ * perl-module-dbd-sqlite - not part of standard
> > perl, provided by libdbd-sqlite * perl-module-dbix-simple - same as
> > above, provided by libdbix-simple
>=20
> now I get this error.
>=20
>   * satisfy_dependencies_for: Cannot satisfy the following
>=20
> dependencies for task-sdk-native:
> |  *    libdbd-sqlite *         libdbix-simple *
> |
> > Signed-off-by: Roman I Khimov <khimov@altell.ru>

Argh. It's "-perl", sorry, updated patch will follow.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1801211.4h1PIDCsaf
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkw6unsACgkQXJ70z+XgVcNz7QCfW1fhetqU8X62c8dwvpQH1Uqk
ngEAnR2Pv3t/3j4esFa8MTVDe1wfrdAU
=gCvJ
-----END PGP SIGNATURE-----

--nextPart1801211.4h1PIDCsaf--
