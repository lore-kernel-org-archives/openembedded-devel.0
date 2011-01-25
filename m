Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1PhklQ-0003TF-MG
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 16:25:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p0PFOEdq000516
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 15:24:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00418-02 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 15:24:10 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p0PFO7Da000509
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 15:24:08 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ihmaqm$eho$1@dough.gmane.org>
References: <4D36F9BE.1010601@xora.org.uk> <4D3DAB2A.3070303@balister.org>
	<AANLkTi=T++s65-mH91BBwT6OBUfzqcGDiq6J-LVk8+SJ@mail.gmail.com>
	<ihmaqm$eho$1@dough.gmane.org>
Date: Tue, 25 Jan 2011 15:23:54 +0000
Message-ID: <1295969034.14388.49867.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Tue, 25 Jan 2011 15:25:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Firstly, just for reference, the TSC is having some discussions between
its members and I'd expect some kind of result from that to be made
public soon.

I think its fine to talk about this and form a plan but I would like to
see some representation from the board and TSC over this to make it
"official".

On Tue, 2011-01-25 at 12:05 +0100, Koen Kooi wrote:
> Ignoring the timeline a bit, since ideally we would do this around a
> yocto milestone to get them to use this straight after their freeze.
> 
> The technical roadmap/todo:
> 
> * setup openembedded-core repo on oe.org
> * setup oe-core ml on oe.org
> * add oe-core ml to patchwork

For these I'd like to confirm that we have sysadmins who are happy that
there is capability there for these things and that they have time to
work on them.

I'm also thinking Yocto would want to mirror oe-core on
git.yoctoproject.org.

> * import yocto-core in oe-core
> * start an integration branch
>  o remove bitbake
>  o cleanup namespace (s/yocto/OE/, s/poky/OE/)
>  o split out superfluous layers (e.g. ememlow)

For this I'd like to time it so the changes are in sync with what Yocto
is doing. I'm tempted to suggest we preempt this a little and start
rearranging Poky now with this in mind?

> * start merging in OE things
>  o e.g. OE gcc 4.5, toolchains for avr32, bfin, etc

Last time I talked to Khem the OE gcc 4.5 toolchain didn't boot under
Poky's qemu. We have since updated the qemu in Poky but I'd like to
actually figure out what was wrong there. Khem couldn't get qemu in Poky
to work which is another issue that we need to resolve.

I am a little worried about lots of platform specific toolchains merging
straight into the core as those might be better as platform/architecture
specific layers.

> * switch meta-oe to build on top of oe-core, fix issues
> 
> When that is done meta-oe can start to expand.
> 
> The non-technical roadmap/todo:
> 
> * Assign 2 gatekeepers to oe-core, one from yocto, one from OE

From the Yocto side, Saul Wold is the person here.

> * sketch out decision tree (RP -> gatekeepers -> maintainers)
> * work out model for meta-oe
> * appoint OE member to yocto SC
> * work out how to marry yocto goals (4 archs, one toolchain) to OE goals
> (zillion archs, as much toolchains as we can manage)

This is related to my comments above. I would like to see a little
pressure to collaborate on one up to date toolchain which means
resolving our differences over gcc 4.5 and then handling the
architecture specific ones.

> * Work out OE roadmap and align with yocto
> 
> The above tries to restrict itself to dealing with the new oe-core, not
> with how OE is going to split into layers (meta-oe, meta-graveyard, etc).
> It also ignores the maintainer aspects since we will be dealing with
> yocto metadata at the start. After oe-core reaches a ready enough state
> we can start looking at assigning maintainers, but for the time being
> let's get things done first.
> 
> So, let's start fleshing out the above roadmaps and implement them!

Sounds like a reasonable plan but see my comments at the start.

The time is right to change around the code in poky to make some of the
steps easier though and I'm happy to take patches for that now (I'm
going to start looking at those changes myself too). This would feed
directly into making the above easier.

Cheers,

Richard



