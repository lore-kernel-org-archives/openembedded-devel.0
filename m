Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D87261FE4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 02:54:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3M2sbVC018558
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 19:54:38 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.80]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0169.001;
	Mon, 21 Apr 2014 19:54:37 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] iozone: update version to 414
Thread-Index: AQHPXHy2PXnmyEGwQkmZtKC6lgkJAZsbjkowgADcqwCAAIgOwA==
Date: Tue, 22 Apr 2014 02:54:37 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAB5BF74D6@ALA-MBB.corp.ad.wrs.com>
References: <1397210212-26263-1-git-send-email-jackie.huang@windriver.com>
	<20140420094111.GJ2486@jama>
	<1B858668EC6A94408DCA5225FDFA85AAB5BF56BC@ALA-MBB.corp.ad.wrs.com>
	<20140421114612.GD2486@jama>
In-Reply-To: <20140421114612.GD2486@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] iozone: update version to 414
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
X-List-Received-Date: Tue, 22 Apr 2014 02:54:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Monday, April 21, 2014 7:46 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] iozone: update version to 414
>=20
> On Mon, Apr 21, 2014 at 05:38:08AM +0000, Huang, Jie (Jackie) wrote:
> >
> >
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org
> > > [mailto:openembedded-devel- bounces@lists.openembedded.org] On
> > > Behalf Of Martin Jansa
> > > Sent: Sunday, April 20, 2014 5:41 PM
> > > To: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] [meta-oe][PATCH] iozone: update version to 414
> > >
> > > On Fri, Apr 11, 2014 at 05:56:52PM +0800, jackie.huang@windriver.com =
wrote:
> > > > From: Jackie Huang <jackie.huang@windriver.com>
> > > >
> > > > Changes:
> > > > - use BPN to fix multilib builds
> > > > - drop the fileop-arm.patch since the issue is already
> > > >   fixed in the new version.
> > > >
> > > > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > > ---
> > > >  .../iozone3/iozone3/fileop-arm.patch               |   32 --------=
----
> > > >  .../iozone3/{iozone3_263.bb =3D> iozone3_414.bb}     |   51 ++++++=
+++++---------
> > > >  2 files changed, 27 insertions(+), 56 deletions(-)  delete mode
> > > > 100644 meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch
> > > >  rename meta-oe/recipes-benchmark/iozone3/{iozone3_263.bb =3D>
> > > > iozone3_414.bb} (63%)
> > > >
> > > > diff --git
> > > > a/meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch
> > > > b/meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch
> > > > deleted file mode 100644
> > > > index c71bfee..0000000
> > > > --- a/meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch
> > > > +++ /dev/null
> > > > @@ -1,32 +0,0 @@
> > > > -Modify makefile to compile fileop.c file for ARM architecture.
> > > > -
> > > > -Upstream-Status: Inappropriate [not author]
> > > > -Index: current/makefile
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > ---- current.orig/makefile	2006-10-14 21:42:36.000000000 +0200
> > > > -+++ current/makefile	2006-10-14 21:40:02.000000000 +0200
> > > > -@@ -190,9 +190,10 @@
> > > > - #
> > > > - # GNU 'C' compiler Linux build with threads, largefiles, async
> > > > I/O
> > > > - #
> > > > --linux-arm:	iozone_linux-arm.o  libbif.o libasync.o
> > > > -+linux-arm:	iozone_linux-arm.o  libbif.o libasync.o fileop_linux-a=
rm.o
> > > > - 	$(CC) -O3 $(LDFLAGS) iozone_linux-arm.o libbif.o libasync.o \
> > > > - 		-lrt -lpthread -o iozone
> > > > -+	$(CC)  -O3 -Dlinux fileop_linux-arm.o -o fileop
> > > > -
> > > > - #
> > > > - # GNU 'C' compiler Linux build with threads, largefiles, async
> > > > I/O -@@ -725,6 +726,12 @@
> > > > - 	@echo ""
> > > > - 	$(CC) -Wall -c -O3 $(CFLAGS) fileop.c -o fileop_linux-AMD64.o
> > > > -
> > > > -+fileop_linux-arm.o:	fileop.c
> > > > -+	@echo ""
> > > > -+	@echo "Building fileop for Linux-arm"
> > > > -+	@echo ""
> > > > -+	$(CC) -Wall -c -O3 $(CFLAGS) fileop.c -o fileop_linux-arm.o
> > > > -+
> > > > - fileop_windows.o: fileop.c
> > > > - 	@echo ""
> > > > - 	@echo "Building fileop for Windows"
> > > > diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb
> > > > b/meta-oe/recipes-benchmark/iozone3/iozone3_414.bb
> > > > similarity index 63%
> > > > rename from meta-oe/recipes-benchmark/iozone3/iozone3_263.bb
> > > > rename to meta-oe/recipes-benchmark/iozone3/iozone3_414.bb
> > > > index 9de0ac7..572d766 100644
> > > > --- a/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb
> > > > +++ b/meta-oe/recipes-benchmark/iozone3/iozone3_414.bb
> > > > @@ -3,46 +3,49 @@ HOMEPAGE =3D "http://www.iozone.org/"
> > > >  AUTHOR =3D "Don Capps <don.capps2@verizon.net>, William D. Norcott
> <wnorcott@us.oracle.com>"
> > > >  SECTION =3D "console/tests"
> > > >  LICENSE =3D "iozone3"
> > > > -LIC_FILES_CHKSUM =3D
> > > "file://iozone.c;beginline=3D237;endline=3D241;md5=3Dab42a6185fd04439=
78871f11a007ac0b"
> > > > +LIC_FILES_CHKSUM =3D
> > > "file://iozone.c;beginline=3D266;endline=3D270;md5=3Dab42a6185fd04439=
78871f11a007ac0b"
> > > >
> > > > -
> > > > -SRC_URI =3D "http://www.iozone.org/src/current/iozone3_263.tar \
> > > > +SRC_URI =3D "http://fossies.org/unix/privat/${BPN}_${PV}.tar.gz \
> > >
> > > $ wget http://fossies.org/unix/privat/iozone3_414.tar.gz
> > > --2014-04-20 09:40:22--
> > > http://fossies.org/unix/privat/iozone3_414.tar.gz
> > > Resolving fossies.org (fossies.org)... 78.46.58.28 Connecting to
> > > fossies.org (fossies.org)|78.46.58.28|:80... connected.
> > > HTTP request sent, awaiting response... 404 Not Found
> > > 2014-04-20 09:40:23 ERROR 404: Not Found.
> >
> > Sorry I didn't test the fetch since we had a local copy, fix it to:
> > http://www.iozone.org/src/current/${BPN}_${PV}.tar
>=20
> Strange that new version also has different checksums than what you were =
using before, but I've

