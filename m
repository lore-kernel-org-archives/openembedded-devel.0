Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LMvRJ-0001TH-GT
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jan 2009 03:25:05 +0100
Received: (qmail invoked by alias); 14 Jan 2009 02:18:30 -0000
Received: from e177084010.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.177.84.10]
	by mail.gmx.net (mp024) with SMTP; 14 Jan 2009 03:18:30 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19TBbc8TSpTrY997Fz/7e2wqDsvjYjvL2skZZ2dO7
	vmZTuIzQQmTyXj
Message-ID: <496D4B33.60102@gmx.net>
Date: Wed, 14 Jan 2009 03:17:23 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.55
Subject: "armv6" override not used
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
X-List-Received-Date: Wed, 14 Jan 2009 02:25:05 -0000
X-Groupsio-MsgNum: 7217
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig157D6FBACD9EC53BDCEFADAD"

--------------enig157D6FBACD9EC53BDCEFADAD

Hi,
I am building chinook-compat for the n800 when it comes to libffi the
successful build depends on this line:

TARGET_CC_ARCH_append_armv6 =3D " -D__SOFTFP__"

However the build fails because __SOFTFP__ isn't defined and bitbake -i
reveals:

BB>> peek libffi-2.0+gcc4.3.2 TARGET_CC_ARCH
SHELL: This command needs to parse bbfiles...
NOTE: Handling BitBake files: - (6521/6521) [100 %]
NOTE: Parsing finished. 0 cached, 6238 parsed, 283 skipped, 0 masked.

-march=3Darmv6j -mtune=3Darm1136jf-s -mfpu=3Dvfp -mfloat-abi=3Dsoftfp
-mno-thumb-interwork -mno-thumb
BB>>

It looks like something is wrong with the OVERRIDES variable. It has
this value:

local:nokia800:chinook-compat:linux-gnueabi:arm:build-linux:fail-fast:pn-=
libffi

Checking the same variable in an Angstrom build for the BeagleBoard
(armv7a - needs the same hack) it looks like this:

local:beagleboard:angstrom:linux-gnueabi:arm:build-linux:fail-fast:pn-lib=
ffi:armv7a

Something went wrong, but what?

Regards
Robert


--------------enig157D6FBACD9EC53BDCEFADAD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkltS9cACgkQG9cfwmwwEtqlJwCgnCTAfnHlJ1+HUmjfde2POUGd
m5EAn0qfqjvdDhast9FQzlmw7zthM6tP
=Xva0
-----END PGP SIGNATURE-----

--------------enig157D6FBACD9EC53BDCEFADAD--
