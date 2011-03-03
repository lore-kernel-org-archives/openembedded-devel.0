Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1PvGQ3-0004ZB-On; Thu, 03 Mar 2011 22:50:48 +0100
Received: by fxm8 with SMTP id 8so1590885fxm.6
	for <multiple recipients>; Thu, 03 Mar 2011 13:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=PDnZ9TxzFMAhk6wD/THFNJwXct6iWR7AAoSLi0nypfk=;
	b=qrckDac7zvGktR/aqRBacF4MhMzf6xswRVUv6n+H9OpKcow813EHyfMrCi8iRgi+KJ
	8W6w8JXPd8k6H8yVAESOAf+ai4mVq7mnqLEYmo2qHE22xAFubaL3WRBs6Fcu3gOn6fYI
	UNneO2xDQGF4dS+ZKr6ZP9Ew2Ovgl7SJzzpPM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=Uc2SJSeqw1+qALX8q+UnhEJYyMKKh+I9AgmY+njdP/jGTfANwoeEeV00t/kntbSlFK
	bPY56uyLnwH1KyPzoolb3OMDyKndGmb3IH2/WnXRIuIrMwRex+IDvlbT4Seh3WDbdpn8
	b6XMiXlRaHwGbSsva8DKx/DA0RpE+iA1OBx7M=
MIME-Version: 1.0
Received: by 10.223.96.67 with SMTP id g3mr2179155fan.114.1299188958939; Thu,
	03 Mar 2011 13:49:18 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.223.108.194 with HTTP; Thu, 3 Mar 2011 13:49:18 -0800 (PST)
Date: Thu, 3 Mar 2011 13:49:18 -0800
X-Google-Sender-Auth: 6-JU0WE3uJWrae39emhUUbQbh9s
Message-ID: <AANLkTikyv2FBD=hg74zfLHQtWi4pvGBLEv2ajO2fD72S@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org, 
	tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: TSC meeting 2011-02-28 - minutes
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
X-List-Received-Date: Thu, 03 Mar 2011 21:50:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Attendees: Khem, Koen, Mark, Richard, Tom, Stefan, Jeff
Apologies: none

Chair for meeting: Tom

_________________________________________________________________________
AGENDA

Agenda 2011-02-28 meeting
-------------------------

01) Agree on meeting chair

02) Status report on oe-core

03) Status report on pull model, contrib repo and guidelines

04) Status report on board support layer guidelines

05) Status report on version retention policy and interaction with
oe-core / meta-oe / $distro layers
    (This was: Re-inforcement of the "don't delete all old versions"
     policy, make sure this is in the wiki somewhere. [Proposed: Graeme])

06) Status on Yocto / OpenEmbedded integration plan in oe-core

07) Start to think about the Policies section on wiki and whether it is
     relevant/correct now, and also what needs to change going forward
to Yocto.
     [Proposed: Graeme]

08) Come to a set of minimal quality requirements for our recipes/packages
     (e.g. must fetch, minimal required headers etc).
     My proposal would be to use the yocto requirements as a starter

09) Splitting our metadata into multiple layers
     I can think of the following:
     - oe core layer (shared with yocto
     - oe layer (or oe extra's or whatever you want to call it; containing
     recipes that are generic, not in oe-core and considered to be of
     common use)
     - maybe oe-old or so layer (recipes that are not maintained any more)
     - layer per distro for distro specific stuff
     - layer per machine (or maybe soc family, I can imagine it makes sense
     to keep BB and BB-XM together; similarly for the kirkwoord variants)
     - vendor specific layers (if needed), e.g. ti (although maybe that
     stuff could also go into a machine layer)
     Rationale is that users can pull in only those layers that they
need. [Proposed:
     Frans]

10) Consider a version based release mechanism
     yocto has a release model, intermediate versions are aiming to build
     but are considered to be less mature.
     If our core recipes follow this model, I can imagine it is a good
     strategy to follow in oe too. [Proposed: Frans]

11) Discuss future of our infrastructure (oestats, autobuilder,run-time
testing)
     [Proposed: Yury]

12) What immediate infrastructure changes are needed to work on integrating
     better with Yocto. [Proposed: Tom King]

_________________________________________________________________________
SUMMARY

01 Changing the meeting time was discussed, but not decided - moved to
mailing list

02 oe-core status. Koen started to re-sync, found a problem, RP knows what
it is and is going to be able to start doing oe-core stuff this week. Yocto
1.0 is now branched, so work can begin on the main Yocto trunk to integrate
oe-core.  meta-oe + meta-angstrom work with oe-core.  New recipe bundles are
not documented anywhere yet, but that would be a Good Thing.

03 Guidelines for contributed material. Tom and Mark have merged the
pull/version retention policy for oe-core, and it was decided to post this
to oe-devel and poky. For overall contribution guidelines, the current plan
is to borrow policy text from the yocto project as soon as they [meaning:
Jeff] are done creating them, which is ongoing - there should be some
results by the end of the week.

04 BSP guidelines - need to make a generic recipe rather than linux-yocto.
using linux-yocto as baseline for generic stuff/qemu machines.  The only
unacceptable part is using linux-yocto in the docs - agreed to make those
sections Yocto-specific in the Poky doc.

05 we covered, everyone likes the merged guidelines from Tartarus and fray,
just need to post them

06 & 07 for oe-core the min quality = it has to build and pass at least
minimal "hand" run-time validation, and document everything

08 will come out of the guidelines

09 Splitting our metadata into multiple layers - Intel are going for a
meta-intel layer for its BSPs, Koen is proposing a TI layer for machines and
recipes and then a different layer for the TI distro. (stefan/buglabs thinks
that is a good idea).
Tom suggests an arch layer, meta-intel, meta-ti
Khem suggests openembedded-core openembedded-meta <machine>-meta
<distro>-meta
Richard points out that meta-openembedded-contrib and
openembedded-core-contrib exist now, someone just needs to push to them
Mark's eventual recommendation: core + bsps + architecture + "extras" for a
given board
Stefan points out that we need some documentation about which layers work
together and how

10 all agreed to go to yyyy.mm versioning, with further discussion on how to
release testing versions

11 infrastructure future - Khem met a Jenkins developer at SCaLE last week,
he is interested. Some discussion of Hudson.

12 & 13 - continue discussion on mailing list

_________________________________________________________________________
RAW MEETING PROCEEDINGS:

