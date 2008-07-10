Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KGwf2-0001MH-1x
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jul 2008 15:58:16 +0200
Received: (qmail invoked by alias); 10 Jul 2008 13:58:00 -0000
Received: from e178089121.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.89.121]
	by mail.gmx.net (mp041) with SMTP; 10 Jul 2008 15:58:00 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18B7sMzZ6oBDqD+6eTJODOpw+OZB7hPYYtrt2nOWK
	QR8DgbhaJbwB/K
Message-ID: <48761569.4080304@gmx.net>
Date: Thu, 10 Jul 2008 15:58:01 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.75
Subject: prevent -O0 for glibc builds?
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
X-List-Received-Date: Thu, 10 Jul 2008 13:58:16 -0000
X-Groupsio-MsgNum: 5482
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig99211DCA9C1E5CE803262C23"

--------------enig99211DCA9C1E5CE803262C23
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
recently I set the (debug) optimization flags to "-g -O0" (=3D really
no-optimization and full debug infos) and got an error from the glibc
builds because glibc's configury told me that it cannot be compiled with
no optimization.

Would it be possible that the glibc recipes replace -O0 with something
else and print a note about this instead of failing? The reason is that
the current behavior prevents me from compiling a whole image without
optimization.

The reason I want -O0 in the first place is that while debugging an
executable gdb told me that certain variables where optimized out.

Regards
Robert




--------------enig99211DCA9C1E5CE803262C23
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIdhVpG9cfwmwwEtoRCMMtAJ9L1R+xXqNmfo5H1F16+1q6Utvq4QCdF+ZZ
vfogYaBDguaLMZJJ2sqFPTM=
=xUMm
-----END PGP SIGNATURE-----

--------------enig99211DCA9C1E5CE803262C23--
