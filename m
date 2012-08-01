Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1SwhQc-0005Zr-UT; Thu, 02 Aug 2012 00:30:07 +0200
Received: by yenl13 with SMTP id l13so7161958yen.6
	for <multiple recipients>; Wed, 01 Aug 2012 15:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=NwjyQrOSuKRGYELudqqgxN+hqJ1PRyHFlSzZeoQrzFE=;
	b=RYz5QX+P9XK+cUxDZ/wbv7D4nkiaO9qqzOJ8OBV2CPYe/49AXlj2PxFNgrHLq6WVDr
	bbK5tglJTy2k7C2hOO9tT0GeP9xr7GSS2QWL6un+rshaUqiZNZR2yaxVjHRhTZxXA45N
	PkZwBt2KYZqMUKHLpBNUT61YNc5843OSdmOzVW7qIu80TrVifqxg6/6ymQzc2E8/joiB
	cbLHgzuM2BO1faA0uFGkLOahSqhjZSAZLi5PHfdeI0v0jTv9Nww7OuPZxdH6n6gWfCo9
	bJ9w9mh0Oqoj1h8vc0L0FERmHw4/4fxBf2vfNSTvznDOXebEWEtKxi8/aWq5Fzdwr/Ww
	hoxg==
MIME-Version: 1.0
Received: by 10.42.18.8 with SMTP id v8mr599142ica.34.1343859506837; Wed, 01
	Aug 2012 15:18:26 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.64.102.4 with HTTP; Wed, 1 Aug 2012 15:18:26 -0700 (PDT)
Date: Wed, 1 Aug 2012 15:18:26 -0700
X-Google-Sender-Auth: MjOm3EhnjTP6eoVEG3h-8dj2zBk
Message-ID: <CA+YB3rbdcfSNi4es51A0nXAK55rbPsbe3-dpVCjiJz4_q0AjaQ@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Minutes: OE-TSC 31 July 2012
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
X-List-Received-Date: Wed, 01 Aug 2012 22:30:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
31 July 2012

Attendees: Mark, Koen, Richard, Paul
Apologies: Khem

________________________________________________________________
Agenda & Results

1. pick a chair - bluelightning

2. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"
 -> continue
 b. discuss communication with OE community about release-oriented phases
 -> continue
 c. pre/post install scripting (fray)
 => ask mailing list for proposals - continue

3. new issues
 a. oe-made-easy script in getting started instructions - fixed

 b. systemd
 => discuss on mailing list (all)
 => bluelightning to send out current status to list
 => bluelightning to create enhancement bug in Yocto bugzilla to implement
gitpkgv functionality in fetcher (done, bug 2872)

 c. PR bumps
 => koen to investigate server & report back
 => bluelightning to test on autobuilder infrastructure
 => bluelightning to document setup steps on wiki

 d. package.bbclass whitespace
 tabs resulting in warnings, seems better in general
 some fallout, some positive comments

 e. meta-networking
 => continue discussion on mailing list

 lengthy discussion of patches against various layers, proper handling

4. status

 a. Should we still support separation of / and /usr?

 b.  khem to file enhancement request for python devshell  (done)

 c. oe-core release
      there will be discussion on the list about release process

  d. infrastructure
      mailing list issue (koen) - board is coping with it, keep on agenda

  ________________________________________________________________
Raw Transcript

