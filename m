Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P6mEb-0002yL-Lf
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 17:30:19 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9FFTh4n010534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 15 Oct 2010 10:29:43 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9FFThMq023224;
	Fri, 15 Oct 2010 10:29:43 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9FFThlW020317;
	Fri, 15 Oct 2010 10:29:43 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Fri, 15 Oct 2010 10:29:43 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Oct 2010 10:29:42 -0500
Thread-Topic: [oe] [PATCH] Reverse the order of OVERRIDES
Thread-Index: ActsfEXdZiLGbdaITE+3z/fBi3KboQAAXUOg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFABF1@dlee06.ent.ti.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFAB98@dlee06.ent.ti.com>
	<AANLkTi=dRxQmDwP9G8mgKHeHgrypb36Teowen5NV+Yi3@mail.gmail.com>
In-Reply-To: <AANLkTi=dRxQmDwP9G8mgKHeHgrypb36Teowen5NV+Yi3@mail.gmail.com>
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
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] Reverse the order of OVERRIDES
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
X-List-Received-Date: Fri, 15 Oct 2010 15:30:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Chris Larson
> Sent: Friday, October 15, 2010 10:17 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Chris Larson
> Subject: Re: [oe] [PATCH] Reverse the order of OVERRIDES
>=20
> On Fri, Oct 15, 2010 at 7:12 AM, Maupin, Chase <chase.maupin@ti.com>
> wrote:
>=20
> > > diff --git a/conf/machine/kixrp435.conf b/conf/machine/kixrp435.conf
> > > index 8259127..b4a2fa6 100644
> > > --- a/conf/machine/kixrp435.conf
> > > +++ b/conf/machine/kixrp435.conf
> > > @@ -7,7 +7,7 @@ TARGET_ARCH =3D "arm"
> > >  # Note: armv4 armv4t armv5te will be added by tune-xscale.inc
> > > automatically.
> > >  PACKAGE_EXTRA_ARCHS =3D "armv5e ixp4xxle"
> > >
> > > -OVERRIDES =3D
> > >
> >
> "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:buil=
d
> > > -${BUILD_OS}:fail-fast:pn-${PN}"
> > > +MACHINE_OVERRIDES +=3D "nslu2 ixp4xx"
> >
> > Should this be "ixp4xx nslu2"?  At least in order to keep the original
> > behavior?
>=20
>=20
> Yes, good catch, thanks, I'll fix it in the next version of the patch.

Everything else looked OK to me.  Thanks for this change Chris.

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


