Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Li8qo-0007OT-28
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 15:59:15 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGG000NZ9HMDLS5@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	13 Mar 2009 09:56:16 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7DDB06B83B5; Fri,
	13 Mar 2009 10:56:10 -0400 (EDT)
Date: Fri, 13 Mar 2009 10:56:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090313145610.GA26373@denix.org>
References: <20090313060546.GF26343@smtp.west.cox.net>
	<013b01c9a3e7$1b44b3f0$5e3018ac@Glamdring>
MIME-version: 1.0
In-reply-to: <013b01c9a3e7$1b44b3f0$5e3018ac@Glamdring>
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
X-List-Received-Date: Fri, 13 Mar 2009 14:59:15 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 13, 2009 at 03:19:37PM +0100, Ulf Samuelsson wrote:
>
>> On Thu, Mar 12, 2009 at 11:49:30PM -0400, Denys Dmytriyenko wrote:
>>> On Thu, Mar 12, 2009 at 06:38:54PM -0700, Khem Raj wrote:
>>> > On Thursday 12 March 2009 16:32:16 Ulf Samuelsson wrote:
>>> > > Is there any activity to make this more useful?
>>> > > Just managed to install a Core i7 machine, which speeded
>>> > > up my Buildroot build from about 4 hours to less than 1 hour.
>>> > > (There was an error in the build right at the end,
>>> > > so it could have been downto 40 minutes or so)
>>> > > Building the cross compiler took 10 minutes with "make -j 16"
>>> > > compared to 1-2 hours on a P4 @ 3GHz.
>>> > >
>>> > > Openembedded does not seem to use PARALLEL_MAKE extensively.
>>> > > I have the frequency meter activated for all 8 CPUs in the Core i7,
>>> > > and most of the time the CPUs seems to idle at 1.6 GHz,
>>> > > with one CPU (or rarely 2) are running at the full 2.67 GHz.
>>> > >
>>> > > Last time I built OE on a P4@ 3 GHz it took ~40 hours
>>> > > for the SAM9263, so some speedup would be nice.
>>> > > Maybe we should make an effort?
>>> >
>>> > I use
>>> >
>>> > PARALLEL_MAKE = "-j4"
>>> > BB_NUMBER_THREADS = "2"
>>> >
>>> > in my local.conf. I see my core 2 duo machine spawning parallel tasks.
>>>
>>> I'm setting 4/4 to the above two variables on my Quad Core and it loads 
>>> all 4
>>> cores at 100% almost all the time. Sometimes it slows down due to the
>>> bottleneck in the harddrive access...
>>
>> On the dual dual-core (4 total) boxes I have, I do -j6/4 threads.  On my
>> new quad-core box I haven't yet had a chance to figure out what's best.
>> I also use -j6/4 threads on an older dual-core amd64 box we've got
>> around and that seems best for my tasks at least (I tried a few
>> combinations of more jobs/threads and less and both were slower).
>>
>
> I looked at a few recipies which by a stanrge coincidence had 
> PARALLEL_MAKE="",

That's not a strange coincidence, that means a specific package has issues 
building in parallel - usually some dependencies go out of order.

> When, I rechecked, I had
> PARALLEL_MAKE ="-j 16"
> as well and this should be
> PARALLEL_MAKE ="-j16"

Having only 4 cores and setting number of parallel makes to 16 kills your 
performance, as system spends more time switching contexts instead of actually 
doing something useful - i.e. compiling.

> Changed to
> PARALLEL_MAKE ="-j8"
> BB_NUMBER_THREADS = "2"
>
> I see some more cores beeing used.
> The initial setup after you changed local.conf seems to run on a single 
> core though.

After you change your configuration, bitbake rebuilds the cache - that is a 
single threaded operation, hence uses only one core.

-- 
Denys


