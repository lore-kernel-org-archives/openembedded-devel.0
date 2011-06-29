Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QblkF-0003ki-J1; Wed, 29 Jun 2011 05:47:20 +0200
Received: by iym10 with SMTP id 10so797471iym.6
	for <multiple recipients>; Tue, 28 Jun 2011 20:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=w/lYvsZ+IMSjmghc83QVj2fWu+1ymXqvD6rYMRevdoY=;
	b=FnWxhKb9V8KcU+Il9tbsiPyb/qdS+783E2fEG4S1+lay8vUy9+CLAZZdaXDb4afJQk
	hhOtnK6kSBXnGsEDImnQAJmV7JPWM/R9zoyfHq/Dmo1S9o//uDTFJ+iVBnPZdChoUi68
	gvQxGFOoUaiMopqkbRoatYuUPgl0zpX3USepU=
MIME-Version: 1.0
Received: by 10.42.223.198 with SMTP id il6mr305977icb.271.1309319016068; Tue,
	28 Jun 2011 20:43:36 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.222.66 with HTTP; Tue, 28 Jun 2011 20:43:36 -0700 (PDT)
Date: Tue, 28 Jun 2011 20:43:36 -0700
X-Google-Sender-Auth: wQQRfYIX5wDu9VSd0bvhz2FyIy4
Message-ID: <BANLkTimo46GYafhohjgr8JSvTEYgmNr73Q@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: MINUTES: OE-TSC meeting 23-Jun-2011
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
X-List-Received-Date: Wed, 29 Jun 2011 03:47:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

MINUTES: OE-TSC meeting 23-Jun-2011

Attendees: Richard, Tom, Khem, Koen, Mark, Stefan
Notes: Jefro

Agenda & Action Items

01) choose a meeting chair

stefan

02) new topics

Discussion about more (or more complex) building before pushing changes to
master (Tartarus)

new features in OE-Core and bitbake changes needed to support them (RP)

03) action items from last week

  --> patches appearing on oe-dev, khem to send email regarding "put stuff
in meta-oe"
not done yet

  --> Tom to change strategy for maint branch, oe.dev master to
oe-core/meta-oe/layer
done

  --> promote devs to participate on oe-user - on agenda for next week
done

04) TSC structure & elections

  --> RP to send a note to board asking for status on prior message
done, board has responded & will start elections this week

05) Status updates
      - oe-core
  Saul out. RP: working code out there as a foundation for multilib which is
great
  not so great was the backlog of patches, RP is almost through them
  complicated by Yocto infrastructure issues
  lack of testing is an issue - some discussion about adding testing to
patches prior to commit
  Tom suggests that there is already a policy for updates, but some things
came from sstate - lesson learned
--> (all) think twice about pull requests
  RP: 1. multilib - there is a plan and rough code out there
         some bitbake changes and oe-core dependenies on those
     ok this cycle but we probably need to stop doing this and get better
organised before 1.14 in October
     Changes + a bitbake min ver bump, warn people now
  2. patterns email - current state of our core classes depressing
     full of horrible hacks for PACKAGE_ARCH, BASE_PACKAGE_ARCH...
 know how to clean it up but not how to do so without breaking backwards
compatibility
 heirarchical definition of a arch -> multilib -> tune -> BSP/machine
 mechanics easy, transition is hard
 multilib exposes a lot of design issues
 discuss in email
  fray has gotten all of the patches out to fix the majority of the
permission/owners/group issues..
  only thing remaining is symlink vs actualy directory ownership

  - bsp guidelines
clarify - using layers for BSPs
      - metadata layer splitting
      - infrastructure
melo having issues
fallback github seems to have worked
  khem working on making libtirpc be a drop in replacement for glibc rpc but
much work required

RAW TRANSCRIPT


