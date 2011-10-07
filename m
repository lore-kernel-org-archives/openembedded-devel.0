Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1RCEnJ-0007iF-Rr; Fri, 07 Oct 2011 20:05:13 +0200
Received: by wyh5 with SMTP id 5so4498400wyh.6
	for <multiple recipients>; Fri, 07 Oct 2011 10:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=va4g/C+pQgFBmV5l1hSnGHQkfXogLDZ+7O2DuFuj3uQ=;
	b=uVHWnYkUyNMLhTPojzVoUAIqq6A2DPB3wLeo6o6VNc8Ifdly/9E8L7cyMAcWr8Dwxy
	DQ9+xNlW+RmaRRuJV/WOlBRqJnNJTinLNIzXPQSojDfp9zYiphyVoNFRBJy9eHASNEII
	EFRPeZgBX2t/XlLxTInsgrZcsRIksDFEJI/RE=
MIME-Version: 1.0
Received: by 10.227.201.133 with SMTP id fa5mr2883107wbb.91.1318010375706;
	Fri, 07 Oct 2011 10:59:35 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.180.105.42 with HTTP; Fri, 7 Oct 2011 10:59:35 -0700 (PDT)
Date: Fri, 7 Oct 2011 10:59:35 -0700
X-Google-Sender-Auth: ph1MfKRjqoS64FMIH1jn4ncT3mg
Message-ID: <CA+YB3rbGrMXXYRNbAMQnK7t4hiAd0Renx_sg2XJCy+wwmYK3QQ@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: MINUTES: OE-TSC meeting 6-Oct-2011
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
X-List-Received-Date: Fri, 07 Oct 2011 18:05:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

MINUTES: OE-TSC meeting 6-Oct-2011

Attending: Mark, Richard, Khem, Koen, Tom
Notes: Jefro

--------------------------------------------------------
Agenda & Results

1. pick a moderator
RP

2. new items:
    maintainer files
bitbake doesn't have one
acknowledged need for READMEs in bitbake, main directory, oe-core layers
possibly add knowledge to pull request scripts
    PACKAGECONFIG
        concept generally positive, continue discussing on list
    ELCE
RP: reminder about GA proxy voting
GA plans - Jefro finding a room, Philip B. gathering RSVPs
need a new place for bitbake tarball downloads
Khem can ask Tom K. to revive downloads.oe.org

3. status on old items:
oe-core release
need BSP tarballs (TI), "official" is preferred (having a maintainer is a
good start)
oe-core needs promotion, needs plans in place for release
OE infrastructure moving around, admin issues need a lead
release bitbake as well
elections
Denys sent mail, khem standing down & up
infrastructure
new server "opal", 64 bit VM
transitioning all services from melo to opal
wiki runs on it, moving git over
some difficulty using nginx, Tartarus knows someone good with it
yocto also uses nginx, RP and Tom will both pass on questions
note: berlios closing at end of year,
yocto
1.2 feature list shaping up
rc4 release build successful, waiting now on QA
TI had strategic meeting for 1.2/1.3 wish list, going through yocto channels
WR focusing on workflow improvements

--------------------------------------------------------
Raw Transcript:

