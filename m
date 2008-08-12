Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KSyEg-00047S-6f
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Aug 2008 20:04:47 +0200
Received: (qmail invoked by alias); 12 Aug 2008 18:04:12 -0000
Received: from e178072149.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.72.149]
	by mail.gmx.net (mp050) with SMTP; 12 Aug 2008 20:04:12 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/LwtFxKzbLshgWAf9KSMIynzI5dqfbnP2yrmL75e
	SnlfL2/8T7GCNX
Message-ID: <48A1D100.8070102@gmx.net>
Date: Tue, 12 Aug 2008 20:05:52 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.66
Subject: oprofile updates
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
X-List-Received-Date: Tue, 12 Aug 2008 18:04:48 -0000
X-Groupsio-MsgNum: 5738
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig7D7C6F8EB67F6B05D021CDD5"

--------------enig7D7C6F8EB67F6B05D021CDD5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
as you might have seen I committed a patch for oprofile 0.9.3 and added
0.9.4.

0.9.3 was applying a patch that adds armv7 support but the CPU event
files were not distributed because the patch modified a Makefile.in
(which was overwritten since OE does autogen.sh/autoreconf).

To my surprise the armv7 patch is still needed for 0.9.4 (although it
was created months ago). So I adjusted it for this version.

Oprofile 0.9.4 is interesting because it
 - supports the avr32 CPUs
 - provides libopagent

The latter is hot stuff for JIT compilers: With the library you can tell
oprofile that a JIT-created area of machine code has a certain name.
With the name and the instruction sequence itself oprofile can then
provide the same level of detailed information as it provides for normal
C and C++ functions.

Needless to say I would be happy if oprofile 0.9.4 could make it into
angstrom 2008.1. :)

Regards
Robert


--------------enig7D7C6F8EB67F6B05D021CDD5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkih0QUACgkQG9cfwmwwEtrIkQCfZ8oBwC0/9/b8/YAo2bKjIjzE
Yd4Ani7alONn6Ec/McCTSP1jri5dWIZJ
=ih6w
-----END PGP SIGNATURE-----

--------------enig7D7C6F8EB67F6B05D021CDD5--
