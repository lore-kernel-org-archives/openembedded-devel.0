Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1H2kfM-0000EC-E8
	for openembedded-devel@openembedded.org; Fri, 05 Jan 2007 09:43:08 +0100
Received: (qmail 10150 invoked by uid 813007); 5 Jan 2007 08:41:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.100?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 5 Jan 2007 08:41:46 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 5 Jan 2007 09:41:45 +0100
User-Agent: KMail/1.9.5
References: <53610736.20061228191750@gmail.com>
	<1167392044.5616.16.camel@localhost.localdomain>
	<271237233.20070104210332@gmail.com>
In-Reply-To: <271237233.20070104210332@gmail.com>
MIME-Version: 1.0
Message-Id: <200701050941.46341.openembedded@hrw.one.pl>
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] [RFC] Get rid of adhoc machine-specific messing with [linux-handhelds-2.6] kernel packages
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
X-List-Received-Date: Fri, 05 Jan 2007 08:43:08 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 4 stycznia 2007 20:03, Paul Sokolovsky napisa=B3:

> >> 2) Argue to Angstrom maintainers to stop killing zImage from rootfs
> >> at all - consistently for all machines.
> >
> > So we start to waste 1.2MB disk space on at least 50% of the machines
> > Angstrom supports? Thats a lot of space on a machine with a 32MB root
> > partition.
>
>   It's not going to be waste, as it is supposed to be used by LAB,
> eventually. Also, while 1.2MB seems like a figure, here's the paradox -
> the difference of what you can fit into 32MB and 30.8MB is pretty
> small.=20

I can see difference in fitting in 14.4MB which collie offers (or 21-23M=20
of poodle, tosa, c700, c750). Keeping not needed files in rootfs hurts.=20
We currently have problems with generating rootfs small enough.

> In this regard, why not adopt another convention - instead of
> fitting yet another cool app, why not provide solid
> upgrade/bootloading/troubleshooting/diagnostics solution by default,
> and teach users that a kernel upgrade is piece of cake, you can't
> brick a device by doing that, and generally, Linux on PDA foundation
> is as solid as on desktop?

pdaX people tried to switch to u-boot on Zaurus line. Look into OESF=20
forums to check how many users failed to follow 'simple' 2 step reflash.

> > Also, it creates a user support problem. "I upgraded the zImage file
> > on my rootfs but my device still uses my old kernel?".
>
>   Well, that's the crucial point. Could you gentlemen describe how you
> handle kernel upgrade on Zaurus now? I imagine it's shipping a separate
> zImage file together with some upgrade script, or rely on native
> bootloader to install it somehow.

On PXA models you flash two files: kernel and rootfs. Any of them can be=20
flashed without second one. There is a 'encrypted' script built by=20
zaurus-updater recipe which do it under rescue 2.4 system (kernel +=20
rootfs) which is stored in 2 others flash partitions.

>   With my proposal to use full kernel-image packages it would
> be instead:
>
> 1. One does "ipkg install kernel-image"
> 2. One prays and with shaking hands runs
> "adhoc_kernel_update_script.sh /boot/zImage"

This step is impossible under 2.6 on Zaurus due to limitations of Sharp=20
bootloader.

>   As for "user support problem", how that differs from what you have
> now? User installs empty kernel-image package and also doesn't get
> upgraded kernel. You likely solved this for Zaurus by telling users
> that installing kernel-image doesn't really upgrade their kernel.
> Well, "Zaurus" appears to be the keyword here.

Under OpenZaurus user gets message on boot that he run incorrect kernel.=20
I do not know will Angstrom adopt it or not.

> > Also, on the Zaurus it means wasting a couple of megabytes of flash
> > for the extra copies of kernels you'll need.

>   As for LAB, that's exactly its strength - if you have support for
> some device (like funky flash) in kernel, LAB will be able to use it,
> as it's just kind of module for the kernel itself. The price of this
> is that LAB is indeed too big as for bootloader - ~1Mb instead of
> usual 256Mb/128Mb.

So why not u-boot or Apex? They are much smaller but maybe does not=20
provide some stuff which LAB do.

> > Machine config files set information that is specific to the machine.
> > Whether of not a given machine has a sucky bootloader is a property
> > of the machine.

>   Point of view. It's all just point of view. Many-many people would
> consider you crazy for wanting to install something else, handmade,
> instead of vendor-carved-in stuff. But you smile and do just that. And
> yet you tell that /home partition and bootloader are carved in stone.
> But someone else will flash them away just as easily.
>
>   That of course doesn't mean I disagree with the current
> state-of-affairs of mostly adhoc bootloaders to be used, and need to
> account for that somehow. It's just one day it may become a limitation
> to have it in machine config.

OE support machines in a way which maintainers want. If some Joe Dev=20
decided to change his machine to work in other way he is free to create=20
own variations of configs/recipes. Flash resizing needs changing kernel=20
CMDLINE which some bootloaders (like Zaurus one) does not support.

>   Ok, so it's clear that Zaurus machines need to keep using existing
> methods, and those methods should not be touched. On the other hand, I
> hope I was able to argue that other machines might have other
> requirements. In this regard, I'll still need to argue to machine
> mentors of (PocketPC!) machines in question to drop
> FILES_kernel-image_MACH =3D "".

I'm open to changes for machines which CAN support it. I do not like to=20
have machine which do:

1. 1st stage bootloader (small, usually vendor provided)
2. 2nd stage bootloader (big LAB)
3. kernel (also big)

Think about booting time...

>   But anyway, I think that ROOTFS_POSTPROCESS_COMMAND +=3D=20
> "remove_zimages; " thing is still useful. It doesn't mean that machines
> should switch to it, but it offers nice, potentially
> machine-independent, way to remove zImage file from the image.=20

Which will get back when user update kernel-image package. Which is BAD.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

      catholic god himself invented autotools just for amusement
      first there was the great flood, then the plague, now autotools




