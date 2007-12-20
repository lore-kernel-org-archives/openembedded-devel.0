Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1J59E0-0002zE-I0
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2007 01:25:20 +0100
Received: (qmail invoked by alias); 20 Dec 2007 00:20:15 -0000
Received: from e178077011.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.77.11]
	by mail.gmx.net (mp031) with SMTP; 20 Dec 2007 01:20:15 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+edVQvapGexUi3wLQkI+67lnFlzj2Jlgxpnm5YLA
	Eueq5Adnf+pRju
Message-ID: <4769B536.4020600@gmx.net>
Date: Thu, 20 Dec 2007 01:20:06 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: RFC: java toolchain recipes
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
X-List-Received-Date: Thu, 20 Dec 2007 00:25:20 -0000
X-Groupsio-MsgNum: 3704
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig24466CB8D787BA2FBFB6F04D"

--------------enig24466CB8D787BA2FBFB6F04D
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,
I reworked my initial java toolchain recipes and have provided a
complete patch that adds all of the necessary bits to built a
Java5-compatible toolchain completely from source.

Patch and extensive information about the approach can be found here:
http://bugs.openembedded.org/show_bug.cgi?id=3D2523

Please comment!

The next step after this patch will be
 * removing outdated Java runtime and class library recipes and
replacing them with new ones
 * adjusting existing java recipes to use the new toolchain (also
removing things like ecj-native which currently downloads a binary!)

Regards
Robert


--------------enig24466CB8D787BA2FBFB6F04D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHabU5G9cfwmwwEtoRCLB0AJ9Fq9Y7M01b3iwWeKhCPDMELlLUeACfRixc
vrxDQ2N8eAMCudroxrZ4TWU=
=FCqs
-----END PGP SIGNATURE-----

--------------enig24466CB8D787BA2FBFB6F04D--
