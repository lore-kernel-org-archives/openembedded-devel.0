Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ld7nU-0004Vn-1s
	for openembedded-devel@openembedded.org; Fri, 27 Feb 2009 19:50:56 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KFQ007FLMUKB89O@vms173001.mailsrvcs.net> for
	openembedded-devel@openembedded.org;
	Fri, 27 Feb 2009 12:47:14 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 047A26B83A8; Fri,
	27 Feb 2009 13:47:08 -0500 (EST)
Date: Fri, 27 Feb 2009 13:47:07 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090227184707.GA6027@denix.org>
References: <1235734652.7210.12.camel@ubuntu2>
MIME-version: 1.0
In-reply-to: <1235734652.7210.12.camel@ubuntu2>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Lista Openembedded <openembedded-devel@openembedded.org>
Subject: Re: Bootloader problems
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
X-List-Received-Date: Fri, 27 Feb 2009 18:50:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Feb 27, 2009 at 12:37:32PM +0100, Paolo Cremonese wrote:
> Hi all,
> I have problems in generating a bootable device (CF)
> During the setup the CF is connected to the host via an USB adapter.
> 
> These are the steps I do:
> 
> # fdisk /dev/sdb
>    create a linux partition /dev/sdb1 and activate it
> 
> # mkfs.ext3 /dev/sdb1
> 
> # mount -t ext3 /dev/sdb1 /media/disk
> 
> # cd /media/disk
> # tar
> -xvf /home/paolo/oe/stuff/build/gpe-image/deploy/glibc/images/i586-generic/gpe-image-i586-generic.tar
> 
> and the filesystem is correctly on the CF
> 
> # cd boot
> # mkdir grub
> # cd grub
> # < copy of grub files>
> # grub ...
> 
> the menu.lst contains
> 
> title		OpenEmbedded Linux (hda1)
> root		(hd0,0)
> kernel		/boot/bzImage-2.6.21 root=/dev/hda1 ro
> quiet
> 
> 
> The system boots, but when the filesystem is created, the kernel crashes
> with the message:
> 
> VFS: Cannot open root device "(hd0,0)" or unknown-block(0,0)
> Please append a correct "root=" boot option
> Kernel panic - not syncing: VFS: unable to mount root fs or
> unknown-block(0,0)
> 
> but I don't understand what I have to do...

Please verify:

1. Your device, you are trying to boot, maps your CF at /dev/hda (or /dev/sda)
2. Your kernel has the support for the filesystem type you want - ext3/ext2
3. Your filesystem has static /dev/hda and enough /dev/hda? devnodes

-- 
Denys


