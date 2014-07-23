Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0186.outbound.protection.outlook.com [207.46.163.186])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2C170828
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 10:19:33 +0000 (UTC)
Received: from BN1PR03MB156.namprd03.prod.outlook.com (10.255.201.28) by
	BN1PR03MB124.namprd03.prod.outlook.com (10.255.201.23) with Microsoft
	SMTP Server (TLS) id 15.0.990.7; Wed, 23 Jul 2014 10:19:32 +0000
Received: from BN1PR03MB156.namprd03.prod.outlook.com (10.255.201.28) by
	BN1PR03MB156.namprd03.prod.outlook.com (10.255.201.28) with Microsoft
	SMTP Server (TLS) id 15.0.990.7; Wed, 23 Jul 2014 10:19:31 +0000
Received: from BN1PR03MB156.namprd03.prod.outlook.com ([169.254.14.141]) by
	BN1PR03MB156.namprd03.prod.outlook.com ([169.254.14.141]) with mapi id
	15.00.0990.007; Wed, 23 Jul 2014 10:19:31 +0000
From: "ting.liu@freescale.com" <ting.liu@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 1/3] libhugetlbfs: use ARCH ppc/ppc64 for
	powerpc/powerpc64
Thread-Index: AQHPoPnD12K7WoUuREaO37e5ONjtWpuj2McAgAmLxQCAABhX4A==
Date: Wed, 23 Jul 2014 10:19:31 +0000
Message-ID: <9451d31a97f84bee88c53ef659d7b30a@BN1PR03MB156.namprd03.prod.outlook.com>
References: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
	<1405491841-24744-2-git-send-email-ting.liu@freescale.com>
	<20140716132725.GX2433@jama>
	<960fede6c06346c78c13b2cc097255dc@BN1PR03MB156.namprd03.prod.outlook.com>
	<20140723085110.GA22875@jama>
