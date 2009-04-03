Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LpsTp-0003Ze-U9
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Apr 2009 01:07:25 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHJ00IDES2G24H1@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	03 Apr 2009 18:04:00 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DCD8A6B83A8; Fri,
	03 Apr 2009 19:03:51 -0400 (EDT)
Date: Fri, 03 Apr 2009 19:03:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090403230351.GD12552@denix.org>
References: <49D67549.7040001@cs.cmu.edu>
MIME-version: 1.0
In-reply-to: <49D67549.7040001@cs.cmu.edu>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: /linuxrc link to /bin/busybox causes booting to fail	(sysvinit should be used instead)
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
X-List-Received-Date: Fri, 03 Apr 2009 23:07:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 03, 2009 at 04:44:57PM -0400, David Huggins-Daines wrote:
> Hi,
>
> When booting base-image or minimal-image from a ramdisk, I get errors like 
> the following:
>
> RAMDISK: Compressed image found at block 0
> VFS: Mounted root (ext2 filesystem) on device 1:0.
> init started: BusyBox v1.13.2 (2009-04-03 15:54:42 EDT)
> Bad inittab entry at line 5
> can't open /dev/si: No such file or directory
> can't open /dev/~~: No such file or directory
> can't open /dev/l0: No such file or directory
> can't open /dev/l1: No such file or directory
> can't open /dev/l2: No such file or directory
> can't open /dev/l3: No such file or directory
> can't open /dev/l4: No such file or directory
> can't open /dev/l5: No such file or directory
> can't open /dev/l6: No such file or directory
> can't open /dev/z6: No such file or directory
> can't open /dev/S: No such file or directory

Usually that's caused by bad bootargs...
Otherwise images boot fine even with /linuxrc pointing to /bin/busybox

> process '/sbin/sulogin' (pid 167) exited. Scheduling for restart.
> process '/sbin/getty 57600 ttyAM0' (pid 168) exited. Scheduling for 
> restart.
>
> This is because, even though /sbin/init points to /sbin/init.sysvinit, 
> there is also a /linuxrc -> /bin/busybox link, which the kernel uses in 
> preference, causing busybox to run as 'init'.  The problem is that  busybox 
> init uses a different syntax from sysvinit.
>
> I think this problem might have started when inittab support was added to 
> busybox...
>
> Is there a good reason for that /linuxrc link?  And if not, where is it 
> coming from, so that I can remove it?

-- 
Denys


