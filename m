Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QV9zE-00017X-5J; Sat, 11 Jun 2011 00:15:28 +0200
Received: by iwn19 with SMTP id 19so813362iwn.6
	for <multiple recipients>; Fri, 10 Jun 2011 15:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=tpYMfNPN4RGtqj4hIvhavKxUfwyo3RTly8orybylCVs=;
	b=plseVmPnAj/JRQrPBOosvVNnIqu5BpjIuGF9buKI1F74uZCjOPD63pMqNcdZBEjepY
	JvdT77sFOL5paTjfMhiDq4BwyAVgJW7dnukfQ/gKlirmlfoItdl+/cJ+axsHzPLb14bh
	3GXreOgjnlxZyvBAgaPg3VZuDPWs2IHWaEwjM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=YFs43wyC+J3qjj89crANMxeOldWzdtCqKCbL2QlqK/YaAcbEn1r/hOkDIhjPmt8+hi
	ikQJs6qRP65cWxSnXcFblXKuzGCuW+UnBGFdIlgsuKOSxn7e4kiiunTHEVn4FXL6BUN4
	zSxCUYGWiLB5U6Kiv9HcM531qEBRl78yywllo=
MIME-Version: 1.0
Received: by 10.42.141.202 with SMTP id p10mr3535141icu.124.1307743926004;
	Fri, 10 Jun 2011 15:12:06 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.217.71 with HTTP; Fri, 10 Jun 2011 15:12:05 -0700 (PDT)
Date: Fri, 10 Jun 2011 15:12:05 -0700
X-Google-Sender-Auth: aNgMTaVpp76OZk_5yVYmf7e8UKc
Message-ID: <BANLkTimOmbpNXb5DB7EViL-F0qkd+d1ZJw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OE-TSC minutes 09-Jun-2011
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
X-List-Received-Date: Fri, 10 Jun 2011 22:15:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

MINUTES: OE-TSC meeting 09-Jun-2011

Attendees: Khem, Koen, Tom, Stefan, Mark, Richard
Notes: Jefro

Agenda

01) choose a meeting chair

  fray

02) extra topics?


03) action items from last week
--> RP to send email to yocto folks (RP)
  done
--> mailman needs to be patched (koen)
  seems to have been fixed
--> GNOME discussion to ml (all)
  koen posted
--> release issues to ml, interest in 2011.06 (stefan)
  done, no 2011.016 release, concentrate on oe-core
--> discuss one member standing down next week, RP volunteers

03) review/approval of the commit/patch guidelines (fray)
  general approval

04) older minutes approval, change process? (jefro)
  process is (1) I post minutes as usual but within 24 hrs of meeting, (2)
acks before Monday, (3) I send out to oe-core, oe-dev, and tsc

05) TSC structure & elections
  much discussion
  number of seats is a board issue
  OE community would prefer some kind of real election for the TSC seats
  staggered elections will make the TSC better in the long-run (fray)
  stefan & RP volunteer to stand for election first, thereafter
    elections to happen alphabetically by first name as outlined in earlier
minutes (Khem Koen Mark Tom)
  rough timing is 1 month to call an election, so 2 month cycle for the 5
seats
  RP to write letter to board outlining position, drafted during meeting

06) Status updates
      - oe-core
  need to populate common images people use in classic oe
      - contrib guidelines
  done
      - bsp guidelines
  working
      - metadata layer splitting
      - infrastructure

Raw Transcript:


