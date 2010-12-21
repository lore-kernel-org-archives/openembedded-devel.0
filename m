Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1PV2Ao-0007rx-Ij
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 14:22:39 +0100
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id oBLDMUr9007609
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 07:22:30 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id oBLDMUXP027427
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 07:22:30 -0600 (CST)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBLDMUGT003652
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 07:22:30 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Tue, 21 Dec 2010 07:22:30 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Dec 2010 07:22:28 -0600
Thread-Topic: [oe] [PATCH 1/2] package ipk bbclass: store build branch and
	revision in ipkg metadata
Thread-Index: Acug+tPDSoiJV/2WSDC35tR+Xam8VwAFvGoA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329E930FE@dlee06.ent.ti.com>
References: <1292925966-65237-1-git-send-email-koen@openembedded.org>
	<iepusv$t59$1@dough.gmane.org> <20101221103004.GH3282@jama>
In-Reply-To: <20101221103004.GH3282@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] package ipk bbclass: store build branch and revision in ipkg metadata
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Dec 2010 13:22:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Tuesday, December 21, 2010 4:30 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH 1/2] package ipk bbclass: store build branch and
> revision in ipkg metadata
>=20
> On Tue, Dec 21, 2010 at 11:18:07AM +0100, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > There is no 2/2, this is the only patch in the series, I had a git
> > format-patch slip up on my end.
>=20
> Ah :), looks usefull to me
>=20
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

I agree.  Thanks for adding this.

Acked-by: Chase Maupin <chase.maupin@ti.com>

>=20
> > On 21-12-10 11:06, Koen Kooi wrote:
> > > The ipkg metadata will look like this now:
> > >
> > > koen@dominion:/OE/angstrom-dev/deploy/glibc$ dpkg-deb -I ipk/am3517-
> evm/matrix-gui_1.3-r19.0.6_am3517-evm.ipk
> > >  new debian package, version 2.0.
> > >  size 24112 bytes: control archive=3D 540 bytes.
> > >      629 bytes,    13 lines      control
> > >  Package: matrix-gui
> > >  Version: 1.3-r19.0.6
> > >  Description: Matrix GUI for Qt X11
> > >  Section: multimedia
> > >  Priority: optional
> > >  Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org=
>
> > >  License: BSD
> > >  Architecture: am3517-evm
> > >  OE: matrix-gui
> > >  Homepage: https://gforge.ti.com/gf/project/matrix_gui/
> > >  Build: org.openembedded.dev/f35ab2d
> > >  Depends: matrix-gui-common, libpng12-0, libfreetype6, libz1,
> libgthread-2.0-0, libqtwebkit4, libphonon4, libqtdbus4, libqtxml4,
> libqtgui4, libqtnetwork4, libqtcore4, libglib-2.0-0, libc6, libstdc++6,
> libgcc1
> > >  Source:
> svn://gforge.ti.com/svn/matrix_gui/;module=3Dtrunk;proto=3Dhttps;user=3Da=
nonymou
> s;pswd=3D''
> > > koen@dominion:/OE/angstrom-dev/deploy/glibc$
> > >
> > > Signed-off-by: Koen Kooi <koen@openembedded.org>
> > > ---
> > >  classes/package_ipk.bbclass |    1 +
> > >  1 files changed, 1 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclas=
s
> > > index 5d388da..97e5cd8 100644
> > > --- a/classes/package_ipk.bbclass
> > > +++ b/classes/package_ipk.bbclass
> > > @@ -224,6 +224,7 @@ python do_package_ipk () {
> > >  		fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
> > >  		fields.append(["OE: %s\n", ['PN']])
> > >  		fields.append(["Homepage: %s\n", ['HOMEPAGE']])
> > > +		fields.append(["Build: %s/%s\n", ['METADATA_BRANCH',
> 'METADATA_REVISION']])
> > >
> > >  		def pullData(l, d):
> > >  			l2 =3D []
> >
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.5 (Darwin)
> >
> > iD8DBQFNEH7fMkyGM64RGpERAtfoAJ4wwHII7rXn7YG4gCKFSQd1B9SmEACeIg/Y
> > rhw39nBhCibyooRTxx+zAZM=3D
> > =3DSkML
> > -----END PGP SIGNATURE-----
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