(12:59:16 PM) RP__: welcome Jefro :)
(12:59:24 PM) Jefro: :) thanks
(12:59:28 PM) Tartarus: Hi Jefro
(12:59:49 PM) Jefro: hi Tartarus
(1:02:09 PM) RP__: Jefro: Have you see the agenda Tom posted?
(1:02:30 PM) RP__: We're missing Stefan and Khem?
(1:02:40 PM) Jefro: RP__ yes, just reviewing it now (and the accompanying
discussion)
(1:02:40 PM) fray: ya, I think so.. shall we wait or get started?
(1:03:06 PM) RP__: I'd suggest we start and share the logs...
(1:03:14 PM) fray: works for me
(1:03:26 PM) RP__: So firstly, does everyone know Jefro? I think some of you
have met before?
(1:03:34 PM) stefan_schmidt [~stefan@2a01:198:351:0:21f:16ff:fe0d:7d41]
entered the room.
(1:03:34 PM) mode (+v stefan_schmidt) by ChanServ
(1:03:44 PM) stefan_schmidt: sorry folks, train was late
(1:03:51 PM) RP__: hi stefan_schmidt, you've not missed much :)
(1:03:59 PM) RP__: RP__: So firstly, does everyone know Jefro? I think some
of you have met before?
(1:04:00 PM) stefan_schmidt: RP__: good :)
(1:04:10 PM) stefan_schmidt: Jefro: hi
(1:04:16 PM) fray: hi  :)
(1:04:17 PM) Jefro: Hi all - I know some of you half as well as I should...
(1:04:27 PM) ***stefan_schmidt did not meet him, but from his mails he is a
nice guy :)
(1:04:35 PM) RP__: Jefro: I'm hoping you can really help us get organised
;-)
(1:04:38 PM) Jefro: don't believe eveything you read
(1:04:46 PM) stefan_schmidt: :)
(1:04:53 PM) Jefro: BTW I have pinged khem on IRC
(1:05:12 PM) Jefro: you guys already have a TSC, that is more orgnaized than
99% of the open source projects out there :)
(1:05:16 PM) RP__: Lets leave new meeting time until Khem has a chance to
arrive
(1:05:38 PM) Tartarus: Yeah
(1:05:46 PM) Tartarus: So, 00, I volunteered to chair this week
(1:05:50 PM) RP__: Tartarus: You were going to chair today?
(1:05:50 PM) Tartarus: That work for everyone?
(1:05:54 PM) fray: works for me
(1:06:00 PM) RP__: works for me
(1:06:07 PM) stefan_schmidt: works for me too
(1:06:10 PM) Tartarus: Great
(1:06:18 PM) Tartarus: OK, so 01 we'll wait for Khem
(1:06:23 PM) Tartarus: 02, status report on oe-core
(1:06:39 PM) Tartarus: koen, I saw you posted a sync up patch
(1:06:41 PM) RP__: Ok, I'd like to apologise for not moving on this yet
(1:06:43 PM) Tartarus: what else is up?
(1:06:54 PM) koen: Tartarus: yeah and that patch breaks it, need to se
what's causing it
(1:07:01 PM) RP__: Its a change in poky
(1:07:04 PM) fray: for the split RP__ sent email to the Yocto project folks
informing them of the pending change..
(1:07:06 PM) RP__: needs to go into bitbake
(1:07:11 PM) koen: my money is on missing defines in bitbake.conf or bitbake
mismatch
(1:07:19 PM) RP__: I have however emailed the yocto/poky about the changes
and am in a position to start moving that now
(1:07:34 PM) RP__: Yocto 1.0 has branched which gives me more freedom in a
lot of ways
(1:07:48 PM) stefan_schmidt: RP__: so the dev tree will move to oe-core?
(1:08:06 PM) RP__: stefan_schmidt: yes, effective as soon as I pull things
together which will be tomorrow
(1:08:16 PM) stefan_schmidt: RP__: great
(1:08:31 PM) stefan_schmidt: Sounds like we have been just in time (TM) ;)
(1:09:04 PM) RP__: stefan_schmidt: Just a lot to juggle atm
(1:09:09 PM) Tartarus: So if I can sum up status, Koen started to re-sync,
found a problem, RP knows what it is and is going to be able to start doing
oe-core stuff this week?
(1:09:12 PM) fray: with the oe-core existing, has anyone checked for
compatibility with the existing OE software -- or do we need to get the
layer created first to have a reasonable chance at checking it all
(1:09:29 PM) RP__: fray: Koen has been doing this a little with meta-oe
(1:09:34 PM) fray: cool
(1:09:35 PM) stefan_schmidt: fray: we have meta-oe
(1:09:40 PM) RP__: fray: There are things missing but its not too bad
(1:09:42 PM) koen: it works with meta-oe + meta-angstrom
(1:09:48 PM) stefan_schmidt: Tartarus: I think that sums it up for oe-core
(1:10:01 PM) RP__: fray: As things move to meta-oe, things are getting
cleanup too
(1:10:17 PM) RP__: fray: e.g. legacy staging is just not accepted anymore
(1:10:33 PM) fray: ya, thats the one I was most worried about
(1:10:40 PM) Jefro: question - are these new recipe packages (oe-core,
meta-*) documented anywhere yet?
(1:11:05 PM) Tartarus: Not that I know of, a real getting started with
oe-core + stuff page is to be written
(1:11:11 PM) RP__: Jefro: We are not doing a good job on communication and
help there would be useful...
(1:11:15 PM) Tartarus: It's currently grab this + that + look at what koen's
put up
(1:11:16 PM) Jefro: ok - noted
(1:11:30 PM) Tartarus: Anything else for oe-core status?"
(1:11:34 PM) stefan_schmidt: Especially how people can build with oe-core +
meta-oe
(1:11:35 PM) RP__: Jefro: Another thing I know I've been asked for and I've
been meaning to try and dig up from Yocto is our patch acceptance guidelines
(1:11:47 PM) RP__: i.e. what does something need to be to accepted into
oe-core?
(1:11:50 PM) koen: I had hoped people would start contribution to meta-oe a
few weeks ago, but so far nothing
(1:11:57 PM) fray: the other question I had from a few people today (on the
yocto side) is what sofwtare is in each layer..  we need to make sure that
gets documented as well.. (I believe we already have statement on that)
(1:11:58 PM) Jefro: RP__ it is on my short list to develop such guidelines
and post them for review (for yocto)
(1:12:22 PM) Jefro: RP__ I'd like them to reflect OE guidelines to a certain
extent
(1:12:26 PM) stefan_schmidt: Tartarus: I think oe-core status item is done
(1:12:32 PM) Tartarus: OK, so next up
(1:12:40 PM) Tartarus: status on contrib model & related stuff (ie docs)
(1:12:47 PM) Tartarus: I gather we haven't done anything
(1:12:58 PM) stefan_schmidt: no
(1:13:00 PM) fray: Tom and I merged our version retention policy.. is there
an additional feedback on that?
(1:13:06 PM) fray: otherwise we should publish what we have
(1:13:23 PM) fray: (thats the policy for oe-core)
(1:13:24 PM) Tartarus: fray, that's 05 :)
(1:13:24 PM) koen: the merged stuff looked good to me
(1:13:33 PM) RP__: fray: I think the revised document looked reasonable
(1:13:41 PM) fray: sorry... thought it was part of 3.. I'll wait then
(1:13:41 PM) stefan_schmidt: fray: I think we should publish and discuss on
oe-devel and poky lists
(1:13:42 PM) ***RP__ meant to ack it
(1:13:44 PM) Tartarus: But, OK, we'll jump ahead just a minute
(1:14:01 PM) Tartarus: it sounds like we're all happy with the policy, just
need to post it
(1:14:11 PM) stefan_schmidt: I think pull and version stuff is in a stage
where we should discuss it with a wider audience?
(1:14:15 PM) RP__: Tartarus: I think Jefro might be able to help pull
together the Yocto bits from various wikis and other places
(1:14:31 PM) RP__: stefan_schmidt: We have done that on the mailing list at
least
(1:14:52 PM) ***Jefro will take a look at the OE mailing list archives
(1:14:59 PM) stefan_schmidt: RP__: right, need to get a discussion or
decision going :)
(1:15:04 PM) Tartarus: OK, so, in sum, on pull model / contrib repo and
guidelines
(1:15:15 PM) Tartarus: Need help (Jefro) to re-package and reword the
poky/yocto bits that do exist
(1:15:22 PM) RP__: Jefro: Note that the new OE-Core is adopting a number of
Yocto practises for the pull model for the core
(1:15:26 PM) Tartarus: And need to talk w/ OE infra admins to get the
contrib repo made?
(1:15:40 PM) koen: sed s/yocto/oe-core/g
(1:16:00 PM) ***RP__ can take the action to make the two contrib repos, I
have access for that
(1:16:09 PM) koen: Tartarus: that should be easy, but khem + tom were busy
with scale
(1:16:20 PM) Tartarus: ok
(1:16:30 PM) Tartarus: So RP will take the action to get the repos made
(1:16:35 PM) Tartarus: Anything else for 03 ?
(1:16:38 PM) ***Jefro can take action on assembling guidelines from wiki &
discussions
(1:17:14 PM) koen: for 04 we were in rough agreement, I think?
(1:17:16 PM) stefan_schmidt: I think this covers it for now. If we get
feedback we can discuss furtehr actions
(1:17:32 PM) stefan_schmidt: I like the bsp guide fro RP__
(1:17:35 PM) fray: yes.. 04 was using the Yocto, with Yocto replaced..
(1:17:36 PM) koen: copy yocto bits, replace linux-yocto stuff
(1:17:36 PM) Tartarus: Moving along, 04, BSP guidelines
(1:17:53 PM) Tartarus: And yes, it sounds like we're all in agreement, just
need to take the yocto bits and regex a bit
(1:17:55 PM) RP__: koen: Do we really want to fork it?
(1:17:57 PM) stefan_schmidt: RP__: could we get the "source" for it to put
it somewhere people can contribute to it?
(1:18:07 PM) Tartarus: And deal with needing to make a generic linux recipe
still rather than linux-yocto
(1:18:09 PM) RP__: stefan_schmidt: source is in the poky repo
(1:18:20 PM) stefan_schmidt: RP__: ah, great. Did not know that
(1:18:30 PM) fray: as part of 04 -- we're still doing yocto-linux has the
default kernel sources (for qemu support) correct?  Will we be pointing
people at the corresponding BSP documentation specific to the yocto-linux
kernel?
(1:18:32 PM) koen: RP__: I don't want to make such a strong promotion for
linux-yocto in 'oe' bsps yet
(1:19:08 PM) RP__: koen: Ok, I'm trying to see how we could do this without
forking the docs
(1:19:11 PM) Tartarus: fray, my recollection was we're just using
linux-yocto for qemu as a stop-gap
(1:19:20 PM) koen: I have a feeling most people don't have .34 or .37
versions of their kernels
(1:19:35 PM) fray: at present, the focus is on enabling generic kernel
recipes.. and we hadn't agreed on yocto-linux or not for a suggested base
kernel.. correct?
(1:19:36 PM) koen: which rules out using linux-yocto
(1:20:07 PM) Tartarus: fray, i thought we agreed to use linux-yocto as a
baseline for getting the generic stuff right
(1:20:18 PM) fray: yes -- for the qemu support in oe-core..
(1:20:20 PM) Tartarus: which is to say that makes more sense than oe.dev's
kernel.bbclass + linux.inc
(1:20:50 PM) RP__: I think the kernel discussion will need an hour in its
own right
(1:20:54 PM) Tartarus: Yes
(1:21:03 PM) Tartarus: And some before hand hacking around
(1:21:07 PM) Tartarus: So lets re-focus
(1:21:09 PM) Tartarus: BSP guidelines
(1:21:10 PM) fray: we absolutely need to enable people to use whatever
random kernel they want for their project...  what Iw as wondering is if we
want to think about suggesting the yocto-linux kernel..
(1:21:15 PM) ***fray tables the question
(1:21:17 PM) RP__: As I understood it, we agreed to use linux-yocto for now
for the qemu machines and revisit this
(1:21:24 PM) Tartarus: We like the poky doc but need to oe-core'ify it
(1:21:39 PM) Tartarus: And don't want to have to duplicate it between poky
and oe-core
(1:21:46 PM) Tartarus: (or yocto and oe-core? Bah...)
(1:21:55 PM) koen: let's move to 05 and do 04 on the ml?
(1:22:00 PM) RP__: The only unacceptable bit is the linux-yocto references,
right?
(1:22:09 PM) koen: RP__: right
(1:22:27 PM) RP__: If we make those sections Yocto specific, would that keep
people happy?
(1:22:37 PM) Tartarus: I think so
(1:22:45 PM) stefan_schmidt: would be ok for me
(1:22:55 PM) fray: fine here
(1:22:59 PM) koen: yeah
(1:23:06 PM) khem [~khem@99-57-141-118.lightspeed.sntcca.sbcglobal.net]
entered the room.
(1:23:06 PM) mode (+v khem) by ChanServ
(1:23:14 PM) Tartarus: hey khem
(1:23:15 PM) fray: welcome..
(1:23:16 PM) koen: khem: welcome!
(1:23:22 PM) stefan_schmidt: hi khem
(1:23:30 PM) khem: sorry guys work meetings ran late
(1:23:39 PM) RP__: hi khem
(1:23:41 PM) Tartarus: So, lets see if I can sum up 04
(1:23:48 PM) RP__: can someone send the logs to khem?
(1:23:58 PM) Tartarus: We like the poky doc, just need to make the
linux-yocto stuff in a yocto specific set of sections
(1:23:59 PM) RP__: or I can?
(1:24:01 PM) ***Jefro will take that action item
(1:24:13 PM) khem: thx
(1:24:25 PM) khem: which item are we at
(1:24:35 PM) Tartarus: Just finished 04, already did 05 and now back to 01
(1:24:37 PM) Tartarus: meeting times
(1:24:39 PM) fray: Tartarus I believe that is what we've agreed on..
 dsicussion as tot he linux-yocto usage within OE has been tabled then
