Received: from [85.37.16.27] (helo=smtpout26.attiva.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pisa.t@teledata-i.com>) id 1Ldi69-0001yp-20
	for openembedded-devel@openembedded.org; Sun, 01 Mar 2009 10:36:37 +0100
Received: from FBCMFE02B28.fbc.local ([192.168.31.8]) by smtpout26.attiva.biz
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 1 Mar 2009 10:32:51 +0100
Received: from [193.100.100.77] ([80.207.73.242]) by FBCMFE02B28.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 1 Mar 2009 10:32:51 +0100
From: Paolo Cremonese <pisa.t@teledata-i.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <20090227184707.GA6027@denix.org>
References: <1235734652.7210.12.camel@ubuntu2>
	<20090227184707.GA6027@denix.org>
Date: Sun, 01 Mar 2009 10:35:39 +0100
Message-Id: <1235900139.5901.4.camel@ubuntu2>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-OriginalArrivalTime: 01 Mar 2009 09:32:51.0808 (UTC)
	FILETIME=[B1382E00:01C99A50]
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
X-List-Received-Date: Sun, 01 Mar 2009 09:36:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On ven, 2009-02-27 at 13:47 -0500, Denys Dmytriyenko wrote:
> On Fri, Feb 27, 2009 at 12:37:32PM +0100, Paolo Cremonese wrote:
> > Hi all,
> > I have problems in generating a bootable device (CF)
> > During the setup the CF is connected to the host via an USB adapter.
> > 
> > These are the steps I do:
> > 
> > # fdisk /dev/sdb
> >    create a linux partition /dev/sdb1 and activate it
> > 
> > # mkfs.ext3 /dev/sdb1
> > 
> > # mount -t ext3 /dev/sdb1 /media/disk
> > 
> > # cd /media/disk
> > # tar
> > -xvf /home/paolo/oe/stuff/build/gpe-image/deploy/glibc/images/i586-generic/gpe-image-i586-generic.tar
> > 
> > and the filesystem is correctly on the CF
> > 
> > # cd boot
> > # mkdir grub
> > # cd grub
> > # < copy of grub files>
> > # grub ...
> > 
> > the menu.lst contains
> > 
> > title		OpenEmbedded Linux (hda1)
> > root		(hd0,0)
> > kernel		/boot/bzImage-2.6.21 root=/dev/hda1 ro
> > quiet
> > 
> > 
> > The system boots, but when the filesystem is created, the kernel crashes
> > with the message:
> > 
> > VFS: Cannot open root device "(hd0,0)" or unknown-block(0,0)
> > Please append a correct "root=" boot option
> > Kernel panic - not syncing: VFS: unable to mount root fs or
> > unknown-block(0,0)
> > 
> > but I don't understand what I have to do...
> 
> Please verify:
> 
> 1. Your device, you are trying to boot, maps your CF at /dev/hda (or /dev/sda)
> 2. Your kernel has the support for the filesystem type you want - ext3/ext2
> 3. Your filesystem has static /dev/hda and enough /dev/hda? devnodes
> 

I have checked:

3. I find /dev/hda and devnodes /dev/hda1 to /dev/hda19

How can I check points 2 and 1?
for the point 1 I think yes because the CF is connected to the IDE, but
I'm not sure..
For the point 2, How can I check?

Many thanks,
Paolo



