Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1RTHVD-0003ba-GN; Wed, 23 Nov 2011 19:24:59 +0100
Received: by yenm2 with SMTP id m2so1734086yen.6
	for <multiple recipients>; Wed, 23 Nov 2011 10:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=bMvN+3ijgG23JjmqaUrTDOlmNjCBr6usW99VX1vx2Ak=;
	b=xVPw9302IRgaRHeap6Qp7OpHIpN/ODhO8A71MI9kuvZmvRt7xWm8qbVfs3SiwbyYpX
	xBiABQbO0yXGb4FC/u//VoXCfvMRFiOvDUFFCQpBK5vh+3BgOa4qPsWxU94+ffpdB2Ch
	gdUvVC76EeBuADN26bWD43qmtCX+7BLcaezhc=
MIME-Version: 1.0
Received: by 10.50.194.231 with SMTP id hz7mr31583572igc.7.1322072303112; Wed,
	23 Nov 2011 10:18:23 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.50.187.225 with HTTP; Wed, 23 Nov 2011 10:18:23 -0800 (PST)
Date: Wed, 23 Nov 2011 10:18:23 -0800
X-Google-Sender-Auth: VlRULd52SCA48m5IHgF0EW4u9jg
Message-ID: <CA+YB3rZzq1zu9UCqZo4H4OypRdPyRObzahLjejp-qxXbzum+aw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OpenEmbedded TSC Meeting 17-Nov-2011
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
X-List-Received-Date: Wed, 23 Nov 2011 18:25:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded TSC Meeting 17-Nov-2011

Attended: Richard, Tom, Mark, Khem
Apologies: Koen
Minutes: Jefro

__________________________________________________________________
Agenda & results:

- pick a chairperson
fray

- collect open issues
--- revising TSC meeting time & day
[all] discuss on tsc mailing list
--- PACKAGECONFIG
general agreement, some concerns - continued next meeting with Koen

- action items from prior meetings:
--- publish GA proceedings (Jefro)
done
--- release bitbake 1.14.0 when servers return (RP)
done (tarballs available on Yocto servers)
--- continue oe-lite discussion on mailing list (RP)
not done, continued
--- summarize process for folding features into oe-core on wiki (fray)
not discussed - continued to next meeting

- discussion issues left from prior meetings:
--- review tools (khem)
khem to study gerritt
--- "OE classic read only" thing (koen)
not discussed - continued to next meeting
--- TSC responsible for setting up OEDEM?
suggest ELC-US is a good time for at least a half-day session
[Jefro] offer Yocto's help to board in setting up

- status updates
--- elections
[RP] ping board on next election, Koen to stand
--- oe-core
lots of good uptake, green builds, release close
--- infrastructure
berlios disappearing
[Jefro] investigate putting bitbake docs on Yocto server

__________________________________________________________________
Raw transcript:

