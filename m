Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OI2CH-0000Pz-Kg
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 May 2010 18:14:10 +0200
Received: from gandalf.denix.org ([unknown] [71.255.238.44])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L3500IID0W6W4Z0@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	28 May 2010 11:09:48 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 761B314AF60; Fri,
	28 May 2010 12:09:42 -0400 (EDT)
Date: Fri, 28 May 2010 12:09:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100528160942.GM23464@denix.org>
References: <20100211094524.GB17089@denix.org> <4BEADBF1.20202@eukrea.com>
MIME-version: 1.0
In-reply-to: <4BEADBF1.20202@eukrea.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Race condition in packaged staging?
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
X-List-Received-Date: Fri, 28 May 2010 16:14:11 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, May 12, 2010 at 06:48:49PM +0200, Eric B?nard wrote:
> Hi,
>
> Le 11/02/2010 10:45, Denys Dmytriyenko a ?crit :
>> I've been seeing some strange breaks in my builds from time to time since 
>> the
>> introduction of new style staging. It doesn't happen often, but when it 
>> does,
>> I usually see a message from "tar" complaining about the archive being 
>> changed
>> on the fly, which comes from the kernel during it's do_package_stage task,
>> staging_packager function. The simplest workaround was to disable parallel
>> build and parallel bitbake execution (PARALLEL_MAKE and 
>> BB_NUMBER_THREADS).
>> I usually never had time to investigate further.
>>
>> Today I received a slightly different message, which gave me some pointers
>> towards a possible race condition in packaged staging, when multiple 
>> bitbake
>> threads are trying to execute relative tasks and have a conflict:
>>
>> ERROR: log data follows 
>> (/OE/arago-tmp/work/omap3evm-none-linux-gnueabi/ti-dmai-1_1.0+svnr423-r51e/temp/log.staging_packager.13580)
>> | mkdir: cannot create directory 
>> `/OE/arago-deploy/pstage/angstromglibc/IPKG_BUILD.13587': File exists
>> NOTE: Task failed: 
>> /OE/arago-tmp/work/omap3evm-none-linux-gnueabi/ti-dmai-1_1.0+svnr423-r51e/temp/log.staging_packager.13580
>>
>> Hopefully this helps somebody more familiar with the subject (don't want 
>> to
>> bother RP, but it's his creation :)) easily identify the culprit and fix 
>> it,
>> either by adding a lock or something similar... :) I hate to not use the 
>> full
>> power of my 4 cores and run everything in one thread. Thanks.
>>
> I had a problem which seems to be very close to this problem :
> while buidling a project from scratch, it failed at linux's 
> staging_packager with the following log :
>
> find: invalid expression; I was expecting to find a ')' somewhere but did 
> not see one.
> tar: .: file changed as we read it

Yeah, it was also common for me, as I mentioned here:

>> I usually see a message from "tar" complaining about the archive being 
>> changed
>> on the fly, which comes from the kernel during it's do_package_stage task,
>> staging_packager function. The simplest workaround was to disable parallel

> Simply relaunching bitbake was enough to finish the build.
>
> In this case I had
> BB_NUMBER_THREADS=2
> PARALLEL_MAKE = "-j 2"
>
> (I also had the same thing with 8 BB threads and - j 8 on an other build 
> machine).

Do you still see the issue after the patch from Enrico Scholz[1][2] applied?

[1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/32860
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=311bed0b40aaa6298029f727d97f50c1d740a3fa

I'm still testing, as I haven't been able to run any large builds from scratch 
yet... Please let me know your results. Thanks.

-- 
Denys


