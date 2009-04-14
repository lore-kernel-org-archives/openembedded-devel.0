Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LtsOA-0001TA-9T
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 01:50:05 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI4006M07CYNVAQ@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	14 Apr 2009 18:46:10 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D7F176B83B5; Tue,
	14 Apr 2009 19:46:09 -0400 (EDT)
Date: Tue, 14 Apr 2009 19:46:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090414234609.GA27890@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=AWL,BAYES_50,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Invalidating udev cache...
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
X-List-Received-Date: Tue, 14 Apr 2009 23:50:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 03, 2009 at 08:16:48AM -0700, Tom Rini wrote:
> On Tue, Mar 03, 2009 at 08:24:44AM +0100, Koen Kooi wrote:
> > On 03-03-09 06:11, Denys Dmytriyenko wrote:
> >> On Thu, Dec 04, 2008 at 06:41:50PM +0100, Koen Kooi wrote:
> >>> On 04-12-08 18:09, Mike (mwester) wrote:
> >>>> Mike (mwester) wrote:
> >>>>
> >>>>> A slight improvement would be to make the dev.tar file dependent upon
> >>>>> the bootargs; i.e. invalidate /etc/dev.tar file if the boot command line
> >>>>> doesn't match the current command line.  This could be a very fast
> >>>>> operation, just "cmp /proc/cmdline /etc/dev_cmdline" or similar.
> >>>> As I consider this further, we could actually just save and compare
> >>>> /proc/atags if that's present on the device in question (falling back to
> >>>> /proc/cmdline if not present).  That would catch *any* changes passed in
> >>>> to the kernel via the bootloader.
> >>>>
> >>>> Flashing a new kernel would seem to be another logical place to
> >>>> invalidate the cache, so adding a comparison of "uname -rv" would be a
> >>>> reasonable way to catch that.
> >>> That should indeed take care of bootargs and kernel version changes. I'm
> >>> still tempted to add option 2) to all that :)
> >>
> >> Sorry for bringing up this old discussion. Are there any plans to implement
> >> the above checks in udev?
> >
> > Plans yes, time no :(
> 
> Can we make sure they're optional?

I'd like to revive this old topic and propose a patch, which implements most 
of the above points. I'm not sure about making it optional and /proc/atags. 
So, anyway, the patch will follow, please provide comments.

-- 
Denys