(1:24:39 PM) RP__: Tartarus: ok, I can talk to some people about that
(1:24:54 PM) Tartarus: Monday doesn't work for koen, RP would like to avoid
Tuesdays if possible, Thursday is out for fray
(1:25:19 PM) fray: (I can do thursday if absolutely necessary but would
rather avoid ti)
(1:25:21 PM) Tartarus: Would this time Wed or Friday work for everyone?
(1:25:22 PM) RP__: Well, /me would really like Mondays, or I'd like to meet
earlier...
(1:25:26 PM) ***stefan_schmidt does not have a preference
(1:25:47 PM) khem: Will some other time on moday work for Koen
(1:25:59 PM) RP__: How would a two hours earlier slot on Mondays work for
people?
(1:26:05 PM) fray: fine with me
(1:26:12 PM) stefan_schmidt: would fit me well
(1:26:14 PM) fray: (it's actually better for me then the current slot)
(1:26:25 PM) khem: that would work for me
(1:26:47 PM) Jefro: I'm not a critical member, but I can be there then
(1:26:54 PM) RP__: Tartarus/Koen?
(1:26:56 PM) Tartarus: koen?
(1:27:08 PM) ***koen messed up timezones again
(1:27:15 PM) Tartarus: I can do that and I think it stops being noon and
starts being 1 for me soon
(1:27:21 PM) koen: I need to leave at 8PM on mondays, sorry
(1:27:41 PM) koen: so it would need to be 3 hours earlier
(1:27:52 PM) RP__: koen: what time is it for you now? 10:30pm?
(1:27:55 PM) Jefro: (daylight saving time starts a week from Sunday)
(1:27:57 PM) koen: yes
(1:28:03 PM) koen: 22:27 to be exact
(1:28:14 PM) stefan_schmidt: same here
(1:28:23 PM) stefan_schmidt: three hours earlier would be ok as well here
(1:28:32 PM) fray: works here as well
(1:28:32 PM) RP__: ok, does 3 hours earlier work for people?
(1:28:41 PM) koen: it would for me
(1:29:07 PM) Tartarus: I can do it
(1:29:33 PM) khem: works for me. Sometimes if traffic is bad may be bit but
thats fine
(1:30:22 PM) RP__: Hmm, that slot conflicts with a current meeting for Yocto
1.0
(1:31:18 PM) RP__: it also means rearranging meals but I'm reluctant to mess
around more of my evenings which are already screwed up enough
(1:31:32 PM) fray: RP__ can we tentatively agree and move discussion to the
ML if it's not going to work out?
(1:32:16 PM) RP__: Does the 4 hours earlier timeslot work for people on any
other days?
(1:32:26 PM) RP__: I'm just trying to get a feel for what times could work
for people...
(1:32:35 PM) koen: it would for me
(1:32:39 PM) stefan_schmidt: RP__: For me only on wednesday and friday :(
(1:32:43 PM) Tartarus: I'm pretty much free whenever
(1:33:19 PM) RP__: Friday, 4 hours earlier?
(1:33:27 PM) stefan_schmidt: fine with me
(1:33:35 PM) khem: wont work for me
(1:33:45 PM) fray: ya.. thats fine for me except thursday
(1:34:05 PM) stefan_schmidt: ok, lets move this to ml
(1:34:17 PM) stefan_schmidt: need to focus on the other items
(1:34:19 PM) Jefro: I suggest sticking with 3 hrs earlier on Monday
tentatively, and moving to the mailing list
(1:34:19 PM) Tartarus: Yeah, OK, back to the ML for meeting time
(1:34:29 PM) khem: everyday 1700 - 1900 GMT wont work for me
(1:34:56 PM) RP__: khem: can you go earlier or not?
(1:35:04 PM) Tartarus: Mailing list, please
(1:35:08 PM) Tartarus: Lets move on to 06
(1:35:08 PM) koen: 05?
(1:35:23 PM) Tartarus: 05 we covered, everyone likes the merged guidelines
from myself and fray
(1:35:28 PM) koen: k
(1:35:30 PM) Tartarus: need to post them up and be done with it
(1:35:46 PM) Tartarus: So, 06
(1:35:53 PM) fray: post and get comments from the members.. but I suspect
they'll be light or clarifications
(1:35:56 PM) Tartarus: status on yocto / OE integration plans for oe-core
(1:35:57 PM) RP__: I think we've really covered 06 and 07 atm?
(1:36:03 PM) khem: RP__: yes I have been trying to wake up early so this
could be a reason to wake up early
(1:36:10 PM) Tartarus: And that's RP will have more time real soon now
(1:36:13 PM) ***Jefro LOLs
(1:36:55 PM) Tartarus: 08 we haven't talked about before (yay new business),
come up with a set of minimal quality requirements in recipes, with the
suggestion to use yocto requirements as the starting point
(1:37:00 PM) fray: Only comment for 07 -- we should focus current polocies
around the oe-core and meta-oe stuff..  since thats the new work..
(1:37:24 PM) Tartarus: Oh, hoops, misread, yes, 07 needs to come next
(1:38:00 PM) koen: steal from yocto, send to ml for review, etc?
(1:38:04 PM) RP__: Won't we have a better idea on 07 once we come up with
the guidelines and so forth?
(1:38:19 PM) Tartarus: So, today OE has a commit policy page
(1:38:24 PM) RP__: So plan is steal from Yocto, review and update as needed
(1:38:33 PM) Tartarus: And yes, it goes away w/ the pull model
(1:38:34 PM) stefan_schmidt: RP__: yes, and then revisit our current
guidelines
(1:38:36 PM) RP__: Tartarus: Right, that is not based on the pull model
though
(1:38:38 PM) Tartarus: and newer docs
(1:38:50 PM) ***Jefro notes that he had better get cracking on updating the
Yocto guidelines
(1:38:51 PM) Tartarus: it talkes a little about quality, which would be
covered elsewhere
(1:39:02 PM) RP__: Jefro: yes ;-)
(1:39:10 PM) Tartarus:http://wiki.openembedded.org/index.php/Special:Categories
is most of the
policy pages
(1:39:15 PM) fray: 08 - for oe-core the min quality = it has to build and
pass at least minimal "hand" run-time validation.. ( better if we had some
kind of documented test procedure! ) -- for meta-oe existing quality rules
enough?  or do we need to document the stuff like the no cache thing..
(1:39:17 PM) RP__: I think this will become much clearer once we tackle the
things we've talked about
(1:39:26 PM) Tartarus: And, some of those clearly won't work going forward
(1:39:49 PM) Tartarus: RP__, agreed
(1:40:32 PM) RP__: Also, 08 will come out of the gudielines
(1:40:40 PM) Tartarus: Yeah
(1:40:43 PM) RP__: Lets take this up on the mailing list
(1:40:45 PM) koen: do we want to list the tests done in oe-core commit
messages?
(1:40:47 PM) fray: I'm comfortable right now stating the goals we're talked
about in previous meetings.. then making it more ridged as time goes on and
we find whats working and whats not
(1:41:09 PM) ***RP__ agrees - we just need to document them though
(1:41:20 PM) RP__: Its where the TSC has done really badly in the past
(1:41:42 PM) stefan_schmidt: koen: listing some tests in the commit message
is never bad. Not sure if we need to enforce it
(1:41:56 PM) fray: commit messages -- I think it's critical we continue to
following the requirements:  everything has a summary, everything has a
descriptive body..  as part of the review if we have to figure out what it
does -- then the description isn't enough..
(1:42:25 PM) stefan_schmidt: fray: something the maintainers need to enforce
before pulling, yes
(1:42:36 PM) fray: I full endorse tests in commit messages -- but I'm not
sure we have to enforce that.. I'd find it more useful to document the tests
either in the recipes themselves or in a central location
(1:42:38 PM) RP__: My intent is that any changes should pass some simple
regression tests and we continually improve those regression tests and the
quality of the core
(1:42:46 PM) fray: as part of the pull request we need the person to state
what tests they ran (or didn't)
(1:43:12 PM) fray: (and if the change is "obvious", I'm not against
accepting it.. but thats maintainers perogative)
(1:43:22 PM) Tartarus: So, who wants to start talking about this a little
more and draft a guideline for the ML?
(1:43:27 PM) RP__: Adding testing notes to pull requests is what we've
usually done in Yocto
(1:43:47 PM) RP__: As you don't usually test every change in isolation as we
don't have the build power for that
(1:43:48 PM) khem: I believe unit test will depend on type of recipe
(1:43:57 PM) fray: lets start with the yocto guidelines.. fi there aren't
any written, I can take the action to start the discussion
(1:44:16 PM) fray: khem -- agreed.. testing is subject to the "right sized
unit to be tested"
(1:44:21 PM) Tartarus: OK, so, fray, post something to the ML of either
yocto guidelines or where you've written the ones that don't exist down?
(1:44:32 PM) fray: ok.. I'll do that
(1:44:37 PM) Tartarus: OK, moving on then
(1:44:38 PM) Tartarus: 09
(1:44:46 PM) Tartarus: How we want to split into layers
(1:44:51 PM) RP__: For 09, we're clear on oe-core
(1:45:07 PM) Tartarus: And meta-oe is the next step of generic bits
(1:45:19 PM) Tartarus: Certainly having distro and machine layers
(1:45:21 PM) stefan_schmidt: oe-core, bsp layers, meta-oe, distro layer
(e.g. angstrom) anything else?
(1:45:31 PM) Tartarus: There's a question of where stuff belongs, BSP or
core or meta-oe sometimes
(1:45:32 PM) koen: oe-graveyard ?
(1:45:42 PM) Tartarus: And I think we can say that it depends on what it is
(1:45:44 PM) RP__: I wondered about a meta-graveyard
(1:45:53 PM) Tartarus: To me, we're in scm
(1:45:55 PM) RP__: koen: inside or separate to meta-oe?
(1:45:56 PM) Tartarus: So that's the graveyard
(1:46:05 PM) fray: What I told some folks is to look whats there.. if it's a
new component, assume meta-oe
(1:46:32 PM) fray: oe-core I THINK will be fairly clear what belongs there,
as time goes on.. if someone submits something "new" it's part of the
process to argue why it goes there
(1:46:34 PM) stefan_schmidt: well, if we have the tools to pull over old
recipes in another layer if gone form oe-core I don't see graveyard useful
(1:46:36 PM) koen: Tartarus: I guess I mean limbo or purgatory
(1:46:54 PM) RP__: stefan_schmidt: I have a bad feeling about a graveyard
too
(1:47:11 PM) Tartarus: koen, still, git rm and bring it back if someone
cares to fix things
(1:47:13 PM) RP__: FWIW, Intel are going for a meta-intel layer for its BSPs
(1:47:15 PM) stefan_schmidt: I would say we start without it and re-think if
need arise
(1:47:23 PM) RP__: koen: I don't know if you can comment for TI?
(1:47:39 PM) fray: I'm inclined to say if the recipe is unworkable in the
new world.. then it's removed.. if someone works on making it function again
-- then they bring it into meta-oe..  no need for a "graveyard"  I think
(1:47:44 PM) RP__: I'm not adversed to some core includes being in the core
either
(1:47:47 PM) koen: RP__: I am proposing a TI layer for machines and recipes
and then a different layer for the TI distro
(1:47:56 PM) fray: RP__, ya, neither am I
(1:47:59 PM) RP__: koen: makes sense
(1:48:09 PM) Tartarus: ok
(1:48:14 PM) Tartarus: So, if I can sum for a minute?
(1:48:16 PM) stefan_schmidt: koen: split sounds good (buglabs hat on)
(1:48:22 PM) khem: we will need a graveyard for the recipes that will retire
out of new structure
(1:48:27 PM) khem: may be in coming future
(1:48:28 PM) Tartarus: oe-old/graveyard/whatever, no
(1:48:33 PM) Tartarus: we'll re-evaluate later if needed
(1:48:33 PM) stefan_schmidt: koen: so a bug bsp would get pulled into the TI
layer or in my own bsp?
(1:48:48 PM) koen: stefan_schmidt: I'm fine with either
(1:48:52 PM) Tartarus: And about BSP vs core, it looks like no, there'll be
an arch core layer as needed
(1:48:55 PM) Tartarus: meta-intel, meta-ti
(1:49:03 PM) Tartarus: and so forth
(1:49:05 PM) stefan_schmidt: koen: ok, I will need to actually think about
it a bit more :)
(1:49:16 PM) khem: should be openembedded-core openembedded-meta
<machine>-meta <distro>-meta
(1:49:34 PM) RP__: btw, meta-openembedded-contrib and
openembedded-core-contrib exist now, someone just needs to push to them
(1:49:51 PM) fray: my eventual recommendation is..  core + bsps +
architecture + "extras" for a given board
(1:50:02 PM) fray: (architecture my include prebuilt binary toolchains for
instance)
(1:50:04 PM) Tartarus: So that covers items 09
(1:50:07 PM) Tartarus: Any more comments?
(1:50:11 PM) fray: BSP is the kernel and drivers and firmware, etc..
(1:50:29 PM) Tartarus: fray, imho, oe-core needs to support
external-toolchain-foo, but lets have that later :)
(1:50:41 PM) fray: Tartarus yes -- agreed.. and agreed to table ti
(1:50:48 PM) Tartarus: So, 10
(1:50:59 PM) stefan_schmidt: sorry, one more thing for 9
(1:51:03 PM) RP__: I think we'll all agree about supporting external
toolchains tbh
(1:51:05 PM) ***Jefro has a memory that BSD used to have different patch
sets for different toolchains... maybe meta-opensourcerylite, etc
(1:51:06 PM) Tartarus: OK, 09
(1:51:14 PM) khem: for 10 I think we should use year and month
(1:51:17 PM) stefan_schmidt: Will we have some indication what layers are
working together?
(1:51:20 PM) koen: quarterly releases?
(1:51:22 PM) stefan_schmidt: versions or such?
(1:51:37 PM) Tartarus: stefan, good point, but I think that's up to the
layers at some point
(1:51:43 PM) koen: stefan_schmidt: I
havehttp://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/tree/README
(1:51:44 PM) fray: ya, for 10, I think year/month -- quarterly or half-year
release works good for this kind of project
(1:51:47 PM) Tartarus: But yes, that also gets into guidelines and so forth
for oe-core
(1:51:49 PM) Tartarus: 10
(1:51:53 PM) RP__: stefan_schmidt: I would like to see the bsp layers
advertise what releases of the core they work with
(1:51:58 PM) stefan_schmidt: Tartarus, koen: ok
(1:51:59 PM) Tartarus: I also like YYYY.MM for release numbers
(1:52:05 PM) Tartarus: and hate 1.N, 2.N, and so on
(1:52:09 PM) stefan_schmidt: RP__: as text file?
(1:52:12 PM) fray: stefan_schmidt that is an issue -- one where I've had
experience simply using a README file documenting compatibility..
(1:52:25 PM) stefan_schmidt: ok, I can life with that for now
(1:52:26 PM) RP__: stefan_schmidt: better than nothing certainly
(1:52:30 PM) Tartarus: We're currently on a quarterly schedule
(1:52:31 PM) fray: it's not perfect, but assuming the layers and recipe
format rarely changes (or predictably changes) it usually works well
(1:52:36 PM) RP__: We should note that in the BSP guide actually
(1:52:40 PM) Tartarus: And 10 is just changing to a version number mechanism
(1:52:44 PM) Tartarus: over what we've done so far
(1:52:48 PM) stefan_schmidt: we just need to keep it in mind. (I guess the
Yocto people do already...)
(1:53:04 PM) fray: well the primary version I think what you have already is
fine..
(1:53:11 PM) Tartarus: And YYYY.MM avoids the whole "when do we call it a
new WHOLE number!?!?" thing and so on
(1:53:21 PM) fray: but the question as I read it, what do we do about bug
fixes and other tsuch things..
(1:53:22 PM) RP__: I think quarterly or half year are a natural rhythm that
works
(1:53:23 PM) stefan_schmidt: The question is if we can keep up quarterly
releases
(1:53:33 PM) Tartarus: stefan_schmidt, I think we can
(1:53:35 PM) khem: will releases be branched out for maintainance ?
(1:53:39 PM) Jefro: YYYY.MM is a very reasonable release numbering schedule.
(I draw the line at naming after desserts or animals)
(1:53:41 PM) RP__: Tartarus: Those discussions are such fun ;-)
(1:53:57 PM) koen: pull model should help with doing releases
(1:54:08 PM) Jefro: adding one more question - who does build testing, and
can it be normalized across releases?
(1:54:10 PM) stefan_schmidt: I think YYYY.MM is a sane version and should
stay
(1:54:18 PM) Tartarus: With 2011.03 almost out the door I can say it hasn't
been too bad
(1:54:18 PM) stefan_schmidt: combining version and date is good
(1:54:19 PM) fray: the longer we can keep the quality in check during
development -- the easier it will eb to release "on-time"
(1:54:20 PM) khem: well the codenames are useful when one has to delay the
schedules
(1:54:23 PM) Tartarus: So I think we can keep up the pace
(1:54:27 PM) koen: I remember going through the .oe -> .bb rename right
before a distro release
(1:54:32 PM) RP__: The poky release names are just a bit of fun  :)
(1:54:49 PM) Tartarus: So, pulling back on topic
(1:54:54 PM) fray: as for slipping if say 2011.07 becomes 2011.08, so be
it.. use the name when it's going to release..
(1:54:55 PM) RP__: Can we agree to try and put the OE release and Yocto
release in sync?
(1:55:00 PM) fray: this gives a clear indication as to the age of the
software
(1:55:03 PM) khem: thats a good point
(1:55:03 PM) Tartarus: 10, in sum, we like year.month for a release number
(1:55:10 PM) stefan_schmidt: RP__: yes, please
(1:55:10 PM) Tartarus: and think we can continue the quarterly releases
(1:55:12 PM) khem: oe and yocto should try to release same time
(1:55:13 PM) RP__: That means we can aim for tree stability at certain times
(1:55:13 PM) Tartarus: agreed?
(1:55:25 PM) stefan_schmidt: Tartarus: agreed
(1:55:28 PM) khem: aye
(1:55:29 PM) fray: khem, I'm not sure about "at the same time", but near the
same time is my suggestion..
(1:55:30 PM) koen: sounds good to me
(1:55:35 PM) RP__: year and month sound good
(1:55:43 PM) khem: fray: yes around same time
(1:55:44 PM) Jefro: Tartarus  - would it make sense for this to be discussed
in person at Collab Summit / ELC? I am working on obtaining a discussion
room over the weekend between.
(1:55:47 PM) Tartarus: So, re-reading 10
(1:56:03 PM) Tartarus: I see it a bit also about having more testing
releases made, too
(1:56:04 PM) fray: yes -- I think this is a topic we need to cover in
person..
(1:56:12 PM) RP__: Yocto has milestone releases interspacing the main
releases
(1:56:13 PM) Tartarus: Which would kind of conflict with quarterly releases
(1:56:21 PM) koen: sepaking of ELC, Mike W is looking at moving yocto stuff
to ELC, so peopel can skip collab
(1:56:26 PM) Tartarus: And to me, having weekly testing branches is a good
point
(1:56:35 PM) Tartarus: esp with more building of them happening
(1:56:38 PM) fray: I'm going to both
(1:56:49 PM) RP__: koen: That is probably good
(1:56:54 PM) khem: ELC would be more relevant
(1:57:13 PM) Jefro: There will be a yocto workgroup meeting at Collab, and
at least a BoF at ELC - but a BoF is a terrible place to get actual business
done
(1:57:18 PM) stefan_schmidt: So ELC has a Yocto meeting? (me feels
uninformed)
(1:57:32 PM) stefan_schmidt: The US ELC or the europe one?
(1:57:38 PM) khem: US ELC
(1:57:39 PM) RP__: stefan_schmidt: Its in flux, there certainly will be
discussion at Collab or ELC
(1:57:39 PM) koen: san francisco
(1:57:44 PM) Jefro: stefan_schmidt: this is for the US ELC coming up in
April in San Francisco
(1:57:45 PM) stefan_schmidt: ok
(1:57:47 PM) RP__: Yes, ELC, not ELC-E
(1:57:55 PM) Jefro: and also in Prague, for that matter, but Prague is 8
months away
(1:57:57 PM) RP__: There will be Yocto discussion at ELC-E too
(1:58:05 PM) RP__: I'd suggest we hold OEDEM at ELC-E
(1:58:12 PM) RP__: but thats another discussion
(1:58:13 PM) khem: me too
(1:58:16 PM) koen: stefan_schmidt: I was going to see if LF can scrape up
some funding for TSC members if needed
(1:58:19 PM) ***stefan_schmidt needs to think about it if he can make prague
(1:58:21 PM) Tartarus: Yes, this is all not relevant to 10 :)
(1:58:26 PM) Tartarus: So, hang on?
(1:58:39 PM) stefan_schmidt: koen: for ELC or ELC-E?
(1:58:39 PM) Tartarus: Second part of 10 is doing more frequent testing
releases
(1:58:44 PM) Jefro: agreed- I didn't want to derail
(1:58:50 PM) stefan_schmidt: koen: later..
(1:58:59 PM) Tartarus: I'd vote to just keep doing weekly testing branches,
outside of when we do a release
(1:59:02 PM) khem: Tartarus: I guess testing releases we could do RCs
(1:59:10 PM) khem: 3 months is not a long time
(1:59:14 PM) Tartarus: khem, right
(1:59:23 PM) koen: Tartarus: having a a status report every week would be
nice
(1:59:25 PM) Tartarus: We could suggest how often to do RCs, now that we've
done 2 releases
(1:59:26 PM) stefan_schmidt: and we need time to actual develop stuff
(1:59:34 PM) fray: Tartarus I think if we can keep the quality up, and know
where the holes are.. it'll be easier to do testing builds and tests prior
to a quarterly release..
(1:59:44 PM) Tartarus: (I'd probably do a few things different next time
around)
(1:59:51 PM) RP__: I think we will find ways to make the release process
much easier
(2:00:05 PM) Tartarus: fray, keep in mind normally OE does a weekly testing
branch on thursday
(2:00:10 PM) Tartarus: that's just been suspended while we do a release
(2:00:19 PM) khem: Tartarus: having weekely tests done and tagging SCM for
that should be one way
(2:00:20 PM) fray: ahh, I see no reason not to continue doing that
(2:00:32 PM) koen: that hooks into 11), btw
(2:00:55 PM) Tartarus: So, in sum, we would suggest more and perhaps write
up guidelines for running an OE release, but keep the current weekly testing
+ quarterly release + year.month for a version
(2:00:55 PM) khem: We could use jenkins instead of tinderbox
(2:00:57 PM) koen: I would think something like jenking + oestats
(2:01:07 PM) Tartarus: I'll take the AI to write up guidelines, once I get
2011.03 out the door
(2:01:12 PM) stefan_schmidt: Tartarus: that covers it I think
(2:01:16 PM) Tartarus: khem, other discussion, yes :)
(2:01:22 PM) khem: I met jenkins maintainer at SCALE and he is very
interested
(2:01:24 PM) Tartarus: And is 11, yes
(2:01:40 PM) khem: Tartarus: I am on 11 yes
(2:01:48 PM) Tartarus: And if we can get some help on doing some of the
enhancments we'd need, that would be good
(2:01:54 PM) Tartarus: Since out of the box it doesn't fit all of our needs
(2:02:22 PM) Tartarus: (And it's the top of the hour so I'd like to call it
ameeting once we're done with 11)
(2:02:23 PM) khem: I think it should be helpful to get the changes we want
into jenkins
(2:02:26 PM) koen: the arm team at TI is using hudson/jenkins as well
internally
(2:02:38 PM) Tartarus: koen, have you guys done any plugin dev?
(2:02:42 PM) koen: no
(2:02:46 PM) Tartarus: ok
(2:02:46 PM) RP__: I've heard bad things about the overhead of hudson
(2:02:49 PM) Tartarus: That's where we need it
(2:03:18 PM) Tartarus: RP__, on the slave? yes, it's a bit annoying, but not
so bad
(2:03:30 PM) Tartarus: All of my builds are on a 4GB mem slave, and no swap
(2:03:36 PM) Tartarus: make -j8/BB_NUM_THREADS=6
(2:03:46 PM) khem: Do we need to keep detailed log that oestats reports
right now ?
(2:03:56 PM) khem: like info about every step
(2:04:19 PM) koen: khem: logs only for failures and QA logs IMO
(2:04:20 PM) Tartarus: khem, to me, no, we only need in a public server like
this to keep high level info (time a step took?) + failure log
(2:04:29 PM) Tartarus: if we can get all of the logs for recipe N when it
fails, that'd be good
(2:04:31 PM) RP__: I think failures and QA are more interesting that the
successes
(2:04:52 PM) khem: I think so too
(2:04:56 PM) Tartarus: koen, re plugin dev, it's not too bad, and for better
or worse it's java
(2:05:02 PM) Tartarus: but I didn't go insane writing the plugin I wrote :)
(2:05:07 PM) RP__: Success is only interesting in "how should this look"
(2:05:15 PM) khem: so if the recipe does not appear in logs it is deemed to
be working ?
(2:05:26 PM) fray: one of the things we've tried to gather is timing
information -- that way when a step, steps take longer/shorter times to
execute, we can investigate if this is reasonable..
(2:05:47 PM) Tartarus: khem, looking at what's doable today, I'd save the
whole console output of bitbake
(2:05:53 PM) Tartarus: But not each log.foo
(2:06:03 PM) khem: Tartarus: yeah thats sane
(2:06:08 PM) RP__: khem: You can log success, just not the full build output
(2:06:12 PM) fray: if space is an issue, I'd agree
(2:06:32 PM) Tartarus: fray, keep in mind how much data a big builder like
the mentor one generates
(2:06:32 PM) khem: and hopefully folks wont use -DDD
(2:06:35 PM) RP__: fray: Our build stat stuff does log timing already
(2:06:43 PM) fray: ok
(2:06:43 PM) Tartarus: I think I went a tad overboard at 1053 combos
(2:06:46 PM) RP__: fray: It can vary a lot based on cpu load though
(2:06:50 PM) Tartarus: But still, this weekend build was a lot
(2:07:11 PM) ***Tartarus needs to wc -l that page soon now
(2:08:28 PM) RP__: fray: Its the potential network bandwidth of the build
logs
(2:08:42 PM) khem: I think current oe servers cant handle the data that
comes in does LF/yocto has some bandwidth for such
(2:08:44 PM) Tartarus: (/me checks, 880 combos)
(2:09:06 PM) Tartarus: and yeah, if the logs aren't compressed, that too can
be an issue
(2:09:10 PM) fray: ok
(2:09:23 PM) stefan_schmidt: I have to leave now.
(2:09:29 PM) Tartarus: So, for 11
(2:09:33 PM) khem: stefan_schmidt: gn
(2:09:35 PM) Tartarus: Shall we move to the ML for further discussion?
(2:09:44 PM) khem: Tartarus: ok
(2:09:47 PM) fray: ya I think thats good
(2:09:48 PM) stefan_schmidt: night all
(2:09:54 PM) fray: night!
(2:09:59 PM) RP__: 'night all!
(2:09:59 PM) stefan_schmidt left the room (quit: Quit: Leaving).
(2:10:36 PM) koen: do we want to do 12 and 13?
(2:10:39 PM) Tartarus: nope
(2:10:44 PM) Tartarus: call it a meeting
(2:10:49 PM) khem: yes
(2:11:00 PM) khem: I need to leave too
(2:11:16 PM) Tartarus: koen, do start 12 and 13 ont he ML however, please :)
(2:11:25 PM) koen: :)
(2:11:34 PM) fray: I'm interested in 13 -- especially for eglibc
configurations
(2:12:00 PM) Tartarus: fray, note that it's already implemented, it's about
what should be done about it and sane defaults and so on
(2:12:09 PM) Tartarus: eglibc is still defaulting to everything on
(2:12:20 PM) fray: yes -- thats what I'm interested in figuring out..
(2:12:20 PM) Tartarus: uclibc however turns off and on stuff based on
DISTRO_FEATURES
(2:12:31 PM) Tartarus: which (a) lacks docs and (b) causes breakage at times
(2:12:36 PM) fray: they key thing is how to control the configurations --
how to override them
(2:12:37 PM) Tartarus: ie libcap2
(2:13:13 PM) Tartarus: It may or may not be done in a way that's good for
distributions that use feeds and so on
(2:13:17 PM) khem: Tartarus: such things are distro policy
(2:13:18 PM) Tartarus: But should work for those that don't
(2:13:27 PM) fray: (this BTW is something I'll mention as a responds on the
mailings list)  but in the past I'd looked into some of the eglibc
configurations being virtual provide and requires.. but that can get
extensive going through the system and documenting.. but hacking on autoconf
can help with that
(2:13:28 PM) khem: if console-image does not build for micro no big deal
(2:13:28 PM) Tartarus: iee, off to the ML already :)
(2:13:51 PM) khem: it should be able to build whateever image its intended
to build
(2:14:04 PM) Tartarus left the room.
(2:14:08 PM) fray: it's pretty easy, at least on the surface, to figure out
which eglibc changes affect APIs, and which don't
(2:14:11 PM) khem: i.e. slugos is same I would not expect console-image to
build for slugos distro
(2:15:47 PM) khem: fray: eglibc configuration look in OE
(2:16:06 PM) khem: I have used the same config that eglibc defactored itself
into
(2:16:21 PM) khem: they can be added/deleted by distro policies I think
(2:16:41 PM) khem: oe-core would not be the right place
(2:16:49 PM) khem: to define that IMO
(2:17:26 PM) khem left the room.
(2:24:58 PM) fray: oe-core needs to have the mechanism.. but the
configurations become the properties of the distro configus
(2:25:16 PM) fray: that to me is the important bit.. having the mechanism
consistent..
(2:26:03 PM) fray: the default configuration in oe-core should just be that,
the default -- match "glibc"



-- 
Jeff Osier-Mixon
Yocto Community Manager @Intel

