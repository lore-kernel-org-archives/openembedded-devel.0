Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LKMYy-00008K-8y
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jan 2009 01:46:24 +0100
Received: (qmail invoked by alias); 07 Jan 2009 00:40:20 -0000
Received: from e177085050.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.177.85.50]
	by mail.gmx.net (mp068) with SMTP; 07 Jan 2009 01:40:20 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19nihpHYxFnAmfC5n7iOaSkdttRKTMP4Dom4ANk4H
	TVgmC3h4uKS7pM
Message-ID: <4963FA4A.8070001@gmx.net>
Date: Wed, 07 Jan 2009 01:41:46 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.17 (X11/20081018)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4963E58A.5080505@gmx.net>
In-Reply-To: <4963E58A.5080505@gmx.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.46
Subject: Re: wrongly populated image
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
X-List-Received-Date: Wed, 07 Jan 2009 00:46:24 -0000
X-Groupsio-MsgNum: 7134
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigFB2574CC3D8C0ED877888E77"

--------------enigFB2574CC3D8C0ED877888E77
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Robert Schuster schrieb:
> 1)
> Whenever OE wants to build angstrom-feed-configs I get the following bi=
g
> python error:
>=20
> ERROR: Error in executing:
> /home/rob/oe/org.openembedded.dev/packages/angstrom/angstrom-feed-confi=
gs.bb
> ERROR: Exception:<type 'exceptions.TypeError'>
> Message:do_split_packages() got an unexpected keyword argument 'allow_l=
inks'
> ERROR: Printing the environment of the function
> ERROR: 	0001:def populate_packages():
> ERROR: 	0002:	etcdir =3D bb.data.expand('${sysconfdir}/opkg', d)
> ERROR: 	0003:	do_split_packages(d, etcdir, '^locale-(.*)\.conf$',
> 'angstrom-locale-%s-config', 'Angstrom feed config for the %s locale',
> extra_depends=3D'', allow_links=3DTrue)
> ERROR: 	0004:	import glob, stat, errno, re
> ERROR: 	0005:
> ERROR: 	0006:	workdir =3D bb.data.getVar('WORKDIR', d, 1)
> ERROR: 	0007:	if not workdir:
>=20
> I am not a python expert but this looks as if the function arguments ar=
e
> used by names. However I see nothing special about 'allow_links' so I
> wonder why it fails with this one. I am running this on a Debian
> GNU/Linux amd64 box. Python is 2.5.2 if that helps.
>=20
> I can get around this problem by temporarily declaring allow_links=3DTr=
ue
> in package.bbclass and remove that same string from the
> do_split_packages call in angstrom-feed-configs.
>=20
> This brought me to the next problem:
>=20
> 2)
> However booting fails because there is no 'init' executable on the
> image. Upon inspection of *-x11-image-*-testlab/installed-packages.txt =
I
> see that there is no busybox on the image. Also other important stuff
> like the kernel and dropbear/openssh-sshd is missing. On the other hand=

> my new 'openjdk-6-jre' package is on the filesystem although I have
> never asked to anyone to do this.
Cool, this patch fixed problem 2:

Module: openembedded.git
Branch: org.openembedded.dev
Commit: 9b1666b54a8474a8a95603726b634c071a1ec6ce
URL:
http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=3D9b166=
6b54a8474a8a95603726b634c071a1ec6ce

Author: Koen Kooi <koen@openembedded.org>
Date:   Wed Jan  7 00:46:05 2009 +0100

task-base: bump PR


Regards
Robert


--------------enigFB2574CC3D8C0ED877888E77
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAklj+k0ACgkQG9cfwmwwEtoSfACeJV5AENJeGVGaolpTeJ1DMhVn
rB8AoIFi/t2OU9mW4G8r4Gqy4WC7yj5O
=8tI3
-----END PGP SIGNATURE-----

--------------enigFB2574CC3D8C0ED877888E77--
