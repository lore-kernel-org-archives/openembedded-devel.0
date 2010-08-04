Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1OgkWY-0001Ee-Ro
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 22:25:30 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o74KOxdq026605
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Aug 2010 15:25:00 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id o74KOxY1023033
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Aug 2010 15:24:59 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o74KOx97006596
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Aug 2010 15:24:59 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Wed, 4 Aug 2010 15:24:59 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Aug 2010 15:24:57 -0500
Thread-Topic: [oe] [PATCH] base.bbclass: add support for SOC_FAMILY in
	COMPATIBLE_MACHINES
Thread-Index: Acs0D/xJrNm+kE1+QHKNzzuLqDFroQAAnm2Q
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F0802E91E8FFA@dlee06.ent.ti.com>
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>
	<1280915670.2692.350.camel@mill.internal.reciva.com>
	<AANLkTinBPTAF2UH0weQ7FKpHqFUBeLkzoO8kuQg41e+0@mail.gmail.com>
In-Reply-To: <AANLkTinBPTAF2UH0weQ7FKpHqFUBeLkzoO8kuQg41e+0@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.152
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in	COMPATIBLE_MACHINES
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
X-List-Received-Date: Wed, 04 Aug 2010 20:25:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Wednesday, August 04, 2010 2:49 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] base.bbclass: add support for SOC_FAMILY in
> COMPATIBLE_MACHINES
>=20
> On Wed, Aug 4, 2010 at 2:54 AM, Phil Blundell <philb@gnu.org> wrote:
> > On Tue, 2010-08-03 at 16:47 -0500, Chase Maupin wrote:
> >> * Add support for using SOC_FAMILY in the COMPATIBLE_MACHINES
> >> =A0 setting for a recipe.
> >> * This will allow recipes to work for entire families of
> >> =A0 devices without having to maintain/update the compatible
> >> =A0 devices as new devices are added into a family
> >
> > I don't suppose you'd consider refactoring your MACHINE names in order
> > to allow a simple regex in COMPATIBLE_MACHINE?
>=20
> that would be a good approach too. Has it been
> considered.

As I mentioned before, we are matching the machine names to the name of the=
 actual device.  Unfortunately, not every device that falls into an SOC fam=
ily has a similar name and cannot all be dictated by us.  For example in om=
ap3 SOC_FAMILY there is:

beagleboard
omap3evm
nokia900
dm37x-evm
archos5
bug20

and many many more.  These machines are defined by a variety of companies, =
some from TI, some community, Nokia, Archos, etc.  I don't think it is like=
ly that we will get agreement on the naming between all the groups.  I know=
 that just within TI the naming is driven by marketing names for the device=
s.

>=20
> I don't have a strong
> > objection to this patch but, conceptually, it seems a bit ugly.
>=20
>=20
>=20
> >
> > p.
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


