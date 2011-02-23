Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PsKoI-0001MC-Qe
	for openembedded-devel@openembedded.org; Wed, 23 Feb 2011 20:55:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p1NJn9E9018279;
	Wed, 23 Feb 2011 19:49:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17659-10; Wed, 23 Feb 2011 19:49:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p1NJn0WD018272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 23 Feb 2011 19:49:03 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tsc <tsc@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@openembedded.org>,
	openembedded-members <openembedded-members@lists.openembedded.org>
Date: Wed, 23 Feb 2011 19:48:54 +0000
Message-ID: <1298490534.26736.52.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: OE TSC Meeting 2011/02/21 Minutes
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
X-List-Received-Date: Wed, 23 Feb 2011 19:55:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Attendees: Khem, Koen, Mark, Richard, Tom
Apologies: Stefan

Chair for meeting: Richard

Proposed agenda was accepted. From the next meeting we'll invite Jeff to
attend and help with agendas/minutes and documentation of
policies/procedures.

Khem has a work in progress initial population for the oecore repository
which he agreed to push it after the meeting. It was agreed to base this
on Poky's history as not having any history would seem counter
productive. It was agreed to remove bitbake from the repo. There was a
lot of discussion about recipes, specifically linux-yocto, it was agreed
the "standard" kernels needed cleanup before making it into the core and
that that a vanilla kernel.org kernel would be desirable, possibly in
addition to linux-yocto. It was agreed that as/when any alternatives
were available we'd consider them but for now, linux-yocto works and
provides good support for the qemu machines.

For history, it was agreed that when pulling in data from other repos,
we'd mention where it was from and which revision of that tree it was
based upon so at least people can trace things back with a manual step
if needed. Grafting on the OE.dev history (in git terms) to meta-oe
isn't possible due to the way the repo is being populated.

We do need to investigate the delta between OE and Poky's core class
files and Mark volunteered to try and classify the differences for the
next meeting.

It was agreed to use a pull model for oecore with RP taking the top of
the pull tree role. For meta-oe, there was a lot of argument for
starting to use a pull model there too in an effort to also improve
quality, but, the TSC recognised this might be the cause of friction. It
was agreed to trial this for meta-oe whilst it becomes established and
to actively solicit member feedback on how this works out. It should be
stressed this is just a trial at this point.

For specific branches, it was agreed that people could be designated
maintainers for them and from the technical side, gitolite lets us do
this.

It was also agreed that we should have relatively open access contrib
trees alongside the main repos for the pull requests to come from.

The pull model needs clear contribution guidelines. Richard took the
action to find the ones being used for Yocto which will likely serve as
a basis for OE-core.

The topic of a distro in the core was controversial as distros don't
want to be forced into particular policies. There was a general thought
that having a set of soft shared policy defaults could be beneficial and
it was agreed that we could come up with a proposal everyone would at
least consider and evaluate. The intent is not to make all the distros
the same, just to simplify and share code where possible.

Yocto's plans to turn poky into an integration repo only were reiterated
and hence Yocto would become based off oe-core. Patch submission would
move to be done at the oe-core level for oe-core components.

Timeline wise, it was agreed to aim to make the OE 2011.07 release be
oe-core + meta-oe based. Likewise, Yocto's Q4 release would be oe-core
based.

Various other topics were touched upon but the TSC agreed to start
having more discussion via email as the meetings aren't cutting through
the details quickly enough.

Regards,

Richard
(on behalf of the interim-TSC)


IRC logs of the meeting follow:
(NB: in case of any mismatch, the minutes are the agreed outcome of the
meeting)

