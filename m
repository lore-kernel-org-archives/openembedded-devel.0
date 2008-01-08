Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JCHkL-0007D4-Hp
	for openembedded-devel@openembedded.org; Tue, 08 Jan 2008 17:56:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m08Gn9Mv009340;
	Tue, 8 Jan 2008 16:49:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09064-06; Tue,  8 Jan 2008 16:49:04 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m08Gn2iW009327
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 8 Jan 2008 16:49:02 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1133928457.20080108163429@gmail.com>
References: <1824361960.20080106235611@gmail.com>
	<47825896.7030301@kernelconcepts.de>
	<1133928457.20080108163429@gmail.com>
Date: Tue, 08 Jan 2008 16:49:01 +0000
Message-Id: <1199810941.6053.50.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Smallscreen mod for GtkFileChooser
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2008 16:56:13 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-01-08 at 16:34 +0200, Paul Sokolovsky wrote:
>   As Ross Burton of OpenedHand commented in my blog, they make steps
> to upstream their changes, but of course that doesn't go smooth, it
> takes time, refactors, waiting for new versions, etc. So, I'd prefer
> to leave that to big guys, knowing that they care to make the future
> bright. With my little-guy-who-scratches-his-and-fellow-users'-itches
> hat on, I care about present being bright too, and sustainability of
> the whole Linux-on-PDA effort. So, here's small patch optimized for a
> given criteria (size), and I can maintain it in OE for now, even if
> eventually it will be replaced by something else. In the meantime, I
> have lotsa other patches ready, or in work, and working on them and
> their upstreaming would be more beneficial imho.

It is something OpenedHand is working on and will continue to work on,
not least because maintaining a patch like that is painful. I can near
enough guarantee we will end up porting it to new gtk versions, I just
can't guarantee how quickly we'll do that.

>   (Oh, and if someone has free big-guy-from-the-industry's hat, please
> let me know ;-) ).
> 
> >> . I'm glad I've written it in high detail, because Koen quickly
> >> pointed me to similar patches in Poky:
> >> 
> >> http://svn.o-hand.com/view/poky?rev=3408&view=rev
> >> http://svn.o-hand.com/view/poky?rev=2596&view=rev
> >> 
> >>   I didn't try them, but they appear to make more invasive changes to
> >> gtk+, though apparently add more features (for good, bad, or for
> >> vendor's requirements).
> 
> > Do we have a screenshot around to see how it looks? :)
> 
>   I still didn't try it due to the above. I'd like first a confirmation
> from Poky people that merging those patches to OE will be of benefit
> to them (for example, wider testing). Then we can review the
> functionality. I do worry a bit about QVGA support, as all latest OH
> workings seems to be not optimized for it (Sato, Pimlico).

We're happy enough for wider testing. I can also confirm that patch
works well for QVGA. I'm not sure about screenshots but qemu poky images
are available from http://pokylinux.org/autobuild/poky/ and have a
screenshot utility! I would make one but I don't have a suitable image
handy :(.

Cheers,

Richard