(1:02:44 PM) fray: ok.. I;m here now
(1:03:31 PM) RP__: quorum :)
(1:03:51 PM) khem: ok it was not pear but peaches took a bit longer :)
(1:03:53 PM) RP__: Anything for the agenda?
(1:04:05 PM) khem: Infra update
(1:04:14 PM) fray: maintainer files or something similar for "newbies" to
know where to send patches
(1:04:19 PM) khem: move of git to new server is under work
(1:04:21 PM) RP__: Yocto Feature List for 1.2 is shaping up:
https://wiki.yoctoproject.org/wiki/Yocto_1.2_Features
(1:04:47 PM) RP__: Yocto -rc4 release build was successful, waiting on QA
now but its looking pretty much done
(1:05:07 PM) RP__: fray: no brainer, I agree we need it, just need the
patches
(1:05:23 PM) RP__: khem: this is a file at the top level of the tree saying
where patches should go etc.
(1:05:29 PM) Tartarus [trini@pixelshelf.com] entered the room.
(1:05:29 PM) mode (+v Tartarus) by ChanServ
(1:05:35 PM) Tartarus: Sorry I'm late
(1:05:38 PM) Tartarus: just got internet back up
(1:05:49 PM) Jefro: welcome back :)
(1:05:55 PM) fray: RP__ yup.. I think that'll take all of 2 minutes to
discuss.. I just want it in the minutes
(1:05:57 PM) khem: RP__: README at top says about this
(1:05:59 PM) ***RP__ has pasted the last few lines
(1:06:05 PM) Tartarus: no new items from me
(1:06:09 PM) RP__: khem: bitbake doesn't have one for example
(1:06:49 PM) khem: ok
(1:06:52 PM) khem: that should be added
(1:06:54 PM) RP__: Tartarus: we have four of us (koen isn't here)
(1:07:01 PM) RP__: + Jefro :)
(1:07:16 PM) RP__: ok, any other agenda items?
(1:07:23 PM) khem: and may be we can think of adding knowledge to pull
request scripts
(1:07:25 PM) RP__: We could quickly touch on PACKAGECONFIG I guess
(1:07:38 PM) khem: that may be a bit stretch
(1:07:40 PM) Jefro: 1. pick a chair (RP__ already fulfilling that function)
(1:08:33 PM) RP__: ELCE and TSC election?
(1:08:34 PM) khem: RP__: is PACKAGECONFIG same as gentoo's USE flags
(1:08:47 PM) RP__: khem: yes and no ;-)
(1:09:10 PM) khem: similar I would say
(1:09:19 PM) RP__: ok, we have an agenda then
(1:09:33 PM) RP__: do we need to talk about readme files in repos further?
(1:09:41 PM) RP__: We did already as a TSC advise README files
(1:09:56 PM) RP__: Stating how patches should be submitted seems like a good
thing to have there
(1:10:03 PM) fray: just wanted to mention the "problem"
(1:10:17 PM) khem: I think README are good since github displays them on
front page if repo is hosted on github
(1:10:18 PM) fray: I had a user download oe-core and they fixed a problem.
 but they had to ask me where to send the fix..
