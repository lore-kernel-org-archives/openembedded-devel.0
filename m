Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1SwhOM-0005HD-5t; Thu, 02 Aug 2012 00:27:46 +0200
Received: by ggnp4 with SMTP id p4so7143325ggn.6
	for <multiple recipients>; Wed, 01 Aug 2012 15:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=K2sx+Djzm5AX0zUXwuzruEupJ2z/DEaYHiwahwVfB4I=;
	b=UJVDwHuovgRmtlG15tDzzMKpqca19aRKyCCDp7QZRGF77dou0no3/0qWVAza9or8JW
	YkCLLJSFXONJGVli3ccRcHmHNO76Pd16QAvbgVU9bsgSzaLLX7gM5BiGgEbKr9b1XK2c
	WCgJVrI9dJ2EGXnyDp1PXCyNdNUalMJiFz4peqf34bnYNjKrU4mWKaNJz35LsLywD2cD
	q5cv+30uh78afSMVeVpXJYeWj9m1i23+/05kbaihFbFloLIYVrNGytV/Yxnpe8ODIjlP
	MZZJ3/HecOV0yZSzPgkX9GqK/nLyuavrZdnZ4qHn9xFo7kdsARhBgII+CupKc6cGtNJ+
	twpw==
MIME-Version: 1.0
Received: by 10.50.184.226 with SMTP id ex2mr3716902igc.58.1343859366208; Wed,
	01 Aug 2012 15:16:06 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.64.102.4 with HTTP; Wed, 1 Aug 2012 15:16:06 -0700 (PDT)
Date: Wed, 1 Aug 2012 15:16:06 -0700
X-Google-Sender-Auth: Kr3Fbl0-goNOKrFnorIRibf7KQE
Message-ID: <CA+YB3rZsDBbNz3QY1L7WLxArPa7zaJH-sg5-Q+n6HPRhi4EFEw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Minutes: OE-TSC 3 July 2012
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
X-List-Received-Date: Wed, 01 Aug 2012 22:27:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
3 July 2012

Attendees: Mark, Richard, Khem, Paul
Apologies: Koen

________________________________________________________________
Agenda & Results

1. pick a chair: fray

2. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"
 -> continued
 b. discuss communication with OE community about release-oriented phases
 -> continued
 c. pre/post install scripting (fray)
 initscript setup seems like a logical place to start
 goal: way to work with bare (no-init/minimal init), sysvinit, and systemd
based systems with a common framework
 => discuss on mailing list, offer oversight from TSC (fray)

3. new issues

 b. systemd
 discuss on mailing list (all)
 -> Andreas hopes to have patches soon

 c. PR bumps
 => koen to investigate server & report back
   -> continued
 => bluelightning to test on autobuilder infrastructure
   -> continued
 => find someone to write a readme on the use of the PR services, beyond
what is in
       local.conf.sample.extended (all)

 d. cleanups (RP)
 many items could use some cleanup, e.g. variables, refactoring image/pkg
code
 creating bugs for tracking cleanups is first task
 => consider cleanup items & file bugs (all)

4. status

 a. Should we still support separation of / and /usr?
 x>   khem to file enhancement request for python devshell - done
 -> keep monitoring

 a. oe-core release
      discussion on the list about release process

 b. elections
 -> remove from this list, put back when needed - 2 years from last December
 x> Jefro to document on wiki & remind the board in October 2013 - done
 x> Jefro to fix dates - done

 c. infrastructure
 -> Tom K upgraded servers to 12.04 LTS, no issues
    mailing list issue (koen) - board is coping with it, keep on agenda

 d. khem working on eglibc 2.16 upgrade

 e. /root vs. /home/root discussion
 -> RP will probably take fray's patch to use /home/root

 f. oe-made-easy script contribution
 => add wiki note that not part of OE, but provided if someone needs it
(bluelightning)
    possibly review & make more official

________________________________________________________________
Raw Transcript

