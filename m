Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1RMMmE-00068K-8c; Fri, 04 Nov 2011 17:38:01 +0100
Received: by qam2 with SMTP id 2so2304632qam.6
	for <multiple recipients>; Fri, 04 Nov 2011 09:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=iUyI6Ii43EH2TmwEkkMmztSgmHUVS3CYRla/gCP9OJo=;
	b=XAjr4bxLPLMrUELPLlCs49NaSQRVwdYTTFifDbzL97bUNZlzKaPfcon3TLdw21V44O
	lL3gSTdRpDN42/jyecQ9plb97dZoroohS4iYgG4flD0dZV6PheZBruz4kc8QOMtAqupr
	MI7CnKW/RNJQakd8cwhOpuq/2QqWnMPpciKnw=
MIME-Version: 1.0
Received: by 10.50.169.1 with SMTP id aa1mr13259118igc.9.1320424306915; Fri,
	04 Nov 2011 09:31:46 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.50.216.193 with HTTP; Fri, 4 Nov 2011 09:31:46 -0700 (PDT)
Date: Fri, 4 Nov 2011 09:31:46 -0700
X-Google-Sender-Auth: n0yt8C1Dl4iex3NtJajoWCpf_p0
Message-ID: <CA+YB3rZ5LKYg6aLaOyZY5_9LAnbkFKehtPa5tif5=u1Udt4f2A@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	tsc <tsc@lists.openembedded.org>, 
	openembedded-members@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Minutes: OE-TSC Meeting, 3 November 2011
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
X-List-Received-Date: Fri, 04 Nov 2011 16:38:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

Minutes: OE-TSC Meeting, 3 November 2011
_____________________________________________________________________
Attended:  Richard, Tom, Koen, Mark
Apologies: Khem
Minutes: Jefro
_____________________________________________________________________
Agenda & action items:

- OE GA at ELCE
  overall very positive, though long, meeting
  * publish GA proceedings before Friday (jefro)

- bitbake release
  * 1.14.0 ready to go when servers return (RP)

- oe-lite
  general agreement to investigate collaboration
  * continue discussion on bitbake mailing list (RP)

- oe-core with selinux, other security
  start in a layer, with implementation sufficient that if it were folded
into oe-core it would be acceptable
  * summarize process to wiki (fray)

- other
  major issue with opkg, libbb issue

Noted for future discussion:
- review tools (khem)
- "OE classic read only" thing (koen)
- TSC responsible for setting up OEDEM?

Noted for future TSC meetings: meeting time is based on European time, not
UTC
_____________________________________________________________________
Raw Transcript:

