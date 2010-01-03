Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NREkh-00013E-1J
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jan 2010 01:55:30 +0100
Received: from gandalf.denix.org ([71.255.235.232]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KVN00L6MBSLJ2L4@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	02 Jan 2010 18:53:14 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 24A3014AF60; Sat,
	02 Jan 2010 19:53:09 -0500 (EST)
Date: Sat, 02 Jan 2010 19:53:09 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100103005309.GA29588@denix.org>
References: <1262452243-8187-1-git-send-email-Martin.Jansa@gmail.com>
	<1262455806.2553.90.camel@lenovo.internal.reciva.com>
MIME-version: 1.0
In-reply-to: <1262455806.2553.90.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] sanity.bbclass: Reading	/proc/sys/vm/mmap_min_addr is not permitted with 2.6.33+ on host
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
X-List-Received-Date: Sun, 03 Jan 2010 00:55:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Jan 02, 2010 at 06:10:05PM +0000, Phil Blundell wrote:
> On Sat, 2010-01-02 at 18:10 +0100, Martin Jansa wrote:
> > * With 2.6.33-rc2-00252-ge9e5521 on my host I noticed that
> >   "cat /proc/sys/vm/mmap_min_addr" returns now
> >   "cat: /proc/sys/vm/mmap_min_addr: Operation not permitted"
> >   Its probably becuse of
> >   http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=0e1a6ef2dea88101b056b6d9984f3325c5efced3
> >   But I'm not sure if checking CAP_SYS_RAWIO even for reading this value
> >   is intentional or just bug which should be fixed in kernel.
> > 
> > * This patch prints notice about need to check that value yourself (as
> >   root) instead of failing with "ERROR: IO Error: [Errno 1] Operation
> >   not permitted"
> > 
> > * Its not optimal, because this notice is shown every time you run
> >   bitbake (even after checking/setting 0 to mmap_min_addr if you have
> >   kernel not allowing to read it
> > 
> 
> That does sound fairly unsatisfactory.  Printing a diagnostic on every
> build, with no way for the user to suppress it, surely can't be the way
> of the future.
> 
> If you can't tell whether mmap_min_addr is set correctly or not then it
> would probably be better to not show the diagnostic at all.  Perhaps you
> could investigate patching qemu to print a more meaningful message if it
> actually encounters a mmap() failure of this kind.

BTW, wasn't the latest qemu "fixed" for this mmap() issue?

-- 
Denys


