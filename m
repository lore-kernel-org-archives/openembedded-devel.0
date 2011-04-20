Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QCWW6-0006fT-CI
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 14:28:22 +0200
Received: by fxm19 with SMTP id 19so438939fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 05:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=b+sokTNdZd/irrdGMvxEwoKVgllgrDrb3cL9NFZk28g=;
	b=QCiEyadrwtwf2ZXuWfs43OvlZ8TJO8c0VdPGZtZAYtniDTEgaRmrF/m1LQoEt33tRe
	PbRdF1DXGDO1MBuHmk2NNc1MQIgYILTleNF0KkOt9FEuT+sYCltYd8Ie+f0Ln8WDHQI9
	CY5jc2OJ31TmQY+tCvEsmhHsS1aPXVII2s9rQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=U+x00U3AyRvdVyhfxjZhgB2/7ag3LzhiuwLO/ww9s6mLCq2V7ANtMkFjKP0wA6HT8S
	/Bhj54RSCbFqJTDmhDPUwhYMj1hmZ3b4RocyCjOPJwMj22QbTlDZID3o5c8f8v5Gulc/
	eaRuFg+Y57m8yd8dMmNVY4RUjznZS8txqLjAI=
Received: by 10.223.57.5 with SMTP id a5mr2022683fah.90.1303302359243;
	Wed, 20 Apr 2011 05:25:59 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j12sm275121fax.9.2011.04.20.05.25.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 05:25:58 -0700 (PDT)
Date: Wed, 20 Apr 2011 14:25:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110420122557.GJ5675@jama.jama.net>
References: <201104200130.49444.patda293@student.liu.se>
MIME-Version: 1.0
In-Reply-To: <201104200130.49444.patda293@student.liu.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: libnl1-1.1-r5 static libs leads to syntax errors in nmap-3.81
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
X-List-Received-Date: Wed, 20 Apr 2011 12:28:22 -0000
X-Groupsio-MsgNum: 31366
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o71xDhNo7p97+qVi"
Content-Disposition: inline

--o71xDhNo7p97+qVi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2011 at 01:30:49AM +0200, Patrik Dahlstr=F6m (student) wrot=
e:
> If libnl1-1.1-r5 is built with only static libs, the configure script of=
=20
> nmap-3.81 will fail to find a usable pcap and fall back on its own=20
> implementation (libpcap-possiblymodified). The configure script of that=
=20
> implementation suffers from syntax errors that I never managed to fix.
> Here is a excerpt from config.log of nmap-3.81:

Hi,

please check if there is newer nmap/pcap supporting libnl-2 and if no,
then try to fix static build like here:
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D154bd72b1ca8=
59afcae5ed4fe99ed611a13a475c
or
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D849389a02126=
e3e3bb6b8ca8e26068c386ef699c

and the problem seems to be in pcap not nmap

Regards,

> ...
> configure:4570: arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3D=
cortex-a8=20
> -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --
> sysroot=3D/home/bitbake/build/tmp_beagleboard/sysroots/armv7a-angstrom-li=
nux-
> gnueabi -o conftest -fexpensive-optimizations -fomit-frame-pointer -frena=
me-
> registers -O2 -ggdb2 -Drecvfrom6_t=3Dsocklen_t -
> L/home/bitbake/build/tmp_beagleboard/sysroots/armv7a-angstrom-linux-
> gnueabi/usr/lib/../lib -Wl,-O1 -Wl,--hash-style=3Dgnu conftest.c -lpcap  =
-lm =20
> >&5
> /home/bitbake/build/tmp_beagleboard/sysroots/x86_64-
> linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-
> angstrom-linux-gnueabi/bin/ld: warning: libnl.so.1, needed by=20
> /home/bitbake/build/tmp_beagleboard/sysroots/armv7a-angstrom-linux-
> gnueabi/usr/lib/../lib/libpcap.so, not found (try using -rpath or -rpath-=
link)
> ...
>=20
> If I removed build.only.static.lib.patch from the libnl1-1.1 recipe, the=
=20
> missing libnl.so.1.1 shared lib would be built and installed and successi=
vely=20
> nmap-3.81 would build and install fine.
>=20
> --=20
> MvH / with best regards
> Patrik Dahlstr=F6m
>=20
> "Every animal, except man, knows that the fundamental meaning of life is =
to=20
> enjoy it" --Samuel Butler
>=20
> ()  ascii ribbon campaign - against html e-mail=20
> /\  www.asciiribbon.org   - against proprietary attachments
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--o71xDhNo7p97+qVi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2u0NUACgkQN1Ujt2V2gBzYvQCgpN2l0c031BG9KZ4Zcix6BPKS
zC8An0u7kLn8+bvKuaQDjMYvsfHvZCed
=IoUS
-----END PGP SIGNATURE-----

--o71xDhNo7p97+qVi--
