Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>)
	id 1PEOqk-0007nE-K3; Fri, 05 Nov 2010 17:09:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id oA5G8He2023235;
	Fri, 5 Nov 2010 16:08:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22562-09; Fri,  5 Nov 2010 16:08:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id oA5G8A3C023228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 5 Nov 2010 16:08:11 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 05 Nov 2010 16:07:54 +0000
Message-ID: <1288973274.28481.15978.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-members <openembedded-members@lists.openembedded.org>
Subject: OpenEmbedded and the Yocto Project
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
X-List-Received-Date: Fri, 05 Nov 2010 16:09:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've talked to various people and I think the point has come to write
down my thoughts rather than repeat conversations with various people.
Sorry if this ends up as a long email.

I'm on record in the past for commenting on the number of build system
presentations at ELC-E in 2009. The embedded community has several of
them, all with advantages and disadvantages, I look at this and wonder
why we couldn't have one good one. You also wonder why there is no focus
point fostering embedded Linux tools in general, everyone loves to go
off and do their own thing as its easier than working together.

It was based on these observations and a desire to improve the
situation, I proposed the idea of what has become the Yocto project.

Intel doesn't want to own Yocto, it realises that to create this one
good build system for example, it needs other people to be involved.
This is why the Linux Foundation now owns the rights to Poky and the
Yocto Project. Yes, it been seeded by Intel/Wind River people and by
Poky, not OpenEmbedded. The simple reason is that these are the things
could be donated to the project, OpenEmbedded is not something the Linux
Foundation can take ownership of, nor should it be.

There are many interesting facets to the Yocto project and I will cover
some of them below later as I don't think people are seeing them yet but
I know what most readers are interested in here so getting to the heart
of the matter, OpenEmbedded and Poky.

OpenEmbedded has always intended itself to be useful to companies to
build products off and to become an all purpose fully featured build
system and development tool. It does many things well,  I love it for
what it is and I've spent over half a decade working on it in various
ways which I'd never have done that if I didn't believe in the
architecture.

When it comes to using OE commercially, its actually quite hard. If you
look at even the big companies using OE like TI, Mentor and Montavista
to name but a few, whilst they are using it, there are significant
changes they need to make to turn it into a commercial product. Those
changes and stabilisation are eating a lot of the developer resources
they put in and there is arguably a comparatively low amount of feature
development being worked upon. If somehow we could share some of that
effort, it would free up resources for feature development.

So what do I mean by hard? First there are the conversations with your
legal department where some questions arise:

* How do you ensure license compliance?
* When someone makes a change, how do you know the license is still 
  correct?
* You've mixing GPLv2 and v3? How are you ensuring no contamination?
<cue a long discussion which I'd bet most companies have>

Bottom line is that the contributions process to OE is not sufficient to
be acceptable to most companies legal departments. Sure, instead of
Yocto, Intel and Wind River could each have some internal version of OE
which we'd vet changes to and I suspect Montavista and Mentor at least
already have this but its not very open source and it duplicates a lot
of work.

So the end result is that the Yocto project has totally vetted the
LICENSE data in Poky, any new additions go through a set of checks
before they be allowed into the repository and we also have some
automated process/tools enhancements such as the licence checksums to
catch changes to licenses more easily.

So that is one area, second is one of development and releases. OE has
never had one, it may have one soon, we'll see but so far its never
happened. Releases are important in many ways as they give people
something to plan expectations against. Currently OE is always active
development, there is never any calm down before a release, switch to
bug fixing mode rather than enhancement and so forth. This means if you
develop a BSP layer, which version of OE can you state it works with?

End result is that Yocto/Poky have a states release cycle, approximately
six months. We have releases, BSPs can be made against the last release.
When planning people can know roughly what state the tree will be in at
a given time and whilst no timeline is perfect for everyone, its well
defined and people can adapt to it.

Third is a QA problem and one of size and scale. Realistically, there is
no way you can "test" OE as its just too large with too many
combinations. On the other hand we have a pretty good known test matrix
for Poky/Yocto as its a smaller set of data than OE. If we want to
expand that set, we're prepared to as long as there is contribution to
help test it too (additional autobuilder machines and QA resource). 

