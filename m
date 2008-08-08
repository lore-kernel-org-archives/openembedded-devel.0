Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KRMyy-0005IP-7v
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Aug 2008 10:06:00 +0200
Received: (qmail invoked by alias); 08 Aug 2008 08:05:41 -0000
Received: from e178068082.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.68.82]
	by mail.gmx.net (mp009) with SMTP; 08 Aug 2008 10:05:41 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+Wg3pK+GWWO77Bn6G1V9x3CaGwR4mSImRN1Ux/kf
	zja1AOVeuSS057
Message-ID: <489BFEB3.4060103@gmx.net>
Date: Fri, 08 Aug 2008 10:07:15 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
References: <48239d390808040638r7a5e6351x4c8346497451adae@mail.gmail.com>
	<48980E9D.8000709@gmx.net>
	<20080805124514.GA5131@doriath.ww600.siemens.net>
In-Reply-To: <20080805124514.GA5131@doriath.ww600.siemens.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: ppc64 host
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
X-List-Received-Date: Fri, 08 Aug 2008 08:06:21 -0000
X-Groupsio-MsgNum: 5713
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig7ACEA6DFE2F35A1167E12EBE"

--------------enig7ACEA6DFE2F35A1167E12EBE
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Dmitry Baryshkov schrieb:
> I'm building the OE images on the ppc64 host (Apple xServe G5):
> Debian lenny (current), 64-bit kernel, 32-bit userspace.
64 bit kernel + 32 bit userspace is calling for trouble. At one place
the autotools stuff will think it needs 64 bit pointers but the compiler
supports only 32 bit pointers.

I was once experiencing this problem on an x86_64 box with 64 bit kernel
and 32 bit userland.

> To successfully build packages for arm, I had to manually override
> BUILD_ARCH to be ppc (misdetected as ppc64) and disable binary locale
> generation (qemu segfaulted).
If possible try running a 32 bit kernel.

Regards
Robert


--------------enig7ACEA6DFE2F35A1167E12EBE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkib/rMACgkQG9cfwmwwEtoMgQCeJGbnCTB+qrq40dzaEj8fQspu
h5cAnRk5NZpLb/5QIAKqu3zpwDzBnndC
=GOSQ
-----END PGP SIGNATURE-----

--------------enig7ACEA6DFE2F35A1167E12EBE--
