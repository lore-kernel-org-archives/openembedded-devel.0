Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MsSzW-0004Ee-DC
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 05:03:05 +0200
Received: from gandalf.denix.org ([71.127.57.136]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQP0019YPR4OTZ3@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	28 Sep 2009 22:01:58 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B4F4814AF60; Mon,
	28 Sep 2009 23:01:52 -0400 (EDT)
Date: Mon, 28 Sep 2009 23:01:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090929030152.GA7383@denix.org>
References: <200909281752.11487.anarsoul@gmail.com>
MIME-version: 1.0
In-reply-to: <200909281752.11487.anarsoul@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
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
X-List-Received-Date: Tue, 29 Sep 2009 03:03:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Sep 28, 2009 at 05:52:05PM +0300, Vasily Khoruzhick wrote:
> Hi, I'm experiencing problems with image for rx1950 PDA (s3c2442-based PDA 
> with 32M of RAM) built by openembedded.
> For some reason, udev doesn't work, and complains about lack of free space on 
> /dev (which is tmpfs) like this:
> 
> udevd-event[1918]: mknod(/dev/vcS, 020660, (7,0) failed: No space left on 
> device.

Been there, done that.
Short answer - you have too many requested devnodes for udev to handle within 
32MB of RAM. If you absolutely need all the devices enabled in the kernel 
(try disabling/reducing LEGACY_PTY), consider replacing udev with mdev (or 
static devnodes). Or try moving udev's database from tmpfs into another 
partition, maybe on flash.

Long answer - udev besides creating the actual devnodes also keeps its 
database in the same tmpfs filesystem. It consists of an internal directory 
structure with symlinks (a la sysfs) and is stored in /dev/.udev
Keeping all that in tmpfs is not efficient, as it wastes inodes and apparently 
inodes in tmpfs/ramfs are the size of a memory page (4KB). By default tmpfs is 
limited to half the RAM, which in your case is 16MB. That would allow roughly 
4000 inodes. You definitely need more, because of the above messages. Even if 
you fit all of them, using half of your available RAM just for udev is a total 
waste. So, consider suggestions above.

-- 
Denys


