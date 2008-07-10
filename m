Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KGw3x-0004B9-3s
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jul 2008 15:19:57 +0200
Received: (qmail invoked by alias); 10 Jul 2008 13:19:41 -0000
Received: from e178089121.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.89.121]
	by mail.gmx.net (mp056) with SMTP; 10 Jul 2008 15:19:41 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/T6Ko18PzTJOzKNfxlDh57lT3NtvciAtIBszsbxU
	/hkha2fCah/zpe
Message-ID: <48760C72.8090608@gmx.net>
Date: Thu, 10 Jul 2008 15:19:46 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080706092603.9E5F3189303@amethyst.openembedded.net>
In-Reply-To: <20080706092603.9E5F3189303@amethyst.openembedded.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.67
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [oe-commits] org.oe.dev glibc 2.6.1: change optimizations flags for	armv7a
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
X-List-Received-Date: Thu, 10 Jul 2008 13:19:57 -0000
X-Groupsio-MsgNum: 5480
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig8A1457D5282065E0F31A7A97"

--------------enig8A1457D5282065E0F31A7A97
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

koen commit schrieb:
> glibc 2.6.1: change optimizations flags for armv7a
> * If the rebuild fails in do_configure, build glibc-initial to get limi=
ts.h in a place where glibc can find it. Builds from scratch works great,=
 though

Just for the records

If you see this error:

checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc =
-E
configure: error: C preprocessor "arm-angstrom-linux-gnueabi-gcc -E"
fails sanity check
See `config.log' for more details.
FATAL: oe_runconf failed

you need to run:

bitbake -f -c fetch gcc-cross-initial && bitbake gcc-cross-initial

and then glibc intermediate to fix this.

In short rebuild gcc-cross-initial not glibc-initial. :)

Regards
Robert


--------------enig8A1457D5282065E0F31A7A97
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIdgxyG9cfwmwwEtoRCOEjAJ9bilj738QHFT19fhGZSleX3bvXHwCgiAh/
AZvyA4D5V91e2z+0Wo4T6n0=
=jqEc
-----END PGP SIGNATURE-----

--------------enig8A1457D5282065E0F31A7A97--