[16:57] <bluelightning> hi folks
[16:58] <koen> hey bluelightning
[16:58] --> RP__ has joined this channel (~richard@dan.rpsys.net).
[16:59] <fray> hey
[16:59] <fray> with vacation and travel, it feels like we just had a
meeting.. :P
[16:59] <bluelightning> heh
[17:00] * RP__ is wiped out today :/
[17:01] <fray> I think I've had 3 work days since the last meeting.. :P
[17:01] <koen> "Didn't we have a meeting last week?"
[17:01] * RP__ hopes nobody is expecting him to make any sense
[17:01] <fray> RP__, it's ok to sit in the corner and drool for a bit.. :)
[17:01] <RP__> two weeks ago. We agreed on the python whitespace change and
I've spent since then dealing with it
[17:02] <RP__> or so it feels like! ;-)
[17:04] <Jefro> hi all - sorry, I am here but on phone - please carry on
[17:04] <koen> any new things on the agenda or just the same?
[17:04] <Jefro> 7/17 schedule is here http://piratepad.net/QVuGPkIJZr
[17:04] <fray> I don't have anything new
[17:04] <koen> RP__: I finally have a build finished, so I can try turning
on the auto PR stuff
[17:04] <Jefro> one thing is that I still need to get notes up :/
[17:05] <RP__> koen: I'll make sure work on any issues gets prioritised...
[17:06] <RP__> ok, who is chairing
[17:06] <RP__> and has anyone heard from Khem?
[17:06] <bluelightning> I can do it, haven't done it for a while
[17:06] <fray> khem -- not this morning..
[17:06] <bluelightning> re khem, no...
[17:07] <RP__> bluelightning: go for it
[17:07] <bluelightning> ok, so 1 is done
[17:07] <RP__> I pinged khem
[17:07] <bluelightning> 2a:  raise awareness of "janitor" list, QA "bugs"
[17:08] <fray> still to be done... :(
[17:08] <RP__> ongoing
[17:08] <bluelightning> presumably same applies to 2b/c ?
[17:09] <fray> yes
[17:09] <bluelightning> ok, let's move on to 3a then
[17:09] <bluelightning> oe-made-easy script in getting started instructions
[17:09] <fray> last week we reached a decision on that.. did anyone have
the time to change hte wiki?
[17:09] <bluelightning> I think I've resolved this to my own satisfaction
[17:09] <bluelightning> yep
[17:09] <bluelightning>
http://www.openembedded.org/wiki/OpenEmbedded-Core#Getting_Started
[17:10] <bluelightning> should be more useful all around as well
[17:10] <RP__> bluelightning: looks much better, thanks!
[17:10] <fray> works for me
[17:11] <bluelightning> ok, so if there's nothing further... 3b: systemd
[17:11] <RP__> I hear progress is being made there?
[17:12] <bluelightning> well, the split happened prior to last meeting and
there hasn't been a huge amount of fall-out AFAIK, but koen can possibly
elaborate
[17:13] <bluelightning> AR for me from last time was to post an
announcement which I did not get around to though
[17:15] <RP__> bluelightning: I guess you've a reminder now :)
[17:15] <bluelightning> yes
[17:15] <bluelightning> as for remaining issues blocking moving towards the
core, there is at least gitpkgv and switching to making it a distro config
option
[17:16] <bluelightning> khem has moved libcgroup to oe-core, that's a minor
step forward
[17:16] <fray> ohh I hadn't seen that..
[17:16] <bluelightning> is there already a bug open for replicating the
gitpkgv functionality in the fetcher?
[17:17] <bluelightning> that's what will need to be done...
[17:17] <bluelightning> doesn't look like it
[17:18] <RP__> There was a kind of previous attempt. It shouldn't be hard
[17:18] <bluelightning> I wouldn't have thought so, no
[17:18] <bluelightning> ok well, AR to me to create an enhancement bug for
that
[17:19] <bluelightning> any further comments on systemd? koen, you've been
rather quiet today...
[17:20] <bluelightning> if not, let's move onto 3c: PR bumps
[17:21] <bluelightning> koen has indicated he's ready to test it
[17:21] <RP__> I think koen commented on that above, he's about to test
[17:21] <bluelightning> right
[17:21] <RP__> which is great, I look forward to the result and we will
work through any issues
[17:21] <bluelightning> I haven't talked to michael/beth about running
tests on the yocto AB infrastructure but it sounds like they have their
hands full atm
[17:23] <RP__> bluelightning: right now would be a bad time
[17:24] <fray> is there any light coming up, or does it look pretty frantic
for a while..
[17:24] <bluelightning> RP__: ok, I guess I should just make sure we have
enough docs so that they know what to do when the time comes
[17:24] <fray> I know we had talked before about sometime in august
switching, but I'm still worried we don't know enough
[17:24] <RP__> fray: I keep thinking there is light coming up :/
[17:24] <koen> can I add a 'meta-networking' item to the agenda?
[17:24] <bluelightning> koen: sure
[17:24] <koen> great
[17:25] <bluelightning> ok, well I think we're done with 3c
[17:25] <bluelightning> on to 3d: package.bbclass whitespace
[17:25] <bluelightning> presumably this is now sorted?
[17:25] <fray> I've seen some fallout on that, but in generate is seems
much better
[17:26] <bluelightning> yeah, we expected some
[17:26] <bluelightning> I don't have a handle on how much grief we caused
for other layers
[17:26] <fray> I don't think it was bad
[17:27] <fray> I figure in a few weeks as more layers roll forward, we
might get some more stuff..
[17:27] <RP__> It resulted in warnings, not errors so it shouldn't have
been too bad
[17:27] <bluelightning> it sounds like the fallout was less than expected
[17:27] <fray> the biggest thing I heard about was 3 vs 4 character
whitespace in things like package.bbclass..
[17:27] <fray> bluelightning certainly less then I expected
[17:28] <koen> I had to remove a few layers (meta-java, meta-opie) to get
things going again
[17:28] <bluelightning> koen: hmm, I was not aware that meta-opie was broken
[17:28] <bluelightning> probably because I haven't tested it since...
[17:28] <koen> bluelightning: could be an interaction issue
[17:28] <bluelightning> will look into that later
[17:28] <koen> it breaks parsing, so easy to find out :)
[17:29] <bluelightning> koen: is henning aware of the meta-java issue?
[17:29] <koen> people sent patches for it
[17:29] <koen> so I assume he is
[17:29] <bluelightning> ok, so presumably that's being handled then
[17:30] <bluelightning> any further comments?
[17:30] <RP__> FWIW I did get some positive feedback on the whitespace
change too (as in they were pleased we were fixing what can be a nasty
issue)
[17:30] <bluelightning> great :) a rare thing it seems
[17:31] <fray> RP__ that is what I got by a few people as well
[17:31] <RP__> It is nice to hear someone liking a change rather than
complaining the build broke
[17:31] <RP__> :)
[17:31] <bluelightning> :)
[17:32] <bluelightning> ok then, let's move onto 3e: meta-networking
[17:32] <fray> I think the folks who worked with the whitespace will be
happier... and those that don't probably didn't notice
[17:32] <bluelightning> koen: fire away...
[17:33] <koen> I still don't get what Joe is going on about "subtrees" and
"modules"
[17:33] <koen> I don't get a good feeling about it
[17:33] <fray> there are lots of classes of "networking"
[17:33] <RP__> I actually wondered about proposing using combo layer here
[17:33] <fray> everything from network services, to device setup, to
routing, etc..
[17:33] <koen> it looks like windriver is wanting to do their own layer and
not care about others
[17:34] <RP__> so joe maintains the layer in a git repo but that is
flattened and committed to meta-oe effectively automagically
[17:34] <bluelightning> koen: I don't think that's it at all
[17:34] <koen> which is fine, but it seems it's turning into some
half-assed arrangement now
[17:34] <koen> RP__: see, that scares me
[17:34] <RP__> koen: I would like to steer clear of submodules too fwiw and
I understand about not wanting to split up meta-oe more
[17:34] <fray> arranging the files and capabilities is needed.. dumping
them all into one big bucket isn't going to work (from a maintenance
standpoint)
[17:34] <RP__> koen: I can also see why he wants something he can clone and
use separate to meta-oe
[17:35] <koen> RP__: seperate in what way?
[17:35] <koen> RP__: no other files in the git clone?
[17:35] <RP__> koen: as a separate repository without the rest of meta-oe
[17:35] <RP__> koen: yes
[17:35] <fray> (speaking as a commercial provider for a second).. meta-oe
is a good repository of recipes for us.. but we're never going to ship
meta-oe..  we need pieces of it, but not all of it..
[17:35] <fray> simple reason, it's got too much stuff that we're simply not
willing to validate or support
[17:35] <koen> fray: which is fine
[17:36] <RP__> I will say the combo layer tooling is great and I'm using it
quite nicely
[17:36] <RP__> and it could handle this with ease, its a 1:1 mapping no
problem
[17:36] <fray> networking is something that is wanted, and we don't want to
deviate from an open source layer if possible..  (we deviate, we have more
to support)
[17:36] <koen> but when doing the actual work, you should be working on an
abstracted thing
[17:36] <koen> should *not*
[17:36] <bluelightning> one option would be to use something like
combo-layer to make the separate layer if that's what Joe would prefer; but
the layer in meta-openembedded would need to be the "master"
[17:36] <bluelightning> for community preference
[17:36] <RP__> koen: "abstracted" in what way?
[17:37] <fray> concern with any type of "combined" git repository is having
to cherry pick and manage the patches
[17:37] <koen> RP__: combo-layer/subtree/whatever
[17:37] <RP__> bluelightning: I think either can be the master, its kind of
irrelevant semantics as long as they're in sync
[17:37] <RP__> koen: meta-networking is meant to work standalone regardless
of whether its part of meta-oe, right?
[17:37] <koen> "as long as they're in sync" <- wishfull thinking
[17:37] <fray> RP__ that would be my hope
[17:37] <bluelightning> RP__: can be, sure, but you know how it's easier
for us to put stuff into bitbake / OE-Core than to try to accept patches at
both ends, the same would apply here I would think
[17:38] <RP__> koen: I will personally go and bang heads together if
they're not
[17:38] <RP__> koen: same as applied to poky = bitbake + meta-yocto +
oe-core
[17:38] <koen> RP__: that's nice, but still isn't instilling confidence
[17:38] <RP__> and yes, there is a meta-yocto now
[17:39] <RP__> bluelightning: well, presumably patches would be applied by
the maintainer to one tree and synced to the other. If there are a group of
maintainers they need to figure out the process
[17:39] <RP__> Think of the big picture here for a second
[17:39] <fray> RP__, yup select maintainers -- let them figure out the
process that works best for them
[17:40] <RP__> Monolithic layers cause immense problems with maintainership
[17:40] <bluelightning> sure
[17:40] <bluelightning> I think being a community layer there's little
chance of it remaining as only the list of recipes that WR is interested in
supporting; and Joe already acknowledges that
[17:40] <RP__> I would much prefer a larger set of well maintained layers
with specific purposes that forcing everything into one repo over
cloning/usability issues
[17:40] <bluelightning> which means there has to be some kind of separate
thing even if it's only internal to WR
[17:40] <RP__> I do get the usability concern and its why we have
combo-layer in the first place
[17:40] <koen> bluelightning: but the plan is still to make that repo a
second class citizen
[17:41] <koen> bluelightning: which is a recipe for disaster (pun not
intended)
[17:41] * bluelightning goes to check the thread
[17:41] <RP__> koen: There is no second class citizen
[17:41] <RP__> koen: is poky a second class citizen to oe-core or vice
versa, no
[17:41] <fray> (again not speaking on behalf of the oe-tsc for a second)
WR's policy is that we pull layers from open source.. if there are items in
it we don't want, can't support then we blacklist them.. we don't want to
have to cherry pick and create a "variant" of the layer
[17:41] <RP__> koen: they just have different use cases
[17:42] <RP__> sure we've had some issues getting poky/oe-core tamed but
there is 8 years of history there
[17:42] <fray> And I fully expect meta-networking to have items that WR (or
anyone else) may not want.. but vastly fewer of those items then meta-oe as
a whole
[17:42] <koen> RP__: since you mention it...
[17:42] <RP__> this shouldn't be hard by comparision
[17:42] <koen> RP__: I still see poky based pull requests on oe-core
[17:42] <bluelightning> koen: Joe states explicitly "there will never be
commits to it that don't come from commits to the meta-networking layer of
meta-openembedded"
[17:42] <koen> RP__: and people not getting the problem with that when
being told that
[17:42] <RP__> koen: As I've said, I don't actually care, I apply the patch
emails
[17:42] <bluelightning> koen: surely that's what you're after?
[17:43] <RP__> koen: People can contribute against what they're comfortable
with. I have scripts that move patches from a poky tree to OE-Core and vice
verse
[17:43] <koen> bluelightning: it sounds like it, but the other part of the
email isn't clear to me
[17:43] <koen> RP__: there shouldn't be poky based stuff on the oe-core list
[17:43] <RP__> koen: I'll just tell people to stop posting git trees
[17:44] <RP__> koen: It'll hurt me and Saul but who cares
[17:44] <bluelightning> koen: feel free to reply asking for clarification,
Joe's happy to discuss anything I think
[17:44] <fray> koen, I'm not sure i agree.. primary discussion of poky
(angstrom, or anything else) doesn't belong on oe-core.. but if it's
relevant to the oe-core direction (and that includes patches) I don't see a
problem, unless it gets disruptive
[17:44] <koen> RP__: people sending poky based patches is just as bad
[17:45] <RP__> koen: even thought they apply cleanly to OE-Core?
[17:45] <RP__> koen: I agree on the ones that touch meta-yocto and people
do get shouted at when they do that
[17:45] <koen> RP__: last time I tried they didn't
[17:45] <RP__> koen: I'd like examples please as they should and there
would be a good reason if they didn't
[17:46] <RP__> if there is a true problem there I want to understand it but
I don't understand how that can happen right now
[17:46] <RP__> With meta-networking, I suggest we ask Joe for a specific
clearly spelt out plan for it and mention the combo-layer tool
[17:47] <RP__> I think if there is a clear understanding of 100% sync, its
worth trying. The TSC can reserve the right to change that if it doesn't
work out
[17:47] <fray> (and for the record, I'm not involved w/ the meta-networking
stuff)
[17:47] <RP__> I do think we need to at least try and experiment with some
of these things
[17:47] <RP__> and also acknowledge there could be some bumps but we can
likely work through those
[17:48] <RP__> I think if we get this right, OE can grow as a project
[17:48] <fray> I agree
[17:48] <RP__> If we get this wrong, it could hurt us badly
[17:48] <bluelightning> what I think we ought not to lose sight of as well,
is that what we're gaining is additional maintained networking recipes that
we did not have before
[17:48] <RP__> by wrong I mean choose not to experiment and stagnate
[17:48] <koen> bluelightning: that's irrelevant if it breaks the complete
stack every other week
[17:48] <bluelightning> so this is not just an exercise in rearrangement,
OE stands to benefit quite a lot
[17:48] <bluelightning> koen: that's a straw man...
[17:49] <RP__> koen: If it is breaking things every week we need to
understand why and agree a way to fix that
[17:49] <RP__> koen: The TSC is here to deal with that an empowered to do so
[17:49] <fray> if/when it starts to break, the TSC needs to step in and
figure out why, and how to stop that... but until then, I don't see it as
an issue
[17:49] <koen> RP__: I'd like to try to prevent breakage :)
[17:50] <koen> then again, it's not like I have been able to do a build the
past 2 weeks
[17:50] <RP__> It has been a bad spot for various reasons. I'm hoping
things will calm down a bit now
[17:50] <RP__> and those reasons are unrelated to the maintenance of a
layer like this
[17:51] <bluelightning> koen: if you have remaining issues please report
them, don't wait two weeks...
[17:51] <koen> bluelightning: I had a deadline for a release today, so my
focus was on the denzil based stuff
[17:51] <bluelightning> koen: same applies...
[17:51] <bluelightning> if anything broken denzil is even more serious than
broken master, if that's what has occurred
[17:52] <koen> the denzil stuff works fine
[17:52] <bluelightning> right, presumably you are referring to master
breakage only
[17:53] <bluelightning> ok, so we have discussed a few things... let's move
onto the next topic
[17:53] <RP__> Part of this is about being attractive to new maintainers too
[17:53] <RP__> We need to let maintainers have some freedom in layers
whilst addressing the various constraints we need to operate in
[17:54] <RP__> I'm worried the hoops Joe is having to jump through will put
off other potential maintainers :(
[17:54] <koen> RP__: you're confusing 2 things
[17:54] <RP__> That isn't to say we shouldn't have a discussion but we do
also need to draw the line somewhere and make a decision
[17:54] <koen> Joe is jumping through hoops because his original proposal
broke a few layers in meta-openembedded badly
[17:55] <RP__> koen: Well, there are multiple angles to the discussion
[17:55] <koen> then the proposal was to put meta-networking in the
meta-openembedded repo and still break the other layers badly
[17:55] <RP__> koen: The break other layers badly piece is resolved now
though?
[17:55] <koen> I think we're at a point now were things don't break badly,
but Joe wants to do fancy subtree stuff that is destined to go wrong
[17:56] <RP__> My view is that if we do that, we should use combo layer to
manage things
[17:56] <RP__> not submodules or repo etc.
[17:57] <RP__> part of the reasoning is what we can adjust the tooling to
do what we need it to do if necessary
[17:57] <RP__> We're running out of time, I need to leave shortly
[17:58] <bluelightning> right
[17:59] <bluelightning> I don't think the remaining items need further
discussion this week
[17:59] <bluelightning> mostly ongoing
[17:59] <fray> I'm happy w/ that
[17:59] <bluelightning> any objections to closing the meeting there?
[18:00] <bluelightning> ok, I guess that's all for this meeting, folks
[18:00] <RP__> no, I'm assuming this goes back to the mailing list
[18:00] <bluelightning> right
[18:01] <fray> yup
[18:01] <bluelightning> we need to continue to help people towards a
solution

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

