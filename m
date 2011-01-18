Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>)
	id 1Pf9Ng-0005wM-3D; Tue, 18 Jan 2011 12:05:44 +0100
Received: by iwn8 with SMTP id 8so5661914iwn.6
	for <multiple recipients>; Tue, 18 Jan 2011 03:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=FtJTd3ZuNazu25JxBtirz0vQLW/pJ9RuL6uetNEIMbY=;
	b=bvDG9AF7Thy7ueWrWgFjfKzhJrXZov1GvqZCSQ0Ru7YjkNt8G2MljiAG9QtVH9xq4F
	Icp5CKG1U2uORZW7MtWrKFXe10qO9yvbWWuXXix8oYJSLR2wDnIRZfbVASV4uKAkfhEi
	Gk+fGcnCjyRYNY56qBExg1LdPo94+TlKw+ArM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GDJ/VOvX8uSOEIwIVCC5NQYWa/s+ihhZL0V7nQvVH1KyOzDPoP9t4jHQemekuA8oBu
	ahWfcY7jLv5VlkFJJFfBiy4j8d2vgS1MsgKZ5obdMA0FiHOSAL4h58HH8r0KZpFr0i0d
	yWP2pnAtutfGuxI8NyGZNb+/EeVETt7HRYj0U=
MIME-Version: 1.0
Received: by 10.231.35.5 with SMTP id n5mr5814820ibd.159.1295348707136; Tue,
	18 Jan 2011 03:05:07 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Tue, 18 Jan 2011 03:05:07 -0800 (PST)
In-Reply-To: <1295345752.14388.17245.camel@rex>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D355990.6010304@xora.org.uk> <1295345752.14388.17245.camel@rex>
Date: Tue, 18 Jan 2011 12:05:07 +0100
Message-ID: <AANLkTin0-2470+gbpsCkNmfhSR7L_9nvxA8K7fQB2k3x@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-members@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Tue, 18 Jan 2011 11:05:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

We had a discussion on #yocto on this.
Per Graeme's request I am posting a log of that conversation.
The interesting parts start probably from 10.45 to 11.05 and from 11.37 onwards.
However I did not want to edit the log, so I left it all in.

Frans.

