Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KM40k-0005ft-Rn
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jul 2008 18:49:50 +0200
Received: (qmail invoked by alias); 24 Jul 2008 16:48:31 -0000
Received: from e178091018.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.91.18]
	by mail.gmx.net (mp048) with SMTP; 24 Jul 2008 18:48:31 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18LY3VQCgkL62zu1+QqkNSThIFLzMgwtm3/StUUVb
	SXU/0Mi8tfcJd1
Message-ID: <4888B297.5070701@gmx.net>
Date: Thu, 24 Jul 2008 18:49:27 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.7
Subject: compiling buildhelper programs
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
X-List-Received-Date: Thu, 24 Jul 2008 16:49:51 -0000
X-Groupsio-MsgNum: 5595
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig427AE380D378B5A19D62BD6F"

--------------enig427AE380D378B5A19D62BD6F
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I have a question regarding OE's build recipe policies. I am currently
creating a recipe for the Netscape Security Service library (libnss3-1d
on Debian) which builds a native 'nsinstall' binary.

Is it OK when the recipe provides the native CC via BUILD_CC to build
those helper binaries while at the same time TARGET_CC compiles the real
libraries and binaries or do we strictly want a separate -native recipe
that builds the helpers and injects them?

Regards
Robert


--------------enig427AE380D378B5A19D62BD6F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEUEAREIAAYFAkiIspcACgkQG9cfwmwwEtp0mgCghhxTNhc/EE6AOqdUPKXkqw1V
5PsAmNtfiCfQmGT9VAFh9GGxkCzs69k=
=uYpf
-----END PGP SIGNATURE-----

--------------enig427AE380D378B5A19D62BD6F--
