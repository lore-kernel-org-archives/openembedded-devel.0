Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KSoOR-0003hf-CG
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Aug 2008 09:34:11 +0200
Received: (qmail invoked by alias); 12 Aug 2008 07:33:39 -0000
Received: from e178072149.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.72.149]
	by mail.gmx.net (mp044) with SMTP; 12 Aug 2008 09:33:39 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+2aBA2Dh22nKzcqazwsTrcfMWy04jB7+sJPGNksQ
	0TzzqOV0mXBBhc
Message-ID: <48A13D3B.6040302@gmx.net>
Date: Tue, 12 Aug 2008 09:35:23 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6
Subject: outstanding avr32 issues (and their workarounds)
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
X-List-Received-Date: Tue, 12 Aug 2008 07:34:11 -0000
X-Groupsio-MsgNum: 5725
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig3DF87DC98CFD7AB3EB159B5B"

--------------enig3DF87DC98CFD7AB3EB159B5B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
for the last 4 days or so I am trying to build Angstrom 2008.1 (uclibc)
for Atmel's NGW100 board featuering an AVR32 CPU.

I have not been able to boot the image I built with OE yet but these are
the issues I encountered so far:

1) binutils-cross 2.17
Something is b0rken with the configure script code that puts the
arguments to configure into a variable. The variable contains
environment variables. This in turn causes the binutils build to fail
afterwards. There is a workaround which does a little bit of sed magic
on the generated Makefile. This fixes the wrong variable and lets the
build succeed.

2) gcc-cross 4.2.2
When the objective c language is enabled the build of gcc-cross will
fail because the compiler crashes when compiling some objective c source
file.
I have not examined this in detail. Maybe this is fixable with a patch
to gcc.

3) util-linux-ng 2.14 (when building console-image)
Needs UCLIBC_HAS_PROGRAM_INVOCATION_NAME=3Dy in uclibc.distro.

4) console-image
When the rootfs is generated it will fail with:

Collected errors:
 * ERROR: Cannot satisfy the following dependencies for task-base-extende=
d:
   *  libgcc *

There is no libgcc package because it is empty and OE normally does not
create empty packages. Unfortunately I am not experienced enough with
uclibc to say why there are no files for libgcc nor do I understand why
some package requests it. I did a very dirty workaround by declaring
ALLOW_EMPTY =3D "1" in gcc-cross.inc

and optional:

5) linux
This is only important if you want to boot from SD/MCC like me. The
defconfig should say that ext2 or 3 (or both) is built-in. Otherwise you
cannot boot from such a filesystem.

--

Update! Although I needed evil dirty workaround the image is fine and boo=
ts:

The Angstrom Distribution atngw100 ttyS0



Angstrom 2008.1-test-20080810 atngw100 ttyS0



atngw100 login: root

root@atngw100:~# uname -a

Linux atngw100 2.6.24.3.atmel.3 #1 Tue Aug 12 09:11:56 CEST 2008 avr32
unknown

--

I hope that we can fix all the issues so people can build images for the
AVR32 systems without trouble. In the meantime people can use the
information herein to get their builds succeed.

Regards
Robert


--------------enig3DF87DC98CFD7AB3EB159B5B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkihPTwACgkQG9cfwmwwEtqFWwCfRmovph/0LkLXTCiNVKGN0kOp
4A4AnR5S/qHhnD+X+lb67h/+5U9rlozq
=7zmg
-----END PGP SIGNATURE-----

--------------enig3DF87DC98CFD7AB3EB159B5B--
