Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LSSkD-0005in-7u
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jan 2009 09:59:48 +0100
Received: (qmail invoked by alias); 29 Jan 2009 08:51:46 -0000
Received: from e178080184.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.80.184]
	by mail.gmx.net (mp061) with SMTP; 29 Jan 2009 09:51:46 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18B224/6f0BcyE4Bv1DTY/xOLpPBslFc/iAgJpL8i
	Esb7xhzQ7hkwQ+
Message-ID: <49816E98.7080508@gmx.net>
Date: Thu, 29 Jan 2009 09:53:44 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6
Subject: building OE for an amd64 machine
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
X-List-Received-Date: Thu, 29 Jan 2009 09:00:02 -0000
X-Groupsio-MsgNum: 7476
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig8381A590AD50890CFDD248B4"

--------------enig8381A590AD50890CFDD248B4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I want to build packages with OE that can run on my AMD64 system. As
such I started a machine configuration and a CPU tune file.

At first everything looks good but when glibc-initial is about to
compiled it wants to include some header file from the kernel headers
(asm-x64-64/socket.h) and cannot find it.

The strange thing is that linux-libc-headers is not installed into any
of the staging directories.

Well, it is basically my first shot at a new machine configuration. :)

I created a user branch for the amd64 support and committed those two
patches to it:

http://cgit.openembedded.net/cgit.cgi?url=3Dopenembedded/commit/&h=3Drobe=
rtschuster/amd64-target&id=3D20a70182e0ab8b6fad5381ea797123c6d6478dc4
http://cgit.openembedded.net/cgit.cgi?url=3Dopenembedded/commit/&h=3Drobe=
rtschuster/amd64-target&id=3D6441c620a7e13d6a6f1be4fe54bf1fb7fc3e6dc5
http://cgit.openembedded.net/cgit.cgi?url=3Dopenembedded/commit/&h=3Drobe=
rtschuster/amd64-target&id=3D0aeb635f90e332cfb65725147dd1f78a30b9f079

I am grateful about any help to get this to work.

Regards
Robert


--------------enig8381A590AD50890CFDD248B4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkmBbpsACgkQG9cfwmwwEtpipwCfTIpPnr0dA0/1YDvkpEHtOkO2
knYAoIdfXY4Yd6hmVSIbqG3N3fM/NBF4
=eu7M
-----END PGP SIGNATURE-----

--------------enig8381A590AD50890CFDD248B4--
