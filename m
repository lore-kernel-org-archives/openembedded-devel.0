Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1PzqzK-0000VC-E2
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 14:42:19 +0100
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p2GDeM6t011071
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 16 Mar 2011 08:40:22 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2GDeMmP012299;
	Wed, 16 Mar 2011 08:40:22 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2GDeLlJ020004;
	Wed, 16 Mar 2011 08:40:22 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Wed, 16 Mar 2011 08:40:21 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Chase Maupin
	<chasemaupin03@gmail.com>
Date: Wed, 16 Mar 2011 08:40:19 -0500
Thread-Topic: [PATCH] u-boot.inc: allow variable make targets
Thread-Index: AcvjHykhaFo1c+YYRUu8TL4Y/2rnywABJBuQAC7pL9A=
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F0803409A88CE@dlee06.ent.ti.com>
References: <1300200121-31822-1-git-send-email-Chase.Maupin@ti.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803409A86B3@dlee06.ent.ti.com>
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F0803409A86B3@dlee06.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] u-boot.inc: allow variable make targets
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
X-List-Received-Date: Wed, 16 Mar 2011 13:42:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Maupin, Chase
> Sent: Tuesday, March 15, 2011 10:16 AM
> To: Chase Maupin; openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] u-boot.inc: allow variable make targets
>=20
> I should have probably clarified that this was intended for the 2011.03-
> maintenance branch.  Tom, I have also submitted this to the oe-core.
> Would you be willing to pick this up?

Just FYI this has been merged into the oe-core master (see http://lists.lin=
uxtogo.org/pipermail/openembedded-core/2011-March/000533.html) as well as t=
he angstrom-layers master (see http://lists.linuxtogo.org/pipermail/openemb=
edded-core/2011-March/000512.html)=20

>=20
> > -----Original Message-----
> > From: Chase Maupin [mailto:chasemaupin03@gmail.com]
> > Sent: Tuesday, March 15, 2011 9:42 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Maupin, Chase
> > Subject: [PATCH] u-boot.inc: allow variable make targets
> >
> > * Later versions of u-boot sometimes have top level make targets
> >   such as u-boot.imx, u-boot.kwb, and for upcoming TI devices
> >   u-boot.ti.
> > * These targets define different calls to the mkimage tool to
> >   change the images created, such as changing the load address.
> > * This change allows recipes to change the default make target
> >   of "all" to something like u-boot.ti or u-boot.imx by setting
> >   the UBOOT_MAKE_TARGET variable.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  recipes/u-boot/u-boot.inc |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >
> > diff --git a/recipes/u-boot/u-boot.inc b/recipes/u-boot/u-boot.inc
> > index 88c6a4d..ffd1e1e 100644
> > --- a/recipes/u-boot/u-boot.inc
> > +++ b/recipes/u-boot/u-boot.inc
> > @@ -16,6 +16,7 @@ UBOOT_MACHINE ?=3D "${MACHINE}_config"
> >  UBOOT_BINARY ?=3D "u-boot.bin"
> >  UBOOT_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.bin"
> >  UBOOT_SYMLINK ?=3D "u-boot-${MACHINE}.bin"
> > +UBOOT_MAKE_TARGET ?=3D "all"
> >
> >  do_configure () {
> >  	oe_runmake ${UBOOT_MACHINE}
> > @@ -25,7 +26,7 @@ do_compile () {
> >  	unset LDFLAGS
> >  	unset CFLAGS
> >  	unset CPPFLAGS
> > -	oe_runmake all
> > +	oe_runmake ${UBOOT_MAKE_TARGET}
> >  	oe_runmake tools env HOSTCC=3D"${CC}"
> >  }
> >
> > --
> > 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


