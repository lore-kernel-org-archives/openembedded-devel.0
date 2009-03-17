Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LjfZf-0008O6-7G
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 21:07:46 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGO00JNC2JILWC0@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	17 Mar 2009 15:06:55 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D18156B83A8; Tue,
	17 Mar 2009 16:06:53 -0400 (EDT)
Date: Tue, 17 Mar 2009 16:06:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090317200653.GD15734@denix.org>
References: <000001c9a60e$28fd4650$753018ac@GLAMDRING>
	<9B414415A7024345895304717D1B3CCF@aeglos>
MIME-version: 1.0
In-reply-to: <9B414415A7024345895304717D1B3CCF@aeglos>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=AWL,BAYES_05,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 17 Mar 2009 20:07:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 17, 2009 at 05:28:27PM +0100, Ulf Samuelsson wrote:
>> Yes, I know,
>> Maybe it is a good idea if the result of a build is published somewhere,
>> so that others do not have to go through this process.
>>
>> Right now, openembedded does not even build for me,
>> since the native perl build fails :-(
>>
>>> [1] http://en.wikipedia.org/wiki/Hyper-threading
>
> I now managed to build the Angstrom image for the AT91SAM9263 by applying
> a few fixes present in the ulf/linux branch.
> (Did not load on H/W yet though)
>
> perl-native was "fixed" by not building the library which crashed.
> libtheora was fixd, not to use docs/examples.
> busybox updated to 1.13.3

Any specific changes between 1.13.2 and 1.13.3 you need? Would be nice to 
cherry-pick into .dev branch...

> u-boot, gpsd was set to PARALLEL_MAKE = ""
> u-boot updated to 2009.01
> linux-2.6.28
> at91bootstrap-2.10
>
> Building with PARALLEL_MAKE & Multiple threads was not smooth.
> The build crashed several times, due to erros
> caused by parallellism. "gettext", "gpsd" and "u-boot" were culprits.

Would be nice to fix those. Tom Rini was working on fixing some of those 
issues.

> u-boot is NOT built cleanly, even after PARALLEL_MAKE was set to "".
> The actual compile completes and generates an u-boot.bin
> but this is not deployed to the result directory.
> There are logs for different stages, but after the compile, they exist, but 
> are empty.
>
> If I remove all the stamps and "bitbake -b <u-boot>" afterwards
> then the build completes correctly, and there is an 
> u-boot-at91sam9263ek.bin
> in the result directory.
>
> Can it be so, that a stage is started, before the previous stage has been 
> completed???

If there are no dependencies between packages, their stage tasks can run in 
parallel.

> ---------------------
> BTW: The total buildtime was around 2 hours. There is some overhead
> since the build was restarted 3-4 times, and local.conf was changed once.
> I started the build with PARALLEL_MAKE = "-j2" and BB_NUMBER_THREADS=8.
>
> I noticed that having a lot of threads helps most of the time,
> since the CPUs were executing at max frequency.
>
> When the cross compiler, was built,it was different,
> most of the cores were not used with this configuration.
> 2-3 max while compiling gcc.

Since gcc/cross is quite a big package and lots of other packages depend on 
it, it is being built for you only using 2 cores, as specified by 
PARALLEL_MAKE. Everything else is waiting for it to finish.

> Maybe the best approach is to build the Angstrom in several stages
> with different settings for parallelism.

-- 
Denys