(1:02:56 PM) Jefro: we have RP, fray, and Tartarus, khem won't be here for
1/2 hr, and koen is zzzzz
(1:03:13 PM) RP__: and Jefro shared an agenda :)
(1:03:26 PM) Jefro: heh, yes - any other new agenda items?
(1:03:44 PM) RP__: There was talk about PACKAGECONFIG on the mailing list.
Sadly Koen isn't here to talk about it
(1:03:52 PM) Tartarus: Yes, that's a problem :(
(1:04:00 PM) RP__: I'm not sure there was a pressing need to take it to the
TSC tbh
(1:04:11 PM) Tartarus: I think there is
(1:04:19 PM) fray: I think we just need an official policy recommendation
and make sure it's followed..
(1:04:26 PM) fray: right now, it's not clear to me there is due to the
discussion
(1:04:28 PM) RP__: Jefro: put it on the agenda then
(1:04:31 PM) Jefro: ok
(1:04:33 PM) Tartarus: Or at least to confirm that when we as the TSC said
"don't see a problem", we also said "so, we'll do this rather than
splitting recipes and such"
(1:04:41 PM) ***fray notes that his AI from last meeting didn't get done..
:P
(1:05:04 PM) Jefro: meeting officially opened? who wants to chair today?
(1:05:19 PM) RP__: Jefro: I can?
(1:05:25 PM) fray: I'm willing to...  but need the current agenda.. ;)
(1:05:31 PM) Jefro: RP__ does it all the time :)
(1:05:42 PM) RP__: Jefro: fray can then ;-)
(1:05:46 PM) RP__: fray: check email?
(1:05:57 PM) Jefro: fray: agenda here: http://pastebin.com/x7CM1mZr
(1:06:11 PM) fray: excellent
(1:06:29 PM) fray: ok.. were there any changes from the previous discussion?
(1:06:44 PM) fray: (we're done w/ pick a chair person)
(1:07:03 PM) fray: and I assume collect open issues is now done?  anyone
have anything to add?
(1:07:11 PM) ***RP__ doesn't have anything
(1:07:36 PM) fray: should we discuss the open isues now then?
(1:07:44 PM) RP__: I'd suggest we do touch on PACKAGECONFIG and at least
agree (or disagree) on where we're at
(1:08:18 PM) fray: My view is that the distro creator is the one who sets
the policies for the distro and packages (packageconfig)..  this produces
the feeds necessary for the final environment..
(1:08:31 PM) fray: so with that said, I think using the packageconfig  vs
splitting packages is the right answer for most issues..
(1:08:47 PM) fray: (there will always be exceptions of course...)
(1:09:00 PM) RP__: We tried a split with avahi and I've just filed a bug
about some issues that is causing :(
(1:09:11 PM) RP__: avahi-ui overwriting files in the sysroot
(1:09:59 PM) RP__: In my view PACKAGECONFIG is the only proposal that has
been put forward that allows the user or the distro to control the recipe
feature set in a scable way
(1:10:17 PM) RP__: We did screw up in the proposed path on the mailing list
only that the defaults weren't maintained
(1:10:25 PM) fray: the only downside I see to packageconfig is it (may)
become harder to document and control all of the possible settings..
(1:10:46 PM) RP__: fray: I think its self documenting, my bigger worry is
testing
(1:11:03 PM) RP__: Yocto can only commit to testing one combination at this
point, likely the default
(1:11:16 PM) fray: My current opinion is to favor "distribution flags" when
appropriate -- when it's unique to a recipe packageconfig is the preferred
approach at controlling things.. and if it is reasonable we allow package
splits..
(1:11:45 PM) fray: I don't think I have a current example for package
splits, but I know I've needed to do it in the past for various reasons
where something like packageconfig wasn't the best idea..
(1:11:46 PM) RP__: Tartarus: any thoughts?
(1:12:14 PM) fray: RP__ as far as testing goes, I think testing the default
is reasonable -- as Yocto will test their configurations.. just like I
would expect others to test there own as well..
(1:12:18 PM) ***RP__ finds the package splitting code to me unnatural
feeling :/
(1:12:28 PM) Tartarus: Sorry, phone
(1:12:29 PM) fray: unit tests on alternativve configurations (by the author
of the change) should be expected before checkin of course
(1:12:39 PM) Tartarus: So, here's where there's something we need to talk
more about when Koen is available
(1:12:46 PM) Tartarus: PACKAGECONFIG is 'ok'
(1:13:03 PM) Tartarus: And even if we don't want to call it a USE flag, the
policy about when to use it vs when to split a recipe isn't clear
(1:13:27 PM) Tartarus: And apparently there was some decision made, or
implicit requirement of PACKAGECONFIG, or maybe just something some of us
spaced on when reading
(1:14:18 PM) fray: One place I've split in the past is when a single source
package provides a set of very different target functionality..  I've split
it then to only build the logical chunks..  (wether that is our policy or
not we can discuss..  but that is one place where a split seems logical to
me vs a packageconfig type change)
(1:14:46 PM) RP__: Tartarus: ok, so you want to leave this at this point
until Koen is here?
(1:14:50 PM) Tartarus: Yes
(1:14:57 PM) fray: ok.. tabled then..
(1:15:12 PM) RP__: no point in continuing :(
(1:15:15 PM) fray: do we want to discuss the TSC meeting and day -- or wait
until Koen and Khem can chime in
(1:15:29 PM) RP__: fray: seems pointless without them too
(1:15:38 PM) Jefro: note: you guys can discuss this with koen in an email
thread outside the scope of the meeting
(1:15:41 PM) fray: ok.. so that is tabled as well..
(1:15:44 PM) fray: on to the action items..
(1:15:55 PM) RP__: Jefro: I've been trying that on the mailing list
(1:15:56 PM) fray: I'm last on the list.. but I forgot about it.. so please
leave it on the list
(1:16:21 PM) RP__: GA proceedings were published iirc
(1:16:28 PM) RP__: bitbake 1.14 was released
(1:16:37 PM) RP__: oe-list discussion has not happened, bad RP :(
(1:16:43 PM) RP__: er, oe-lite
(1:16:55 PM) fray: 'k
(1:17:01 PM) fray: prior meeting then?
(1:17:14 PM) fray: review tools -- khem isn't here.. so table for a bit?
(1:17:20 PM) RP__: fray: yes
(1:17:30 PM) RP__: and the OE classic can be tabled
(1:17:33 PM) fray: oe classic says koen -- do we have enough to talk about
or table..
(1:17:36 PM) fray: ok.. tabled
(1:17:39 PM) fray: then TSC and OEDEM
(1:17:41 PM) RP__: We're seeing more people switch over so I'd say things
are moving ok
(1:18:00 PM) fray: RP__ ya, I've seen more people switch to OE-core then I
had expected by now.. so I'm happy with the uptake
(1:18:09 PM) RP__: I know the board was surprised we discussed OEDEM
(1:18:17 PM) RP__: they seem to think its not in our remit
(1:18:37 PM) RP__: I think we can talk about it but any decisions do lie
with them
(1:18:37 PM) Jefro: FWIW, I think that was the question at hand - whether
it is the TSC's job
(1:19:12 PM) RP__: we can make any recommendation we like to the board,
whether they take any notice of us or find it helpful is a different matter
:)
(1:19:14 PM) fray: I can't say I have a strong opinion either way
(1:20:09 PM) RP__: I think we can say that having half a day around ELC
time to get OE people together and talk about OE could be useful
(1:20:09 PM) fray: do we have anything to discuss about oedem right now?
(1:20:18 PM) fray: RP__ agreed!
(1:20:31 PM) fray: I think ELC (US) is the right time to do it as well..
(1:20:36 PM) ***Jefro could volunteer to help set something up - and I can
talk to the board about it
(1:20:59 PM) RP__: but we're not resourced to organise that so perhaps we
can pass that sentiment to the board and Yocto and see if they can make
anything happen?
(1:21:25 PM) fray: I think Jefro should offer to help the board and go from
there then..
(1:21:39 PM) RP__: Jefro: ok with you?
(1:21:40 PM) Jefro: works for me
(1:21:48 PM) RP__: Tartarus: any objections?
(1:21:54 PM) Tartarus: hm
(1:22:14 PM) Tartarus: sounds fine
(1:22:38 PM) fray: ok.. status updates -- elections
(1:22:48 PM) RP__: are we due another one sometime soon?
(1:22:49 PM) fray: who was next on the list, and I think it's time we need
to remind the board correct?
(1:23:04 PM) Jefro: names were in alpha order as I recall
(1:23:04 PM) fray: I thought Oct or early november was the next time.. but
I may be off 30 days
(1:23:15 PM) fray: I'm next then?
(1:23:24 PM) RP__: fray: Koen I think?
(1:23:36 PM) RP__: was it surname or first name?
(1:23:37 PM) fray: duh.. ya you went first..
(1:23:43 PM) RP__: it was in some minutes
(1:23:50 PM) Jefro: Koen, I think - I believe it was first names (after
Richard)
(1:23:51 PM) fray: I think it was first name.. but I don't care  ;)  (ya
early minutes had the order)
(1:24:36 PM) fray: ok.. oe-core status?
(1:24:42 PM) fray: (or did we not finish that)
(1:25:03 PM) RP__: ok, who will ping the board?
(1:25:22 PM) fray: RP__ seems like you usually do it.. )
(1:25:23 PM) fray: ;)
(1:25:32 PM) RP__: ok, just wanted to be clear :)
(1:25:44 PM) RP__: oe-sore status - I've been working on stability
(1:25:57 PM) RP__: we nearly have green builds which we haven't had for a
while rather depressingly
(1:26:15 PM) RP__: (the green bit is not depressing though)
(1:26:19 PM) khem [~khem@99-57-141-118.lightspeed.sntcca.sbcglobal.net]
entered the room.
(1:26:19 PM) mode (+v khem) by ChanServ
(1:26:27 PM) RP__: A lot of good changes have been made
(1:26:38 PM) RP__: and god fixes have gone in
(1:26:40 PM) fray: Do you have a general feeling on what has been happening
with oe-core to prevent the green builds -- simply change rate or is it
something we can better control?
(1:27:04 PM) RP__: fray: chain reaction bugs
(1:27:15 PM) fray: ya, thats what I thought I've seen mostly -- but wasn't
sure
(1:27:18 PM) RP__: fray: A broke which exposed B, then we found C etc
(1:27:31 PM) RP__: and A, B and C were all very valid things that needed
fixing
(1:27:36 PM) RP__: otherwise I would have reverted
(1:27:57 PM) RP__: There are also some toolchain issues on armv7 atm
(1:28:04 PM) fray: ok.. I just want to make sure that if we're seeing
problems we have a general feeling of the cause what we can do to avoid
them (if possible)
(1:28:09 PM) RP__: but I think Khem has a fix in mind for that now
(1:28:17 PM) khem: yes I do
(1:28:20 PM) khem: :)
(1:28:20 PM) fray: I know Khem had submitted some toolchain updates a while
back -- did those go in yet?
(1:28:28 PM) khem: they went it
(1:28:30 PM) RP__: fray: I'm asking Yocto people to try and get tighter
feedback loops on the autobuilder breakage
(1:28:34 PM) khem: they dont fix it
(1:28:38 PM) RP__: they broke things
(1:28:39 PM) fray: good.. then that was fairly painless since I didn't see
it.. ;)
(1:28:39 PM) RP__: ;-)
(1:29:12 PM) fray: ok.. done w/ the oe-ore status update?
(1:29:13 PM) RP__: I guess one question for a random sample poll - we have
some changes in bitbake such as the new "appendVar" function
(1:29:33 PM) RP__: are we ok with updating with bitbake version fairly
closely to get fast use of these things
(1:29:49 PM) RP__: or do we want to wait with bitbake until we really need
to update and delay that adoption for now
(1:29:54 PM) fray: I'm ok with updating "master" oe-core to use features of
newer bitbake..
(1:30:14 PM) RP__: welcome khem btw :)
(1:30:19 PM) khem: thx
(1:30:24 PM) khem: I have to leave soon though
(1:30:30 PM) RP__: Also, there are various sed type replacement cleanups I
could make on oe-core
(1:30:31 PM) khem: since I mismanaged the time
(1:30:50 PM) RP__: I pushed on already, are we willing to see more to get
certain code details cleaned up?
(1:30:53 PM) fray: I'm all for cleanups as well...
(1:31:18 PM) fray: with oe-core "release" being close behind us.. I'm
willing to let breakage happen a bit more right now then say in 2-3 months
(1:31:22 PM) RP__: khem: please read the logs when you get a chance and
comment on anything you need to...
(1:31:30 PM) Tartarus: Yes, if we need to break stuff, now is the time
(1:31:37 PM) RP__: fray: I think now is a good time, yes
(1:31:41 PM) khem: RP__: yes I will
(1:31:52 PM) RP__: Some of this is things like s/1/True/
(1:32:07 PM) RP__: which is kind of trivial but also kind of not
(1:32:28 PM) RP__: We did get a 1.5% parsing speedup from the last sed
operation too :)
(1:32:34 PM) fray: ya.. we want to clean that up -- as part of any cleanup,
what about meta-oe.. I think it makes sense to run any cleanup scanning
against it, and at least report issues.. (prefer to fix them of course, but
that may not always be possible)
(1:32:36 PM) fray: nice
(1:33:04 PM) RP__: (less python function indirection)
(1:33:23 PM) fray: ok.. lets circle back o the review tools with khem's
name on it
(1:33:27 PM) RP__: fray: I'm posting the sed commands in the commits. If
people want to apply them against layers they can
(1:33:38 PM) khem: fray: I have not done much since last 3 weeks
(1:33:48 PM) khem: I read a few about review board
(1:33:54 PM) khem: I kind of liked it
(1:34:06 PM) khem: have to study gerrit
(1:34:20 PM) khem: nothin more on that so far
(1:34:48 PM) RP__: fray: we can keep it on the agenda
(1:34:50 PM) fray: at this point any feeling on if something like review
board would be good for us -- or havn't gotten to that point yet
(1:34:55 PM) fray: ya, I think we should as well
(1:35:02 PM) khem: I dont think I have
(1:35:05 PM) fray: 'k
(1:35:11 PM) khem: but I think it will be a process change
(1:35:18 PM) khem: and developers have to get used to it
(1:35:23 PM) fray: I'm certainly for process -- when it helps..
(1:35:40 PM) RP__: The question is whether we have something that is broken
and needs fixing
(1:35:45 PM) fray: (I just hate rigid process that gets in the way)
(1:35:48 PM) khem: since a lot of patch review discussions will move away
from ml
(1:36:07 PM) fray: khem, I like the ml discussions..
(1:36:14 PM) fray: seems to be a faster way to track and comment on changes
(1:36:22 PM) khem: yes I think we have to evaluate at the end if the tools
and process we have currently is efficient enough for us
(1:36:24 PM) fray: but that doesn't mean we should keep looking at tools
(1:36:32 PM) RP__: I get the feeling that our workflow is still getting
established at this point. People are starting to join in with review which
is nice
(1:36:43 PM) fray: RP__, ya I've noticed that as well..
(1:37:27 PM) fray: if I were to suggest anything it's that the intro file
to patch sets would be a bit more ridgidly formed.. i.e. "this is the
summary" "this is the overall description of the changes" "this is what/how
I tested -- or if testing wasn't necessary"
(1:37:31 PM) fray: something like that..
(1:37:44 PM) fray: (at WR we have what architectures are affected and what
were tested also in our internal review requests)
(1:37:57 PM) ***RP__ keep meaning to recommend we put bug ids at the end of
messages
(1:38:09 PM) fray: the checkbox format makes it really easy to tell if the
submitter considered something or not by the reviewer
(1:38:10 PM) RP__: having them after the summary annoys me for some reason
(1:38:14 PM) khem: I think suggesting more details is good
(1:38:40 PM) RP__: khem: I've been trying to encourage that (as have a few
others)
(1:38:45 PM) fray: easy way to suggest the details -- if we choose to
update the review process like that -- is to enhance the
create-pull-request script
(1:38:59 PM) khem: however if we want more info we should also help provide
tools to generate that info easily
(1:39:11 PM) khem: since I have seen the commit process becomes to
cumbersome with many demands
(1:39:26 PM) RP__: the other way of getting better details is for me to
reject patches which don't have them
(1:39:33 PM) RP__: I'm trying to be fair :)
(1:39:45 PM) khem: e.g. a patch with lor of information can get more
attention
(1:39:46 PM) fray: at WR -- our equivalent of the create-pull-request
simply puts in a template that can change over time..  the developer is
expected to open the file 0000 w/ an editor and fill out the template..
they don't it's rejected by the reviewers/maintainers.. :)
(1:40:08 PM) fray: I think as far as patch reviews go -- the reviews and
people asking for more information has been good..
(1:40:22 PM) fray: but I've often wondered if the submitter has considered
more then say "arm" when they've done their work..
(1:40:32 PM) khem: fray: its probably a difference with community and corp
:)
(1:40:41 PM) fray: ya, absolutely..
(1:40:54 PM) fray: I'm willing to share the WR template with the TSC/OE
community and adjust as appropriate..
(1:41:12 PM) khem: certainly that would help guide the submitters
(1:41:25 PM) khem: and encourage them to take interest
(1:41:53 PM) RP__: lets just be careful not to add too much process
(1:42:05 PM) fray: RP__ process for the sake of process is wrong..
(1:42:08 PM) khem: OK I have to make a move now. See you all
(1:42:14 PM) fray: NP..
(1:42:14 PM) RP__: I think gentle pressure on people to improve over time
and to lead by example might help
(1:42:23 PM) khem: I will read the proceedings later
(1:42:33 PM) RP__: khem: ok, ttfn!
(1:42:37 PM) fray: jefro, lets put on the agenda for next time to review
the WR review template.. and see if anyone is interested..
(1:43:08 PM) Jefro: ok
(1:43:33 PM) fray: I know some of it isn't applicable for the OE
work/reviews.. but it might spark ideas or simply be something to watch for
as we evolve..
(1:43:49 PM) fray: ok.. enough of that.. last item was infrastructure
status..
(1:44:16 PM) fray: Is there anything to report -- anything causing us
issues or we're still waiting on?
(1:44:48 PM) RP__: we just lost the person best able to comment
(1:44:52 PM) RP__: I'm not seeing issues
(1:45:03 PM) RP__: I put the bitbake tarballs on yocto's infrastructure for
now
(1:45:16 PM) RP__: We'll lose berlios at the end of the year
(1:45:25 PM) fray: is that an oe infrastructure issues or just bitbake
still needs to transition?
(1:45:27 PM) RP__: I'm not aware of anything important being left there
(1:45:34 PM) Jefro: question - where is the bitbake documentation going
after berlios shuts down?
(1:45:49 PM) RP__: Jefro: it isn't but its way out of date anyway
(1:46:08 PM) RP__: Jefro: we should share it somewhere but its going to
take someone to step up and do it
(1:46:13 PM) RP__: or yocto could...
(1:46:19 PM) Jefro: needs to be some sort of docs, I would think.  yocto
could host.
(1:46:35 PM) fray: The docs are in bitbakes git tree or external?
(1:46:42 PM) RP__: fray: bitbake tree
(1:46:52 PM) RP__: fray: but sharing a compiled version would be nice
(1:47:05 PM) RP__: I'm willing to suggest Yocto publishes them
(1:47:20 PM) fray: seems reasonable..
(1:47:20 PM) RP__: but I could be seen as biased :/
(1:47:25 PM) Jefro: :) me too
(1:47:38 PM) RP__: Jefro: can you talk to Scott and put it on the agenda
for the next TSC meeting
(1:47:48 PM) Jefro: will do - I"m meeting with Scott in about 1/2hr
(1:47:49 PM) fray: shouldn't be hard to make a version that can be
published via OE's servers as well.. but I'm not sure how easy that is
within the wiki (directly) -- or if there is another resource
(1:48:06 PM) RP__: since this one was such a failure with people missing I
think we need to probably hold another again soon :/
(1:48:28 PM) fray: should we try for next Thursday.. and ask if people have
a better time on the TSC mailing list?
(1:48:35 PM) RP__: fray: could do
(1:48:47 PM) fray: ok.. lets do it that way.. who's going to send the base
email out..
(1:48:50 PM) fray: (I can do it if you like)
(1:48:55 PM) RP__: fray: go for it
(1:48:59 PM) fray: ok.. will do
(1:49:02 PM) ***RP__ has sent email to the board about elections
(1:49:47 PM) fray: 'k..  with that AI to send an email to the TSC list...
(1:49:49 PM) fray: anything lse?
(1:49:57 PM) fray: anything -else-?
(1:50:11 PM) RP__: I can do any time before this on Thursday except 9-10
PST (5-6UK)
(1:50:36 PM) RP__: fray: nothing from me
(1:51:36 PM) fray: ok.. unless there are objctions.. meeting over.. I'll
send the email in a few
(1:52:14 PM) Jefro: noted - thanks all
(1:55:41 PM) fray: Next thursday is Thanksgiving in the US.. :(
(1:55:44 PM) fray: so that is a no go
(1:55:54 PM) fray: most people also seem to have Friday off as well..
(1:55:57 PM) fray: I'll mention in the email
(1:59:01 PM) Jefro: Ha - I didn't even think of that

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

