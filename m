Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O5iiI-0001kY-Af
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Apr 2010 19:00:19 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1E005984DM8Q03@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	24 Apr 2010 11:56:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5576914AF60; Sat,
	24 Apr 2010 12:56:10 -0400 (EDT)
Date: Sat, 24 Apr 2010 12:56:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100424165610.GA10320@denix.org>
References: <4BD170BC.8020103@road.de> <20100423155515.GA27322@denix.org>
MIME-version: 1.0
In-reply-to: <20100423155515.GA27322@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Sat, 24 Apr 2010 17:00:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 23, 2010 at 11:55:15AM -0400, Denys Dmytriyenko wrote:
> On Fri, Apr 23, 2010 at 12:04:44PM +0200, Jens Erdmann wrote:
> > Hey folks,
> >
> > I would like to introduce locking in do_package_tar. I had a case here were 
> > do_package_tar and do_package_ipk where running parallel. Because of this 
> > "tar: .: file changed as we read it" occurs. I fixed it by introduce 
> > locking in do_package_tar. What do you think about it?
> 
> Ah, I've been suffering from this problem for quite some time now, when making 
> parallel builds with BB_NUMBER_THREADS. I was trying to debug it and noticed 
> it would fail when kernel recipe would try to do_deploy at the same time 
> another package would try to do_package_stage, so I was digging in the 
> packaged staging direction. Tom Rini even made a patch to add an extra lock in 
> there, which didn't help with my issue...
> So, let me try your patch and see if this problem is gone for good! Thanks.

It may solve some other similar issue, but unfortunately, it didn't seem to 
work for me, as it failed again the same way with the patch applied:

NOTE: Running task 2011 of 2173 (ID: 953, /OE/arago-oe-dev/recipes/freetype/freetype_2.3.9.bb, do_package_stage)
/OE/arago-tmp/work/armv7a-none-linux-gnueabi/freetype-2.3.9-r1/staging-pkg/deploy/ipk/armv7a/
/OE/arago-tmp/work/armv7a-none-linux-gnueabi/freetype-2.3.9-r1/staging-pkg/deploy/ipk/armv7a/
/OE/arago-tmp/work/armv7a-none-linux-gnueabi/freetype-2.3.9-r1/staging-pkg/deploy/ipk/armv7a/
/OE/arago-tmp/work/armv7a-none-linux-gnueabi/freetype-2.3.9-r1/staging-pkg/deploy/ipk/armv7a/
ERROR: function staging_packager failed
ERROR: log data follows (/OE/arago-tmp/work/dm3730-am3715-evm-none-linux-gnueabi/linux-omap-psp-2.6.32-r60+gitr7b8926aa626991fa087b00f6bbc1fb6b0e8269b0/temp/log.staging_packager.19650)
| tar: .: file changed as we read it
NOTE: Task failed: /OE/arago-tmp/work/dm3730-am3715-evm-none-linux-gnueabi/linux-omap-psp-2.6.32-r60+gitr7b8926aa626991fa087b00f6bbc1fb6b0e8269b0/temp/log.staging_packager.19650
NOTE: oestats: task failed, see http://tinderbox.openembedded.net/packages/556734/
ERROR: TaskFailed event exception, aborting
ERROR: Build of /OE/arago-oe-dev/recipes/linux/linux-omap-psp_2.6.32.bb do_package_stage failed
ERROR: Task 1009 (/OE/arago-oe-dev/recipes/linux/linux-omap-psp_2.6.32.bb, do_package_stage) failed
NOTE: Waiting for 3 active tasks to finish
NOTE: 1: /OE/arago-oe-dev/recipes/freetype/freetype_2.3.9.bb, do_package_stage (21747)

So, it looks like my problem is actually still packaged staging related, as is 
fails when 2 recipes run do_package_stage task at the same time (in the 
example above, it's freetype and linux-omap-psp)...

-- 
Denys


