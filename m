Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1Jliw8-0008L6-5v
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Apr 2008 13:03:04 +0200
Received: (qmail invoked by alias); 15 Apr 2008 11:02:48 -0000
Received: from e179076104.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.179.76.104]
	by mail.gmx.net (mp057) with SMTP; 15 Apr 2008 13:02:48 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+H8kwnF02H8oKC/QrAw14Vs9ILQ8ZYXKykMHWCLX
	4Dmecf915ufU6V
Message-ID: <48048B4C.5090805@gmx.net>
Date: Tue, 15 Apr 2008 13:02:36 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080415034950.982CC189218@amethyst.openembedded.net>
In-Reply-To: <20080415034950.982CC189218@amethyst.openembedded.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] org.oe.dev libtomcrypt: fix SRC_URI (close oebug 4159), bump to 1.17, fix staging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Apr 2008 11:04:12 -0000
X-Groupsio-MsgNum: 4961
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig5C2EED4893501D378697D7F7"

--------------enig5C2EED4893501D378697D7F7
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi.

xjqian commit schrieb:
> libtomcrypt: fix SRC_URI (close oebug 4159), bump to 1.17, fix staging

> * no idea why the previous maintainer leave do_install empty, but assum=
ing there is a legit reason.
I recently stumbled upon libtomcrypt in another project may provide an
answer to this: libtomcrypt can be customized in many ways and chances
are good that if you just compile and install the library with default
settings those are wrong for the package that wants to use it.

The library's source is usually directly put into the package that uses
it (see asterisk, OpenTNL) and I am wondering whether it really makes
sense to have it in OE as a package.

Regards
Robert


--------------enig5C2EED4893501D378697D7F7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIBItQG9cfwmwwEtoRCI3IAJ0Zy0n/VUKxLw22WFNbOrEwcDB2NACgnNfh
KHf+/IpqDkzUfBgBIKxcirs=
=v4sJ
-----END PGP SIGNATURE-----

--------------enig5C2EED4893501D378697D7F7--
