Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE2A78E88
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 22:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 16D7D184FC;
	Thu, 18 Oct 2018 00:03:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id sxEBtdje5wox; Thu, 18 Oct 2018 00:03:54 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 02BC8184FB;
	Thu, 18 Oct 2018 00:03:53 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCBB31E08B;
	Thu, 18 Oct 2018 00:03:53 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D112B1E08A;
	Thu, 18 Oct 2018 00:03:53 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 18 Oct 2018 00:03:53 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id C425CFE7;
	Thu, 18 Oct 2018 00:03:53 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 18 Oct 2018 00:03:53 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 18 Oct 2018 00:03:53 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1365.000;
	Thu, 18 Oct 2018 00:03:53 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [PATCH v3] packagegroup-tools-bluetooth: work as advertized
	on distro without bluez* support
Thread-Index: AQHUZmEmLLvlkEDRHUa9DYN9KMVC96Uj/YyA
Date: Wed, 17 Oct 2018 22:03:53 +0000
Message-ID: <71b4fe32a2dd4895938ba547944576df@XBOX02.axis.com>
References: <20181017205647.25447-1-yann@blade-group.com>
	<58e27c81a75d4ffdb436ec577bbb7f9b@XBOX02.axis.com>
	<CA+chaQeqKrGu3=5HYA+qm8a2iV86vDQdhMELEYkhBKfM6yWYZA@mail.gmail.com>
In-Reply-To: <CA+chaQeqKrGu3=5HYA+qm8a2iV86vDQdhMELEYkhBKfM6yWYZA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "yann@blade-group.com" <yann@blade-group.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v3] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 22:03:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of Martin Jansa
> Sent: den 17 oktober 2018 23:34
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: yann@blade-group.com; openembedded-devel <openembedded-
> devel@lists.openembedded.org>
> Subject: Re: [oe] [PATCH v3] packagegroup-tools-bluetooth: work as
> advertized on distro without bluez* support
>=20
> I wouldn't say that supporting bluez6 as BLUEZ value before
> RDEPENDS_bluez6 is defined here is really better.

Well, my point was that rewriting it according to my suggestion=20
makes it agnostic to whatever value the ${BLUEZ} variable has.

> Whole bluez4 support here is a bit useless considering that all bluez4
> related recipes were removed more than a year ago with:
>=20
> commit 007498ac72e26e9f7064de74f7fe96e91ae6c969
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Mon Jul 24 19:25:35 2017 +0200
>=20
>     bluez4: remove bluez4-only recipes
>=20
>=20
> On Wed, Oct 17, 2018 at 11:20 PM Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>=20
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org <
> > openembedded-devel-bounces@lists.openembedded.org> On Behalf Of
> > yann.dirson@blade-group.com
> > > Sent: den 17 oktober 2018 22:57
> > > To: openembedded-devel@lists.openembedded.org
> > > Cc: Yann Dirson <yann@blade-group.com>
> > > Subject: [oe] [PATCH v3] packagegroup-tools-bluetooth: work as
> > advertized on distro without bluez* support
> > >
> > > From: Yann Dirson <yann@blade-group.com>
> > >
> > > Otherwise the build fails with:
> > >
> > >   NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
> > >   Missing or unbuildable dependency chain was: ['${RDEPENDS_}']
> > >
> > > This restores some truth in the "Otherwise install nothing" comment
> in
> > > the recipe.
> > >
> > > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > > ---
> > >  .../packagegroups/packagegroup-tools-bluetooth.bb            | 5
> ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-connectivity/packagegroups/
> > packagegroup-tools-bluetooth.bb
> > b/meta-oe/recipes-connectivity/packagegroups/
> > packagegroup-tools-bluetooth.bb
> > > index 0ede5e57b..207c7c1ae 100644
> > > --- a/meta-oe/recipes-connectivity/packagegroups/
> > packagegroup-tools-bluetooth.bb
> > > +++ b/meta-oe/recipes-connectivity/packagegroups/
> > packagegroup-tools-bluetooth.bb
> > > @@ -34,4 +34,7 @@ RDEPENDS_bluez5 =3D " \
> > >
> > >  # Install bluez4 tools or bluez5 tools depending on what is
> specified
> > in the distro.
> > >  # Otherwise install nothing.
> > > -RDEPENDS_${PN} =3D "${RDEPENDS_${BLUEZ}}"
> > > +RDEPENDS_${PN} =3D " \
> > > +    ${@'${RDEPENDS_bluez5}' if d.getVar('BLUEZ', True) =3D=3D 'bluez=
5'
> else
> > ''} \
> > > +    ${@'${RDEPENDS_bluez4}' if d.getVar('BLUEZ', True) =3D=3D 'bluez=
4'
> else
> > ''} \
> > > +"
> >
> > You can simplify this (and support any value of ${BLUEZ} just in
> > case someone decides to add bluez6):
> >
> > RDEPENDS_${PN} =3D "${@'${RDEPENDS_${BLUEZ}}' if d.getVar('BLUEZ') else=
 ''}"
> >
> > Also, the second argument to d.getVar() has defaulted to True for
> > a long time, so no point in specifying it.
> >
> > > --
> > > 2.19.1
> >
> > //Peter

//Peter