12:59 <+Jefro> sounds like a quorum:  RP__ stefan_schmidt Tartarus koen khem
12:59 <+stefan_schmidt> lets wait some minutes for fray
13:00 <+stefan_schmidt> he was just out for getting lunch
13:00 *** fray is here now
13:00 <+stefan_schmidt> great
13:00 <+stefan_schmidt> chair?
13:01 <+Jefro> http://pastebin.com/bZfpaqvN is the agenda
13:01 <+stefan_schmidt> i can chair if nobody wants
13:01 <+Jefro> stefan_schmidt wins the chair going into round 2
13:01 <+khem> ok
13:01 <+stefan_schmidt> new topics anyone?
13:02 <+stefan_schmidt> (02) new topics)
13:02 <+Tartarus> Yeah, I think I have a new topic
13:02 <+stefan_schmidt> shot
13:02 <+Tartarus> Discussion about more (or more complex) building before
pushing changes to master
13:02 <+RP__> We should probably talk about new features in OE-Core and
bitbake changes needed to support them
13:02 <+Tartarus> I'll also say maybe it's a bit of an over-react to the
glibc thing
13:03 <+RP__> Tartarus: Say when and I'll explain why I did that :)
13:03 <+Tartarus> Yeah, lets just talk about it when we get to it, that's
all
13:03 <+Tartarus> All I've got for new topics
13:03 <+RP__> I sent out that patterns in class hackery email
13:03 <+stefan_schmidt> that fits in 5
13:04 <+stefan_schmidt> so we put this in status updates
13:04 <+stefan_schmidt> any more topics?
13:04 <+RP__> none here
13:04 <+fray> nothing here
13:05 <+stefan_schmidt> ok, closed
13:05 <+stefan_schmidt> 03) action items from last week
13:05 <+Tartarus> OK, for my AI I updated the wiki page and sent out the
email (which noted that this is just spelling out the policy more clearly,
it didn't say oe.dev only before, just "relevant upstream")
13:05 <+Tartarus> So that's done.
13:05 <+stefan_schmidt> ok
13:06 <+stefan_schmidt> can be off list next week
13:06 *** Jefro notes
13:06 <+khem> my AR for oe-users is also done
13:06 <+stefan_schmidt> oe-user is also done as it got closed
13:06 <+stefan_schmidt> right :)
13:06 <+khem> list is r/o now well sort off
13:06 <+stefan_schmidt> with a notice posting to dev
13:06 <+stefan_schmidt> ok, not worth an AR any more
13:06 <+stefan_schmidt> can go off list as well
13:07 <+stefan_schmidt> khem:  --> patches appearing on oe-dev, khem to send
email regarding "put stuff in meta-oe"
13:07 <+khem> stefan_schmidt: I did not do that yet
13:07 <+stefan_schmidt> khem: ok, so this one we are keeping
13:07 <+stefan_schmidt> am I to fast?
13:07 <+RP__> stefan_schmidt: no :)
13:07 <+stefan_schmidt> good
13:08 <+khem> although it means building/testing using oe-core
13:08 <+stefan_schmidt> 04) TSC structure & elections
13:08 <+RP__> For 04 I have a reply from the board saying they accepted our
proposal and will be starting the election process this week
13:08 <+stefan_schmidt> ok, good
13:08 *** Jefro notes
13:08 <+RP__> So nothing further for the TSC to do, its in the hands of the
board
13:08 <+stefan_schmidt> So we wait for a mail from them on members
13:08 <+fray> sounds good
13:09 <+stefan_schmidt> wow, the AR going away today...
13:09 <+stefan_schmidt> that brings us to 5
13:09 <+stefan_schmidt> 05) Status updates
13:09 *** Jefro notes 80% of agenda covered in 10 minutes, a new record
13:10 <+fray> :)  We're getting better
13:10 <+RP__> well, we did put all the discssion in 5)
13:10 <+stefan_schmidt> psst, don't tell anyone
13:11 <+stefan_schmidt> RP__: Tartarus you guys want to start with the
testing and eglibc change
13:11 <+stefan_schmidt> ?
13:11 <+khem> on status. I am working on making libtirpc be a drop in
replacement for glibc rpc buts its not so straight forward
13:11 <+khem> it needs lot of work
13:11 <+Tartarus> Lets get general status bits out first
13:12 <+RP__> ok. Its been a bit of a hard week for me and OE-Core since
Saul is away and I've been trying to resolve multilib
13:13 <+RP__> There is now actual working code out there as a foundation for
multilib which is great, not so great was the backlog of patches
13:13 <+Tartarus> I've started kicking the oe-core + meta-oe tires harder
and thinking about what I can do about getting more builds to happen on a
weekend-basis
13:13 <+RP__> I am clearing most of it (I think) but we had the odd hiccup
and we need to stabilise
13:13 <+fray> I think I've gotten all of the patches out to fix the majority
of the permission/owners/group issues.. only thing remaining is symlink vs
actualy directory ownership.. (after the meeting if anyone has a minute or
two I'm looking for suggestions )
13:14 <+RP__> Its been complicated by Yocto build machine moves and power
outages
13:14 <+RP__> and a bug which took out some of the builders
13:14 <+Tartarus> RP__: So, to jump ahead, the usual process is that Saul
throws things at the build machines and then a pull request, but, no Saul,
build machine issues, stuff happened
13:14 <+Tartarus> ?
13:15 <+RP__> Tartarus: pretty much
13:15 <+Tartarus> OK, I think that's a good enough answer
13:15 <+RP__> I was conscious I was getting behind with pull requests and
things we're looking like they were getting out of control. I therefore
merged it assuming it had been a little more tested than it had. As soon as
it was clear there were issues, it got reverts of the appropriate pieces.
13:15 <+Tartarus> Maybe we can try and find a backup Saul?
13:15 <+Tartarus> Let him have some vacation now and again and otherwise
ease the burden
13:15 <+RP__> Tartarus: I really would like to get to the point where we
have a few people acting to review/batch up patches
13:16 <+khem> I think when a pull request it send folks with machine power
can pick and test too
13:16 <+khem> and provide feedback
13:16 <+Tartarus> RP__: Yeah
13:16 <+fray> ya, would be nice
13:16 <+stefan_schmidt> and they would need to report to let people know
about failure/success
13:16 <+RP__> khem: This doesn't change the fact people do need to test
changes before posting them though. For things like eglibc I think we need
to start stating what testing has/has not been done
13:17 <+khem> RP__: I did build and boot of all qemus
13:17 <+fray> I think there are a series of changes we should probably
styart requesting "testing" info
13:17 <+RP__> At least then we can make more informed decisions about when
something has been tested ready to merge
13:17 <+RP__> khem: which images though?
13:17 <+fray> package managers, toolchain...
13:17 <+Tartarus> Well, stop
13:17 *** koen finally got qemu working on his osx machine
13:17 <+Tartarus> We have an update policy
13:17 <+khem> RP__: I used console-image from angstrom
13:17 <+RP__> khem: even mentioning what we'd tested would he
13:17 <+Tartarus> And eglibc pretty clearly falls into the infrastructure
and needs a full test side
13:17 <+Tartarus> So, why didn't we follow it?
13:18 <+RP__> Tartarus: my fault I guess, I assumed it had more testing than
it had :/
13:18 <+khem> RP__: but I guess since most of stuff was from shared state
many things did not pop up
13:18 <+koen> so we all screwed up and learnt our lesson
13:18 <+Tartarus> khem, yeah, that doesn't fit into the policy
13:18 <+fray> ya, thats the way I took it
13:18 <+RP__> khem: Its a detail like that I need - it was from sstate :(
13:19 <+fray> it was reverted quick enough and we had enough people actively
using it that we dealt with it quickly
13:19 <+RP__> sstate does exclude toolchain from the hashes by default :(
13:19 <+khem> I realised it later when fray posted
13:19 <+fray> RP__ even hashbasic?
13:19 <+khem> best for toolchain changes is to build from scratch
13:19 <+fray> 'er basichash I mean
13:19 <+RP__> fray: not 100% sure about that, it should have caught eglibc
13:20 <+khem> but then it might screw someone who is using shared state so
it has to be done both ways
13:20 <+fray> mine (I'm using basichash) did detect a change and started
rebuilding everything.. which is why the rpc failure happened
13:20 <+stefan_schmidt> so, what did we learn?
13:20 <+RP__> So lessons are: I need to ask more questions and people need
to provide more info about what testing has been done
13:20 <+stefan_schmidt> more and wider testing for stuff like eglibc
13:21 <+koen> and libc upgrades shouldn't be replaces
13:21 <+khem> and folks could test the pull requests too so we are
preemptive and not reactive
13:21 <+stefan_schmidt> maybe get some other people on board like saul doing
patch collecting and builing
13:21 <+koen> and new versions shouldn't be the default for $period of time
13:21 <+fray> koen, I think thats a good idea (for the future)..
13:21 <+RP__> fray: ok, that is good at least
13:22 <+RP__> fray: I think it stops at the gcc boundary so it will rebuild
for libc but not gcc
13:22 <+fray> ok
13:22 <+RP__> Its programmable
13:22 <+Tartarus> koen: So, in sum, we need to follow the upgrade policy we
wrote and agreed on
13:23 <+khem> I think we should define miimum checkin criteria
13:23 <+koen> Tartarus: basically, yes
13:24 <+RP__> This is also a wakeup call for the team as I'm never going to
catch everything bad
13:24 <+RP__> So please think twice about pull requests. A pull request is
saying you consider something ready to go in
13:24 <+fray> one question though -- in the future when this happens agin
(something fundamental breaks and we need to revert) does anyone else have
permissions to be able to do the revert if you are not available?
13:25 <+Tartarus> Well, here's the flip side
13:25 <+fray> RP__ ya I only send patches when I'm ready to go (or clearly
label them as such)..  I send links to the tree if I want review.. hopefully
thats reasonable approach
13:25 <+Tartarus> barring vacation, is it that big of a deal?
13:25 <+Tartarus> And we can assume RP won't merge and run
13:25 <+fray> Tartarus honestly, I don't think it is..
13:25 <+RP__> I do try and be around if something tricky is going in
13:25 <+RP__> and do hold things if I'm not around
13:26 <+RP__> This is the development tree too, not a release/stable branch
13:26 <+Tartarus> Exactly
13:26 <+fray> agreed
13:26 <+Tartarus> So I think we're OK with as soon as RP is awake enough to
push the revert, if needed
13:26 <+koen> and otherwise we can tell people to rollback manually
13:26 <+RP__> People can easily do that locally too
13:27 <+fray> I really don't think was really such a big deal.. we've
learned lessons and will do better next time..
13:27 <+fray> RP__ yup.. which is why I posted the revert as quickly as I
did
13:27 *** koen was pinning 2.12 anyway
13:27 <+RP__> I'm of the opinion that we can become too afraid to make
changes and that is sometimes worse than making bad changes and having to
revert occasionally
13:28 <+RP__> If you look at the number of reverts we've made its relatively
low
13:28 <+fray> yup
13:28 <+khem> if you dont  make mistakes you havent done anything :)
13:28 <+RP__> Very low in fact, I *hate* reverts
13:28 <+koen> do right, do wrong, but at least to somethign :)
13:28 <+RP__> right :)
13:29 <+stefan_schmidt> so that covers the oe-core part of 5 this week
13:29 <+khem> I wish more folks could try out the patches and add acks or
tested-bys
13:29 <+khem> but except Saul no one does
13:29 <+stefan_schmidt> - bsp guidelines
13:29 <+RP__> stefan_schmidt: Can I touch on the things I mentioned earlier
13:29 <+RP__> ?
13:29 <+stefan_schmidt> RP__: sure, go ahead
13:29 <+Tartarus> khem, we need to perhaps make it easier somehow?
13:30 *** Tartarus hmms
13:30 <+RP__> multilib - there is a plan and rough code out there
13:30 <+khem> Tartarus: how ?
13:30 <+RP__> anyone interested should read it :)
13:30 *** fray notes RPM multilib support is next on his agenda.. so I'll be
giving this a try
13:30 <+fray> (soon)
13:30 <+RP__> Secondly, we have some bitbake changes and oe-core dependenies
on those
13:30 <+khem> we need it for opkg and deb as well
13:31 <+RP__> We currently do need bitbake master anyway
13:31 <+Tartarus> khem: that's the hard question, I agree
13:31 <+RP__> I'm therefore of the opinion this is going to be ok this cycle
but we probably need to stop doing this and get better organised
13:31 <+RP__> and get onto a 1.14 release by October
13:31 <+RP__> Any objections to that rough plan?
13:31 <+Tartarus> RP__: I think so long as you don't make the changes on a
Friday and of course be careful to do a test with just oe-core (yes,
yes...), just fix the ugly hackish bits
13:31 <+fray> RP__ ya, we need a way to keep the requiremetns ins ync
13:32 <+RP__> I did manage this once so far this cycle and people got
informed when they *needed* the new bitbake version
13:33 <+RP__> I'm trying to batch some changes to avoid doing this more than
a couple of more times
13:33 <+stefan_schmidt> thats good
13:33 <+Tartarus> Lets aim for...
13:33 <+Tartarus> Not July 4th but the week after
13:33 <+Tartarus> Changes + a bitbake min ver bump
13:33 <+Tartarus> and warn people now, even
13:34 <+RP__> I can send out as many warning emails as I like, I doubt
anyone will actually pay attention :)
13:34 <+RP__> Anyhow I think we agree on what to do and I just wanted to
mention what is likely to happen
13:35 <+RP__> Second thing was the patterns email I sent out
13:35 <+RP__> I find the current state of our core classes depressing to be
honest
13:35 <+RP__> full of horrible hacks for PACKAGE_ARCH, BASE_PACKAGE_ARCH and
friends :(
13:35 <+khem> I agree
13:35 <+fray> the hacks and hard-coded arch definitions worries me a lot
13:36 <+RP__> I know how to clean it up but not how to do so without
breaking backwards compatibility :(
13:36 <+fray> recipe compatibility (to me) is the key item.. and even that
isn't expected to be 100%
13:36 <+RP__> There are also some little pieces of previous cleanups missing
such as making cross packages move into the native workdir and have the
targetarch as a suffix to PN
13:36 <+khem> RP__: you mean with bb semantic changes
13:36 <+fray> the key thing from a user perspective is when something
changes (incompatible) tell me what it is and how to deal with it in my code
13:37 <+RP__> khem: machine.conf file definitions is the main issue
13:37 <+RP__> khem: I can deal with the bitbake issues
13:37 <+stefan_schmidt> So problems with BSP layers
13:37 <+RP__> machine.conf files should not be setting TARGET_ARCH IMO
13:37 <+RP__> yes
13:38 <+Tartarus> Maybe a 1.2 or whatever the next release is thing?
13:38 <+koen> RP__: so what should be setting it then?
13:38 <+RP__> koen: something new
13:38 <+khem> We need arch files
13:38 <+RP__> koen: for the same reason you want BASE_PACKAGE_ARCH not to
change
13:38 <+RP__> Tartarus: well, there is that argument and also the shouldn't
we fix this now before we get more users
13:39 <+fray> khem, come back to my suggestion for a heirarchical definition
of a arch -> multilib -> tune -> BSP/machine
13:39 <+RP__> I don't really want to discuss how we fix it, that is easy
13:39 <+RP__> its how to transition
13:39 <+khem> fray: yes thats good
13:39 <+fray> one of the complaints I've heard about potentially adding
"more" config files is that people don't necessarily see the logic of where
things are being set today
13:40 <+fray> local.conf makes sense.. bitbake.conf makes sense.. its the
stuff in the middle that people get confused by when theyre trying to create
a distro, patch, etc..
13:40 <+khem> RP__: I think with releases regularly we can break some
backward compatibility
13:40 <+Tartarus> RP__: I would go with we have a lot to do for this release
13:40 <+Tartarus> and not all that much time
13:40 <+Tartarus> Lets get multilib really solid
13:40 <+RP__> Tartarus: I'm leaning the other way
13:40 -!- Jefro ~Jefro@cust-67-203-89-34.static.o1.com has quit [Ping
timeout: 240 seconds]
13:40 <+RP__> I think multilib will be a mess without this
13:41 <+fray> Tartarus I'm not sure we'll be able to get multilib solid
without "fixing" the variable mess
13:41 <+Tartarus> I agree multilib will make the current mess clear
13:41 <+fray> multilib exposes a lot of design issues
13:41 <+RP__> Each time I work on one of these classes I add more hackery
around previous mess
13:41 <+Tartarus> How many big items do you want in the air at once?
13:41 <+RP__> Well, I don't know
13:41 <+RP__> I do want to make the issue clear though
13:42 <+fray> (for infrastructure -- not recipe stuff).. I see these are two
seperate work items, that go together..
13:42 <+fray> we focus on one.. adapt the other until they're in sync
13:42 <+khem> I kind of think that we should clear the classes for these
excess vars
13:42 <+khem> first
13:42 <+RP__> I can probably do this so that anyone using tune include files
from oe-core will continue to work
13:42 <+RP__> khem: We can't clear them until we have stable values for them
to use
13:43 <+fray> khem, get the classes cleaned up so the multilib hacks are at
a minimum..
13:43 <+fray> classes/variables
13:43 <+RP__> khem: e.g. when you change TARGET_ARCH now, the original value
is gone
13:43 <+RP__> so ok, we add a copy of the value
13:43 <+RP__> but do this for 5 variables in 5 different classes under
different conditions and your head hurts :(
13:43 <+khem> RP__: thats a design problem though
13:44 <+RP__> khem: one which is rooted in the machine files
13:44 <+fray> (BTW way we did that in our non-OE based system is define
everything as FOO_variant... then the core set such as TARGET_ARCH get
evaluated to TARGET_ARCH_variant before each recipe is built)
13:44 *** stefan_schmidt shows the 15 minutes left sign around
13:44 <+RP__> Let me make this a call to action via email
13:45 <+RP__> Anything else under status updates?
13:45 <+stefan_schmidt> - bsp guidelines?
13:45 <+fray> but it means that the set of things that are "specific" to a
'variant' are always overriden -- if we do the same, we'll need to detect if
someone is playing with that and give them santiy or some other guide
13:45 <+stefan_schmidt> - metadata layer splitting?
13:45 <+stefan_schmidt> - infrastructure?
13:46 <+fray> infrastructure -- other then melo having issues this week..
the fallback github seems to have worked..  I didn't see development drop
off due to that..
13:46 <+fray> (in otherwords I'm happy with the fall back plan)
13:46 <+koen> almost nothing going into .dev anyway
13:46 <+RP__> Tom is having various difficulties I think :/
13:46 <+koen> something seems to be DOS'ing melo
13:47 <+RP__> I think its those gcc commits
13:47 <+RP__> overload cgit
13:47 <+RP__> all you need is a few of them and a webbot
13:48 <+fray> github seems to be able to handle it at least...
13:48 <+RP__> fray: I'm hoping its an isolated issue
13:48 <+fray> same...
13:49 <+stefan_schmidt> layer splitting and bsp guidelines?
13:49 <+RP__> Since its quiet another question: How are people finding
OE-Core compared to .dev?
13:49 <+khem> going back to eglibc issue .. So for core recipes e.g.
toolchain I would say we require additional 2 tested-bys minimum
13:50 <+Tartarus> oe-core + meta-oe makes me pine for bbclass.bbappend, but
I agree with what we came to a conclusion on before
13:50 <+khem> RP__: it seems nicers
13:51 <+khem> RP__: but I guess with oe.dev folks had lot more choice of
machines as they were collectively maintained
13:51 <+fray> khem, I'm happy to do that if we feel it's necessary -- I'm
willing to relax that as in "new versions" or "major changes"
13:51 <+RP__> tbh I think we've learnt our lesson
13:52 <+khem> RP__: when I have more machine built in same tmpdir then bb
runque generation slows down very much
13:52 <+khem> have you observed that
13:52 <+RP__> khem: no :/
13:52 <+khem> RP__: e.g. I have all supported qemus
13:52 <+koen> and bitbake tkaes half a gig of ram
13:53 <+khem> when its only 1 then its very fast
13:53 <+RP__> Does wiping tmp/cache speed it up again/
13:53 <+RP__> ?
13:53 <+khem> havent tried but I can give it a shot
13:54 <+khem> RP__: and cache dir is in both tmp and tmp-eglibc
13:54 <+RP__> khem: yes
13:54 *** stefan_schmidt shows the 5 minutes left sign. Last orders.
13:54 <+RP__> khem: bonus marks for pinointing the specific file
13:55 <+RP__> khem: I suspect the codeparser cache
13:55 <+RP__> stefan_schmidt: I think we're done tbh?
13:55 <+stefan_schmidt> I'm wondering a bit where we stand with the BSP
guidelines
13:55 <+RP__> khem: time bitbake xxx-image -n might help btw
13:55 <+stefan_schmidt> We had them in the topics since the beginning
13:56 <+khem> RP__: yes I deleted the cache lets see
13:56 <+RP__> stefan_schmidt: there is the BSP developers guide
13:56 <+fray> I'm done.. if you have a few minutes I just want to mention a
small topic and see if anyone has input
13:56 <+RP__> (which Yocto has)
13:56 <+fray> (outside the meeting)
13:56 <+stefan_schmidt> RP__: I know. And what is the guidelines reference
in the agenda about?
13:56 <+RP__> stefan_schmidt: it was specifically about using layers for
bsps iirc
13:56 <+stefan_schmidt> ah, ok
13:57 <+RP__> so related to the layer splitting topic
13:57 <+stefan_schmidt> so that is missing
13:57 <+stefan_schmidt> anyway, to late for this meeting


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

