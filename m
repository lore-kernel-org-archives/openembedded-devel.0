Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>)
	id 1Q03u9-0000o4-7W; Thu, 17 Mar 2011 04:29:41 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2H3Rtrk015499
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Mar 2011 20:27:55 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 16 Mar 2011 20:27:54 -0700
Message-ID: <4D817FB9.5050404@windriver.com>
Date: Wed, 16 Mar 2011 22:27:53 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, <tsc@lists.openembedded.org>
X-Originating-IP: [172.25.36.231]
Subject: Minutes, OE TSC meeting, March 10 2011
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
X-List-Received-Date: Thu, 17 Mar 2011 03:29:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Attendance: Mark Hatle, Richard Purdie, Khem Raj, Tom Rini, Stefan Schmidt, Koen
Kooi

Apologies: Jeff Osier-Mixon

Chair for meeting: Mark Hatle

Agenda 2011-03-10 meeting
-------------------------

01) Agree on meeting chair

Mark Hatle volunteered as chair

02) Status report on oe-core

Still some issues, bitbake compatibility, RPM/rootfs creation on Ubuntu 11.04, a
few other things observed and cleanup tasks remain.  This was a bad week for all
to work on it, things will hopefully be resolved in the coming weeks.

03) Status report on pull model, contrib repo and guidelines

Pull model is working, RP requests more people have the ability to queue up
patches in a repository -- such as the contrib repo.

Contrib repo is not yet visible via the web interface, we want to make it visible.

AI: Khem to talk to admins about making it visible

Guidelines have been sent and discussed on oe-core list, next action is to send
them to the main OE devel list for additional comments.  Once feedback is
obtained and the final version agreed upon by the TSC -- we will post it to the
Wiki.

AI: Mark to send guidelines to oe-devel list.

04) Status report on board support layer guidelines

Waiting on decision from the board on OE as a public repository.  Yocto project
may be able to provide this as well.

05) Status report on version retention policy and interaction with
oe-core / meta-oe / $distro layers

No additional feedback on policy.  Next step is to send it to the OE-devel list
for more feedback.

AI: Tom to send version retention policy to oe-devel list.

06) Status on Yocto / OpenEmbedded integration plan in oe-core

[mostly covered in 02]

Yocto (master -- post 1.0) is basing it's work on oe-core.

07) Start to think about the Policies section on wiki and whether it is
     relevant/correct now, and also what needs to change going forward
to Yocto.
     [Proposed: Graeme]

Suggestion is to put policy information both in the Wiki, as well as in each
layer.  The layer policy may simply reference the OE general policies, and/or
create custom policies as necessary.  This ensures that the user of a layer has
a clear place to look, README, for policy and contribution information.

08) Staus on layer splitting of metadata

Progress is being made.  Will move some of the discussion to the mailing list to
save time.  Specifically need to still discuss what to do with sato, multimedia,
qt, gnome, kde, and similar components.

09) Discuss future of our infrastructure (oestats, autobuilder,run-time
testing)
https://wiki.yoctoproject.org/wiki/Yocto_Buildbot_Autobuilder_Discussions
     [Proposed: Yury]

10) What immediate infrastructure changes are needed to work on integrating
     better with Yocto. [Proposed: Tom King]

(discussion on 9/10 merged)

Talk of using common infrastructure for many items between Yocto Project and OE.
 This is likely a board decision, but general agreement that sharing resources,
repositories and such for oe-core makes sense.

AI: Richard to check with Linux Foundation if they are willing to host non-LF
member BSPs on the Yocto Project site.

Further discussion of deprecation of OE bugzilla.  Yocto intends to keep a bug
tracking system for itself.  This might also be the place where OE-Core bugs can
be tracked.

Further topics:

DISTRO_FEATURE/MACHINE_FEATURE/libc interactions.

Need to have a general discussion on flags, and related in a future meeting.
Should be added as an agenda item.

-- End of Meeting --

Below is the IRC log from the meeting:

(late start)

