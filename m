Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PY2pQ-0005C0-8j
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 21:41:00 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PY2p8-0007aE-6M
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 23:40:46 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Dec 2010 23:40:35 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTikGTvYHsy=NDv10evW0UM_f=trvpVZZSub_pJhZ@mail.gmail.com>
	<AANLkTi=bnk_A_hg0G60gm7CEeKo0CXLK7E3AutR-Cc+c@mail.gmail.com>
In-Reply-To: <AANLkTi=bnk_A_hg0G60gm7CEeKo0CXLK7E3AutR-Cc+c@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201012292340.40618.roman@khimov.ru>
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
X-List-Received-Date: Wed, 29 Dec 2010 20:41:00 -0000
X-Groupsio-MsgNum: 27569
Content-Type: multipart/signed; boundary="nextPart2826105.19XVcndo9u";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2826105.19XVcndo9u
Content-Type: Text/Plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

=F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F3=D2=C5=C4=C1 29 =C4=C5=CB=C1=C2=
=D2=D1 2010 22:39:09 =C1=D7=D4=CF=D2 Frans Meulenbroeks=20
=CE=C1=D0=C9=D3=C1=CC:
> from
>  ./sysroots/i686-linux/usr/lib/perl/5.10.1/Config_heavy-arm-oe-linux-gnue=
ab
> i.pl
>=20
> api_versionstring=3D'5.10.0'        <--- note the .0 here

That is correct.

> archlib=3D'/usr/lib/perl/5.10'
> archlibexp=3D'/usr/lib/perl/5.10'
> privlib=3D'/usr/share/perl/5.10'
> privlibexp=3D'/usr/share/perl/5.10'

I've had an idea of patching ExtUtils::CBuilder directly to use installarch=
lib=20
instead of archlibexp, but thinking about it more and more it seems that it=
=20
would be better to directly patch this variables in Config-heavy-..., becau=
se=20
that file is only used for cross-compilation and for traditional (Makefile.=
PL)=20
build system PERL_INC, PERL_LIB and PERL_ARCHLIB are redefined in cpan-base=
=20
anyway for all build phases. Patching the config file would even allow to k=
ill=20
those redefinitions there some time in future.

Patch will follow.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2826105.19XVcndo9u
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0bnMgACgkQXJ70z+XgVcOx6wCguwfZy/aFcRi9AP33Vj6s9MKx
edkAn1xvsN8AyhfnvHItMdah9qGaT3CP
=AZx7
-----END PGP SIGNATURE-----

--nextPart2826105.19XVcndo9u--
