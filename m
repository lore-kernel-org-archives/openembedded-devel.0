Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QuYbq-0005Ja-0P for openembedded-devel@lists.openembedded.org;
	Sat, 20 Aug 2011 01:36:18 +0200
Received: from e178250247.adsl.alicedsl.de ([85.178.250.247]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QuYXV-0004QD-U8 for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 23:31:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110819223546.GA10255@golden>
References: <20110818131043.GC26690@golden>
	<1313689684.7918.2.camel@eng-phousel-ubuntu>
	<4E4E2DFB.5050106@cit-ec.uni-bielefeld.de>
	<4E4E62AB.1050603@balister.org>
	<4E4E7416.1070105@gmail.com> <20110819210316.GB3730@golden>
	<CAMKF1squXK1aVRy7pHtL_X9niEn6_pJiuTMao8Dd_32o042YEA@mail.gmail.com>
	<20110819223546.GA10255@golden>
Date: Sat, 20 Aug 2011 01:31:33 +0200
Message-ID: <1313796693.3651.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [beagleboard] Unable to build Angstrom meta-toolchain
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
X-List-Received-Date: Fri, 19 Aug 2011 23:36:18 -0000
X-Groupsio-MsgNum: 33738
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-/IXUUNVjm/sXaXx6Blte"

--=-/IXUUNVjm/sXaXx6Blte
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 20.08.2011, 00:35 +0200 schrieb fabian b=C3=BCttner:
> On 15:05 Fri 19 Aug     , Khem Raj wrote:
> > On Fri, Aug 19, 2011 at 2:03 PM, fabian b=C3=BCttner <fabian-buettner@g=
mx.de> wrote:

[=E2=80=A6]

> > > I removed libstdc++-dev and I was able to build meta-toolchain.
> >=20
> > OK now can you send me list of files you have in
> > packages-split dir in gcc-cross build tree do
> >=20
> > $ find
> >=20
> > and send the output please
>=20
> Could you be more specific, I am new here.

Adding a please would be nice next time.

> Where do I find the packages-split dir?

In your build directory. For example for `libroxml`.

        $ ls angstrom-dev/work/armv7a-angstrom-linux-gnueabi/libroxml-2.1.0=
-r0/
        image           package         staging-pkg      temp
        libroxml-2.1.0  packages-split  sysroot-destdir

If you have `INHERIT +=3D "rm_work"` in you `local.conf` those directories
are removed after a successful build. So you should comment that line
out.


Thanks and good luck,

Paul


[1] http://gumstix.org/software-development/open-embedded/161-openembedded-=
directory-layout.html

--=-/IXUUNVjm/sXaXx6Blte
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5O8kkACgkQPX1aK2wOHVgOzwCfZxrXKZK53fEltvQYgElRNFeV
YNYAn2lcmagpnTqC71GX8pV+NcXH3eBD
=He5V
-----END PGP SIGNATURE-----

--=-/IXUUNVjm/sXaXx6Blte--
