Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KSokQ-0004Gk-9u
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Aug 2008 09:56:54 +0200
Received: (qmail invoked by alias); 12 Aug 2008 07:56:22 -0000
Received: from e178072149.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.72.149]
	by mail.gmx.net (mp008) with SMTP; 12 Aug 2008 09:56:22 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18pXk9jvdQpujdIpaEhDmF3r+wFLIvXQCQwgzj/oP
	k/0rWGebqBGM5p
Message-ID: <48A1428F.3040009@gmx.net>
Date: Tue, 12 Aug 2008 09:58:07 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48A13D3B.6040302@gmx.net>
In-Reply-To: <48A13D3B.6040302@gmx.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.64
Subject: Re: outstanding avr32 issues (and their workarounds)
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
X-List-Received-Date: Tue, 12 Aug 2008 07:56:54 -0000
X-Groupsio-MsgNum: 5727
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig712F585C44F3B7931DBCD52B"

--------------enig712F585C44F3B7931DBCD52B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Robert Schuster schrieb:
> 3) util-linux-ng 2.14 (when building console-image)
> Needs UCLIBC_HAS_PROGRAM_INVOCATION_NAME=3Dy in uclibc.distro.
This one is fixed by now by an updated uclibc 0.2.29 recipe. If your
build has already run do_configure for util-linux-ng you need to 'clean'
or 'rebuild' it.

Regards
Robert


--------------enig712F585C44F3B7931DBCD52B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkihQo8ACgkQG9cfwmwwEtrObQCfWcZrI7wprCNyLKxePNl+PXRA
mkIAnj+7DbxprYntYbg6s45DXFrfhJNd
=khZX
-----END PGP SIGNATURE-----

--------------enig712F585C44F3B7931DBCD52B--
