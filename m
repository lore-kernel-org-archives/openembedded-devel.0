Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KOfUI-0005BN-6z
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jul 2008 23:15:06 +0200
Received: (qmail invoked by alias); 31 Jul 2008 21:13:16 -0000
Received: from e178116172.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.116.172]
	by mail.gmx.net (mp029) with SMTP; 31 Jul 2008 23:13:16 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18d54tdu9AdQ1OLSNwa31iLndWUF5C4t4AxLSKl/V
	bzYhN7KTfiy8ZL
Message-ID: <48922B37.9070807@gmx.net>
Date: Thu, 31 Jul 2008 23:14:31 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4892166E.2050206@gmx.net>
In-Reply-To: <4892166E.2050206@gmx.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.67
Subject: Re: RFC: I want my <asm/ucontext.h>
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 31 Jul 2008 21:15:06 -0000
X-Groupsio-MsgNum: 5675
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig9BE4CF4CFBD255E89F8533AB"

--------------enig9BE4CF4CFBD255E89F8533AB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
forget these patches. asm/ucontext.h isnt needed so much. Newer Debian's
do not have it also.

I modified the source file to include <ucontext.h> (from glibc) instead
and this works without problems.

Regards
Robert

Robert Schuster schrieb:
> Hi,
> I am currently writing a recipe for Sun's phoneme and this wants to
>=20
> #include <asm/ucontext.h>
>=20
> Unfortunately this file is not part of our newer linux-libc-header
> packages anymore. The problem is as follows:
>=20
> In the recipes for versions earlier than 2.6.18 we copied the kernel's
> include/asm-$ARCH/ files manually. In later kernels we relied upon 'mak=
e
> install_headers'. Now the kernels Kbuild files do not mention ucontext.=
h
> and as such it is not installed.
>=20
> In the attached patch I added the installation of ucontext.h for all
> newer linux-libc-headers recipes.
>=20
> Please write if that is OK for .dev.
>=20
> Regards
> Robert
>=20
>=20
> -----------------------------------------------------------------------=
-
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--------------enig9BE4CF4CFBD255E89F8533AB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkiSKzcACgkQG9cfwmwwEtqsOgCfZ35FbjgaeX9dfekPaJQg9D+G
mCgAn13WxCfuXPb01JRMWldkmRcsvaWd
=9Za7
-----END PGP SIGNATURE-----

--------------enig9BE4CF4CFBD255E89F8533AB--
