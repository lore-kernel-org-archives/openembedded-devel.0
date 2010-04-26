Received: from server.road.de ([85.10.209.111] helo=mail.road.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <j.erdmann@road.de>) id 1O6KBV-0000k3-Le
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 11:00:59 +0200
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id 2D1BC390003
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 10:57:15 +0200 (CEST)
Received: from [192.168.116.53] (bienemaja.handy-pc.constin.de
	[192.168.116.53])
	by slimfast.dyndns.org (Postfix) with ESMTP id A512E4542B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 10:57:14 +0200 (CEST)
Message-ID: <4BD5556A.9080909@road.de>
Date: Mon, 26 Apr 2010 10:57:14 +0200
From: Jens Erdmann <j.erdmann@road.de>
Organization: Road GmbH
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100411 Icedove/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BD170BC.8020103@road.de> <20100423155515.GA27322@denix.org>
	<20100424165610.GA10320@denix.org>
In-Reply-To: <20100424165610.GA10320@denix.org>
X-SA-Exim-Connect-IP: 85.10.209.111
X-SA-Exim-Mail-From: j.erdmann@road.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Patch] locking in do_package_tar
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
X-List-Received-Date: Mon, 26 Apr 2010 09:00:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/24/2010 06:56 PM, Denys Dmytriyenko wrote:
> On Fri, Apr 23, 2010 at 11:55:15AM -0400, Denys Dmytriyenko wrote:
>> On Fri, Apr 23, 2010 at 12:04:44PM +0200, Jens Erdmann wrote:
>>> Hey folks,
>>>
>>> I would like to introduce locking in do_package_tar. I had a case here were
>>> do_package_tar and do_package_ipk where running parallel. Because of this
>>> "tar: .: file changed as we read it" occurs. I fixed it by introduce
>>> locking in do_package_tar. What do you think about it?
>>
>> Ah, I've been suffering from this problem for quite some time now, when making
>> parallel builds with BB_NUMBER_THREADS. I was trying to debug it and noticed
>> it would fail when kernel recipe would try to do_deploy at the same time
>> another package would try to do_package_stage, so I was digging in the
>> packaged staging direction. Tom Rini even made a patch to add an extra lock in
>> there, which didn't help with my issue...
>> So, let me try your patch and see if this problem is gone for good! Thanks.
>
> It may solve some other similar issue, but unfortunately, it didn't seem to
> work for me, as it failed again the same way with the patch applied:
>
> NOTE: Running task 2011 of 2173 (ID: 953, /OE/arago-oe-dev/recipes/freetype/freetype_2.3.9.bb, do_package_stage)
> /OE/arago-tmp/work/armv7a-none-linux-gnueabi/freetype-2.3.9-r1/staging-pkg/deploy/ipk/armv7a/
> /OE/arago-tmp/work/armv7a-none-linux-gnueabi/freetype-2.3.9-r1/staging-pkg/deploy/ipk/armv7a/
> /OE/arago-tmp/work/armv7a-none-linux-gnueabi/freetype-2.3.9-r1/staging-pkg/deploy/ipk/armv7a/
> /OE/arago-tmp/work/armv7a-none-linux-gnueabi/freetype-2.3.9-r1/staging-pkg/deploy/ipk/armv7a/
> ERROR: function staging_packager failed
> ERROR: log data follows (/OE/arago-tmp/work/dm3730-am3715-evm-none-linux-gnueabi/linux-omap-psp-2.6.32-r60+gitr7b8926aa626991fa087b00f6bbc1fb6b0e8269b0/temp/log.staging_packager.19650)
> | tar: .: file changed as we read it
> NOTE: Task failed: /OE/arago-tmp/work/dm3730-am3715-evm-none-linux-gnueabi/linux-omap-psp-2.6.32-r60+gitr7b8926aa626991fa087b00f6bbc1fb6b0e8269b0/temp/log.staging_packager.19650
> NOTE: oestats: task failed, see http://tinderbox.openembedded.net/packages/556734/
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /OE/arago-oe-dev/recipes/linux/linux-omap-psp_2.6.32.bb do_package_stage failed
> ERROR: Task 1009 (/OE/arago-oe-dev/recipes/linux/linux-omap-psp_2.6.32.bb, do_package_stage) failed
> NOTE: Waiting for 3 active tasks to finish
> NOTE: 1: /OE/arago-oe-dev/recipes/freetype/freetype_2.3.9.bb, do_package_stage (21747)
>
> So, it looks like my problem is actually still packaged staging related, as is
> fails when 2 recipes run do_package_stage task at the same time (in the
> example above, it's freetype and linux-omap-psp)...
>

This looks more packaged-staging.bbclass related. Maybe you could try to 
make the lock in line 444 two lines earlier so that staging_packager and 
staging_helper will be locked. too.

To my patch: Is locking in tar a good idea?


-- 
------- ROAD ...the handyPC Company - - -  ) ) )

Jens Erdmann
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing director: Hans-Peter Constien