(1:00:17 PM) stefan_schmidt: khem is missing
(1:00:33 PM) stefan_schmidt: Anybody knows about him?
(1:02:07 PM) Jefro: haven't heard
(1:02:16 PM) Jefro: 3 more mins?
(1:02:57 PM) stefan_schmidt: yes, and then start
(1:03:12 PM) Tartarus: pong
(1:04:13 PM) khem [~khem@99-57-141-118.lightspeed.sntcca.sbcglobal.net]
entered the room.
(1:04:13 PM) mode (+v khem) by ChanServ
(1:04:20 PM) khem: hi all
(1:04:27 PM) Jefro: welcome khem
(1:04:41 PM) fray: Tartarus the only one missing now?
(1:04:45 PM) stefan_schmidt: there we go
(1:04:46 PM) RP__: Item 1), RP isn't chairing this week
(1:04:48 PM) Jefro: sounds like all are here now - roll call? I have heard
from RP, stefan_schmidt, Tartarus, and khem
(1:04:49 PM) Tartarus: I'm here
(1:04:53 PM) fray: ahh ok..
(1:04:53 PM) Jefro: koen and fray?
(1:04:58 PM) koen: I'm here
(1:05:01 PM) fray: here
(1:05:04 PM) fray: I can chair
(1:05:11 PM) Jefro: 01) complete
(1:05:23 PM) fray: so on to 2.. any additional topics?
(1:05:24 PM) RP__: Do we have an agenda?
(1:05:40 PM) Tartarus: Jefro sent one earlier
(1:05:40 PM) stefan_schmidt: RP__: yes, Jefro send one out
(1:05:41 PM) Jefro: yes - putting on pastebin
(1:05:42 PM) ***fray is going off the email from jefro earlier today
(1:05:48 PM) RP__: Philip is asking me about elections. Did we minute what
we're doing?
(1:05:54 PM) khem: Jefro: sent an hour ago I think
(1:05:55 PM) stefan_schmidt: No new topics from me
(1:05:58 PM) Jefro: http://pastebin.com/87BRig97
(1:06:09 PM) Tartarus: no new topics here
(1:06:35 PM) RP__: Jefro: thanks. Sorry I'd bee afk until now
(1:06:43 PM) Jefro: RP__ yes, minuted in last round, although I still need 2
more acks to send out publicly
(1:06:44 PM) fray: I know we had discussed the elections before, but I'm not
sure it went beyond the IRC logs
(1:06:53 PM) Jefro: RP__ slacker
(1:06:57 PM) RP__: Philip needs our plan
(1:06:59 PM) fray: Jefro, if you are waiting on me let me know -- I think I
sent them all out
(1:07:09 PM) RP__: Jefro: I had a whole two hours away from the computer
(1:07:20 PM) Jefro: RP__ on a windy ride I hope
(1:07:25 PM) khem: RP__: that was like your vacation :)
(1:07:29 PM) RP__: Jefro: I wish
(1:07:37 PM) fray: heh -- ok.. no new topics -- onto 3?
(1:07:37 PM) koen: shall we discuss elections at 5) ?
(1:07:39 PM) stefan_schmidt: Jefro: I only can ack the minutes I was
attending
(1:07:54 PM) stefan_schmidt: Jefro: Just in case you where wondering why I
did not ack all
(1:08:01 PM) fray: koen, yes I was thinking it would go there
(1:08:09 PM) ***RP__ agrees
(1:08:13 PM) Jefro: stefan_schmidt - understood, thanks
(1:08:15 PM) RP__: as long as we cover it
(1:08:28 PM) ***fray notes two '3's
(1:08:36 PM) fray: so for the 3..  action items from last week
(1:08:39 PM) ***RP__ sent the email to the yocto people
(1:08:45 PM) ***Jefro was a math minor, should have completed the major I
guess
(1:08:46 PM) RP__: its also been mentioned in team meetings
(1:08:53 PM) koen: RP seems to have fixed mailman as well
(1:08:56 PM) ***fray wasn't here for much of last week, so I'm not sure what
these all mean
(1:08:59 PM) RP__: I know its still occurring but we are slowly bringing it
under control
(1:09:05 PM) fray: ok, first two done
(1:09:22 PM) fray: GNOEM discussion, I didn't see anything -- other then a
mention to gnome moving.. to meta-gnome -- was that it?
(1:09:26 PM) RP__: Koen asked the gnome question
(1:09:27 PM) stefan_schmidt: The release mail was also out and nobody
complained or stepped up. Done. No 2011.06 release. People can concentrate
on oe-core
(1:09:38 PM) koen: fray: yep, that was it
(1:09:56 PM) fray: ok.. I think then #3 -- first is done.. (we'll dicuss the
member lstanding down in 5)
(1:10:02 PM) fray: so #3 -- second one..
(1:10:08 PM) khem: so I think now we need to populate the common images that
people currently use in classic oe
(1:10:44 PM) ***fray steps back
(1:10:54 PM) koen: khem: that's 06) IMO
(1:10:58 PM) khem: ok
(1:11:08 PM) khem: yeah I see the agenda list
(1:11:11 PM) fray: ok.. 6 that is..
(1:11:17 PM) fray: #3 - part 2..
(1:11:23 PM) koen: I approve fray's document
(1:11:30 PM) fray: I submitted what I beleive is the final draft of the
guidelines..
(1:11:39 PM) stefan_schmidt: I'm happy with it as well
(1:11:42 PM) fray: I'd like the group to formally approve it (or reject it)
or table as necessary
(1:11:44 PM) khem: yes we should commission it
(1:11:45 PM) fray: I vote for it
(1:11:47 PM) stefan_schmidt: Maybe should write a mail saying this
(1:11:59 PM) Tartarus: i vote for the doc
(1:12:03 PM) stefan_schmidt: ack from me
(1:12:12 PM) fray: stefan_schmidt assuming it's approved -- I would expect
an email on behalf of the TSC explaining this is now the policy..
(1:12:20 PM) stefan_schmidt: fray: sounds fair
(1:12:41 PM) koen: fray: care to draft such a mail?
(1:12:46 PM) fray: so I have 4 approves.. and 2 non-votes if I counted
right?  I think that passed..
(1:12:50 PM) fray: koen, I can take that action
(1:13:05 PM) RP__: fray: I'm abstaining on the ground that I haven't read
them in a while, sorry :/
(1:13:14 PM) fray: (assuming this passed, which it appears it did).. where
does such a document go on Wiki?  Or who do I coordinate with to find the
right place
(1:13:24 PM) fray: RP__, I would expect if you find an objection, we can
correct it..
(1:13:26 PM) khem: wiki
(1:13:33 PM) RP__: fray: yes, I'm fine to proceed
(1:13:35 PM) Jefro:  /me notes passage of 03.5)
(1:13:59 PM) fray: I'm fine with getting this on the wiki, but just unsure
of where in the wiki to place it
(1:14:18 PM) khem: there is area for policies
(1:14:19 PM) fray: (we can take this off-line as part of my action to send
the email out as well)
(1:14:22 PM) fray: Ahh ok
(1:14:22 PM) stefan_schmidt: fray: we should have a policy section
(1:14:37 PM) khem: there already is IIRC
(1:14:40 PM) RP__: fray: OE wiki is probably fine. I'd like to see some
links in Yocto too
(1:14:53 PM) Jefro: RP__ I intend to adopt fray's document for Yocto
(1:14:56 PM) khem: http://wiki.openembedded.org/index.php/Category:Policy
(1:14:58 PM) fray: RP__ ya, (on the yocto side) I was going to work with the
tech writer to get the links in place
(1:15:07 PM) fray: khem, thanks
(1:15:14 PM) Jefro: from the oe wiki front page, look for "policy"
(1:15:15 PM) RP__: fray, Jefro: sounds good. I will leave this to you
(1:15:20 PM) Jefro: sorry, "policies"
(1:15:28 PM) Jefro: scottrif and I will figure it out
(1:15:32 PM) fray: ok, I think we're done with 3.5 then
(1:15:39 PM) fray: on to 4.. older minutes.. Jefro?
(1:15:57 PM) ***RP__ wonders what the symptoms of caffeine overdose are...
(1:16:08 PM) Tartarus: RP__: jitters?
(1:16:12 PM) RP__: I think that was my tenth mug of tea today :/
(1:16:13 PM) Jefro: yes - first, formal apologies for the minutes snafu, I
have hadserious email issues that are being resolved
(1:16:20 PM) fray: RP__ the guy I know who did that thought he had a
heartattack.. litterly ended up in the hospital..
(1:16:45 PM) Jefro: caffeine od's can be very ugly
(1:16:45 PM) RP__: heart rhythm is fine
(1:16:56 PM) fray: (he drank a 24 pack of Mt. Dew in like 4 hours or
something)
(1:16:58 PM) ***khem notes mug > glass
(1:17:01 PM) Jefro: if your heart is fine after 10 cups, it is time to cut
back, srsly
(1:17:10 PM) stefan_schmidt: Jefro: so all old minutes are out now?
(1:17:20 PM) stefan_schmidt: ah, you are waiting for acks for some of them
(1:17:29 PM) Jefro: no, there are two that still need a quorum of acks in
order to proceed
(1:17:32 PM) fray: Jefro, if there are any pending acks, I'd suggest a
reminder to the people you are waiting on
(1:18:00 PM) stefan_schmidt: Jefro: wrt process, I think mailing them out
for acks is ok.
(1:18:11 PM) stefan_schmidt: What I would like to see is a deadline to gte
them out
(1:18:15 PM) Jefro: fray I will do that - and will find a better way to
manage the minutes thing
(1:18:24 PM) stefan_schmidt: say two days for the minutes mail and 1 or two
for the acks
(1:18:26 PM) fray: ya, the acks are still needed -- we rarely "fix"
anything, but it gives us the opporunity to clarify if needed
(1:18:36 PM) stefan_schmidt: I think they should be out under a week
(1:18:43 PM) ***RP__ should read and ack
(1:18:48 PM) fray: my preference is to have the minutes for the prior week
out the day of, or day before the next meeting
(1:19:01 PM) ***RP__ wasn't well towards the beginning of the week which has
left me with a backlog of things
(1:19:07 PM) stefan_schmidt: fray: yup, at least the day we have the next
(1:19:12 PM) Tartarus: Maybe we need to say that if it's not ack'd before
the next meeting they just go out?
(1:19:19 PM) Jefro: if I get the minutes out within 24 hrs, people will have
friday to read & ack
(1:19:19 PM) Tartarus: Barring unusual circumstances
(1:19:21 PM) ***RP__ suspects it may be related to needing 10 mugs of tea to
stay awake :/
(1:19:57 PM) stefan_schmidt: Tartarus: hmm, I think people should take the
few minutes to read and ack
(1:19:59 PM) fray: Tartarus absolutely.. these are guidelines.. not
hard-fast rules IMHO
(1:20:03 PM) RP__: Jefro: Friday would work, particularly as the meeting
should be fresh in people's minds
(1:20:27 PM) stefan_schmidt: friday would be great, if thats possible for
Jefro
(1:20:33 PM) Jefro: the only issue, of course, is me. I can make a special
effort.
(1:20:38 PM) Tartarus: stefan_schmidt: agree
(1:20:42 PM) stefan_schmidt: and people should ack until monday(?)
(1:20:54 PM) Jefro: not my goal to be a gating factor here.  I'd give people
until Tues to ack before I start pestering.
(1:20:55 PM) Tartarus: I think we should give folks until wednesday, this
meeting time'ish to ack
(1:21:01 PM) stefan_schmidt: or monday minutes and ack on wednesday
(1:21:01 PM) Tartarus: and if we don't get the quorum by then, they go out
(1:21:03 PM) fray: seems reasonable
(1:21:09 PM) Tartarus: but if we get the quroum sooner, they go out
(1:21:09 PM) stefan_schmidt: would still be ok but the limit for me
(1:21:35 PM) stefan_schmidt: I would be ok with that
(1:21:41 PM) Jefro: one thing that would help greatly is for people to make
sure to note when something is to be off record
(1:21:58 PM) Jefro: almost the only thing that ever changes is when someone
says "oops, I shouldnt say THAT in public"
(1:22:19 PM) stefan_schmidt: Jefro: agreed people should help you there
(1:22:21 PM) ***RP__ thinks we should try and get minutes out within 36
hours of the meeting
(1:22:27 PM) RP__: i.e. by the Monday
(1:22:28 PM) stefan_schmidt: You can't know about such things
(1:22:32 PM) RP__: as its more useful to people reading them
(1:22:44 PM) khem: yes by Monday will be nice
(1:22:57 PM) fray: my big thing is the deadline should be the following
weeks meeting.. otherwise things can get too old for people to contribute if
they have a comment or objection
(1:23:05 PM) fray: but I agree, the earlier the better
(1:23:20 PM) stefan_schmidt: Same thing as fray here
(1:23:37 PM) stefan_schmidt: should we aim for monday this time and see how
it goes?
(1:23:47 PM) Jefro: so the process is (1) I post minutes as usual but within
24 hrs of meeting, (2) acks before Monday, (3) I send out to oe-core,
oe-dev, and tsc
(1:23:53 PM) khem: I think yes we should try for monday
(1:24:12 PM) stefan_schmidt: so acking over the weekend
(1:24:21 PM) stefan_schmidt: I hope that works for you guys
(1:24:28 PM) fray: I will certainly try to do so..
(1:24:37 PM) khem: stefan_schmidt: fo EU folks it will be monday too
available for ack
(1:24:43 PM) Jefro: I will try to get them out as early before friday as
possible to avoid weekend work.
(1:24:55 PM) ***stefan_schmidt is working every weekend the next months
anyway. Don't do diploma thesis and have different customers at the same
time...
(1:25:05 PM) fray: heh
(1:25:06 PM) stefan_schmidt: khem: ah, great :)
(1:25:12 PM) fray: ok, so on to 5?
(1:25:20 PM) khem: Jefro: is in PST/PDT
(1:25:31 PM) Jefro: khem - yes, I am in PDT
(1:25:36 PM) stefan_schmidt: fray: yes
(1:25:53 PM) khem: so our monday morning is already monday evening for EU
(1:25:53 PM) koen: 20:56 <Crofton> hmm, I thought the TSC was all powerful
(1:25:54 PM) koen: 20:57 <Crofton> what does the TSC want to do?
(1:25:55 PM) fray: so the TSC structure, started some comments earlier?
(1:26:00 PM) koen: that's what philip said to me on 5)
(1:26:09 PM) koen: after that he started talking to RP
(1:26:20 PM) fray: ha!  I only feel powerful when I submit code or write
documents.. ;)
(1:26:30 PM) Tartarus: So do we just need to submit a change to our charter?
(1:26:39 PM) Tartarus: I thought we thought that had to be done for us, heh
(1:26:39 PM) RP__: Tartarus: To do what?
(1:26:44 PM) stefan_schmidt: so RP offered to step down last time.
(1:26:45 PM) Tartarus: have one more seat
(1:26:50 PM) stefan_schmidt: I offered as well.
(1:26:54 PM) RP__: The charter has to be changed by the board
(1:27:07 PM) stefan_schmidt: Maybe its good to have RP back as formerly
voted in member soon so
(1:27:08 PM) fray: I'm also willing to step down and go up for election if
it makes things easier..
(1:27:10 PM) RP__: stefan_schmidt: you weren't here last week, and I said I
didn't mind going first
(1:27:16 PM) khem: I think 5 seats are enough
(1:27:19 PM) stefan_schmidt: if people vote him of course :)
(1:27:28 PM) RP__: The number of seats is a board issue
(1:27:44 PM) koen: if 5 seats are enough we could start with someone
stepping down who doesn't want a reelection
(1:27:55 PM) stefan_schmidt: RP__: Crofton does know about the seat issue?
(1:27:57 PM) RP__: stefan_schmidt: I'm making no assumptions
(1:27:58 PM) koen: that would buy us some time to come up/approve of a new
plan
(1:28:23 PM) RP__: stefan_schmidt: He does but the OE community would prefer
some kind of real election for the TSC seats I think
(1:28:35 PM) RP__: stefan_schmidt: There are likely others who would be
interested too
(1:28:41 PM) stefan_schmidt: sure
(1:28:47 PM) stefan_schmidt: thats why we vote
(1:28:55 PM) fray: I am also a little worried about continuity, I definitely
think staggered elections will make the TSC better in the log-run
(1:28:58 PM) fray: 'er.. long run
(1:29:04 PM) RP__: That is an easy question to ask: Is anyone not going to
stand for relection?
(1:29:05 PM) stefan_schmidt: So RP is going down first and one new seat is
elected
(1:29:26 PM) RP__: The real question is who after me?
(1:29:30 PM) stefan_schmidt: And another one is going down now as well
without new elections or is the to much seat going last?
(1:29:38 PM) RP__: Go by the list we created (alphabetical?)
(1:29:45 PM) fray: I'm certainly willing to go next -- last --
alphabetically
(1:29:50 PM) RP__: stefan_schmidt: probably goes last is easiest
(1:30:05 PM) stefan_schmidt: wrt re-election
(1:30:27 PM) stefan_schmidt: I'm pondering myself how much I can offer the
TSC. It feels like you guys can offer more
(1:30:30 PM) koen: do we want to have 1-seat-too-many for the next 6 months
or only for the next month
(1:30:37 PM) fray: for continuity sake -- I'd say at the same time the 5th
seat is up for re-election
(1:30:43 PM) stefan_schmidt: In short, I'm not sure if I will put me up
again
(1:31:32 PM) fray: koen, assuming we all step down now --  I'm still worried
that in a year we're up for election as a group again.. would it make sense
to ask that half the seats be 6 month and the other be 1 year..?
(1:31:47 PM) RP__: stefan_schmidt: The question you need to consider is if
you have time and can commit to it
(1:32:04 PM) RP__: stefan_schmidt: The community are the people who decide
if you can offer the right things
(1:32:13 PM) stefan_schmidt: RP__: thats indeed a recent problem as well
(1:33:16 PM) RP__: koen: We'd lose someone at the point where someone stood
down and wasn't reelected
(1:33:45 PM) RP__: That person may or may not get elected in subsequent
elections
(1:33:58 PM) koen: I know
(1:34:27 PM) koen: I'm just saying that *if* we have someone now who doesn't
want to get reelected, we can solve the one-seat-too-many issue right now
(1:34:31 PM) RP__: fray: I think the elections will be rolling over a period
of a few months
(1:34:40 PM) fray: RP__ that would be good
(1:34:44 PM) RP__: fray: It means the TSC will therefore have continuity
(1:34:46 PM) stefan_schmidt: Lets go with me being the seat going down
without re-election option
(1:34:48 PM) koen: but if there is noone now we can postpone if to later
elections
(1:35:08 PM) stefan_schmidt: It feels like the best option to me. I can put
myself up again when I have more time
(1:35:48 PM) RP__: stefan_schmidt: If you're about to enter a hectic time
that could work out reasonable
(1:35:48 PM) stefan_schmidt: Would it be a problem for anyone if RP and
myself step down first?
(1:35:49 PM) Tartarus: stefan_schmidt: hopefully sooner rather than later!
:)
(1:36:04 PM) fray: ok, so do we have a conclusion then for the minutes?
(1:36:28 PM) RP__: Sounds like myself and Stefan step down and there is an
election held
(1:36:29 PM) stefan_schmidt: RP__: yeah, its diploma thesis, buglabs and
CELF/LF work until october
(1:36:44 PM) RP__: Seats then go as per the original list alphabetically?
(1:36:48 PM) stefan_schmidt: Tartarus: I consider coming back when I have
more time again. :)
(1:36:54 PM) fray: RP__, ok  then we role follow-on election regularly
alphabetically?
(1:37:05 PM) koen: alphabet is fine by me
(1:37:06 PM) stefan_schmidt: sounds good to me
(1:37:15 PM) khem: fine for me
(1:37:37 PM) fray: rough timing is 1 month to call an election, 1 month to
tabulate/get the new seat "in"..  then the next election..
(1:37:42 PM) fray: so 2 month cycle for the 5 seats?
(1:37:52 PM) fray: (2 months per seat?)
(1:38:02 PM) fray: or is that too slow -- or out of our control?
(1:38:10 PM) RP__: fray: I'll leave it to the board
(1:38:14 PM) fray: fair enough
(1:38:19 PM) RP__: I'm assuming an election once a month though
(1:38:29 PM) fray: ok
(1:38:41 PM) fray: I'm still new to the election policies..
(1:38:44 PM) ***RP__ will send a summary to the board if that works for
people?
(1:38:54 PM) fray: that works
(1:38:58 PM) fray: for me
(1:39:01 PM) Tartarus: works for me
(1:39:11 PM) ***fray wonders if he needs some of that tea.. ;)
(1:39:32 PM) ***RP__ is feeling sleepy
(1:39:36 PM) ***Jefro notes it all.  1 question - alphabetially by last name
or first?
(1:39:36 PM) fray: no objections to the plan?  on to 6?
(1:39:49 PM) khem: First
(1:39:50 PM) RP__: Jefro: as per whatever was originally in the minutes
(1:40:02 PM) fray: ya, whatever was in the original minutes
(1:40:24 PM) khem: Khem Koen Mark Tom
(1:40:29 PM) Jefro: ok, will look at previous minutes
(1:40:47 PM) fray: ok
(1:41:20 PM) fray: on to 6 then -- status updates and related
(1:42:08 PM) koen: 6a: oe-core
(1:42:36 PM) fray: related comment:  I'm hearing side conversations
regularly with people really happy with oe-core and how it's progressing..
(1:42:50 PM) khem: layering guidelines is critical IMO
(1:43:02 PM) fray: hearing some (so far minor) concerns about "missing"
oe-dev functionality.. but nothing that I would consider a complaint
(1:43:03 PM) ***stefan_schmidt notes something OT: Mickey got father:
http://www.vanille-media.de/site/index.php/2011/06/09/the-eagle-has-landed/
(1:44:22 PM) koen: there are some small process/communication issue with
oe-core, but all in all I have a positive feeling about it
(1:44:57 PM) stefan_schmidt: it looks for me like the pieces are falling
into place
(1:45:13 PM) stefan_schmidt: the different layers may still confuse people
(1:45:33 PM) ***koen is going to segue into contribution guidelines
(1:45:37 PM) fray: I see good conversation and review on the oe-core list,
as well as on-going stability
(1:45:58 PM) koen: contribution guidelines could be clearer for layers
(1:46:11 PM) RP__: stefan_schmidt: Hopefully this will become clearer over
time as people start using the different pieces
(1:46:12 PM) koen: but most of the times it involves people not reading the
README in the layer
(1:47:00 PM) koen: the current number of layers is quite impressive
already:
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/tree/conf/bblayers.conf?h=oe-core
(1:47:04 PM) stefan_schmidt: RP__: I hope for the same
(1:47:12 PM) RP__: Is http://pastebin.com/ur3p9yXc ok with people?
(1:47:17 PM) RP__: (TSC to board)
(1:48:01 PM) stefan_schmidt: RP__: looks good to me
(1:48:08 PM) Tartarus: works for me
(1:48:15 PM) ***RP__ adds a bit about RP standing for re-election
(1:48:33 PM) koen: RP__: maybe clarify the seat-too-many issue
(1:48:52 PM) khem: ok by me
(1:49:00 PM) koen: RP__: but fine by me as-is
(1:49:11 PM) ***RP__ adds "This should resolve the fact that we have six
people on the TSC and need to reduce this to give somehow."
(1:49:21 PM) RP__: s/give/five/
(1:49:51 PM) fray: ya makes sense
(1:50:27 PM) khem: koen: qt is in oe-core
(1:50:43 PM) khem: err not for koen alone
(1:51:01 PM) khem: should it be a different layer
(1:51:47 PM) koen: khem: I'd take that to the ml
(1:51:53 PM) koen: (oe-core)
(1:52:28 PM) RP__: Its a mailing list discussion I think
(1:52:31 PM) fray: BTW my gut tells me that eventually "QT" will likely move
to a layer, with the latest version(s), IDE components, etc..
(1:52:42 PM) khem: yes
(1:52:49 PM) RP__: Short answer is that for now having it coordinated from
OE-Core might be beneficial
(1:52:53 PM) koen: s/qt/qt4/
(1:53:00 PM) koen: qt3 has its own layer already
(1:53:04 PM) khem: if time permits I have plans to add meta-kde since now
kwin will support Open GL ES
(1:53:11 PM) khem: starting 4.7
(1:53:37 PM) koen: khem: you'll thank RP for BBCLASSEXTEND, since *every*
KDE recipe needs a native version
(1:53:46 PM) fray: koen, it would be really nice if Nokia or someone familar
w/ QT would be the integrators/maintainers
(1:53:48 PM) koen: qt people don't use shell, they write a qt app
(1:54:21 PM) koen: fray: I expect TI to take an interest when we transistion
our product to the oe-core metaverse
(1:54:35 PM) koen: it's a deliverable in our SDK :)
(1:55:19 PM) ***RP__ notes we're nearly out of time
(1:55:29 PM) fray: yes.. sorry wasn't watchign that
(1:55:34 PM) khem: yes, we still have release plan
(1:55:35 PM) RP__: Do any of those other topics need discussion?
(1:55:37 PM) koen: we're at 6d by the looks of it
(1:56:15 PM) RP__: btw, I'd also like to note for the record that bitbake in
poky and bitbake-upstream are nearly in sync
(1:56:20 PM) fray: khem, I think we're getting close to a point we need to..
but I'm not sure yet if we're ready..
(1:56:36 PM) khem: fray: thats why its plan
(1:56:50 PM) fray: khem, I'm referring to the plan stage..
(1:56:54 PM) RP__: Is this for the October release/
(1:56:55 PM) RP__: ?
(1:57:00 PM) khem: RP__: yes
(1:57:16 PM) khem: I think it would be nice to have other distros adopt
oe-core by then in release
(1:57:21 PM) Jefro: RP__ put bitbake sync on the status list for next week?
anything that can come off that list?
(1:57:30 PM) koen: it looks like angstrom is on track for an october release
of its metadata
(1:57:37 PM) khem: koen: cool
(1:57:41 PM) RP__: Jefro: Its pretty much done, I just wanted to make sure
people had noticed :)
(1:57:49 PM) RP__: koen: very cool
(1:57:59 PM) RP__: My intent is that as we get closer, I'll get stricter
about the kind of changes going into OE-Core eventually branching for the
release
(1:58:00 PM) koen: RP__: please consider doing >1 bitbake releases before
any oe release
(1:58:12 PM) khem: I have to hand over slugos to Mike W
(1:58:18 PM) RP__: koen: bitbake 2.x you mean?
(1:58:32 PM) koen: 1.13.1 or 1.14.0, whatever
(1:58:36 PM) RP__: koen: right
(1:58:43 PM) fray: ok -- is that it then?
(1:58:52 PM) koen: I've noticed that releases always run into bitbake
release timing issues
(1:59:14 PM) khem: koen: yes bb should be released along with rest IMO
(1:59:26 PM) ***RP__ is going to try and get bitbake release sorted out
(1:59:29 PM) koen: it shouldn't be coupled
(1:59:35 PM) RP__: Its the last remaining thing on berlios
(1:59:40 PM) koen: that why I said >1 releases before :)
(1:59:50 PM) khem: koen: not coupled but proximity
(2:00:01 PM) khem: oh hmm
(2:00:01 PM) RP__: I am going to bump the version soon and make OE-Core
require it
(2:00:11 PM) RP__: so its clear bitbake master is needed for OE-Core
(2:00:24 PM) koen: I think with a few releases to choose from the bitbake
devs will sleep better as well
(2:00:29 PM) fray: will that allow switching the fetcher?
(2:01:05 PM) RP__: fray: We have to consider longer term whether newer
bitbakes continue to support oe-devel
(2:01:18 PM) RP__: or can we drop the fetchv1 codebase
(2:01:27 PM) fray: definitely
(2:01:36 PM) Tartarus: not until oe-devel is r/o
(2:01:42 PM) Tartarus: and then one more release as  the last one for it
(2:01:51 PM) Tartarus: and, outta time :)
(2:01:51 PM) khem: RP__: oe.dev prolly no
(2:01:55 PM) fray: ya
(2:02:09 PM) RP__: Its something to think about...
(2:02:14 PM) fray: meeting over..  any other immediate issues -- mailing
list.. otherwise next week..
(2:02:34 PM) Jefro: cool - see yall, minutes by this time tomorrow or
earlier
(2:02:40 PM) khem: cu
(2:02:45 PM) stefan_schmidt: night folks

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

