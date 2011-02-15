Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PpQ3b-0003Ve-JE; Tue, 15 Feb 2011 19:55:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p1FIWK6r028688;
	Tue, 15 Feb 2011 18:32:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28539-03; Tue, 15 Feb 2011 18:32:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p1FIWEh2028682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 15 Feb 2011 18:32:15 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tsc <tsc@www.linuxtogo.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-members <openembedded-members@lists.openembedded.org>
Date: Tue, 15 Feb 2011 18:32:11 +0000
Message-ID: <1297794731.4945.312.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: OE TSC Meeting 2011/02/14 Minutes
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
X-List-Received-Date: Tue, 15 Feb 2011 18:55:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Attendees: Khem, Koen, Mark, Richard, Stefan, Tom

Chair for meeting: Richard

The new TSC agreed to meet weekly, on irc and for now, to hold the
meetings in private but publish minutes and the IRC logs. Public but
moderated irc or private irc to be revisited in a few weeks.

The chair for the meetings will rotate. Ultimate responsibility for
reporting back to members lies with the chair.

An offer for help with documenting procedures, organising meetings,
handling agendas and minutes was received from the Yocto Community
Manger. Having someone dedicated and reliable for this role would be
beneficial and it was decided to accept this offer of help. Their role
is strictly to help with process and communication and they are
non-voting.

The agenda for meetings should be published a day in advance.

