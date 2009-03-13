Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Li9va-0006To-5W
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 17:08:06 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGG00MUYCSLIK52@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	13 Mar 2009 11:07:34 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EBB726B83B5; Fri,
	13 Mar 2009 12:07:32 -0400 (EDT)
Date: Fri, 13 Mar 2009 12:07:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090313160732.GA26615@denix.org>
References: <20090313145610.GA26373@denix.org>
	<018101c9a3f0$7f5b2cd0$5e3018ac@Glamdring>
MIME-version: 1.0
In-reply-to: <018101c9a3f0$7f5b2cd0$5e3018ac@Glamdring>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Fri, 13 Mar 2009 16:08:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 13, 2009 at 04:27:08PM +0100, Ulf Samuelsson wrote:
>>>> On the dual dual-core (4 total) boxes I have, I do -j6/4 threads.  On my
>>>> new quad-core box I haven't yet had a chance to figure out what's best.
>>>> I also use -j6/4 threads on an older dual-core amd64 box we've got
>>>> around and that seems best for my tasks at least (I tried a few
>>>> combinations of more jobs/threads and less and both were slower).
>>>>
>>>
>>> I looked at a few recipies which by a stanrge coincidence had
>>> PARALLEL_MAKE="",
>>
>> That's not a strange coincidence, that means a specific package has issues
>> building in parallel - usually some dependencies go out of order.
>>
>
> The strange coincidence was that *ALL*  the packages I *looked* at
> had PARALLEL_MAKE="".
> I made the erroneous assumption that most packages were this way.

Ah, I see. I'm not sure what is the percentage of "broken" packages...

>>> When, I rechecked, I had
>>> PARALLEL_MAKE ="-j 16"
>>> as well and this should be
>>> PARALLEL_MAKE ="-j16"
>>
>> Having only 4 cores and setting number of parallel makes to 16 kills your
>> performance, as system spends more time switching contexts instead of 
>> actually
>> doing something useful - i.e. compiling.
>
> The Core i7 has 4 cores and each core has two virtual CPUs so the system 
> sees 8 CPUs.
> I saw some commone from someone claiming that if
> you have n CPUs, then Buildroot should use make -j`2*n`.
>
> I thought about this, and came up with the following explanation.
> If you have one job per CPU, then  whenever you have to wait for the 
> harddisk, you stall this CPU.
> If you have several jobs per CPU, then you can gain some time
> by running the second job while the first job was waiting for the hard 
> disk.
>
> Whether this works in practice, I cannot say, but it would be interesting
> to have some real proof.

First of all, I believe -j`2*n` is very agressive. I've seen other suggestions 
of using -j`n+1` or -j`n+2`.
Second, your Core i7 still has 4 real cores. Even though HyperThreading 
presents each core as 2 virtual ones, those are not real 8 cores. And 
according to [1], sometimes using HyperThreading may degrade the overall 
performance...

So, you should experiment with your settings and find a sweet spot, which 
maybe somewhere between 4 and 16 threads :)

[1] http://en.wikipedia.org/wiki/Hyper-threading

-- 
Denys


