Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P6SA0-0005cq-2T
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 20:04:15 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9EI3f5f022894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 13:03:41 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9EI3eZl029137
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 13:03:40 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9EI3dEU007307
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 13:03:39 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Thu, 14 Oct 2010 13:03:39 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Oct 2010 13:03:38 -0500
Thread-Topic: [oe] Question about OVERRIDES precedence
Thread-Index: ActrvvkOCAPRQJHmSFyajWx2MiUeyQACwcwQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFA9E9@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080310FFA839@dlee06.ent.ti.com>
	<AANLkTik1nA1jC9f-Vvep2=8U9+VXAWBwPFaRaZC0f4Op@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA874@dlee06.ent.ti.com>
	<AANLkTinfQjRpwjYYL-6+He_z3tB6wm3kcW0CSEAqFVuh@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA982@dlee06.ent.ti.com>
	<AANLkTimRwRDxmvDrPktrK=xjfrmRada_iWRuXH6tqa4o@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA9BE@dlee06.ent.ti.com>
	<AANLkTikbJgDWRpKbwtxD3nXfxay1BUgc=JWRZKGMaMWL@mail.gmail.com>
In-Reply-To: <AANLkTikbJgDWRpKbwtxD3nXfxay1BUgc=JWRZKGMaMWL@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.153
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question about OVERRIDES precedence
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
X-List-Received-Date: Thu, 14 Oct 2010 18:04:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Chris Larson
> Sent: Thursday, October 14, 2010 11:42 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Question about OVERRIDES precedence
>=20
> On Thu, Oct 14, 2010 at 9:37 AM, Maupin, Chase <chase.maupin@ti.com>
> wrote:
>=20
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org
> > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> Of
> > > Chris Larson
> > > Sent: Thursday, October 14, 2010 10:34 AM
> > > To: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] Question about OVERRIDES precedence
> > >
> > > On Thu, Oct 14, 2010 at 8:29 AM, Maupin, Chase <chase.maupin@ti.com>
> > > wrote:
> > >
> > > > So are you saying that we are just going to change the order of how
> > > > OVERRIDES is appended to in OE like Denys was suggesting?  That
> would
> > > still
> > > > lead to issues like local not being the highest priority unless we
> > would
> > > > also change bitbake.conf to define OVERRIDES as
> > > > "${TARGET_ARCH}:${TARGET_OS}:${MACHINE}:local".  That way we could
> > > prepend
> > > > OVERRIDES in OE and still have local be the last one evaluated.
> > > >
> > >
> > > No.  What I'm saying is, the definition of OVERRIDES in bitbake.conf
> will
> > > be
> > > reversed.  Not that difficult to understand.  I don't know how I coul=
d
> > > possibly be any clearer here.
> >
> > Great.  I assume this will be on the 1.10 branch as well as the master
> > branch?  Is there anything I can do to help here?
> >
>=20
> There is no 1.10 branch in OE, so no.  Again, we're changing it in OE, no=
t
> bitbake.

Chris,

I just realized what you were talking about.  I was looking at the bitbake.=
conf file in the bitbake repository, not the one in the OE repository.  Now=
 what you are saying makes more sense.  Sorry for the confusion.

>=20
> I guess with the reversal of the definition in bitbake.conf we can then
> > change the appends to prepends in OE as well as reversing the
> definitions
> > there.  That way the OVERRIDES list should be built up in the proper
> order.
>=20
>=20
> Yes, indeed, though I suspect that the existing prepend/appends were done
> by
> people not thinking about the order, so they may not be  correct the way
> they are now anyway .. :)
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


