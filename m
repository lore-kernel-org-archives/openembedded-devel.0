Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 565F67680A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Apr 2016 13:34:33 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u34DYUp7009892; Mon, 4 Apr 2016 08:34:30 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016040408343068-525878 ;
	Mon, 4 Apr 2016 08:34:30 -0500 
Date: Mon, 4 Apr 2016 16:33:56 +0300
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20160404163356.5dc7b888@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <20160401195341.GC16135@denix.org>
References: <1458640636-9492-1-git-send-email-adrian.ratiu@ni.com>
	<20160401113608.GD2567@jama> <20160401195341.GC16135@denix.org>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 04/04/2016 08:34:30 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 04/04/2016 08:34:30 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-04_06:, , signatures=0
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
X-List-Received-Date: Mon, 04 Apr 2016 13:34:35 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello

On Fri, 1 Apr 2016 15:53:41 -0400
Denys Dmytriyenko <denis@denix.org> wrote:

> On Fri, Apr 01, 2016 at 01:36:08PM +0200, Martin Jansa wrote:
> > On Tue, Mar 22, 2016 at 11:57:16AM +0200, Ioan-Adrian Ratiu wrote: =20
> > > This recipe is for a TI WiFi calibrator utility [1]. The firmware from
> > > this project is already shipped inside linux-firmware so we do not
> > > package it in this recipe.
> > >=20
> > > [1] http://linuxwireless.sipsolutions.net/en/users/Drivers/wl12xx/#Ca=
libration
> > >=20
> > > Signed-off-by: James Minor <james.minor@ni.com>
> > > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > > ---
> > >  .../ti-wifi-utils/ti-wifi-utils=5Fgit.bb             | 24 ++++++++++=
++++++++++++
> > >  1 file changed, 24 insertions(+)
> > >  create mode 100644 meta-oe/recipes-connectivity/ti-wifi-utils/ti-wif=
i-utils=5Fgit.bb
> > >=20
> > > diff --git a/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils=
=5Fgit.bb b/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils=5Fgit.=
bb
> > > new file mode 100644
> > > index 0000000..fcae729
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-connectivity/ti-wifi-utils/ti-wifi-utils=5Fgit.=
bb
> > > @@ -0,0 +1,24 @@
> > > +SUMMARY =3D "The calibrator and other useful utilities for TI wirele=
ss solution based on wl12xx driver"
> > > +LICENSE =3D "BSD-3-Clause"
> > > +LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3D4725015cb0be7be389cf0=
6deeae3683d"
> > > +
> > > +DEPENDS =3D "libnl"
> > > +
> > > +PV =3D "0.1+gitr${SRCPV}"
> > > +
> > > +SRCREV =3D "b03d9ce6362e6d22d6929f2736409af3b0fd3c88"
> > > +SRC=5FURI =3D "git://github.com/TI-OpenLink/ti-utils.git;branch=3Dr5=
-jb"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +EXTRA=5FOEMAKE =3D 'CROSS=5FCOMPILE=3D${TARGET=5FPREFIX} \
> > > +                CC=3D"${TARGET=5FPREFIX}gcc ${TOOLCHAIN=5FOPTIONS}" =
\ =20
>=20
> Reinventing the wheel much?
>=20
> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dti-w=
ifi-utils
>=20

Yes, it is a duplicate. How about keeping the recipe in meta-oe to make it =
usable without adding arago distributions layers?

Thank you,
Ioan-Adrian

>=20
> > This doesn't respect all flags usually available in $CC variable, why
> > haven't you used $CC?
> >=20
> > Maybe it's other part of Makefiles which is using CROSS=5FCOMPILE inste=
ad
> > of CC, but currently it's failing e.g. for hardfloat builds with
> > typical:
> >=20
> > ../SYSROOT/MACHINE/usr/include/gnu/stubs.h:7:29: fatal error: gnu/stubs=
-soft.h: No such file or directory
> >=20
> > because the build doesn't have correct -mfloat-abi parameter
> >=20
> > | arm-DISTRO-linux-gnueabi-gcc  --sysroot=3D/SYSROOTS/MACHINE -O2 -pipe=
 -g -feliminate-unused-debug-types -fdebug-prefix-map=3DTMPDIRwork/MACHINE-=
DISTRO-linux-gnueabi/ti-wifi-utils/0.1+gitrAUTOINC+b03d9ce636-r0=3D/usr/src=
/debug/ti-wifi-utils/0.1+gitrAUTOINC+b03d9ce636-r0 -fdebug-prefix-map=3DTMP=
DIRsysroots/x86=5F64-linux=3D -fdebug-prefix-map=3D/SYSROOTS/MACHINE=3D  -I=
/SYSROOTS/MACHINE/usr/include/libnl3 -DCONFIG=5FLIBNL20   -c -o misc=5Fcmds=
.o misc=5Fcmds.c
> >  =20
> > > +                CFLAGS=3D"${CFLAGS} -I${STAGING=5FINCDIR}/libnl3 -DC=
ONFIG=5FLIBNL20" NLVER=3D3 \
> > > +                LDFLAGS=3D"${LDFLAGS} ${TOOLCHAIN=5FOPTIONS}" \
> > > +'
> > > +
> > > +#only install the calibrator utility, firmware is already within lin=
ux-firmware
> > > +do=5Finstall() {
> > > +    install -d ${D}${bindir}
> > > +    install -m 0755 calibrator ${D}${bindir}/
> > > +}
> > > --=20
> > > 2.7.4
> > >  =20
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com =20
>=20
>=20
>=20
> > --=20
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel =20
>=20