It's .tar rather than .tar.gz I was using before, so the checksums are diff=
erent.

Thanks,
Jackie

> updated the patch in master-next, thanks for v2.
>=20
> >
> > and I will send v2 for this.
> >
> > Thanks,
> > Jackie
> >
> > >
> > >
> > > >      file://copyright.txt \
> > > > -    file://fileop-arm.patch \
> > > >  "
> > > > -SRC_URI[md5sum] =3D "44fd88df361ec4508e10c8d6615245fa"
> > > > -SRC_URI[sha256sum] =3D
> > > "920fde1a3843539570e2df4aa611e74df102e52d363c5973d5a9d15bdf976461"
> > > > +SRC_URI[md5sum] =3D "85a3e292f84580a36e6c99762a459dd6"
> > > > +SRC_URI[sha256sum] =3D
> "f6c2fde4bfaef1ff8aaf99a315737a846886aa54751a6d9309e14fbec0cbe7a9"
> > > >
> > > > -S =3D "${WORKDIR}/${PN}_${PV}/src/current/"
> > > > +S =3D "${WORKDIR}/${BPN}_${PV}/src/current/"
> > > >
> > > > -EXTRA_OEMAKE_powerpc =3D "linux-powerpc CC=3D'${CC}'"
> > > > -EXTRA_OEMAKE_powerpc64 =3D "linux-powerpc64 CC=3D'${CC}'"
> > > > -EXTRA_OEMAKE_arm =3D "linux-arm CC=3D'${CC}'"
> > > > -EXTRA_OEMAKE =3D "linux CC=3D'${CC}'"
> > > > +#
> > > > +# All other arches can use the default OEMAKE except those #
> > > > +explicitly listed below. Another, the iozone3 Makefile # needs to
> > > > +be told about the cross-compiler explicitly here.
> > > > +#
> > > > +EXTRA_OEMAKE_powerpc =3D "linux-powerpc CC=3D'${CC}' GCC=3D'${CC}'=
"
> > > > +EXTRA_OEMAKE_powerpc64 =3D "linux-powerpc64 CC=3D'${CC}' GCC=3D'${=
CC}'"
> > > > +EXTRA_OEMAKE_arm =3D "linux-arm CC=3D'${CC}' GCC=3D'${CC}'"
> > > > +EXTRA_OEMAKE =3D "linux CC=3D'${CC}' GCC=3D'${CC}'"
> > > >
> > > >  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> > > >
> > > >  do_install() {
> > > >      install -d ${D}${bindir} \
> > > > -        ${D}${mandir}/man1 \
> > > > -    ${D}${datadir}/doc/${PN}/examples
> > > > +               ${D}${mandir}/man1 \
> > > > +               ${D}${datadir}/doc/${BPN}/examples
> > > >
> > > >      install -m 0755 ${S}/iozone ${D}${bindir}
> > > >      install -m 0755 ${S}/fileop ${D}${bindir}
> > > > -    install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/iozone.1 ${D}${man=
dir}/man1/
> > > > -    install -m 0644 ${WORKDIR}/copyright.txt ${D}${datadir}/doc/${=
PN}/
> > > > +    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/iozone.1 ${D}${ma=
ndir}/man1/
> > > > +    install -m 0644 ${WORKDIR}/copyright.txt
> > > > + ${D}${datadir}/doc/${BPN}/
> > > >
> > > > -    install -m 0644 ${S}/*.dem ${D}${datadir}/doc/${PN}/examples
> > > > -    install -m 0644 ${S}/client_list ${D}${datadir}/doc/${PN}/exam=
ples
> > > > -    install -m 0644 ${S}/Gnuplot.txt ${D}${datadir}/doc/${PN}/exam=
ples
> > > > +    install -m 0644 ${S}/*.dem ${D}${datadir}/doc/${BPN}/examples
> > > > +    install -m 0644 ${S}/client_list ${D}${datadir}/doc/${BPN}/exa=
mples
> > > > +    install -m 0644 ${S}/Gnuplot.txt
> > > > + ${D}${datadir}/doc/${BPN}/examples
> > > >
> > > > -    install -m 0755 ${S}/Generate_Graphs ${D}${datadir}/doc/${PN}/=
examples
> > > > -    install -m 0755 ${S}/gengnuplot.sh ${D}${datadir}/doc/${PN}/ex=
amples
> > > > -    install -m 0755 ${S}/report.pl ${D}${datadir}/doc/${PN}/exampl=
es
> > > > +    install -m 0755 ${S}/Generate_Graphs ${D}${datadir}/doc/${BPN}=
/examples
> > > > +    install -m 0755 ${S}/gengnuplot.sh ${D}${datadir}/doc/${BPN}/e=
xamples
> > > > +    install -m 0755 ${S}/report.pl
> > > > + ${D}${datadir}/doc/${BPN}/examples
> > > >
> > > > -    install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/Iozone_ps.gz ${D}$=
{datadir}/doc/${PN}/
> > > > -    install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/IOzone_msword_98.p=
df
> > > ${D}${datadir}/doc/${PN}/
> > > > -    install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/Run_rules.doc ${D}=
${datadir}/doc/${PN}/
> > > > +    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/Iozone_ps.gz ${D}=
${datadir}/doc/${BPN}/
> > > > +    install -m 0644
> > > > + ${WORKDIR}/${BPN}_${PV}/docs/IOzone_msword_98.pdf
> > > ${D}${datadir}/doc/${BPN}/
> > > > +    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/Run_rules.doc
> > > > + ${D}${datadir}/doc/${BPN}/
> > > >  }
> > > >
> > > >  FILES_${PN} +=3D "${datadir}/doc/${PN}/copyright.txt"
> > > > --
> > > > 1.7.9.5
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

