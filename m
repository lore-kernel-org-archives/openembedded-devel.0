Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A69C79C44
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Oct 2018 14:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 89C361833E;
	Sat, 20 Oct 2018 16:02:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id G45DiXi4PpkG; Sat, 20 Oct 2018 16:02:35 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6C44A1818A;
	Sat, 20 Oct 2018 16:02:35 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B8C91A05F;
	Sat, 20 Oct 2018 16:02:35 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 302611A05E;
	Sat, 20 Oct 2018 16:02:35 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Sat, 20 Oct 2018 16:02:35 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 232F61B35;
	Sat, 20 Oct 2018 16:02:35 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sat, 20 Oct 2018 16:02:35 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sat, 20 Oct 2018 16:02:34 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1365.000;
	Sat, 20 Oct 2018 16:02:34 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [PATCH v3] packagegroup-tools-bluetooth: work as advertized
	on distro without bluez* support
Thread-Index: AQHUZmEmLLvlkEDRHUa9DYN9KMVC96Uj/YyA///hjgCABDK2YA==
Date: Sat, 20 Oct 2018 14:02:34 +0000
Message-ID: <c88754fce95d4f5ca91340de0605231f@XBOX02.axis.com>
References: <20181017205647.25447-1-yann@blade-group.com>
	<58e27c81a75d4ffdb436ec577bbb7f9b@XBOX02.axis.com>
	<CA+chaQeqKrGu3=5HYA+qm8a2iV86vDQdhMELEYkhBKfM6yWYZA@mail.gmail.com>
	<71b4fe32a2dd4895938ba547944576df@XBOX02.axis.com>
	<20181017221356.GB1375@jama>
In-Reply-To: <20181017221356.GB1375@jama>
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
X-List-Received-Date: Sat, 20 Oct 2018 14:02:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Martin Jansa <martin.jansa@gmail.com>
> Sent: den 18 oktober 2018 00:14
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: yann@blade-group.com; openembedded-devel <openembedded-
> devel@lists.openembedded.org>
> Subject: Re: [oe] [PATCH v3] packagegroup-tools-bluetooth: work as
> advertized on distro without bluez* support
>=20
> On Wed, Oct 17, 2018 at 10:03:53PM +0000, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org
> <openembedded-
> > > devel-bounces@lists.openembedded.org> On Behalf Of Martin Jansa
> > > Sent: den 17 oktober 2018 23:34
> > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > Cc: yann@blade-group.com; openembedded-devel <openembedded-
> > > devel@lists.openembedded.org>
> > > Subject: Re: [oe] [PATCH v3] packagegroup-tools-bluetooth: work as
> > > advertized on distro without bluez* support
> > >
> > > I wouldn't say that supporting bluez6 as BLUEZ value before
> > > RDEPENDS_bluez6 is defined here is really better.
> >
> > Well, my point was that rewriting it according to my suggestion
> > makes it agnostic to whatever value the ${BLUEZ} variable has.
>=20
> And my point is that it doesn't make it better, because it will do
> something useful only with RDEPENDS_bluez4 or RDEPENDS_bluez5, adding
> dependency on undefined ${RDEPENDS_whatever} doesn't really help, does
> it?

Well, it actually does. Because if someone was to actually add=20
support for bluez6 (or whatever) they would now get a build=20
error because RDEPENDS_bluez6 is not defined instead of silently=20
missing the dependencies that they need to add.

However, my suggested code does not work due to bitbake messing=20
up the parsing of the line, resulting in an error similar to this=20
if ${BLUEZ} is not defined:

ERROR: Nothing RPROVIDES 'else' (but testrecipe.bb RDEPENDS on or otherwise=
 requires it)