(16:50:18) khem: hi all
(17:04:18) RP: ok, any ideas on a chair?
(17:04:43) fray: I can chair.. do we have an agenda yet?
(17:04:53) RP: fray: I was just cut and pasting one
(17:05:08) ***fray waits
(17:06:00) RP: anyone have any opens to add?
(17:06:12) RP: http://pastebin.com/8Eg7ZpCy
(17:06:31) RP: I did truncate it a bit
(17:07:03) RP: I guess the only thing I'd add it cleanups and how
aggressive should we be?
(17:08:08) fray: sounds fine
(17:08:21) bluelightning: yep let's discuss that
(17:08:28) khem: nothing from me
(17:08:46) RP: fray: You're chairing?
(17:08:51) fray: sure
(17:09:39) fray: ok.. no other ammendments then?
(17:09:45) RP: I don't think anything has happened with 2a and for 2b, I
think communication is happening as needed
(17:09:51) RP: fray: not from me
(17:10:01) bluelightning: nor me
(17:10:07) fray: RP, correct..  I'm supposed to push them and I finally got
out from the rock I was buried under..
(17:10:09) RP: 2c, we need some proposals but don't have any yet
(17:10:32) fray: 2c -- I keep seeing people talking aobut initscript setup
and such.. I think this may be a fairly logical place to extend the
behavior..
(17:11:07) fray: we already have some with the update-rc.d stuff, but it
would be nice if there was a way to work with bare (no-init/minimal init),
sysvinit, and systemd based systems with a common framework
(17:11:22) RP: fray: no argument, we just need proposals and people with
the time to spend on it
(17:11:30) RP: clearly defined tasks
(17:11:38) fray: ya..  unfortunately I don't have the time or I'd like to
do that..
(17:11:45) fray: (I enjoy system startup issues..)
(17:11:49) RP: fray: common problem :/
(17:12:10) fray: should we ask the folks on the lists to see if anyone
wants to work on this as a common problem?
(17:12:21) fray: (I haven't seen any firm proposals, other then minor
discussion at this point)
(17:12:24) bluelightning: sounds like a good idea
(17:12:30) RP: We can ask...
(17:12:42) RP: My worry is we need someone experienced to review the
changes too
(17:12:46) fray: ok, then I propose we simply say we see a problem, and we
are asking for people to work on this..
(17:12:50) fray: absolutely
(17:13:02) khem: is this for pre/post install scripting
(17:13:08) RP: khem: yes
(17:13:15) fray: pre/post install scripting specifically for
initscript/bootup control
(17:13:58) khem: yes I think we should discuss it on ml and get more folks
ideas
(17:14:28) fray: so lets ask for help here.. with oversight from the TSC
and regular mailing list reviews.. (if we have enough folks able to help)
we should make progress..
(17:14:32) fray: otherwise we're no worse off then today
(17:15:21) fray: anything else on 2c?
(17:15:34) fray: ohh and who has the AI to send out an email asking for
help?
(17:16:49) RP: fray: I think you'd make a good candidate? ;-)
(17:16:54) fray: ok, I take silence as I guess I need to.. ;)
(17:16:57) fray: put me down for the AI
(17:17:18) fray: (ohh and I think we should keep 2c as a standing issue)..
otherwise onto 3?
(17:17:29) RP: fray: sounds goof
(17:17:32) RP: good :)
(17:17:37) RP: fray: well volunteered! :)
(17:17:55) RP: For systemd, I failed to deal with my AR :(
(17:17:55) fray: I see no 3a....
(17:18:00) ***RP will aim to do better
(17:18:06) RP: fray: cut and paste issue
(17:18:08) fray: 3b then.. ;)
(17:18:15) RP: fray: there isn't a 3a
(17:18:39) khem: systemd layer is still empty
(17:18:41) fray: I don't have any thing then on systemd..  on to 3c?
(17:18:48) bluelightning: for 3b I just sent out a ping this morning
(17:18:55) bluelightning: (for the creation of the layer)
(17:18:58) khem: bluelightning: good.
(17:19:06) bluelightning: Andreas is swamped atm but he hopes to have a v2
patch series soon
(17:19:18) khem: bluelightning: yes then we can start testing it out
(17:19:53) fray: excellent
(17:20:29) fray: ok  3c then..  anything to report on the PR server?
(17:21:03) bluelightning: I have not yet talked yet with our autobuilder
folks about testing it, so no progress
(17:21:11) fray: ok..
(17:21:25) fray: is 3d - cleanups (new item) or is that elsewhere?
(17:21:41) khem: bluelightning: is there some email/doc on how to enable it
(17:21:46) fray: (elswhere in the agenda that is)
(17:22:01) bluelightning: khem: I'm not sure, I doubt we have a
comprehensive document for it
(17:22:18) fray: ya, we'll need at least basic instructions on setup and
using it before we can switch to it..
(17:22:32) RP: There is something in the sample local.conf fiiles iirc
(17:22:33) fray: RP -- do you know if there are any Yocto Project
documentation tasks around the PR server?
(17:22:55) RP: fray: I'm not familiar with other docs
(17:23:13) fray: this is in local.conf.sample.extedned
(17:23:13) khem: RP: I would test it out locally since I have some private
feeds where I can experiment with it
(17:23:14) fray: # The network based PR service host and port
(17:23:14) fray: # Uncomment the following lines to enable PRservice.
(17:23:14) fray: # Set PRSERV_HOST to 'localhost' and PRSERV_PORT to '0' to
automatically
(17:23:14) fray: # start local PRService.
(17:23:14) fray: # Set to other values to use remote PRService.
(17:23:14) fray: #PRSERV_HOST = "localhost"
(17:23:15) fray: #PRSERV_PORT = "0"
(17:23:51) khem: thats it ?
(17:23:56) khem: OK I will try it out
(17:24:52) fray: that seems sparse for instructions..  we (Yocto project
we) may have to push for some additional docs on how to use the pr services
in a given project.. so we (oe) can leverage the docs
(17:25:26) RP: well, the setup was kept simple
(17:25:31) khem: I think that would be nice to have a wiki doc or in some
form
(17:25:38) fray: I do an aweful lot of rm, and rebuilds from scratch to try
things out.. so we need to make sure that it's documented how to persist
the PR service between builds and developers..
(17:25:44) RP: I agree some more detailed docs could be useful
(17:26:09) fray: If the YP doesn't have time to document it, we'll have to
find someone who can write up a basic readme on it at least
(17:26:26) bluelightning: fray: I think we'll have to make time
(17:26:43) ***RP agrees
(17:26:48) fray: I think so as well, this is going to become critical
soon...
(17:26:56) ***khem sees an action item
(17:26:59) fray: ok, anything else on the PR servives then?
(17:27:16) RP: No, just that it is becoming more pressing
(17:27:25) fray: khem, agreed.. AI for YP folks (RP?) find out about
documentation resources and PR service...
(17:27:52) fray: AI - -TSC- needs to find someone to write a readme on the
use of the PR services, beyond what is in the local.conf.sample.extended
(17:27:53) ***RP knows who will end up with this task
(17:28:14) fray: ;)
(17:28:47) fray: ok... on to (new) 3d - cleanup items?
(17:28:54) RP: yes
(17:29:01) RP: There are a lot of things we could try and cleanup
(17:29:16) RP: For example should we remove the PCMCIA_MANAGER variable?
(17:29:19) RP: FILESDIR?
(17:29:48) khem: I am all for reducing the variables
(17:29:55) khem: we have too many
(17:30:04) RP: The question is how hard should we pursue something of these
things?
(17:30:10) khem: I think putting this in janitor list would be nice
(17:30:17) RP: khem: Its not janitor
(17:30:37) RP: khem: you need to know what you're doing as the implications
can be singificant
(17:30:39) khem: RP: I think creating bugs for tracking them would be first
thing
(17:30:53) RP: Its also a question of identifying things
(17:30:57) fray: ya, I agree with the bugs for these.. I think we need to
keep cleaning these items up and making them easier to work with..
(17:30:58) khem: RP: agreed however class is still same
(17:31:48) RP: Things like refactoring the image/package code also spring
to mind
(17:32:01) RP: the current code in those class files is looking horrendous
:(
(17:32:02) khem: I dont know if it would make sense to kind of collect a
list or go through and find the items to flag first
(17:32:09) fray: Absolutely...
(17:32:26) RP: Perhaps we should all make some lists
(17:32:33) RP: and then translate these into bugs in the bugzilla
(17:32:35) khem: and PACKAGE_DYNAMICS can we avoid it
(17:32:48) RP: khem: how would you propose that?
(17:33:11) RP: khem: I never wanted to introduce that in the first place
but had no option
(17:33:46) fray: ya, it's the dependencies on dynamically generated
packages is the problem.....
(17:33:49) bluelightning: I have a personal todo item to add some code to
immediately flag up when something PACKAGES_DYNAMIC satisfied wasn't
actually satisfied at the end of do_package
(17:34:07) bluelightning: don't know if that will help but at least the
failure will be earlier than do_rootfs
(17:34:14) fray: too bad you can't build through a specific location and
then trigger bitbake to re compute the dependencies... (once they're no
longer dynamic globs)
(17:34:21) RP: bluelightning: its not an error for that to occur
(17:34:30) RP: bluelightning: think a kernel with all modules as builtins
(17:34:45) khem: RP: havent thought deeply for alternative but I think I
will
(17:34:47) bluelightning: RP: I'm talking about satisfying RDEPENDS not
RRECOMMENDS
(17:34:52) fray: python, perl and kernel are the biggest PACKAGES_DYNAMIC
users right?
(17:35:04) khem: and may be LEAD_SONAME
(17:35:10) khem: can be dropped too
(17:35:20) RP: bluelightning: hmm, where are you going to get the
information to compute that though? I like the idea but...
(17:35:31) RP: khem: LEAD_SONAME is an easier candidate
(17:35:34) bluelightning: RP: I haven't looked into it but it can't be
impossible
(17:35:36) khem: fray eglibc too
(17:35:48) fray: locales/charmaps/etc right/
(17:35:49) RP: bluelightning: its not impossible, I just worry about the
complexity it would introduce
(17:35:50) bluelightning: how will debian renaming work without LEAD_SONAME?
(17:36:11) ***fray -really- hates debian rename.. (but I understand why
it's there)
(17:36:16) RP: bluelightning: I think the idea is you'd split packages more
(17:36:30) khem: split well
(17:36:45) bluelightning: RP: it really annoys me when we get do_rootfs
failures because it's hard to tell what the cause is; a check on
PACKAGES_DYNAMIC is just one piece to help with that
(17:36:48) RP: fray: you have no idea of the pain that caused in the past
;-)
(17:36:58) bluelightning: RP: dependency failures in do_rootfs, I mean
(17:37:17) RP: bluelightning: some debug code that analyses the failure
might be the way to go
(17:37:30) fray: ya, it would be nice if PACKAGES_DYNAMIC, when it's no
longer dynamic was verified..
(17:37:33) RP: bluelightning: if we could extract which package was missing
from the error output
(17:37:42) khem: bluelightning: sometimes they are due to shlib deps in
packages
(17:38:00) fray: one of the biggest complaints we get from customers is
delayed failures..  they'd rather get the failure as soon as it can be
detected... (even if it's after 30 minutes of building)
(17:38:45) khem: I have a stupid method I use for some rfs errors
http://sakrah.dontexist.org/?p=11
(17:38:47) fray: ok.. anyway.. back on topic.. (forgot I was chairing)..
 Do we have specific actions or things we need to do for this.. (I think we
all agree we want to do cleanup, and continue to refactor things as
appropriate)
(17:39:05) khem: fray: I think we should start filing bugs may be
(17:39:19) khem: and add some keyword to them if needed to identify
(17:39:38) RP: fray: action to consider things and come up with lists for
next meeting?
(17:39:48) RP: file bugs
(17:39:48) fray: I'm all for that..  right now we've talking about
refactoring packages, images, debian related LEAD_SONAME...
(17:39:57) fray: RP -- good..
(17:40:02) RP: Lets try and keep it grounded though
(17:40:03) fray: AI -- all consider things to be refactored
(17:40:11) RP: Some of these are nice high level but really hard
(17:40:15) fray: AI - file bugs on things we already know of.. (if this
gets delayed till next week, it's ok)
(17:40:53) fray: ok.. anything further on 3d?
(17:41:34) RP: no
(17:41:53) bluelightning: not for the moment
(17:41:54) fray: ok.. on to 4a..
(17:42:18) RP: khem: did you file that bug?
(17:42:24) fray: 4a is a holding item -- / and /usr seperation.. I haven't
seen any additional comments on the list recently (for or againsts).. so
think we need to keep monitoring...
(17:42:30) fray: what was the devshell item?
(17:42:32) RP: agreed
(17:42:53) RP: add a python devshell maybe using the python interactive
interpreter
(17:43:02) fray: ahh yes..
(17:43:06) RP: khem: was to file a bug
(17:43:15) khem: I did
(17:43:22) RP: khem: cool :)
(17:43:42) RP: For the elections, Frans noticed a discrepancy in the dates,
I suggest we ask Jefro to revise as Frans pointed out
(17:44:12) fray: yup, agreed..
(17:44:24) khem: and we should remove that from agenda
(17:44:42) RP: khem: yes, I just left it to remind me to mention this
(17:44:47) fray: May/June 2013 was the date right?
(17:44:51) RP: yes
(17:45:12) fray: ok.. any thing on 4c?
(17:45:37) RP: not from m
(17:45:40) khem: tom has upgraded servers to 12.04 lts
(17:45:50) khem: without any issues
(17:45:59) fray: cool..
(17:46:29) khem: we are done
(17:46:33) RP: great. Thanks Tom! :)
(17:46:43) RP: Anything else anyone wants to talk about?
(17:46:57) fray: Just wanted to mention the /root vs /home/root discussion
in the oe-core list..
(17:47:10) khem: i am working on eglibc 2.16 upgrade
(17:47:14) fray: If anyone has any background or opinions.. I'd appreciate
if they could jump in and clarify..
(17:47:20) fray: otherwise nothing else from me
(17:47:25) bluelightning: I'm still a bit concerned someone added
"oe-made-easy" to the OE core start guide
(17:47:28) RP: fray: I think its clear we use /home/root and I'll probably
take your patch
(17:47:39) RP: making it configurable would be nice but that is for another
day
(17:47:58) RP: bluelightning: ?
(17:48:04) fray: RP, I'm expecting it won't change due to history.. but
it's an item I'd like to make sure everyone knows about.. (like I said in
the email, caught me by surprise..)
(17:48:18) RP: I'd also note that we've got some recursive dependency
changes in bitbake being worked on at the moment
(17:48:20) bluelightning: concern being, it's something that's not part of
OE and could potentially mask problems
(17:48:33) RP: please report any odd dependency issues if not already being
worked on
(17:48:41) bluelightning:
http://www.openembedded.org/wiki/OpenEmbedded-Core#One-liner_via_oe-made-easy
(17:48:43) RP: bluelightning: right, this is some script?
(17:48:46) bluelightning: yes
(17:48:54) bluelightning: I commented on the ml, nobody replied
(17:49:29) fray: sorry I missed it..
(17:50:01) fray: I'm thinking someone should add a comment that this is not
part of openEmbedded... but provided to help if someone needs it
(17:50:18) fray: if we can review it and it's useful, then we can make it
more official..
(17:50:36) bluelightning: well maybe, but that leads to the kind of docs we
had for OE -classic with a million user suggested "better ways" of doing
things
(17:50:42) fray: my only real concern with something like this is that it's
external of the project....
(17:50:48) bluelightning: right
(17:50:50) fray: bluelightning yes, I can appreciate that as well
(17:51:36) RP: I am worried about people adding 101 ways to do things
(17:51:38) fray: lets add this as a discussion item for the next meeting..
but until then can someone modify the wiki to just clarify this is external
of the openembedded project?
(17:51:46) bluelightning: yep I'll do that
(17:52:02) RP: The official Yocto Project Quick Start is also growing kind
of scarily :(
(17:52:24) fray: yet another item for "refactoring"  ;)
(17:52:49) fray: ok.. anything else for today?
(17:52:58) RP: I think the "this page" link on the OE wiki page needs to be
made more proncounced
(17:53:13) RP: then the oe-made-easy thing might be less necessary
(17:53:17) RP: fray: no
(17:53:31) fray: yup..
(17:53:36) fray: ok.. calling it..  thanks everyone!
(17:54:49) RP: fray: thanks

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

