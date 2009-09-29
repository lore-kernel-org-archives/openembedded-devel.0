Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MshAJ-0006V5-GN
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 20:11:10 +0200
Received: from gandalf.denix.org ([71.127.57.136]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQQ008VBVSRGYBI@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	29 Sep 2009 13:10:08 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C6F1714AF60; Tue,
	29 Sep 2009 14:10:02 -0400 (EDT)
Date: Tue, 29 Sep 2009 14:10:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090929181002.GA12138@denix.org>
References: <200909281752.11487.anarsoul@gmail.com>
	<1254215340.12689.643.camel@mill.internal.reciva.com>
MIME-version: 1.0
In-reply-to: <1254215340.12689.643.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: udev problems on angstrom-2008.1
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
X-List-Received-Date: Tue, 29 Sep 2009 18:11:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 29, 2009 at 10:09:00AM +0100, Phil Blundell wrote:
> On Mon, 2009-09-28 at 17:52 +0300, Vasily Khoruzhick wrote:
> > udevd-event[1918]: mknod(/dev/vcS, 020660, (7,0) failed: No space left on 
> > device
> 
> You probably need to increase the inode allocation for tmpfs.  See the
> mount(8) manpage where it talks about the nr_inodes option.

From the tmpfs documentation it kind of implies inodes take half the RAM 
pages:

nr_inodes: The maximum number of inodes for this instance. The default
           is half of the number of your physical RAM pages, or (on a
           machine with highmem) the number of lowmem RAM pages,
           whichever is the lower.

Now while reading it again, I think I may have misread it previously...
Looks like half the RAM pages is used as a default number of inodes, but 
inodes don't consume that much. It's good to know udev is not a pig... :)

-- 
Denys


