Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1RuYP2-0000Jb-Nh; Tue, 07 Feb 2012 00:55:21 +0100
Received: by iaby12 with SMTP id y12so9865817iab.6
	for <multiple recipients>; Mon, 06 Feb 2012 15:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=1dUw4/PdIY70y/ruIZbIDw+IkBTFLsHTYXu1omSlLRo=;
	b=K3UajKgqtCIAeIj5HL5gc7LgWkruk/Gps3QgRNvCqdpP2D4/zxHnI1freJYMCTxMCQ
	450p66DG+/C0GCOMrg6MfAG/mNkvaVkywycI1CXxFrbs+0b5o5WPen3zGhb7C5KUNoRg
	2lV4shWlFsAP1Q2KR+BJ0Bl5CEs1eN/9GCW0k=
MIME-Version: 1.0
Received: by 10.42.146.202 with SMTP id k10mr19337938icv.13.1328572038127;
	Mon, 06 Feb 2012 15:47:18 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.50.209.9 with HTTP; Mon, 6 Feb 2012 15:47:18 -0800 (PST)
Date: Mon, 6 Feb 2012 15:47:18 -0800
X-Google-Sender-Auth: O6wpaKZukGDflYfg7CtW62I9Aeg
Message-ID: <CA+YB3rZD5QS=aVtAiA_Jiqqfu4Pg3G6ojF=o2iYN4b1r3ZOXvw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OE TSC Minutes: 30 January 2012
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
X-List-Received-Date: Mon, 06 Feb 2012 23:55:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
30 January, 2012

Attending: Khem, Richard, Mark, Tom, Paul
Minutes: Jefro

1. pick a chair
Paul

2. new issues
   a. meta-oe organisation discussion
      too wide in scope, images that work with oe-core break with meta-oe
      discussion ongoing on mailing list
      Paul to ping Koen for feedback

   b. elections
      fray is next, RP will tickle board -> done

   c. distro features
      all to reply to paul's email
=>    Paul to file bug to implement distro features backfill
=>    Paul to file bug to implement psplash issue already discussed

   d. gitpkgv.bbclass merge
      good functionality, needs some work to be accepted

   e. meta-ti working with oe-core
      positive discussion on meta-ti list

3. TSC meetup at ELC
   jefro to set up breakfast Thurs morning 8am -> done
   NOTE: if members can't get there on time, can arrange a later session
=> bring thoughts to ELC for retrospective

4. Status report on oe-core
     better sstate reuse reported by Koen and others
=>   communicate to oe-core list in late Feb, agendize

5. Infrastructure
     melo has retired
     patchwork issues - less value for bitbake & oe-core

6. Action Review:
   Khem/Fray: Flagging on wiki for OE version
   Khem: OE default source mirror


Raw Transcript:


