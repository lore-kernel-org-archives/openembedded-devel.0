Return-Path: <prvs=77876d966=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 593 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 Dec 2015 09:34:07 UTC
Received: from esa9.bmw.c3s2.iphmx.com (esa9.bmw.c3s2.iphmx.com
	[68.232.133.110])
	by mail.openembedded.org (Postfix) with ESMTP id BDC616E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 09:34:07 +0000 (UTC)
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa9.bmw.c3s2.iphmx.com with ESMTP/TLS; 09 Dec 2015 10:24:15 +0100
Received: from unknown (HELO esabb2.muc) ([160.50.100.34]) by esagw2.muc with
	ESMTP/TLS; 09 Dec 2015 10:24:13 +0100
Received: from smuch52b.muc (HELO SMUCH52B.europe.bmw.corp) ([160.46.137.114])
	by esabb2.muc with ESMTP/TLS; 09 Dec 2015 10:24:12 +0100
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH52B.europe.bmw.corp ([160.46.137.114]) with mapi id 14.03.0248.002;
	Wed, 9 Dec 2015 10:24:12 +0100
From: <Mikko.Rapeli@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-qt5][PATCH] cmake_qt5.bbclass: add DEPENDS to qtbase
Thread-Index: AQHRMl8XPpBwgWf/fUKX4g0qJ/+3WJ7CT8+AgAABZoA=
Date: Wed, 9 Dec 2015 09:24:12 +0000
Message-ID: <20151209092409.GB21728@loska>
References: <1449651204-16080-1-git-send-email-mikko.rapeli@bmw.de>
	<20151209091909.GC2246@jama>
In-Reply-To: <20151209091909.GC2246@jama>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Subject: Re: [meta-qt5][PATCH] cmake_qt5.bbclass: add DEPENDS to qtbase
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
X-List-Received-Date: Wed, 09 Dec 2015 09:34:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <00AB333E7B4B6941A5D780B3A697F609@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2015 at 10:19:09AM +0100, Martin Jansa wrote:
> On Wed, Dec 09, 2015 at 10:53:24AM +0200, Mikko Rapeli wrote:
> > All packages using this class need it and it is too easy for developers
> > to miss and leave race conditions into builds.
> >=20
> > Change-Id: I713ffdf26e821b8ab12c2d53f9a1e6679d26a4b1
>=20
> You don't need Change-Id.

Ok, removing.

> > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > ---
> >  classes/cmake_qt5.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/classes/cmake_qt5.bbclass b/classes/cmake_qt5.bbclass
> > index 94a60dc..10b0312 100644
> > --- a/classes/cmake_qt5.bbclass
> > +++ b/classes/cmake_qt5.bbclass
> > @@ -1,6 +1,8 @@
> >  inherit cmake
> >  inherit qmake5_paths
> > =20
> > +DEPENDS_prepend =3D " qtbase "
>=20
> You don't need leading space in prepend, only the trailing one.

I did at some point on dizzy but will remove.

-Mikko=

