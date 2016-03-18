Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 75AD86072C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 13:38:32 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2IDcWmA006663; Fri, 18 Mar 2016 08:38:32 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016031808383290-1545108 ;
	Fri, 18 Mar 2016 08:38:32 -0500 
Date: Fri, 18 Mar 2016 15:38:01 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160318153801.04c011de@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <20160318133410.GB2555@jama>
References: <1458305944-3510-1-git-send-email-adrian.ratiu@ni.com>
	<20160318133410.GB2555@jama>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/18/2016 08:38:33 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/18/2016 08:38:33 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-18_07:, , signatures=0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ttf-pt-sans: add recipe
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
X-List-Received-Date: Fri, 18 Mar 2016 13:38:33 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Mar 2016 14:34:10 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, Mar 18, 2016 at 02:59:04PM +0200, Ioan-Adrian Ratiu wrote:
> > PT Sans is an open source licensed font released in 2010 by ParaType.
> > The ParaTypeFFL-1.3 license file has been submitted to OE-core.
> >=20
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >  .../recipes-graphics/ttf-fonts/ttf-pt-sans=5F1.1.bb  | 44 ++++++++++++=
++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans=5F1.=
1.bb
> >=20
> > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans=5F1.1.bb b/=
meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans=5F1.1.bb
> > new file mode 100644
> > index 0000000..b7f4548
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans=5F1.1.bb
> > @@ -0,0 +1,44 @@
> > +SUMMARY =3D "PT Sans Fonts"
> > +DESCRIPTION =3D "The PT Sans TTF font set"
> > +HOMEPAGE =3D "http://www.paratype.com/public/"
> > +
> > +SECTION =3D "x11/fonts"
> > +
> > +LICENSE =3D "ParaTypeFFL-1.3"
> > +LIC=5FFILES=5FCHKSUM =3D "file://../PT%20Free%20Font%20License=5Feng.t=
xt;md5=3Dd720f3a281ed81c3f4cfc465e11b1d0d"
> > +
> > +inherit allarch fontcache =20
>=20
> This cannot be allarch when it depends on TUNE=5FPKGARCH fontconfig, see
> layer.conf and send v2.
>=20
> > +RDEPENDS=5F${PN} =3D "fontconfig-utils" =20
>=20
> This is already added by fontcache.bbclass.
>=20
> > +
> > +FONT=5FPACKAGES =3D "${PN}" =20
>=20
> This is the default, why do you assign it here?

Ah sorry I thought I removed this but it was in another version. I'll fix t=
hese issues and send v2.

Thank you

>=20
> > +
> > +# Downloading from fedora because upstream doesn't version its zip file
> > +# and causes hash build failures
> > +SRC=5FURI =3D "http://pkgs.fedoraproject.org/repo/pkgs/paratype-pt-san=
s-fonts/PTSans.zip/c3f5a0e20a75cf628387510a720924a7/PTSans.zip"
> > +
> > +SRC=5FURI[md5sum] =3D "c3f5a0e20a75cf628387510a720924a7"
> > +SRC=5FURI[sha256sum] =3D "0164f824e03c32c99e8a225853ec168893a04a09ade1=
32e93a674e85ae033b2e"
> > +
> > +do=5Finstall () {
> > +	install -d ${D}${datadir}/fonts/X11/TTF/
> > +	cd ..
> > +	for i in *.ttf; do
> > +		install -m 0644 $i ${D}${prefix}/share/fonts/X11/TTF/${i}
> > +	done
> > +}
> > +
> > +FILES=5F${PN} +=3D "${datadir}"
> > +
> > +pkg=5Fpostinst=5F${PN} () {
> > +        set -x
> > +        for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
> > +                mkfontdir $fontdir
> > +                mkfontscale $fontdir
> > +        done
> > +        for fontdir in `find $D/usr/share/fonts/X11 -type d`; do
> > +                mkfontdir $fontdir
> > +                mkfontscale $fontdir
> > +        done
> > +}
> > +
> > --=20
> > 2.7.3
> >=20
> > --=20
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel =20
>=20


