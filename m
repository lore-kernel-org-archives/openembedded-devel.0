Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1QcFq8-0007x7-UW
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 13:55:25 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p5UBpgfR004202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2011 06:51:42 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p5UBpfwo025295
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2011 06:51:41 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p5UBpfK5009243
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2011 06:51:41 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Thu, 30 Jun 2011 06:51:41 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Jun 2011 06:51:37 -0500
Thread-Topic: [oe] [PATCH v2 1/1] am-benchmarks: Remove platform dependencies
Thread-Index: Acw3Azum4X5z6WI1Raq5qW3Y1fOkxgAGKcZw
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08034B4D8FC8@dlee06.ent.ti.com>
References: <1309365186-10742-1-git-send-email-j-lance1@ti.com>
	<iuhdhf$k68$1@dough.gmane.org>
In-Reply-To: <iuhdhf$k68$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/1] am-benchmarks: Remove platform dependencies
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
X-List-Received-Date: Thu, 30 Jun 2011 11:55:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Koen Kooi
> Sent: Thursday, June 30, 2011 3:53 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH v2 1/1] am-benchmarks: Remove platform
> dependencies
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 29-06-11 18:33, Jeff Lance wrote:
> > * Remove platform dependencies and use architecture dependencies
> instead
> > * Use OE BASE_PACKAGE_ARCH to determine architecture
> > * Update the SRCREV to revision 66
> > * Update the recipe revision to 1.3
> > * Removed INSANE_SKIP
> > NOTE - architecture dependency can be removed once CFLAGS can be
> passed into CCSv5 project makefile
> >
> > Signed-off-by: Jeff Lance <j-lance1@ti.com>
>=20
> Much better, thanks!
>=20
> Acked-by: Koen Kooi <koen@dominion.thruhere.net>

NAK

My testing shows this sed command does not work the way it was intended.  I=
 have given Jeff an updated command to submit another version of th patch.

>=20
> > ---
> > Updated in version 2:
> >   Removed INSANE_SKIP directive
> >   updated SRCREV from 65 to 66
> >   used find-copies-harder to show differences with previous recipe
> > --
> >  recipes/ti/am-benchmarks_1.3.bb |   33
> +++++++++++++++++++++++++++++++++
> >  1 files changed, 33 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/ti/am-benchmarks_1.3.bb
> >
> > diff --git a/recipes/ti/am-benchmarks_1.3.bb b/recipes/ti/am-
> benchmarks_1.3.bb
> > new file mode 100644
> > index 0000000..8ac9b74
> > --- /dev/null
> > +++ b/recipes/ti/am-benchmarks_1.3.bb
> > @@ -0,0 +1,33 @@
> > +#NOTE: This package is currently only supported for the Angstrom
> > +#      distribution.  Other distributions and toolchains may or
> > +#      may not work.
> > +
> > +DESCRIPTION =3D "AM Benchmarks"
> > +HOMEPAGE =3D "https://gforge.ti.com/gf/project/am_benchmarks/"
> > +LICENSE =3D "BSD"
> > +SECTION =3D "system"
> > +PRIORITY =3D "optional"
> > +
> > +SRCREV =3D "66"
> > +PR =3D "r2+svnr${SRCPV}"
> > +
> > +SRC_URI =3D
> "svn://gforge.ti.com/svn/am_benchmarks/;module=3Dtrunk;proto=3Dhttps;user=
=3Da
> nonymous;pswd=3D''"
> > +
> > +S =3D "${WORKDIR}/trunk"
> > +
> > +do_configure() {
> > +        sed -i -e 's|LIBS :=3D|LIBS :=3D ${LDFLAGS} |'
> Release/objects.mk
> > +}
> > +
> > +do_compile() {
> > +	# don't build debug version
> > +	touch debug
> > +	export CROSS_COMPILE=3D${TARGET_PREFIX}
> > +	export ARCH=3D${BASE_PACKAGE_ARCH}
> > +	make release
> > +}
> > +
> > +do_install() {
> > +	export ARCH=3D${BASE_PACKAGE_ARCH}
> > +	make DESTDIR=3D${D} install
> > +}
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFODDlvMkyGM64RGpERAkG8AJ4nj8TWYoY89u9XJHPiw13adfgeGACgp69I
> UxVJuBlADDqibDEyEAUuBcE=3D
> =3DyCEc
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


