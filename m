Received: from [66.249.82.225] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <myopiate@gmail.com>) id 1HHuee-0003iy-2R
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Feb 2007 05:25:04 +0100
Received: by wx-out-0506.google.com with SMTP id t14so885056wxc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Feb 2007 20:25:03 -0800 (PST)
Received: by 10.70.32.10 with SMTP id f10mr4402518wxf.1171599902613;
	Thu, 15 Feb 2007 20:25:02 -0800 (PST)
Received: by 10.70.130.3 with HTTP; Thu, 15 Feb 2007 20:25:02 -0800 (PST)
Message-ID: <e83232070702152025v7de70216j32d24db89ba686b7@mail.gmail.com>
Date: Fri, 16 Feb 2007 12:25:02 +0800
From: "Roderick Taylor" <myopiate@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1171565169.18829@gatekeeper.stellarwerx.com>
MIME-Version: 1.0
References: <1171565169.18829@gatekeeper.stellarwerx.com>
Subject: Re: Building Distros Directly To HD (Was: Re: OE Booth during fosdem)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2007 04:25:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> > >> The OE learning curve is still quite steep, but I think it would be
> > >> less steep with a) a bit more documentation and b) an EZ way to start
> > >> creating "little distros" that
> > >> run on PCs using it.
> > >
> > > I remember we had this discussion before , the problem is the
> > > bootloader, for example grub requires some extra handlings to get
> > > installed probarly.

I build "little distros" for x86 and test them out with QEMU. QEMU can
boot a kernel from a file you specify from the command line, so you
don't have to worry about grub. You also don't have to invest in any
hardware.  There is a machine qemux86.conf in the org.oe.dev.

Using QEMU has helped me navigate the learning curve.

The fiddly part is writing the filesystem to a QEMU virtual hard disk.
 To do this I first boot qemu with a ploplinux iso image, start the
network, fdisk, mkfs, wget the oe file system and extract files to the
virtual disk.  Once I've got an intial OE image on there, I just use
ipkg to upgrade and test any other software I need to stick on there.

A smart thing to do would be to modify busybox configuration for use
in an initramfs, create an image that has only networking, fdisk, grub
and mkfs and use this instead of ploplinux.  Creating this sort of
image is what OE is good at. I plan on switching to real hardware when
it finally arrives and do this. (if someone hasn't done it already).


