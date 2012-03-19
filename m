Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1S9kuz-0005Gh-7I; Mon, 19 Mar 2012 23:19:09 +0100
Received: by iaag37 with SMTP id g37so9894221iaa.6
	for <multiple recipients>; Mon, 19 Mar 2012 15:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=y9laaIvXVK318E18UoMhUmCJ5TDjSBgxHn71Iyb4EBQ=;
	b=aH1qUNqmhZFNSCmik17qPKBPumAhi1WBaqnWc96/9iCfEXGclxoGUXYpivbFLo0KsO
	oSDuybIoSLFbKroW2vP02BMch188M6R6GoyJwzqx8pRAfkVBaZkCE/suNoySL8pC3jiJ
	cVzd+NL1AJM8pUJYnfgckFuWWtqmOHPKijpB0oWC/x35DoORgV5PkTQBmtzv34z0Hxnt
	wNRnSJqmx0R+XLNFeKFK31hKpREw5lMArahprpSTbSJHR1JadfX9FgLLfdixhCaC4mwo
	EuWpXJVuZ1HPW9bTcWa1BFVzmibCK2xJwh8xubNCq27Woki4zRWx913ASwb5fCLwbIDf
	AI7A==
MIME-Version: 1.0
Received: by 10.50.169.9 with SMTP id aa9mr7296442igc.23.1332195016804; Mon,
	19 Mar 2012 15:10:16 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.50.127.38 with HTTP; Mon, 19 Mar 2012 15:10:16 -0700 (PDT)
Date: Mon, 19 Mar 2012 15:10:16 -0700
X-Google-Sender-Auth: ShH3f5qg5DUQKPa2nmFyRFhfaUQ
Message-ID: <CA+YB3rbZqhGf7cCbM=MR5i5OsM31qKZKvaz32eHQ0q92n24F-A@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: MINUTES: OE TSC 13 March 2012
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
X-List-Received-Date: Mon, 19 Mar 2012 22:19:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
13 March 2012

Attending: Richard, Paul, Mark, Tom
Apologies: Khem
Minutes: Jefro

________________________________________________
Agenda

1. pick a chair
-> RP

2. open issues

   a. IMAGE_FSTYPES (Tartarus)
=>    poking people to read & reply on list

   b. need more QA - warnings reduction, stress test of sstate,
      fixing autobuilder regressions (RP)

   c. conferences - Collaboration Summit
      yocto project working day on weds at collab
      for working day

   d. raise awareness of "janitor" list, QA "bugs"
      requires more publicizing, getting more people involved
      going to rework the wiki page into the bugzilla so we track
        things in one place, then generate a summary of open tasks
        for the wiki automagically
      separate janitorial tasks from actual bug fixes
=>    RP will mention idea to Darren & Sean
=>    all - please think of other ways to get people involved

3. status

   a. elections
      fray reelected
      Tartarus next, then cycle complete
=>    RP to ping board, roll into new election right away

   b. infrastructure
      RP acknowledge Michael Halstead's work on the OE server
        in speeding up git access; Paul agrees, much appreciated
      web issues brought down ltg & ml archives a few weeks ago
        list archives back now

   c. oe-core release
      feature freeze in 1 week
      final freeze 2-3 weeks from 18 Mar

________________________________________________
Raw Transcript

