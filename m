Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R1bgl-0007HQ-84 for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 12:18:31 +0200
Received: from f053034059.adsl.alicedsl.de ([78.53.34.59]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R1bc1-0000HP-BQ; Thu, 08 Sep 2011 10:13:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 08 Sep 2011 12:13:28 +0200
In-Reply-To: <20110510203505.GD1544@ibawizard.net>
References: <1304243449-12028-1-git-send-email-heroor@ti.com>
	<20110501173015.GI27708@ibawizard.net>
	<BANLkTimKHp5M5VvMR21+C_rSRBiu2M0BKQ@mail.gmail.com>
	<20110506090243.GE26466@ibawizard.net>
	<BANLkTikt+X9ocYn-0bsfwzbCcZDQFnm_ww@mail.gmail.com>
	<20110508180923.GG26466@ibawizard.net>
	<BANLkTikQ81NTULOMEu9k9+nvkpB4m3iSrw@mail.gmail.com>
	<20110510203505.GD1544@ibawizard.net>
X-Mailer: Evolution 3.0.3- 
Message-ID: <1315476809.17658.47.camel@mattotaupa>
Mime-Version: 1.0
Cc: Siddharth Heroor <heroor@gmail.com>
Subject: zeromq: task configure fails with `autogen.sh: error: could not find libtool.` (was: [PATCH 1/2] zeromq: Add zeromq socket library.)
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
X-List-Received-Date: Thu, 08 Sep 2011 10:18:31 -0000
X-Groupsio-MsgNum: 34141
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-W/muZv59riPNuNQm/0gI"

--=-W/muZv59riPNuNQm/0gI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Petr, dear Siddharth,


Am Dienstag, den 10.05.2011, 22:35 +0200 schrieb Petr =C5=A0tetiar:
> Siddharth Heroor <heroor@gmail.com> [2011-05-10 15:04:04]:
>=20
> > I tried to build it and it fails. The error is as follows -
> >=20
> > ERROR: Logfile of failure stored in:
> > /swcoe/sdk/sid/arago/build-oe/angstrom-setup-scripts/build/tmp-angstrom=
_2010_x/work/armv7a-angstrom-linux-gnueabi/zeromq-2.1.6-r0/temp/log.do_conf=
igure.10701
> > Log data follows:
> > | + do_configure
> > | + ./autogen.sh
> > | autogen.sh: error: could not find libtool.  libtool is required to ru=
n autogen.sh.
> > NOTE: package zeromq-2.1.6-r0: task do_configure: Failed

I do get the same error as Siddharth using `angstrom-2010.x` for
`MACHINE =3D "beagleboard"`.

> Hm sorry, but this is strange. I don't know why it shoudln't find libtool=
...
> Log here:
>=20
> 	+ cd /opt/devel/oe/ts72xx-test/tmp-uclibc-angstrom-2010.x/work/armv4t-an=
gstrom-linux-uclibceabi/zeromq-2.1.6-r0/zeromq-2.1.6
> 	+ do_configure
> 	+ ./autogen.sh
> 	autoreconf: Entering directory `.'
> 	autoreconf: configure.in: not using Gettext
> 	autoreconf: running: aclocal -I config -I config --force -I config
> 	...

Are you sure it is not using `libtool` installed on your build system?

> > By removing do_configure_prepend() from the recipe, I am able to build =
zeromq.
> > Why do we need to run autogen.sh to regenerate the configure script?
> > Won't the shipped configure work?
>=20
> It apparently wasn't working quite correctly in some scenario, that's why=
 it's
> there. Maybe automake or something was complaining about the shipped vers=
ion
> of the macros? Sorry, I don't remember it correctly now, but it was teste=
d by
> Craig also, so I've pushed it as it is.
>=20
> Anyone with the better knowledge of the autofoo stuff, who could shed som=
e
> light on this?

Maybe Ilya who submitted a patch to upgrade the recipe to 2.1.6 has an
idea?

[=E2=80=A6]


Thanks,

Paul

--=-W/muZv59riPNuNQm/0gI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5olUgACgkQPX1aK2wOHVgnTwCggNpfreK5Gdf2qMKpycj6X4aE
H90An0xU44MgtMJczMzQv7vawVjRgyIz
=DBDy
-----END PGP SIGNATURE-----

--=-W/muZv59riPNuNQm/0gI--
