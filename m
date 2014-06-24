Return-Path: <fcooper@ti.com>
X-Greylist: delayed 541 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Jun 2014 17:58:38 UTC
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id 411EE60438
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jun 2014 17:58:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5OHnbI7009571;
	Tue, 24 Jun 2014 12:49:37 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5OHnb1S023736;
	Tue, 24 Jun 2014 12:49:37 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 24 Jun 2014 12:49:37 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Joe MacDonald <joe_macdonald@mentor.com>
Thread-Topic: [oe] [meta-networking][PATCH] ptpd: update to 2.3.0
Thread-Index: AQHPhmmso4ob2dTWv0Otjp2S3B3gHptzaMsAgA0zqCA=
Date: Tue, 24 Jun 2014 17:49:36 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D711A@DFLE08.ent.ti.com>
References: <1402596658-17371-1-git-send-email-fcooper@ti.com>
	<20140616031308.GA29515@deserted.net>
In-Reply-To: <20140616031308.GA29515@deserted.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] ptpd: update to 2.3.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jun 2014 17:58:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

> -----Original Message-----
> From: Joe MacDonald [mailto:joe@deserted.net] On Behalf Of Joe MacDonald
> Sent: Sunday, June 15, 2014 10:13 PM
> To: Cooper Jr., Franklin
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH] ptpd: update to 2.3.0
>=20
> This gave me a bit of trouble, I'll circle back to it tomorrow, probably.
>=20
> -J.
>=20
> [[oe] [meta-networking][PATCH] ptpd: update to 2.3.0] On 14.06.12 (Thu
> 13:10) Franklin S. Cooper Jr wrote:
>=20
> > ---
> >  .../ptpd/ptpd-2.2.0/ld-as-needed.patch             |   37 ------------=
--------
> >  .../ptpd/{ptpd_2.2.0.bb =3D> ptpd_2.3.0.bb}          |   21 ++++++----=
-
> >  2 files changed, 11 insertions(+), 47 deletions(-)  delete mode
> > 100644
> > meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
> >  rename meta-networking/recipes-daemons/ptpd/{ptpd_2.2.0.bb =3D>
> > ptpd_2.3.0.bb} (57%)
> >
> > diff --git
> > a/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
> > b/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
> > deleted file mode 100644
> > index 7d5251b..0000000
> > ---
> > a/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
> > +++ /dev/null
> > @@ -1,37 +0,0 @@
> > -Patch from http://patch-tracker.debian.org/package/ptpd
> > -
> > -Description: Fix ld --as-needed
> > - This patch fixes the order of gcc arguments to fix ld --as-needed
> > -Author: Roland Stigge <stigge@antcom.de>
> > -Bug-Debian: http://bugs.debian.org/607583
> > -
> > -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ----
> > - src/Makefile |    4 ++--
> > - 1 files changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/src/Makefile b/src/Makefile -index a672625..88a2fc8
> > 100644
> > ---- a/src/Makefile
> > -+++ b/src/Makefile
> > -@@ -40,7 +40,7 @@ CFLAGS +=3D -DDBG_SIGUSR2_CHANGE_DEBUG
> > -
> > - CFLAGS +=3D -DPTP_EXPERIMENTAL
> > -
> > --LDFLAGS+=3D -lm -lrt
> > -+LIBS +=3D -lm -lrt
> > -
> > - PROG =3D ptpd
> > - SRCS =3D ptpd.c arith.c bmc.c protocol.c display.c\ -@@ -63,7 +63,7 @=
@
> > TAGFILES =3D GPATH GRTAGS GSYMS GTAGS cscope.in.out cscope.out
> > cscope.po.out
> > - all: $(PROG)
> > -
> > - $(PROG): $(OBJS)
> > --	$(CC) -o $@ $(OBJS) $(LDFLAGS)
> > -+	$(CC) -o $@ $(OBJS) $(LDFLAGS) $(LIBS)
> > -
> > - $(OBJS): $(HDRS)
> > -
> > ---
> > -1.7.4
> > -
> > diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> > b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
> > similarity index 57%
> > rename from meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> > rename to meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
> > index f2e895d..1febbb1 100644
> > --- a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
> > +++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
> > @@ -6,23 +6,24 @@ time coordination of LAN connected computers."
> >  HOMEPAGE =3D "http://sourceforge.net/projects/ptpd"
> >  SECTION =3D "network"
> >  LICENSE =3D "BSD"
> > -LIC_FILES_CHKSUM =3D
> "file://../COPYRIGHT;md5=3D3d8ac2c46c116bce2d2ad838b6cf3491"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYRIGHT;md5=3D4019cad2b3cd55f22ea819ffad6ccd41"
> >
> > -PR =3D "r1"
> > +DEPENDS =3D "libpcap"
> >
> > -SRC_URI =3D
> "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.=
gz
> \
> > -           file://ld-as-needed.patch;striplevel=3D2 \
> > -"
> > +PR =3D "r0"
> >
> > -SRC_URI[md5sum] =3D "c63a3a149d30c710773ccb02df5782a3"
> > -SRC_URI[sha256sum] =3D
> "f2266a22db84318d8b9ce266ea83772c03438c31f4993fa9643fa675a07c26b4"
> > +inherit autotools
> >
> > -S =3D "${WORKDIR}/ptpd-${PV}/src"
> > +SRC_URI =3D
> "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-
> ${PV}.tar.gz"
> > +
> > +S =3D "${WORKDIR}/ptpd-${PV}"
> > +SRC_URI[md5sum] =3D "f5e931b4a229705ff0dbdfe22490566b"
> > +SRC_URI[sha256sum] =3D
> "1a4e90496f004bfd91657ccc49209101dc25b787e540648c07c0973469f1d8f7"
> >
> >  EXTRA_OEMAKE =3D ""
> >
> >  do_install() {
> >      install -d ${D}${bindir} ${D}${mandir}/man8
> > -    install -m 0755 ptpd2 ${D}${bindir}
> > -    install -m 0644 ptpd2.8 ${D}${mandir}/man8
> > +    install -m 0755 ${S}/src/ptpd2 ${D}${bindir}
> > +    install -m 0644 ${S}/src/ptpd2.8 ${D}${mandir}/man8
> >  }
> > --
> > 1.7.0.4
> >
> --
> -Joe MacDonald.
> :wq

