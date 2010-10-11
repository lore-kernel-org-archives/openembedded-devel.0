Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P5Mu2-0001Ls-3y
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 20:15:17 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9BIEfN6031058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 13:14:41 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9BIEfE6002647
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 13:14:41 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9BIEfsi014195
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 13:14:41 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Mon, 11 Oct 2010 13:14:41 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Oct 2010 13:14:38 -0500
Thread-Topic: [oe] [PATCHv2] recipe licenses: update recipe LICENSE fields
Thread-Index: Actpa7ponEN1mGehQFmVdIPcL9ByWwAA9B6w
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
	<AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>
In-Reply-To: <AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.152
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Mon, 11 Oct 2010 18:15:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Frans Meulenbroeks
> Sent: Monday, October 11, 2010 12:41 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCHv2] recipe licenses: update recipe LICENSE fields
>=20
> 2010/10/11 Chase Maupin <chasemaupin03@gmail.com>:
> > * While verifying the licensing for the packages I am building
> > =A0into my file system I found that for some packages the
> > =A0LICENSE value set in the recipe was either incorrect or
> > =A0generic and not detailed enough. =A0This patch is my attempt
> > =A0to update the LICENSE fields for these packages to match
> > =A0the actual versions of the licenses in the sources.
> >
>=20
> [...]
>=20
> > -LICENSE =3D "GPLv2"
> > +LICENSE =3D "GPLv2+"
>=20
> Doe we want this?
> I think most GPLv2 code carries the clause:
>=20
> "This program is free software; you can redistribute it and/or
> modify it under the terms of the GNU General Public License
> as published by the Free Software Foundation; either version 2
> of the License, or (at your option) any later version."
>=20
> Yet currently virtually all of these have GPL or GPLv2 as LICENSE

Frans,

My original version of this patch was just changing GPL to GPLv2 for exampl=
e.  But I was asked about whether it should be GPLv2+ which I guess is more=
 indicative of the "or later" clause.  Does anyone have good guidance here =
on how to denote things that are GPLv2 only for now (like git which Linux h=
as a note in the COPYING file about it being GPLv2) and things that are GPL=
v2 or later version?  I'm trying for consistency here but I guess there doe=
sn't seem to be a set policy for how the LICENSE field should be set.

>=20
> v2+ versions:
>=20
> enblend/plotutils_2.6.bb:LICENSE =3D "GPLv2+"
> ffmpeg/ffmpeg_svn.bb:LICENSE =3D "GPLv2+"
> gnome/epiphany_2.30.2.bb:LICENSE =3D "GPLv2+"
> gpe-package/gpe-package_0.4.bb:LICENSE =3D "GPLv2+"
> libftdi/libftdi_0.18.bb:LICENSE =3D "LGPL GPLv2+linking exception"
> libnfo/libnfo.inc:LICENSE =3D "LGPLv2+"
> lzo/lzo2_2.03.bb:LICENSE =3D "GPLv2+"
> raw-tools/exiv2_0.20.bb:LICENSE =3D "GPLv2+"
> sysvinit/sysvinit_2.86.bb:LICENSE =3D "GPLv2+"
> udev/udev.inc:LICENSE =3D "GPLv2+"
> udev/udev_151.bb:LICENSE =3D "GPLv2+"
> udev/udev_154.bb:LICENSE =3D "GPLv2+"
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