(09:46:13 AM) eFfeM_work: RP__ is there a policy in yocto wrt multiple
recipes for a package (e.g. for two different versions); I seem to
recall you mentioned in the past typically one version, but I cannot
really find the ref any more
(09:46:23 AM) RP__: yuke: I might be able to help with that but I
don't want to duplicate anything you're doing
(09:46:58 AM) RP__: eFfeM_work: Yes, there is a strong pressure for
one version (or a stable and a development, maybe scm based recipe)
(09:46:59 AM) yuke: RP__: sure, i will send out the V2 patch
(09:47:36 AM) eFfeM_work: RP__ thanks that is what I recall from the
past too, is there a ref to a written policy statement on this ?
(09:49:54 AM) RP__: eFfeM_work: Its been stated publicly enough but I
think we should have something on the wiki
RP__ rphillips
(09:50:07 AM) eFfeM_work: RP__ thanks
(09:50:31 AM) jiajun1 left the room (quit: Remote host closed the connection).
(10:02:09 AM) bluelightning left the room (quit: Quit: Konversation
terminated!!!111).
(10:02:24 AM) bluelightning [~paul@83.217.123.106] entered the room.
(10:02:31 AM) bluelightning left the room (quit: Changing host).
(10:02:31 AM) bluelightning
[~paul@pdpc/supporter/professional/bluelightning] entered the room.
(10:06:12 AM) KevinTian left the room.
(10:15:11 AM) bluelightning: morning all
(10:16:31 AM) RP__: hi bluelightning
(10:20:12 AM) XorA: morning
(10:27:20 AM) RP__: hi XorA
(10:28:56 AM) XorA: finally some real juicy yocto discussion in OE :-D
(10:40:20 AM) florian_kc [~fuchs@Maemo/community/contributor/florian]
entered the room.
(10:41:20 AM) florian_kc is now known as florian
(10:42:49 AM) Jay7: RP__, XorA: is Yocto one-distro-framework?
(10:43:21 AM) Jay7: it looks alike :)
(10:43:36 AM) Jay7: Yocto or poky even
(10:45:26 AM) XorA: traditionally poky always built poky, but I guess
RP can answer officially
(10:48:11 AM) XorA: the model I have in my head for
Yocto/OE-core/OE-universe is having a core of tested stable toolchains
which will as a neccessity have different versions of gcc/glibc/uclibc
the meta-oe building on this to support multi distros in the same way
we do now
(10:48:21 AM) RP__: Jay7: No, its not indented to be one distro
(10:48:56 AM) Jay7: RP__: but what is current situation? Have yocto or
poky other distros?
(10:49:14 AM) XorA: but people requiring exactly one version
pathalogically means pretty much OE becomes a DISTRO and we kick out
well respected distros like slugos which is a backwards step
(10:49:20 AM) RP__: Jay7: Koen is trying an experiment with Angstrom
(10:50:33 AM) RP__: I don't think Yocto is saying one version
pathologically, but there is a pressure there to try and reduce the
numbers of versions to a small set of well tested ones rather than
many different combinations
(10:50:53 AM) Jay7: so, we are trying to pull
multiple-distro-building-framework on top of framework which is
developed with one distro in mind currently? :)
(10:51:11 AM) XorA: RP__: minimal subset is fine, but certain peoples
crusade to reduce to just one version is wrong
(10:51:32 AM) Jay7: are all Yocto devels know that Yocto should
support multiple distros? :)
(10:51:33 AM) RP__: Jay7: Its not maintained with one distro in mind,
its maintained to try and create a core we can test
(10:51:55 AM) RP__: Jay7: Its been mentioned to them
(10:52:30 AM) Jay7: well, then things are not so bad :)
(10:52:46 AM) RP__: XorA: One version for everything is not realistic
(10:53:15 AM) RP__: Jay7: remember that Yocto has various commercial
interests wanting to build on top of it
(10:53:31 AM) XorA: RP__: way I see it if a version is locked in a
DISTRO then that distro has chosen for a reason to use that version
and we need to maintain that metadata or agree with distro an upgrade
path
(10:54:07 AM) RP__: XorA: Right, the tricky bit is going to be finding
out who is doing that
(10:54:21 AM) XorA: I think sometimes people forget Angstrom and
SlugOS are actually already released distros in the same way debian is
(10:54:55 AM) XorA: and SHR for that matter which has another large user base
(10:55:24 AM) RP__: XorA: I suspect released distros like that would
be best working on a release version/branch of the yocto core in this
model
(10:56:07 AM) RP__: XorA: When they come to upgrade to the next core
release, they make a decision whether to take package upgrades or not.
Not would mean add the version they want to their layer
(10:56:08 AM) eFfeM_work: XorA: I feel that if a distro locks a
recipe, it becomes the responsibility of the distro to maintain that
specific version, not from the recipe maintainer
(10:56:18 AM) XorA: RP__: I dont think its the yocto core that is an
issue, its meta-oe
(10:56:23 AM) eFfeM_work: if the distro pins, the distro should bear
the consequences not the recipe maintainer
(10:56:28 AM) RP__: XorA: right
(10:57:19 AM) eFfeM_work: btw with a release model this should be
simpler, then you could have distro-stable or whatever which builds
upon yocto releases
(10:57:48 AM) XorA: its all very well using branches of meta-oe but
experience has shown us fixes never get back to mainline
(10:57:59 AM) RP__: eFfeM_work: I think you're making the issue very
black and white but there is grey in there too
RP__ rphillips
(10:58:18 AM) Jay7: XorA: add JLime to your list of most used distros :)
(10:58:33 AM) eFfeM_work: RP__: sure there is grey
(10:58:45 AM) XorA: Jay7: exactly, there are lots more than my brain
can hold, and the one recipe model just doesnt work
(10:59:13 AM) eFfeM_work: see also my mail; for apps I'd say
preferably one version for libs there are definitely cases where more
versions are desired
(10:59:19 AM) eFfeM_work: and for toolchains it is unavoidable
(10:59:23 AM) eFfeM_work: meeting, back later
(10:59:43 AM) XorA: eFfeM_work: that is unworkable, simple as that
(11:01:34 AM) XorA: once again this issue is going to obscure real
discussion of yocto/OE working together :-(
(11:02:24 AM) Jay7: at least there is some constructive
(11:02:52 AM) XorA: well at least every path seems to lead to
Yocto/OE-core becoming one
(11:03:10 AM) XorA: which means more QA on the basics
(11:03:28 AM) XorA: we can fight about meta-oe all we like without
affecting that
(11:03:34 AM) XorA: effecting
(11:03:40 AM) XorA: or maybe some other word
(11:03:47 AM) ***XorA is too hung over for english
(11:04:08 AM) Jay7: don't forget, while we are talking Koen is working :)
(11:04:54 AM) XorA: as of weds I plan to join koen on meta-oe work,
Ive been prevented so far by being on holiday for first time in 2
years
(11:05:31 AM) Jay7: I'll join to testing after major kexecboot release :)
(11:08:07 AM) Jay7: XorA: what do you think about OE infrastructure
(e.g tinderbox)? is there any value to improve it now?
(11:08:30 AM) XorA: Jay7: I havent actually used the tinderbox at all
(11:08:32 AM) Jay7: yocto is using buildbot for similar purposes
(11:08:54 AM) Jay7: well.. I'll ask differently
(11:09:14 AM) XorA: I think we should ask Yocto nicely for CPU power
for things like buildbot, OE cant really afford that sort of grunt
sitting in a data center
(11:09:36 AM) Jay7: how long will take migration to Yocto layer? :)
(11:09:49 AM) XorA: Jay7: how long is that string again :-D
(11:12:59 AM) Jay7: good thing behind tinderbox is oe-stats
(11:13:13 AM) Jay7: users may build at home but report status to single place
(11:13:24 AM) Jay7: not sure about yocto's buildbot
(11:15:55 AM) incandescant [~joshual@83.217.123.106] entered the room.
(11:16:08 AM) XorA: I think they are different use cases, that is
useful for users to report issues they see, buildbot is useful for
continuous integration, I think both should be done in ideal world
(11:16:25 AM) RP__: XorA: I have to admit that Yocto is also under
resourced for CPU power in data centres at the moment
(11:16:28 AM) ***XorA fixes issues with public keys
(11:16:32 AM) RP__: XorA: We're working on it though
(11:16:53 AM) RP__: and yes, tinderbox and buildbot fulfil different roles
(11:17:20 AM) XorA: RP__: still is an area why I think we can see OE
would benifit from some form of support in this area, but we can wait
until Yocto had its own infrastructure issues sorted
(11:17:58 AM) RP__: XorA: The trouble is our testcases are expanding
more rapidly than the hardware :)
(11:18:01 AM) ***XorA doesnt expect solutions to happen all tomorrow,
we know the real world doesnt run at RP__ speed :-D
(11:18:25 AM) RP__: On the plus side, this means we have tests being
developed and run
(11:18:34 AM) RP__: e.g. boot testing of images at build time
(11:19:35 AM) RP__: We managed to borrow a 40 way machine to iron out
some of the parallelism bugs in Yocto :)
(11:19:41 AM) XorA: nice
(11:19:59 AM) RP__: I don't think we want to give that back...
(11:20:01 AM) ***XorA has two 24 ways machine here, but they run RHEL4
so getting OE to run might be an issue
(11:20:31 AM) RP__: XorA: Yocto should run there with the standalone
python tarball
(11:21:06 AM) Jay7: XorA: use lxc to run OE in container ;)
(11:21:09 AM) XorA: RP__: I might negotiate with my boss for some CPU
time then, one of the machines certainly stands idle a lot
(11:21:30 AM) XorA: Jay7: lxc?
(11:21:37 AM) ***Jay7 have 6-core on desk.. should load it with something useful
(11:21:44 AM) Jay7: XorA: linux containers
(11:21:51 AM) Jay7: mainlined to kernel
(11:21:53 AM) XorA: Jay7: link me in :-D
(11:22:05 AM) Jay7: I'm building inside lxc now
(11:22:07 AM) XorA: Jay7: in kernel as old as RHEL4?
(11:22:17 AM) Jay7: XorA: oh.. rhel4.. :)
(11:22:36 AM) XorA: nice rock solid OS, but not exactly new fangled
(11:22:38 AM) Jay7: not sure, but debian chroot may help then ;)
(11:23:01 AM) RP__: Jay7: Its the ancient kernel you can't change
(11:23:20 AM) XorA: although debian lenny should operate ok in a chroot on that
(11:23:35 AM) RP__: XorA: maybe :)
(11:23:38 AM) XorA: if not the previous debian stable certainly
(11:23:48 AM) ***RP__ likes the standalone python approach
(11:24:07 AM) ***XorA actually has SRPMS for a python upgrade rolled
(11:24:18 AM) XorA: that allow a parrelel install of python
(11:24:40 AM) XorA: RPM has some nice features that made that easy to do
(11:25:42 AM) RP__: The rpm backend we now have is certainly
interesting in yocto too
(11:36:21 AM) eFfeM_work: re
(11:37:57 AM) eFfeM_work: wrt: (10:59:43 AM) XorA: eFfeM_work: that is
unworkable, simple as that
(11:38:49 AM) eFfeM_work: multiple versions are a PITA wrt
maintenance; note also that I am well aware that one version is not
always feasible, that is why i wrote "should be the common case"
(11:39:55 AM) eFfeM_work: one of the issues we are facing is that
angstrom is using git head to release, and git head is bleeding edge
so sometimes you bleed
(11:40:40 AM) eFfeM_work: I can imagine a distro basing itself on
releases and a -next version for git head (somewhat like the debian
model)
(11:43:15 AM) XorA: eFfeM_work: you miss all the subtle issues of
distro maintenance, say I have a distro for devices with limited nand,
I use abiword versions XXX which fits, new version has many new
features that are cool but increases footprint 2M I want to stay with
old version as new doesnt fit. I dont want to be fighting you every
two weeks to keep old version
(11:43:32 AM) eFfeM_work: btw and wrt the red on the autobuilder
remark, i feel this is a process issue at the yocto side
(11:45:29 AM) eFfeM_work: XorA, I understand that, guess in case of
multiple versions we should record why we have multiple versions and
who is responsible for that; I know the footprint issue also exists
for pango or cairo
(11:46:12 AM) eFfeM_work: the other side is that you get lots of
versions like we have now and the status and support for the versions
is vague for most of them
(11:46:25 AM) XorA: eFfeM_work: we want the policy to suggest a
minimal set of needed recipes and some way to mark in use ones, I see
we dont want to keep ALL versions, but we dont want to be forcing
people down to just one version
(11:47:35 AM) XorA: bitbake can help here as it knows which versions
have been "locked"
(11:47:59 AM) XorA: I wrote some tasks for openmoko once to do this
sort of data processing
(11:48:47 AM) eFfeM_work: XorA, I understand the policy part,
unfortunately at the moment we do not have the removal part of the
policy.
(11:48:59 AM) KevinTian [~ktian1@nat/intel/x-grijessmqauiwiok] entered the room.
(11:49:24 AM) XorA: eFfeM_work: my suggestion would be a cronjob that
crunches the data once an X timeperiod and policy of removal if no-one
objects to the removal report
(11:50:03 AM) eFfeM_work: which makes we keep all kind of old stuff
around because some maybe-not-even-used-any-more distro locks them
(11:50:35 AM) XorA: eFfeM_work: if its really not used "and we can
check by sending emails to OE-dev" then removing that distro from OE
will auto remove old versions
(11:50:37 AM) qhe left the room (quit: Ping timeout: 240 seconds).
(11:50:53 AM) XorA: eFfeM_work: maybe a requirement that all active
distros have a contactable maintainer
(11:51:38 AM) XorA: I dont think its too much to ask to maintain a
current email address in your distro
(11:51:41 AM) eFfeM_work: at some point if a distro does not want to
move forward it should take up maintenance responsibility of such
recipes (and perhaps that is the time to move them to the distro
layer). I happen to have some old recipes in my own overlay because I
need these
(11:52:09 AM) XorA: again that is something that can be done with
discussion with distro maintainer
(11:52:29 AM) XorA: certainly something TSC can drive forward
(11:52:52 AM) XorA: if TSC feel a distro has entered steady state then
they can open dialogue to move it to branch/tag
(11:53:03 AM) eFfeM_work: XorA: I fully agree with contactable distro
maintainers, I proposed this half a year ago or so, but failed
miserably. I could not identify a maintainer for several distros, but
there were also forces against removal of those what I call stale
distro's.
(11:53:48 AM) XorA: eFfeM_work: obvious course of action at this
junction is to requre maintainers to move their own distro to meta-oe
(11:53:58 AM) XorA: eFfeM_work: obviously the ones who dont read email
wont port over
(11:54:10 AM) XorA: eFfeM_work: but wont lose anything as old OE will
still exist
(11:54:11 AM) eFfeM_work: yes and that will at least solve part of the problem
(11:54:40 AM) XorA: eFfeM_work: fancy pasting this log into an email,
this is constructive, but Im on an EEE
(11:56:33 AM) eFfeM_work: btw despite popular belief I am not against
versions, as long as it is clear who is repsonsible for a version (and
probably why there are multiple versions). I never suggested removing
gcc recipes as khem takes good care of them, but in other cases people
seem to create new versions and just leave an unmaintained trail of
junk (which I would like to avoid in the future)
(11:56:52 AM) eFfeM_work: XorA: Do you want that mail to you or to the list
(11:57:09 AM) XorA: eFfeM_work: on the list, get others involved who
are not awake yet
(11:57:16 AM) eFfeM_work: XorA: will do