[19:51] <+fray> I remember we had this discussion last year and decided
that TSC meetings were based on European time..
[19:51] <+fray> (note sure we said -which- european time though)  ;)
[19:51] <+Jefro> that's crazy talk
[19:51] <+koen> like I said, DST :)
[19:51] <+Jefro> I thought they were based on UTC?
[19:51]  * fray doesn't care personally
[19:52] <+fray> ...as long as we meet at the same time.. ;)
[19:52] <+koen> I'm here anyway
[19:52] <+Jefro> actually makes no dif to me either, today
[19:52] <+Jefro> I'll send a note to Khem & Tom
[19:54] == Tartarus [trini@pixelshelf.com] has joined #oe-tsc
[19:54] == mode/#oe-tsc [+v Tartarus] by ChanServ
[19:54] <+Tartarus> I'm, uh, as ready as I'll ever be
[19:54] <+Tartarus> So if RP and koen want out sooner, that's fine
[19:55] <+fray> ready now or later..
[19:58] <+koen> I'm ready
[19:58]  * RP__ is here
[19:59] <+Jefro> I have not heard from Khem, but everyone else seems to be
present & ok to meet
[19:59] <+RP__> We did say Europe time which is an hour from now
[19:59] <+RP__> but I'm here
[20:00] <+fray> khem the only one missing?
[20:00] <+Jefro> fray: yes, I believe so
[20:00] <+RP__> Isn't Khem out anyway?
[20:00] <+koen> ISTR he is on a multiweek holiday
[20:00] <+fray> I seem tor embmer something about that
[20:01]  * RP__ too
[20:01]  * RP__ suggests we have the meeting
[20:01] <+fray> ok, I'm up for a meeting
[20:01]  * koen 2
[20:01] <+RP__> So - chairperson
[20:02] <+RP__> I can volunteer
[20:02] <+RP__> agenda?
[20:02]  * Jefro notes RP__ = chair
[20:02] <+Jefro> agenda: 1. any new agenda items?
[20:03] <+Jefro> agenda: 2. status on regular items
[20:03] <+RP__>  touch on OE e.V. meeting
[20:03] <+RP__> bitbake release
[20:03] <+RP__> infrastructure update will be hard without khem
[20:03] <+fray> postponed item from last meeting.....
[20:03] <+RP__> We should perhaps talk about oe-lite
[20:03] <+fray> (which I don't remember suddenly)
[20:04]  * Jefro is checking minutes from last meeting - we had a few
deferred items
[20:04] <+RP__> While Jefro is doing that let me take the e.V meeting
[20:04] <+fray> thanx
[20:04] <+RP__> Basic summary is the meeting ran on a lot, 3 hours
[20:05] <+RP__> we didn't get to touch on the tsc as planned
[20:05] <+RP__> so if we want feedback I'd suggest we go for the mailing
list
[20:05] <+fray> sounds like a good idea to me..
[20:05] <+RP__> Jefro will publish minutes of that meeting
[20:05] <+RP__> In general ELC-E was very positive IMO
[20:05]  * koen proposes to rename everything to 'yocto' to avoid confusion
to the outside world
[20:05]  * Jefro notes: proceedings from GA are nearly ready to post
[20:06] <+RP__> koen: I'm not giving up on this naming business yet ;-)
[20:06]  * fray regrets not being able to attend.. but with the bum leg, I
gave up trying to get their own my own
[20:06] <+RP__> Let me talk about oe-lite for a minute
[20:07] <+RP__> I guess people all know the history?
[20:07] <+Jefro> before going on - I found two items from last meeting that
are now on the agenda
[20:07] <+Jefro> from fray: oe-core with selinux, other security
[20:07] <+RP__> Esben didn't like certain things in OE and created OE-Lite
[20:07] <+fray> ahh yes....
[20:07] <+RP__> Jefro: what was the last topic last week that ran on?
[20:07] <+RP__> ah PR stuff
[20:08] <+RP__> Esben has continued development of OE-Lite and is doing
some rather nice stuff there by the sounds of it
[20:08] <+Jefro> reading - PR bumps
[20:08] <+fray> fewer packages?  smaller stuff or?
[20:08] <+fray> how is it different?
[20:08] <+RP__> The trouble is he is breaking compatibility since he
doesn't need that
[20:08] <+RP__> fray: sysroot per recipe
[20:08] <+fray> 'k
[20:08] <+RP__> fray: and all package based dependencies
[20:09] <+RP__> so he rewrote the dependency code in bitbake
[20:09] <+RP__> but he's now also been looking at the parser and has
rewritten that
[20:09] <+RP__> and found inconsistencies in our current syntax
[20:09] <+RP__> He also handles checksums differently
[20:10] <+RP__> and many other details, its very different now
[20:10] <+RP__> The question is whether we'd want to try and see them move
closer together again and whether we can get back to a more common code base
[20:10] <+fray> between that and build-root.. is sounds like it would be a
good idea to identify the different implementation (and feature) details
and understand if any of it looks like a "better" way then what we
currently have -- or something that can fill a gap
[20:11] <+fray> I'm always in favor of trying to come together with other
projects..
[20:11] <+RP__> fray: The other big difference Esben is proud of is that
its simpler and easier to use
[20:11] <+RP__> e.g. he removed package management
[20:11] <+fray> At the least, I think we need to understand what was
removed and what it fixed..  then most likely if we can duplicate that --
we may be able to solve some issues..
[20:12] <+RP__> I feel as a TSC we need to look at why he's done things
differently and see if there are ways we can collaborate
[20:12] <+fray> I agree
[20:13] <+RP__> I should also note Esben has no resources so would be
looking for others to help
[20:13] <+fray> (I'm going to inject buildroot for a second based on the
email to the members list..  the idea of the common upstream patch set,
etc... is something we should help explore w/ buildroot..  that was part of
the goal for the Yocto Project..)
[20:13] <+koen> we had the common patch thing happen a few years ago as well
[20:14] <+RP__> It keeps coming up
[20:14] <+koen> that quickly degenerated into "you OE guys need to do all
the work, we'll steal your patches"
[20:14] <+fray> syncing up projects, common patch repositories, etc all
require people to work together..
[20:14] <+RP__> We've tried to push directly upstream in general
[20:14] <+fray> koen (speaking for Yocto and not OE for a second).. I don't
know that the Yocto people would be against that.. "hey you do all of the
work and we steal your patches"..
[20:14] <+RP__> The trouble is that those other projects value their
"simplicity"
[20:14] <+RP__> That is the biggest difference that comes up now
[20:15] <+RP__> and I can't fault them for that
[20:15] <+fray> In general terms, I like things that simplify packages,
building and configurations for more embedded usage..  we just need people
to take ownership of the item and say, hey I think we have a better way...
[20:15] <+koen> fray: just giving historical perspective
[20:15] <+fray> but when it comes down to it in the end, it often doesn't
work well because the changes can interfer w/ the full functionality version
[20:16] <+RP__> I'm still hoping we can make a fully featured and easy to
use OE
[20:16] <+fray> ...the other thing (in my experience) is then when this
works it's very good.. when it doesn't work, people have to be willing to
step back and decide it's not going to work.. ;)
[20:16] <+fray> RP__ agreed
[20:17] <+RP__> Also, Esben thought things like the parser changes might
not be acceptable to us
[20:17] <+fray> still worth looking into IMHO
[20:17] <+RP__> I've said that they are providing it doesn't change the
world
[20:17] <+RP__> i.e. we should at least talk about them
[20:18] <+RP__> I know the specific way he's implemented recipe specific
sysroots isn't appropriate but that feature is still on the yocto feature
list of possible enhancements too
[20:18] <+koen> so for parser stuff: tsc ml, oe-core ml, bitbakeml?
[20:18] <+RP__> koen: I'd say bitbake list
[20:18] <+fray> ya, int he end bitbake list..
[20:19] <+RP__> but oe-lite's bitbake is very different now I'm told :/
[20:20] <+RP__> So, summary, thinking of the overall architecture there is
some discussions we should have
[20:20] <+RP__> Also its worth noting buildroot have decided not to add
package management support to buildroot
[20:20] <+RP__> too invasive (and hence complex) thereby changing one of
their main advantages
[20:21] <+RP__> so - next topic
[20:21] <+RP__> bitbake release
[20:21] <+RP__> 1.14.0 should roll when the servers come back
[20:22]  * RP__ doesn't have anything to add on that topic
[20:22] <+koen> and oe-core gets a req bump?
[20:22] <+RP__> koen: doesn't need one at this point
[20:22] <+koen> ok, just checking
[20:22]  * RP__ will propose removing fetch v1 from 1.15 though
[20:22] <+RP__> which means 1.15 will no longer work with oe-classic
[20:22] <+RP__> any objections?
[20:23] <+fray> Unless there are any planned changes to bitbake to enhance
oe-classic.. I have no objections..
[20:23] <+koen> not from me
[20:23] <+Tartarus> sounds good
[20:23]  * koen doesn't use OE classic anymore, only copies stuff from the
git tree
[20:23] <+RP__> It seems like a natural step to take at this point
[20:24] <+RP__> other general status updates?
[20:24] <+koen> I guess we'll need to discuss the "OE classic read only"
thing soon
[20:24] <+RP__> We've having issues with the useradd class but I think
we've got them mostly under control
[20:24] <+koen> (not today)
[20:24] <+RP__> Jefro: note as a future topic for discussion?
[20:24]  * Jefro notes future discussion on oe-classic read only
[20:24] <+RP__> we do have a major issue with opkg
[20:24] <+fray> RP__ ya the useradd stuff is getting better from what I can
tell
[20:25] <+RP__> and likely need to hack the ancient libbb code in there :(
[20:25] <+fray> the issue w/ the opkg is that it's relying on actual
uid/gid and not uname/gname..  deb and rpm work on the names..
[20:25] <+fray> (assuming I have the summary right, RP?)
[20:25] <+RP__> fray: correct
[20:26] <+RP__> fray: and the quick look I took at the code shows the
problem to be in libbb
[20:26] <+RP__> (at least)
[20:26] <+koen> RP__: have you mailed the opkg-devel list about it?
[20:27] <+RP__> I pushed the gettext changes which are worth about an 8%
speedup on a quadcore
[20:27] <+RP__> koen: not yet
[20:27] <+koen> r627 is also problematic for use, we'll need to pass
--force-postinstall in the classes
[20:27] <+RP__> koen: that isn't very active is it?
[20:27] <+koen> RP__: fews mails per month
[20:27] <+fray> the PSEUDO_UNLOAD stuff is ready to go in.. just an FYI,
found an issue w/ clone(2) may not have been wrapped properly in pseudo..
but we've never seen a failure in practice..
[20:28] <+RP__> fray: great, that should be worth a couple more percent :)
[20:28] <+fray> PSEUDO_UNLOAD (w/ change to bitbake) will eliminate some of
the LD_PRELOAD penalty
[20:28] <+RP__> ok, any other general status updates?
[20:28] <+koen> RP__: http://groups.google.com/group/opkg-devel/topics
[20:28] <+fray> (I find it interesting it's faster to have pseudo loaded in
memory, then load it only when needed..  and faster yet to -unload- it when
we know its not needed)
[20:29] <+RP__> btw, for the bitbake release, I'm pushing the files onto
yocto's downloads directory
[20:29] <+RP__> I'm more than happy for that to be on OE servers but until
we figure out the infrastructure I'm putting them *somewhere*
[20:29] <+RP__> berlios is going away in 7 weeks
[20:30] <+koen> rapidshare
[20:30] <+RP__> fray: given the exec penalty I'm not so surprised ;-)
[20:30]  * koen hides
[20:30] <+fray> hey there would be no exec penalty if it wasn't for you.. ;)
[20:30] <+RP__> fray: ?
[20:31] <+fray> (we implemented the exec loading in pseudo to have the
PSEUDO_DISABLED case)  ;)
[20:31] <+fray> (I'm kidding BTW)
[20:31] <+RP__> fray: right ;-)
[20:31] <+RP__> ok, any other general status updates?
[20:31] <+Tartarus> not here
[20:31] <+koen> nope
[20:32] <+RP__> Tartarus: you're very quiet ;-)
[20:32] <+Jefro> still to discuss:  (1) oe-core with selinux, other
security, (2) review tools
[20:32] <+fray> ready on (1)?
[20:32] <+RP__> Jefro: I was just searching for that
[20:32] <+RP__> fray: go for it
[20:33] <+fray> Ok, so this is more of a philisophical question then "hey
what do you think about selinux"
[20:33] <+Tartarus> reading and multitasking atm
[20:33] <+RP__> fray: My take is that "it depends"
[20:33] <+fray> Basically the issue is, as security frameworks (and other
system wide frameworks) come into being.. Do we have a policy for reviewing
them and deciding if they belong in "meta"?
[20:33] <+RP__> fray: How big is this patch set and what maintenance burden
does it entail?
[20:33] <+fray> or is it something we tell people to implement in a layer
(via bbappend preferrably?) and then if it's popular we include it.. or?
[20:34] <+RP__> fray: If we're talking two small patches its a no brainer.
If it involved 500kb of patches per recipe, I'm not happy
[20:34] <+fray> security frameworks happen to be the issue of the week for
me... but I can see it for other things as we move forward as well..  what
I'm looking for is simply guidance to give to people..
[20:34] <+koen> start as a layer, go from there :)
[20:34] <+RP__> fray: I suspect its somewhere in the middle ;-)
[20:35] <+RP__> and yes, my gut reaction is "what does this look like in a
layer" would be a good initial approach
[20:35] <+fray> ok, so best practice for (more then one or two patches) is
a layer..  would that layer be accepted back into oe-core?
[20:35] <+RP__> fray: who would be maintaining it?
[20:35] <+RP__> fray: would someone step up and keep the layer in sync with
the core as it changed?
[20:35] <+fray> I think that is part of the question.. if it's a layer,
then "someone" has to maintain that layer.. if it goes back to meta.. then
it would be merged and existing maintainers used..
[20:35] <+koen> does it need to be in oe-core?
[20:36] <+fray> RP__ that is one of my concerns with the layer approach for
a security layer at least
[20:36] <+Tartarus> Well, here's how I see it
[20:36] <+fray> koen, that is another question...  especially for something
like seliux
[20:36] <+Tartarus> These are big new "features" in a way
[20:36] <+Tartarus> So do it in a layer
[20:36] <+RP__> fray: I'd like to understand how big/invasive these patches
are
[20:36] <+Tartarus> Get it working and clean
[20:36] <+Tartarus> Then it can be evaluated
[20:36] <+RP__> fray: maybe start with the minimal images?
[20:36] <+fray> RP__ some of them can be large, others are simply just
adding --enable-selinux to a configure line..
[20:36] <+Tartarus> No "foot in the door" of 5 patches
[20:36] <+RP__> this is what we did with x32 for example
[20:36] <+Tartarus> Then a big explosion later to make it useful, etc
[20:37] <+fray> but we need a way to continue (even with a layer) to
control this stuff via the feature/distribution flags.. (the selinux
example IMHO is a distro flag item
[20:37] <+RP__> fray: you can have a distro feature flag in a layer
[20:37] <+Tartarus> Sure, but that's independent
[20:37] <+koen> oe-core is too big already, adding more layers needs to be
considered very carefully
[20:37] <+fray> ok.. let me sumerize..   something like a new major feature
-- i.e. a security layer -- should be initially implemented and maintained
in a layer..
[20:38] <+fray> it's implementation should be sufficient that if it were
folded into oe-core it would be acceptable..
[20:38] <+fray> over time, the usage and demands of the oe members (and
users) will guide if the feature remains in a layer or if it gets folded
in..
[20:38] <+koen> and appropriate
[20:38] <+fray> the above reasonable?
[20:38] <+RP__> fray: I think so
[20:38] <+Tartarus> with as koen said, yes
[20:39] <+fray> ok, good enough..
[20:39] <+Jefro> fray: that summary seems like it should be on a wiki page
[20:39] <+fray> Jefro, ya..
[20:40] <+fray> you can add an AI for me to do that..  I just need to know
"where"
[20:40] <+Jefro> fray that is the question ... :)
[20:41] <+Jefro> let's discuss offline
[20:41] <+RP__> So any other business?
[20:41] <+fray> 'k
[20:41] <+Jefro> time-check: 19 minutes to go, one remaining agenda item
from last meeting: review tools
[20:41] <+RP__> which tools?
[20:41] <+RP__> koen: any objection to replacing gconf-dbus with gconf btw?
[20:41] <+koen> I heard someone mention that organizing OEDEM "is TSC
business"
[20:41] <+Jefro> I don't know, that was the agenda item
[20:41] <+koen> RP__: gconf-bus is blacklisted in angstrom
[20:42] <+koen> RP__: Josh has been keeping me up to date with his
intentions
[20:42] <+Jefro> "review tools" was from khem, perhaps we can wait on that
one
[20:42] <+RP__> koen: ok, good
[20:42] <+RP__> Jefro: I don't understand which tools so yes, better wait
[20:42] <+fray> fine w/ me
[20:42] <+Jefro> ok - then I believe agenda is clear
[20:42] <+RP__> koen: FWIW Yocto is looking at whether we can tag a day
onto ELC
[20:43] <+koen> RP__: josh discovered that his planned rework of gnome
bbclasses was already done in meta-oe
[20:43] <+RP__> Yocto/OE developer day/summit kind of thing
[20:43] <+Tartarus> Ug, sorry, I need to step away for a bit now
[20:43] <+RP__> Tartarus: I think we're about done
[20:43] <+Jefro> Tartarus - adios
[20:44] <+RP__> Any other requests before we close?
[20:44] <+koen> not from me
[20:44]  * RP__ closes the meeting

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

