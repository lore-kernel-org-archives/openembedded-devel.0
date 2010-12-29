Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PY2CF-0004fd-Sp
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 21:00:33 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PY2C0-0007WH-KU
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 23:00:17 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Dec 2010 23:00:10 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
	<201012291440.41718.roman@khimov.ru>
	<AANLkTikGTvYHsy=NDv10evW0UM_f=trvpVZZSub_pJhZ@mail.gmail.com>
In-Reply-To: <AANLkTikGTvYHsy=NDv10evW0UM_f=trvpVZZSub_pJhZ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201012292300.14843.roman@khimov.ru>
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
X-List-Received-Date: Wed, 29 Dec 2010 20:00:33 -0000
X-Groupsio-MsgNum: 27568
Content-Type: multipart/signed; boundary="nextPart56271760.H7stZU4iRZ";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart56271760.H7stZU4iRZ
Content-Type: Text/Plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

=F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F3=D2=C5=C4=C1 29 =C4=C5=CB=C1=C2=
=D2=D1 2010 21:42:33 =C1=D7=D4=CF=D2 Frans Meulenbroeks=20
=CE=C1=D0=C9=D3=C1=CC:
> I now get:
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
> I do have EXTERN.h:
> sysroots/i686-linux/usr/lib/perl/5.10.1/CORE/EXTERN.h
> sysroots/armv5te-oe-linux-gnueabi/usr/lib/perl/5.10.1/CORE/EXTERN.h
>
> What I find worrying (and probably wrong) is:
> -I/usr/lib/perl/5.10/CORE
> I don't expect host dirs in and arm gcc command.

Perl never stops surprising me.

I have exactly the same wrong include but it seems that Debian lenny is=20
exactly old enough for it to work with build includes. Argh. I've found=20
suspicious internal perl incantations and testing the fix currently.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart56271760.H7stZU4iRZ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0bk04ACgkQXJ70z+XgVcN9OQCcDtgJo+YJQhuP5/7yr0QyCWBR
DiUAoNdP2rWr8zdYKBfvVQUnwldwWSKo
=eIIc
-----END PGP SIGNATURE-----

--nextPart56271760.H7stZU4iRZ--
