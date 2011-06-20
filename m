Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QYlcc-0008Is-3k; Mon, 20 Jun 2011 23:03:02 +0200
Received: by iwn19 with SMTP id 19so4448258iwn.6
	for <multiple recipients>; Mon, 20 Jun 2011 13:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=XDdn0Qw1/cbrZeutDm+FwNbmCFXmXHv+EBgzvbolWRQ=;
	b=uMPc7SgNOUHpjBb/WPeGbc59AVR1K2y6jGz2R2AFdLq7gc4YJUDuPwsh7XitjBiIN+
	s1WrSYjnf4gzFVBUVBUJ/j5SctYpmO6Cn++6PohVlnXMZApTth2kMcgm7fjQX4g1HE8/
	CnW7d1vm/PotMLXr+RLL1x8JjmyMsuzfoW8eQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=LcIKDyZncGIrG3El4NYxLE+FqgNsfKaMaYGO9BmW4ekEcOASuatts0JF8zjwm1HOKS
	xwF04S7fqFBixToCptbLqiaYBdXUwlZlj0ayPR6S3P3Q7VILXyiMMpglSWzwCkpZVKQB
	fSm+86M3bd80HqwgPRr/jCKOpOJj33uEeYfKk=
MIME-Version: 1.0
Received: by 10.42.161.138 with SMTP id t10mr6602710icx.3.1308603567997; Mon,
	20 Jun 2011 13:59:27 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.222.66 with HTTP; Mon, 20 Jun 2011 13:59:27 -0700 (PDT)
Date: Mon, 20 Jun 2011 13:59:27 -0700
X-Google-Sender-Auth: jx_N7eJGXuPjBYaOGz0rfX-0ZRQ
Message-ID: <BANLkTi=3n0+y1xoexctCfQtrqu+8ADSAwA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: MINUTES: OE-TSC meeting 16-Jun-2011
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
X-List-Received-Date: Mon, 20 Jun 2011 21:03:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

 oe-tsc minutes, 16-Jun-2011

Attending: Koen, Khem, Tom, Richard, Mark
Apologies: Stefan
Notes: Jefro

Agenda

01) choose a meeting chair

Tom

02) topics

khem: fallback source mirror for oe-core
  premirrors?  who maintains no-longer-upstream mirror?
  kitchen-sink mirror is not a benefit for oe-core, but it is beneficial for
yocto, angstrom
  "mirror" becomes a distro concept
  meta-oe is not a distro, won't have a policy
  oe-core on its own will degrade over time - ok, as oe-core -only users are
advanced?
  khem thinks adding fallback mirrors not a bad choice, given certain
constraints
  -->when we have a release we can revisit if it's appropriate there

khem: patches appearing for recipes on oe-dev:
  --> khem to send email regarding "put stuff in meta-oe"

"long" term support for 2011.03-maintenance
  --> Tom to change strategy for maint branch, oe.dev master to
oe-core/meta-oe/layer

khem: promote devs to participate in oe-user
  --> on agenda for next week

03) action items from last week

mark: posted the Commit & Policy Guidelines on the wiki, to much fanfare
tom: GNOME stuff moving along
RP: sent email to board, no response yet

04) TSC structure & elections

--> RP to send a note to board asking for status on prior message

05) Status updates
      - oe-core
  discussions about multilib, tuning files
      - bsp guidelines
      - metadata layer splitting
      - infrastructure

Raw Transcript

