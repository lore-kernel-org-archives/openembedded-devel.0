Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P8dMW-0000FD-O1
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 20:26:09 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAL0042SPTXX932@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 Oct 2010 13:25:22 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 642D014AF64; Wed,
	20 Oct 2010 14:25:09 -0400 (EDT)
Date: Wed, 20 Oct 2010 14:25:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <AANLkTi=uKwjKYq5W4VwKXcNHdSJkxZnu_w4M9kkvVWoX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101020182509.GO11514@denix.org>
MIME-version: 1.0
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
	<AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>
	<AANLkTi=uKwjKYq5W4VwKXcNHdSJkxZnu_w4M9kkvVWoX@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Wed, 20 Oct 2010 18:26:09 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Mon, Oct 11, 2010 at 08:53:41PM +0200, Frans Meulenbroeks wrote:
> 2010/10/11 Maupin, Chase <chase.maupin@ti.com>:
> >
> >> [...]
> >>
> >> > -LICENSE =3D "GPLv2"
> >> > +LICENSE =3D "GPLv2+"
> >>
> >> Doe we want this?
> >> I think most GPLv2 code carries the clause:
> >>
> >> "This program is free software; you can redistribute it and/or
> >> modify it under the terms of the GNU General Public License
> >> as published by the Free Software Foundation; either version 2
> >> of the License, or (at your option) any later version."
> >>
> >> Yet currently virtually all of these have GPL or GPLv2 as LICENS=
E
> >
> > Frans,
> >
> > My original version of this patch was just changing GPL to GPLv2 =
for=20
> > example. =A0But I was asked about whether it should be GPLv2+ whi=
ch I guess=20
> > is more indicative of the "or later" clause. =A0Does anyone have =
good=20
> > guidance here on how to denote things that are GPLv2 only for now=
 (like=20
> > git which Linux has a note in the COPYING file about it being GPL=
v2) and=20
> > things that are GPLv2 or later version? =A0I'm trying for consist=
ency here=20
> > but I guess there doesn't seem to be a set policy for how the LIC=
ENSE=20
> > field should be set.
>=20
> I have no personal preference, but was just noting the difference. =
How
> do others feel about thi?
>=20
> BTW: please don't take this personal. I really appreciate you doing
> this, but I also am very aware that it is a boring and non-rewarrdi=
ng
> job, so we should better aim at getting it right te first time.

Actually, it became a de facto standard in the community to different=
iate=20
between strict GPLv2 and "GPLv2 or later" (I guess we should thank GP=
Lv3 for=20
this...)

Googling for the "GPLv2+" term will show many OSS projects clarifying=
 it this=20
way. As well as many project catalogs and listings grouping by "GPLv2=
+" vs=20
"GPLv2"...

In OE we've been using this term for some time now. Although, still t=
oo many=20
old recipes use old notations, sometimes even as generic as just plai=
n "GPL"=20
w/o specifying the exact version. It wasn't as critical before, but t=
hese days=20
OE is being adopted in corporate environments and proper licensing be=
came=20
quite important.

--=20
Denys