(1:10:30 PM) khem: and kind of cool when one browses it
(1:10:44 PM) fray: a simple maintainers page or similar (readme is fine)
that says "here is the mailing list to use to send patches" or here is the
maintainer, etc.. is what is needed..
(1:10:59 PM) fray: they were able ot find (immediately) the commit
guidelines and policies on the oe page, but not where to send their patches
(1:11:09 PM) khem: fray: README are pretty common and easy for users to find
(1:11:12 PM) fray: so we should solve that...
(1:11:20 PM) RP__: fray: no argument here
(1:11:26 PM) fray: yup, no worries.. and this includes adding one to bitbake
-- assuming the maintainers there will accept it
(1:11:43 PM) khem: I think most of meta-* layers have it
(1:11:48 PM) RP__: fray: I suspect they will
(1:11:50 PM) fray: (I started to put together one, but wasn't sure what to
put into it..  so I stopped)
(1:11:53 PM) fray: RP ;)
(1:12:14 PM) fray: khem, ya I thought so too.. it's the main meta layer and
the oe-core stuff that doesn't seem to have one.. (if it does, I'm blind)
(1:12:30 PM) RP__: I suspect we just overlooked OE-Core
(1:12:36 PM) fray: ok, anyway that was the one issue I had.. we can move
on.. :)
(1:12:38 PM) RP__: and Poky could do with a variant of that
(1:12:41 PM) khem: yeah the layers in oe-core do need one I guess
(1:12:59 PM) RP__: khem: I don't think the layers do but the main repo
itself it would be good for...
(1:13:10 PM) fray: yup.. bitbake, main directory and oe-core layers (meta)
(1:13:16 PM) khem: RP__: collectively yes
(1:13:27 PM) fray: RP__ I would put one in the meta for consistency with
external layers..  but that's me
(1:14:00 PM) khem: they go to same ml but READMEs minght be different for
different layers thats what I though it wont harm to have the ml name
duplicated into them if Such READMEs existi
(1:14:19 PM) RP__: lets take the patches to the mailing lists
(1:14:23 PM) RP__: infra update?
(1:14:26 PM) fray: yup.. works for me
(1:15:07 PM) khem: We have a new server called opal
(1:15:16 PM) khem: where all services which are on melo
(1:15:21 PM) khem: currently are shifting
(1:15:28 PM) khem: its a 64bit VM
(1:15:45 PM) khem: currently wiki runs on it and we are moving git over
(1:15:54 PM) khem: currently working on configuring cgit
(1:16:07 PM) khem: since it uses nginx and not apache
(1:16:20 PM) khem: its a bit of challange to get CGI scripts running
(1:16:34 PM) khem: but we have figured out
(1:16:37 PM) Tartarus: What kind of nginx problems are we having?
(1:16:37 PM) RP__: yocto uses nginx too
(1:16:41 PM) Tartarus: I know a guy that's good with it..
(1:16:47 PM) RP__: causes problems with the caching :(
(1:16:49 PM) khem: RP__: cool
(1:17:04 PM) khem: then can you send the yocto config for cgit
(1:17:10 PM) khem: for nginx
(1:17:48 PM) khem: is needs spawn-fcgi
(1:17:52 PM) khem: too right ?
(1:18:06 PM) ***koen arrives
(1:18:11 PM) koen: apologies for being late
(1:18:19 PM) khem: welcome koen
(1:19:03 PM) khem: once cgit is configured then we will have only patchwork
left on melo
(1:19:23 PM) RP__: khem: I can try, I'm not familiar with where to find them
though
(1:19:41 PM) khem: RP__: /etc/nginx/sites-available/
(1:20:08 PM) khem: RP__: or whoever configured cgit with nginx can be handy
here
(1:20:18 PM) khem: so some HOWTO can speed it up
(1:20:25 PM) khem: instead of figuring out
(1:20:41 PM) Tartarus: So do we need configure help w/ nginx or no?
(1:20:48 PM) khem: yes
(1:20:48 PM) RP__: khem: looks like there is a fastcgi server configured on
localhost
(1:21:01 PM) khem: yeah that kind of info is needed
(1:21:13 PM) khem: how thats done and how it interfaces with nginx
(1:21:19 PM) Tartarus: OK, well if folks can give me context + questions I
can pass it along
(1:21:30 PM) Tartarus: and if you can hop on efnet instead might be able to
chat w/ the guy :)
(1:21:42 PM) khem: Tartarus: setting up cgit with nginx on ubuntu 10.10
64bit
(1:21:47 PM) RP__: khem: I'll see what I can pass on
(1:21:48 PM) khem: Tartarus: we need howto
(1:21:53 PM) khem: thanks
(1:22:06 PM) khem: errr 10.04 not 10.10
(1:22:40 PM) RP__: So, moving on, I think my comments earlier mentioned what
I wanted to say:
(1:22:41 PM) RP__: Yocto Feature List for 1.2 is shaping up:
https://wiki.yoctoproject.org/wiki/Yocto_1.2_Features
(1:22:41 PM) RP__: Yocto -rc4 release build was successful, waiting on QA
now but its looking pretty much done
(1:22:43 PM) Tartarus: Is it just not working or a specific error?
(1:22:55 PM) RP__: koen: any topics?
(1:23:08 PM) koen: we finally had our TI strategic meeting for what we want
in 1.2/1.3
(1:23:24 PM) koen: but that will go through yocto channels
(1:23:41 PM) khem: koen: ok anything thats interesting for oe-core ?
(1:23:47 PM) fray: as an OE TSC -- we need input from the OE members / users
on what they want/need..
(1:23:50 PM) RP__: koen: ok, cool. The sooner the better since planning is
well under way now ;-)
(1:23:59 PM) koen: for the oe-core release download page we need BSP
tarballs as well
(1:24:10 PM) fray: as a WR person for a second, we're going to be focusing
on workflow improvements...
(1:24:28 PM) koen: and vet the bsp to weed out crappy ones from the good
ones
(1:24:44 PM) khem: Tartarus: ground up would be good. We have nginx working
but not with cgit
(1:24:54 PM) Tartarus: ok
(1:24:59 PM) RP__: koen: The hard bit is defining crappy
(1:25:06 PM) Tartarus: I'll see how annoyed at me my friend is for nothing
more specific :)
(1:25:18 PM) khem: I think bsp's that are official would be preferred
(1:25:24 PM) khem: now define official
(1:25:37 PM) Tartarus: he's not done it before, heh
(1:25:48 PM) ***fray is simply happy with BSPs that have maintainers.. ;)
(1:27:24 PM) koen: and for the oe-core release, oe-core needs to get
promoted
(1:27:29 PM) RP__: ok, any input to the planning process is welcome, no
promises anything gets done but people are free to raise issues
(1:28:52 PM) khem: koen: I would say its distro choice to pick a bsp
(1:29:12 PM) koen: khem: try to find BSPs
(1:29:37 PM) koen: the yocto website is completely silent on !poky
(1:29:45 PM) koen: the OE website is...
(1:30:03 PM) ***Jefro notes meeting midpoint, still to discuss:
PACKAGECONFIG, ELCE, elections
(1:30:17 PM) koen: denys sent out a mail for the elections
(1:30:29 PM) khem: koen: thats something for yocto I guess
(1:30:33 PM) RP__: koen: Its a good point, Yocto has been driving the
release process but we haven't really got plans in place for the OE-Core
part of the release
(1:31:01 PM) RP__: It doesn't help that the OE infrastructure is moving
around and nobody seems to want to take the lead on some of the admin type
issues
(1:31:16 PM) RP__: Speaking of infrastrcture btw, Berlios is closing end of
the yewar
(1:31:24 PM) RP__: we need a new place for bitbake tarball downloads
(1:31:54 PM) khem: RP__: we can put them in sources.oe.org
(1:32:40 PM) RP__: khem: I think separating out the release tarballs might
be nicer for people
(1:33:26 PM) RP__: Is anyone willing to help sort an OE release process?
(1:33:29 PM) koen: can we get downloads.oe.org back?
(1:34:01 PM) khem: koen: isnt that now sources.oe.org ?
(1:34:06 PM) koen: no
(1:34:28 PM) koen: downloades.oe.org was for things like oe .deb and rpm
packages
(1:34:38 PM) RP__: We could use downloads.yoctoproject.org but I suspect
people would not like that
(1:34:47 PM) fray: RP__ I'm willing to help, but I fear ignorance on a lot
of the previous oe history..  so if we want to try to do things the way
they've been done, I'm not sure how helpful I can be
(1:35:14 PM) fray: how was the last oe-dev "released"?  Was it more then
simply a tag/branch?
(1:35:15 PM) khem: RP__: I can help with oe parts on release
(1:35:28 PM) RP__: fray: no, but we need to do better
(1:35:40 PM) Tartarus: fray, pre oe-core we did weekly snapshots and asked
for testing then branched
(1:35:41 PM) fray: ok..  I hadn't realized people wanted more
(1:35:58 PM) RP__: khem: thanks. I think a dedicated downloads.oe.org might
be good and some way of placing tarballs there for people like me
(1:36:13 PM) khem: RP__: ok
(1:36:22 PM) khem: I will ask Tom to set one up
(1:36:34 PM) RP__: The rest of it is likely then getting an announcement
together and so on
(1:36:48 PM) khem: RP__: cgit also exports tarballs
(1:37:00 PM) koen: khem: that's not a real option
(1:37:04 PM) RP__: khem: which change checksum depending on the date
(1:37:09 PM) khem: I get it
(1:37:28 PM) RP__: khem: Also need to coordinate anyone else wanting to
release tarballs of layers etc
(1:37:35 PM) khem: OK,
(1:37:49 PM) RP__: khem: Thanks for helping there, I appreciate it :)
(1:37:59 PM) fray: RP__ isn't the release of layers made after the initial
oe-core release?
(1:38:34 PM) RP__: fray: yes, but people likely need to know about it and
may want to coordinate with the annoucement
(1:38:46 PM) RP__: we have a pretty good idea what the release will look
like now for example
(1:39:06 PM) RP__: If we have the site I can put the bitbake tarballs there
too
(1:39:45 PM) RP__: ok, PACKAGECONFIG - its a fairly major change
(1:40:01 PM) RP__: but we preciously discussed it and now looks like a good
time to bring it in
(1:40:19 PM) RP__: I just wanted to check if there were any strong feelings
or we just continue on list?
(1:40:20 PM) ***fray REALLY likes the concept of packageconfig
(1:41:08 PM) RP__: oh, bitbake release - a good idea alongside the oe-core
release?
(1:41:21 PM) fray: absolutely
(1:41:33 PM) RP__: elce is soon, I don't have anything specific to discuss
on that
(1:41:50 PM) fray: as far as attendance for elce goes, it doesnt look like I
will be there..
(1:41:58 PM) RP__: :(
(1:42:02 PM) ***Tartarus also won't be
(1:42:07 PM) RP__: I'd gently remind people about AGM proxy voting
(1:42:17 PM) fray: I'm still trying to figure out if I'll be able to fly in
for a day or so for the OE eV meeting and such..
(1:42:19 PM) ***khem wont be there either
(1:42:21 PM) RP__: er, s/AGM/GA/
(1:43:07 PM) ***RP__ will be there and has booked tickets now
(1:43:36 PM) khem: I have volunteered koen to be my proxy
(1:43:37 PM) RP__: election wise I was pleased to see the board has
announced another election
(1:43:44 PM) khem: koen: that pact still stands I believe
(1:43:51 PM) fray: ya, I've volunteers Saul Wold to be mine.. ;)
(1:44:39 PM) ***Jefro notes - so far there are 11 people who have announced
attendance at the GA
(1:44:54 PM) RP__: khem: I'm sorry to hear you're standing down but I'm
guessing you're standing again :)
(1:45:19 PM) RP__: Jefro: some may have replied offlist to philip (I did)
(1:45:52 PM) Jefro: RP__ good point (I am setting up a room and need to know
how big)
(1:47:02 PM) RP__: ok, we're through the topics - any other business?
(1:47:20 PM) RP__: I'm pressing on assuming people will jump in with
anything that they want to say
(1:47:30 PM) khem: RP__: I have to make my mind.
(1:47:35 PM) khem: RP__: havent decided yet
(1:47:36 PM) ***Tartarus has no other business
(1:48:28 PM) Jefro: I could chime in & say that I fulfilled my action item
to put together a wiki page with TSC minutes
(1:49:01 PM) RP__: khem: ok, your input has been valuable here but I can
understand its also a commitment and the TSC's role is kind of ever changing
(1:49:04 PM) khem: I am reading about gerrit and other similar tools and try
to make gold work on oe
(1:49:17 PM) RP__: Jefro: Thanks for doing that, its much appreciated!
(1:49:34 PM) fray: jefro, and a good wiki page it is....
(1:49:47 PM) Jefro: :) I only added links to minutes, someone else created
the page
(1:50:46 PM) koen: gerrit pretty much requires using repo
(1:50:57 PM) ***koen isn't a big fan of either
(1:51:31 PM) Jefro: RP__ meeting adjourned?
(1:51:37 PM) RP__: hmm, I didn;t know it needed repo
(1:51:44 PM) RP__: Jefro: yes, meeting closed
(1:51:48 PM) RP__: thanks all!


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