(1:01:00 PM) Tartarus: I'll chair, too, if no one has already volunteered
(1:01:15 PM) Jefro: hi Tartarus - no one has volunteered yet,
congratulations
(1:02:46 PM) Jefro: Agenda is at http://pastebin.com/PhJpWfjr
(1:02:52 PM) Tartarus: thanks
(1:03:01 PM) Tartarus: waiting on Khem, but, #2, new items?
(1:03:07 PM) fray: I don't hve anything to add
(1:03:14 PM) ***Tartarus has none
(1:03:25 PM) Tartarus: RP? koen? khem?
(1:03:35 PM) Tartarus: (and khem's no or new topics will move us on to #3)
(1:04:01 PM) Jefro: stefan sends apologies
(1:04:18 PM) khem: ich bin hier
(1:04:28 PM) fray: (we on 3 then?)
(1:04:40 PM) Tartarus: Well, i thought RP and koen would reply quickly ;)
(1:05:04 PM) Tartarus: RP__ ? (for making his irc client beep, presumably)
(1:06:12 PM) khem: I think fall back src mirror for oe-core
(1:06:20 PM) khem: we could talk about that
(1:06:43 PM) Tartarus: fine by me
(1:07:03 PM) fray: good topic.. I have some minor input for that
(1:07:12 PM) Tartarus: RP__, koen, ping?
(1:08:07 PM) koen: pong
(1:08:12 PM) Tartarus: new topics?
(1:09:04 PM) khem: I am seeing some new patches for recipes on oe.dev
(1:09:26 PM) khem: I guess because people adopted releases and are now
posting the updates
(1:09:38 PM) Tartarus: khem: So, you want to bring up discussion winding
down oe.dev?
(1:09:41 PM) khem: so how should we handle that
(1:10:14 PM) Tartarus: Or just that topic, new work going into oe.dev and
what to tell/remind people?
(1:10:16 PM) khem: Tartarus: yeah should we change the policy for release
branch
(1:10:23 PM) khem: where it can take patches if needed
(1:10:32 PM) khem: but the new patches what to do about those
(1:10:38 PM) Tartarus: khem, hm?
(1:10:39 PM) khem: some recipes are not in any layer
(1:10:50 PM) Tartarus: well, hang on
(1:10:56 PM) Tartarus: ok, new topic added to the list
(1:10:58 PM) koen: Tartarus: "long" term support for 2011.03-maintenance
(1:11:17 PM) khem: and I would like to promote devs to participate in
oe-user
(1:11:18 PM) Tartarus: ok, so we've got oe-core mirror, dev happening in
oe.dev and 2011.03-maint long term
(1:11:19 PM) RP__: soory brb
(1:11:40 PM) Tartarus: and promoting oe-user
(1:11:44 PM) Tartarus: got all that so far, Jefro?
(1:11:50 PM) koen: oe-user?
(1:11:54 PM) khem: ml
(1:12:10 PM) koen: didn't we say that should go away we'd only have 1 list?
(1:12:11 PM) ***fray is sorry to say he didn't know there was an oe-user
(1:12:12 PM) khem: to encourage more devs
(1:12:34 PM) Tartarus: koen: it's added to the topic list, we'll cover
history then
(1:12:40 PM) khem: fray: if you go to lists.linuxtogo.org
(1:12:47 PM) khem: and grep for OpenEmbedded
(1:12:51 PM) Tartarus: Lets move on to #3 and let RP give any new topics
when he's back again
(1:12:51 PM) khem: you will see all of them
(1:13:02 PM) fray: sounds good..
(1:13:11 PM) Tartarus: #3, AI updates
(1:13:14 PM) Tartarus: I know fray has one
(1:13:21 PM) Jefro: Tartarus - yes, I have it all
(1:13:34 PM) fray: my status update.. the Commit & Policy Guidelines were
posted on the Wiki.  An email has been sent to the oe-dev & oe-core lists
with that information on behalf of the TSC
(1:13:54 PM) fray: One minor note.  I found a small typo in one spot and
fixed it before posting the final version.  I assume that's not a problem.
 ;)
