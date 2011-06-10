Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QV9x0-0000t5-0D; Sat, 11 Jun 2011 00:13:11 +0200
Received: by iye7 with SMTP id 7so2779102iye.6
	for <multiple recipients>; Fri, 10 Jun 2011 15:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=Y7qdPfFzmM6q7sbP13qqPGf/3sztCn91yYxLTPnwEcI=;
	b=T6d66/5k86RIjl+gsPJgko1BZFwy2BxfllwpBSCut+s+XzsnGRdLJplRD2UL7XuWtZ
	+1xgVrtOFhYbwYeMXOteBRdOm4M45t/gyXOnRxpo1jhEYYmLUW6DC0tw1vYDbzf+ldnk
	fmJemF5+9sktPyftj03EMjZ2jAjObstnzyVDE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=j/ur/JvFFihjk3RGiJ5bp7yYRFM/nJc7QdX4oh22y/70AFsdcCiTfsiHhetRFZBBn1
	hhDvq+3zl0XPh0ZxLXhL0TlkMhsrtUdFY75QjYIeTIdkVoFeIuUsS+/xvEhwip0ROUxS
	OLjV8GMJutt1DFIPyEW/Vwp6GOoIgL8NfqVGE=
MIME-Version: 1.0
Received: by 10.42.96.131 with SMTP id j3mr1209476icn.191.1307743786810; Fri,
	10 Jun 2011 15:09:46 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.217.71 with HTTP; Fri, 10 Jun 2011 15:09:46 -0700 (PDT)
Date: Fri, 10 Jun 2011 15:09:46 -0700
X-Google-Sender-Auth: wv4HvWp7_bzcZWNFj-c01ntbbpg
Message-ID: <BANLkTinUZuZ8tN+4owRWU8Kb9fdn4CYSmA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OE-TSC minutes 26-May-2011
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
X-List-Received-Date: Fri, 10 Jun 2011 22:13:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE-TSC minutes 26-May-2011

Attending: Tom, Khem, Koen, Richard, Mark
Apologies: Stefan
Sitting in on drums: Jefro

01) Meeting chair

Jefro

02) Ask for topics
RP - bitbake and override expansion

03) Action items from last week:
--> GNOME discussion to ml (all)
hasn't happened yet

--> release issues to ml, interest in 2011.06 (stefan)
not yet? didn't see it, Tom will start discussion soon if it doesn't appear
discussion here of bitbake, override expansion - take to ml

--> look at migrating bitbake mailing list (RP)
done

04) TSC structure, voting for members, etc.
still waiting on board
RP suggests a less formal IRC meeting weekly
discussion of role of the TSC and this meeting - becoming a SIG?
discussion of Yocto SIG vs. OE SIG
continue discussion

05) Status updates:
      - oe-core
  meta-oe now has sytemd support
      - contrib guidelines
      - bsp guidelines
      - metadata layer splitting
      - infrastructure
  Tom King working with Linux Foundation, Jefro helping


Raw Transcript

