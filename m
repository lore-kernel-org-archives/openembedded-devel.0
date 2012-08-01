Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1SwhPA-0005Q7-AP; Thu, 02 Aug 2012 00:28:36 +0200
Received: by ghbz2 with SMTP id z2so7115222ghb.6
	for <multiple recipients>; Wed, 01 Aug 2012 15:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=6EvjPuTeKFqwMTYerIPFgFJnr55tt11qPG/7dIjX5MU=;
	b=e7GLq5GYQVC0IL0VYfszb0bC38s5Cl2Id8paPJ5Wt3cV1gpPD7NKnIzgPJhofPtQZi
	zdex3obFCYc3LDjQimiK0vPBRe486XhTisMzSTWa/uaWzPA+sHLWa4PhpH8zTXMkB2zg
	48rBsvmj91iGUhVxJfI12QSlq4S4kU1k0yTsixrBlgf/k8txVQcdnyXqheR/K93PN5BB
	9ey+uq1JhW7AcmpUPKHjH7wtLMBan5KzjEDgmwgSj/zlZqNjFYwAW6E38w0S0xtJ85cL
	71z+Gq9ZK/QWvgzwy1NHHr8aEZKEI02Yq//hmljW4Kbeq9Bxquyf8iMpCRlTpRL4g+1v
	X6Nw==
MIME-Version: 1.0
Received: by 10.50.188.131 with SMTP id ga3mr6807834igc.54.1343859416518; Wed,
	01 Aug 2012 15:16:56 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.64.102.4 with HTTP; Wed, 1 Aug 2012 15:16:56 -0700 (PDT)
Date: Wed, 1 Aug 2012 15:16:56 -0700
X-Google-Sender-Auth: Kbu5Rx3Xgq0Drpq09di97XiCmWE
Message-ID: <CA+YB3rZoLW7ju9fG3GoqaU6BMMfsRjc3gAOp49moG-KfgqThqQ@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Minutes: OE-TSC 17 July 2012
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
X-List-Received-Date: Wed, 01 Aug 2012 22:28:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
17 July 2012

Attending: Paul, Mark, Khem, Koen, Richard
________________________________________________________________
Agenda & Results

1. pick a chair - RP

2. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"
 -> continue
 b. discuss communication with OE community about release-oriented phases
 -> continue
 c. pre/post install scripting (fray)
 -> continue

3. new issues
 a. oe-made-easy script in getting started instructions
 plan was to note on wiki not officially OE approved
 ok to have a place for contributed scripts, clearly labeled
 => bluelightning to clean up wiki page, move ref to its own page

 b. systemd
 -> good progress, koen has merged meta-systemd split, reviews & patches
 => bluelightning to announce to mailing list

 c. PR bumps
 => koen to investigate server & report back
 => bluelightning to test on autobuilder infrastructure
 -> no progress yet

 d. package.bbclass whitespace cleanup work
 possibly require spaces as whitespace, disallow tabs
 policy is 4-space indentation in python, documented in various places


4. status

 a. Should we still support separation of / and /usr?
 -> enhancement request filed
 => move this to lingering issues (jefro)

 b.  khem to file enhancement request for python devshell  (done)

 c. oe-core release
      there will be discussion on the list about release process
  next release time frame is October 2012
 => khem to ensure we have a place for release tarballs

 d. elections
 -> remove from this list, put back when needed (May 2013)

 e. infrastructure
      Tom K needs to upgrade servers to 12.04 LTS, some downtime coming soon
        not much progress, tom k setting up buildbot
      mailing list issue (koen) - board is coping with it, keep on agenda

________________________________________________________________
Raw Transcript

