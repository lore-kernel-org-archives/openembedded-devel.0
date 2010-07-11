Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OXqeP-00008H-No
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 09:08:53 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OXqZV-0007Do-LW
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 11:03:30 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Jul 2010 11:03:11 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <AANLkTikEL9I5aLtumdNbBArvcOKbgV1x-Smm9dsOjS00@mail.gmail.com>
In-Reply-To: <AANLkTikEL9I5aLtumdNbBArvcOKbgV1x-Smm9dsOjS00@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201007111103.21110.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Cannot satisfy the following dependencies for task-sdk-native with perl 5.10.1
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
X-List-Received-Date: Sun, 11 Jul 2010 07:08:55 -0000
X-Groupsio-MsgNum: 20863
Content-Type: multipart/signed; boundary="nextPart2249291.pDC1i14KLA";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2249291.pDC1i14KLA
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 11 =D0=
=B8=D1=8E=D0=BB=D1=8F 2010 07:14:58 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj=
 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> I was daring to use perl 5.10.1 and ended up in this error
>=20
> |  * satisfy_dependencies_for: Cannot satisfy the following
>=20
> dependencies for task-sdk-native:
> |  *    perl-module-encode-kr-2022_kr *
>=20
> perl-module-your-module-here *
> perl-module-cpan-exception-yaml_not_installed *
> perl-module-dbd-sqlite *        perl-module-dbix-simple *
>=20
>=20
>=20
> when generating the final root file system.

Looks like automatic perl dependency extractor found more than is needed.=20
These dependencies are written in recipes/perl/perl-rdepends_5.10.1.inc, I'=
ve=20
just checked perl-module-your-module-here and it's obviously coming from=20
example in perl-module-cpanplus-internals-constants-report. Never installed=
=20
whole perl-modules, so didn't see this.

I'll prepare a patch.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2249291.pDC1i14KLA
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkw5bLkACgkQXJ70z+XgVcOueQCfQ7P8GXt1ADkQOeIp4ZX46PN+
mAMAoN4kSh5hDIkevT8eXwxY9Yab4zf6
=kCHT
-----END PGP SIGNATURE-----

--nextPart2249291.pDC1i14KLA--