It suggests that somewhere there is some code doing something like
d.getVar('RDEPENDS_%s' % pn, False).split() (that exact code does=20
not exist though, I've checked). So to get it to work in practice=20
one would have to do:

FOOBAR =3D "${@'${RDEPENDS_${BLUEZ}}' if d.getVar('BLUEZ') else ''}"
RDEPENDS_${PN} =3D "${FOOBAR}"

If ${RDEPENDS_${BLUEZ}} is defined, then it yields the expected=20
dependencies, and if ${BLUEZ} is defined but ${RDEPENDS_${BLUEZ}}=20
is not, then it yields an error similar to:

ERROR: Nothing RPROVIDES '${@'${RDEPENDS_whatever}'' (but testrecipe.bb RDE=
PENDS on or otherwise requires it)

> > > Whole bluez4 support here is a bit useless considering that all
> bluez4
> > > related recipes were removed more than a year ago with:
> > >
> > > commit 007498ac72e26e9f7064de74f7fe96e91ae6c969
> > > Author: Martin Jansa <Martin.Jansa@gmail.com>
> > > Date:   Mon Jul 24 19:25:35 2017 +0200
> > >
> > >     bluez4: remove bluez4-only recipes
> > >
> > >
> > > On Wed, Oct 17, 2018 at 11:20 PM Peter Kjellerstedt <
> > > peter.kjellerstedt@axis.com> wrote:
> > >
> > > > > -----Original Message-----
> > > > > From: openembedded-devel-bounces@lists.openembedded.org <
> > > > openembedded-devel-bounces@lists.openembedded.org> On Behalf Of
> > > > yann.dirson@blade-group.com
> > > > > Sent: den 17 oktober 2018 22:57
> > > > > To: openembedded-devel@lists.openembedded.org
> > > > > Cc: Yann Dirson <yann@blade-group.com>
> > > > > Subject: [oe] [PATCH v3] packagegroup-tools-bluetooth: work as
> > > > advertized on distro without bluez* support
> > > > >
> > > > > From: Yann Dirson <yann@blade-group.com>
> > > > >
> > > > > Otherwise the build fails with:
> > > > >
> > > > >   NOTE: Runtime target '${RDEPENDS_}' is unbuildable,
> removing...
> > > > >   Missing or unbuildable dependency chain was: ['${RDEPENDS_}']
> > > > >
> > > > > This restores some truth in the "Otherwise install nothing"
> comment
> > > in
> > > > > the recipe.
> > > > >
> > > > > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > > > > ---
> > > > >  .../packagegroups/packagegroup-tools-bluetooth.bb            |
> 5
> > > ++++-
> > > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta-oe/recipes-connectivity/packagegroups/
> > > > packagegroup-tools-bluetooth.bb
> > > > b/meta-oe/recipes-connectivity/packagegroups/
> > > > packagegroup-tools-bluetooth.bb
> > > > > index 0ede5e57b..207c7c1ae 100644
> > > > > --- a/meta-oe/recipes-connectivity/packagegroups/
> > > > packagegroup-tools-bluetooth.bb
> > > > > +++ b/meta-oe/recipes-connectivity/packagegroups/
> > > > packagegroup-tools-bluetooth.bb
> > > > > @@ -34,4 +34,7 @@ RDEPENDS_bluez5 =3D " \
> > > > >
> > > > >  # Install bluez4 tools or bluez5 tools depending on what is
> > > specified
> > > > in the distro.
> > > > >  # Otherwise install nothing.
> > > > > -RDEPENDS_${PN} =3D "${RDEPENDS_${BLUEZ}}"
> > > > > +RDEPENDS_${PN} =3D " \
> > > > > +    ${@'${RDEPENDS_bluez5}' if d.getVar('BLUEZ', True) =3D=3D
> 'bluez5'
> > > else
> > > > ''} \
> > > > > +    ${@'${RDEPENDS_bluez4}' if d.getVar('BLUEZ', True) =3D=3D
> 'bluez4'
> > > else
> > > > ''} \
> > > > > +"
> > > >
> > > > You can simplify this (and support any value of ${BLUEZ} just in
> > > > case someone decides to add bluez6):
> > > >
> > > > RDEPENDS_${PN} =3D "${@'${RDEPENDS_${BLUEZ}}' if d.getVar('BLUEZ')
> else ''}"
> > > >
> > > > Also, the second argument to d.getVar() has defaulted to True for
> > > > a long time, so no point in specifying it.
> > > >
> > > > > --
> > > > > 2.19.1
> > > >
> > > > //Peter
> >
> > //Peter
> >
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

//Peter


