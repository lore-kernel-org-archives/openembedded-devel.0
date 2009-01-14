Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LN3WA-0001YR-0x
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jan 2009 12:02:38 +0100
Received: (qmail invoked by alias); 14 Jan 2009 10:56:01 -0000
Received: from e177084010.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.177.84.10]
	by mail.gmx.net (mp005) with SMTP; 14 Jan 2009 11:56:01 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19bfFk/VABbwIGMC1/sz/V1LUdDn8LRzoxZnbVdaM
	gQ10pJ/LvWkMNh
Message-ID: <496DC520.90601@gmx.net>
Date: Wed, 14 Jan 2009 11:57:36 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <496D4B33.60102@gmx.net> <gkk2ut$5m8$1@ger.gmane.org>
In-Reply-To: <gkk2ut$5m8$1@ger.gmane.org>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6
Subject: Re: "armv6" override not used
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
X-List-Received-Date: Wed, 14 Jan 2009 11:02:38 -0000
X-Groupsio-MsgNum: 7219
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig31518918F13626E72FD84CAE"

--------------enig31518918F13626E72FD84CAE
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Koen Kooi schrieb:
>> It looks like something is wrong with the OVERRIDES variable. It has
>> this value:
>>
>> local:nokia800:chinook-compat:linux-gnueabi:arm:build-linux:fail-fast:=
pn-=3D
>>
>> libffi
>>
>> Checking the same variable in an Angstrom build for the BeagleBoard
>> (armv7a - needs the same hack) it looks like this:
>>
>> local:beagleboard:angstrom:linux-gnueabi:arm:build-linux:fail-fast:pn-=
lib=3D
>>
>> ffi:armv7a
>>
>> Something went wrong, but what?
>=20
> Angstrom defines architecture overrides to make life easier for
> developers, other distros don't.
I see:

include/angstrom.inc:OVERRIDES .=3D ":${FEED_ARCH}"

Is that such a controversial feature? I think this should be part of all
distros.

Without this libffi breaks (on armv6 and arm7a) and in the future this
means that stuff like openjdk won't be buildable on these arches. :(

Regards
Robert


--------------enig31518918F13626E72FD84CAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkltxSIACgkQG9cfwmwwEtrHXwCfcwAH1ji9C3yDV96fbCd2gSli
jyQAn2E1g6NpTVUQZEsN2j1XeLrRKBw/
=ev3i
-----END PGP SIGNATURE-----

--------------enig31518918F13626E72FD84CAE--