(12:58:11 PM) fray: ha
(12:58:16 PM) Tartarus: Ha
(12:58:31 PM) Jefro: I'm taking roll call with "ha"s
(1:01:44 PM) koen: stefan sent his apologies iirc
(1:01:53 PM) Jefro: ah, ok - thanks
(1:02:06 PM) RP__: ha!
(1:02:43 PM) Tartarus: 4 is a quorum yes?
(1:03:06 PM) fray: ya
(1:03:06 PM) Jefro: I believe so - do you guys want to wait a bit for khem?
(1:03:31 PM) RP__: I'd suggest we start at 5 past
(1:03:37 PM) Tartarus: As I said, I've gotta leave at half past for another
meeting that came up this morning
(1:03:46 PM) Tartarus: but sure, 2 min
(1:03:49 PM) RP__: meantime we can decide on the chair
(1:04:12 PM) Jefro: what do you guys think of appointing a chair for 1 month
or so? not that this takes up a large amount of time, but still
(1:04:24 PM) RP__: Jefro: I'm indifferent
(1:04:34 PM) ***RP__ volunteers if nobody else does
(1:04:39 PM) Jefro: RP__ did it last time
(1:04:48 PM) ***RP__ did do it last week but doesn't really mind
(1:04:55 PM) Jefro: I can take the duty if no one minds a non-voting member
(1:05:11 PM) ***RP__ doesn't object
(1:05:17 PM) Tartarus: same
(1:05:24 PM) Jefro: ok
(1:05:47 PM) Jefro: then as chair I will move on to #2 and ask for any
topics that didn't go out in last email
(1:06:04 PM) Jefro: http://pastebin.com/JADncdCV
(1:06:22 PM) Tartarus: nothing from me
(1:06:36 PM) Jefro: fray?
(1:06:40 PM) fray: yes, here
(1:06:44 PM) fray: sorry.. got interupted
(1:06:44 PM) Jefro: any new topics?
(1:06:51 PM) RP__: I don't have anything to add
(1:06:55 PM) fray: no i didn't see anything from what you sent out
(1:06:59 PM) RP__: ah, maybe one thing
(1:06:59 PM) Jefro: ok
(1:07:06 PM) RP__: bitbake and override expansion
(1:07:15 PM) Jefro: added.  anything from koen?
(1:07:25 PM) koen: not really
(1:07:32 PM) Jefro: cool
(1:07:38 PM) Jefro: that "effective meeting" stuff actually works
(1:07:51 PM) Jefro: moving on to #3, action items - GNOME discussion to
mailing list, did that happen?
(1:08:19 PM) RP__: not yet
(1:09:05 PM) Jefro: ok.  stefan was to discuss interest in a 2011.06 release
on the ml, did that happen?
(1:09:13 PM) ***RP__ doesn't know
(1:09:17 PM) Jefro: I didn't see it
(1:09:24 PM) ***RP__ did migrate the bitbake mailing list
(1:09:44 PM) Jefro: very cool
(1:09:56 PM) Jefro: do you want to now launch into discussing bitbake and
override expansion?
(1:10:14 PM) Tartarus: Real quick
(1:10:32 PM) Tartarus: 2011.06 or so is something we have talked about doing
before, but If it doesn't pop up on the ML soon
(1:10:36 PM) Tartarus: I'll try and start it
(1:10:47 PM) RP__: Tartarus: I think the feeling last week was there might
not be a need
(1:10:53 PM) Tartarus: OK
(1:10:56 PM) RP__: Tartarus: but needs public discussion
(1:10:57 PM) Tartarus: I also need to read the minutes
(1:11:10 PM) ***Tartarus is still in un-bury mode
(1:11:12 PM) RP__: re: the override expansion, I just wanted to highlight
the email on the oe-core list
(1:11:15 PM) koen: .03 is working well and time is better spent on oe-core
(1:11:28 PM) RP__: "[OE-core] RDEPENDS_${PN} and virtclass-native"
(1:11:35 PM) fray: ya.. if there is a desire for .06, it can/should be
done.. but right now I see everything around oe-core and .03
(1:11:36 PM) ***RP__ agrees with koen
(1:11:56 PM) Tartarus: AI, I need to read the minutes of last week ;)
(1:11:58 PM) RP__: fwiw Yocto finds 6 month cycles to be better than 3 month
ones
(1:12:13 PM) RP__: still too much to get done in 6 month ones
(1:12:30 PM) ***Jefro remembers 3-month release cycles at Cygnus back in
early days, with a shudder
(1:12:32 PM) koen: the idea was to do lightweight releases
(1:12:48 PM) ***RP__ knows, I was just commenting
(1:12:58 PM) RP__: DId anyone read that thread I mentioned on the oe-core
list?
(1:13:09 PM) koen: I did
(1:13:26 PM) koen: and it went woosh over my head
(1:13:31 PM) RP__: The reason I ask is that we have some inconsistencies in
what bitbake is doing and they hurt us and are likely going to stop us
cleaning up native.bbclass
(1:13:47 PM) RP__: but if we change things there are backwards compatibility
issies
(1:13:49 PM) Tartarus: I can imagine what's in it, i'll try and read it
before the weekend
(1:14:04 PM) RP__: summary, each time you run d.update_data() the data store
changes
(1:14:18 PM) RP__: when we expand overrides, we leave the original variable
in place
(1:14:35 PM) koen: RP__: we're moving override order around anyway, so
things have to get vetted anyway
(1:14:38 PM) RP__: I know Chris has run into this before, tried changing it
to a rename and the world ended
(1:14:54 PM) fray: it makes me wonder if we should be using latest bitbake +
.03 release..
(1:15:10 PM) RP__: koen: backwards compatibility with oe-dev is my big worry
(1:15:25 PM) RP__: options could include two code paths and a flag to switch
between the,
(1:15:28 PM) RP__: them
(1:15:36 PM) Tartarus: At some point we will need to pause the old repo,
imho
(1:15:47 PM) Tartarus: So maybe it's time for a 1.14.0/1.15.0
(1:15:54 PM) RP__: bitbake is meant to have a stable api
(1:15:55 PM) Tartarus: and 1.14.x is the EOL for old oe-dev
(1:16:30 PM) RP__: anyhow, I wanted to hightlight to people there is an
issue looming on the horizon
(1:16:48 PM) RP__: if I need to explain the issue more I can do so but
probably best on the mailing list
(1:17:02 PM) Tartarus: k
(1:17:23 PM) khem [~khem@99-57-141-118.lightspeed.sntcca.sbcglobal.net]
entered the room.
(1:17:23 PM) mode (+v khem) by ChanServ
(1:17:31 PM) RP__: fwiw, the code in native.bbclass is horrible and shoudn't
be needed
(1:17:33 PM) RP__: hi khem
(1:17:39 PM) khem: hi
(1:17:47 PM) RP__: khem: we only have Tartarus for another 12 mins
(1:17:55 PM) khem: I am having connectivity problems
(1:17:55 PM) RP__: khem: so we've moving fast and have started
(1:18:00 PM) khem: sure
(1:18:15 PM) RP__: Jefro: time for 04?
(1:18:18 PM) Jefro: yes
(1:18:24 PM) RP__: khem: http://pastebin.com/JADncdCV
(1:18:30 PM) khem: thx
(1:18:37 PM) RP__: Jefro: perhaps you could explain what this means? :)
(1:19:05 PM) Jefro: first, I don't see any action items for the bitbake
discussion - anything
(1:19:18 PM) RP__: Jefro: people to read the thread
(1:19:18 PM) Jefro: continue on mailing list?
(1:19:24 PM) RP__: Jefro: yes
(1:19:26 PM) Jefro: ok, noted
(1:19:54 PM) Jefro: for 04), there was discussion for the last two weeks on
TSC structure, whether it would be an interest group or a hands-on group in
the future
(1:20:08 PM) Jefro: I didn't see a final decision on that
(1:20:16 PM) koen: are we still waiting for the board to call for elections?
(1:20:33 PM) RP__: koen: memebership elections then there will be tsc vote
(1:20:37 PM) khem: yes i think
(1:20:41 PM) koen: iirc stefan was asking about election ordering as well
(1:20:58 PM) RP__: the thing that seemed to come out of the discussions was
we could do with a time when interested parties get together on public irc
and talk about issues
(1:21:15 PM) Jefro: I believe RP was going to contact the board to ask if
they were planning to call for elections
(1:21:28 PM) RP__: Jefro: I did and the response was as above
(1:21:42 PM) Jefro: dang, all you guys type faster than me today
(1:21:45 PM) RP__: Order was clearly stated in the minutes of one of the
early meetings
(1:21:56 PM) ***RP__ spends all day typing :/
(1:22:40 PM) Jefro: ok - membership elections won't happen until October
IIRC, so punt this topic until then?
(1:22:43 PM) khem: yes I think it was starting with me
(1:22:48 PM) koen: the order was stated, but do we need to follow it?
(1:22:48 PM) RP__: Does anyone object to having a convention of slightly
less formal and more public irc meeting once a week?
(1:22:59 PM) fray: ya.. we're going to have to leave it to the board.. there
is nothing we can do..
(1:23:02 PM) koen: e.g. if someone really wants to give his seat
(1:23:03 PM) RP__: Jefro: no, membership vote is happening *now*
(1:23:04 PM) fray: (other then resign.. but that won't fix it)
(1:23:24 PM) fray: ahh ok
(1:23:31 PM) khem: RP__: what is this meeting about going to be
(1:23:34 PM) RP__: koen: if someone wants to give up their seat and
volunteer that is fine
(1:23:34 PM) Jefro: RP__ ah, I see
(1:23:47 PM) khem: RP__: are we going to convert this meeting to the one you
propose
(1:23:57 PM) RP__: khem: I'm raising that question
(1:24:15 PM) khem: sure idea sounds good to me
(1:24:17 PM) RP__: It would be more of an OE-Core interest group meeting
(1:24:50 PM) khem: yeah that will put it in better context
(1:25:09 PM) RP__: but I think some convention of a specific time would
perhaps be helpful and we would likely get wider input which I think could
be good
(1:25:14 PM) Jefro: are there things this TSC does other than oe-core that
should be maintained?
(1:25:32 PM) khem: RP__: timing wise it could be a challange
(1:25:33 PM) RP__: The TSC would then meet less frequently and act as the
ultimate tie breaker as original designed
(1:25:50 PM) RP__: TSC is still needed, just more in its original role
(1:25:56 PM) koen: RP__: the original design also said the tsc is proactive
(1:26:05 PM) RP__: khem: yes, that will be tricky
(1:26:08 PM) fray: I see the TSC still doing policy, guidelines, etc..
(1:26:12 PM) RP__: koen: well, it still can be :)
(1:26:12 PM) khem: RP__: I still think meeting TSC folks often keeps some
directions flowing
(1:26:15 PM) khem: into  project
(1:26:45 PM) RP__: in some ways these things should happen on the mailing
lists more though
(1:26:58 PM) Jefro: RP__'s suggestion sounds reasonable from a community
perspective. I'
(1:27:07 PM) Jefro: m not sure anyone reads the minutes from this meeting.
(1:27:13 PM) khem: I am ok with SIG meeting and taking TSC meetings as you
suggest
(1:27:40 PM) koen: keep in mind that a SIG has no officia; power
(1:27:55 PM) khem: right
(1:28:00 PM) koen: it shouldn't matter much in oe-core, but still
(1:28:07 PM) khem: so TSC folks have to bring a different hat
(1:28:11 PM) Tartarus: My 2 cents before I have to run off
(1:28:29 PM) RP__: koen: I think as maintainers and major contributors,
people do hold power
(1:28:31 PM) Tartarus: I like the direction we get in having a group of
people that are interested meet and discuss things frequently and keep stuff
on track
(1:28:50 PM) Tartarus: But I suspect we'll have some complaints about that
being what the ML is for, which is also true
(1:29:02 PM) Tartarus: But if we don't have the meetings take too long, that
should be fine
(1:29:04 PM) RP__: Tartarus: Mailing lists have a place, so do specific
meetings
(1:29:17 PM) RP__: both provide a different kind of focus
(1:29:18 PM) Tartarus: a weekly chance to poke RP or myself and so on about
something to make sure they don't forget is good
(1:29:21 PM) Jefro: Tartarus - do you think the complaints might be
alleviated if the logs from online meetings are posted there?
(1:29:24 PM) Tartarus: We've all had stuff slip past before
(1:29:27 PM) khem: RP__: first I think a call to form SIG should be done
(1:30:06 PM) Tartarus left the room.
(1:31:15 PM) RP__: ok, so does someone want to make the call for the IG?
(1:31:56 PM) RP__: khem: sounds good to me
(1:31:59 PM) Jefro: and Tom's comments seemed positive to me, with some
reservations
(1:32:06 PM) Jefro: any nays?
(1:32:13 PM) RP__: We can at least try this, see how it works out
(1:32:36 PM) Jefro: koen's opinion is the only one missing
(1:32:55 PM) koen: I have no strong opinion on it
(1:32:56 PM) fray: I support the creation of an IG
(1:33:18 PM) koen: but if we go with an IG, should we try to make it an
official yocto IG?
(1:33:27 PM) koen: or am I a fw org charts behind?
(1:33:38 PM) khem: I dont think IG need's TSCs blessing anyone can start and
IG. am I right >
(1:33:58 PM) RP__: khem: I think the TSC can comment that they support the
idea
(1:34:08 PM) RP__: but anyone can attempt to start one
(1:34:20 PM) Jefro: my impression was that this is an OE interest group, not
a Yocto interest group, but I could be mistaken. does OE have a process for
starting an IG?
(1:34:25 PM) koen: oh, before I forget: meta-oe now has sytemd support
(1:34:38 PM) khem: koen: :) cool
(1:34:41 PM) RP__: koen: We could make it a Yocto IG if we wanted. Its an
interesting point. Depends how OE and Yocto are going to position themselves
relative to each other
(1:34:57 PM) RP__: Jefro: no policy, we get to make that up ;-)
(1:35:13 PM) RP__: I'd suggest it doesn't need a formal policy, it would
just be a meeting convention
(1:35:18 PM) Jefro: RP__ lol - I'm asking because if it is a Yocto list, I
have an action item :)
(1:35:29 PM) RP__: Jefro: true :)
(1:36:38 PM) koen: I wonder if we get an actual discussion for the new tsc
votes
(1:36:43 PM) khem: btw, I had one item that I wanted to bring up was some
funds donation to osuosl that Tom K brought up
(1:36:59 PM) koen: khem: did we get the new gbit switch?
(1:37:24 PM) Jefro: This is an interesting border case, as oe-core is the
one component that is fully in both OE and Yocto
(1:37:25 PM) khem: koen: Tom did not get funds I think its still under
decision
(1:37:49 PM) Jefro: I suggest staying on focus with the interest group until
done, then moving on to infrrastructure (and I have a short update on that)
(1:38:09 PM) khem: Jefro: ok. I thought we were done with agenda
(1:38:23 PM) RP__: khem: I thought Tom was getting some funding?
(1:38:40 PM) khem: RP__: he is waiting on OE e.v.
(1:38:58 PM) Jefro: regarding infrastructure - I have been working with Tom
K and Linux Foundation
(1:39:15 PM) Jefro: new servers are on the way, being donated through LF but
the process takes a while
(1:39:17 PM) khem: Jefro: ok
(1:39:27 PM) fray: Something just came up.. I've got to leave.. sorry..
(1:39:34 PM) Jefro: fray seeya
(1:39:47 PM) RP__: fray: happens, ttfn :/
(1:40:09 PM) Jefro: LF is now in touch with Tom K and they are coordinating
an eventual trip to OSU for Tom to set things up after they arrive
(1:40:26 PM) RP__: That is what I heard too :)
(1:40:32 PM) Jefro: My assumption is that 1/2 travel expenses are included,
not sure about the switch.
(1:40:46 PM) Jefro: I'll be interested to hear how Tom does with pinging the
community.
(1:41:47 PM) Jefro: that's all I know about infrastructure :) didn't mean to
grind anything to a halt.
(1:46:23 PM) Jefro: officially I think this meeting is over, if anyone else
needs to leave


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

