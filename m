Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 16FF573216
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Apr 2016 07:07:11 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u3477Bih018882; Mon, 4 Apr 2016 02:07:11 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016040402071163-512024 ;
	Mon, 4 Apr 2016 02:07:11 -0500 
Date: Mon, 4 Apr 2016 10:06:43 +0300
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160404100643.4d2490e3@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <20160401113608.GD2567@jama>
References: <1458640636-9492-1-git-send-email-adrian.ratiu@ni.com>
	<20160401113608.GD2567@jama>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 04/04/2016 02:07:11 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 04/04/2016 02:07:11 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-04_01:, , signatures=0
Cc: James Minor <james.minor@ni.com>, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ti-wifi-utils: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Apr 2016 07:07:14 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello

On Fri, 1 Apr 2016 13:36:08 +0200
Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Mar 22, 2016 at 11:57:16AM +0200, Ioan-Adrian Ratiu wrote:
> > This recipe is for a TI WiFi calibrator utility [1]. The firmware from
> > this project is already shipped inside linux-firmware so we do not
> > package it in this recipe.
> >=20
> > [1] http://linuxwireless.sipsolutions.net/en/users/Drivers/wl12xx/#Cali=
bration
> >=20
> > Signed-off-by: James Minor <james.minor@ni.com>
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >  .../ti-wifi-utils/ti-wifi-utils=5Fgit.bb             | 24 ++++++++++++=
++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-=
utils=5Fgit.bb
> >=20
> > diff --git a/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils=
=5Fgit.bb b/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils=5Fgit.=
bb
> > new file mode 100644
> > index 0000000..fcae729
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils=5Fgit.bb
> > @@ -0,0 +1,24 @@
> > +SUMMARY =3D "The calibrator and other useful utilities for TI wireless=
 solution based on wl12xx driver"
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3D4725015cb0be7be389cf06d=
eeae3683d"
> > +
> > +DEPENDS =3D "libnl"
> > +
> > +PV =3D "0.1+gitr${SRCPV}"
> > +
> > +SRCREV =3D "b03d9ce6362e6d22d6929f2736409af3b0fd3c88"
> > +SRC=5FURI =3D "git://github.com/TI-OpenLink/ti-utils.git;branch=3Dr5-j=
b"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +EXTRA=5FOEMAKE =3D 'CROSS=5FCOMPILE=3D${TARGET=5FPREFIX} \
> > +                CC=3D"${TARGET=5FPREFIX}gcc ${TOOLCHAIN=5FOPTIONS}" \ =
=20
>=20
> This doesn't respect all flags usually available in $CC variable, why
> haven't you used $CC?
>=20
> Maybe it's other part of Makefiles which is using CROSS=5FCOMPILE instead
> of CC, but currently it's failing e.g. for hardfloat builds with
> typical:
>=20
> ../SYSROOT/MACHINE/usr/include/gnu/stubs.h:7:29: fatal error: gnu/stubs-s=
oft.h: No such file or directory
>=20
> because the build doesn't have correct -mfloat-abi parameter
>=20
> | arm-DISTRO-linux-gnueabi-gcc  --sysroot=3D/SYSROOTS/MACHINE -O2 -pipe -=
g -feliminate-unused-debug-types -fdebug-prefix-map=3DTMPDIRwork/MACHINE-DI=
STRO-linux-gnueabi/ti-wifi-utils/0.1+gitrAUTOINC+b03d9ce636-r0=3D/usr/src/d=
ebug/ti-wifi-utils/0.1+gitrAUTOINC+b03d9ce636-r0 -fdebug-prefix-map=3DTMPDI=
Rsysroots/x86=5F64-linux=3D -fdebug-prefix-map=3D/SYSROOTS/MACHINE=3D  -I/S=
YSROOTS/MACHINE/usr/include/libnl3 -DCONFIG=5FLIBNL20   -c -o misc=5Fcmds.o=
 misc=5Fcmds.c
>=20

Since this is already in master, I'll submit another patch to fix this and =
use $CC properly.

Thank you,
Ionel

> > +                CFLAGS=3D"${CFLAGS} -I${STAGING=5FINCDIR}/libnl3 -DCON=
FIG=5FLIBNL20" NLVER=3D3 \
> > +                LDFLAGS=3D"${LDFLAGS} ${TOOLCHAIN=5FOPTIONS}" \
> > +'
> > +
> > +#only install the calibrator utility, firmware is already within linux=
-firmware
> > +do=5Finstall() {
> > +    install -d ${D}${bindir}
> > +    install -m 0755 calibrator ${D}${bindir}/
> > +}
> > --=20
> > 2.7.4
> >  =20
>=20