(9:01:36 AM) khem [~khem@99-57-140-209.lightspeed.sntcca.sbcglobal.net]
entered the room.
(9:01:36 AM) mode (+v khem) by ChanServ
(9:01:48 AM) khem: hello
(9:02:08 AM) ***koen is on a phonecall as well
(9:02:15 AM) koen: so I'll be a bit slow in responding
(9:02:19 AM) khem: I will have to leave early today
(9:02:23 AM) khem: hello koen
(9:02:55 AM) Jefro: hi khem - I am franitcally working on agenda at
http://piratepad.net/ZVsA2a0no3
(9:03:26 AM) RP: In the meantime we should pick a chair
(9:03:32 AM) RP: me?
(9:06:14 AM) ***fray has been either very busy with work or on vacation and
completely disconnected since the last meeting..
(9:06:14 AM) Jefro1: hotel wifi...
(9:06:18 AM) bluelightning: Jefro1: in stereo
(9:06:21 AM) fray: So I don't have anything to report..
(9:06:45 AM) RP: ok, I'll chair
(9:07:16 AM) RP: I don't think there is any change on the lingering issues
in 2. If anyone things differently, please interrupt
(9:07:30 AM) RP: 3a, oe-made-easy script
(9:07:49 AM) koen: oe-single-use script
(9:07:59 AM) RP: Personally, I don't think that should be as predominate in
the quickstart
(9:08:17 AM) bluelightning: I'm not sure it should be there at all myself
(9:08:31 AM) fray: we left it last week that scripts like that were
potentially valuable.. but they shouldn't be listed as official OE
quick-start, since they ay not work as "we" intend..
(9:08:31 AM) koen: I'm with bluelightning
(9:09:28 AM) RP: So any volunteer to clean up that page?
(9:09:35 AM) bluelightning: I can do it
(9:09:38 AM) fray: if people need a quick-start script.. then the guide is
lacking -- or something is too complicated (and maybe a script is needed to
do some of the wor?)
(9:09:44 AM) bluelightning: I did make some cleanups already last week
(9:09:48 AM) bluelightning: er, two weeks ago now
(9:09:51 AM) fray: bluelightning I can help review anything you need, but
won't have time to help directly..
(9:09:56 AM) fray: (least not till next week)
(9:10:03 AM) bluelightning: sure
(9:10:10 AM) bluelightning: it was the decision I was interested in mostly
(9:10:24 AM) ***Jefro can help turn it into English, but also not before
next week
(9:10:42 AM) RP: I'm ok with the reference being removed
(9:11:06 AM) RP: For 3b, I gather there has been good progress?
(9:11:11 AM) RP: (systemd)
(9:11:15 AM) fray: I'd suggest that we have some place where people can
offer unofficial scripts or at least references to them
(9:11:24 AM) fray: but it should be clearly labeled as such..
(9:11:43 AM) bluelightning: fray: we kind of do under scripts/contrib, not
sure how freely we let stuff be dropped in there but it's one possible place
(9:11:47 AM) RP: Yes, I'#d equally be ok with a clearly labelled reference
(9:11:59 AM) fray: I'm more thinking wiki...
(9:12:15 AM) fray: contrib is stuff IMHO the oe project has accepted, even
though not everyone might find it useful..
(9:12:23 AM) bluelightning: right, yes
(9:12:30 AM) fray: these are scripts "not yet accepted" but might be
useful.. no warranty implied.. ;)
(9:12:44 AM) bluelightning: right, yeah it's kind of different
(9:13:23 AM) ***RP agrees
(9:13:37 AM) RP: So what is the action (if any?)
(9:14:33 AM) bluelightning: I'd like to move the reference to its own page;
we can link it as well as linking quick start guides for distros based on
OE-Core
(9:14:44 AM) bluelightning: with caveats added about not being official etc.
(9:14:55 AM) bluelightning: sound OK?
(9:14:56 AM) fray: bottom of quick start page -- clearly deifne (or link to
a different wiki page that clearly defines) the references below as being
user submitted and not supported by the OE project.. they may or may not be
useful to help new users get started
(9:15:04 AM) fray: yes, sounds good to me
(9:15:28 AM) RP: bluelightning: yes, sounds good
(9:15:42 AM) bluelightning: ok, great
(9:15:45 AM) ***RP is happy to leave this in bluelightning's capable hands
(9:15:53 AM) RP: ok, 3b, systemd
(9:15:54 AM) bluelightning: :)
(9:16:03 AM) bluelightning: RP: 3b, seems like good progress to me, I
gather from koen merging the meta-systemd split that he was happy with it :)
(9:16:06 AM) RP: Anything we need to talk about there or see the mailing
lists?
(9:16:19 AM) RP: ok, sounds like good progress
(9:16:26 AM) fray: cool
(9:16:28 AM) bluelightning: only remark I would have is that we probably
ought to make some form of announcement
(9:16:40 AM) koen: bluelightning: I was happy people actually posted and
reviewed patches instead of either bithcing or forking
(9:16:50 AM) RP: Sounds good. Any volunteers for that?
(9:17:14 AM) bluelightning: I can do it if no one else would prefer to...
(9:17:44 AM) RP: bluelightning: crickets so it looks like its you
(9:17:52 AM) RP: 3c: PR bumps
(9:18:03 AM) RP: koen, bluelightning: any updates?
(9:18:18 AM) koen: no, too busy moving house
(9:18:21 AM) bluelightning: no updates here I'm afraid, I will get onto it
this week
(9:18:34 AM) koen: 9 days left till I get wired internet :)
(9:18:49 AM) bluelightning: argh I hate that period after moving
(9:19:10 AM) bluelightning: 3g dongles make life a little easier these days
though
(9:19:29 AM) RP: koen: ok, do you think you'll be able to look at it soon
or not?
(9:19:49 AM) koen: realistically in a week or so
(9:20:01 AM) koen: I need it to work soon, so I am motivated to test it :)
(9:20:39 AM) RP: koen: ok, sounds good! :)
(9:20:54 AM) RP: I sneaked 3d onto the agenda
(9:20:58 AM) RP: package.bbclass and whitespace
(9:21:09 AM) fray: this cleanup work?
(9:21:14 AM) RP: fray: yes
(9:21:23 AM) RP: That file is a mess with a mixture of tabs and spaces
(9:21:36 AM) RP: the trouble is changing it could cause issues with _append
and _prepend of functions
(9:21:36 AM) fray: 'k.. ya I noticed that a week or so ago as well..
(9:21:55 AM) fray: do we have any type of policy in OE, tabs vs spaces?
(should we)/
(9:22:00 AM) RP: I'm seriously considering making bitbake throw errors if
it sees tabs in python
(9:22:01 AM) bluelightning: not the only place unfortunately :/
(9:22:16 AM) RP: fray: the policy is 4 space indentation in python
(9:22:22 AM) fray: ok..
(9:22:24 AM) RP: and it is documented in various places
(9:22:30 AM) khem: I think I will support RP
(9:22:34 AM) fray: (I've always matched what was there.. or at least tried
to)
(9:22:38 AM) RP: Obviously changing this will mean some work cleaning up
layers
(9:22:42 AM) fray: ya
(9:22:46 AM) RP: the nice thing is the errors will be clear ones
(9:23:08 AM) RP: So I'm asking the TSC whether we thing the pain of that
cleanup is worth the gain?
(9:23:22 AM) RP: I don't have a bitbake patch but it shouldn't be hard to
write one
(9:23:27 AM) fray: could this be something we do immediately after the next
release?
(9:23:39 AM) RP: fray: I'm contemplating now
(9:23:43 AM) fray: my concern is, is doing it now a good idea.. (or are we
too far into the cycle)
(9:23:57 AM) fray: he next rlease time frame is October?
(9:24:15 AM) RP: fray: yes
(9:24:25 AM) fray: he->the rlease->release (my fingers must still be on
vacation)
(9:24:27 AM) RP: fray: I think if we do it, I'd prefer to get on with it in
many ways
(9:24:42 AM) fray: 2 months+ seems like enough time to me
(9:25:06 AM) fray: we should announce it a couple days in advance though..
(9:25:36 AM) RP: fray: yes, the idea would be to prepare the patch,
announce on the OE-Core list and warn people, than merge the bitbake change
and start fixing the metadata
(9:25:43 AM) RP: likely correpsonding to a bitbake release
(9:26:29 AM) fray: yup, with 2+ months, that seems fine.. my cut-off would
be 45 days to Oct 1
(9:27:13 AM) RP: ok, if no objections I'll proceed with that
(9:27:28 AM) RP: For 4a, an ehancement request was filed
(9:27:41 AM) fray: cool
(9:27:54 AM) fray: (BTW we should change the 4a heading.. the devshell and
/ and /usr are different..
(9:27:57 AM) RP: We agreed to monitor /usr separation as an ongoing item
(9:27:59 AM) fray: and /usr are ongoing status items
(9:28:17 AM) fray: yup
(9:28:45 AM) RP: So 4a should move to lingering issues from now on I think
(9:28:51 AM) fray: yes..
(9:28:56 AM) RP: 4b is done
(9:28:57 AM) ***Jefro makes a note to do so in future agendas
(9:29:01 AM) RP: 4c - any comments?
(9:29:11 AM) RP: oecore releases?
(9:29:26 AM) fray: no comment other then we need to do so
(9:29:31 AM) fray: and should start soon
(9:30:01 AM) khem left the room.
(9:30:04 AM) RP: well, we do have the branches there
(9:30:17 AM) RP: and should have the tags so it wouldn't be hard
(9:30:29 AM) RP: It was kind of an infrastructure issue in the past, I
think that is better now
(9:30:38 AM) fray: I'm more talking letting people know far in advance
suggested release process..
(9:30:40 AM) RP: Unfortunately we just lost Khem who would know more :/
(9:30:57 AM) RP: fray: ah, yes, we did agree to make that more verbose
(9:30:57 AM) fray: i.e. we're stabilizing here, no longer taking patches
here, planned release here.. (subject to change)
(9:31:12 AM) fray: leaving enough time for the likely on-rush of
last-minute patches based on whatever is sent out
(9:31:13 AM) RP: fray: that is really 2b
(9:31:26 AM) fray: 'k
(9:31:56 AM) RP: fray: I agree we need to do it, I could really use help
with it though
(9:32:16 AM) fray: ya.. it's still on my TODO plate.. next week I can get
on top of it finally..
(9:32:23 AM) RP: fray: ok
(9:32:39 AM) RP: anything more specific we need to talk about there?
(9:32:53 AM) onoffon [~khem@me10536d0.tmodns.net] entered the room.
(9:32:54 AM) mode (+v onoffon) by ChanServ
(9:34:04 AM) RP: for 4d, there was a note for jefro in the last meeting
discussion - we think the date needs amending as Frans pointed out
(9:34:26 AM) fray: yupup
(9:35:09 AM) RP: For 4c (oecore releases), Khem has volunteers to take an
AR to ensure we have somewhere for the release tarballs
(9:35:19 AM) RP: volunteered
(9:35:32 AM) RP: Jefro: I assume you have noted the above?
(9:35:38 AM) RP: (for 4d)
(9:35:43 AM) Jefro: yes, I just saw that & sent a note back to Frans
(9:35:57 AM) RP: Which brings up 4e for which I have no update
(9:36:04 AM) Jefro: I have a calendar item to remind the board next May,
should be sufficient for July election
(9:36:11 AM) RP: Jefro: sounds good
(9:36:16 AM) RP: Jefro: thanks
(9:36:35 AM) RP: So anything for 4e, or any other business?
(9:36:47 AM) koen: not from me
(9:36:53 AM) bluelightning: nothing here
(9:37:02 AM) RP: fray: ?
(9:37:19 AM) fray: nothing here (suddenly having network problems)
(9:37:32 AM) RP: In which case, thanks all and I'll close the meeting! :)

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

