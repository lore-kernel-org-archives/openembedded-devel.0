Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KSoXc-0003zS-89
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Aug 2008 09:43:40 +0200
Received: (qmail invoked by alias); 12 Aug 2008 07:43:07 -0000
Received: from e178072149.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.72.149]
	by mail.gmx.net (mp025) with SMTP; 12 Aug 2008 09:43:07 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+wh/M1ps6ws124Dm5SmRMo/PZqoaHi10sdKGtbry
	b/CJn3Gz8cRoo8
Message-ID: <48A13F74.2050909@gmx.net>
Date: Tue, 12 Aug 2008 09:44:52 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48A13D3B.6040302@gmx.net>
In-Reply-To: <48A13D3B.6040302@gmx.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.62
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
X-List-Received-Date: Tue, 12 Aug 2008 07:43:40 -0000
X-Groupsio-MsgNum: 5726
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigFCFA09100C5FD4A0AE20F7EB"

--------------enigFCFA09100C5FD4A0AE20F7EB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Robert Schuster schrieb:
> 5) linux
> This is only important if you want to boot from SD/MCC like me. The
> defconfig should say that ext2 or 3 (or both) is built-in. Otherwise yo=
u
> cannot boot from such a filesystem.
Just in case someone wants to know how to do this. I use these commands:

mmcinit
ext2load mmc 0:1 0x10300000 /boot/uImage
set bootargs console=3DttyS0 root=3D/dev/mmcblk0p1 rootdelay=3D1
bootm 0x10300000

"rootdelay=3D1" is important because otherwise the mmc card is not yet
available.

One can save a lot of typing by putting the above commands into a
variable and run them later.

Enter "askenv mmcboot"
Paste the commands:
mmcinit;ext2load mmc 0:1 0x10300000 /boot/uImage;set bootargs
console=3DttyS0 root=3D/dev/mmcblk0p1 rootdelay=3D1;bootm 0x10300000

(<Enter>)
Run "saveenv".

Later on run the commands by entering "run mmcboot".

Regards
Robert


--------------enigFCFA09100C5FD4A0AE20F7EB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkihP3QACgkQG9cfwmwwEto1AgCbBC+8PxftgVeea9a7/DriZ1+D
Tg4AoJaV/HNPOVKMxKmMR0EE9D+uIj7e
=aQdK
-----END PGP SIGNATURE-----

--------------enigFCFA09100C5FD4A0AE20F7EB--
