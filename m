Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PXqfT-0008NM-O3
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 08:41:55 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PXqej-0006cn-1G
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 10:41:10 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Dec 2010 10:41:00 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinj-pWTJfLqszpHVkN29McgpZ1Lidg8n-+V7RYo@mail.gmail.com>
	<AANLkTikKLawM78rC4mc2B4M2S2N1+eqa-9Tp9TS1M__5@mail.gmail.com>
In-Reply-To: <AANLkTikKLawM78rC4mc2B4M2S2N1+eqa-9Tp9TS1M__5@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201012291041.07466.roman@khimov.ru>
Subject: Re: [PATCH v3] cpan_build.bbclass; added cc and ld flags to the perl Build.PL invocation
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
X-List-Received-Date: Wed, 29 Dec 2010 07:41:55 -0000
X-Groupsio-MsgNum: 27554
Content-Type: multipart/signed; boundary="nextPart1497667.FOoVduvIXt";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1497667.FOoVduvIXt
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 29 =D0=B4=D0=B5=D0=BA=D0=B0=D0=B1=D1=80=D1=
=8F 2010 01:19:09 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Frans Meulenbroeks=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> After Roman pushed his patches, I tried again.
>=20
> It seems the proper compiler is invoked

Yep, just wanted to reply to previous mail that=20
264f7ab1f41cc86d29716619d67506c85223df71 might probably fix it.

> , but  this time I get a compiler error:
> | arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
>=20
> -mthumb-interwork -mthumb -Ic -I/usr/lib/perl/5.10/CORE
> -DXS_VERSION=3D"0.61" -DVERSION=3D"0.61" -fPIC -c
> -isystem/home/frans/oe/tmp_minimal/sysroots/armv5te-oe-linux-gnueabi/usr/=
in
> clude -fexpensive-optimizations -fomit-frame-pointer -frename-registers -=
O1
>  -DDEBIAN -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS
> -fno-strict-aliasing -pipe -O2 -o lib/DateTime.o lib/DateTime.c
>=20
> | lib/DateTime.xs:7:20: fatal error: EXTERN.h: No such file or directory
>=20
> Too late to investigate this now.

Well, time to deal with this kind of problem.

I've built libdatetime-perl for qemuarm/angstrom-2010.x yesterday with no=20
problems. Rebuilding perl, perl-native and libdatetime-perl now with fresh=
=20
pull from oe.dev and building with sheevaplug/minimal combination in parall=
el.=20
But it might be that clean build results would be different for=20
sheevaplug/minimal.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1497667.FOoVduvIXt
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0a5hMACgkQXJ70z+XgVcMs8ACgw8MHrpzjmmumS6P7IFrCOWLc
96EAoOUioURyWHrKNokmLTLDLrGUW3FF
=Itye
-----END PGP SIGNATURE-----

--nextPart1497667.FOoVduvIXt--
