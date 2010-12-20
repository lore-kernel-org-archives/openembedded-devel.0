Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1PUlSn-0002LW-K6
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 20:32:05 +0100
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id oBKJPV15024656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 13:25:31 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id oBKJPUHd007528
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 13:25:30 -0600 (CST)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBKJPUKw014466
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 13:25:30 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Mon, 20 Dec 2010 13:25:30 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Dec 2010 13:25:28 -0600
Thread-Topic: [oe] [RFC] meta-openembedded layer for yocto hosted on oe.org
Thread-Index: AcugasbzN0nleOHcTvW5WA6b9LNHygADwbCQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329E93051@dlee06.ent.ti.com>
References: <ienu66$5gf$1@dough.gmane.org>	<4D0F8AB7.1020104@xora.org.uk>
	<AANLkTiks4PYZxZCQgsprveY1jNQgpy_mMVTOwg3DtsqX@mail.gmail.com>
In-Reply-To: <AANLkTiks4PYZxZCQgsprveY1jNQgpy_mMVTOwg3DtsqX@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [RFC] meta-openembedded layer for yocto hosted on oe.org
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
X-List-Received-Date: Mon, 20 Dec 2010 19:32:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Frans Meulenbroeks
> Sent: Monday, December 20, 2010 11:17 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [RFC] meta-openembedded layer for yocto hosted on oe.or=
g
>=20
> Nice piece of work & a good plan but...
>=20
> Who will be the owners/maintainers of the layers?
> I maintain several multimedia recipes (mythtv with all that is dragged
> in (which is a.o. a lot of perl stuff), various cd*  related recipes,
> python-coherence and the python stuff it uses, mediatomb, and it seems
> recently people seem to see me as the first line of contact if they
> have musicpd issues), as well as some file sharing recipes.
> Any idea on how I get them added, and how to deal with updates for these?
>=20
> An alternate approach would be to let the stuff live in poky-extras.
> See this proposal from RP:
> http://www.mail-archive.com/yocto@yoctoproject.org/msg00286.html

Frans,

What is the difference between poky-extras and angstrom-layers in regards t=
o the intention.  My understanding is that Koen wanted to put the meta-open=
embedded layer on OE so it would be open to anyone.  Couldn't you then add =
recipes for the components you maintain into this layer in places like reci=
pes-multimedia? =20

Or are you concerned about who would maintain some of the individual recipe=
 groupings like multimedia?  i.e. if recipes-multimedia is part of meta-ope=
nembedded are you concerned that you won't be able to push changes to your =
recipes?  I see your issue here in that you want to maintain your recipes w=
ithout restriction but at the same time if everyone just puts their recipes=
 into their own layer we would have way too many layers and it would be ext=
remely hard to keep track of.

So would a good solution be to have multiple committers to the meta-openemb=
edded layer (like Koen was suggesting) and let each committer be a maintain=
er with an emphasis on a particular area (Also seems in line with what Rich=
ard was suggesting)?

Perhaps I am misunderstanding the proposal here but it seems like we are re=
ally discussing whether we use poky-extras or angstrom-layers, or something=
 with another name.  I would say that we leave angstrom-layers containing t=
he angstrom stuff, make an openembedded layer hosted on OE (like Koen sugge=
sted) rather than cramming everything into poky-extras (since poky is just =
one distribution and there are others).

I guess an alternative suggestion is to have each functional grouping like =
multimedia be its own layer and then you can have one or more maintainers p=
er layer.  Then you can just group these layers under the OE name (which is=
 basically what Richard was suggesting but calling it poky-extras).

>=20
> Frans.
>=20
> PS: personally I would have preferred it if console-image was in the
> common part.I guess some other recipes will get fairly identical
> recipes.
> Maybe we should have a generic console-image and let each distro use
> .bbappend or aminc to extend on it.
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


