Received: from [209.85.217.211] (helo=mail-gx0-f211.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M53VB-0001VT-Ge
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 21:55:32 +0200
Received: by gxk7 with SMTP id 7so2138909gxk.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 12:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+pxF5TWFqu4RHGWykSVJ2uks5WSbdjgR5Oa2hy/3Xns=;
	b=WB9i5dXz4UdPSa+iaNp1dUrT4jyv0NaStlG2ysfJn5kKIsZG7P7mh2cDqekJKNOWJy
	hm0FF8oc+IXO0tD2LlFweEEKLYxgT+INSglO9hElNhmdyjzm987fRF3WWko/7QVx8GI1
	AvyHO/NDtpERa+fiMVanq9qhvP5jfbxbZt9bY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XScNZ8eoUbvUjaB1gBwlRsLVqrCA2w/gSy6f/9tyBkfQYJYYetHAIdLbeSB6Mx5jnn
	goXpvWA4px/2q9V/8E1ixcksIlGzXO55ed423w+K9GuykgtluN0Flm2QLQnO2abPpMpe
	7tTgTb5HgaF848+TnQP5MgVSxuefM/Ei7ABao=
MIME-Version: 1.0
Received: by 10.151.134.6 with SMTP id l6mr6753433ybn.163.1242416897119; Fri, 
	15 May 2009 12:48:17 -0700 (PDT)
In-Reply-To: <1242410201.4514.79.camel@lenovo.internal.reciva.com>
References: <f96d234e0904300544g4f933c15x1abaa430373868fa@mail.gmail.com>
	<1241101618.30742.241.camel@mill.internal.reciva.com>
	<f96d234e0904301843q27803491xe14c09bf75193fe7@mail.gmail.com>
	<1241695142.16805.170.camel@mill.internal.reciva.com>
	<4A02CF2A.70804@balister.org>
	<1242410201.4514.79.camel@lenovo.internal.reciva.com>
Date: Fri, 15 May 2009 15:48:17 -0400
Message-ID: <f96d234e0905151248s6962d25ck309197268d475e9b@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: progress on OE organization issues
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
X-List-Received-Date: Fri, 15 May 2009 19:55:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2009 at 1:56 PM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2009-05-07 at 08:08 -0400, Philip Balister wrote:
>> My number one concern is that we not create multiple membership groups
>> and committees. There is no sense creating groups independent of the eV.
>
> I guess my problem with this point of view is that I haven't ever really
> seen a clear roadmap or timeline for getting the e.V. "deployed" in
> practice, nor a definitive statement of what exactly the e.V.'s mission
> will be once it is up and running. =A0(In particular there seems to be
> some unclarity about whether the e.V. is intended as purely an
> administrative vehicle for managing funds, organising servers and the
> like, or whether it is to be more of a general project governance
> organisation.) =A0So it seems like we might be waiting a long time, only
> to discover in the end that, when the e.V. is up and running, it doesn't
> actually help us with solving the problems at hand and we are no better
> off than if we'd just acted straight away.
>
> Presumably the existing core team must have some kind of vision for the
> exact role that the e.V. would play in this new world, and how we get
> there from here, but I've never seen it articulated anywhere. =A0Can you
> shed any light on that?

One thing about OE that may not be typical is the rate at which key
people come and go.  That said, it seems like the structure needs to
accommodate this -- perhaps by electing a new core team every 3
months.  I propose we make this real simple -- everyone with commit
access gets one vote, and we elect a core team (5 people).  Eventually
this could be expanded to "members".  Thoughts?

Core team responsibilities:
- commit policies
- approving/revoking commit access
- setting technical direction
- resolving disputes
- assigning admin/doc/stable teams.
- making or delegating any other decision that comes up

Once we have votes, then we simply go down the list till we find
enough people willing to take on these responsibilities for 3 months.
With the short term, hopefully it will not be too much of a burden.

It seems like technical leadership and direction is the key need right
now, and I hate to get bogged down in eV details -- it seems that is
secondary as there is no pressing financial needs.

So in the interest of keeping things simple, my proposal -- get an
active technical core team in place, and then worry about legal
structure details.

Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