(20:57:05) Tartarus: Almost top of the hour and time to get on-topic, heh
(20:57:15) fray: yup...
(20:58:04) koen: any volunteers for chairing?
(20:59:16) RP__: I don't mind doing it again. I'd hoped Jeff might be here but with it being a US holiday I'm not holding out too much hope
(20:59:22) fray: I can if need be...
(21:00:25) khem: hello all
(21:00:34) RP__: hi khem
(21:00:35) fray: everyone here except Stefan?
(21:00:42) RP__: looks like it
(21:00:55) fray: shall we wait a few more minutes?
(21:01:36) RP__: We can give it a couple but we've a lot top get through so we need to get going soon IMO
(21:01:46) khem: lets start
(21:01:51) Tartarus: yes, lets just start
(21:01:55) koen: aye
(21:01:55) fray: ok.. lets start -- who is loging -- who is chair?
(21:01:56) RP__: Any changes to the agenda?
(21:01:57) khem: Stefan is not signed in
(21:02:13) khem: on IRC yet it might take sometime for him
(21:02:16) fray: I'm good with the one Koen sent out
(21:02:22) Tartarus: my client lacks logging so not me
(21:02:24) RP__: I can chair
(21:02:36) RP__: and my client logs :)
(21:02:42) ***khem has logging 
(21:02:53) koen: http://lists.linuxtogo.org/pipermail/tsc/2011-February/000063.html
(21:02:55) khem: ok RP__ go ahead
(21:03:04) RP__: ok, repo population
(21:03:18) RP__: khem posted a summary of where he's at
(21:03:26) khem: yes
(21:03:32) RP__: I also removed many old machines in upstream poky
(21:03:43) khem: ok
(21:03:50) khem: my snapshot is about 4-5 days
(21:03:52) khem: old
(21:03:59) RP__: What else do we need to change? Move poky distro config, recipes-sato into a separate repo?
(21:04:04) RP__: remove bitbake
(21:04:16) khem: only change as agreed upon I made is removed bitbake
(21:04:36) RP__: linux-yocto - keep or remove?
(21:04:41) koen: The important bit is to have a repo at all :)
(21:04:50) khem: I would say remove
(21:04:55) Tartarus: I would say keep
(21:05:01) fray: personally I like the linux-yocto..
(21:05:08) Tartarus: OE master needs some cleaning in terms of linux.inc
(21:05:09) fray: it's a single central starting point for kernel development..
(21:05:17) koen: that's the bruce thing?
(21:05:18) khem: Tartarus: I think yocto will have its own layer
(21:05:22) fray: (but it is different then what others are used to)
(21:05:23) Tartarus: khem, agreed
(21:05:23) khem: so it would suit there
(21:05:32) fray: yes, in Yocto Bruce is the one responsible for it and the associates tools
(21:05:34) Tartarus: I think we'll git mv it at some point soon
(21:05:52) Tartarus: But it should be the starting point
(21:05:54) RP__: Tartarus: I accepted a commit to remove linux.inc from yocto btw. I'm ok with a standard kernel recipe being added back, *if* it gets cleaned up
(21:06:00) Tartarus: Not oe.master's stuff
(21:06:25) Tartarus: RP__, agreed.  As I was typing when you were I imagine, we need a cleaner base kernel recipe
(21:06:29) Tartarus: And that's a better starting point
(21:06:31) koen: Tartarus: historically things are in linux.inc because I wasn't allowed to put it in kernel.bbclass
(21:06:36) RP__: Tartarus: The thing about linux-yocto is its quite different from standard OE kernels
(21:06:54) RP__: It can live side by side with the more standard kernel approach but it is different
(21:06:57) Tartarus: koen, good to know
(21:07:08) khem: from kernel we should focus on recipes to support qemu
(21:07:10) Tartarus: RP__, yeah, something worth discussing when we get to BSP guidelines
(21:07:20) fray: it is.. I think the policy question is..  is linux-yocto something we (as the TSC) should recommend or is it something yocto project specific?  (I also make the clear statement we have to support 'non linux-yocto' kernels)
(21:07:25) Tartarus: khem, that's practically a no-op and the simple case
(21:07:30) RP__: Actually, different question - are we ok with linux-yocto providing the qemu kernels?
(21:07:31) Tartarus: $MACHINE works in upstream
(21:07:35) khem: so generic recipe would be nicer
(21:07:36) RP__: Is so I propose keeping it for that reason
(21:07:42) RP__: s/Is/If/
(21:07:54) fray: yes, it does provide a clear path to QEMU support
(21:07:58) Tartarus: fray, to me, we shouldn't drop it today
(21:07:59) khem: RP__: is linux-yocro linux-wrs ?
(21:07:59) koen: I have no strong opinion on linux-yocto (unless it's beagle support)
(21:08:04) Tartarus: But it won't do long term as is
(21:08:10) fray: linux-yocto used to be linux-wrs
(21:08:11) Tartarus: Just like probably other things we'll run into when we get down to work
(21:08:16) Tartarus: Rather than just talking about it
(21:08:25) fray: (when the version was moved forward, linux-wrs was abandoned and linux-yocto replaced it)
(21:09:02) khem: I still propose to have a general upstream kernel as default
(21:09:05) RP__: Given the qemu situation, I propose we leave linux-yocto until we have a better maintained plan. As things stand I can complain loudly to Bruce if any of the qemu machines break and he does actually test them
(21:09:35) Tartarus: khem, I agree we will need some good kernel guidelines and "general upstream" support as part of BSP guidelines
(21:09:36) khem: in OE vanilla kernel boots qemu
(21:09:38) fray: seems reasonable to me to have a kernel.org recipe and a linux-yocto recipe..
(21:09:39) khem: all arches
(21:09:49) Tartarus: But I don't think the OE version is the right starting point to get there
(21:10:00) fray: if there are variants (for qemu), then we have to decide what to do with them.. I favor the linux-yocto
(21:10:19) Tartarus: Really, to me, we should start with linux-yocto and make a new linux core recipe out of it
(21:10:30) khem: ok
(21:10:31) Tartarus: and make linux-yocto bring in that, and vanilla 2.6.N bring in that
(21:10:36) Tartarus: And whatever we recommend for BSPs do that
(21:10:42) fray: Tartarus I agree.. a secondary (maybe not part of the core) kernel.org is also useful...
(21:10:45) Tartarus: Hence, git mv not git rm ;)_
(21:10:58) koen: does linux-yocto support more than .34 and .37?
(21:11:10) RP__: koen: no
(21:11:20) fray: linux-yocto is expected to track kernel.org regularly
(21:11:21) RP__: But, I'm not saying linux-yocto is all we should have
(21:11:45) RP__: I'm just saying it could make a good base to build from, at least for the qemu machines
(21:12:06) Tartarus: And again, BSP guide lines which is further down the agenda
(21:12:21) fray: the other thing with the linux-yocto -- if people hate it, we replace it in the core..  if it's not being maintained as expected.. we replace it in  the core.. etc..
(21:12:21) RP__: ok, lets not rathole on this
(21:12:25) Tartarus: To me that includes strong definitions on how to do the kernel and the firmware and so forht right
(21:12:29) koen: shall we just say we'll import yocto and remove bitbake at first?
(21:12:30) khem: ok we can keep linux-yocto but I think BSPs are what should define kernel
(21:12:37) koen: and work out the rest along the way?
(21:12:42) Tartarus: koen, agreed.
(21:12:48) khem: fine with me
(21:12:52) fray: fine with me
(21:12:52) khem: I have those changes
(21:12:57) RP__: likewise
(21:13:04) khem: and I can pupulate after the meeting today sometimes
(21:13:08) RP__: ok, any other issues on 02) ?
(21:13:10) koen: the TSC doesn't need to do everything themselves :)
(21:13:19) RP__: khem: Can you use the latest yocto with all those machines removed?
(21:13:29) khem: RP__: will do
(21:13:34) RP__: ok, 3
(21:13:35) fray: someone mentioned last time differences in the packages -- once the repo is setup, I can work through some of that and try to reconcile the patches and differences..
(21:13:35) ***khem makes a note
(21:13:44) koen: RP__: fwiw, yocto with bitbake master has some fetch2 buglets
(21:13:49) RP__: OE metadata without losing history?
(21:14:05) RP__: koen: now probably isn't the time for that discussion ;-)
(21:14:14) koen: right
(21:14:31) RP__: I think with the oe-core, poky is a better fit history wise
(21:14:33) koen: about history, we could use git filter-branch on the subdir
(21:14:45) RP__: oe is going to work better for meta-oe
(21:14:46) Tartarus: So, are we starting with a clone of poky or an import, sans history?
(21:14:51) fray: for the core items right?  how do we choose what to pull in from the existing OE-git?
(21:15:02) koen: Tartarus: clone
(21:15:13) fray: I agree, clone makes the most sense
(21:15:17) RP__: Tartarus: I'd suggest throwing away the history loses a lot and doesn't gain anything
(21:15:21) ***Tartarus also wants a clone
(21:15:26) khem: we import history so we get all poky history
(21:15:36) Tartarus: khem, so that's what you've done then?  OK, good.
(21:15:41) koen: for 03) on the agenda I think "imported from OE" would be the minimum
(21:16:00) RP__: koen: minimum for what?
(21:16:13) koen: moving "new" recipes from OE into oe-core
(21:16:24) Tartarus: s/recipes/metadata/
(21:16:27) fray: for #3, I propose once 2 is done, I (or others) attempt to reconcile the poky meta vs the oe matching components.. and see what is different and attempt to classify it for the next meeting..
(21:16:28) koen: not sure how many we'll encounter
(21:16:39) fray: then we can decide what needs to be moved in to replace existing poky (or augment it)
(21:16:39) khem: I think eventually oe of today will become oe.meta
(21:16:39) Tartarus: And yes, just "imported from OE", perhaps saying "as of ...."
(21:16:44) khem: and history will still be there
(21:16:51) khem: we can add pointer as we go along
(21:16:57) fray: khem, agreed
(21:17:03) koen: fray: if there is a list, we can have the people subscribed to oe-core divide it up and research
(21:17:27) Tartarus: Honestly, I'd like to see oe.meta as new, and then the git magic to link back for history if desired
(21:17:28) fray: koen, ya.. I think generating the list should be fairly easy once the oe-core is setup
(21:17:41) RP__: Tartarus: What git magic?
(21:17:43) Tartarus: And I say that as someone that's done a whole lotta digging in history to see what/wheres
(21:18:10) Tartarus: RP__, I don't recall the incantation but for example how you can get the linux kernel from BK history in, if you want, the main repo
(21:18:18) Tartarus: Or did that end up not being viable long term?
(21:18:26) khem: Tartarus: is it doable to link repo histories like that
(21:18:29) RP__: Tartarus: This isn't going to work for meta-oe the way its being contruscted
(21:18:46) ***RP__ played with this for OE history into the BK days at one point
(21:19:06) RP__: at the point you want to graft history on, you have to have similar looking trees
(21:19:29) RP__: meta-oe started from scratch, not a copy of OE.dev
(21:19:35) khem: I think if oe.meta is populated fresh  then we have to kep todays oe for history purposes in any case
(21:19:49) RP__: Well, the current oe.dev repo isn't going anywhere
(21:19:53) Tartarus: khem, always true
(21:20:05) Tartarus: RP__, ah, I thought there was a way to notice / check for a bunch of git mv's and such...
(21:20:23) khem: git log --follow
(21:20:33) koen: when we switched to mtn we didn't include history, that seemed to work quite well
(21:20:35) RP__: Tartarus: You need two trees with kind of match over the graft point
(21:20:39) Tartarus: khem, in grafting new history in i mean
(21:20:48) koen: apart from a few people saying I wrote OE in a single day :)
(21:21:07) RP__: koen: The tree from pre mtn days looked very like the thing you imported though
(21:21:24) RP__: In the meta-oe case, there is no such match
(21:21:30) koen: right
(21:21:31) khem: I think the problem we will have is the trees are going to look differnet
(21:21:32) Tartarus: So, lets get back to topic?
(21:21:34) Tartarus: For oe-core
(21:21:47) Tartarus: Saying "taken from OE", possibly with "as of ..." is enough?
(21:21:51) Tartarus: Or do folks think we need more?
(21:21:55) RP__: Fine with me
(21:21:57) koen: I think that's enough
(21:22:09) koen: people that care for their stuff are free to do more
(21:22:11) fray: Fine with me.. do we need to reference the commit ID we took it from?
(21:22:15) khem: yeah
(21:22:23) Tartarus: as of ... ;)
(21:22:37) fray: ok.. (was thinking a date there.. but commit ID is better)  ;)
(21:22:48) RP__: dates are meaningless
(21:22:54) RP__: I think we all agree
(21:23:00) koen: onto 04)?
(21:23:06) khem: fray: if we take one commit but if we take suppose a whole file that may have many commits
(21:23:12) khem: associated
(21:23:27) fray: khem, it's the last commit that matter.. we can trace history from there.. (AFAIK)
(21:23:48) RP__: From the last commit you can trace the history, albeit with one manual step
(21:24:01) RP__: ok, 4) We agree on a pull model for the oe-core?
(21:24:11) khem: that right
(21:24:13) koen: with RP in charge of the puling
(21:24:14) fray: I think it's absolutely required to be pull model
(21:24:16) khem: pull yes
(21:24:17) Tartarus: Agreed, pull
(21:24:20) RP__: Other layers, good question - I think meta-oe needs to be a push model?
(21:24:39) RP__: Do we want to encourage ownership of directories within meta-oe?
(21:24:46) Tartarus: For meta-oe, I would like to see OE try a shared pull model
(21:24:49) koen: I'd like to get away from push models
(21:24:49) RP__: ownership of layers effectively
(21:24:55) fray: for other layers, I'm open to anything..  I think for the time ebing meta-oe is likely going to be a "push".. bt it would be nice to get owners and make it pull
(21:25:02) Tartarus: Authorized a few people to be OK to pull
(21:25:09) koen: push models allow people to delete 500 recipes on a sundaymorning
(21:25:17) Tartarus: And then other groups can do as they like with their layer
(21:25:17) RP__: I don't think we can change everything all at once
(21:25:31) koen: if we go with a push model, the revert policy needs to get amended
(21:25:37) RP__: The pull model is going to take some getting used to and we don't want to try and pull off more than we can handle in one go?
(21:25:48) khem: yeah for meta-oe it will be a paradigm shift many devs have resisted to pull model
(21:25:49) RP__: koen: Proposed ammendment?
(21:26:10) Tartarus: RP__, I think while we're getting people to submit stuff to a new list based on a new tree we should do this
(21:26:11) koen: RP__: obvious breakage
(21:26:17) Tartarus: otherwise we'll have inertia to overcome
(21:26:45) Tartarus: So long as we have enough and respected group of people that can pull and are active, it shouldn't be a problem
(21:26:52) Tartarus: We're already half way there even with oe.dev
(21:26:59) RP__: Tartarus: Ok, lets see how this fills out with details. Who are you going to put in this respected group?
(21:27:00) Tartarus: Many people post and then get pw-am.sh'd in
(21:27:21) fray: would it make sense then to state oe-core is pull model.. being "new"
(21:27:49) Tartarus: I'd start with the TSC members
(21:27:50) fray: meta-oe will following existing procedures, but we (TSC) highly recommend a pull modem going forward?  sooner the better?
(21:27:56) RP__: If the whole thing is a pull model we risk losing a lot of OE developer buy in?
(21:27:59) Tartarus: And assuming we're all active and polite about it
(21:28:09) Tartarus: That should help make sure no ones feelings are overly hurt
(21:28:21) fray: RP__ thats my only concern.. but I don't have a good feeling about push vs pull today in the OE community
(21:28:24) koen: since meta-oe is new anyway, I'd like to make that pull immediately, with a few people people allowed to pull in patches
(21:28:29) RP__: Tartarus: I can see one instant complaint appearing about this
(21:28:34) fray: koen -- agreed
(21:28:39) RP__: Tartarus: will, more than one
(21:28:43) Tartarus: I think we only risk loosing people if pullers are either (a) arbitrary or (b) we all sit on our hands and don't pull
(21:28:57) Tartarus: And I want to stress politely and non-arbitrary
(21:29:05) RP__: Ok, how about we trial the pull model for meta-oe?
(21:29:05) khem: yeah I think many devs still go with the cental repo concept
(21:29:16) fray: do we need guidelines for the pull model folks?  (are there existing ones?)
(21:29:33) koen: the people who resisted things like posting patches to the ml were also the ones actively disable QA classes
(21:29:37) fray: I want to make sure everyone knows what to expect -- as well as the reuqirements to have the ability to 'pull'
(21:29:40) RP__: but make it clear it is a trial starting with the TSC members as the pull people. We want people to try it and give honest feedback?
(21:29:41) Tartarus: fray, yes, we should, to be transparent
(21:29:44) koen: we don't have a lot of those left in OE nowadyas
(21:29:52) Tartarus: RP__, agreed
(21:30:01) fray: that works for me..
(21:30:09) koen: so do we want meta-oe-contrib or allow branches in meta-oe?
(21:30:13) fray: do we have enough timezones covered by TSC folks to react fairly quickly?
(21:30:22) RP__: The trouble with pull models is you need a very clear and consistent set of guidelines
(21:30:32) Tartarus: I think we should follow the yocto model of a contrib repo
(21:30:39) khem: yes
(21:30:40) fray: I like the contrib model myself
(21:30:43) Tartarus: RP__, agreed.  Does yocto have something written down?
(21:30:47) RP__: Yes, I also like the contrib model
(21:30:53) koen: Tartarus: agreed, I know I would mess up once in a while and push to the wrong repo :)
(21:31:15) RP__: Tartarus: Good question. I know I have written things down and people do have pretty clear expectations in the yocto space
(21:31:17) khem: we could open up user branches on current oe writable to all
(21:31:25) khem: and just lock master for pull
(21:31:34) RP__: AR to RP - find some guidelines to run past the group for the next meeting
(21:31:46) khem: I think we should try pull on oe-meta
(21:31:48) fray: khem, we tried that within Wind River and ran into issues with repository size and such..
(21:32:02) khem: hmm
(21:32:03) fray: we've gone to a different model then contrib.. but I like the contrib model myself
(21:32:17) RP__: I'd like the idea of specific branches with owners on the meta-oe
(21:32:19) koen: can we also discuss things on the TSC list to prepare for the meeting?
(21:32:23) RP__: and we can do this with gitolite
(21:32:27) koen: trying to fit everything into 1 hour is a bit much
(21:32:30) fray: koen, I think we should
(21:32:35) RP__: koen: agreed, we need to do better at this
(21:32:54) RP__: i.e. someone could be responsible for a release branch
(21:32:59) koen: I completely failed last week due to being abroad, but I can do better this week
(21:33:03) khem: yes gitolite allows per branch access control
(21:33:17) RP__: I'd make contrib a seperate repo as you end up with loads of weird branches and its better to keep the main repo clearer
(21:33:31) Tartarus: And there's more stuff we can leverage from yocto
(21:33:35) Tartarus: ie the pull request scripts
(21:33:46) khem: yes
(21:34:08) koen: so we basically agree on 04), but need to sort out some details
(21:34:18) khem: lets keep discussing it more on the ml
(21:34:20) RP__: ok, so contrib tree, save option of branches and delegate those to people, need to come up with definite pull guidelines based on whats been working well in yocto
(21:34:21) fray: ya, sounds like it.. with details on the ml
(21:34:26) khem: koen: yes
(21:34:31) RP__: 5)
(21:34:33) khem: moveon
(21:34:50) RP__: guidelines for layers
(21:35:04) koen: 05) is a veiled way of me saying "no distro in core, unless it's a complete stupid one called dont-use-me.conf"
(21:35:06) RP__: any particular representations at this point?
(21:35:32) RP__: koen: So its impossible to build the core alone?
(21:35:35) Tartarus: koen, so long as dont-use-me can be used to validate the metadata isn't totally insane
(21:35:50) fray: for the core, I see a (lack of better word) sample "distro" that's sole point is to be able to boot with QEMU and show the code functions and can be tested..
(21:35:57) fray: but it's NOT expected to be "the" distro
(21:36:10) koen: RP__: since everything is layers it wouldn't be so bad to require >1 layers, but I see the use in needing only core
(21:36:10) Tartarus: fray, yes, that's what I'm getting at I guess
(21:36:12) fray: Tartarus ya.. validation is what I want
(21:36:14) khem: yeah sample distro
(21:36:25) khem: no much policies
(21:36:25) RP__: How about a "shareddistro.conf" which sets all its options softly to sane defaults?
(21:36:26) Tartarus: I want to be able to point my builder setup and say here's stuff that builds and perhaps does ____
(21:37:08) fray: that seems reasonable to me.. then real distros can use that as a starting point
(21:37:20) RP__: koen: any objection to doing that?
(21:37:21) khem: RP: I would say yes
(21:37:35) koen: RP__: I wouldn't call it 'shared' or something
(21:37:47) koen: I get enough hatemail about not using sane-<foo> in OE already
(21:37:53) RP__: koen: ok, we call it what?
(21:38:00) koen: validation would be ok for me
(21:38:03) khem: sane will go away
(21:38:08) RP__: koen: Whats the reason for not using sane?
(21:38:11) khem: sane was there due to insanity
(21:38:21) Tartarus: Tangent?
(21:38:24) RP__: As ideally we get to fix things this time around
(21:38:32) koen: RP__: because lot of the sane-<foo> stuff in OE is too limited to use
(21:38:39) RP__: Tartarus: not really, we're trying to make sure we don't repeat history
(21:38:47) koen: e.g. sane-toolchain needs to be duplicated for simple changes
(21:38:58) RP__: koen: ok, see my comments about soft defaults
(21:39:06) khem: with well maintained oe-coe sane stuff wont be needed
(21:39:07) RP__: I think we can fix this so everyone is happy
(21:39:17) Tartarus: RP__, I hope we can
(21:39:29) koen: I would like to avoid any implications that the distro conf in oe-core should be reused
(21:39:45) khem: yeah call it sample.distro
(21:39:45) RP__: If things don't work, I just *need* please to tell me clearly what the problem is, not get mad at me :)
(21:39:48) Tartarus: koen, so you want distros to be written from whole cloth?
(21:39:48) fray: what I want are sane defaults, sane configurations for testing and building off of..
(21:40:02) fray: "sample", "sane" etc are all fine with me.. content (and documentation) is what matters to me..
(21:40:07) RP__: koen: I would like it to be something you use though
(21:40:18) fray: ...and the stated policy that we believe these should be included as a basis for others to use (and override parts of)
(21:41:07) RP__: koen: This is making the assumption oecore is broken before we start?
(21:41:18) fray: we are also talking about oe-core and meta-oe..  I expect them to have different defaults
(21:42:17) koen: RP__: I'm speaking from experience with oe .dev
(21:42:44) Tartarus: Right
(21:42:45) RP__: koen: We're going to make oecore better than that and I'd appreciate not basing things on preconceptions from there ;-)
(21:42:53) Tartarus: So, isn't the pull model supposed to help with that?
(21:43:06) RP__: koen: No if the shareddistro thing doesn't work, I'd like to know about it and find a way to make it work
(21:43:11) fray: I expect oe-core to "work" at all times..
(21:43:22) Tartarus: The push model problem is $someone does $something to break what you care about due to not testing / thinking about your use case
(21:43:36) fray: (and well, also be useful, even if a user ends up overriding every configuration and recipe in it for some reason)
(21:43:37) RP__: *If* i/we fail at that feel free to create your own config again but I'd like a chance at it being shared
(21:43:40) Tartarus: But with the pull model the pullers are supposed to be thoughtful enough to see potential conflicts and problems
(21:43:59) Tartarus: And resolve, not break people
(21:44:00) khem: fray: yes
(21:44:28) RP__: I'm letting us spend time on this btw as I think its important
(21:44:29) koen: RP__: I'm OK with a validation distro config in there, but I DO NOT like to be forced to use it
(21:44:43) RP__: koen: You're not being forced. I'm just asking you give it a try
(21:44:57) Tartarus: koen, I think we're all asking you to try it :)
(21:45:08) RP__: koen: and it its not working, you at least tell me why first before claiming its broken and leaving it
(21:45:08) fray: I believe the purpose should be that everyone can use it.. our policy is to suggest it for everyone as a starting point..
(21:45:10) Tartarus: There's bugfixes in both areas it'd be great to not have to duplicate
(21:45:16) fray: but that doesn't mean everyone will (or has to) use it
(21:45:27) khem: koen: you will have distro conf in distro overlays
(21:46:21) koen: just airing my frustation with .dev over the years
(21:46:28) RP__: koen: This isn't OE.dev
(21:46:56) fray: koen, I hope you (and others) will complain loudly if we're going back to things that didn't work in the past...
(21:47:12) fray: but I also think it's worth trying this as it should make it easier for others to use the oe-core..
(21:47:12) RP__: koen: I know there have been problems, I am promising to try and ensure we fix those problems
(21:47:49) khem: koen: what issues do you expect could happen and we should be careful about
(21:48:05) koen: what about this: we make a sample distro with nicely seperated configs (e.g. toolchain, versions, policies) and I'll have a look if it's usefull for angstrom
(21:48:38) Tartarus: koen, and you'll provide feedback and give us a few attempts, yes?
(21:48:48) fray: the three places I think we need to look for usefulness in a sample (default) is meta-oe (OE), Angstrom and Yocto
(21:48:49) koen: I can give feedback
(21:49:02) khem: koen: sample distro will be a layer ?
(21:49:03) koen: but the other angstrom devs aren't in an OE friendly mood
(21:49:31) RP__: koen: We're trying to fix this though, right?
(21:49:46) koen: yes, we are
(21:49:51) koen: can't say for other people
(21:50:05) RP__: koen: Think about the message this sends out too. "OE-core isn't good enough for angstrom"
(21:50:14) koen: OE core
(21:50:20) koen: just the distro in it isn't
(21:50:23) koen: and angstrom is a distro
(21:50:36) koen: what's the value in angstrom if it's a copy of sampledistro?
khem koen 
(21:50:51) RP__: koen: I did not say it had to be a copy above
(21:51:02) fray: value of anything using oe-core to me is policy decisions, implementation differences, etc..
(21:51:02) RP__: koen: I said to take the defaults from there and then customise as needed
(21:51:14) koen: 22:47 <+koen> what about this: we make a sample distro with nicely seperated configs (e.g. toolchain, versions, policies) and I'll have a look if it's usefull for angstrom
(21:51:40) koen: we've proven in the past that OE trying to force angstrom to do something is a very bad idea
(21:51:56) fray: "My" distro isn't going to agree on all of the software, patches, policy, etc of oe-core.. but I hope that I can re-use 70, 80, 90+% of whats there..
(21:52:00) koen: and right now I feel like I'm being forced
(21:52:04) Tartarus: policy, hardware support and additional validation are what i see as any real distros benefits
(21:52:24) RP__: ok, lets create a sample in the core and Angstrom can do whatever it  likes
(21:52:30) khem: koen: angstrom will use the recipes and metadata from oe-core and have its own policies
(21:52:55) koen: I feel the same as fray
(21:53:00) khem: and more meta data thats angstrom's value add as I understand
(21:53:26) RP__: koen: No, you're starting from the position of "I'm going to do all the distro config myself"
(21:53:42) RP__: Anyhow, I hope this will change if we show a good example
(21:53:49) koen: I start from the position "I have something working already and need a good reason to rip it apart"
(21:54:07) RP__: Yocto works for me today
(21:54:16) RP__: remind me why I'm doing this?
(21:54:27) RP__: ;-)
(21:54:31) RP__: ok, 6
(21:54:32) khem: RP__: what restriction would oe-core impose that could be bad for angstrom
(21:54:51) RP__: lets move on...
(21:54:54) RP__: timelines
(21:54:55) Tartarus: RP__, so, what is yoctos plan in this regard?
(21:55:02) RP__: Tartarus: with what?
(21:55:04) fray: khem, one I could see..  maybe a distro needs SE Linux support (and patches that go along).. oe-core might decide it's not appropriate..
(21:55:07) Tartarus: Will yocto become a (set of ) layer(s) on oe-core?
(21:55:19) fray: Tartarus thats what I feel is going to happen right now
(21:55:20) Tartarus: Will we need to re-sync often?
(21:55:28) RP__: Tartarus: the poky repo becomes an automated integration layer of several repos
(21:55:50) fray: The resync question is something we need to continuet to monitor or things are going to go stale..
(21:55:50) koen: 06): quarterly?
(21:56:00) Tartarus: RP__, so 'core' related bits will be sent our way and such
(21:56:10) Tartarus: Yes, I think OE needs to continue on the quarterly release cycle
(21:56:15) RP__: Tartarus: Specifically bitbake, oe-core, docs, glue and a hopefully a minimal yocto layer
(21:56:19) Tartarus: 2011.03 is on track for early march, it feels like
(21:56:28) RP__: Tartarus: Not sent our way, they come there first
(21:56:39) Tartarus: RP__, that's what I meant, sorry, yes, good.
(21:56:58) fray: I think OE and Yocto release schedules don't change until we can demonstrate to the OE community (and board) what we are proposing is viable and reasonable..
(21:57:00) Tartarus: folks will be sent our way and changes will just be sent here first
(21:57:18) fray: we need to make the decision when we believe it "is"..  but until then nothing changes on release cycles..
(21:57:23) Tartarus: So, on timelines
(21:57:27) RP__: Tartarus: yes, people will be posting patches against the oecore repo
(21:57:32) Tartarus: 2011.03 is on track, so next up would be... 2011.07 ?
(21:57:42) Tartarus: Can we aim for 2011.07 to be oe-core + meta-oe based
(21:57:52) RP__: That would be nice and realistic
(21:57:58) Tartarus: And have some defined set of builds, given possibly additional layers?
(21:58:05) RP__: likewise the yocto release after 1.0
(21:58:29) RP__: Tartarus: That is something we need to figure out as part of the layers discussion
(21:58:41) Tartarus: OK
(21:58:50) khem: and oe-core will be release agnostic ?
(21:58:54) koen: I think layer maintainers can submit a test matrix to the release notes
(21:58:56) fray: I think we should aim for 2011.07 to be oe-core + meta-oe based..  that should be more then enough time to prove out what we're saying
(21:58:59) Tartarus: Well, for 06, lets agree on 2011.07 and oe-core + meta-oe and set the rest as the agenda items come up?
(21:59:06) Tartarus: and definiton happens as work happens
(21:59:12) koen: e.g. "meta angstrom works for machines foo, bar, baz and image 1 2 and 3"
(21:59:12) fray: Tartarus sounds good to me
(21:59:17) Tartarus: ie the validation targets that are valid in oe-core
(21:59:53) RP__: ok, how are people doing for time
(22:00:11) RP__: With is being a US holiday this week I'm actually ok for time as all my meetings got cancelled tonight
(22:00:19) fray: khem, I expect oe-core to be as agnostic as it can be.. but since it's the "oe-core".. I expect if we have to, things "oe" specific may have to be included..
(22:00:23) RP__: but I appreciate some people may need to leave now?
(22:00:51) fray: khem, but the default being any distro/release specific components belong in the release's layer(s)
(22:01:04) fray: I am open as well due to the holiday..
(22:01:07) Tartarus: Lets see if we can't knock out a few more items
(22:01:35) fray: BTW to me it looks like we've slipped into the 07) item already
(22:01:38) khem: I might have to drop off soon
(22:01:57) fray: khem, ok -- let us know if/when you do..
(22:02:13) RP__: ok, anything further on 07
(22:02:15) RP__: ?
(22:02:20) RP__: definition of OE core
(22:02:26) koen: I think 07) can be assembled from 1-6 :)
(22:02:37) koen: 08 as well
(22:02:45) RP__: and 08 - what are we going to guarantee/test?
(22:02:58) fray: yes..  I think the action from 07/08 is simply we need to document a decision (based on the previous discussions)
(22:03:01) koen: qemu and validation.conf?
(22:03:04) Tartarus: So for 08
(22:03:05) Tartarus: qemu*
(22:03:12) Tartarus: And we'll need to figure out the images
(22:03:18) Tartarus: But that takes actually getting down to work
(22:03:22) Tartarus: And also meta-toolchain
(22:03:24) koen: fray had a nice list
(22:03:26) RP__: Yocto will test its defined machine targets being as close to any shared distro as it can
(22:03:33) koen: we can discuss the list over email
(22:03:49) Tartarus: Then other stuff is for meta-oe, in terms of machines and images
(22:03:52) Tartarus: Also, yes, email
(22:04:03) fray: ya, I see a need for two image types -- a small (busybox only) set & a full oe-core set to verify all of the components "pass" valiation.. (validation to be defined)
(22:04:11) fray: yup
(22:04:11) RP__: So a better question, what do we need to discuss which would be better here than email?
(22:04:29) koen: for 08) IMO nothing
(22:04:33) Tartarus: I think #10 we need to start on email
(22:05:11) koen: the pull model would cover 11) as well
(22:05:11) RP__: old versions is a bit of a nightmare
(22:05:19) Tartarus: And either koen or fray or myself (RP's already got one action item todo) should start the draft since we've all got various HW dealings going on and such
(22:05:28) fray: to me "old versions" is a non-core statement..
(22:05:32) khem: we need a minimal image/busybox and may be a full console image and one graphical image
(22:05:43) khem: may be qt or bare x11
(22:05:44) fray: thats up to the "distribution", layers, etc to decide that is the policy..
(22:05:51) koen: AR to koen: start BSP draft with fray and Tartarus
(22:05:52) fray: for the meta-oe -- if thats the policy then it should be clear..
(22:06:01) fray: but I don't think non-deleting is in the best interesting of oe-core
(22:06:02) RP__: Its a question of what happens to "old" versions leaving the oecore
(22:06:16) Tartarus: RP__, fray, right, that's the sticking point
(22:06:20) fray: RP__, I would move them to the meta-oe myself  (if there is interest in them -- default assuming there is)
(22:06:22) RP__: I'd like to see tools that catch this and migrate things into meta-oe
(22:06:22) Tartarus: When is old old enough to go away?
(22:06:34) Tartarus: or migrate or whatever
(22:06:51) RP__: i.e. the core keeps moving forwards but meta-oe or other layers catch anything they still want
(22:07:02) fray: based on existing usage, I think it's going to be difficult to get feedback from members when something is old enough to go away -- short of removing it and getting yelled at.. :(
(22:07:10) fray: RP__ ya..
(22:07:23) fray: I see oe-core having 2 MAYBE 3 versions.. but no more..
(22:07:23) RP__: and there are people who have custom layers that you never have  a hope of seeing
(22:07:26) koen: maybe a graveyard layer would help
(22:07:36) fray: goal 1 version -- current stable "supportable" version..
(22:07:49) fray: could end up with 2..  current + "GPLv2" if that becomes a goal
(22:08:01) fray: and 3 if current + "GPLv2" + unstable?
(22:08:01) Tartarus: fray, to me, so long as upstream hasn't kill the line, we should keep it going in core, so long as upstream has clear policies
(22:08:02) RP__: fray: I think this has to be the way forward for oecore but I understand the need tor the fallthrough
(22:08:07) khem: yeah 1 latest stable 1 gplv2
(22:08:08) koen: fray: depends on what your are talking about, one version of bash is enough, but for gcc and binutils you might need one version per arch :(
(22:08:46) RP__: Tartarus: keep what going in core?
(22:08:57) Tartarus: RP__, "old" versions
(22:08:59) fray: I think we need to decide on this policy.. they all have merit.. but I'm just not sure what's right..
(22:09:12) RP__: Tartarus: We're tried this, its painful, too painful :(
(22:09:23) koen: I think we all agree ont he principle and need to work out edge cases
(22:09:23) Tartarus: OK, so lets table this to email
(22:09:34) fray: koen, ya
(22:09:44) Tartarus: AR to Tartarus, start email thread on what retention policy for old versions we want a s a rule of thumb
(22:09:48) koen: Tartarus: you do know that "table" means the opposite in UK english, right? :)
(22:10:30) koen: 12) looks covered as well
(22:10:43) khem: i have to leave guys ttyl
(22:10:50) RP__: ok, ttfn khem, thanks
(22:10:51) koen: khem: thanks for joining
(22:11:07) khem left the room.
(22:11:12) RP__: ok, I think we need to take this to email and start some serious discussions there
(22:11:23) fray: sounds good to me
(22:11:27) RP__: these meetings are good but we need to cut through the background and get to the point more in the meetings
(22:11:28) koen: 15) looks covered as well
(22:11:39) koen: 16) too
(22:11:41) fray: my emails to the OE-TSC list seem to have a few hour delay.. but it could have been a one-time instance..
(22:11:47) RP__: I think we've touched on things a lot but not entirely covered
(22:12:21) koen: RP__: do you think jefro has some time tomorrow to help out with the minutes and agenda?
(22:12:59) RP__: koen: I think he will, yes
(22:13:17) RP__: We'll start doing the meetings better for the next one :)
(22:13:36) koen: I think this one was slightly better as the last one already
(22:14:13) fray: ya, I think we're doing better.. we should be able to meet under and hour if we keep this up
(22:16:05) RP__: :)
(22:16:11) RP__: we'll get there, there is just a backlog
(22:16:18) RP__: ok, lets close the meeting
(22:16:23) fray: ageed