In-Reply-To: <20140723085110.GA22875@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.49]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
	SFS:(979002)(6009001)(377454003)(51704005)(189002)(199002)(13464003)(24454002)(93886003)(74316001)(77982001)(19580395003)(79102001)(76576001)(19580405001)(83322001)(107046002)(107886001)(15975445006)(99396002)(54356999)(21056001)(15202345003)(76176999)(92566001)(50986999)(2656002)(76482001)(33646002)(85852003)(81342001)(106116001)(46102001)(83072002)(80022001)(95666004)(99286002)(105586002)(575784001)(64706001)(66066001)(74662001)(87936001)(74502001)(86362001)(4396001)(2351001)(110136001)(101416001)(31966008)(77096002)(106356001)(85306003)(81542001)(20776003)(108616002)(24736002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:; SCL:1; SRVR:BN1PR03MB156;
	H:BN1PR03MB156.namprd03.prod.outlook.com; FPR:; MLV:ovrnspm;
	PTR:InfoNoRecords; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe][PATCH 1/3] libhugetlbfs: use ARCH ppc/ppc64 for powerpc/powerpc64
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
X-List-Received-Date: Wed, 23 Jul 2014 10:19:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-
> devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Wednesday, July 23, 2014 4:51 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 1/3] libhugetlbfs: use ARCH ppc/ppc64 f=
or
> powerpc/powerpc64
>=20
> On Thu, Jul 17, 2014 at 07:09:18AM +0000, ting.liu@freescale.com wrote:
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org
> > > [mailto:openembedded- devel-bounces@lists.openembedded.org] On
> > > Behalf Of Martin Jansa
> > > Sent: Wednesday, July 16, 2014 9:27 PM
> > > To: openembedded-devel@lists.openembedded.org
> > > Cc: yocto@mindchasers.com
> > > Subject: Re: [oe] [meta-oe][PATCH 1/3] libhugetlbfs: use ARCH
> > > ppc/ppc64 for
> > > powerpc/powerpc64
> > >
> > > On Wed, Jul 16, 2014 at 02:23:59PM +0800, ting.liu@freescale.com wrot=
e:
> > > > From: Ting Liu <b28495@freescale.com>
> > > >
> > > > In recent libhugetlbfs source, powerpc/powerpc64 is changed back
> > > > to
> > > > ppc/ppc64 (to match with the output of `uname -a`).
> > > >
> > > > Update the recipe to avoid build issue for now.
> > > >
> > > > Signed-off-by: Ting Liu <b28495@freescale.com>
> > > > ---
> > > >  .../libhugetlbfs/libhugetlbfs_git.bb               |    5 ++++-
> > > >  1 files changed, 4 insertions(+), 1 deletions(-)
> > > >
> > > > diff --git
> > > > a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > > b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > > index e8e0787..e554b26 100644
> > > > --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > > @@ -25,7 +25,10 @@ S =3D "${WORKDIR}/git"
> > > >  COMPATIBLE_HOST =3D "(x86_64|powerpc|powerpc64|aarch64|arm).*-linu=
x*"
> > > >
> > > >  LIBARGS =3D "LIB32=3D${baselib} LIB64=3D${baselib}"
> > > > -EXTRA_OEMAKE =3D "'ARCH=3D${TARGET_ARCH}' 'OPT=3D${CFLAGS}' 'CC=3D=
${CC}'
> > > > ${LIBARGS}
> > > V=3D1"
> > > > +LIBHUGETLBFS_ARCH =3D "${TARGET_ARCH}"
> > > > +LIBHUGETLBFS_ARCH_powerpc =3D "ppc"
> > > > +LIBHUGETLBFS_ARCH_powerpc64 =3D "ppc64"
> > > > +EXTRA_OEMAKE =3D "'ARCH=3D${LIBHUGETLBFS_ARCH}' 'OPT=3D${CFLAGS}' =
'CC=3D${CC}'
> > > ${LIBARGS} V=3D2"
> > > >  PARALLEL_MAKE =3D ""
> > > >  CFLAGS +=3D "-fexpensive-optimizations -frename-registers
> > > > -fomit-frame-
> > > pointer -g0"
> > >
> > > libhugetlbfs is currently failing with
> > > http://logs.nslu2-
> > > linux.org/buildlogs/oe/world/log.dependencies.20140714_130534.log/3_
> > > min/failed
> > > /libhugetlbfs.log
> >
> > I think the issue was fixed by this patch:
> > http://cgit.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&=
i
> > d=3D66709a85a2c0d0fdfadbd9832cb8056e65b39a36
> >
> > >
> > > and it also fails to build for qemux86-64 (log in last world status e=
-
> mail).
> > >
>=20
> with all the libhugetlbfs patches included I still get
>=20
> NOTE: recipe libhugetlbfs-1_2.18-r0: task do_compile: Started
> ERROR: Function failed: do_compile (log file is located at
> /home/jenkins/oe/world/shr-core/tmp-eglibc/work/core2-64-oe-
> linux/libhugetlbfs/1_2.18-r0/temp/log.do_compile.7225)
> ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-
> eglibc/work/core2-64-oe-linux/libhugetlbfs/1_2.18-r0/temp/log.do_compile.=
7225
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make ARCH=3Dx86_64 OPT=3D -O2 -pipe -g
> | -feliminate-unused-debug-types -fexpensive-optimizations
> | -frename-registers -fomit-frame-pointer -g0 CC=3Dx86_64-oe-linux-gcc
> | -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -Wl,-O1
> | -Wl,--hash-style=3Dgnu -Wl,--as-needed
> | --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86=
-64
> LIB32=3Dlib LIB64=3Dlib V=3D2 ./localversion
> version ./libhugetlbfs_testprobes.h ./libhugetlbfs_privutils.h ./libhuget=
lbfs_
> internal.h ./libhugetlbfs_debug.h ./kernel-features.h ./hugetlbfs.h *.c *=
.lds
> Makefile version update: 2.18 version string: 2.18 (modified) x86_64-oe-l=
inux-
> gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -Wl,-O1 -Wl=
,--hash-
> style=3Dgnu -Wl,--as-needed --sysroot=3D/home/jenkins/oe/world/shr-core/t=
mp-
> eglibc/sysroots/qemux86-64 -m32  -D__LIBHUGETLBFS__  -O2 -pipe -g -felimi=
nate-
> unused-debug-types -fexpensive-optimizations -frename-registers -fomit-fr=
ame-
> pointer -g0 -Wall -fPIC -o obj32/elflink.o -c elflink.c In file included =
from
> /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-
> 64/usr/include/features.h:402:0,
> |                  from /home/jenkins/oe/world/shr-core/tmp-
> eglibc/sysroots/qemux86-64/usr/include/stdio.h:27,
> |                  from elflink.c:23:
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/inc
> | lude/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file or
> directory  # include <gnu/stubs-32.h>
> |                            ^
> | compilation terminated.
> | make: *** [obj32/elflink.o] Error 1
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> | /home/jenkins/oe/world/shr-core/tmp-eglibc/work/core2-64-oe-linux/libh
> | ugetlbfs/1_2.18-r0/temp/log.do_compile.7225)
> NOTE: recipe libhugetlbfs-1_2.18-r0: task do_compile: Failed
> ERROR: Task 25874 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta=
-
> oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb, do_compile) failed=
 with
> exit code '1'

So 'BUILDTYPE=3DNATIVEONLY' is needed for all 64bit platforms, not only pow=
erpc64.

>=20
> > > Can we please fix it first?
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

