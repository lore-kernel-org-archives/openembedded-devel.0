Return-Path: <ben.shelton@ni.com>
Received: from ni.com (unknown [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 83D9060167
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 14:52:07 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s4DEq8h0030830 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 09:52:08 -0500
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP5)
	with ESMTP id 2014051309520897-1049779 ;
	Tue, 13 May 2014 09:52:08 -0500 
Date: Tue, 13 May 2014 09:52:03 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140513145203.GA31462@bshelton-desktop>
References: <cover.1399914295.git.ben.shelton@ni.com>
	<139978ea7125a5ffb15a583faef889b1409e3987.1399914295.git.ben.shelton@ni.com>
	<8672BB614B4CCA40A6B3BDD6FD82050BA112C7DD@COSNADEXC13.usr.ingenico.loc>
	<20140513082931.GK22774@jama>
MIME-Version: 1.0
In-Reply-To: <20140513082931.GK22774@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP5|July 31, 2013) at 05/13/2014 09:52:08 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP5|July
	31, 2013) at 05/13/2014 09:52:09 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.11.96, 1.0.14,
	0.0.0000
	definitions=2014-05-13_03:2014-05-13, 2014-05-13,
	1970-01-01 signatures=0
Subject: Re: [meta-oe][PATCH 1/7] bdftopcf: add recipe
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
X-List-Received-Date: Tue, 13 May 2014 14:52:14 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/13, Martin Jansa wrote:
> On Tue, May 13, 2014 at 08:08:18AM +0000, Matthieu CRAPET wrote:
> > Hi,
> >=20
> > Did you reused this recipe:
> > https://www.mail-archive.com/openembedded-devel%40lists.openembedded.or=
g/msg35721.html
> > If so, you could give some credits to the original author.
>=20
> But it doesn't seem to address the review comments in original patch.
>=20

I thought the issue with the original patch was that the "require
recipes-graphics/xorg-app/xorg-app-common.inc" line needed to be moved
to the top of the recipe to fix the build.  Are there other changes that
need to be made?

Thanks,
Ben

> > -----Message d'origine-----
> > De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openem=
bedded-devel-bounces@lists.openembedded.org] De la part de Ben Shelton
> > Envoy=E9=A0: lundi 12 mai 2014 19:32
> > =C0=A0: openembedded-devel@lists.openembedded.org
> > Objet=A0: [oe] [meta-oe][PATCH 1/7] bdftopcf: add recipe
> >=20
> > The bdftopcf tool is necessary to build the core X fonts, which ship in=
 BDF format.  Adapted from a recipe in OE-Classic and from an earlier maili=
ng list post by Trevor Woerner.
> >=20
> > Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> > ---
> >  meta-oe/recipes-graphics/xorg-app/bdftopcf=5F1.0.4.bb | 13 +++++++++++=
++
> >  1 file changed, 13 insertions(+)
> >  create mode 100644 meta-oe/recipes-graphics/xorg-app/bdftopcf=5F1.0.4.=
bb
> >=20
> > diff --git a/meta-oe/recipes-graphics/xorg-app/bdftopcf=5F1.0.4.bb b/me=
ta-oe/recipes-graphics/xorg-app/bdftopcf=5F1.0.4.bb
> > new file mode 100644
> > index 0000000..5009d54
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/xorg-app/bdftopcf=5F1.0.4.bb
> > @@ -0,0 +1,13 @@
> > +require recipes-graphics/xorg-app/xorg-app-common.inc
> > +
> > +SUMMARY =3D "bdftopcf is a tool to convert BDF fonts to PCF fonts"
> > +HOMEPAGE =3D "http://cgit.freedesktop.org/xorg/app/bdftopcf/"
> > +SECTION =3D "x11/app"
> > +LICENSE =3D "MIT"
> > +LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3Df9a35333adf75edd1eaef84=
bca65a490"
> > +DEPENDS =3D "libxfont"
> > +
> > +SRC=5FURI[md5sum] =3D "96a648a332160a7482885800f7a506fa"
> > +SRC=5FURI[sha256sum] =3D "eaf59057ba3d7cffe29526562ce50868da7da823487a=
4cfb3e16946e5ffd2798"
> > +
> > +BBCLASSEXTEND =3D "native"
> > --
> > 1.9.3
> >=20
> > --
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --=20
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



> --=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


