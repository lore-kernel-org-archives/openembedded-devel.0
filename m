Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhlHB-00061y-Cb for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 16:57:49 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhlGS-0002Yw-02 for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 16:57:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 16:57:03 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 16:57:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 25 Jan 2011 16:56:49 +0100
Message-ID: <ihmrs1$eo0$1@dough.gmane.org>
References: <4D36F9BE.1010601@xora.org.uk>
	<4D3DAB2A.3070303@balister.org>	<AANLkTi=T++s65-mH91BBwT6OBUfzqcGDiq6J-LVk8+SJ@mail.gmail.com>	<ihmaqm$eho$1@dough.gmane.org>
	<1295969034.14388.49867.camel@rex>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1295969034.14388.49867.camel@rex>
X-Enigmail-Version: 1.0.1
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Tue, 25 Jan 2011 15:57:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-01-11 16:23, Richard Purdie wrote:
> Firstly, just for reference, the TSC is having some discussions between
> its members and I'd expect some kind of result from that to be made
> public soon.

> I think its fine to talk about this and form a plan but I would like to
> see some representation from the board and TSC over this to make it
> "official".
> 
> On Tue, 2011-01-25 at 12:05 +0100, Koen Kooi wrote:
>> Ignoring the timeline a bit, since ideally we would do this around a
>> yocto milestone to get them to use this straight after their freeze.
>>
>> The technical roadmap/todo:
>>
>> * setup openembedded-core repo on oe.org
>> * setup oe-core ml on oe.org
>> * add oe-core ml to patchwork
> 
> For these I'd like to confirm that we have sysadmins who are happy that
> there is capability there for these things and that they have time to
> work on them.

Tom can create the git repo, Khem can do patchwork and I can create new
a ml.
The seperate ml makes it possible to mark it as a different project in
patchwork, which makes viewing the outstanding patch q a lot easier.

> I'm also thinking Yocto would want to mirror oe-core on
> git.yoctoproject.org.

The more mirrors, the merrier.

>> * import yocto-core in oe-core
>> * start an integration branch
>>  o remove bitbake
>>  o cleanup namespace (s/yocto/OE/, s/poky/OE/)
>>  o split out superfluous layers (e.g. ememlow)
> 
> For this I'd like to time it so the changes are in sync with what Yocto
> is doing. I'm tempted to suggest we preempt this a little and start
> rearranging Poky now with this in mind?

That would be great! I think it's safe to assume that the people
interesting in working on this are already subscribed to the poky@yocto
list, but we should cross-post to the oe-core list when that goes live
as well.

>> * start merging in OE things
>>  o e.g. OE gcc 4.5, toolchains for avr32, bfin, etc
> 
> Last time I talked to Khem the OE gcc 4.5 toolchain didn't boot under
> Poky's qemu. 

FWIW, it does boot on real hardware:

root@pandaboard-yocto:~# lsb_release -a ; uname -a
Distributor ID: Angstrom
Description:    Angstrom GNU/Linux v20110125 (yoctopus)
Release:        v20110125
Codename:       yoctopus
Linux pandaboard-yocto 2.6.35.3+ #1 SMP PREEMPT Wed Jan 12 12:01:43 CET
2011 armv7l GNU/Linux
root@pandaboard-yocto:~#

That's built with
http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/recipes-devtools/gcc
, which is a copy of yocto gcc with its SRC_URI replaces with the OE one.

> We have since updated the qemu in Poky but I'd like to
> actually figure out what was wrong there. Khem couldn't get qemu in Poky
> to work which is another issue that we need to resolve.
> 
> I am a little worried about lots of platform specific toolchains merging
> straight into the core as those might be better as platform/architecture
> specific layers.

If there are people willing to keep an architecture building and booting
it should live in the core layer. But a might-or-might-not-work layer
where architectures can migrate to and from would be an option. Both
core and might-or-might-not-work layer could live in the oe-core git repo.

>> * switch meta-oe to build on top of oe-core, fix issues
>>
>> When that is done meta-oe can start to expand.
>>
>> The non-technical roadmap/todo:
>>
>> * Assign 2 gatekeepers to oe-core, one from yocto, one from OE
> 
>>From the Yocto side, Saul Wold is the person here.

I'm available for the OE side, maybe Khem is available for that as well
so we can rotate to divide workload on the OE side.

>> * sketch out decision tree (RP -> gatekeepers -> maintainers)
>> * work out model for meta-oe
>> * appoint OE member to yocto SC
>> * work out how to marry yocto goals (4 archs, one toolchain) to OE goals
>> (zillion archs, as much toolchains as we can manage)
> 
> This is related to my comments above. I would like to see a little
> pressure to collaborate on one up to date toolchain which means
> resolving our differences over gcc 4.5 and then handling the
> architecture specific ones.

Exactly. With my armv7a hat on, the yocto one has bugs that are solved
in the OE one, but it could be the reverse for other architectures.
A technical pro of the OE version is that the patches are split up and
labeled, as well as clearly showing the gcc mainline patches(srcrev of
4.5 stable branch) instead 4.5.1 tarball and a handfull of backports.

The other differences like the fedoro DSO patch shouldn't matter, those
can be rediffed against the OE one.

>> * Work out OE roadmap and align with yocto
>>
>> The above tries to restrict itself to dealing with the new oe-core, not
>> with how OE is going to split into layers (meta-oe, meta-graveyard, etc).
>> It also ignores the maintainer aspects since we will be dealing with
>> yocto metadata at the start. After oe-core reaches a ready enough state
>> we can start looking at assigning maintainers, but for the time being
>> let's get things done first.
>>
>> So, let's start fleshing out the above roadmaps and implement them!
> 
> Sounds like a reasonable plan but see my comments at the start.
> 
> The time is right to change around the code in poky to make some of the
> steps easier though and I'm happy to take patches for that now (I'm
> going to start looking at those changes myself too). This would feed
> directly into making the above easier.

I'll wait with patches till I finish testing your tt-bootstrap branch :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNPvLAMkyGM64RGpERAluPAJ9VBck98OCNAxG/CBRGdR0g+S0zQgCfRKh9
vhsefu4AVLE+o/YBeLKRdEk=
=FNnt
-----END PGP SIGNATURE-----



