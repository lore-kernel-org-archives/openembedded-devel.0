Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1OuACO-0000XV-LZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 22:27:53 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id o8AKR8E8003071
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 15:27:08 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o8AKR78h004046
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 15:27:07 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o8AKR7Zq017548
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 15:27:07 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Fri, 10 Sep 2010 15:27:07 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 10 Sep 2010 15:27:06 -0500
Thread-Topic: [oe] [PATCH] base.bbclass: fix soc-family test
Thread-Index: ActRJdHH1ISrufpfT7qwLjmU1dAzEQAAFTDw
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310BFAF59@dlee06.ent.ti.com>
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
	<1284024609.28520.1446.camel@mill.internal.reciva.com>
	<AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFAA13@dlee06.ent.ti.com>
	<AANLkTikLhZ-vsO34S30T5RekoaKJpwyECmjyryY8d6wV@mail.gmail.com>
	<20100910183714.GE28148@denix.org>
	<1284153610.4698.32.camel@lenovo.internal.reciva.com>
In-Reply-To: <1284153610.4698.32.camel@lenovo.internal.reciva.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.41
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Fri, 10 Sep 2010 20:27:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Friday, September 10, 2010 4:20 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] base.bbclass: fix soc-family test
>=20
> On Fri, 2010-09-10 at 14:37 -0400, Denys Dmytriyenko wrote:
> > I'd like us to find a compromise and a solution that satisfies everybod=
y.
> >
> > Unfortunately, the original discussion about SOC_FAMILY vs.
> MACHINE_CLASS
> > never came to any fruition - Graeme explained his motives behind
> MACHINE_CLASS
> > and said that it is now deprecated.
> >
> > It was also mentioned, while SOC_FAMILY is slightly newer than
> MACHINE_CLASS,
> > the feature itself is over a year old and used quite extensively,
> although
> > limited mainly to recipes/ti location...
> >
> > And if technically SOC_FAMILY may be similar to MACHINE_CLASS, logicall=
y
> they
> > try to solve grouping problem from different direction, which was also
> > explained.
> >
> > After that the original discussion was stalled and there were no strong
> > opinions one way or another. Based on that, Chase's change was pushed.
> >
> > I see and understand Phil's position - if that's strong enough, we can
> > re-consider.
>=20
> I take the point about MACHINE_CLASS and SOC_FAMILY being different in
> intent.  However, I do feel that these are just two out of a whole
> universe of possible machine groupings and I remain somewhat uneasy
> about adding this sort of thing to base.bbclass: if we admit SOC_FAMILY
> (or even MACHINE_CLASS) there then it seems like it will set an
> undesirable precedent for the next guy who wants his favourite machine
> grouping to be given the same treatment.  (The same thing applies to the
> OVERRIDES patch that was posted recently and which I am not very fond of
> either.)
>=20
> How many recipes are there for which this is a big deal?  It's worth
> remembering that the whole COMPATIBLE_MACHINE thing in base.bbclass is,
> essentially, just syntactic sugar and there is nothing to stop you from
> implementing whatever compatibility logic you want in your own .bb files
> (or in an .inc, or a custom class).  If there are only a handful of
> recipes for which gating on SOC_FAMILY is required then I would suggest
> that you simply put the appropriate Python bits in those recipes.

Phil,

First thanks for the response.  There a quite a few recipes that use this o=
r plan to use it.  Kernel recipes, several of the recipes in the "recipes/t=
i" directory.  I guess as a person who actually uses this I have a bias her=
e.  I hope you can understand though that this is variable found usefulness=
 as an override and that is why it was extended to also work for COMPATIBLE=
_MACHINE.

>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


