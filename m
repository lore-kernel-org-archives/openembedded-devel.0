Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>)
	id 1Pdnml-0000cs-0Q; Fri, 14 Jan 2011 18:50:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p0EHnP27016804;
	Fri, 14 Jan 2011 17:49:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16485-05; Fri, 14 Jan 2011 17:49:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p0EHnGL8016798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 14 Jan 2011 17:49:17 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-members <openembedded-members@lists.openembedded.org>
Date: Fri, 14 Jan 2011 17:49:10 +0000
Message-ID: <1295027350.14388.6527.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Yocto Project and OE - Where now?
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
X-List-Received-Date: Fri, 14 Jan 2011 17:50:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The vote result showed a strong opinion that Yocto and OE need to find a
way to work together which is something I'm very happy to see. I think
everyone is waiting for each other to make a move so I'm going to put
forward some ideas/discussion to try and start the ball rolling. I'm
filling out ideas here but I want to make it clear this is a straw-man
to discuss. I have given this a lot of thought though as its attention
to many of the details that will determine its success.

The agreement for OE to take up a seat on the Yocto Steering Group seems
to be progressing and I think that part of things is moving forward well
and the board is handling it. At a technical level we need to have some
discussion though.

I think the idea in people's minds is to create an "openembedded-core"
which would have a new development structure. There are various aims for
doing this but they include:

* Formalising processes for making changes
* Creation of a subset of metadata that has a consistent high quality 
  standard:
    - removal of legacy components (pkgconfig hacks, libtool hacks, 
      legacy staging, unneeded compiler arguments)
    - consistent metadata layout, spacing, use of variables
    - migration away from outdated practises (e.g. use BBCLASSEXTEND)
* Formalise cycles of development, stabilisation and release
* Ensure a form of standardised basic testing of changes and over time, 
  extend that testing
 
We've talked about doing this at OEDEMs in the past, we keep talking
around the issue, we now have an opportunity to attempt it and to make
it a success. Part of the problem was always manpower to undertake some
of it, Yocto gives us a mechanism to help with that.

What would we have to do to make that happen? Roughly speaking I think
the steps look like:

* Agreed to try a new contributions model
* Setup an openembedded-core repo
* Populate that repo with some base data
* Decide where OE core patches would be queued, discussed and processed
* Document the process
* Start using it
* Profit!

This raises some questions:

* What would the new contributions model be?
* Where should the oe-core repo be hosted?
* What do we populate the base repo with?
* Do we need a new mailing list to make it clear what core changes are 
  being proposed?
* Create a openembedded-core-contrib repo?

Assuming this happens there is then the question of what happens in
OpenEmbedded and what happens in Yocto to adapt to this.

I'd like to propose we take a significant chunk of Poky as the basis for
OE-core simply because we're already spent a significant amount of
effort cleaning it up and turning it into something that is close to
what we'd like to see from oe-core. There would be changes including:

* Strip out bitbake
* Strip out the poky glue components (scripts directory, documentation
directory, meta-emenlow, 
* Strip out the "poky" distro specific pieces
* Anything else we need to change to ensure the transition
* Add/remove recipes from the "core" as needed after discussion about 
  exactly what we need in there. I'm conscious for example 
  meta-toolchain-qte is missing and there is someone looking at fixing 
  that.
* Compare the existing OE classes with the ones in OE-core and ensure 
  nothing important is missing in OE-core.

I'd then propose the Poky repo continue to exist but effectively it
would become an automated amalgamation of bitbake + oe-core + poky/yocto
glue, hopefully just taking commits from the various upstream repos.
This would fulfil Yocto's requirement of making something simple to use
for end users but allow us to share much of the work between OE and
Yocto. Whether there are existing tools that would help with the
creation of such an automated repo or whether its a case of just writing
a script, I don't know but we'd work something out.

For OE, we've talked about cleaning it out for a long time and I think
meta-openembedded is the solution there with some cleanup happening as
people transition the recipes they use.

The one thing that is still bugging me a little is handling of layers
from a practical point of view. I like the idea of layer repositories
with a specific topic and defined ownership. On the other hand I want to
keep things simple for users both in checking out the build system and
for contributing changes back. There are a variety of solutions using
various git tools and I'd really like to have the discussion where we
compare the different options and figure out how to make a great user
experience.

I don't want to block making progress on the Yocto/OE relationship on
that one issue though and am happy that the poky specific repo problem
can be scripted for example in the short term until we arrive at the
full solution.

I'd also like to take a look at the practicalities of the contributions
model changes this would need. The free for all everyone can push model
of OE as it stands today is not really suited to achieve the aims
mentioned above. I believe we can look to other projects such as the
Linux kernel for examples of different models which may assist with
this. There, a "pull" model is used to great effect. In Yocto we already
have a tree like setup through which patches get submitted into Poky
with people performing review, then aggregating changes. I act as the
final point of that chain. I can't claim we have everything perfect but
I do think it works well. It means that we can do things like notice
instability in the codebase and throttle changes until those
instabilities are addressed. It wouldn't be too much change for me to
undertake that role with the OE-core instead of Yocto/Poky. I have the
appropriate understanding of the metadata core and my position as an LF
fellow places me somewhere independent with a clear mandate to spend
time on things like this. I also have the required passion for the OE
architecture and desire for OE to be successful!

One other question also springs to mind which is what is the TSC's remit
in this new contribution model. Its a complex issue, the TSC has helped
in cases but its also not without its problems, particularly its members
habit of not getting around to the "paperwork" of which I'm as guilty as
anyone else :(.

Also, there are now a number of people in the Yocto community who's
technical experience and background in embedded is already strong and OE
experience is growing ever stronger yet at present they're ineligible
for a seat on the TSC as they're not OE e.V. members or known much in
the OE community. The fact they're not e.V. members was a conscious
decision as an "invasion" of people from Yocto would send a message to
the OE community that simply wouldn't be correct. I mention this not as
any form of complaint but just to make the different parts of the issue
clear.

I'm open to ideas about how to move this forward and will also ask this
question of the TSC itself. Yocto's approach on this is quite different
with the steering group taking a hands off approach and the day to day
running being left to the architects and maintainers groups.

Finally, where should this discussion happen? The TSC likely feels some
of the issues discussed in this email are for them to reach a decision
on and provide advice to the wider OE community. I'd agree the TSC does
have remit over a lot of topics discussed here but equally I don't feel
it inappropriate to discuss them with the members list too.

I am conscious that openembedded-devel isn't likely to be seeing any
discussions on the members list and there may be viewpoints there. I'd
hate to think people felt ignored or under represented as that isn't
intentional and more an artefact of OE's structure. I'd appreciate some
guidance on where people think this discussion should happen. For now
I'd cc'ing both the members and devel list.

Ultimately, I think the only way we're going to move forward with this
is to actually try something.

Cheers,

Richard



