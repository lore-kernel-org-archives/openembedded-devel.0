Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1RpkfS-00013I-VE; Tue, 24 Jan 2012 19:00:27 +0100
Received: by iabz21 with SMTP id z21so7131237iab.6
	for <multiple recipients>; Tue, 24 Jan 2012 09:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=1vi7s3f037JgtEGvbgPovdpERsv5kbOmzz4N7LVGt4Q=;
	b=YxmyVPaq41TFv+Hr3jlENJSp5M8gE8ETkmPBpRy8xU6cIHVrM2eMTewy86Wr7PNZXG
	mYr/RJQ5RmY9xi1P7QQJT73mlaJfYT6+EapxKkevJObgr4LB3RsDi5roYU5vt8s7Frp1
	8y+gi0LjS9RNuAsyZdA2ksfuZAG+7KuIbrcZo=
MIME-Version: 1.0
Received: by 10.50.202.105 with SMTP id kh9mr3214690igc.3.1327427560670; Tue,
	24 Jan 2012 09:52:40 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.50.203.1 with HTTP; Tue, 24 Jan 2012 09:52:40 -0800 (PST)
Date: Tue, 24 Jan 2012 09:52:40 -0800
X-Google-Sender-Auth: 7amTLNSqpJ_AaQJuTsdHR2udYFw
Message-ID: <CA+YB3rYjxo4+S56zSbjv_89Snaie5eocFM=YvcFr3u-L+bvcmg@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OE-TSC Minutes: 17-Jan-2012
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
X-List-Received-Date: Tue, 24 Jan 2012 18:00:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
17 January, 2012

Attending: Paul, Richard, Tom, Mark
Apologies: Khem
Notes: Jefro

Agenda & results, action items marked with =>

pick a chair
->Jefro

new issues
  elections
->fray is next
=>RP will tickle board

  distro features
