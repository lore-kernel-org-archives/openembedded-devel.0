Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ou8U3-00086R-B9
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 20:38:00 +0200
Received: from gandalf.denix.org ([unknown] [71.251.53.61])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L8J0069SNQ2VJU6@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	10 Sep 2010 13:37:15 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 18C8D14AF60; Fri,
	10 Sep 2010 14:37:14 -0400 (EDT)
Date: Fri, 10 Sep 2010 14:37:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <AANLkTikLhZ-vsO34S30T5RekoaKJpwyECmjyryY8d6wV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100910183714.GE28148@denix.org>
MIME-version: 1.0
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
	<1284024609.28520.1446.camel@mill.internal.reciva.com>
	<AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFAA13@dlee06.ent.ti.com>
	<AANLkTikLhZ-vsO34S30T5RekoaKJpwyECmjyryY8d6wV@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Fri, 10 Sep 2010 18:38:00 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Thu, Sep 09, 2010 at 03:16:54PM +0200, Frans Meulenbroeks wrote:
> 2010/9/9 Maupin, Chase <chase.maupin@ti.com>:
>=20
> >>
> >> I'm not too sure on the usefulness of it either, but there is so=
me
> >> breakage so we should either revert the patch or fix it.
> >>
> >> Actually the SOC_FAMILY got pushed before the review was conclud=
ed.
> >> Technically it got the ack's but the discussion was still ongoin=
g when
> >> this was pushed.
> >> What also makes it fishy is that all acks are from the same comp=
any
> >> (which is the same one as the person who submitted the patch):
> >>
> >> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> >> Acked-by: Denys Dmytriyenko <denys@ti.com>
> >> Acked-by: Koen Kooi <k-kooi@ti.com>
> >> Signed-off-by: Koen Kooi <koen@openembedded.org>
> >>
> >> I would suggest modifying the commit policy disallowing these ki=
nd of
> >> things, saying the two Ack's must be from two developers not
> >> affiliated with the same company.
> >> (actually we might even want to take it further and saying that =
global
> >> changes that affect everyone would require ACK's from developers=
 from
> >> more than one distro).
> >>
> >> Question to the TSC: should the SOC_FAMILY patch be reverted and=
 put
> >> on hold until there is agreement whether or not we want this?
> >
> > Frans,
> >
> > As the person who submitted this change I'd like to ask that it n=
ot be reverted. =A0I am using it currently so that when defining COMP=
ATIBLE_MACHINE for recipes targeted at OMAP3 devices I do not have to=
 keep a rolling list of all the various OMAP3 devices. =A0This can qu=
ickly become:
> >
> > COMPATIBLE_MACHINE =3D "dm37x-evm|am37x-evm|omap3evm|am3517-evm|b=
eagleboard|......"
> >
> > Instead by allowing SOC_FAMILY to be used as a COMPATIBLE_MACHINE=
 this can be handled cleanly with:
> >
> > COMPATIBLE_MACHINE =3D "omap3"
> >
> > Please consider this use case. =A0I would much prefer if your fix=
 was put into the base.bbclass than if this were removed.
> >
>=20
> Chase,
>=20
> I understand your use case.
> The major concern I see is the overlap with MACHINE_CLASS.
> Anyway, I have no real objections against SOC_FAMILY.
> The only observation is that it has been introduced a little bit
> hastily without the community reaching consensus.
>=20
> Frans.
>=20
> PS: thanks for the ack that arrived while I was typing this
> PPS: wrt COMPATIBLE_MACHINE: I think it is possible to use wildcard=
s,
> so *if* the machines with omap3 get that as a prefix it could also =
be
> used
> (and yes: this is just an alternate option, and I see the con's of =
it)

Frans,

I'd like us to find a compromise and a solution that satisfies everyb=
ody.=20

Unfortunately, the original discussion about SOC_FAMILY vs. MACHINE_C=
LASS=20
never came to any fruition - Graeme explained his motives behind MACH=
INE_CLASS=20
and said that it is now deprecated.

It was also mentioned, while SOC_FAMILY is slightly newer than MACHIN=
E_CLASS,=20
the feature itself is over a year old and used quite extensively, alt=
hough=20
limited mainly to recipes/ti location...

And if technically SOC_FAMILY may be similar to MACHINE_CLASS, logica=
lly they=20
try to solve grouping problem from different direction, which was als=
o=20
explained.

After that the original discussion was stalled and there were no stro=
ng=20
opinions one way or another. Based on that, Chase's change was pushed=
.

I see and understand Phil's position - if that's strong enough, we ca=
n=20
re-consider.

BTW, I was under impression, that the issue in COMPATIBLE_MACHINE was=
 fixed=20
soon after it was discovered. Sorry for not acknowledging your fix ea=
rlier.

Anyway, just wanted to let you know that we are not trying to undermi=
ne=20
anybody in the community and we, as a company, want to work close wit=
h the=20
community, and be a good citizen. Hopefully, this incident will not b=
e=20
considered as an indication of otherwise. Thank you for your understa=
nding.

--=20
Denys