(12:11:18) fray: go ahead and start.. who wants to chair.. I can run it if you'd
like
(12:11:27) stefan_schmidt: fray: would be good
(12:11:32) RP__: fray: go for it
(12:11:34) Tartarus: sounds good
(12:11:36) ***stefan_schmidt is to confused today
(12:11:44) fray: ok.. #1 is done.. on to status report on oe-core..
(12:12:11) fray: What I've observed is we're still having issues with bitbake
compatibility and Khem is reporting problems with RPM and rootfs construction in
Ubuntu 11.04-alpha
(12:12:50) koen: I haven't done a lot on oe-core this week, to busy with a
production stop problem :(
(12:12:51) stefan_schmidt: RP__: khem: You are going to discuss potential pull
model problems between you two directly I guess?
(12:13:04) RP__: Right, I'm aware there are a few outstanding patches to
OE-Core, I'd just ask people's patience with those until next week when I'm not
travelling
(12:13:24) khem: RP__: I think you should pull actively I will remain proxy
(12:14:00) fray: ok, so to summarize -- we're having some issues.. this week has
been bad for folks.. we'll hopefully catch up next week? Anything else?
(12:14:04) RP__: khem: ok, I think that makes sense. For now I'd just like to
establish the workflow and then we can tweak, arrange travel cover and so forth
as needed
(12:14:18) khem: yes
(12:14:19) RP__: What would help me is people queueing up patches in git branches
(12:14:26) khem: yes I like that
(12:14:40) fray: sounds like we're on 03 then..
(12:14:40) khem: but we need to provide contrib repo of some sort
(12:14:45) RP__: khem: They exist
(12:14:45) Tartarus: yeah, 03
(12:15:02) stefan_schmidt: People around me are still a bit confused with the
new layers and different parts. Seems we will need some time to get people
understand it.
(12:15:04) RP__: khem: openembedded-core-contrib
(12:15:13) khem: RP__: true yes they do
(12:15:15) RP__: not sure why its not on the web interface but it is there
(12:15:23) fray: The commit/patch guidelines were created.. I think we've got
general agreement on them..
(12:15:25) RP__: Could someone take the action to talk to the admins about that?
(12:15:28) khem: Yeah I remember now
(12:15:30) fray: what is the next step? wiki, send them to the main oe list or?
(12:15:35) khem: we have not exposed it on cgit
(12:15:59) Tartarus: So, contrib repo
(12:16:01) stefan_schmidt: fray: I would say ml first to give people a change to
comment
(12:16:05) Tartarus: do we have that setup so that people manage their own branches?
(12:16:07) Tartarus: or no?
(12:16:24) RP__: Tartarus: At this time, no but with gitolite we have the capability
(12:16:25) Tartarus: (meaning delete branches)
(12:16:27) fray: stefan, thats my suggestion as well
(12:16:31) stefan_schmidt: I would say people _can_ use contrib but are not
forced to
(12:16:41) Tartarus: stefan, agreed
(12:16:49) khem: RP__: we have gitolite on oe git
(12:16:51) Tartarus: pw-am is an ok fall-back, and there's other hosting options
(12:17:00) koen: I hacked the pull-request script to point to my own server,
pretty easy to do
(12:17:05) Tartarus: it's just it's so much easier to git pull :)
(12:17:10) RP__: khem: right, thats what I mean
(12:17:30) stefan_schmidt: fray: good. After waiting some time (1 week?) and
reacting on comments we can finalize it and put it in the wiki.
(12:17:31) khem: so if people send to ml and they queue up in patchwork we
should have a staging branch
(12:17:46) fray: ok, unless there are objections on that.. I'll take that action
(12:17:50) RP__: koen: We could take a patch to have it take a default from
something in ~
(12:18:05) khem: I will create my branch for this and would use that as a veneer
for master to pull from
(12:18:08) stefan_schmidt: fray: as you did the most already that makes sense
(12:18:22) koen: RP__: I'll have a look at that next week
(12:19:09) stefan_schmidt: So khem will proxy like Saul in a tree and RP gets
pull requests for them
(12:19:17) stefan_schmidt: Any problems with overlap here?
(12:19:32) khem: stefan_schmidt: not for all
(12:19:37) RP__: stefan_schmidt: I don't think that will be an issue
(12:19:50) khem: I am just thinking for patches that are not proposed through
branch pulls
(12:19:50) stefan_schmidt: ok, just wanted to check
(12:20:17) RP__: khem: You can take a mailing list patch and place it into a git
branch though
(12:20:31) koen: really easy with pw-am :)
(12:20:48) RP__: git am -is /saved/mailfile
(12:20:57) khem: RP__: yes I do that all the time wwhat I meant was to give
master tree to pull from always
(12:21:14) khem: so in my tree I will test and signoff those patches
(12:21:29) RP__: khem: I think we need to experiment and find what works
(12:21:41) ***stefan_schmidt thinks the same
(12:21:50) stefan_schmidt: most things will come naturally
(12:21:56) RP__: So to be clear, is someone going to ask the OE admins to make
the contrib trees public?
(12:22:00) fray: ok.. so what I have as a summary here is.. pull model, we want
Khem to proxy for RP when necessary. contrib repo needs admin assistence and
setup.. we can pull via git am if necessary.. and the commit guidelines need to
go to the regular OE mailing list for review
(12:22:04) stefan_schmidt: anythign else open for oe-core status?
(12:22:14) fray: that was my next question -- who is going to the admins?
(12:22:24) RP__: We also have the question of process documentation. I'm going
to ask Jefro about this. I'm disappointed he's not here :(
(12:22:49) khem: fray: I will
(12:23:00) fray: ok..
(12:23:02) khem: fray: for setting up oe-core-contrib right ?
(12:23:10) fray: stefan_schmidt I think we're done with 2 and 3 then..
(12:23:19) fray: khem, yes oe-core-contrib visible and setup issues if any..
(12:23:25) khem: ok
(12:23:44) fray: so on to 04.. BSP layer guidelines.. I think we're in a holding
pattern until more of the board can respond to the request correct?
(12:23:58) khem: I think so too
(12:24:08) stefan_schmidt: the linux-yocto part could be done
(12:24:11) RP__: The BSP on oe.org seems to have triggered a lot of discussion
(12:24:32) khem: yes it has
(12:24:52) fray: I think RP__ needs to take the action of clarifing from the LF
that yoctoproject will or not allow non-members to post BSPs.. since that was a
question from the board..
(12:24:57) fray: otherwise I think we have nothing else to report..
(12:25:13) RP__: If OE isn't going to do it, I would like to see it on Yocto as
I think having things in a single place where people can see them would be good
for the public perception of the project and usability
(12:25:14) stefan_schmidt: its more political then technical anyway
(12:25:19) stefan_schmidt: ot our job here
(12:25:26) fray: yup I agree
(12:25:28) khem: move on to next
(12:25:37) fray: 05 -- version retention policy..
(12:25:49) fray: I haven't seen any changes from last week.. do we need to send
this to the list as well for additional comments?
(12:25:55) Tartarus: I think so, yes
(12:26:00) RP__: agreed
(12:26:00) khem: yes I think so too
(12:26:03) fray: I know I had questions on this last week in the rgular #oe
channel..
(12:26:08) stefan_schmidt: Tartarus: are you going to do this?
(12:26:09) fray: ok.. Tart can you send it and handle feedback?
(12:26:26) Tartarus: ok
(12:26:36) fray: ok.. onto 6..
(12:26:38) RP__: 06 looks like it was covered in 02 or was there a specific
question?
(12:26:49) stefan_schmidt: yeah, I messed up agenda here I think
(12:26:51) fray: is this the otherway, what is yocto doing?
(12:27:13) fray: ok.. we'll say 06 is 02.. and go on..
(12:27:17) fray: 07 then..
(12:27:18) stefan_schmidt: base on oe-core after 1.0 IIRC?!
(12:27:28) fray: stefan_schmidt I believe that is still the plan
(12:27:36) RP__: Yocto is currently working on stabilisation for release. I'm
keeping Yocto master branch in sync with OE-Core
(12:27:44) RP__: (1.0 Yocto has branched)
(12:27:55) stefan_schmidt: ok, so thats it from the yocto side :)
(12:27:59) stefan_schmidt: good :)
(12:28:01) fray: sounds good.. on to 07
(12:28:12) fray: I'm a little concerned about the policies stuff myself..
(12:28:14) khem: and OE next Q release will be based on oe-core
(12:28:24) stefan_schmidt: 7 sounds like it will become interesting once commit
and version pilicies and final
(12:28:26) stefan_schmidt: policies
(12:28:29) fray: I'm wondering if it would make sense to document the policy
stuff within the layers themselves, as well as have a general OE policy posted..
(12:28:56) fray: that way someone can refer to the policies/guidelines within a
layer (which may be different from the general guidelines already in use by OE)
(12:28:57) khem: we should have policies for oe-core and quidelines for layers
(12:29:08) RP__: stefan_schmidt: Yes, once we have those we start to work on
improved documentation of policies
(12:29:08) stefan_schmidt: fray: we have docs in git, wiki and handbooks right
now...
(12:29:22) fray: ya, my fear is we have them in multiple places and they'll get
out of sync..
(12:29:36) RP__: fray: I think that is ok but we should have some overall
guidelines those layers can refer too
(12:29:41) koen: we should encourage every layer to have a README
(12:29:48) fray: wiki or handbook to me seems like the "right" place for overall
guidelines and OE wide policies..
(12:29:56) fray: the layers themselves for layer specific policies
(12:29:58) koen: that readme can point to wikis if needed
(12:30:05) RP__: koen: right, the layer should have a README and in that is
should document the contributrions model and who the maintainers are
(12:30:08) fray: koen, yes thats what i was thinking
(12:30:22) khem: yeah README is good
(12:30:35) stefan_schmidt: ok, readmes in layers pointing to general pilocies in
wiki or handbook if needed
(12:30:57) ***stefan_schmidt can't write today it seems
(12:30:59) fray: ok.. I think we sound follow that with oe-core.. once we get to
the point of making that change..
(12:31:21) fray: and then get the wiki updated with the policy stuff we have
once Tom and I have given the contributors a chance to comment
(12:31:35) stefan_schmidt: sounds ok
(12:31:45) fray: ok.. anything further on 07?
(12:31:51) stefan_schmidt: we can re-evaluate wiki or handbook for policies then
I think
(12:32:33) fray: ya.. I think once we establish a policies section or whatever
we do.. thent hat is what should be done.. make sure policies and guidelines are
still relevant, needed and accepted by the contributors
(12:32:50) fray: ok -- onto 08 then.. layer splitting of meta data..
(12:32:57) khem: layer splitting metadata I think what koen started as
openembedded-meta should populate with rest of recipes
(12:33:01) fray: I haven't seen any more work with that.. is that being held up
due to the oe-core work still?
(12:33:23) koen: still doing daily builds with meta-oe
(12:33:37) koen: less crazy breakage in oe-core, so less patches needed to meta-oe
(12:34:06) stefan_schmidt: People still hesitate I think, oe-core is just
starting and most will watch what happens
(12:34:09) fray: good.. so progress is being made, just a bit slower..
(12:34:48) khem: I think angstrom if it drives it then it will populate faster
(12:34:50) fray: ya.. like I said earlier, I'm having issues with the bitbake
and I know khem was with the rootfs generation.. if we can get the
bitbake/rootfs stuff solved... and the additional cleanup metnioned on the
mailing list.. I think we'll be pretty good..
(12:34:55) RP__: Are we good with the content in oe-core now?
(12:34:59) fray: general state of the packages and such looks decent
(12:35:01) khem: fray: I still do have issues
(12:35:08) RP__: Are there things we need to remove or add?
(12:35:19) khem: fray: I have still to debug it but its quite reproducable
(12:35:34) khem: RP__: to oe-core ?
(12:35:44) RP__: khem: yes
(12:36:01) RP__: I'm just wondering if we have the layer split right
(12:36:21) fray: I think all thats left is the fixup of the README files, rename
of the scripting..
(12:36:24) RP__: I think there is probably some renaming to do and work in the
distro area but nobody has got to that yet...
(12:36:43) fray: ohh and did we come to a conclusion on recipes-sato,
recipes-multimedia, recipes-qt and recipes-gnome?
(12:37:16) RP__: I think the point when we last discussed this is that some kind
of reference UI helps a lot to be able to test the stack
(12:37:18) fray: (I suggest that discussion stay on the oe-core mailing list
myself..)
(12:37:21) Tartarus: recipes-kde
(12:37:23) RP__: This is why Yocto keeps sato around
(12:37:23) Tartarus: recipes-gnome
(12:38:04) khem: yes UI is needed X11 may be enough?
(12:38:22) khem: and have layers for all others
(12:38:24) RP__: Sato is about as simple as you can make an X11 UI
(12:38:33) Tartarus: xorg should be in the core, imho
(12:38:35) fray: I'll propose this.. we're done with 08 -- we'll follow up on
the rename, removal, revision of files in the oe-core mailing list next week
when everyone gets back?
(12:38:42) Tartarus: but we also need to make it easy enough to opt out of things
(12:38:48) fray: my suggestions for core DO include the xorg..
(12:38:56) khem: me too
(12:38:57) RP__: yes, totally agree on xorg
(12:39:01) fray: yes, but I don't want a build of xorg to -ever- be required
(12:39:40) khem: fray: we can have a ref image for x11
(12:39:41) RP__: ok, lets continue on the mailing list
(12:39:48) fray: yup..
(12:39:51) Tartarus: back to the ML, agree
(12:39:56) RP__: next week I'll have more time for patches
(12:40:02) RP__: (to write them)
(12:40:03) fray: ok.. 09 infrastructure items.. anything for this?
(12:40:07) fray: RP__ :)
(12:40:16) stefan_schmidt: fray: only the one khem handles
(12:40:34) stefan_schmidt: I added the link there
(12:40:34) fray: or should we delay the autobuilder and related (10) items
another week?
(12:40:51) stefan_schmidt: Jay7 and some people from yocto seem to work together
on the autobuilder stuff
(12:40:51) RP__: I have this idea about using the same server for
git.yoctoproject.org and git.openemedded.org
(12:41:08) RP__: The reason why is that they basically do the same thing
(12:41:24) stefan_schmidt: And I thought it would be nice as example of yocto/oe
workgroups on specific targets
(12:41:44) RP__: You can run two different web looks on two domains with the
same gitolite underlying install
(12:42:09) koen: and host BSPs
(12:42:10) stefan_schmidt: The last item is more and offer to help I think. Tom
is always open for admin tasks that may need to be done.
(12:42:11) fray: (probably a board issues -- but) having the LF pay the
bandwidth and machine bill would likely be good for OE as well..
(12:42:15) Tartarus: So, if LF wants to propose infrastructure assistance to OE
by means of git serving HW
(12:42:16) stefan_schmidt: Takes care of the OE servers
(12:42:20) Tartarus: That sounds like a nice proposal
(12:42:21) RP__: The advantage would then be closer linkage between the "OE"
repos and "Yocto" repos and it would keep things in sync by definition between
the two
(12:42:34) khem: RP__: not our call on repo
(12:42:42) Tartarus: And less of a burden on the other folks we're sharing with
(12:42:52) fray: khem, I agree.. but we can propose it to both teh LF and OE
Board and see if either has an issue
(12:42:53) Tartarus: And yes, like fray said, that's a board thing
(12:42:55) RP__: Tartarus: right, this is my thinking
(12:42:59) koen: we have an outstanding request to LF to tell us how they can
help with servers and bw
(12:43:01) Tartarus: I think we as the TSC can say it sounds like a good idea
(12:43:04) Tartarus: but not our call
(12:43:09) koen: I guess I need to poke mike again
(12:43:09) RP__: We can discuss it and recommend to the board
(12:43:16) stefan_schmidt: Tartarus: agreed
(12:43:40) RP__: koen: There is ongoing discussion about that btw
(12:43:52) stefan_schmidt: RP__: I like the idea. Maybe get Tom into the loop as
he works on the OE infra. Better coordinate with him.
(12:43:52) RP__: and I have talked separately to Tom King about this
(12:44:02) stefan_schmidt: RP__: ah, great
(12:44:08) stefan_schmidt: scratch my last comment then :)
(12:44:20) RP__: I'm just connecting the dots since Tom wouldn't move unless the
TSC/board agree :)
(12:44:43) RP__: If we like the idea I can take the discussions further
(12:44:50) stefan_schmidt: It seems we like the idea and if Tom thinks the same
we can state this to the board
(12:44:55) Tartarus: +1 for like the idea
(12:45:04) fray: I'm happy with it
(12:45:09) koen: me too
(12:45:17) stefan_schmidt: me as well
(12:45:30) khem: is it for git or wiki etc. too
(12:45:33) fray: I'd like to get that tied in with the BSP answer as well, if
possible..
(12:45:49) RP__: khem: certainly start with git, I will talk to Tom about the
other services
(12:46:01) RP__: Yocto has a new webserver being inserted into the Yocto rack soon
(12:46:03) fray: git makes sense to me.. I have little opinion on Wiki.. Tom is
likely a better person to ask about that
(12:46:08) RP__: So this is a good time to work on it
(12:46:17) khem: ok
(12:46:40) koen: can we kill the oe bugzilla, btw?
(12:47:00) stefan_schmidt: again, not technical
(12:47:08) RP__: That is an interesting topic actually
(12:47:11) khem: koen: I think some folks still prefer bugzilla
(12:47:12) RP__: OE-Core bugs
(12:47:17) stefan_schmidt: and I don't think we should kill services without
announce
(12:47:21) RP__: Yocto does use bugzilla
(12:47:28) koen: khem: none of the developers do
(12:47:28) khem: people who do not want to subscribe to ml etc.
(12:47:39) khem: koen: but we will have users too
(12:47:48) RP__: Yocto would be lost without its bugzilla actually
(12:47:51) fray: I think if we have a group of maintainers, a bugzilla works
great.... if it's a more free group of contributors.. it gets stale very quickly..
(12:47:54) khem: its important to get inputs from users by all means
(12:47:55) koen: if the devs don't use bugzilla, kill it
(12:48:07) fray: I want oe-core (and yocto) to have a bugzilla.. I'm not sure
there is a benefit to the meta-oe though..
(12:48:14) stefan_schmidt: again, not technical
(12:48:15) fray: someone would have to really claim ownership to make it useful
(12:48:15) ***Tartarus is becoming a fan of jira
(12:48:24) koen: philip and graeme were working to kill it, but got sidetracked
by other problems
(12:48:29) RP__: stefan_schmidt: Its technical to a degree
(12:48:40) RP__: I think we do need to make some kind of decision on the topic
(12:48:47) fray: the technical part (in my opinion) is we should tell the board
our feelings on the topic..
(12:49:06) fray: if we find no use in it, we should tell them -- otherwise
mention where it is (or could be) useful..
(12:49:20) stefan_schmidt: bugzilla is one of these never endings topics in OE...
(12:49:25) RP__: If someone recommends a problem with OE core be reported in the
Yocto bugzilla is that going to upset anyone for example?
(12:49:26) fray: and oe-core is where I see it being useful.. as I see the TSC
(over the long haul) being the maintainers of oe-core
(12:49:37) khem: for now yocto can add a category for oe-core in its bugz
(12:49:49) khem: just a suggestion no way official
(12:49:55) fray: khem, and if thats the decision (use yocto bugzilla for
oe-core) I'm happy with that as well..
(12:50:06) koen: the yocto bugz is actually maintained, the oe one isn't
(12:50:20) RP__: Right, I don;t see value in the oe bugzilla as it is today
(12:50:21) khem: fray: since yocto will be using oe-core its logical for yocto
in itself too
(12:50:25) Tartarus: yeah, oe-core + yocto bugzilla is fine
(12:50:34) Tartarus: since yocto will be using oe-core and doing bts
(12:50:40) Tartarus: And that's not forcing anyone in OE to use it
(12:50:51) RP__: That sounds reasonable to me
(12:51:00) fray: then I think we should take that recommendation to the board..
being that if people want to report bugs (beyond just the mailing list) to the
oe-core.. they should use the yocto bugzilla..
(12:51:01) RP__: It is there and it is useful to track problems
(12:51:11) fray: otherwise bug tracking is mailing list based as it is now
(12:51:11) koen: exactly
(12:51:13) fray: (effectively)
(12:51:17) khem: koen: on a sidenote we can make oe bugzilla RO atleast
(12:51:20) stefan_schmidt: Its not like I would really like oe's bugzilla but
this needs a wider audience then TSC
(12:51:25) stefan_schmidt: to decide that is
(12:51:26) koen: khem: please do
(12:51:52) RP__: stefan_schmidt: What that would need is people to maintain it
(12:51:58) fray: ok, I think with that.. we're out of agenda items..
(12:52:00) koen: stefan_schmidt: philip told me that the TSC should figure it
out first :)
(12:52:03) khem: stefan_schmidt: agreed would you mind writing it up for oe-devel
(12:52:04) Tartarus: Er
(12:52:07) fray: are there any further tiems or comments before we call it a
meeting?
(12:52:08) stefan_schmidt: RP__: correct
(12:52:09) Tartarus: There should be one more at least
(12:52:14) RP__: stefan_schmidt: There are people signed up to maintain the
Yocto bugzilla. We can't sign up to maintain another
(12:52:18) Tartarus: DISTRO_FEATURE/MACHINE_FEATURE/libc interaction
(12:52:23) Tartarus: (the xattr fallout)
(12:52:24) fray: ahh yes..
(12:52:32) Tartarus: And maybe a slightly wider use flags discussion
(12:52:39) Tartarus: But maybe we should start that on the ML?
(12:52:43) stefan_schmidt: khem: ok, I will send out a mail to oe-devel tomorrow
about bugzilla
(12:52:45) Tartarus: Since there's a lot to say and think about there
(12:52:45) koen: Tartarus: my only wish is that *libc features work the same
across the board
(12:52:51) fray: we've got around 8 minutes left today.. I think mailing list is
likely best..
(12:52:57) koen: instead of opt-out in eglibc and opt-in in uclibc
(12:52:58) fray: and we should be sure to add it as a proper topic for next week..
(12:53:07) stefan_schmidt: stating the problems we see, no devs use it, no
meintainer, etc and ask for comments
(12:53:17) khem: koen: eglibc and uclibc has different goals so its rightly aligned
(12:53:29) koen: no it isn't aligned
(12:53:45) koen: and the xattr things show how messed up it is
(12:53:47) Tartarus: It's use aligned but not backwards compat
(12:54:00) khem: koen: eglibc was full featured and that should be our default
hmm may be we can do same for uclibc
(12:54:07) Tartarus: uclibc went opt-out but no one made everyone have the
previous behavior by default
(12:54:38) khem: but features should be selectable
(12:54:45) khem: with certain defaults
(12:54:48) fray: Personally I like the approach of setting a "reasonable"
default and disabling things for libc configurations.. (both in uclibc and
glibc).. as well as "enabling" things not in the reasonable default..
(12:54:59) fray: for me reasonable default for eglibc is the same API as GNU Glibc..
(12:55:02) RP__: I'm missing some background to comment I think. I guess I have
some email I've not got to :)
(12:55:13) khem: fray: thats full eglibc iow
(12:55:39) fray: khem, yes I think so.. (note there are a couple of options that
are disabled by default in eglibc because they don't exist in upstream glibc)
(12:55:41) khem: uclibc was always tunable so there never was a refe
(12:55:49) Tartarus: RP__, uclibc distro + most images broke since (a) avahi
pulls in libcap2 now (b) libcap2 depends on xattr support (3) uclibc doesn't
build that in by default anymore
(12:55:58) Tartarus: => most uclibc images broke in one of the 2011.03 test cycles
(12:56:18) fray: I'm pretty sure you can configure libcap2 to not use xattr..
(12:56:20) stefan_schmidt: One note for the next meeting. I'll be on vacation
without internet. Likely to race down the hill with my board anyway. :)
(12:56:22) fray: (or at least you could)
(12:56:23) Tartarus: fray, nope
(12:56:30) Tartarus: libcap1 maybe, but not 2
(12:56:32) Tartarus: checked
(12:56:33) RP__: Tartarus: ah, right :/
(12:56:40) fray: hmm. ok
(12:56:52) khem: so we need to refine libc features distro features and machine
features
(12:56:56) khem: and there relation
(12:56:59) RP__: stefan_schmidt: ok, hope you get to relax :)
(12:57:01) Tartarus: (non-optional file non-optionally does <sys/xattr.h> and
then a bunch of xattr stuff)
(12:57:09) stefan_schmidt: RP__: I hope that as well :)
(12:57:17) fray: ya.. lets try to start this on the list so stefan can comment
before next weeks meeting since he won't be here...
(12:57:19) Tartarus: khem, and do we want to start a wider discussion of use
flags or not? Or not yet
(12:57:23) Tartarus: ... on the ML
(12:57:32) khem: use flags hmmm may be
(12:57:38) fray: Tartarus ya, I know I've patched file to avoid that..
(12:57:54) RP__: re: use flags, I do plan to look at this topic in the Yocto
1.0+ timeframe
(12:58:06) khem: we should also find things we want to bring in from OE of today
into core
(12:58:07) RP__: try and propose some changes, then implement it...
(12:58:28) fray: khem ya, I still have an outstanding action to do the
investigation.. but keep running out of time.. :(
(12:58:33) RP__: and we are not calling them use flags ;-)
(12:58:54) khem: I wanted to ask on toolchain stuff
(12:58:57) khem: if we have some time
(12:59:20) khem: Do we remain pretty vanilla
(12:59:23) khem: in oe-core
(12:59:35) khem: or do we add stuff to make toolchain more usable
(12:59:47) RP__: khem: What isn't usable?
(12:59:48) fray: khem, I think we should remain vanilla + our integration features..
(12:59:59) khem: more usable I mean more suitable with opts
(13:00:07) fray: I.e. as-needed stuff, poisoned lib and include dirs..that kind
of thing...
(13:00:35) fray: khem, adjusting the gcc spec files to add preconfigured
options? or?
(13:00:48) koen: btw, tons of GNU_HASH errors in oe-core
(13:00:50) ***RP__ only has a few more minutes, then needs to go
(13:00:59) khem: fray: I mean like getting extra patches that make gcc work
better on ppc
(13:01:06) khem: backporting stuff from mainline etc.
(13:01:08) RP__: koen: right, I want to get those fixed
(13:01:19) khem: so far people ignore it since most of vendors use CSL
(13:01:27) fray: khem, I like the idea of fixes and backports.. but it's a LOT
of work....
(13:01:34) fray: and ya, vendors are using CSL..
(13:01:58) stefan_schmidt: better on ml? -EOUTOFTIME
(13:02:03) fray: yup..
(13:02:06) fray: lets call it a meeting..
(13:02:09) RP__: I think its one for the mailing list tbh
(13:02:16) fray: remember to get agenda topics in for next weeks meeting earlier..
(13:02:22) khem: ok bye all
(13:02:30) stefan_schmidt: bye all