We do appreciate the value of the additional things OE contains however
and also realise the value in additional machine support. This is why
the Yocto project has done work to make layers work better and become
usable for additional topic "metadata" layers and also machine support
in the form of BSPs. This neatly allows people to take ownership of
subsets of the metadata, be them community or commercial, a problem OE
has long suffered from.

Having a known test matrix and an ability to QA the system also helps
massively with feature development. Within Poky/Yocto we can *know*
whether a given change causes a regression within the core without too
much effort. I'd suggest this is much much harder to know within OE.

This brings me to a forth problem which is related to some of the above
indirectly which is that of the contributions model itself. Above, I
mentioned we needed to ensure some kind of vetting of the license on new
recipes and this isn't possible with the OE "push" contributions model.
This is why Yocto/Poky have adopted a kernel like "pull" model for
changes. If it can scale for the Linux kernel, I think it can scale for
Poky/Yocto and could if there was a will, for OE too. Sub-maintainers
are appointed based on trust to merge together "pull" requests and pass
them upwards so no one person becomes overloaded.

This "pull" model also makes decisions and technical direction easier,
there has to be a lot of trust in the Linus type person to do the right
thing. If that person screws up, the project can fork and there would
likely be a clear winner afterwards if the decision was worth the fork
so there is actually a strong natural pressure on that person to get
things right. In the Yocto/Poky world, I've taken on that overall
responsibility as I have relevant technical experience and a long
history of leading Poky and to a large extent OE from a technical
standpoint having contributed many of the technical advancements and
architecture improvements that have put OE where it is today. I fully
intend to have sub maintainers to help and I really care about their
technical leadership, not who pays their wages.

This is as good a time as any to talk about the governance of the Yocto
Project as people look at the diagram on the website and get very
confused. The people with the power in the model are the architect/
maintainer groups.

When it comes to technical direction this comes from the maintainers of
the various components. They set this based on the input from the
architect/steering group but they are the ones deciding the
implementation details, writing code, accepting patches and developing
the feature roadmaps and development schedules and actually doing the
real work.

One of the cornerstones of the governance is that if the steering group
ever has to "tell" the architect what to do then the architect has
failed at their job. This also applies to maintainers as if the
architect has to get directly involved things aren't working correctly.

So the steering group is there to suggest things that would
help the project and steer to a degree but the architect is there to
actually set the technical direction overall. In turn the architect is
there to given direction to the maintainers.

The real power therefore rests with the Maintainers with delegated
authority through the Architect. The steering group gives managers at
the companies involved a warm fuzzy feeling that they can get involved
if things ever do look like they're going of the rails but the agreement
is its "hands off" as much as possible. Its also worth noting the CTOs
on the diagram are primarily about publicising and networking the
project.

I, Intel, Wind River and the Linux Foundation really hope we're going to
see more people becoming part of the Yocto project, particularly
companies at the steering level and hence new maintainers (the people
who get things done ;-).

This project is not in competition to OpenEmbedded, its a compliment to
it. Its a serious opportunity to leverage some corporate sponsorship and
see OpenEmbedded, the Yocto project and also Embedded Linux all grow.

In this email I've talked a lot about the build system but there is much
more to this than just that as our focus is wider. We're interested in
embedded tools in general for example:

* Yocto's Eclipse/Anjuta Plugins
* Pseduo (fakeroot replacement)
* BSP standardisation
* Cross Prelink
* Documentation
* Hardware labs/testing framework

to name just a few things we're talked about. There are many others and
many interesting developments yet to come including the things we've not
yet through of but new members will bring!

Hopefully this email explains some of the reasons the project exists,
what the differences are to OE and that is isn't something bad but
actually a very positive thing. I have not dived into the topic of
if/how Poky and OE can work together, that can be the subject of another
email. If anyone has any questions I'm happy to answer them.

Cheers,

Richard





