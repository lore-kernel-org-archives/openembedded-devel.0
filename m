Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>)
	id 1PEPJY-0007jb-AS; Fri, 05 Nov 2010 17:38:57 +0100
Received: by fxm3 with SMTP id 3so2480040fxm.6
	for <multiple recipients>; Fri, 05 Nov 2010 09:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=WgV3a6ZesCJkiFwZXQhQuMkHjSR2npb+Q6qoHaOuD0c=;
	b=X7AXfmKbld1JpZuHuJp+XJziWDQh+6fn3oZbhPo4toMvClj8lIFLxXusS7bIj7moC2
	GcQf+FZYCQmPtoc3GMAwJEz4CRG/M+vLOoE08+a2l5DuMQJWD3K1Wp7eA4v+KwKDy0tv
	ssJj8f2tvd7M2GdeIav89nUFtXFcPGN4vF3DM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=Na9qTYdD9AL9jpo1PyeagQwNaJVo1uFvxldo1EarFjhdWfvnfk9ku0c74HHqZdFeIe
	wGY3ClY79LzbpLv19vWLkKAYt4543wNOT0xLxIKIXT98zsDiiOvy5i9txkYVn8SQQqjI
	iJvmv5guai6HeyfFsmgXCLYmhiwpfXhrT22NY=
Received: by 10.216.22.70 with SMTP id s48mr1392176wes.27.1288975082622; Fri,
	05 Nov 2010 09:38:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Fri, 5 Nov 2010 09:37:42 -0700 (PDT)
In-Reply-To: <1288973274.28481.15978.camel@rex>
References: <1288973274.28481.15978.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 5 Nov 2010 09:37:42 -0700
X-Google-Sender-Auth: 800rWrnf9UolNtehaiu5V-Ygxqc
Message-ID: <AANLkTi=K3fGXmLZVjfqjxvGy1vg0ov3WX-VxG2zvNf87@mail.gmail.com>
To: openembedded-members@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: OpenEmbedded and the Yocto Project
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
X-List-Received-Date: Fri, 05 Nov 2010 16:38:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 5, 2010 at 9:07 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
>
> When it comes to using OE commercially, its actually quite hard. If you
> look at even the big companies using OE like TI, Mentor and Montavista
> to name but a few, whilst they are using it, there are significant
> changes they need to make to turn it into a commercial product. Those
> changes and stabilisation are eating a lot of the developer resources
> they put in and there is arguably a comparatively low amount of feature
> development being worked upon. If somehow we could share some of that
> effort, it would free up resources for feature development.
>

I think we can all agree with that.


> End result is that Yocto/Poky have a states release cycle, approximately
> six months. We have releases, BSPs can be made against the last release.
> When planning people can know roughly what state the tree will be in at
> a given time and whilst no timeline is perfect for everyone, its well
> defined and people can adapt to it.
>

This is good to hear, and I hope OE can adopt this as well, or,
alternatively, as has been discussed a bit, OE could become a set of layers
built upon Yocto, and share the release cycle.

Third is a QA problem and one of size and scale. Realistically, there is
> no way you can "test" OE as its just too large with too many
> combinations. On the other hand we have a pretty good known test matrix
> for Poky/Yocto as its a smaller set of data than OE. If we want to
> expand that set, we're prepared to as long as there is contribution to
> help test it too (additional autobuilder machines and QA resource).
>
> We do appreciate the value of the additional things OE contains however
> and also realise the value in additional machine support. This is why
> the Yocto project has done work to make layers work better and become
> usable for additional topic "metadata" layers and also machine support
> in the form of BSPs. This neatly allows people to take ownership of
> subsets of the metadata, be them community or commercial, a problem OE
> has long suffered from.
>

This is also good to hear, and I agree that this is a good solution -- we
actually always wanted to be able to split control and ownership in this
way, but originally determining how to combine metadata from multiple places
wasn't a priority.  Aside: the approach taken by Conary for the metadata is
a very intriguing one.

Having a known test matrix and an ability to QA the system also helps
> massively with feature development. Within Poky/Yocto we can *know*
> whether a given change causes a regression within the core without too
> much effort. I'd suggest this is much much harder to know within OE.
>

Perhaps, but I think the OE Testing effort is a step in the right direction,
so OE too will have a test matrix, just, as you say, a less complete one.


> This brings me to a forth problem which is related to some of the above
> indirectly which is that of the contributions model itself. Above, I
> mentioned we needed to ensure some kind of vetting of the license on new
> recipes and this isn't possible with the OE "push" contributions model.
> This is why Yocto/Poky have adopted a kernel like "pull" model for
> changes. If it can scale for the Linux kernel, I think it can scale for
> Poky/Yocto and could if there was a will, for OE too. Sub-maintainers
> are appointed based on trust to merge together "pull" requests and pass
> them upwards so no one person becomes overloaded.
>
> This "pull" model also makes decisions and technical direction easier,
> there has to be a lot of trust in the Linus type person to do the right
> thing. If that person screws up, the project can fork and there would
> likely be a clear winner afterwards if the decision was worth the fork
> so there is actually a strong natural pressure on that person to get
> things right. In the Yocto/Poky world, I've taken on that overall
> responsibility as I have relevant technical experience and a long
> history of leading Poky and to a large extent OE from a technical
> standpoint having contributed many of the technical advancements and
> architecture improvements that have put OE where it is today. I fully
> intend to have sub maintainers to help and I really care about their
> technical leadership, not who pays their wages.
>
> This is as good a time as any to talk about the governance of the Yocto
> Project as people look at the diagram on the website and get very
> confused. The people with the power in the model are the architect/
> maintainer groups.
>
> When it comes to technical direction this comes from the maintainers of
> the various components. They set this based on the input from the
> architect/steering group but they are the ones deciding the
> implementation details, writing code, accepting patches and developing
> the feature roadmaps and development schedules and actually doing the
> real work.
>
> One of the cornerstones of the governance is that if the steering group
> ever has to "tell" the architect what to do then the architect has
> failed at their job. This also applies to maintainers as if the
> architect has to get directly involved things aren't working correctly.
>
> So the steering group is there to suggest things that would
> help the project and steer to a degree but the architect is there to
> actually set the technical direction overall. In turn the architect is
> there to given direction to the maintainers.
>
> The real power therefore rests with the Maintainers with delegated
> authority through the Architect. The steering group gives managers at
> the companies involved a warm fuzzy feeling that they can get involved
> if things ever do look like they're going of the rails but the agreement
> is its "hands off" as much as possible. Its also worth noting the CTOs
> on the diagram are primarily about publicising and networking the
> project.
>

I really like this approach, personally.  I think OE has lost direction
somewhat since I left the project, even as it has grown in leaps and bounds,
not because of me, but because of the reduction of technical leadership in
general.  Having both working groups / steering committees to give companies
input and individual technical leaders to do day to day decision making
seems to be a good solution.  I do think we'll need a branch structure which
facilitates integration and stability testing of features before they get
pulled, along the lines of linux-next or git's next and pu branches, though,
if it doesn't have that already :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

