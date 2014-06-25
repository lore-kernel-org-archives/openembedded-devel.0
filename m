Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id 4283B6FEC0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 12:52:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5PCqLiq021888;
	Wed, 25 Jun 2014 07:52:21 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5PCqL3F004191;
	Wed, 25 Jun 2014 07:52:21 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 25 Jun 2014 07:52:21 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Joe MacDonald <joe@deserted.net>
Thread-Topic: [oe] [meta-networking][PATCH] ptpd: update to 2.3.0
Thread-Index: AQHPhmmso4ob2dTWv0Otjp2S3B3gHpuBfCeAgABfe3A=
Date: Wed, 25 Jun 2014 12:52:20 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D72BE@DFLE08.ent.ti.com>
References: <1402596658-17371-1-git-send-email-fcooper@ti.com>
	<20140625021001.GC31512@deserted.net>
In-Reply-To: <20140625021001.GC31512@deserted.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Wed, 25 Jun 2014 12:52:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Joe MacDonald [mailto:joe@deserted.net]
> Sent: Tuesday, June 24, 2014 9:10 PM
> To: Cooper Jr., Franklin
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH] ptpd: update to 2.3.0
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
>=20
> I merged a version of this.  My changes are:
>=20
>    - changed do_install to (hopefully) play nice with B!=3DS
>=20
>    - explicitly disabled net-snmp support since it was not called out as
>      a dependency in the recipe, it wasn't immediately obvious to me how
>      to safely update the recipe to find the proper net-snmp support,
>      and ntp already sets that precedent
>=20
>    - removed setting of PR
>=20
> Please also be sure to add a SOB line for any patches you send in the fut=
ure.
[Franklin] Will do. Thank You.
>=20
> -J.
>=20
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