The mailing list archives for the tsc list should be made easily
publicly accessible (uncloaked). Currently they are already public if
you know where to look (http://lists.linuxtogo.org/pipermail/tsc/).

Election wise, we'll elect the seats in the order from the board
announcement email until we have 5 elected members. We will rely on the
board to call the first election in May.

Agenda items for the tsc can be proposed to the tsc mailing list or by
bringing things to the attention of a tsc member.

All agreed the OE-Core proposal is the way forward so it comes down to
details. We agreed to setup an openembedded-core mailing list to start
the process rolling and ensure patches are kept clearly identified from
the traffic on openembedded-devel. Koen took the action to create this.
We will re-evaluate the need to the separate mailing list in 6 months.

We all agreed to populate an openembedded-core repo starting with Poky.
its clear some things can easily be rearranged/removed/dealt with but
further discussion needs to happen on specifics. Khem and RP will start
looking at the transition and working on patches for this. There was
discussion about the machines to include in the core and it was felt
limiting this to the qemu ones was the simplest to start with.

The TSC then ran out of time but will proceed with the basic actions and
continue the agenda items not covered at the next meeting. We'll aim to
hold a second meeting this week but if that doesn't work out fall back
to next Monday.

Regards,

Richard
(on behalf of the interim-TSC)


IRC logs of the meeting follow:
(NB: in case of any mismatch, the minutes are the agreed outcome of the
meeting)

(21:00:08) fray: everyone here?
(21:00:10) stefan_schmidt: khem: around?
(21:00:19) fray: (I suppose we need role..)
(21:00:36) RP__: I've seen everyone except khem reply
(21:00:51) khem: yes with burger in hand and
(21:01:04) khem: corporate backup freezing my console
(21:01:13) Tartarus: OK
(21:01:22) stefan_schmidt: ok, who takes the lead of this meeting?
(21:01:30) RP__: ok, we have a lot to get through so we're probably going to need to motor on a bit
(21:01:37) Tartarus: stefan_schmidt, would you mind?
(21:01:37) fray: I was suggesting RP since he is the only one from the last group?
(21:01:55) ***RP__ has done this before so doesn't mind doing so
(21:01:58) fray: (but I have no preference)
(21:02:07) stefan_schmidt: RP__: please do it
(21:02:09) Tartarus: RP would be fine too
(21:02:12) khem: #3 - Lets keep the same time weekly
(21:02:40) stefan_schmidt: I'm ok with this if we keep it under 1,5 hours
(21:02:46) _koen_: aye
(21:02:48) RP__: We can schedule any meetings as needed and if we do find there is nothing to talk about when it comes to an agenda we can pass over that week
(21:02:54) fray: I'm fine with this time as long as the meeting is less the 1.5 hours as well
(21:03:00) RP__: It needs to under an hour at this time for me
(21:03:07) khem: yes
(21:03:17) ***_koen_ isn't 18 anymore and would like short meetings as well
(21:03:19) khem: hour is more than enough
(21:03:41) RP__: ok, so one hour this time each week - any objections?
(21:03:45) Tartarus: no objection
(21:03:50) stefan_schmidt: no, fine with me
(21:03:58) khem: ok sold
(21:04:00) khem: next
(21:04:04) RP__: So the format of the meeting
(21:04:09) RP__: irc is probably good?
(21:04:13) RP__: public or private?
(21:04:20) khem: irc is good
(21:04:23) stefan_schmidt: irc fine, public
(21:04:24) Tartarus: I vote irc, public
(21:04:29) fray: I lean toward public (with moderation).. irc is good..
(21:04:33) RP__: Personally having done a few of these before I'm beginning to think we need to be more public
(21:04:38) khem: I would suggest to let people login but not chatter
(21:04:38) Tartarus: So, good point fray
(21:04:47) Tartarus: What I mean is public read-only
(21:04:50) _koen_: I'm gone if it is public
(21:04:51) stefan_schmidt: sure, no voice, just listen
(21:05:01) Tartarus: ANd we ask the public to not try and side line the TSC with private messages
(21:05:07) RP__: _koen_: even moderated public? why?
(21:05:08) fray: Yes, I won't answer side band talk during hte meeting
(21:05:16) fray: (outside of other TSC members)
(21:05:43) _koen_: RP__: we need to be able to discuss people without them listening in
(21:05:56) Tartarus: I disagree
(21:06:01) Tartarus: This is a technical steering committee
(21:06:05) RP__: _koen_: Should the tsc be talking about people?
(21:06:07) khem: well if its listen only then it doesnt matter if we public IRC log later or live
(21:06:08) stefan_schmidt: We should not discuss people here but technical stuff
(21:06:15) RP__: I did noticed the new TSC charter doesn't cover people
(21:06:19) fray: If that becomes an actual issue we can have a closed meeting, but I don't see that as an issue in the near future
(21:06:28) RP__: Just the technical contributions from people
(21:07:02) _koen_: I'm not opposed to giving out an (edited) log later
(21:07:08) _koen_: but live, no
(21:07:42) RP__: How about live unless we call differently in advance?
(21:08:04) _koen_: still no
(21:08:05) RP__: I do think the tsc has suffered in the past due to transparency issues
(21:08:26) fray: transparency is my only worry, since we were not elected but appointed
(21:08:27) _koen_: yes, because you didn't even send out minutes
(21:08:39) Tartarus: So, looking forward
(21:08:41) _koen_: or inform involved parties
(21:08:44) khem: I would suggest we start by sending out the agenda and minutes and IRC logs
(21:08:52) Tartarus: The concern about having the public read only during the meeting is what?
(21:09:02) Tartarus: If we had to discuss a specific person or persons?
(21:09:09) Tartarus: Which isn't exactly in our charter
(21:09:11) _koen_: Tartarus: reading comprehension fail by the italians for one
(21:09:29) Tartarus: Ahem
(21:09:46) Tartarus: Reading into what is or isn't said
(21:09:53) Tartarus: Will happen regardless of how we report back
(21:10:08) RP__: _koen_: Surely we have that problem with anything we provide, irc logs, minutes or anything else?
(21:10:20) _koen_: but with non-live we have coherent minutes to go with the log
(21:10:36) Tartarus: We are talking about read only, and with a request that people not try and sideline us
(21:10:45) Tartarus: If someone insists on trying to sideline, they should be ignored
(21:11:01) Tartarus: We can enforce read only of course
(21:11:02) RP__: irc has plenty of ways of dealing with sideband...
(21:11:17) khem: if there is interest in community member to be listening audience then we can organise a separate meeting for sensitive issues like _koen_ mentioned
(21:11:20) _koen_: I worry more at people reading a few lines, missing contexts and going of spreading misinformation
(21:11:32) khem: that can happen yes
(21:12:08) Tartarus: Or people skim the minutes and mis-interpret
(21:12:12) Tartarus: I'm still not seeing a new problem
(21:12:19) fray: Ok, we can all agree meeting minutes and (edited?) irc log as the output of each meeting?
(21:12:29) _koen_: fray: I can agree to that
(21:12:35) fray: (edited to avoid misunderstandings that is)
(21:12:35) RP__: I'm fine with that
(21:12:43) khem: me too
(21:13:07) stefan_schmidt: I want to see the diff but then ok
(21:13:07) khem: if members still are interested to listen in we should consider that
(21:13:08) Tartarus: Edited for clarity and not content?
(21:13:10) fray: lets start with that for a few meetings and see if anyone in the OE community objects or requests to listen in.. if there are no requests that we don't worry about it.. if there are we reevaluate?
(21:13:11) RP__: I do think we need to consider opening this up and we should revisit in a few weeks
(21:13:26) RP__: fray: We're thinking similar things...
(21:13:53) fray: Ok, then my vote for now is "closed" meeting with the outcome being logs and proper meeting minutes..
(21:13:55) _koen_: if people really wanted to be involved, they should have stepped up
(21:13:55) khem: alright: so we have a decision here I guess
(21:14:02) RP__: Ok, next, do we need a chair person for the meetings and for the tsc
(21:14:07) fray: along with something standard that if they want to listen/be involved that we ask them to contact us
(21:14:12) RP__: I did get a specific request from the board to discuss this
(21:14:35) Tartarus: I think we should do rotating meeting chair, but not Head Honcho of the TSC
(21:14:50) _koen_: with 6 tsc members we would need a tie breaker in theory
(21:14:56) khem: heh
(21:15:03) fray: what are the chair responsibilities -- meeting management only, or do they need to report to the board.. people, etc or?
(21:15:08) _koen_: but I agree with Tartarus
(21:15:08) Tartarus: (and if needed look at the way other groups run meeting on IRC, I think ChanServ can help here with some keywords)
(21:15:26) RP__: The chair is going to be repsonsible for the meeting and reporting back to members
(21:15:28) fray: rotating works great if there are no real reports.. but if the board is expecting something concrete from a chair, then we should have either one -- or someone who represents us to talk to them
(21:15:50) RP__: Its not so much the board but the members we do need to communicate with
(21:16:10) RP__: As for tied votes, I did hear the comment that if we tie, we fail and deserve to deadlock on the issue
(21:16:20) RP__: which doesn't help much :)
(21:16:37) stefan_schmidt: Rotating chair sounds good to me
(21:16:37) RP__: can't be that important, right? :)
(21:16:45) _koen_: I don't really see that happening, so cross that bridge when we get there
(21:16:49) fray: if we tie on something, I do think thats a sign that the topic likely needs further work.. (I'd default to denied vs approved on a tie)
(21:16:52) stefan_schmidt: Should send out agenda upfront, lead meeting and send log + minutes
(21:17:11) fray: I'm fine with rotating..
(21:17:17) khem: For meeting yes rotation is fine
(21:17:19) RP__: ok I think we have a consensus 
(21:17:20) stefan_schmidt: That also would avoid the mess we did with the agenda today
(21:17:46) RP__: so whilst on this topic, I have the offer of some process/admin type help from the yocto space
(21:18:01) RP__: I did forward the email to the group earlier, I think previously only stefan_schmidt saw it
(21:18:20) stefan_schmidt: RP__: yup, what _exactly_ would this person do?
(21:18:28) fray: I read that, I certainly prefer process/admin help over doing it ourselves..
(21:18:48) RP__: stefan_schmidt: collect up the agenda, organise the meetings, take notes, help give feedback to the community
(21:19:05) RP__: we'd still have to read the minutes, sign off and then the chair email them to the members
(21:19:07) khem: what sort of functions will it support us on
(21:19:11) khem: ah
(21:19:12) fray: that to me sounds like a non-voting meeting secretary?
(21:19:18) RP__: yes
(21:19:19) stefan_schmidt: sounds good to me
(21:19:22) fray: that works for me
(21:19:32) RP__: the person would be non-voting, I want to be very clear about that
(21:19:40) RP__: In the past the TSC has sucked on things like this
(21:19:40) _koen_: sounds really good to me
(21:19:57) RP__: I know I haven't done well so I went to see if I could find help...
(21:20:00) stefan_schmidt: that would be less options to fail for us ;)
(21:20:02) khem: ok thats good
(21:20:30) RP__: Ok, so I will ask Jeff to attend the next meeting and explain things to him so he can collect up an agenda
(21:20:30) Tartarus: Sounds good
(21:20:37) RP__: I'll give him this log in fact :)
(21:20:56) RP__: I'm also hoping he can help defined and document procedures too, something else we've done badly at
(21:21:21) khem: yes that would be nice too
(21:21:28) RP__: (define meaning write them down and then get signoff from the tsc as appropriate)
(21:21:39) _koen_: does that cover the procedural stuff?
(21:21:50) khem: I guess so
(21:21:55) fray: I think that was everything
(21:21:57) _koen_: so, onto the next items :)
(21:22:16) Tartarus: Did we cover #13?
(21:22:26) Tartarus: making the TSC list archives publically findable?\
(21:22:30) RP__: Should the TSC list archives be public?
(21:22:42) RP__: Since they already are there I think we might as well make the more accessible?
(21:22:48) khem: sure
(21:22:49) fray: At this point I don't see why they couldn't be..
(21:22:51) _koen_: I agree with RP
(21:22:57) Tartarus: Again, I vote yes since it's a technical list
(21:23:00) stefan_schmidt: agreed
(21:23:03) _koen_: and in contrast to the previous TSC, we should actually use the list
(21:23:11) RP__: agreed
(21:23:15) stefan_schmidt: We should put a link on the TSC wiki site
(21:23:17) Tartarus: If we can fix bounces :)
(21:23:35) stefan_schmidt: Tartarus: only @www... bounces. We got the list wrong..
(21:23:42) RP__: ok, next thing we need to talk about is elections and a transition to an elected tsc. Lets get the procedural stuff out the way
(21:23:48) stefan_schmidt: Tartarus: with @list.. all should be fine
(21:24:15) ***stefan_schmidt will put a link in the wiki
(21:24:17) RP__: (I'm going to keep moving, please just interrupt if there is anything left to discuss, agreement will be assumed unless stated otherwise)
(21:24:18) _koen_: RP__: I disliked the wording of the board announcement
(21:24:24) khem: RP__: election are board thing arent they
(21:24:32) RP__: _koen_: Which bit?
(21:24:42) RP__: khem: The board has left us to decide how to transition
(21:24:42) _koen_: instead of "stepping down" I would say "put your seat up for election"
(21:24:47) fray: khem, the key is which seats go up for election every two months..
(21:24:49) _koen_: so you can opt to run again if you wish
(21:24:57) khem: RP__: ok I would propose to keep the existing voting
(21:25:04) RP__: Regardless of what the board said, we need a plan
(21:25:12) RP__: khem: right but we need details
(21:25:32) khem: I think we can take Xora's help
(21:25:39) RP__: There is an election happening every two months from May
(21:25:43) _koen_: we need at least a month between elections to covers the voting period
(21:25:44) khem: and the process takes around 2 months
(21:26:05) Tartarus: Can we get a link to the actual proceedure as it is today?
(21:26:14) _koen_: heh
(21:26:22) _koen_: there is no real procedure
(21:26:46) _koen_: the first TSC was giving lots of freedom to define its own
(21:26:53) RP__: There is a voting procedure
(21:26:56) khem: http://www.openembedded.org/index.php/Online_Voting_Policy
(21:27:00) RP__: That is clearly defined
(21:27:14) _koen_: but the juicy stuff like terms
(21:27:15) Tartarus: That's what I was thinking
(21:27:19) RP__: The board has indicated an election for a seat every two months
(21:27:24) Tartarus: So it takes 4 weeks, roughly
(21:27:35) RP__: and a one year term for each tsc member
(21:27:44) Tartarus: And every two months someone from the interirm goes for a real vole
(21:27:46) Tartarus: s/vole/vote/
(21:27:50) RP__: So the question is come May, who's seat becomes up for election
(21:27:58) khem: Mine
(21:28:00) Tartarus: Alphabetical?
(21:28:14) Tartarus: I'm fine going 1st or 2nd or whatever, too
(21:28:30) RP__: I think the order in the board email is probably as good as anything
(21:28:31) fray: I'm fine with alphabetical or choosing.. it really doesn't matter to me.. (as long as we all know when it's our time)
(21:28:45) RP__: but again I have no real preference if anyone has a better approach
(21:28:57) RP__: (board email was alphabetical)
(21:28:58) _koen_: I have no preference either
(21:29:03) khem: me too :)
(21:29:10) RP__: ok, alphabetical as per the email
(21:29:21) RP__: anyone interested stands for the single position
(21:29:22) RP__: done :)
(21:29:37) khem: what is the order
(21:29:52) RP__: Er, I can fine the email...
(21:29:53) Tartarus: khem, koen, fray, RP, stefan, me
(21:30:01) khem: ok
(21:30:47) Tartarus: ok, so on to technical issues now?
(21:30:48) RP__: So I think we have one more procedural thing
(21:30:51) Tartarus: oh
(21:30:58) RP__: How does the membership raise issues to the TSC?
(21:31:16) fray: currently I'm trying to watch IRC, and the main OE mailing list for things to bring up..
(21:31:18) stefan_schmidt: JFYI: I added the TSC list archive in the TSC wiki page
(21:31:21) RP__: We once defined a scheme for this and then spectacularly failed at implementing it, probably my fault
(21:31:27) khem: they can add it to agenda or send email to tsc ml
(21:31:31) fray: otherwise I think they should email us, or the TSC list
(21:31:42) RP__: The TSC list is moderated, are we still happy with that?
(21:31:45) fray: the agenda is the right way...
(21:32:03) RP__: What emails do we accept there and not accept?
(21:32:04) stefan_schmidt: RP__: Who moderates it?
(21:32:09) RP__: stefan_schmidt: "us"
(21:32:09) _koen_: with weekly meetings, the agenda is indeed the right way
(21:32:20) stefan_schmidt: RP__: :)
(21:32:20) khem: or thirdly they can email members too if they think thats better
(21:32:24) Tartarus: If we can get the agenda out say 25h in advance
(21:32:34) Tartarus: That would give everyone a day to see and reply for a new item
(21:32:34) stefan_schmidt: RP__: tsc list, devel list or members should be enough
(21:32:56) khem: Probably we should setup agenda as a wiki page
(21:33:06) stefan_schmidt: yep, getting the agenda out a bit earlier would be good. Still we need to have it final at some point
(21:33:25) RP__: Do we do something like ask people to post to OE-devel asking for tsc attention and "we" forward it to the tsc list if we think it warrants it?
(21:33:57) stefan_schmidt: RP__: would make sense to have it on the tsc list as mail
(21:34:04) RP__: I'm just wondering what the moderation means there
(21:34:14) khem: if one of us thinks yes but it should not bar people from sending via the modes we talked earlier
(21:34:16) fray: seems like it would make sense to put a request for agenda items with the meeting minutes of the last meeting..
(21:35:02) RP__: so leave moderation set but pass messages that make sense for the tsc?
(21:35:13) fray: fine with me
(21:35:18) RP__: ad yes, collect up items for the agenda
(21:35:43) RP__: ok, I just wanted to clarify the groundrules as it helps if we're all on the same page
(21:35:44) stefan_schmidt: yes, leave moderation and pass on if needed
(21:35:50) RP__: I think we can move to technical stuff now
(21:35:59) khem: RP__: yes 1. add to agenda 2. Send message to OE ml or tsc memeber 3. TSC member send potential discussion topics to tsc ml
(21:37:06) RP__: So, do we jump to OE-core?
(21:37:13) stefan_schmidt: yes
(21:37:14) khem: I guess yes
(21:37:17) RP__: So as far as I'm aware the best documented OE-Core plan is still the email I sent: http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/028767.html
(21:37:33) RP__: This has a number of questions I still don't think we have good answers to
(21:37:49) RP__: Is everyone one board with this plan in principle before we start on details?
(21:38:32) Tartarus: Yes, I think it'll be easier to add missing improvements from openembedded.master to a poky base than vice versa
(21:38:33) _koen_: I'm already on recorded with "yes" :)
(21:39:17) RP__: Assuming no objections, there are some basic actions we need:
(21:39:17) RP__: 1) Setup oe-core mailing list
(21:39:17) RP__: 2) Setup up oe-core repo based on a poky checkout
(21:39:17) RP__: 3) Write down commit process for oe-core
(21:39:17) RP__: 4) start converting the poky checkout into oe-core
(21:39:36) stefan_schmidt: agreed on the principal plan
(21:39:42) RP__: The question is who is going to do what (and whether we all agree on these)
(21:40:06) RP__: (nothing I state btw is set in stone, I'm just setting things up for discussion)
(21:40:17) khem: I can help with 2,3,4
(21:40:17) RP__: We have limited time so I'm trying to move quickly
(21:40:41) stefan_schmidt: RP__: whats the benefit of 1?
(21:40:51) stefan_schmidt: Instead of using poky or oe-devel?
(21:40:54) Tartarus: stefan_schmidt, to keep the bugs/churn separate
(21:40:55) RP__: stefan_schmidt: I want to have one place for core patches
(21:41:06) _koen_: have a focussed list to send patches/bugs and discussions
(21:41:06) Tartarus: I think long term it should go back into oe-devel
(21:41:08) stefan_schmidt: Hmm, ok
(21:41:14) Tartarus: But for now, to avoid confusion
(21:41:21) _koen_: it also makes it easier for patchwork
(21:41:25) RP__: I disagree, we need some way to keep the patches clearly identified
(21:41:27) stefan_schmidt: ok, no strong feelings here. fine with me
(21:41:32) _koen_: different x-list-id == different project
(21:41:50) khem: yes oe-core will be a project in itself
(21:41:59) RP__: When a patch lands in my inbox I need to easily tell what repo its against
(21:42:05) khem: so all activity is better of in oe-core ml
(21:42:07) _koen_: RP__: let's go with seperate for the time beiing and reevaluate in 6 months or so
(21:42:08) RP__: and I will be telling poky people to use this list
(21:42:39) stefan_schmidt: ok, who can do 1?
(21:42:45) RP__: ok, reevaulate in 6 months
(21:42:49) Tartarus: (when I say long term, I think a year out, but maybe slightly less, depending on when we can really get everyone off of the old model)
(21:42:58) Tartarus: But yes, re-eval in 6 months
(21:43:00) khem: I think koen has admin on ltg :)
(21:43:25) RP__: I can offer lists on yoctoproject.org but I'm guessing that would be objected to?
(21:44:05) stefan_schmidt: I don't care where a list is
(21:44:06) khem: if you can run then under oe.org name I think hosting might be ok IMO
(21:44:31) fray: I do think the "core" needs to be controlled and seperate as well. This will allow us to have a stable set of software to use the build system against and provide concrete examples of how changes need to be made to the "main" set (non core) packages..
(21:44:37) Tartarus: I think think the OE project is ready yet to use yocto infrastucture in places where OE has it's own sufficient setup
(21:44:53) Tartarus: So LTG for the list & patchwork
(21:45:03) RP__: khem: Splitting things between l2g and yp.org might be tricky, as I think l2g uses the oe domain space
(21:45:04) fray: the core also gives "us" the ability to define some basic policies for use within OE.... (if people don't like the policies then changing it in the bigger set of packages is their right)
(21:45:22) Tartarus: (Given that people expressed concern about 3rd party official mirrors...)
(21:45:35) _koen_: 'oe-core' or 'openembedded-core'?
(21:45:36) RP__: I will mention that longer term, yocto might be able to help OE
(21:45:48) fray: I have no preferecne for mailing lists and infrastructure at this point.. I'm fine with OE
(21:45:50) Tartarus: Are we going to call the repo oe-core or openembedded-core?
(21:45:55) fray: "oe-core" would be my suggestion
(21:45:56) khem: openembedded-core
(21:46:07) RP__: Currently OE uses rack space from the nslu2 project, yocto will have its own LF owned rack
(21:46:15) fray: "oe-core" for the mailing list name, openembedded-core@... for the email addr
(21:46:22) fray: I think this matches the curernt oe list
(21:46:32) Tartarus: name vs email addr split works for me
(21:46:47) khem: we do not use OE RP__ yes if yocto is providing infra support then that could be taken as positive in community I think
(21:46:52) Tartarus: And I think we need to re-visit longer term OE making use of LF for instracture, but that's also a board thing and all that
(21:47:04) stefan_schmidt: naming is fine with me
(21:47:07) fray: so then is the core the build environment & core meta data or just core meta data (or build system)? want to make sure this is clearly documented as to what is in the core, and the purpose since this is new..
(21:47:42) khem: RP__: that item #18 on agenda on infra
(21:47:46) stefan_schmidt: yup, I'm not sure on where to draw the line either
(21:48:16) Tartarus: Well, bitbake won't be in the repo
(21:48:20) RP__: ok, so repo name openembedded-core is fine, we can setup shorter aliases locally :)
(21:48:24) khem: fray: it will be build+core recipes
(21:48:45) fray: external of OE and Yocto.. I'm used to the build system (this would include bitbake and the classes) as a seperate entity then the meta data.. (meta data being the recipes and default configurations).. but I'm not against them being "together" in the core.. since they're not useful without each other..
(21:49:05) khem: I would suggest to keep bitbake separate
(21:49:08) khem: repo
(21:49:10) RP__: So since we're talking about poky as being the basis of this, what in Poky is what we'd make oe-core?
(21:49:10) khem: as it is now
(21:49:12) fray: so we're looking at bitbake+oe-core (classes, conf and core meta-data) as the functional core?
(21:49:43) RP__: fray: actually bitbake gets split out as per "upstream"
(21:49:46) ***khem keeps the time we have 10 mins left
(21:49:54) _koen_: http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core should be live now
(21:49:59) ***_koen_ sucks at sysadmin stuff
(21:50:28) RP__: My proposal for poky is to remove bitbake, take out recipes-sato and the scripts stuff
(21:50:32) fray: RP__ that is where I get a bit fuzzy in my knowledge. I think the overall breakdown of the meta data (the recipes) is good in Poky.. I'm don't care much about who's recipes are used as long as we can limit the set to one or two versions.. (two when we have a technical or other reason to have two.. such as the GPLv3 vs not)
(21:50:41) RP__: What else would we remove?
(21:50:50) stefan_schmidt: RP__: that sounds good to me
(21:50:54) Tartarus: Some / all of the BSPs?
(21:51:08) fray: RP__ I'm fine with that -- with the understanding we need to sync (verify?) the related recipes within the OE versions to look for integration issues and/or bug fixes that are different
(21:51:17) RP__: Tartarus: All machines? Leave the qemu ones?
(21:51:26) _koen_: RP__: namespacing needs to get changes, e.g. a lot of s/POKY/OE/g
(21:51:28) Tartarus: I think I like leaving qemu* in
(21:51:31) khem: RP__: I would add to what yocto core has as of now
(21:51:33) Tartarus: And amking real hardware separate
(21:51:34) fray: within the "core" I suggest the QEMU set be the basic set.. and perhaps a very small set of actual boards..
(21:51:45) RP__: Poky distro config also needs to go away
(21:51:46) fray: then in the main OE everything else is added/available
(21:51:53) RP__: _koen_: I don't think there are that many tbh
(21:51:56) Tartarus: I suspect for real HW there will be active overlays for popular HW
(21:52:01) _koen_: only qemu in core woudl be good
(21:52:08) fray: qemu only is fine with me
(21:52:13) _koen_: seeing how bad the beagle support is in yocto </pet peeve>
(21:52:18) RP__: likewise, fine with me
(21:52:27) khem: yes it should be qemu only
(21:52:28) Tartarus: OK
(21:52:28) RP__: _koen_: help us fix it? ;-)
(21:52:31) ***RP__ hides
(21:52:31) Tartarus: So, who can start on some of this?
(21:52:35) fray: what abotu the basic image tasks? poky-image-minimal, etc.. what would stay and go there.. (other then likely the Poky name)
(21:52:38) Tartarus: khem said he can help on 2/3/4
(21:52:40) Tartarus: Who else?
(21:52:42) RP__: _koen_: seriously, thats something for a different place
(21:52:43) _koen_: RP__: I followed your advice, it's a layer now :)
(21:52:47) Tartarus: I'm a little tied up this week I think
(21:52:48) stefan_schmidt: qemu only is fine
(21:53:08) Tartarus: fray, a basic set of images is also needed
(21:53:14) _koen_: I'm also tied up this week with customer visits
(21:53:14) RP__: My overriding concern is ensuring yocto can keep in sycn with this
(21:53:20) Tartarus: a "it's a minimal image" "it's a graphical image"
(21:53:22) khem: yocto is primarily focussed on eglibc I would also suggest to have uclibc in core
(21:53:26) fray: Tartarus I agree.. does OE have a set currently? or should we start with the Yocto set?
(21:53:28) Tartarus: "it's an exportable sdk or whatever"
(21:53:34) RP__: We're coming up to release so I don't want to do anything too evil but making the split for yocto 1.0 would be nice
(21:53:47) Tartarus: fray, some are more distro specific than others
(21:53:50) Tartarus: meta-toolchain is good
(21:53:57) RP__: What do we do as a distro config in oe-core?
(21:53:59) Tartarus: console vs minimal image is less clear
(21:54:21) fray: I have a design for a series of basic filesystem confgiurations that we could choose to use..
(21:54:23) Tartarus: RP__, some sort of combination of poky/minimal that we call sampledistribution ?
(21:54:34) _koen_: heh, minimal
(21:54:36) Tartarus: And poky has an overlay, angstrom has an overlay, minimal has an overlay?
(21:54:36) fray: It has a lot more steps then simply minimal and graphics..
(21:54:48) khem: We should have just busybox image which is probably minimal-image and then a graphical image and full fledged console image may be
(21:54:48) _koen_: can we at least not use any angstrom ripoffs like minimal?
(21:55:08) Tartarus: _koen_, to me, minimal exists as a way of saying "here's a sample place to start"
(21:55:20) RP__: I'd acutally like to see standard images the distro config can adjust
(21:55:25) Tartarus: and I really really really want to avoid the whole "angstrom had a great idea, lets rip it off!" that happened before
(21:55:36) RP__: and a defined meaning so a user knows what roughly to expect
(21:55:43) Tartarus: RP__, agreed
(21:55:50) fray: Set I have in mind is "filesystem", "single application", "small busybox", "full busybox", "small discrete" (non busybox utils), "basic system" (no busybox at all), graphical, and "LSB"
(21:55:55) RP__: Ok, how about people propose some patches to poky?
(21:55:57) Tartarus: Which is what I meant with a combo of poky/minimal, both of which to me are starting points
(21:55:59) RP__: I'm happy to work on this too
(21:56:13) stefan_schmidt: RP__: Would you have time to work with khem on this? One from OE one from Poky you know...
(21:56:15) RP__: In fact I might well take a first stab and see what people think
(21:56:18) _koen_: I think we should have no distro in core
(21:56:38) Tartarus: _koen_, OK, but how do we validate things?
(21:56:46) fray: We need to have a way to build the core to validate it.. it should work standalone..
(21:56:47) khem: koen: yes there should be sample distro only in core
(21:56:48) Tartarus: That to me is the upshot of having "sampledistro" in tree
(21:57:00) fray: but it is just that, a basic sample distro
(21:57:11) _koen_: khem: no, no distro *at all*
(21:57:19) khem: this sample distro should have no policies
(21:57:25) stefan_schmidt: then we could just go with poky
(21:57:30) khem: it should just use what ever recipes are there
(21:57:43) Tartarus: _koen_, I think we need _something_ so that there's a reference frame
(21:57:48) khem: _koen_: thats pretty much what I think
(21:57:53) Tartarus: But it indeed should not inherit some of the poor legacy of minimal
(21:57:56) RP__: Ok, this is going to have to wait until the next meeting as I don't think we can do this justice now
(21:58:03) RP__: When is the next meeting? One week?
(21:58:08) khem: Yes
(21:58:10) RP__: or can we try and have another later this week?
(21:58:17) RP__: We have a lot to get through :/
(21:58:18) Tartarus: RP__, agree on tabling and same time next week
(21:58:19) fray: For sure next week, but we may want another in a couple of days
(21:58:19) khem: do we have any action items
(21:58:26) fray: (or even tomorrow if necessary)
(21:58:28) Tartarus: We can make some progress now, even w/o that question settled
(21:58:36) RP__: Agreed
(21:58:52) stefan_schmidt: So RP__ and khem will start on filling the repo?
(21:58:52) RP__: Also, I'd note we are going to try a pull model for this and we should try and put that into practise
(21:58:53) Tartarus: and I can also meet later this week if we want
(21:59:04) fray: AI's would be to create the oe-core infrastructure right? mailing lists and possible repo? (I'd make the caveat we may have to reset the repo a few times to get it "right)
(21:59:23) stefan_schmidt: fray: list is done
(21:59:27) khem: RP__: yes it will strictly be pull based
(21:59:58) fray: the core has to be pull based.. thats the only way to IMHO to ensure quality and responsibility over the subset of components..
(22:00:10) stefan_schmidt: agreed
(22:00:28) stefan_schmidt: I don't think people will argue about pull in the core
(22:00:30) khem: We made a good progress today
(22:00:47) khem: at every hour this horrible backup kicks in on this box :(
(22:01:06) stefan_schmidt: better backup then sorry ;)
(22:01:21) stefan_schmidt: Trying to arrange another meteing this week via mail?
(22:01:31) stefan_schmidt: if that fails next week
(22:01:42) RP__: I think that sounds like a good plan
(22:01:42) _koen_: I think I'm available this week most of the time
(22:01:48) RP__: I can be around too
(22:01:51) khem: ok
(22:01:53) khem: me too
(22:01:54) RP__: I am in another meeting now though :/
(22:01:55) stefan_schmidt: me too
(22:02:00) fray: tell me when and where and I'll find hte time..
(22:02:04) khem: should I proceed with setting up the repo skeleton ?
(22:02:10) khem: on git.oe.org
(22:02:20) RP__: khem: Push in poky?
(22:02:25) fray: khem, I think it's a good idea to.. just make sure everyone who uses it knows it could go away and be replaced with a different skeleton..
(22:02:35) fray: we need to agree on the content before we call it the "starting point"
(22:02:53) khem: fray: yes thats true
(22:03:02) Tartarus: Well, we also want it to be a clone of poky
(22:03:03) Tartarus: - stuff
(22:03:07) Tartarus: So we can keep it in sync
(22:03:08) stefan_schmidt: agreed, start filling is good and then we can judge
(22:03:09) Tartarus: At least for now, imho
(22:03:29) khem: I think we need to get it underway and then have stuff moved around
(22:03:43) fray: agreed..
(22:03:48) _koen_: who can setup patchwork for the oe-core list?
(22:03:50) khem: as we all agree its starting off from poky we can import it unmodified
(22:03:59) khem: and then rework towards the better structure
(22:04:05) stefan_schmidt: ack
(22:04:11) khem: I can set that up
(22:04:21) stefan_schmidt: _koen_: I think crofton can do this
(22:04:31) stefan_schmidt: oh, khem as well. Even better.
(22:04:36) fray: I likely will have time this week to go over the corresponding OE recipes and look for different patches/bug fixes then what is in Yocto/Poky..
(22:04:47) fray: I just need a bit of guidance on when to start..
(22:05:28) _koen_: the X stuff has the biggest delta I think
(22:05:41) fray: koen, versions or patches or?
(22:05:43) stefan_schmidt: time to head to bed for me. night folks.
(22:05:51) fray: (BTW is the meeting over? I think it is)
(22:05:53) _koen_: fray: structure
(22:05:59) stefan_schmidt: its over.
(22:06:02) _koen_: e.g. libx11-slim, xserver naming ,etc
(22:06:04) fray: good, ok..
(22:06:09) _koen_: stefan_schmidt: 'night
(22:06:13) fray: gnight
(22:06:17) stefan_schmidt left the room (quit: Quit: Leaving).
(22:06:30) _koen_: I warmly welcome people to push to meta-oe as well :)
(22:06:33) khem: gnight all
(22:06:40) fray: For many of the xorg things the organization and naming are straight forward matches to upstream X.org..
(22:06:40) _koen_: it's a bit one sides at the moment
(22:06:46) khem: _koen_: can you subscribe oepatches@gmail.com to the oe-core ml ?
(22:06:50) fray: but some of the alternative configurations I think we need to figure out
(22:07:10) _koen_: I'm not saying the yocto x11 stuff is bad
(22:07:23) _koen_: just that it is quite different from OE
(22:07:28) fray: I'm inclined to say that the 'core' set be simply the upstream X.org
(22:07:42) fray: but I fully admit I'm not a graphics expert here..
(22:09:34) fray: ok.. I've got to run to get my kid from school. Let me know what you'd like me to look into and I'll find the time..
(22:09:59) ***_koen_ zzz now
(22:10:03) _koen_: 'night all
(22:10:11) khem: _koen_: I have added the pw
(22:10:25) khem: you need to subscribe that email addy to the ml
(22:11:11) khem: http://patches.openembedded.org/project/oe-core/list/
(22:11:21) _koen_: mail me the instructions and I'll look at it in the morning
(22:11:27) ***_koen_ really zzz now :)
(22:11:30) khem: kk
(22:11:31) khem: gn
(22:14:58) Tartarus: OK, since we've got the meeting done and to encourage folks to use the ML
(22:14:59) Tartarus left the room.
(22:16:05) _koen_ left the room (quit: Ping timeout: 255 seconds).
(22:16:11) khem left the room.




