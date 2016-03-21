Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id CFE0D6212F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 10:05:46 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2LA5jIO022948; Mon, 21 Mar 2016 05:05:45 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016032105054566-20027 ;
	Mon, 21 Mar 2016 05:05:45 -0500 
Date: Mon, 21 Mar 2016 12:05:07 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160321120507.226accc0@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <20160321095952.GB2562@jama>
References: <1458313594-11011-1-git-send-email-adrian.ratiu@ni.com>
	<20160318160431.GC2555@jama>
	<20160321110104.0d6b67d0@adi-pc-linux.emea.corp.natinst.com>
	<20160321095727.GA2562@jama> <20160321095952.GB2562@jama>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/21/2016 05:05:46 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/21/2016 05:05:46 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-21_04:, , signatures=0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] ttf-pt-sans: add recipe
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
X-List-Received-Date: Mon, 21 Mar 2016 10:05:48 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Mar 2016 10:59:52 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Mar 21, 2016 at 10:57:27AM +0100, Martin Jansa wrote:
> > On Mon, Mar 21, 2016 at 11:01:04AM +0200, Ioan-Adrian Ratiu wrote: =20
> > > On Fri, 18 Mar 2016 17:04:31 +0100
> > > Martin Jansa <martin.jansa@gmail.com> wrote:
> > >  =20
> > > > On Fri, Mar 18, 2016 at 05:06:34PM +0200, Ioan-Adrian Ratiu wrote: =
=20
> > > > > PT Sans is an open source licensed font released in 2010 by ParaT=
ype.
> > > > > The ParaTypeFFL-1.3 license file has been submitted to OE-core.
> > > > >=20
> > > > > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > > > > ---
> > > > >  .../recipes-graphics/ttf-fonts/ttf-pt-sans=5F1.1.bb  | 39 ++++++=
++++++++++++++++
> > > > >  1 file changed, 39 insertions(+)
> > > > >  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-pt-san=
s=5F1.1.bb
> > > > >=20
> > > > > diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans=5F1.1=
.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans=5F1.1.bb
> > > > > new file mode 100644
> > > > > index 0000000..dcfa080
> > > > > --- /dev/null
> > > > > +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans=5F1.1.bb
> > > > > @@ -0,0 +1,39 @@
> > > > > +SUMMARY =3D "PT Sans Fonts"
> > > > > +DESCRIPTION =3D "The PT Sans TTF font set"
> > > > > +HOMEPAGE =3D "http://www.paratype.com/public/"
> > > > > +
> > > > > +SECTION =3D "x11/fonts"
> > > > > +
> > > > > +LICENSE =3D "ParaTypeFFL-1.3"
> > > > > +LIC=5FFILES=5FCHKSUM =3D "file://../PT%20Free%20Font%20License=
=5Feng.txt;md5=3Dd720f3a281ed81c3f4cfc465e11b1d0d"
> > > > > +
> > > > > +inherit fontcache   =20
> > > >=20
> > > > Still missing layer.conf additions. =20
> > >=20
> > > I am not sure I understand what are these layer.conf additions.
> > > Do I need to add the recipe to SIGGEN=5FEXCLUDE=5FSAFE=5FRECIPE=5FDEP=
S? (i doubt it since I'm not using ttf.inc) =20
> >=20
> > Yes, fontconfig-utils dependency is added by fontcache.bbclass which
> > you're using. =20
>=20
> Ahh now I see that you've dropped allarch inherit in v2.
> So it will work without SIGGEN=5FEXCLUDE=5FSAFE=5FRECIPE=5FDEPS.
>=20
> But you can still "optimise" it by returning allarch and adding
> SIGGEN=5FEXCLUDE=5FSAFE=5FRECIPE=5FDEPS

Yes, I'll do that. Thank you!

>=20
> > > > Use 4 spaces for indentation.
> > > >  =20
> > > > > +# Downloading from fedora because upstream doesn't version its z=
ip file
> > > > > +# and causes hash build failures
> > > > > +SRC=5FURI =3D "http://pkgs.fedoraproject.org/repo/pkgs/paratype-=
pt-sans-fonts/PTSans.zip/c3f5a0e20a75cf628387510a720924a7/PTSans.zip"
> > > > > +
> > > > > +SRC=5FURI[md5sum] =3D "c3f5a0e20a75cf628387510a720924a7"
> > > > > +SRC=5FURI[sha256sum] =3D "0164f824e03c32c99e8a225853ec168893a04a=
09ade132e93a674e85ae033b2e"
> > > > > +
> > > > > +do=5Finstall () {
> > > > > +	install -d ${D}${datadir}/fonts/X11/TTF/
> > > > > +	cd ..
> > > > > +	for i in *.ttf; do
> > > > > +		install -m 0644 $i ${D}${prefix}/share/fonts/X11/TTF/${i}
> > > > > +	done
> > > > > +}
> > > > > +
> > > > > +FILES=5F${PN} +=3D "${datadir}"
> > > > > +
> > > > > +pkg=5Fpostinst=5F${PN} () {
> > > > > +        set -x
> > > > > +        for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
> > > > > +                mkfontdir $fontdir
> > > > > +                mkfontscale $fontdir
> > > > > +        done
> > > > > +        for fontdir in `find $D/usr/share/fonts/X11 -type d`; do
> > > > > +                mkfontdir $fontdir
> > > > > +                mkfontscale $fontdir
> > > > > +        done
> > > > > +}
> > > > > --=20
> > > > > 2.7.3
> > > > >    =20
> > > >  =20
> > >  =20
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com =20
>=20
>=20
>=20


