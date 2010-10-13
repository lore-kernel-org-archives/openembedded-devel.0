Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1P5tC4-0001R0-Nv
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 06:44:02 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1P5tBW-00055v-9W
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 08:43:30 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Oct 2010 08:43:18 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <AANLkTi=C+v2LfaXUuwTARn6hTmriWcUdBqKfq6pHPTAr@mail.gmail.com>
In-Reply-To: <AANLkTi=C+v2LfaXUuwTARn6hTmriWcUdBqKfq6pHPTAr@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201010130843.25124.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Libprelude fails on oe_runmake
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
X-List-Received-Date: Wed, 13 Oct 2010 04:44:02 -0000
X-Groupsio-MsgNum: 24757
Content-Type: multipart/signed; boundary="nextPart1428050.b1eOC0B2fQ";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1428050.b1eOC0B2fQ
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 12 =D0=BE=D0=BA=D1=82=D1=8F=D0=
=B1=D1=80=D1=8F 2010 23:18:13 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 J. L. =D0=BD=
=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> | In file included from
>=20
> /home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/lib/ruby/1.8/i686-lin=
ux
> /missing.h:16:0,
>=20
> |                  from
>=20
> /home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/lib/ruby/1.8/i686-lin=
ux
> /ruby.h:755,
>=20
> |                  from PreludeEasy.cxx:856:
> | ../../libmissing/sys/time.h:85:58: error: conflicting declaration
>=20
> 'void* restrict'
>=20
> | ../../libmissing/sys/time.h:85:42: error: 'restrict' has a previous
>=20
> declaration as 'timeval* restrict'
>=20
> | make[3]: *** [PreludeEasy_la-PreludeEasy.lo] Error 1
> | make[3]: Leaving directory

=46rom what I see it's Ruby bindings that fail for some reason, you may try=
 to=20
disable them if you don't specifically care about that.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1428050.b1eOC0B2fQ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAky1OOwACgkQXJ70z+XgVcNRJgCfRU0KU8dLeUeAal38ZVp5rSfe
5o8AoOB95KY7b/wsh9tTnmTvzOj/dzUC
=SM9k
-----END PGP SIGNATURE-----

--nextPart1428050.b1eOC0B2fQ--
