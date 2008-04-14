Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1JlVjn-0001xe-2k
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Apr 2008 22:57:15 +0200
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx01.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JlVji-0006i4-H9
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Apr 2008 15:57:10 -0500
Message-ID: <4803C4A8.2090000@dls.net>
Date: Mon, 14 Apr 2008 15:55:04 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1JlVDo-0001Q4-Vo@daffy.sipo.nl>
In-Reply-To: <E1JlVDo-0001Q4-Vo@daffy.sipo.nl>
Subject: Re: union fs
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
X-List-Received-Date: Mon, 14 Apr 2008 20:57:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

RvP wrote:
> From: "Mike (mwester)" <mwester@dls.net>
>> RvP wrote:
>>> Hi,
>>>
>>> Support for unionfs-modules with recent kernels is broken in oe, see
>>> http://bugs.openembedded.org/show_bug.cgi?id=1189.
>>>
>>> Are there plans to fix this?
>> The unionfs modules are part of the 2.6 kernel now. 
> 
> Are they? I read on the unionfs site that they are part of the -mm tree as of
> Jan. 2007, but, you're probably right. OpenWRT does use unionfs per default
> with a 2.6.24 kernel.

No, you're right - I looked more closely, it's still not made it into 
the 2.6.24 kernel.

>> Do you really need them?
> 
> Not anymore, I was looking for a way to install extra pakages for SlugOS on
> an external drive. I found in the docs that a copy of the complete rootfs can
> be installed on an external drive using 'turnup' (NSLU2 specific tool). I'll
> go that way.
> 
> Thanks,
> 
> Richard.

Cool.  Turnup is the right way to do it with SlugOS.  But I do still 
plan to get unionfs into the SlugOS feeds at some point.  It does look 
like at the moment that means fixing that recipe somehow; something that 
won't be simple (since the patch downloaded depends on the kernel 
version the recipe is being built for).

Thanks,
Mike (mwester)


