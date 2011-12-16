Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1RbcO4-0007sv-9h; Fri, 16 Dec 2011 19:20:07 +0100
Received: by iakh37 with SMTP id h37so1264650iak.6
	for <multiple recipients>; Fri, 16 Dec 2011 10:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=g8roD3puBZhe1xlAbFELAcdS99Uz/bNKaqQdfHZm+g4=;
	b=v38QY3+EMtSGJNaBqvHAch6hmByTVZ3P689UQ6cA8rcqyzfAFJfaTIJ0T4QUcg5oUK
	X8wjcGUfLrbVwBLNb1GodVmejxqv8eM7q4pRwxCPN3e4nkpHH8ooxeA+Hb6zLIJSER+7
	8Hd1b9TtR50OKHhTKbW1ZsKZELmYpu3N5udag=
MIME-Version: 1.0
Received: by 10.50.87.234 with SMTP id bb10mr10043551igb.81.1324059183285;
	Fri, 16 Dec 2011 10:13:03 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.50.187.168 with HTTP; Fri, 16 Dec 2011 10:13:03 -0800 (PST)
Date: Fri, 16 Dec 2011 10:13:03 -0800
X-Google-Sender-Auth: ixeAewpYaDdrszawS3hhjzxwDs8
Message-ID: <CA+YB3rY4ohRLst7VEpW31Fzyi+hgjHJ7ZpgfCC+4RmvezfEHmA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Minutes: OE-TSC meeting 13-December-2011
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
X-List-Received-Date: Fri, 16 Dec 2011 18:20:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Minutes: OE-TSC meeting 13-December-2011

Attending: Richard, Tom, Mark, Khem
Absent: Koen
Notes in absentia: Jefro
___________________________________________________
Agenda:

Chair: Tom

New issues
- WR review request template
    WR template as starting point:
http://bugzilla.yoctoproject.org/show_bug.cgi?id=1829
  * fray to take a pass at adapting for OE
  * RP to file bugzilla enhancement request (see above link)

- default source mirror for oe-core
    people using oe-core w/o yocto getting issues with source downloads
    suggest oe-core use yocto's autobuilder source mirror as a fallback
default will be sources.oe.org
not appropriate for oe classic
  * khem to take action

- !gplv3 packages that are not being tested
    request yocto do occasional build without gplv3
  * fray to check with WR test team, file bugzilla enhancement req

- documentation
wiki now has easier-to-admin turing test
tag instructions as oe-classic & review, header at top of page
  * fray & khem to work on reviewing, reach out to person suggesting wiki
revs

- autobuilder/regressions
patch review process onerous for trivial fixes
  * further discussion necessary

Status
- TSC elections
    board issue, TSC happy to assist when necessary

Next meeting: Jan 3
___________________________________________________
Raw Transcript:

Tuesday, December 13, 20119:47mode (+v  Tartarus ) by ChanServ
9:47  Tartarus  ~13min?9:49 RP__  Tartarus : yes
9:57  fray  hey there a meeting right now?(or well, in 3 minutes)?
9:59  RP__   fray : YESer, yes
9:59  fray  hehlets see if everyone else remembered..
9:59  Tartarus  No  khem  yet and koen is doing something today
10:00  fray  is 3 a quorem or do we need 4?
10:00  Tartarus  3 is iirc
10:00  RP__  3 is a quorum
10:00  fray  ok.. couldn't remember since we dropped form 6 to 5
10:01  RP__   fray : we were always meant to be 5no deadlock
10:01  Tartarus  So, agenda?
10:01  RP__  we miss Jefro
10:01 fray the only thing I had was to show off the WR review request
template.. (no action required.. just wanted to show it off so we had
something if we determined it as necessary)
of course needs to find the template and pass it on.  (If we want to do
this)
10:02  RP__  Anything we need to cover re: the incident with the mailing
list subscriptions? fray : probably a good topic when we have more
people
10:02 fray Ya.. I'm fine with delaying it..
10:02 Tartarus re the ML stuff, no, I think that's handled
10:02  RP__   Tartarus : ok
10:03  RP__  Anything re: TSC elections?
10:03 fray IMHO it's the type of thing we might need if stability of the
patches goes down -- or more people question the stuff..
10:03 Tartarus I don't really know why it would be a TSC thing, aside
from koen being a member, fwiw
10:03  RP__   Tartarus : Some people I've talked to suggest its a TSC
issue, some says its the board
10:03 fray  Tartarus  I think thats the only thing
10:03  RP__  It was actually reported to the TSC first, I referred it to a
wider group(falls to the TSC as a conflict between members than needed
resolving)
10:04 khem [~ khem @99-57-141-118.lightspeed.sntcca.sbcglobal.net] entered
the
room.10:04mode (+v  khem ) by ChanServ
10:04  RP__  hi  khem
10:04 Tartarus hey  khem
10:04 fray in the end I think it's a board issue, that we are "happy" to
assist in as necessary
10:04 khem hi  RP__
10:04 fray hey
10:04 RP__  khem : agenda items?
10:04 fray w/  khem  here, want me to dig up the template or still
postpone..
10:04 khem I would like to discuss default source mirror for oe-core issue
10:05 RP__  khem : ok
10:05 fray ya, that has been hurting people a lot recently..
10:05 RP__  fray : could do
10:05 fray Ohh I do have one other item to mention.. in OE-Core, it
appears we have a number of !gplv3 package that haven't been tested in
a while..
10:05 RP__ So anything else for the agenda and do we have a chair?
10:06 fray (more of an observation at this point)
10:06 RP__  fray : We should try and increase coverage on the autobuilder.
Perhaps file an enhancement request against the autobuilder?
10:06 Tartarus I'll chair
10:06 RP__  Tartarus : thanks
10:06 khem Probably we should discuss documentation too
10:06 fray  RP__  ya, thats my suggestion..
10:07 RP__  fray : not really a TSC issue
10:07 Tartarus ok, so I see 4 items
10:07 RP__ However lets add autobuilder and fixing regressions to the
agenda?
10:07 Tartarus (1) WR template (carry-over) (2) oe-core source mirror
(3) oe-core !gplv3 stuff (4) docs
10:07 RP__ will expand when ready
10:07 fray It's only a TSC issue in regards to something that's been
missed recently..
10:07 Tartarus ok(5) autobuilder/regressions For (1) lets hold since  fray
has to dig up the template stilland give him the AI to do so(2)  khem ,
go on
10:09 khem lot of people who use oe-core w/o yocto are getting issues
with source downloads
I would suggest that we use yocto's autobuilder source mirror as a fallback
10:10 fray (ready for #1)
10:10 Tartarus So w/o poky, you mean?
10:10 fray  khem , I'm not opposed to that..
10:10 Tartarus And give oe-core a default set of mirrors
10:10 RP__ does feel that would be helpful since OE doesn't maintain one
itselfand this helps people get going
10:10 fray my only concern is simply in the past people have been
concerned that setting Yocto as the default was a problem...
10:10 Tartarus Only issue I see is does Yocto mind the potential
additionaly bandwidth?
10:10 RP__ the system is complex enough to use without that added hurdle
10:11 fray I'm 100% for listing the Yocto (and others if appropriate)
for mirrors.. but I'm not sure they should be enabled by default or
not
10:11 khem I think default will be sources.oe.org
10:11 Tartarus IMHO, on the technical side, we need a mirror
10:11 khem and fallback will be yp.org
10:11 Tartarus If politics become an issue, someone can CNAME
it10:11 RP__  Tartarus : I'm going to stick my neck out and say we should
be ok
10:11 fray  Tartarus  I agree completely
10:11 fray is this something that reasonable (vetted?) source mirrors
can be listed in the oe-core distro config files, and then enabled by
simple settings in the users local.conf?
10:11 khem hmm I like CNAME waytoo
10:11 RP__  Tartarus : the thing is
maintaining a mirror is a reasonable amount of work. When we could
freeload off yocto, I'd suggest we just do that tbh
10:12 Tartarus  RP__ : Right.
10:12 fray I personally have zero problems w/ "freeloading" from Yocto
as the default..  however, the only technical concern I have is when
an upstream source does change, how are we going to find it?
10:12 RP__ yocto is looking at involvement in LF infrastructure to
ensure it an scale too
10:12 khem  fray : if we leave that in default local.conf again I think
users might not enable it
10:13 Tartarus So,  RP__ , would there be a problem having the yocto
mirror also be reachable at something.oe.org?s/reachable at/reachable
as/
10:13 RP__  fray : yocto does run tests on no mirror configurations
10:13 RP__  Tartarus : I think it would be preferred if we
could show it was yocto's mirror
10:13 fray  RP__ , ya my concern is more with oe-core.. (I realize Yocto
should have that covered)
10:13 khem  fray : I think we need a bitbake --dont-use-mirrors
--fetch-all-regardless option
10:13 RP__  Tartarus : i.e. not hide the fact yocto is helping out
10:13 fray secondary item then.. what about "oe-classic" as that seems
to be the biggest generator of concern I've been seeing..
10:13 RP__  khem : MIRRORS="" bitbake foo
10:13 khem and this option could be run once a month or so there we go.
10:14 Tartarus  RP__ : ok So, lets see On the technical side, are we in
agreement that oe-core should default to a mirror? Or is there still
concern?
10:14 khem  fray : for oe.classic I dont think yp.org mirror is
appropriate since it will not have all the sources it needs
10:14 fray  khem , correct..
10:14 RP__ I think it can be added as a fallback reasonably safely
10:15 fray is angstrom or someone else capable of being a mirror?
10:15 Tartarus A mirror for oe classic is another thingFor example,
angstrom has a mirror
10:15 khem yes angstrom has mirror but its throttled
10:15 RP__  khem : oe.classic is deprecated though and I'd expect angstrom
is a good choice there if needed
10:15 Tartarus We're just talking oe-core right now
10:15 fray ok.. framing this squarly on oe-core..  I'm fine with oe-core
having a mirror by default.. and the mirror being the yocto project..
10:15 RP__ the main problem is OE-Core
10:15 khem correct oe-core was my concernfor oe.classic we selectively
put the sources on sources.oe.orgbut this is an issue for oe.classic
too as long as the maintenance branch is alive
10:16 Tartarus OKSo, for oe-core we all agree on using the yocto mirror
by default it sounds like khem , can you take the AI to make the patch
and post it?
10:17 fray ya.. with the note that if someone else has an appropriate
mirror (after vetting) we would be willing to add them as well..
10:17 khem I think for oe-core I would prefer to fallback to yp.org if not
found
10:17 fray  khem , ya.. this would be a "mirror" not "premirror"
10:17 khem notes his AI
10:17 Tartarus OK, item 2 closed(3)  fray , go on
10:17 fray http://pastebin.com/AX0FHGppthis is our WR internal review form..
10:18 Tartarus Oh, you dug out the template, OK(1) then (3)So WR template
10:18 fray this template is what is provided as the "0" patch..
10:18 Tartarus What's the background on this again?
10:18 fray Background -- we were having issues a month or more ago on
patch quality, what a patch was doing and how they were tested..I
wanted to offer this as a possible suggestion if this reoccurs..
10:19 Tartarus ok
10:19 fray obviously this has some WR specific items in it.. but the
idea is simply expand the "patch 0" email to include commonly asked
items..
10:19 RP__ We do already cover some things separately
10:19 fray Yes, this just puts it in one place..
10:19 khem  fray : can we enhance the document in wikiwith this info
10:19 RP__ i.e. we don't need the diffstat pieces
10:20 khem
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
10:20 fray I find the added/removed/diffstat to be useful.. it stops
people from doing the 100 patch emails.. and makes them group them
into more structured pieces.. (this may or may not be desireable)
10:20 RP__ the tested board matrix is nice though
10:20 khem may be this should be enhanced for oe-core
10:21 fray Testing Applicable To, and Testing Expected results is used
by us to build up a unit test matrix for changes..
10:21 RP__  fray : is that a problem we've seen with people sending patches
though?
10:21 Tartarus Yes, this could be useful, perhaps both as a short form
and a long formie for trivial stuff it's not worth doing the full
matrixBut for more complicated changes
10:21 fray most changes don't have unit tests.. -- but when something
comes in that should, we make that chunk be filled
out..10:22 fray  Tartarus  exactly.. this template is intended to show
that the developer isn't just throwing out a patch.. but actually did
some work on it.. trivial patches have most things NOT filled out..
non-trivial most things have to be filled out
10:22 fray (again our internal usage)
10:22 khem I agree on having a suggested template for OE and put it up
in docs but I would refrain from any SCM hooks
10:22 fray "Condition of Submission" is often used when "this has passed
all of my tests so far, but it requires patch XYZ from ... before to
be useful"
10:22 RP__ well, SCM hooks would only hurt me the way we're working
10:23 Tartarus OK, so
10:23 khem  RP__ : no commit hooks can be put in place for local clones
10:23 RP__  fray : I think we could reword that better as "Dependencies"
10:23 Tartarus We all seem to like the concept
10:23 fray if we were to adopt something like this, I would expect the
create patch script to be updated here..
10:23 Tartarus and agree it needs adapting to OEWho wants the AI
there?take a first pass at adapting it to OE usage
10:23 RP__ hides
10:23 fray  RP__  (dependencies is just one of many things there)..  other
uses include "this hasn't been fully vetted yet, and I wanted to make
it available for folks to test"
10:23 RP__ has enough to do atm
10:23 fray again.. out usage vs what may or may not be required..1) I
think we need to decided if any of this is useful for OE-core work..
10:24 RP__ I think this does need someone to look into it furtheri.e.
see how it would get presented to users
10:24 fray 2) if it is, we can make a pass at adapting it to our usage
10:24 khem I agree we need to look more at it.
10:24 Tartarus Yes, agreement on point 1
10:24 RP__ I think my opinion would depend a lot on the actual
implementationMight I suggest if nobody here wants to take it., we
file a bugzilla enhancement?
10:25 Tartarus Yes, lets try that
10:25 fray The #1 thing for us at WR is this template is a starting
point for reviews..  not everything has to be filled out.. this isn't
a paperwork exercise, but a way for the reviewer to get the
information without having to ask additional questions -- to speed up
understandin and reviews of changes.. (the description of the change
belongs in the patch, but sometimes the ancilery info on testing,
dependencies, if it's a finished patch or not, etc.. gets lost)
10:25 Tartarus Can someone take the AI to file the bugzilla enhancement?
10:26 khem I volunteer  fray
10:26 RP__ In the time we're avoiding discussing this we could probably
have filed it
10:26 fray  RP__  back to your question on the diffstat.. I find it nice
(internally) cause I can simply review these items and not have to
look at individual patches to follow the work people are doing..

10:27 RP__  fray : each pull request should have a diffstat already
10:27 Tartarus heh
10:27 RP__ and I do look at it
10:27 fray I can file it, but I'm not sure what to file.. this an
enhancement to the create patch script to incorporate a template?
10:27 RP__ will file the thing
10:27 Tartarus Thanks  RP__ OK, now item (3) testing the non-GPLv3
versions of stuff fray ?
10:27 RP__  fray : I assume I can copy that pastebin into the bugzilla?
10:28 fray  RP__  yes.. 'er.. I did miss one thing..can you strip the
@windriver.com email addr?otherwise it's fine to share
10:28 RP__  fray : yes
10:28 fray ok.. on to 3..What I found is that it hasn't been run for a
while, so I got SRC_URI checksum problems.. and a few things the
upstream location for the components went away..(and without the
oe-core mirror we were discussion before, I couldn't download)
10:29 Tartarus OKSo, what's the desire here?  An occasional autobuild w/
no-V3?
10:30 fray thats it for me on 3.. I just wanted the TSC to be aware of
the issue so we can make sure !gplv3 continues to work -- or say it's
not necessary for OE-core.. (which I'd disagree with)  ya..
maintenance as necessary
10:30 Tartarus Since I assume the yocto autobuilder is still
overloaddedCan WR perhaps set this up as a weekly build internally or
something?
10:30 RP__ As I said, file an enhancement bug requesting it be added to
autobuilder testing
10:30 khem yeah I would say adding it as once a week/bi-weekly test would
be fine
10:30 RP__ OE doesn't do testing of many things due to resources so
we're really going to have to look at Yocto
10:31 fray I'm not sure if we can.. I'll take an action to check our
test team to see if htey can
10:31 Tartarus kAnd file a bugzilla enhancement request asking for an
occasional yocto build like this?
10:32 fray I'll take that action as well
10:32 Tartarus ThanksI think that wraps up (3)So, (4)Docs
10:32 khem yeah, I think we need to document oe-core ways more and more
10:33 Tartarus wiki now has better/easier to administer is-a-human
checks, which is good
10:33 khem yes it does
10:33 Tartarus But oe.org wiki is still in bad shape, isn't it?
10:33 khem I think we need to separate out contents which is meant for
oe.classic onlyand tag it so
10:33 fray did the suggetion to make the pages oe-classic (obsolete) get
done?
10:33 khem I am not aware
10:33 fray I think that would be a really good idea.. then we (oe users)
can go in and fix items for oe-core..
10:34 khem So how should it be donesome documents are 80% common between
classic oe and oe-coreso to update it should we now make it 100%
oe-core
10:35 fray For policies -- unless specifically against oe-classic they
should be fine for now.. we should probably review then (as the TSC,
if appropriate) and verify they are still right
10:35 khem or copy it over and create a new document for oe-core
10:35 fray for the how-to, tag them all oe-classic and then "fix them"
one by one as possible.. khem , hmm.. I'm not sure
10:35 RP__ doesn't have much to add other than agreeing this needs to be
done
10:35 Tartarus  khem : Or just a "For OE Classic" section at the bottom of
the page?10:36 fray  Tartarus  that might be a better answer a things
won't be moving then..
10:36 khem should we have two copies of slightly differing docs
10:36 Tartarus I don't like that idea, at first pass
10:36 fray if it were a book, we'd have some market to say (inline) this
is oe-core and this oe-classic.. but I'm not holding my breath on that
10:37 RP__ http://bugzilla.yoctoproject.org/show_bug.cgi?id=1829 filed
for the template issue
10:37 Tartarus Maybe if we end up having lots of, and long sections of
"For OE Classic"
10:37 khem since maintenance branch is still alive we sort of need to
have the classic docs
10:37 Tartarus we do an oe classic namespace
10:37 RP__ I think some kind of notation pointing out differences with
OE Classic would be best
10:37 fray  RP__  that would be ideal as it would help people transfer
from one to the other..
10:37 RP__ and only split the things where its obvious there are big
differences
10:38 khem I think we can add OE-classic-only or something
10:38 fray We should try to contat the user on the list who offered to
start this work and see if they still can
10:38 RP__ (submission of patches springs to mind)
10:38 khem  RP__ : new people who go to wiki get intructions for oe.classic
atm
10:38 RP__ I'd try and embrace any help with this
10:38 khem that should change
10:38 RP__ agreed
10:39 fray so should we "#1" tag all instructions as oe-classic.. and
then set out to review them?
10:39 khem I plan to work on docs myself some
10:39 fray #2 -- who reviews and decides?(my concern this documents
never being reviewed... better to mark them as oe-classic and then
give a user the wrong impression.. even if parts hold true for
oe-core)
10:40 khem  fray : how do we make that distinction in wiki
10:41 RP__  khem : add a header at the top of each page?
10:41 khem  RP__ : yes that would work
10:41 fray yup.. that was the users suggestion on the list, and I think
it's the right one..they even had a template for itlast I saw, they
couldn't upload their "circle I" info graphic to implement it though
10:42 RP__  khem : could you help them with the upload?
10:43 khem  RP__ : sure I dont know who it was
10:43 fray let me find it..
10:43 khem forward me the mail
10:43 RP__ People helping with docs should be high on the priority list to
attract
10:43 Tartarus OK, since we're nearing the top of the hour
10:43 fray 12/2/11 4:31AM (Central US time)  [oe] Please review my
tmeplate:Oe-core-transition Wiki entry
10:43 Tartarus  khem ,  fray , AI to work with the folks with interest in
the community on the wiki?
10:44 fray Bernhard.guillon@...
10:44 khem ok
10:44 fray ya..
10:44 khem ah yes I remember
10:44 Tartarus OK, so now item (5)
10:44 fray http://www.openembedded.org/wiki/Template:Oe-core-transition
10:44 Tartarus autobuilder/patches?   RP__ , go on
10:44 RP__ I don't know if people have noticed or not but I've been
trying a slightly different approach to some bug fixesBasically, the
overall quality feel of the project has been getting to me a
bitParticularly when I could watch a build exploding and know how to
fix it but needing to wait some hours for patch reviewI don't feel too
bad about the fact we're massively managed to improve the stability
recently but I am worried that people are going to complain about some
patches not getting proper review So I want to solicit opinions on
what is/is not acceptable
10:47 fray As the project maintainer.. 1) I think it's reasonable for
you to put in "trivial" fixes w/o review..2) I think it's reasonable
for people to complain about non-trivial fixes that didn't get
review..
10:47 RP__ I do think that whatever we agree needs to be flexible enough
to allow some judgement as circumstances require
10:47 fray  RP__  yes, I agreepart of being the maintainer, isn't just
being "merge monkey".. but having the knowledge of how and when it's
appropriate to fix a problem
10:48 khem  RP__ : Do you want to fix badly written patches yourselfand
reduce the review cycle on fixed patches ?
10:48 fray  khem , I think that is a judgement call..  some are worth
fixing, some aren't
10:48 RP__ Right, I've also been getting peer review in some cases such
that if several people knowledgeable in a given area ack it, I'm
prepared to speed it up
10:48 khem or is it something like you fix a bug which is trivial and
you want to reduce the review cycle on that
10:48 Tartarus Well, I can see where you come from,  RP__ , but with my
work hat on, on some other projects I've been subjecting myself to the
same rules as everyone else, for trees I run, on the "I'm not above
the rules" grounds, and only try and break the rules when there's a
really good reason (usually wrt time to get something out and other
deadlines)
10:49 RP__  khem : its the trivial patches that are getting speeded up on
the most part
10:49 RP__  Tartarus : right, I don't want to create the
impression I'm above the rules
10:49 fray to me the deciding factor is should I fix breakage..  I.e.
I've merged a reasonable patch, but it had an unintended consquence..
it's logical for me to fix the unintended consquence assuming I (as
the maintainer) deam it to be trivial..
10:49 Tartarus Right.  So for the most part, autobuilder failures are
annoying, esp when you need to fix something else
10:50 fray or alternatively decide it's not trivial and back it out
10:50 Tartarus But outside of preparing for releases, is it really a
win?10:50 RP__  Tartarus : the bigger problem about autobuilder failures
is when they start masking other issues
10:50 Tartarus  fray , imho, that's what build-before-push is
for10:50 RP__  Tartarus : so we end up with a queue of A hiding B hiding C
which takes an age to unravel
10:50 Tartarus  RP__ : Right.  I'm also used to trigger-by-push
autobuilders10:50 fray  Tartarus  yes, I would expect most items are found
in that way.. but occasionally something will slip through
10:50 khem  RP__ : I would propose better testing before putting the patch
in mastermay be regress master-next more
10:51 Tartarus And the resources to find B, C and D with my test builds,
and push all the fixes at once
10:51 fray I think it's reasonable to do this, but it should be avoided
as much as possible
10:51 RP__  khem : cycle time on patch review is basically taking too long
for full testing before things go in
10:51 Tartarus Sadly, I don't even have all of those resources anymore
10:51 RP__  khem : and the review we have been doing catches say 90% of
issues. Its the 10% that are causing problems
10:51 fray RP, is part of the problem "full testing" vs "reasonable
testing"?
10:52 RP__  fray : its full testing
10:52 khem  RP__ : throw out the patch
10:52 fray In my experience full testing takes a long time.. reasonable
testing is fairly short and what most people do to find an issue..
10:52 khem if it fails the testing on master-nextask it to be redone
10:52 RP__  khem : so for example the gtk+ demos patch has exposed a
sstate relocation issue in gdk-pixbuf
10:52 fray  khem , only problem is when patches become intertwined that
isn't as easy to do..
10:52 Tartarus  RP__ : how about thison your machine, how long does it
take to build everything the autobuilder does, image wise, but for
just one machine/
10:52 RP__  khem : I know that sstate issue is now  "randomly" taking out
regression test builds khem : how quickly should I merge the fix?This
isn't hypothetical:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/useradd4&id=1d0d6ae267a6900ecbc1eeab36679a9acfd04807
10:53 khem  RP__ : let autobuilder run on master+your patch
10:53 RP__  Tartarus : couple of hours
10:53 fray RP_ this to me falls under the category of existing problem,
impacting stability.. you have the right to immediately fix it as the
maintainer..but be prepared for blowback if your fix has it's own
problems
10:54 khem  fray : it does happen
10:55 RP__  fray : This is the approach I have been taking for some things
10:55 Tartarus  RP__ : To me, that says that you should be able to cycle
over the problems, and get them all fixed, or at least in a better
spot.  And outside of time-critical windows, ML post + a little time
won't hurt
10:55 khem I think best is to automate somehow to catch these issues in
process before hand
10:55 Tartarus A reduced window isn't horrible, either(ie post in the
morning, push in the evening)Looking over at U-Boot for a
second10:55 RP__  Tartarus : trouble is the above is blocking further
testing of the BSPs
10:56 Tartarus Wolfgang posted, and then just pushed, a trivial fix in
~6hall while I was asleep, even if I'm the custodia of the area in
question
10:56 RP__ Since we're running out of time I'd suggest we think about this
10:56 khem yes
10:56 RP__ I really just want to raise the fact I'm aware of the issue
10:56 Tartarus And personally, I know I've made a brown paper bag
mistake or 20 on trivial I'll just push it now changesSo..
10:57 khem needs to be on road soon
10:57 Tartarus And yeah, we can conclude this at the next meetingWhich
will be, um
10:57 RP__  Tartarus : I don't push anything without local
tests confirming fixes
10:57 Tartarus 27th?  Might not be anyone here, heh
10:57 fray ya..
10:57 RP__ heh, that isn't a good time is it
10:57 khem I wont be here on 27th
10:57 RP__ week later?
10:57 Tartarus I was going to say, 1 week or 3 weeks?
10:58 khem after new year yes
10:58 fray my concluding remarks.. we want to avoid the situation where
we have to accelerate a push..  but in the case of an existing bug,
preventing numerous 'users' from working..  IMHO it's reasonable to
accelerate a push..
10:58 RP__ I'm not aware of anything pressing requiring us to meet next week
10:58 fray neither am I
10:58 Tartarus OK, so Jan 3rd, next meeting?Same time
10:58 RP__ sounds goodworks for me
10:58 Tartarus OK, don't forget to update your calendars everyoneI'll
send this log to Jefro
Which ends HERE


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