(1:14:04 PM) khem: I dont think so
(1:15:00 PM) Tartarus: Anyone else have AIs?
(1:15:20 PM) Tartarus: GNOME stuff seems to be moving along, but maybe that
was already last week
(1:15:22 PM) fray: RP had one for the election info..  I haven't seen a
response yet
(1:15:40 PM) Tartarus: Ah yes, need to see if the board replied just to RP
or something, when he's back
(1:15:41 PM) Tartarus: thanks
(1:15:52 PM) Tartarus: And elections is #4 too
(1:15:54 PM) koen: I think the election stuff is in the boards court now
(1:16:02 PM) RP__: Sorry guys, I had a phone call I needed to take
(1:16:07 PM) RP__: back now
(1:16:07 PM) Tartarus: koen: right
(1:16:09 PM) fray: I'm not sure what else we can do beyond the letter to the
board
(1:16:15 PM) khem: RP__: NMI ?
(1:16:26 PM) Tartarus: RP__: working backwards, elections stuff?  We know
the email was sent telling the board what's what
(1:17:00 PM) RP__: khem: right :/
(1:17:18 PM) Tartarus: I'd like to propose RP send the board a ping email,
since it's been a week
(1:17:23 PM) RP__: Tartarus: Afaik the board accepted it and the ball is in
their court
(1:17:29 PM) ***RP__ agrees
(1:18:08 PM) Tartarus: RP__: so, any new agenda items you want to add?
(1:18:50 PM) ***RP__ is ok with the agenda
(1:18:55 PM) Tartarus: k
(1:19:07 PM) Tartarus: So, anything more we can do for #4?  Or other AIs
from the last meeting there's status on?
(1:19:13 PM) Tartarus: I think no for #4 and #3
(1:20:42 PM) Tartarus: going once...
(1:20:54 PM) Tartarus: twice
(1:21:14 PM) Tartarus: sold!  On to #5, status updates time
(1:21:41 PM) Tartarus: oe-core, RP?
(1:22:06 PM) RP__: I'm keeping a lower profile than usual as I'm trying to
sort out various multilib work
(1:22:23 PM) RP__: The designs weren't working and we had a team member
leave so I'm trying to resolve that
(1:22:31 PM) Tartarus: OK.  Any idea when you'll poke your head out again on
multilib and ask for more?
(1:22:45 PM) RP__: Tartarus: ask for more what?
(1:22:47 PM) Tartarus: (help, comments, testers)
(1:22:54 PM) khem: he already did
(1:23:07 PM) khem: few days ago
(1:23:10 PM) Tartarus: Yes, sorry, I mean after a few days ago
(1:23:12 PM) fray: Monday was it?
(1:23:21 PM) ***khem has not yet read that long email yet
(1:23:21 PM) RP__: Tartarus: I've put some questions out for discussion
(1:23:28 PM) ***Tartarus does owe reading it over and thinking again, silly
pays the bills stuff...
(1:23:40 PM) RP__: I'm trying to implement things and discovering issues
with the proposal already though
(1:23:54 PM) Tartarus: k
(1:23:55 PM) koen: fray: you need to remember that rpm is "from the future"
and deb/ipk is "KISS"
(1:24:12 PM) Tartarus: I guess, unless you say otherwise RP__, lets go with
to the ML with multilib stuff
(1:24:21 PM) RP__: ML is fine
(1:24:28 PM) Tartarus: OK, any other status updates?
(1:24:34 PM) RP__: I just wanted to highlight I'm distracted atm and Saul is
also away for a week
(1:24:35 PM) Tartarus: infra? layers? bsp stuff?
(1:24:40 PM) RP__: please just bear with me :)
(1:24:48 PM) fray: koen, haha
(1:24:55 PM) khem: I am working on svn based 4.6 recipes for gcc
(1:25:07 PM) fray: I'm ripping my hair out currently with the directory
ownership and user/group/mode collisions..
(1:25:17 PM) fray: (luckily I have an excess of hair to pull out)
(1:25:21 PM) Tartarus: ha
(1:25:44 PM) koen: I have had people asking about sample layers/bsps
(1:25:55 PM) khem: We have converged the meta-oe gcc recipes to use bbappend
if people have not noticed
(1:26:05 PM) Tartarus: i'm starting to figure on local autobuilder and
merging stuff from oe.dev to meta-oe/etc
(1:26:10 PM) koen: a lot of people look at meta-intel and go "meh", so we
need a decent example
(1:26:40 PM) khem: I need meta-intel to build angstrom for my netbook havent
succeeded yet
(1:26:47 PM) RP__: koen: why go meh?
(1:26:55 PM) RP__: koen: We can fix something if necessary
(1:27:14 PM) khem: RP__: fix n450.conf
(1:27:23 PM) RP__: khem: cool on gcc
(1:27:28 PM) RP__: khem: fix how?
(1:27:41 PM) khem: does not work with angstrom
(1:28:16 PM) khem: $ MACHINE=n450 bitbake console-image
(1:28:16 PM) khem: ERROR: Unable to parse conf/bitbake.conf: Could not
include required file conf/machine/atom-pc.conf
(1:28:18 PM) Tartarus: khem, I think the answer is "we" need to pull stuff
out of poky if needed and into oe-core/etc
(1:28:23 PM) Tartarus: or meta-intel or ...
(1:28:24 PM) koen: RP__: meta-intel is not how someone would handle a bsp
migrating for either old-oe or something different
(1:28:36 PM) RP__: khem: ick. I'll ensure that gets fixed asap
(1:28:38 PM) koen: RP__: the biggest "problem" is linux-yocto
(1:28:49 PM) koen: RP__: and x86 is no good fit for arm in general :)
(1:29:07 PM) RP__: koen: ok, those are two things which are harder to change
(1:29:10 PM) koen: RP__: the missing atom-pc is what that mailinglist thread
was about
(1:29:24 PM) RP__: koen: I know that, I didn't realise it was breaking
something in meta-intel though
(1:29:52 PM) koen: RP__: Tom Z is adding the meta-yocto dep to README, so
the problem is a bit less severe now
(1:29:56 PM) fray: note IMHO missing atom-pc is just the tip of a problem..
 (yes it needs to be fixed, but... the definitional of the machines,
tunings, architectures, etc are very confusing today)
(1:30:18 PM) RP__: fray: please can we let that one rest for just a little
longer? ;-)
(1:30:33 PM) fray: thats fine, there are other more pressing issues
(1:30:35 PM) Tartarus: nmi from the baby, bbi2
(1:30:39 PM) khem: fray: all common arch tune files belong to oe-core I
would say
(1:30:54 PM) RP__: khem: That isn't what fray is referring to
(1:31:01 PM) fray: khem, thats fine.. but that is something else
(1:31:16 PM) RP__: khem: currently we merge architecture, ABI and tuning
information together
(1:31:25 PM) khem: yes
(1:31:26 PM) fray: read my email on the mailing list if you have questions..
(1:31:31 PM) koen: I think fra wants to take a step back and make all the
tune files look the same
(1:31:45 PM) RP__: koen: split the tune files up more
(1:31:45 PM) koen: and seperate tuning from ABI
(1:31:57 PM) fray: koen, partially.. some of it is splitting them up more..
and some of it is simply making them consistent
(1:32:13 PM) khem: yeah we need machine.conf arch.conf abi.conf
(1:32:23 PM) RP__: I'm not against any of this but I would like to have some
kind of multilib test framework alongside it
(1:32:38 PM) Tartarus: ok, she's down for a nap, back
(1:32:47 PM) khem: Tartarus: thats was quick
(1:33:00 PM) RP__: and given the currently development situation, I think
having some kind of multilib code first might be helpful
(1:33:11 PM) khem: Tartarus: dont make too much noise typing now :)
(1:33:15 PM) Tartarus: khem: I didn't say she's asleep ;)  She is however,
in her crib and will fall asleep soon
(1:33:29 PM) RP__: (I don't want to redesign tune, then find it doesn't work
for multilib and have to redesign again)
(1:33:43 PM) Tartarus: RP__: makes sense
(1:33:57 PM) fray: RP__, my fear is what is there today won't work with
multilibs -- or will introduce significant extra work
(1:34:01 PM) khem: yes multilib is part of this puzzle definitely
(1:34:09 PM) RP__: fray: I don't worry about this ;-)
(1:34:29 PM) RP__: fray: Worst case I write some very specific multilib
configs, then we generalise them later
(1:34:42 PM) RP__: We have much bigger issues around atm :(
(1:35:01 PM) RP__: e.g. there is no sane way we can have : in PN
(1:35:07 PM) fray: ya.. the permissions file & directory really worries me
as someone focused on userspace..
(1:35:20 PM) fray: I can't actually show today that from one build to the
next we'll get the same FS
(1:35:46 PM) RP__: fray: :/
(1:35:59 PM) koen: fray: the sstate repackaging changes shlibs deps from
time to time as well
(1:36:01 PM) RP__: fray: You're making progress and have a solution in mind
though?
(1:36:17 PM) RP__: koen: ?
(1:36:20 PM) koen: e.g.
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/commit/?h=yocto&id=ac74418adb163a2b5120a9220ac8668860a09fc3
(1:36:22 PM) fray: yes, I am making progress.. solution will be a mix of
distro configuration, detecting the issue, and fixing recipes
(1:36:58 PM) khem: fray: only sane way to do that is if we can schedule the
build in same sequence everytime
(1:37:07 PM) khem: otherwise nullify autoconf
(1:37:21 PM) khem: by providing cached output
(1:37:24 PM) fray: khem, the build ORDER is similar (the same within reason)
due to the build-time deps..
(1:37:38 PM) RP__: khem: I don't understand that...
(1:37:38 PM) khem: fray: even that may not be enough
(1:37:40 PM) fray: the problem is at install time, whatever creates a
directory "first" sets the permissions for the directory.. (same for files)
(1:37:42 PM) khem: depends whats staged
(1:37:57 PM) fray: this is a bug in nearly all of the recipes today..
(1:37:59 PM) khem: ups we are talking about different things nm
(1:38:17 PM) RP__: fray: A hack for now might be to add a do_install
postfunc which fixes up the owners/permissions
(1:38:22 PM) fray: good example is a lot of things in my build are creating
"/usr/lib" as 0775.. when it should be 0755.. :P
(1:38:35 PM) fray: RP__ I'm working on cleaning things in the
package.bbclass
(1:39:06 PM) khem: fray: so we can keep updating one's to umask may be
(1:39:16 PM) RP__: koen: thats rather worrying :/
(1:39:24 PM) fray: heh..  unfortunately thats not enough.. but will likely
help some..
(1:41:02 PM) Tartarus: OK, any more commentary here before we pick up the
new topics?
(1:41:09 PM) fray: nothing for me
(1:41:29 PM) koen: RP__: it's hard to reproduce, so I suspect some race
issue with sstate and the shlib code
(1:42:33 PM) RP__: koen: If you can produce a testcase...
(1:42:42 PM) RP__: Tartarus: nothing from me
(1:42:46 PM) koen: RP__: I've been trying to
(1:42:50 PM) koen: Tartarus: no, let's move on
(1:42:53 PM) Tartarus: OK, so moving on
(1:42:56 PM) Tartarus: oe-core and mirrors
(1:43:00 PM) Tartarus: Been a little talk
(1:43:20 PM) Tartarus: I didn't see anything after my suggestion of a last
resort for oe-core and making sure it's easily configurable for distros to
provide whatever they feel is best
(1:43:34 PM) Tartarus: (eg poky and angstrom making sure stuff is never
missed, if they want)
(1:43:36 PM) fray: with the mirror.. One additional comment beyond what I
sent to the list -- should we have PREMIRRORS?  I'm thinking no.. since we
want to go to the upstream.. if that fails, THEN fall back to the MIRROR
(1:44:00 PM) Tartarus: In general or?
(1:44:02 PM) fray: I don't have any issues with yocto, angstrom, or anything
else being the default fall-back..
(1:44:05 PM) fray: for oe-core
(1:44:10 PM) RP__: Tartarus: You're not clear, you're saying just to default
to what?
(1:44:23 PM) ***RP__ probably isn't 100% up to date on the email thread :/
(1:44:37 PM) Tartarus: RP__: I'm saying oe-core should have no PREMIRRORS
and a MIRRORS that's only got no longer upstream stuff
(1:44:44 PM) Tartarus: so it's a last resort
(1:44:51 PM) fray: Tartarus that should be a bare minimum...
(1:44:58 PM) RP__: Tartarus: Who maintains the no longer upstream stuff
mirror?
(1:44:59 PM) Tartarus: But let poky and angstrom and anyone else fill in
with whatever mirror they want
(1:45:07 PM) fray: but wouldn't cover the case where something "goes away"..
i.e. who adds it to the mirrors
(1:45:09 PM) RP__: We do that today...
(1:45:11 PM) Tartarus: RP__: Whomever does that today, assuming they want to
continue
(1:45:12 PM) khem: fray: yeah no premirrors
(1:45:30 PM) Tartarus: fray: The mirror shouldn't be added to easily/often,
it's a last resort
(1:45:33 PM) RP__: The question is whether OE-Core should benefit from work
done by yocto/angstrom
(1:45:36 PM) Tartarus: eg tinylogin is just not anywhere anymore?  OK, add
it
(1:45:43 PM) Tartarus: tzdata changed again? Time for a new recipe
(1:45:56 PM) khem: RP__: sources.oe.org is maintained by me and Tom K
(1:46:09 PM) fray: my concern is that if we rely (in oe-core) on the mirrors
too heavily, then missing upstreams will be "missed"...
(1:46:12 PM) Tartarus: RP__: I think the answer is that a has everything
mirror ISN'T a benefit for oe-core
(1:46:17 PM) Tartarus: It IS for angstrom, poky, etc
(1:46:22 PM) Tartarus: But oe-core we want to know when stuff moves
(1:46:47 PM) khem: yes thats my understanding too
(1:46:48 PM) Tartarus: Since that means a recipe needs work or something
really did go away
(1:46:50 PM) RP__: Tartarus: I think we're just adversely affecting users if
we do that
(1:46:52 PM) fray: I'm not against "meta-oe" having premirrors, or point to
full mirrors..  since I consider that the "distribution"
(1:47:02 PM) Tartarus: RP__: what users?  oe-core only users?
(1:47:09 PM) RP__: Tartarus: yes
(1:47:18 PM) Tartarus: We expect a certain amount of depth on people not
relying on any distro
(1:47:35 PM) Tartarus: I'd expect every distro to have or point at a real
mirror
(1:47:44 PM) khem: anybody who uses oe-core needs to have a distro hisown or
some predefined
(1:47:51 PM) fray: thats my thought.. oe-core is "not a distro".. meta-oe,
poky, angstrom, et al are
(1:47:55 PM) khem: so mirror becomes distro thing then
(1:48:07 PM) koen: meta-oe is not a distro
(1:48:13 PM) koen: it won't have any policy
(1:48:18 PM) ***khem nods
(1:48:21 PM) RP__: This means that releases of OE-Core will degrade badly
with time
(1:48:26 PM) Tartarus: RP__: why?
(1:48:47 PM) RP__: Tartarus: As things get deleted upstream, it relies on
someone adding them to the minimal mirror
(1:48:53 PM) fray: I would expect an update to oe-core, or a (supported) tag
if something goes missing upstream
(1:48:58 PM) Tartarus: No, it relies on people using the distro for that
release
(1:49:00 PM) fray:  -- or to the minimal mirror
(1:49:05 PM) Tartarus: again, jsut a release of oe-core won't be of much use
(1:49:19 PM) RP__: Tartarus: so the OE-Core release standalone degrades
badly over time
(1:49:19 PM) Tartarus: without a release of angstrom and meta-oe and so on
or poky based on it or ...
(1:49:45 PM) Tartarus: RP__: Yes, and I don't think that's a problem.
 Anyone using oe-core by itself is expected to have depth
(1:49:53 PM) Tartarus: and probably is doing their own custom distro, with
their own mirror
(1:50:00 PM) RP__: Well, I think its a bad move for usability
(1:50:09 PM) RP__: but I appear to be outvoted
(1:50:17 PM) Tartarus: We can revisit
(1:50:32 PM) Tartarus: But as an anecdote, no one's come screaming at me
saying we expect a mirror for 2011.03-maint
(1:50:46 PM) RP__: It means our messages is "you can't use OE-Core unless
you're an expect, pick a distro instead"
(1:50:46 PM) Tartarus: Since it's only supported on a defined set of combos
(1:51:07 PM) Tartarus: RP__: yes!  That's what we've all been driving at I
thought
(1:51:13 PM) Tartarus: You don't use oe-core by itself without another layer
(1:51:16 PM) fray: Thats where I thought we'd been driving as well
(1:51:26 PM) Tartarus: You use it + a distro layer + a BSP layer + ...
(1:51:27 PM) ***koen too
(1:51:31 PM) RP__: Tartarus: if that is the case why keep asking me to
ensure it works? ;-)
(1:51:46 PM) khem: RP__: I would think adding some fall back mirrors is not
a bad choice if we get notification about things coming from mirror instead
of upstream
(1:51:47 PM) koen: oe-core can validate itself, but to actually be usefull
you need extra layers
(1:51:52 PM) Tartarus: RP__: touche.  We also said that it would work at the
time at least sans distro, for validation
(1:51:53 PM) khem: that will address fray's concern
(1:52:29 PM) ***fray notes he's using oe-core for the development when we
submits patches to oe-core..
(1:52:44 PM) fray: but I expect I'll need Poky/Yocto if I'm working on a
distro or BSP
(1:52:45 PM) RP__: I just think having something with broken defaults is
nuts. We have specific checks to check SRC_URI valitidy
(1:53:45 PM) Tartarus: Like I said, we can revisit this
(1:53:51 PM) Tartarus: And maybe for a maint branch we would add some mirror
(1:53:53 PM) khem: ok
(1:54:01 PM) Tartarus: But for active development, we want failures so we
know there's a problem
(1:54:07 PM) ***khem see's RP__ 's point too
(1:54:16 PM) fray: we need to watch error reports and comments.. if people
start complaining, we should reevaluate
(1:54:26 PM) RP__: Tartarus: you said we were revisiting and no further
discussion. Make your mind up please
(1:54:49 PM) Tartarus: RP__: sorry, I mean when we have a release we can
revisit if it's appropriate there
(1:55:03 PM) khem: 5 mins left
(1:55:05 PM) Tartarus: I don't think it is, but i can see a better argument
there then now
(1:55:08 PM) Tartarus: khem: eek, thanks
(1:55:25 PM) RP__: We have people complaining now :(
(1:55:52 PM) Tartarus: Moving on while we have a few min
(1:56:02 PM) Tartarus: khem brought up the topic of people doing dev in
oe.dev rather than oe-core
(1:56:07 PM) Tartarus: What do we want to do about that?
(1:56:21 PM) Tartarus: Make a recommendation that folks do both?  Just a
general reminder that oe.dev will be winding down?
(1:56:23 PM) Tartarus: something else?
(1:56:26 PM) khem: actually there are new devs posting new recipes or
updates
(1:56:37 PM) RP__: We should be trying to ensure feature parity between
oe-dev and oe-core at a minimum
(1:56:46 PM) fray: I expect it will continue, I'm just worried that when we
freeze oe.dev these people are going to be "upset"
(1:56:52 PM) khem: so I would prefer that development to channel into new
layering setup somehow
(1:57:07 PM) RP__: I think we need to put some emails out highlighting the
siutation
(1:57:11 PM) fray: for the oe-core functionality I think thats reasonable..
for the others, is meta-oe at a point we should be trying to get people to
push stuff there?
(1:57:59 PM) khem: may be a new layer
(1:58:08 PM) khem: to keep collecting updates
(1:58:24 PM) koen: looking at the size of my bblayers.conf I'd say "put
stuff in meta-oe"
(1:58:31 PM) khem: heh
(1:58:39 PM) khem: ok
(1:58:45 PM) RP__: I think this is what meta-oe was intended for
(1:58:49 PM) khem: Thats true
(1:59:02 PM) khem: OK I will send out an email
(1:59:25 PM) Tartarus: Sounds good
(1:59:28 PM) khem: for asking oe.dev committers to also post pull requests
to meta-oe
(1:59:53 PM) RP__: khem: thanks!
(1:59:59 PM) Tartarus: OK, lets call that one done
(2:00:04 PM) Tartarus: Everyone got 5 more min?
(2:00:07 PM) khem: oki doki
(2:00:10 PM) ***koen does
(2:00:17 PM) ***Tartarus does
(2:00:22 PM) ***RP__ too
(2:00:23 PM) khem: me too
(2:00:24 PM) Tartarus: OK
(2:00:27 PM) Tartarus: So, last topic
(2:00:32 PM) Tartarus: 2011.03-maint, long term plans
(2:00:37 PM) Tartarus: koen, you brought this up, shoot
(2:01:02 PM) Tartarus: (Jefro and promoting devs to be / use the oe-users ML
more for next week pls)
(2:01:05 PM) khem: we need to define long term may be quantitatively
(2:01:23 PM) koen: if we close .dev, we need a different strategy for the
maintenance branch
(2:01:31 PM) ***Jefro noted
(2:01:36 PM) koen: e.g. "commits need to be in oe-core/meta-oe"
(2:01:54 PM) Tartarus: koen: yes, a change of from oe.dev master to
oe-core/meta-oe/relevant layer" is fine with me
(2:01:56 PM) khem: koen: yes I guess if its a common recipe in meta-oe or
core
(2:01:58 PM) Tartarus: Anything more than that?
(2:02:06 PM) koen: not from me
(2:02:12 PM) Tartarus: OK, that's easy enough
(2:02:21 PM) Tartarus: I'll update the policy now to make that an
alternative
(2:02:27 PM) Tartarus: to encourage folks to be pushing to the new place
(2:02:35 PM) khem: Tartarus: yes sooner this starts better it is
(2:02:38 PM) Tartarus: And not backport from there to oe.master for 2011.03
maint
(2:02:43 PM) khem: it can start even now
(2:02:47 PM) ***Tartarus takes the AI, will do it todayish
(2:02:54 PM) Tartarus: With that then, lets call the meeting closed
(2:02:57 PM) Tartarus: Thanks all

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

