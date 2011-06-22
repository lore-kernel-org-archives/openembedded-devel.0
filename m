Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1QZVnb-0006s7-CZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 00:21:27 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p5MMHpK1018051
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:17:52 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p5MMHpoS013722
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:17:51 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p5MMHpcF020436
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:17:51 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Wed, 22 Jun 2011 17:17:51 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Jun 2011 17:17:48 -0500
Thread-Topic: [oe] [PATCH 1/1] matrix-tui: Update to arago toolchain
Thread-Index: AcwxKWHxd+VwmQRmTyCDcdEJHu9sYAAAFCDg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08034B41731B@dlee06.ent.ti.com>
References: <1308769321-26192-1-git-send-email-j-lance1@ti.com>
	<20110622211111.GH1324@denix.org>
In-Reply-To: <20110622211111.GH1324@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Lance, Jeff" <j-lance1@ti.com>
Subject: Re: [PATCH 1/1] matrix-tui: Update to arago toolchain
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
X-List-Received-Date: Wed, 22 Jun 2011 22:21:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Denys Dmytriyenko
> Sent: Wednesday, June 22, 2011 4:11 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Lance, Jeff
> Subject: Re: [oe] [PATCH 1/1] matrix-tui: Update to arago toolchain
>=20
> On Wed, Jun 22, 2011 at 02:02:01PM -0500, Jeff Lance wrote:
> > * Modify to use arago MACHINE name for platforms
> > * Add all Sitara platforms
> > * Update SRCREV to 41
> >
> > Signed-off-by: Jeff Lance <j-lance1@ti.com>
>=20
> Jeff,
>=20
> See my coments below.
>=20
>=20
> > ---
> >  recipes/ti/matrix-tui.inc    |   12 +++---------
> >  recipes/ti/matrix-tui_1.1.bb |    4 ++--
> >  2 files changed, 5 insertions(+), 11 deletions(-)
> >
> > diff --git a/recipes/ti/matrix-tui.inc b/recipes/ti/matrix-tui.inc
> > index 1ad8aa8..a3793d3 100644
> > --- a/recipes/ti/matrix-tui.inc
> > +++ b/recipes/ti/matrix-tui.inc
> > @@ -9,13 +9,6 @@ INC_PR =3D "r7"
> >
> >  COMPATIBLE_MACHINE =3D "(omapl138|omap3)"
> >
> > -PLATFORM_am37x-evm =3D "am3715"
> > -PLATFORM_beagleboard =3D "am3715"
> > -PLATFORM_am3517-evm =3D "am3517"
> > -PLATFORM_am180x-evm =3D "am180x"
> > -PLATFORM_am181x-evm =3D "am181x"
> > -PLATFORM_da850-omapl138-evm =3D "am180x"
> > -
> >  SRC_URI =3D
> "svn://gforge.ti.com/svn/matrix_tui/;module=3Dtrunk;proto=3Dhttps;user=3D=
anon
> ymous;pswd=3D'' \
> >  	file://init \
> >  "
> > @@ -28,7 +21,7 @@ S =3D "${WORKDIR}/trunk"
> >  #INITSCRIPT_PARAMS =3D "defaults 99"
> >
> >  do_configure() {
> > -	sed -i -e 's:PATH=3D${LINUX_DEVKIT_PATH}/arm-none-linux-
> gnueabi:PATH ?=3D ${LINUX_DEVKIT_PATH}/arm-none-linux-gnueabi:'
> makefile.init
> > +	sed -i -e 's:PATH=3D${LINUX_DEVKIT_PATH}/arm-arago-linux-
> gnueabi:PATH ?=3D ${LINUX_DEVKIT_PATH}/arm-arago-linux-gnueabi:'
> makefile.init
>=20
> I don't think this is needed. The whole point of that sed magic I put
> in
> there, is to make assignments of TUI_INCLUDE_PATH, XML_INCLUDE_PATH and
> TUI_LIB_PATH conditionally, so they can be overwritten below in the
> do_compile() task...

The makefile defaults have been changed to use arm-arago-linux-gnueabi inst=
ead of the arm-none-linux-gnueabi.  If you want these values to still be op=
tionally assigned then you would still need these changes right?

Now perhaps a better way to do this is change the makefile.init to use the =
?=3D optional assignment so that you don't need to do this sed magic.  Woul=
d that also work?

>=20
>=20
> >  	sed -i -e 's|LIBS :=3D|LIBS :=3D ${LDFLAGS} |' Release/objects.mk
> >  }
> >
> > @@ -39,11 +32,12 @@ do_compile() {
> >  	export TUI_INCLUDE_PATH=3D${STAGING_INCDIR}
> >  	export XML_INCLUDE_PATH=3D${STAGING_INCDIR}/libxml2
> >  	export TUI_LIB_PATH=3D${STAGING_LIBDIR}
> > +	export PLATFORM=3D${MACHINE}
> >  	make release
> >  }
> >
> >  do_install() {
> > -	export PLATFORM=3D${PLATFORM}
> > +	export PLATFORM=3D${MACHINE}
> >  	make DESTDIR=3D${D} install
> >  	install -d ${D}${sysconfdir}/init.d/
> >  	install -c -m 0755 ${WORKDIR}/init
> ${D}${sysconfdir}/init.d/matrix-tui
> > diff --git a/recipes/ti/matrix-tui_1.1.bb b/recipes/ti/matrix-
> tui_1.1.bb
> > index 9814d5f..7e95d62 100644
> > --- a/recipes/ti/matrix-tui_1.1.bb
> > +++ b/recipes/ti/matrix-tui_1.1.bb
> > @@ -1,4 +1,4 @@
> >  require matrix-tui.inc
> >
> > -SRCREV =3D "37"
> > -PR =3D "${INC_PR}.4"
> > +SRCREV =3D "41"
> > +PR =3D "${INC_PR}.5"
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


