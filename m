Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PUgXJ-0007E8-Ql for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 15:16:25 +0100
Received: from f053037216.adsl.alicedsl.de ([78.53.37.216]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PUgXG-0005Vf-C2 for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 14:16:22 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20101220031047.GB26429@gmail.com>
References: <1292521608-26072-1-git-send-email-Chase.Maupin@ti.com>
	<20101220031047.GB26429@gmail.com>
Date: Mon, 20 Dec 2010 15:16:20 +0100
Message-ID: <1292854580.8833.15.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] lftp: add ti LFTB recipe
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
X-List-Received-Date: Mon, 20 Dec 2010 14:16:25 -0000
X-Groupsio-MsgNum: 27292
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-bUXE9V5EZ64SLjcLS2RH"

--=-bUXE9V5EZ64SLjcLS2RH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Naresh and Chase,


I am adding my comments to Khem=E2=80=99s.


Am Sonntag, den 19.12.2010, 19:10 -0800 schrieb Khem Raj:
> On (16/12/10 11:46), Chase Maupin wrote:

First of all the commit summary should be.

	lftb: add TI LFTP 2.0

lft*b*

> > From: naresh <naresh@ti.com>

If there is no compelling reason against it usually the real name
(Naresh Medisetty) is used.

> > * This package contains functional test suites for TI devices
> >   used to verify the Linux kernel and drivers for the various
> >   peripherals found on TI devices.
> >=20
> > Signed-off-by: naresh <naresh@ti.com>

Here too.

> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  recipes/ti/ti-lftb.inc    |   47 +++++++++++++++++++++++++++++++++++++=
++++++++
> >  recipes/ti/ti-lftb_2.0.bb |    9 ++++++++
> >  2 files changed, 56 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/ti/ti-lftb.inc
> >  create mode 100644 recipes/ti/ti-lftb_2.0.bb
> >=20
> > diff --git a/recipes/ti/ti-lftb.inc b/recipes/ti/ti-lftb.inc
> > new file mode 100644
> > index 0000000..176f983
> > --- /dev/null
> > +++ b/recipes/ti/ti-lftb.inc
> > @@ -0,0 +1,47 @@
> > +DESCRIPTION =3D "Linux Functional test bench"
>=20
> may be F should be f
>=20
> > +HOMEPAGE =3D "http://arago-project.org/git/projects/?p=3Dtest-automati=
on/target-code/psp/lftb.git;a=3Dsummary"
> > +LICENSE=3D"BSD"
> > +
> > +INC_PR =3D "r1"
>=20
> New recipes begin at 'r0'
>=20
> > +
> > +DEPENDS =3D "virtual/kernel"
> > +
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +COMPATIBLE_MACHINE =3D "(dm365|dm355|dm6446|dm6467|omapl137|omapl138|o=
map3|ti816x)"
> > +
>=20
> could it use SOC_FAMILY
>=20
>=20
> > +S =3D "${WORKDIR}/git"
> > +
> > +#Machine specific overrides
> > +PLATFORM_omap3evm=3D"omap35x"
> > +PLATFORM_am180x-evm=3D"am18x"
> > +PLATFORM_am3517-evm=3D"am3517"
> > +PLATFORM_am37x-evm=3D"am37x"
> > +PLATFORM_beagleboard=3D"beagle"
> > +PLATFORM_da830-omapl137-evm=3D"am17x"
> > +PLATFORM_da850-omapl138-evm=3D"am18x"
> > +PLATFORM_am181x-evm=3D"am18x"
> > +PLATFORM_dm355-evm=3D"dm355"
> > +PLATFORM_dm365-evm=3D"dm365"
> > +PLATFORM_dm37x-evm=3D"am37x"
> > +PLATFORM_dm6446-evm=3D"dm644x"
> > +PLATFORM_dm6467-evm=3D"dm646x"
> > +PLATFORM_ti816x=3D"ti816x"
> > +
> > +do_compile () {

I think the coding sytle is without a space before `()`.

> > +    cd ${S}
> > +    make KERNEL_DIR=3D${STAGING_KERNEL_DIR} PLATFORM=3D${PLATFORM} TOO=
L_PREFIX=3D${TARGET_PREFIX}
> > +}
> > +
> > +do_install () {
> > +    install -d ${D}${bindir}/lftb
> > +    cd ${S}
>=20
> is this cd needed ?
>=20
> > +    make INSTALL_DIR=3D${D}${bindir}/lftb install
> > +
> > +    # Remove unneeded tarball placed in bindir by install target
> > +    rm -rf ${D}${bindir}/lftb.tar.gz
> > +}
> > +
> > +INSANE_SKIP_${PN} =3D True
> > +
> > +FILES_${PN} =3D "${bindir}/lftb"
> > diff --git a/recipes/ti/ti-lftb_2.0.bb b/recipes/ti/ti-lftb_2.0.bb
> > new file mode 100644
> > index 0000000..62c936c
> > --- /dev/null
> > +++ b/recipes/ti/ti-lftb_2.0.bb
> > @@ -0,0 +1,9 @@
> > +require ti-lftb.inc
> > +
> > +SRCREV =3D "3d0be58aee659ef7e8eda43e916172bab300235f"
> > +
> > +PR =3D "${MACHINE_KERNEL_PR}+${INC_PR}"
> > +PR_append =3D "a"
> > +
> > +SRC_URI =3D "git://arago-project.org/git/projects/test-automation/targ=
et-code/psp/lftb.git;protocol=3Dgit \
> > +"


Thanks,

Paul

--=-bUXE9V5EZ64SLjcLS2RH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0PZS4ACgkQPX1aK2wOHVitdgCcCDvNMJkL9uYkA75dftnjm8XO
A0cAnR2lwyJiesmyIVVvjXZxGjgKEvXd
=8HsS
-----END PGP SIGNATURE-----

--=-bUXE9V5EZ64SLjcLS2RH--
