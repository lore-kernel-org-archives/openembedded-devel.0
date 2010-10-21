Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P8vTs-0003Br-UD
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:46:58 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9LDk8VP027899
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 08:46:08 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9LDk8eO014915
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 08:46:08 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9LDk8UL013613
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 08:46:08 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Thu, 21 Oct 2010 08:46:07 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Oct 2010 08:46:06 -0500
Thread-Topic: [oe] [RFC] turning conf/machine into a set of bblayers
Thread-Index: ActxF91U0ZeoHfXDQ0CWLfwFdvfkcAADk3tA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F0803110B3520@dlee06.ent.ti.com>
References: <i9p1d0$7q4$1@dough.gmane.org> <4CC00D57.4070601@xora.org.uk>
	<i9p2uf$f40$1@dough.gmane.org> <4CC0104B.4070108@xora.org.uk>
	<AANLkTi=74mwvxLLwCjEhV3OMCyOdpfRZeU0Z-bf6TM+P@mail.gmail.com>
	<1287657524.16386.437.camel@rex>
	<AANLkTimn0RDABjQbJcO3dWHpWPWD6giY1taSVixn0MHp@mail.gmail.com>
In-Reply-To: <AANLkTimn0RDABjQbJcO3dWHpWPWD6giY1taSVixn0MHp@mail.gmail.com>
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
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Thu, 21 Oct 2010 13:46:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Frans Meulenbroeks
> Sent: Thursday, October 21, 2010 7:01 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [RFC] turning conf/machine into a set of bblayers
>=20
> 2010/10/21 Richard Purdie <rpurdie@rpsys.net>:
> > On Thu, 2010-10-21 at 12:20 +0200, Frans Meulenbroeks wrote:
> >> 2010/10/21 Graeme Gregory <dp@xora.org.uk>:
> >>
> >> >>
> >> > Such a pity git doesnt have increasing rev numbers, a cool adition
> would
> >> > be a flag in layer that showed the last rev of core it was tested
> with.
> >> >
> >> > Layer was tested with core 1 but core is now 999 would give an
> >> > indication on drift between layers and core.
> >> >
> >> > Graeme
> >>
> >> Triggered by this (and apologies if I am drifting off-topic).
> >> It would be nice if with amend.inc you could specify the PR of the
> >> underlying recipe that this amend is for (and get a warning or error
> >> if there is a mismatch)
> >
> > For reference poky now has the PRINC =3D "x" variable which increases t=
he
> > base PR by x, assuming a standard format PR value. This is intended for
> > use in .bbappend files.
> >
> > Cheers,
> >
> > Richard
> >
>=20
> Maybe I was not clear enough on this, but my proposal would be that
> you could say in your amend file something like
> BASEPR_CHECK("r12")
> or something like that (I did not really think about what the best
> syntax would be).
>=20
> If you were building and the base recipe did not have the PR you
> specified you'd get a warning (or maybe even an error) so you would
> know that something changed under water.

I haven't tried this myself yet, but if you wanted to tie to a particular P=
R of the base recipe wouldn't you just put the amend.inc in your overlay at=
 recipes/blah/blah-version-pr directory?

>=20
> Best regards, Frans
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


