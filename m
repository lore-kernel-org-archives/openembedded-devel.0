Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1PUgzI-0002gO-3e
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 15:45:20 +0100
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id oBKEjAtl002100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 20 Dec 2010 08:45:10 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id oBKEjAYn001994;
	Mon, 20 Dec 2010 08:45:10 -0600 (CST)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBKEjAxg006974;
	Mon, 20 Dec 2010 08:45:10 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Mon, 20 Dec 2010 08:45:10 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Dec 2010 08:45:07 -0600
Thread-Topic: [oe] [PATCH] lftp: add ti LFTB recipe
Thread-Index: Acuf83qnIwgY7b1PTIWg/7XffMR0ugAX3pEg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329E92F8B@dlee06.ent.ti.com>
References: <1292521608-26072-1-git-send-email-Chase.Maupin@ti.com>
	<20101220031047.GB26429@gmail.com>
In-Reply-To: <20101220031047.GB26429@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Medisetty, Naresh" <naresh@ti.com>
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
X-List-Received-Date: Mon, 20 Dec 2010 14:45:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Sunday, December 19, 2010 9:11 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Medisetty, Naresh; Maupin, Chase
> Subject: Re: [oe] [PATCH] lftp: add ti LFTB recipe
>=20
> On (16/12/10 11:46), Chase Maupin wrote:
> > From: naresh <naresh@ti.com>
> >
> > * This package contains functional test suites for TI devices
> >   used to verify the Linux kernel and drivers for the various
> >   peripherals found on TI devices.
> >
> > Signed-off-by: naresh <naresh@ti.com>
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  recipes/ti/ti-lftb.inc    |   47
> +++++++++++++++++++++++++++++++++++++++++++++
> >  recipes/ti/ti-lftb_2.0.bb |    9 ++++++++
> >  2 files changed, 56 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/ti/ti-lftb.inc
> >  create mode 100644 recipes/ti/ti-lftb_2.0.bb
> >
> > diff --git a/recipes/ti/ti-lftb.inc b/recipes/ti/ti-lftb.inc
> > new file mode 100644
> > index 0000000..176f983
> > --- /dev/null
> > +++ b/recipes/ti/ti-lftb.inc
> > @@ -0,0 +1,47 @@
> > +DESCRIPTION =3D "Linux Functional test bench"
>=20
> may be F should be f

Changing to use "Linux Functional Test Bench" to bring out the L F T B.  Th=
anks for pointing this out.

>=20
> > +HOMEPAGE =3D "http://arago-project.org/git/projects/?p=3Dtest-
> automation/target-code/psp/lftb.git;a=3Dsummary"
> > +LICENSE=3D"BSD"
> > +
> > +INC_PR =3D "r1"
>=20
> New recipes begin at 'r0'

Good call.  I will change this.

>=20
> > +
> > +DEPENDS =3D "virtual/kernel"
> > +
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > +
> > +COMPATIBLE_MACHINE =3D
> "(dm365|dm355|dm6446|dm6467|omapl137|omapl138|omap3|ti816x)"
> > +
>=20
> could it use SOC_FAMILY

These are SOC_FAMILY entries.

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
> > +    cd ${S}
> > +    make KERNEL_DIR=3D${STAGING_KERNEL_DIR} PLATFORM=3D${PLATFORM}
> TOOL_PREFIX=3D${TARGET_PREFIX}
> > +}
> > +
> > +do_install () {
> > +    install -d ${D}${bindir}/lftb
> > +    cd ${S}
>=20
> is this cd needed ?

Not strictly.  I'll remove it.

Thanks for the review and feedback.  I'll be submitting an updated patch sh=
ortly.

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
et-
> code/psp/lftb.git;protocol=3Dgit \
> > +"
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


