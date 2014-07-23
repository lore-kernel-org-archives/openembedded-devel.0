Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3F07670761
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 08:50:57 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so827617wes.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 01:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Cg4nWGDH2OcLI2r1keDxTLh8HrS9EVPW+BeBGe8MH+Q=;
	b=sW4F7GhxjCYKwbcKxDNg1msUbmu534tUuZdVzans9sGVpgulpwi1wifNQVRm/jvSnY
	psUAbqPDPvtpgp7Eu4avZ5mTCyMsp+IifXxZMbHP2IWQ4/MLA5Kl7SWuVmk4VhNAB8rl
	LS/IX041xh7kKjoaKT+BS/7gAV/k5XsESBq5f2HZd6eb9LsDAVJPhlpCjJ4WKTQty6mO
	lfeUemvEiMdoKb5+vo1KLf4qScaAQ0dMSTtUwOyRQNhM5y3/1fAcKCsKyz9gJdoUIDfe
	f4gi7XcrYc+G8SopDA3uyVjgJ/Id0I/Qji6gxdqd5LSYl+dW8PdCV4D2wZKhl4ryVetB
	spGA==
X-Received: by 10.180.81.103 with SMTP id z7mr22397003wix.23.1406105457075;
	Wed, 23 Jul 2014 01:50:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	20sm4318514wjt.42.2014.07.23.01.50.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 01:50:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Jul 2014 10:51:10 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140723085110.GA22875@jama>
References: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
	<1405491841-24744-2-git-send-email-ting.liu@freescale.com>
	<20140716132725.GX2433@jama>
	<960fede6c06346c78c13b2cc097255dc@BN1PR03MB156.namprd03.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <960fede6c06346c78c13b2cc097255dc@BN1PR03MB156.namprd03.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Wed, 23 Jul 2014 08:51:04 -0000
X-Groupsio-MsgNum: 51198
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BtLpl2nkGUzqmEOn"
Content-Disposition: inline

--BtLpl2nkGUzqmEOn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2014 at 07:09:18AM +0000, ting.liu@freescale.com wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:openemb=
edded-
> > devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> > Sent: Wednesday, July 16, 2014 9:27 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: yocto@mindchasers.com
> > Subject: Re: [oe] [meta-oe][PATCH 1/3] libhugetlbfs: use ARCH ppc/ppc64=
 for
> > powerpc/powerpc64
> >=20
> > On Wed, Jul 16, 2014 at 02:23:59PM +0800, ting.liu@freescale.com wrote:
> > > From: Ting Liu <b28495@freescale.com>
> > >
> > > In recent libhugetlbfs source, powerpc/powerpc64 is changed back to
> > > ppc/ppc64 (to match with the output of `uname -a`).
> > >
> > > Update the recipe to avoid build issue for now.
> > >
> > > Signed-off-by: Ting Liu <b28495@freescale.com>
> > > ---
> > >  .../libhugetlbfs/libhugetlbfs_git.bb               |    5 ++++-
> > >  1 files changed, 4 insertions(+), 1 deletions(-)
> > >
> > > diff --git
> > > a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > index e8e0787..e554b26 100644
> > > --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > @@ -25,7 +25,10 @@ S =3D "${WORKDIR}/git"
> > >  COMPATIBLE_HOST =3D "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> > >
> > >  LIBARGS =3D "LIB32=3D${baselib} LIB64=3D${baselib}"
> > > -EXTRA_OEMAKE =3D "'ARCH=3D${TARGET_ARCH}' 'OPT=3D${CFLAGS}' 'CC=3D${=
CC}' ${LIBARGS}
> > V=3D1"
> > > +LIBHUGETLBFS_ARCH =3D "${TARGET_ARCH}"
> > > +LIBHUGETLBFS_ARCH_powerpc =3D "ppc"
> > > +LIBHUGETLBFS_ARCH_powerpc64 =3D "ppc64"
> > > +EXTRA_OEMAKE =3D "'ARCH=3D${LIBHUGETLBFS_ARCH}' 'OPT=3D${CFLAGS}' 'C=
C=3D${CC}'
> > ${LIBARGS} V=3D2"
> > >  PARALLEL_MAKE =3D ""
> > >  CFLAGS +=3D "-fexpensive-optimizations -frename-registers -fomit-fra=
me-
> > pointer -g0"
> >=20
> > libhugetlbfs is currently failing with
> > http://logs.nslu2-
> > linux.org/buildlogs/oe/world/log.dependencies.20140714_130534.log/3_min=
/failed
> > /libhugetlbfs.log
>=20
> I think the issue was fixed by this patch:
> http://cgit.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D66709a85a2c0d0fdfadbd9832cb8056e65b39a36
>=20
> >=20
> > and it also fails to build for qemux86-64 (log in last world status e-m=
ail).
> >=20

with all the libhugetlbfs patches included I still get

NOTE: recipe libhugetlbfs-1_2.18-r0: task do_compile: Started
ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe=
/world/shr-core/tmp-eglibc/work/core2-64-oe-linux/libhugetlbfs/1_2.18-r0/te=
mp/log.do_compile.7225)
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-eg=
libc/work/core2-64-oe-linux/libhugetlbfs/1_2.18-r0/temp/log.do_compile.7225
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make ARCH=3Dx86_64 OPT=3D -O2 -pipe -g -feliminate-unused-debug-typ=
es -fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0 CC=
=3Dx86_64-oe-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed --sysroot=3D/home/jen=
kins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64 LIB32=3Dlib LIB64=3Dl=
ib V=3D2
| ./localversion version ./libhugetlbfs_testprobes.h ./libhugetlbfs_privuti=
ls.h ./libhugetlbfs_internal.h ./libhugetlbfs_debug.h ./kernel-features.h .=
/hugetlbfs.h *.c *.lds Makefile
| version update: 2.18
| version string: 2.18 (modified)
| x86_64-oe-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed --sysroot=3D/home/jen=
kins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64 -m32  -D__LIBHUGETLBF=
S__  -O2 -pipe -g -feliminate-unused-debug-types -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -g0 -Wall -fPIC -o obj32/elflink.o =
-c elflink.c
| In file included from /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots=
/qemux86-64/usr/include/features.h:402:0,
|                  from /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots=
/qemux86-64/usr/include/stdio.h:27,
|                  from elflink.c:23:
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/includ=
e/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file or directory
|  # include <gnu/stubs-32.h>
|                            ^
| compilation terminated.
| make: *** [obj32/elflink.o] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-eglibc/work/core2-64-oe-linux/libhugetlbfs/1_2.18-r0/=
temp/log.do_compile.7225)
NOTE: recipe libhugetlbfs-1_2.18-r0: task do_compile: Failed
ERROR: Task 25874 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-o=
e/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb, do_compile) failed wi=
th exit code '1'

> > Can we please fix it first?
> >=20
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BtLpl2nkGUzqmEOn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPPd34ACgkQN1Ujt2V2gBx9egCfaa+JrSbEYbCsPBu+8kh7PMbv
cKUAoLK3s5MW2HkSDB+YXrlgfdPLS0VS
=AEuT
-----END PGP SIGNATURE-----

--BtLpl2nkGUzqmEOn--