=>all to reply to paul's email
->subject: Re: [OE-core] [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE

  TSC meetup at ELC
=> jefro to set up breakfast Thurs morning 8am

  Status report on oe-core
  stabilized, then a load of changes
  qemuppc somewhat unstable, being worked on
=>stabilisation release cycle for April release
=>communicate to oe-core list in late Feb, agendize
->plan is to watch situation, open up for M3 if stab trends better

Further discussion - trivial patches
-> watch and adapt as necessary

Infrastructure
-> servers a bit slow

Action Review:
   Khem/Fray: Flagging on wiki for OE version
-> deferred to next meeting
   Fray: Yocto non-gplv3 testing
-> WR test team said that it is in their test plan, but something was
blocking their tests, should be fixed now
   Khem: OE default source mirror
-> deferred to next meeting

Raw Transcript:

(8:57:08 AM) ***RP__ notes meeting in 5 mins
(8:57:12 AM) Jefro: morning all
(8:57:25 AM) RP__: hi Jefro!!!
(8:57:30 AM) RP__: We've missed you :)
(8:58:14 AM) bluelightning [~paul@pdpc/supporter/professional/bluelightning]
entered the room.
(8:58:21 AM) Jefro: aww, that's sweet :)
(8:58:21 AM) bluelightning: hi folks
(8:58:34 AM) RP__: hi bluelightning
(8:58:43 AM) RP__: fray: awake? :)
(9:02:02 AM) RP__: Jefro: do we have an agenda?
(9:02:26 AM) Jefro: gah - I never sent out minutes from last meeting,
though I did get acks - will send now
(9:02:34 AM) Jefro: yes, we have several items left over from last time
(9:03:12 AM) Jefro: http://pastebin.com/NPwpchVf
(9:03:51 AM) RP__: Jefro: I was just wondering why I couldn't find that
list :/
(9:04:34 AM) ***Jefro is :S
(9:04:36 AM) Tartarus [trini@pixelshelf.com] entered the room.
(9:04:37 AM) mode (+v Tartarus) by ChanServ
(9:05:04 AM) RP__: ok, just khem missing
(9:05:14 AM) RP__: Jefro: best add elections to the agenda
(9:05:28 AM) RP__: We're no doubt overdue another one :/
(9:05:51 AM) Jefro: isn't it every 2 months for those?
(9:05:54 AM) RP__: fray:  Is next iirc?
(9:06:11 AM) RP__: Jefro: two months from the start of the last election or
the end?
(9:06:24 AM) ***RP__ suspects it was from the start :/
(9:06:26 AM) Jefro: beats me - up to the board I guess, but someone should
tickle them
(9:06:31 AM) Jefro: added to agenda
(9:06:35 AM) RP__: I can do that
(9:07:14 AM) Jefro: noted
(9:07:42 AM) Jefro: Tartarus & fray, are you here or just ghosts?
(9:07:47 AM) Tartarus: here now
(9:08:01 AM) ***RP__ has pinged fray here and elsewhere :/
(9:08:13 AM) Jefro: cool - Tartarus RP__ bluelightning are here, fray is a
ghost - but we have a quorum. no koen?
(9:08:18 AM) RP__: Jefro: we should also have DISTRO feature son the agenda
from bluelightning
(9:08:26 AM) RP__: Jefro: bluelightning replaced koen
(9:08:30 AM) Jefro: ah, ok
(9:08:37 AM) RP__: we're missing khem
(9:08:51 AM) Jefro: I'll ping him
(9:10:42 AM) Jefro: pinged, no response yet
(9:10:59 AM) Jefro: I suggest starting - anyone want to chair? I haven't
done it in a while :)
(9:11:18 AM) RP__: Jefro: well volunteered ;-)
(9:11:41 AM) ***Jefro notes Jefro as chair
(9:11:58 AM) Jefro: I think elections have been covered (RP__ to ping the
board)
(9:12:03 AM) Jefro: next is distro features from bluelightning
(9:12:21 AM) fray: sorry I'm late
(9:12:39 AM) bluelightning: so, I had one response on the distro features
thing from phil, basically he likes RP__'s approach in all respects
(9:12:40 AM) RP__: so we last agreed to push discussions on the mailing list
(9:12:41 AM) Jefro: fray it will be deducted from your salary
(9:12:48 AM) fray: As for elections, I think I am next..
(9:12:57 AM) bluelightning: I was hoping for more response but I did only
ping yesterday
(9:13:13 AM) RP__: Can we all agree to reply to bluelightning's email?
(9:13:20 AM) bluelightning: that would be nice :)
(9:13:29 AM) RP__: I would like the discussion on the mailing list
(9:13:32 AM) ***Jefro notes an AR for everyone
(9:13:33 AM) RP__: bluelightning: mail subject?
(9:13:50 AM) bluelightning: one sec
(9:13:59 AM) bluelightning: Re: [OE-core] [PATCH 0/3] Make pulseaudio a
DISTRO_FEATURE
(9:14:21 AM) bluelightning: I guess the title is not exactly drawing people
in
(9:14:40 AM) bluelightning: (it's now expanded well beyond pulseaudio)
(9:14:47 AM) fray: :)
(9:14:48 AM) RP__: bluelightning: lets just get a few more replies and see
if we can get it resolved
(9:14:57 AM) bluelightning: ok, I'm happy with that
(9:14:58 AM) ***RP__ will change the subject when he replies
(9:15:11 AM) fray: (BTW I did have one additional item for the agenda --
ELC, an in person OE-TSC meeting?)
(9:15:32 AM) RP__: fray: might as well move to discuss that now
(9:15:34 AM) ***Jefro notes agenda item
(9:15:37 AM) RP__: will everyone be there?
(9:15:40 AM) ***RP__ will
(9:15:40 AM) ***Tartarus will be
(9:15:41 AM) ***bluelightning will not be at ELC, fwiw
(9:15:45 AM) fray: I am trying to be..
(9:15:58 AM) RP__: and Khem is relatively local
(9:16:09 AM) RP__: so I suspect he may be there
(9:16:41 AM) RP__: getting together in person even if its not an official
meeting might be an idea, assuming Paul doesn't object
(9:16:47 AM) Jefro: I have talked with Khem, he plans to be there (and to
speak if his talk is selected)
(9:17:07 AM) Jefro: I can arrange a phone to call Paul
(9:17:11 AM) fray: even if I don't end up going to ELC, I can likely make
it there for a face-to-face..
(9:17:13 AM) RP__: fray: anything specific you wanted to discuss?
(9:17:25 AM) ***bluelightning has no objections
(9:17:25 AM) fray: nope.. just thought it would be a good idea to get
together in person again..
(9:17:50 AM) Jefro: I have some insight into scheduling, which may make a
difference for travel
(9:17:54 AM) RP__: We could talk about future OE directions and Paul via
phone might work
(9:18:09 AM) RP__: Jefro: do you want to highlight that?
(9:18:15 AM) RP__: er, summarise that now
(9:18:17 AM) bluelightning: yep, should be OK as long as it's not
ridiculous AM UK time :)
(9:18:18 AM) Jefro: Tues 2/14 will be a Yocto Project Developer Conference
from 9am until probably 5pm
(9:18:26 AM) fray: a "year in review" might not be a bad idea either..
(9:18:31 AM) RP__: bluelightning: its two geo so should be managable
(9:18:32 AM) fray: based on what we discussed last year in person
(9:19:04 AM) Tartarus: elc itself is like 15-17 or something, yes?
(9:19:16 AM) RP__: Tartarus: yes
(9:19:19 AM) Tartarus: i'm doing morning in, evening out on the dates itself
(9:19:20 AM) Tartarus: fwiw
(9:19:21 AM) Jefro: Weds - Fri is regular ELC. Thurs 10am-1pm is Yocto AB
meeting, Fri 10am-2pm is another meeting that RP__ and I will likely be
rquired to attend, and fray if he is there
(9:19:25 AM) ***RP__ is flying in on Monday, back on Sunday
(9:20:10 AM) Jefro: Weds evening is probably a LF social event
(9:20:40 AM) Jefro: (schedule should be announced end of this week or
beginning of next - I'm on the program committee)
(9:21:01 AM) Jefro: is breakfast too early?  it is for me, but I could make
an exception (once)
(9:21:01 AM) RP__: Tartarus: would you change plans to attend the Yocto
Developer conference on the 14th ?
(9:21:20 AM) RP__: Jefro: that might be the best option, maybe on Thurs
(9:21:30 AM) ***RP__ will be jetlagged and have no clue about time anyway
(9:21:30 AM) Tartarus: RP__: Hard to say, I'm doing SCaLE this week so I'll
see how the family survives with me gone for 3 days
(9:21:35 AM) Tartarus: and then see what I can do from there
(9:21:37 AM) Jefro: early PST would enable us to call Paul at a decent time
also
(9:21:50 AM) RP__: Jefro: indeed
(9:22:40 AM) RP__: Jefro: so maybe 8am Thurs, make it a working breakfast?
(9:22:52 AM) fray: fine with me
(9:22:53 AM) RP__: and if we need extra time we can run into what will
likely be the keynote
(9:23:00 AM) Jefro: worst that can happen is skipping keynotes :)
(9:23:40 AM) ***RP__ is looking like his whole conference will be meetings
(9:23:59 AM) Jefro: I can arrange a room & food, or transportation to a
good breakfast place
(9:24:16 AM) RP__: Jefro: given the phone issue, might need to be a room
(9:24:40 AM) Jefro: probably so - although I have a speakerphone for
cellphone if necessary
(9:24:53 AM) RP__: Jefro: I propose we delegate the details to you ;-)
(9:25:30 AM) ***Jefro notes AR
(9:25:57 AM) RP__: Jefro: thanks :)
(9:26:08 AM) RP__: we can quickly touch OE-Core status next?
(9:26:29 AM) RP__: Basically, we stablised a bit, then today a load of
changes have gone in
(9:26:47 AM) RP__: There are some stability issues with these, particularly
the qemuppc machine change but they are being worked upon
(9:27:04 AM) RP__: hopefully the qemuppc machine change will benefit longer
term
(9:27:19 AM) RP__: biggest pending change would be to change to eglibc 2.15
(9:27:34 AM) RP__: any questions?
(9:27:37 AM) fray: with the stability issue -- are we planning to have a
release cycle any time soon?  i.e. a stabilise and hold off on patches for
a week type thing?
(9:27:57 AM) RP__: fray: well, we just did that for M2
(9:27:59 AM) fray: I haven't heard anyone asking for such at this point..
but time wise it'll be close to 6 months
(9:28:16 AM) RP__: fray: next release is April
(9:28:17 AM) fray: RP__, but not officially on the oe-core...  I'm thinking
back to late last year
(9:28:30 AM) RP__: fray: so the stabilisation will be after M3
(9:28:42 AM) RP__: i.e. we've about six weeks of development left
(9:28:43 AM) fray: ok.. that is what I expected -- we'll want to
communicate that to the oe-core list at some point.. late February?
(9:29:01 AM) RP__: Yes, lets note that on the meeting ARs
(9:29:07 AM) ***Jefro notes
(9:29:12 AM) RP__: send out a warning in 1 or 2 meetings time?
(9:29:25 AM) fray: sounds good to me
(9:30:10 AM) RP__: my immediate plan is to watch the situation but open up
for M3, assuming stability trends to better, not worse
(9:30:23 AM) fray: (ohh and I agree the qemuppc change is worth a little
pain.. it's way better then the previous "machine")
(9:30:39 AM) RP__: fray: totally, I'm just being realistic about the impact
(9:31:23 AM) RP__: If no other comments we can more to trivial patches
discussion?
(9:31:28 AM) RP__: *move*
(9:31:36 AM) Tartarus: k
(9:31:44 AM) ***Jefro time check is ok, 1/2 hr left
(9:32:58 AM) Jefro: whose issue is trivial patches?
(9:33:20 AM) RP__: Jefro: well, its a discussion about how patches get
taken in and over what timeframes
(9:33:42 AM) RP__: I've been experimenting a little taking obvious fixes
faster whilst letting more complicated changes sit for longer for review
(9:33:57 AM) RP__: To me, it seems to be working reasonably, I'm not seeing
complaints
(9:34:09 AM) RP__: but I'm open to other representations
(9:34:26 AM) fray: RP__, I think what you are doing is working
(9:34:55 AM) RP__: We ran out of time at a previous meeting discussing this
(9:35:37 AM) RP__: I'd suggest we continue, see if any issues arise and
deal with them as appropriate
(9:36:00 AM) fray: What I've been looking for is things going in that
people object to.. so far I havn't observed anything out of the ordinary
there..
(9:36:06 AM) fray: if anything it's getting even better
(9:36:56 AM) RP__: Its partly a question of reacting when there are
problems too
(9:37:11 AM) RP__: e.g. we did revert the recent pango fix when problems
arose
(9:37:34 AM) fray: yes, exactly..
(9:37:45 AM) fray: I don't believe this is affecting stability in a
negative way either..
(9:37:50 AM) fray: as you said, we watch and adapt
(9:38:23 AM) RP__: Ok to move on?
(9:38:33 AM) RP__: Not sure we have much to discuss re: infrastructure
(9:38:47 AM) RP__: We have Michael Halsted as a full time sysadmin for Yocto
(9:39:08 AM) RP__: this should enable Yocto to really up its game
infrastructure wise
(9:40:03 AM) RP__: doesn't change OE's situation but probably can help with
knowledge of best practise etc.
(9:40:23 AM) Jefro: were there any lingering issues after the OE server
changes?
(9:40:23 AM) RP__: Which brings us to action review if no other comments
(9:40:34 AM) RP__: Jefro: I do find them slow :/
(9:40:53 AM) bluelightning: I'm getting the impression linuxtogo's servers
are still really struggling, but I don't know that it always affects OE
services
(9:40:54 AM) RP__: Jefro: but I don't have anything to help with that
(9:41:10 AM) RP__: bluelightning: which parts are struggling?
(9:41:15 AM) RP__: bluelightning: repos? emails?
(9:41:27 AM) bluelightning: RP__: their website and wiki are often slow or
unresponsive
(9:41:43 AM) fray: I haven't seen that here in the last couple of days..
(9:41:45 AM) bluelightning: I don't know if they are hosted on the same
servers as OE's website, probably not
(9:42:03 AM) RP__: bluelightning: OE's website and wiki are different
machine
(9:42:10 AM) RP__: OE only uses their email services iirc
(9:42:13 AM) bluelightning: ok
(9:42:32 AM) bluelightning: I've seen some minor delays in bitbake-devel
mails lately but nothing too alarming
(9:42:53 AM) fray: my patches to the oe-core list are coming back within a
minute or so..
(9:43:03 AM) fray: but I haven't been sending out a lot of patche
srecently..
(9:44:01 AM) Tartarus: I have an infra Q, would it be hard to get access
restrictions on branches in oe-classic?
(9:44:53 AM) RP__: Tartarus: depends if OE is using gitolite or gitosis iirc
(9:45:10 AM) Tartarus: too bad khem didn't make it today :(
(9:45:12 AM) RP__: Tartarus: If the latter, it shouldn't be that hard
assuming the hooks are correctly installed
(9:45:52 AM) RP__: Tartarus: its using gitolite :(
(9:46:19 AM) RP__: Tartarus: so a switch to gitosis would be needed
(9:46:23 AM) Tartarus: alright
(9:46:29 AM) Tartarus: lets just hope there's no further accidents then
(9:52:08 AM) RP__: so, action review
(9:52:08 AM) Jefro: recursion loop! everyone out of the boat
(9:52:12 AM) RP__: fray: you're up
(9:52:27 AM) fray: ?
(9:52:28 AM) RP__: (in the absence of Khem)
(9:52:33 AM) fray: ohh gotcha.. sorry
(9:52:34 AM) RP__: Action Review:
(9:52:34 AM) RP__:    Khem/Fray: Flagging on wiki for OE version
(9:52:34 AM) RP__:    Fray: Yocto non-gplv3 testing
(9:52:34 AM) RP__:    Khem: OE default source mirror
(9:52:48 AM) fray: Nothing has progressed on that.. I was held up with a
work project, which is now over..
(9:53:01 AM) RP__: that was simple then
(9:53:01 AM) fray: I'll try to sync w/ Khem today or tomorrow and then go
from there..
(9:53:08 AM) RP__: fray: thanks :)
(9:53:31 AM) RP__: we do need to sort that stuff but its not urgent
(9:53:39 AM) RP__: Any other business?
(9:53:40 AM) Jefro: fray: yocto non-gplv3 testing
(9:54:22 AM) Tartarus: Real quick
(9:54:26 AM) Tartarus: Anyone else going to SCaLE?
(9:54:33 AM) Tartarus: khem isn't, business trip, iirc
(9:54:34 AM) ***RP__ is not
(9:54:36 AM) ***bluelightning is not
(9:54:37 AM) fray: is not
(9:54:49 AM) ***Jefro is not (yocto doesn't have a presence there, sadly)
(9:54:54 AM) Tartarus: OE has a booth
(9:55:01 AM) fray: re non-gplv3 testing.. the WR test team said that it is
in their test plan, but something was blocking their tests (this was a
couple of weeks ago)..
(9:55:01 AM) Tartarus: But I'm not sure if it'll be more than ka6sox and I
(9:55:12 AM) fray: I have not followed up since then to see fi they've been
unblocked..
(9:55:25 AM) RP__: fray: it would be good to understand the block
(9:55:35 AM) RP__: if its related to the codebase anyway
(9:55:48 AM) fray: it was a filed bug (which I don't remember offhand).. I
believe it's been resolved now
(9:56:09 AM) fray: I'll check with them..
(9:56:43 AM) Jefro: last item is khem, can cover next time
(9:56:46 AM) Jefro: any final issues?
(9:57:23 AM) Jefro: sold - next meeting is Jan 31, minutes should be out
today
(9:57:35 AM) RP__: thanks all!
(9:57:47 AM) RP__: and even finished on time :)
(9:57:54 AM) Tartarus: yay, later all :)
(9:57:58 AM) fray: :)  later
(9:58:13 AM) Tartarus: Oh, wait,
(9:58:21 AM) The account has disconnected and you are no longer in this
chat. You will be automatically rejoined in the chat when the account
reconnects.

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

