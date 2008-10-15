Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Kq4gR-0007IU-BC
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 13:36:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9FBVlnq017865
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 12:31:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17634-08 for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 12:31:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9FBVeOb017843
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 12:31:40 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <gd4j24$lq3$1@ger.gmane.org>
References: <200810151022.38477.zecke@selfish.org>
	<c384c5ea0810150343i1ad5429aubf37b9bdef2165a6@mail.gmail.com>
	<gd4j24$lq3$1@ger.gmane.org>
Date: Wed, 15 Oct 2008 12:31:39 +0100
Message-Id: <1224070299.5189.62.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Wed, 15 Oct 2008 11:36:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-10-15 at 13:09 +0200, Koen Kooi wrote:
> On 15-10-2008 12:43, Leon Woestenberg wrote:
> > On Wed, Oct 15, 2008 at 10:22 AM, Holger Freyther<zecke@selfish.org>  wrote:
> >> Hey guys,
> >>
> >> I would start linking everything with -Wl,--hash-style=both as this is said to
> >> speed up the loading of shared libraries by about 50% (google is your
> >>
> > If we care about dynamic link speed we should maybe revisit the rpath issue.
> >
> > I remember seeing strace's where on each .so, 10 attempts were made
> > before the right location was attempted.
> >
> > Actually, it is still on my to do:
> >
> > http://bugs.openembedded.net/show_bug.cgi?id=2140
> 
> Doesn't insane.bbclass log bad rpaths? Or are you talking about spurious 
> rpaths that don't point to staging or workdir?
> AIUI libtool 2.x should solve a lot of these.

I think what Leon is referring to is where different hardware
capabilities are checked. In Poky I ended up disabling this as at least
on ARM there were an insane number of different combinations of paths
being checked for. The patch I added to disable it was:

http://svn.o-hand.com/view/poky/trunk/meta/packages/glibc/files/no-hwcaps.patch?rev=5087&view=markup

I've not seen bad RPATH values for quite a while now.

Cheers,

Richard



