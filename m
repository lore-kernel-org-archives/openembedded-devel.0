Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OYCy8-0000m2-In
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 08:58:34 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OYCtI-0000gB-HE
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 10:53:25 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jul 2010 10:53:23 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <AANLkTin5ott-60Mn_j6a7iPGhr30gQ9R1JaeuYOCezM-@mail.gmail.com>
	<1278917375-22463-1-git-send-email-khimov@altell.ru>
In-Reply-To: <1278917375-22463-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <201007121053.23909.roman@khimov.ru>
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
X-List-Received-Date: Mon, 12 Jul 2010 06:58:34 -0000
X-Groupsio-MsgNum: 20899
Content-Type: multipart/signed; boundary="nextPart2057428.LAghpYxNlY";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2057428.LAghpYxNlY
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA 12 =D0=
=B8=D1=8E=D0=BB=D1=8F 2010 10:49:35 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Roman I =
Khimov =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Automatic dependency extraction script made some errors thus perl-modules
> wasn't installable.
>=20
>  * s/perl-module-encode-kr-2022_kr/perl-module-encode-kr-2022-kr/
>  * perl-module-your-module-here came from example in script, dropped it
>  *
>  s/perl-module-cpan-exception-yaml_not_installed/perl-module-cpan-excepti=
on
> -yaml-not-installed/ * perl-module-dbd-sqlite - not part of standard perl,
>  provided by libdbd-sqlite * perl-module-dbix-simple - same as above,
>  provided by libdbix-simple
>=20
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> ---
>  recipes/perl/perl-rdepends_5.10.1.inc |   23 +++++++++++------------
>  recipes/perl/perl_5.10.1.bb           |    2 +-
>  2 files changed, 12 insertions(+), 13 deletions(-)

Please, ignore this one too, as it's exactly the same as previous, really=20
updated one is on the way.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2057428.LAghpYxNlY
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkw6u+MACgkQXJ70z+XgVcNVDQCgiWbOcbYkaeS6kSTvEpKk2iQG
7koAn0qnxddEqy04ezwMZI3Mq9Owzg93
=tDck
-----END PGP SIGNATURE-----

--nextPart2057428.LAghpYxNlY--