(9:16:19 AM) RP__: Jefro: do you have an agenda?
(9:18:05 AM) ***fray wonders if jefro fell off the internet
(9:18:42 AM) RP__: lets assume he has :/
(9:18:49 AM) RP__: agenda items?
(9:19:09 AM) RP__: Well, lets start with the janitor and QA bugs
(9:19:15 AM) fray: sounds good
(9:19:19 AM) fray: (is someone logging?)
(9:19:27 AM) ***RP__ is
(9:19:51 AM) RP__: For those who were in the Yocto technical meeting
before, I laboured a point about the number of warnings our builds generate
(9:20:00 AM) RP__: I'm rather unhappy about this
(9:20:21 AM) RP__: I'm doing my bit to reduce the numbers but I'd
appreciate more people helping out
(9:20:38 AM) RP__: Sean mentioned there are some sstate issues and that our
QA tests probably aren't good enough
(9:20:54 AM) RP__: I pointed out that even the QA issues we know about
right now aren't getting fixed
(9:21:17 AM) RP__: This lead into a discussion about our the Yocto janitor
page - this is like the kernel janitors project
(9:21:30 AM) RP__: tasks someone could pick up, look into and fix to get
into the project
(9:21:55 AM) RP__: We're going to rework the wiki page into the bugzilla so
we track things in one place, then generate a summary of open tasks for the
wiki automagically
(9:22:17 AM) RP__: We need to raise more awareness of the janitor list...
(9:22:29 AM) RP__: Any comments or shall I just talk to myself? :)
(9:22:43 AM) Tartarus: Good idea, I thought we had said to do that before
(9:22:44 AM) fray: yes.. I know there are people willing to do janitor work
(in oe as well as the Yocto Project)
(9:22:58 AM) fray: we just need to make it clear to folks we've hit a point
where janitor work is needed..
(9:23:10 AM) RP__: Tartarus: I think we've said it but we've not done much
about it and its not publicised much
(9:23:11 AM) Jefro: sorry - got called away, here now
(9:23:14 AM) fray: (actually we're likely past that point.. but anyway..)
(9:23:18 AM) Jefro: I'm logging
(9:23:23 AM) Jefro: I even have an agenda
(9:23:38 AM) RP__: Jefro: If you could share that with us that would be
useful :)
(9:23:43 AM) Jefro: http://pastebin.com/TqiVP8dw
(9:24:08 AM) fray: IMAGE_FSTYPES was Tartarus   ;)
(9:24:13 AM) Jefro: oops, ok
(9:24:23 AM) RP__: What the janitor work needs is one or more people to
champion it
(9:24:45 AM) RP__: We could ask the membership for volunteers
(9:25:01 AM) fray: yes, i think thats a good idea..
(9:25:15 AM) ***RP__ suspects he is chairing
(9:25:37 AM) ***bluelightning suspects that is the case ;)
(9:25:49 AM) Jefro: who wants to take AR to alert membership for janitor
volunteers?
(9:26:04 AM) RP__: ok, I will mention the above idea to Darren and see if I
can convince him and Sean to take this on
(9:26:08 AM) RP__: ;-)
(9:26:23 AM) fray: I was justa bout to suggest that..
(9:26:28 AM) RP__: Re: the QA issues in general as well as bug fixing and
testing
(9:27:24 AM) RP__: Does anyone have any idea how to get more people
involved?
(9:27:55 AM) RP__: I'm finding it hard going atm and will have to start
refusing changes when the builds are broken
(9:27:56 AM) fray: I think a request to the oe-core list and a page
indicating what is needed is hte best way to start..
(9:28:06 AM) Jefro: it might be useful to separate janitorial duties from
actual bug fixing, so those of us with less technical expertise can lend
time
(9:28:11 AM) fray: we already have people doing some of the work and
probably not realizing it
(9:28:18 AM) RP__: Jefro: Totally, I'm raising this as a separate topic
(9:28:25 AM) Jefro: ok
(9:28:46 AM) RP__: For example, someone sends a patch X, it merges, it
breaks things
(9:29:11 AM) RP__: At present I spend a lot of time fixing things since the
breakage starts affecting people who have no interest in the patch
(9:29:35 AM) bluelightning: RP__: do you have some recent examples?
(9:29:52 AM) RP__: bluelightning: Adding python to gdb-cross-candian
(9:30:06 AM) bluelightning: ah yes :/
(9:30:07 AM) RP__: took out meta-toolchain on rpm
(9:30:23 AM) RP__: This kind of stuff becomes my problem :(
(9:31:02 AM) RP__: Since there are no comments, might as well move on. I
don't have answers either
(9:31:14 AM) RP__: IMAGE_FSTYPES - was there anything you wanted to add
Tartarus
(9:31:16 AM) RP__: ?
(9:31:22 AM) Tartarus: Just poking people to read, reply
(9:31:35 AM) fray: (and ya, I don't have any answers either..)
(9:32:13 AM) RP__: ok, Jefro - do you have the collab summit agenda
(9:32:14 AM) RP__: ?
(9:32:24 AM) ***RP__ notes himself duly poked
(9:32:26 AM) Jefro: yes, it is on the collab summit events page - link in 2
sec
(9:32:39 AM) Jefro:
https://events.linuxfoundation.org/events/collaboration-summit/schedule
(9:32:49 AM) RP__: We're looking to have a Yocto work session at collab
summt
(9:33:00 AM) Jefro: the yocto project workgroup day is on Weds 9am-5pm (or
later)
(9:33:07 AM) RP__: This is following a BSP summit at Mentor's Freemont site
earlier in the week
(9:33:09 AM) Jefro: actual working session is in afternoon
(9:33:45 AM) RP__: I really don't know who we're going to get at collab or
what they're going to find useful to do
(9:33:55 AM) Jefro: I noted to the OE lists about Collab Summit and
encouraged people to request an invitation (at Philip's request)
(9:33:56 AM) RP__: I wanted to give the TSC an opportunity to suggest things
(9:35:06 AM) ***Jefro hears crickets
(9:35:10 AM) RP__: While people are mulling that over and since I've
already put input into it, let me touch on elections. We welcome back fray,
congratulations! :)
(9:35:30 AM) RP__: Do we want to roll into another election for Tartarus
straight away?
(9:35:46 AM) Tartarus: I'd be good with that
(9:35:49 AM) RP__: We seem to take our time over these things so we might
as well set the ball rolling
(9:36:25 AM) Jefro: will someone ping the board?
(9:36:28 AM) ***RP__ is going to assume people will jump in with earlier
topics if they have anything to add
(9:36:31 AM) ***RP__ can do so
(9:36:52 AM) ***RP__ is taking no comment from fray and bluelightning as
agreement
(9:37:02 AM) fray: yup
(9:37:04 AM) bluelightning: sounds OK to me
(9:37:18 AM) RP__: re: Infrastructure, I wanted to acknowledge Michael
Halsted's work on the OE server in speeding up git access
(9:37:33 AM) bluelightning: yes, that is very much appreciated
(9:37:45 AM) bluelightning: it has been slow for a very long time
(9:37:49 AM) RP__: Does anyone have anything to add on infrsatructure?
(9:38:25 AM) bluelightning: did the web issues that brought down ltg (and
hence our mailing list archives) get resolved?
(9:38:41 AM) bluelightning: that was a couple of weeks ago now
(9:38:43 AM) RP__: bluelightning: I think we got the list archives back
(9:38:55 AM) RP__: bluelightning: whether their forum problem got resolved
or not I don't know
(9:39:06 AM) RP__: bluelightning: that doesn't really affect us
(9:39:19 AM) bluelightning: indirectly if stuff goes down, it does...
(9:40:18 AM) RP__: bluelightning: well, I think they've agreed not to do
that now...
(9:40:31 AM) RP__: bluelightning: i.e. they've taken down one vhost, not
them all
(9:40:41 AM) bluelightning: ok cool, that should resolve that for the future
(9:40:54 AM) bluelightning: it did seem a touch heavy handed :/
(9:41:00 AM) RP__: So, if nothing else there, oe-core status
(9:41:19 AM) RP__: I've been fighting to reduce the warnings and fix the
autobuilder failures
(9:41:29 AM) RP__: We have a feature freeze point in about a week now
(9:41:42 AM) fray: RP__ what is the proposed bug fix/final freeze date?
(9:42:16 AM) RP__: fray: not sure, 2-3 weeks after the 18th I think
(9:42:24 AM) RP__: that's when we roll -rc1
(9:42:27 AM) fray: ok.. rough idea is good enough for the minutes..
(9:42:41 AM) RP__: its on the yocto calender
(9:43:10 AM) RP__: Builds aren't looking too red on the autobuilder
although there are some puzzling failures on some of the newer tests
(9:43:14 AM) Jefro: https://wiki.yoctoproject.org/wiki/YoctoCalendar
(9:43:19 AM) RP__: Any other questions, other business?
(9:44:12 AM) ***Jefro will get minutes out early this time & catch up on
old ones
(9:44:59 AM) RP__: If nothing else I'll close the meeting...
(9:45:09 AM) bluelightning: nothing here
(9:45:28 AM) Tartarus: nothing here
(9:45:31 AM) fray: nothing
(9:46:30 AM) ***RP__ closes


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