[17:07] --> You have joined the channel #oe-tsc (~paul@pdpc
/supporter/professional/bluelightning).
[17:07] <fray> :)
[17:08] *** Channel modes: no colors allowed, no messages from outside,
topic protection
[17:08] *** This channel was created on 14/02/2011 14:28.
[17:08] <RP__> bingo!
[17:08] <RP__> (full house)
[17:08] <bluelightning> sorry guys
[17:08] <khem> on agenda items I would like to add meta-oe organisation
discussion
[17:08] <RP__> Jefro: has an agenda at http://pastebin.com/vef1520V
[17:08] <Jefro> khem: ok
[17:09] <RP__> we need someone with four legs?
[17:09] <Jefro> should we dive in? who wants to chair?
[17:09] <RP__> or alternatively, I like chesterfields (as a type of chair)
[17:10] * fray suggestions bluelightning
[17:10] <fray> suggests even
[17:10] <bluelightning> ok, I'll do it
[17:10] * Jefro notes bluelightning as taskmaster
[17:11] <bluelightning> ok, so we have Khem's item to add to the agenda
[17:12] <Jefro> bluelightning: agenda in brief: meta-oe, elections, distro
features, tsc meetup, oe-core status, infrastructure, deferred items from
last time
[17:12] <bluelightning> ok, let's discuss meta-oe then
[17:12] * RP__ had forgotten to ping the board but has done so now
[17:13] * Jefro marks that one "done"
[17:13] <bluelightning> I presume you all saw the discussion on the mailing
list which I started?
[17:13] <fray> yes, I did not comment as I saw active participation from
others (non TSC others)
[17:13] <RP__> bluelightning: which list?
[17:13] <fray> I have no additional comments, I think it looked good..
[17:13] <bluelightning> RP__: oe-devel
[17:13] <khem> so for experiment I added meta-oe to layers and did a
core-image-sato build on oe-core and it did not boot where as pure oe-core
works well
[17:13] <fray> (I assume this is the pulseaudio/distro features one
correct?)
[17:14] <khem> fray: meta-oe seems to infringe too much into oe-core
[17:14] <bluelightning>
http://article.gmane.org/gmane.comp.handhelds.openembedded/50131
[17:14] <bluelightning> fray: no, this is another thing
[17:15] <fray> ohh, no I didn't see that one
[17:15] <khem> so there is a discussion to divide it down
[17:15] <bluelightning> khem: it's just an organisation issue as well as
the general need to merge/justify items currently in there
[17:15] <fray> I saw the talk of the reorginization of meta-oe..  The
original talk from last week was reasonable..
[17:15] <fray> it's an orginizational issues as well as a "we don't want
that to become a dumping ground" issue
[17:15] <khem> yes, we need to reorganize the layer a bit so that it
becomes a nicer addon
[17:16] <khem> and may be split it into different layers
[17:16] <fray> perhaps the answer is simply we need to keep re-evaluating
it at release points of oe-core?
[17:16] <khem> I have locally moved toolchain bits into a separate layer
[17:16] <khem> fray: yes
[17:17] <bluelightning> I think that's a good idea
[17:17] <RP__> I am worried that images that work with oe-core, break with
meta-oe
[17:17] <khem> right now it engulfs too much ranging from toolchains to
bootloaders
[17:17] <bluelightning> indeed
[17:17] <RP__> Do we know why?
[17:17] <khem> its too wide in its scope
[17:18] <RP__> is the proposal one repo with different elements that can be
added in or different repos?
[17:19] <RP__> I think I'd be in favour of splitting, if it remains one repo
[17:19] <khem> one repo with different meta-*
[17:19] <khem> yes
[17:19] <RP__> that does seem reasonable given the different functionality
areas identified
[17:19] <bluelightning> RP__: fine with one repo, just multiple layers
[17:19] <fray> multiple layers - one repository?
[17:19] <khem> I think we need to make meta-retired meta-extra
meta-toolchain for sure
[17:20] <fray> i.e. you check out meta-oe -- and get meta-oe/meta-....
[17:20] <khem> no
[17:20] <fray> then the user can choose to include all of meta-oe or just
components?
[17:20] <khem> meta-openembedded/meta-*
[17:20] <khem> fray: they will be independent layers
[17:21] <RP__> fray: I think khem means yes
[17:21] <fray> what I was thinking is if the bblayers includes
meta-openembedded they would get all of the items.. otherwise they could
selectively include just the bits they want
[17:21] <khem> just managed unders one repo meta-openemebedded like we do
for meta-gnome etc.
[17:21] <bluelightning> fray: it could be set up to work that way but I'm
not sure there's much value in it
[17:21] <khem> fray: meta-openembedded = repo
[17:21] <fray> ya, I think we're talking the same thing on the repo side..
[17:21] <khem> not layer
[17:21] <RP__> fray: bblayers needs  a config file and I'm not sure we're
tried the "all" approach you've described
[17:21] <fray> bluelightning value is that it doesn't change existing
behavior.. but gives more flexibility
[17:21] <RP__> fray: it could probably be made to work but likely will
confuse people
[17:21] <fray> RP__, I thought you could include other files within the
one..
[17:22] <bluelightning> fray: meta-openembedded already consists of
multiple layers, of which meta-oe is one (and the one we're discussing here)
[17:22] <fray> so the layers.conf of meta-openembedded would include the
ones from the sub layers.. (maybe it's not that easy)
[17:22] <khem> I am seeing folks asking for recipes on yocto lists which
are there in meta-oe
[17:22] <khem> but they can not use it easlity
[17:22] <fray> ahh, ok.. I understand
[17:22] <khem> since meta-oe will bring them more than what they need
[17:22] <bluelightning> yes, it's hard to recommend meta-oe as a layer just
for the additional recipes right now
[17:22] <RP__> So why are we discussing this? Is the list at deadlock?
[17:22] <khem> correct
[17:22] <fray> what I've done before is pull just the recipes out of
meta-oe I need, but I don't normally use the layer as-is
[17:23] <RP__> or did that thread reach a conclusion?
[17:23] <bluelightning> I'm not sure it is a deadlock
[17:23] <khem> its not deadlock,
[17:23] <RP__> the problem is a lack of conclusion?
[17:23] <khem> we need to find someone to look after new layers
[17:23] <RP__> I'm trying to figure out what our role as the TSC is here
[17:24] <bluelightning> the thread has largely petered out, but I did not
see a response from the current meta-oe maintainer
[17:24] <bluelightning> perhaps I should ping koen
[17:24] <khem> yes
[17:24] <RP__> bluelightning: do that and see where we're at
[17:24] <bluelightning> ok
[17:24] <-- Jefro has left this server (Ping timeout: 240 seconds).
[17:24] --> Jefro__ has joined this channel (43cb5922@gateway
/web/freenode/session).
[17:24] <Jefro__> sorry all - I'm back now
[17:25] <-- Jefro__ has left this server (Changing host).
[17:25] --> Jefro__ has joined this channel (43cb5922@gateway
/web/freenode/ip.67.203.89.34).
[17:25] <bluelightning> let's move onto the next item.. elections
[17:25] <khem> ok move on
[17:25] <fray> I'm up next, RP pinged.. anything else?
[17:25] <RP__> btw, on a related note, I should give the group a heads up
on a discussion on #yocto with otavio recently
[17:26] <khem> RP__: on what topic
[17:26] <RP__> he wanted to merge gitpkgv.bbclass into oe-core as is. I
suggested that some of it should really be integrated with the bitbake
fetcher first
[17:26] <bluelightning> ok sounds like the elections issue is done, so
let's cover that now
[17:26] <RP__> He is rather unhappy about this and wants to do that "later"
[17:27] <RP__> He is going to bring this up on the mailing list and if I
maintain my stance, probably bring to the TSC
[17:27] <fray> I think it's reasonable for him ot bring it up and do it
that way..
[17:27] <khem> but I think its good idea to have gitpkgv as a functionality
[17:27] <fray> I'm not familiar with the actual implementation though..
[17:27] <bluelightning> RP__: he did post the patch FYI, not sure if you
saw it
[17:27] <RP__> bluelightning: ok, I need to give feedback then
[17:28] <RP__> I agree its good functionality, I just think it should be
adapted to fit into the fetcher cleanups and other work being done to
improve things in OE-Core
[17:28] <khem> RP__: nod
[17:28] <bluelightning> so onto the next issue - distro features
[17:28] <RP__> fetcher functionality in one place with a standardised API
is a good thing IMO
[17:28] <bluelightning> I agree
[17:29] <khem> RP__: yes fetchers is right place
[17:29] <RP__> I just wanted to bring this up here since I suspect there
will be some friction
[17:29] <fray> just to verify, point of the code is a smaller (more simpl)
PV right?
[17:29] <RP__> fray: yes
[17:29] <RP__> bluelightning: where is that at now?
[17:29] <fray> ok..  I've heard of a lot of requests for that from
coworkers.. ;)
[17:30] <RP__> fray: well, its a smaller PV in the output packages
[17:30] <RP__> fray: The PV used in the build system is still long
[17:30] <bluelightning> RP__: waiting for "someone" (probably me) to
implement it as discussed I think
[17:30] <fray> yes..  thats what people have requested from me before..
 (they don't care so much about the internal values)
[17:30] <RP__> bluelightning: that's what I thought
[17:30] <fray> but I agree, start with the fetcher and work toward the
package creation is the best approach..
[17:31] <bluelightning> AR to me - file a bug to implement distro features
backfill
[17:31] * Jefro__ notes bluelightning
[17:31] <bluelightning> another AR - file a bug to implement psplash issue
discussed 2 meetings ago as well
[17:31] <bluelightning> (also to me)
[17:31] <fray> Ahh I thought that had been done already.. :)
[17:32] * RP__ would like to note for the record the positive thread on the
meta-ti list about their layer working with OE-Core and not depending on
meta-angstrom/meta-oe
[17:32] <bluelightning> yes, I'm very happy to hear that's being worked on
[17:32] <RP__> that would be nice progress towards the layer model really
starting to work
[17:33] <fray> very cool..
[17:33] * RP__ thought it worth acknowledging here :)
[17:33] <bluelightning> ok, let's move onto "TSC meetup"
[17:33] <khem> yes indeed
[17:33] <Tartarus> ELC, I'll be there, not for yocto dev day tho
[17:33] <Tartarus> iirc the invite went out for the 15th, AM tho, yes?
[17:34] <RP__> None of these things made my calender :(
[17:34] <fray> I'll be at ELC for Yocto Dev Day (Tuesday) through Friday
[17:34] * RP__ notes to self to import them
[17:34] * bluelightning won't be there but has confirmed the TSC meeting
invite assuming teleconf availability
[17:35] * RP__ will be there Tue-Fri
[17:35] <khem> I am registed starting yocto dday
[17:36] <RP__> Anything specific we need to discuss?
[17:36] <Jefro__> you should have a calendar invitation for Weds morning
8am, and I have a room reserved.  we can meet earlier for a full breakfast
if there is the desire to do so.
[17:36] <fray> Unlike last year, I can't think of anything other then
normal meeting stuff..
[17:36] <Tartarus> I'll probably be there right around 8, depending on
airport shuttle, etc
[17:36] <Tartarus> iirc I land 7:15a or so
[17:36] <fray> if we do want to work on rearranging meta-oe, it might make
sense towork on it in person
[17:37] <khem> I will try to be there by 8 traffic permitting
[17:37] * RP__ will be there by 8 or earlier depending on the jetlag
[17:37] * RP__ suspects he could make 5 quite easily :/
[17:37] <khem> heh
[17:38] <fray> :)
[17:38] <khem> 5a will be a bit late for me :)
[17:38] <RP__> A kind of retrospective might be useful
[17:38] <Jefro__> there will be a continental breakfast for those who can
eat at the crack of 8
[17:38] <Jefro__> continental lunch for RP
[17:38] <RP__> What is going well and anything we need to improve
[17:38] <RP__> Jefro__: :)
[17:39] <khem> RP__: yes. and any new ideas
[17:39] <RP__> A lot has happened in the last 18 months :)
[17:39] <khem> RP__: per recipe sysroots e.g. :)
[17:39] <RP__> khem: there is an ehancement bug for it
[17:40] <RP__> but it would be good to discuss priorities and so on
[17:40] <fray> ya.. I think a recap would be good for the year.. do we have
any obligation (or desire) to report to the board/e.V. members what we as
the TSC have done/observed for the past year?
[17:40] <khem> RP__: I would like to see a meta-benchmark
[17:40] <RP__> fray: we have no obligation but nothing to stop us either
[17:40] <fray> ok.. might be worth us doing...
[17:40] <bluelightning> khem: feel free to tack that onto the mailing list
discussion, there's already recipes-benchmark in meta-oe
[17:40] <fray> bullet points, that kind of thing..
[17:41] <RP__> AR: Everyone: To bring thoughts to ELC
[17:41] <fray> yup
[17:41] <bluelightning> ok, shall we move onto OE-core status?
[17:41] <khem> ok
[17:42] <RP__> we're pretty green onmaster
[17:42] <RP__> proposed patches have thrown up regressions so we're trying
to fix before merging
[17:42] <RP__> fixed some nasty useradd+sstate issues last week
[17:42] <RP__> also finally got to the bottom of the machine switching
sstate issue
[17:42] <fray> RP__ the fix was before or after the version bump on bitbake
(requires version)
[17:43] <fray> ?
[17:43] <RP__> Koen+Martin have reported better sstate reuse now
[17:43] <bluelightning> RP__: excellent!
[17:43] <khem> I am working on kmod in hiatus
[17:43] <RP__> fray: after
[17:44] <khem> RP__: I have used sstate quite a bit now its been decent on
me
[17:44] <RP__> khem: great :)
[17:44] <khem> I actually keep *native* and *cross*
[17:44] <khem> and delete everything
[17:45] <RP__> Its taking some work but I think its really starting to help
[17:45] <khem> that just builds the target bits quite fast
[17:45] <RP__> any questions/concerns on oe-core?
[17:45] <khem> RP__: I wish if I could tell category of recipes to rebuild
even when using sstate
[17:46] <RP__> khem: based on what?
[17:46] <khem> RP__: may be recipe names
[17:46] <RP__> khem: you can invalidate the sstate cache in interesting
ways by changing the checksums
[17:46] * Jefro__ says time check: 15 mins left
[17:46] <RP__> khem: you know about -c cleansstate
[17:46] <khem> RP__: yes
[17:47] <khem> RP__: I guess its not that urgent of a need since stuff I do
is not common anyway
[17:48] <Jefro__> RP__ question - how much of this behavior is documented?
[17:48] <RP__> Jefro__: everything I've talked about
[17:48] <RP__> Jefro__: I worked with Scott to document sstate
[17:48] <Jefro__> ok, cool - in yocto docs? will oe folks think to look
there?
[17:48] <khem> someone should summarize sstate in detail if not yet done in
wiki
[17:49] <khem> how to use it and how to not use it. etc.
[17:49] <RP__> khem: its in the manuals
[17:49] <khem> ok
[17:49] <RP__> khem: based on an email from me
[17:49] <RP__> so the docs are out there for anyone to find
[17:49] <RP__> Jefro__: I'd hope they would
[17:50] <RP__> Jefro__: At this point its the most complete manual set on
the subject
[17:50] <bluelightning> ok, remaining issues are "infrastructure" and
deferred items from last time ("Flagging on wiki for OE version", "OE
default source mirror")
[17:50] <bluelightning> shall we try to cover those in 10mins?
[17:51] <khem> both my ARs are still open
[17:51] <RP__> I'm not sure there is much to cover about infrastructure
[17:51] <khem> not much but old melo has retired
[17:52] <khem> on patchwork I think with bitbake there is a problem
[17:52] <khem> since it catches bitbake-devel ml and commit mails also go
to bitbake-devel
[17:52] <khem> it catches the patches both the times
[17:53] <khem> it is preferred to have commit mail be sent to bitbake-devel
?
[17:53] <fray> Hmm.. patchwork doesn't have a way to determine it's the
same patch?
[17:53] <khem> fray: no
[17:53] <khem> although it would be neat
[17:54] <khem> but there is patch and then commits etc.
[17:54] <fray> ok.. for some reason I thought it kept an md5sum or
something of the patch and used that to correlate original patches and
updates..
[17:54] <RP__> Part of the problem is likely that some of us send bitbake
patches with a path prefix of bitbake/
[17:54] <khem> fray: well yes but in this case mail is sent after the patch
has been closed
[17:54] <fray> Ahh I see.. ok
[17:54] <RP__> I just strip it off but it probably confuses patchwork
[17:55] <fray> would it be possible to tag the patches from Saul/RP that
are integration patches (vs original work) and blacklist them?
[17:55] <bluelightning> just filter out "CONSOLIDATED PULL" ?
[17:56] <bluelightning> I think he always includes that in the subject of
0/x at least
[17:56] <fray> thats kind of what I was thinking
[17:56] <khem> actually there is less value for bitbake and oe-core in
patchwork
[17:56] <khem> only people refer to them sometimes
[17:56] <bluelightning> well, oe-core is not handled at all and that means
it's full of old patches
[17:56] <khem> only meta-oe uses it effectively to manage patches we can
even turn it off for bb and oe-core
[17:57] <fray> ya, sounds like we either need to filter it for consolidated
pulls -- or simply avoid the issue by turning it off as khem says..
[17:58] <khem> I guess I can ask the ml and get opinions on having pw
turned on for bb and oe-core
[17:58] <fray> I don't see a lot of references in the mailing list ot
patchwork (for oe-core)..
[17:58] <khem> fray: yes its occasional
[17:58] <khem> on IRC etc.
[17:58] <fray> ahh ok..
[17:59] <fray> I'd sugges tthen we start with the filter approach, and if
that doesn't work try something else.. I assume it uses something like
procmail to get access to the mail messages..
[17:59] <fray> if so we should be able to filter certain emails easily.. if
not, I'm not sure
[17:59] <khem> I think its useless if its not used there is no point in
tracking the patches
[17:59] <RP__> The workflow I've been using doesn't use patchwork
[17:59] <fray> I think it all comes down to member usage.. if people want
to use it, and we can support it.. we should..
[17:59] <khem> but if people think its so critical we can keep it
[17:59] <khem> RP__: yes thats why
[18:00] <fray> but we don't current use it -- so in that case, if it's not
useful we just disable it
[18:00] <khem> yes
[18:00] <bluelightning> khem: if we had the commit hook it would be useful
so that missed patches can at least be viewed
[18:00] <bluelightning> otherwise it's more or less worthless
[18:00] <fray> I have no objection to removing it from oe-core/bb other
then oe users who want it
[18:00] * RP__ has pretty good records of missed patches :/
[18:00] <khem> bluelightning: the way patches flow in ml its hard
[18:01] <RP__> its why my inbox is growing out of control :(
[18:01] * bluelightning did not mean to cast any aspersions
[18:01] <khem> since patches go into ml and then Saul picks them and
resends them to same ml
[18:01] <khem> its a bit not pw like
[18:01] <bluelightning> fair enough, if the tool doesn't really work
there's not much point in keeping it
[18:02] <khem> I would think so
[18:02] <bluelightning> I think we have a standing order to evaluate
patchwork and tools like it but we haven't got to that yet
[18:02] <khem> we can keep it only for meta-oe
[18:02] <khem> since thats handling the patches with it
[18:03] <bluelightning> plus any other layer that uses oe-devel ml for
patches (I use it for meta-handheld / meta-opie FWIW)
[18:03] <bluelightning> or rather, I keep it up-to-date for those layers
[18:03] <khem> yes infact any patches that go into oe-devel are groked
[18:04] * RP__ needs to go I'm afraid
[18:04] <RP__> I think we're pretty much done anyway
[18:04] <RP__> ?
[18:04] <khem> btw. Phil mentioned this on IRC that yocto point to oe.org to
obtain sources probably it should use github mirror addy
[18:04] <fray> ya, I think we are..
[18:05] <bluelightning> I think we've covered our agenda at least
[18:05] <khem> yes
[18:05] <khem> adjourned
[18:05] <fray> khem, I thought that pointer from yocto to oe.org was
deliberate, as Yocto is based on oe-core, and OE board? has input into
Yocto.. (i.e. consider it joint marketing?)
[18:06] <khem> fray: he meant for git
[18:06] <Jefro__> cool - could someone please send me the full transcript?
[18:06] <bluelightning> Jefro__: yep I can do that
[18:06] <Jefro__> bluelightning thanks

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

