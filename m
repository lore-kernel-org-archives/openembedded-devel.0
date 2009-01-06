Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LKLBN-0004s1-Q7
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jan 2009 00:17:57 +0100
Received: (qmail invoked by alias); 06 Jan 2009 23:11:53 -0000
Received: from e177085050.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.177.85.50]
	by mail.gmx.net (mp044) with SMTP; 07 Jan 2009 00:11:53 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/QL2cnLBXQU9yxCTof0QPIc1I/LQugvLki4MKUv7
	U7f1UoCJ07e6cH
Message-ID: <4963E58A.5080505@gmx.net>
Date: Wed, 07 Jan 2009 00:13:14 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.17 (X11/20081018)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.48
Subject: wrongly populated image
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
X-List-Received-Date: Tue, 06 Jan 2009 23:17:57 -0000
X-Groupsio-MsgNum: 7132
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigC3D11818429AEA79B600D582"

--------------enigC3D11818429AEA79B600D582
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I have two problems with current OE. I am not sure if they are related
so I explain both. I am using the latest revision of bitbake-1.8 from
SVN and am building angstrom for the beagleboard.

1)
Whenever OE wants to build angstrom-feed-configs I get the following big
python error:

ERROR: Error in executing:
/home/rob/oe/org.openembedded.dev/packages/angstrom/angstrom-feed-configs=
=2Ebb
ERROR: Exception:<type 'exceptions.TypeError'>
Message:do_split_packages() got an unexpected keyword argument 'allow_lin=
ks'
ERROR: Printing the environment of the function
ERROR: 	0001:def populate_packages():
ERROR: 	0002:	etcdir =3D bb.data.expand('${sysconfdir}/opkg', d)
ERROR: 	0003:	do_split_packages(d, etcdir, '^locale-(.*)\.conf$',
'angstrom-locale-%s-config', 'Angstrom feed config for the %s locale',
extra_depends=3D'', allow_links=3DTrue)
ERROR: 	0004:	import glob, stat, errno, re
ERROR: 	0005:
ERROR: 	0006:	workdir =3D bb.data.getVar('WORKDIR', d, 1)
ERROR: 	0007:	if not workdir:

I am not a python expert but this looks as if the function arguments are
used by names. However I see nothing special about 'allow_links' so I
wonder why it fails with this one. I am running this on a Debian
GNU/Linux amd64 box. Python is 2.5.2 if that helps.

I can get around this problem by temporarily declaring allow_links=3DTrue=

in package.bbclass and remove that same string from the
do_split_packages call in angstrom-feed-configs.

This brought me to the next problem:

2)
I want to build a bootable image. I chose a rather small one and
everything looks fine when doing 'bitbake x11-image' (=3D no errors). I
get a my .tar file and unpack it on an SD card (like I did many times
before).
However booting fails because there is no 'init' executable on the
image. Upon inspection of *-x11-image-*-testlab/installed-packages.txt I
see that there is no busybox on the image. Also other important stuff
like the kernel and dropbear/openssh-sshd is missing. On the other hand
my new 'openjdk-6-jre' package is on the filesystem although I have
never asked to anyone to do this.

Anyone having an idea what could have gone wrong here?

Regards
Robert



--------------enigC3D11818429AEA79B600D582
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAklj5YwACgkQG9cfwmwwEtpVNQCgh9N1i5WH2Byt+MDi85W2oz8F
G0cAn3EY6hqCJ84P2RGRxxZ9DTuZgGKZ
=+MsW
-----END PGP SIGNATURE-----

--------------enigC3D11818429AEA79B600D582--
