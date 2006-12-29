Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H0G0g-0008DX-4y
	for openembedded-devel@openembedded.org; Fri, 29 Dec 2006 12:34:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBTBY9Zk004362;
	Fri, 29 Dec 2006 11:34:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04033-07; Fri, 29 Dec 2006 11:34:07 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBTBY52b004347
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Fri, 29 Dec 2006 11:34:05 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <1065634639.20061229040545@gmail.com>
References: <53610736.20061228191750@gmail.com>
	<459403F2.4080102@dominion.kabel.utwente.nl>
	<1167337946.5596.77.camel@localhost.localdomain>
	<1065634639.20061229040545@gmail.com>
Date: Fri, 29 Dec 2006 11:34:04 +0000
Message-Id: <1167392044.5616.16.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org, angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] [RFC] Get rid of adhoc machine-specific	messing with kernel packages
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
X-List-Received-Date: Fri, 29 Dec 2006 11:34:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-12-29 at 04:05 +0200, Paul Sokolovsky wrote:
>   Richard, is this response to Koen or to me? If to Koen, that's ok,
> but my original mail (
> http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2006-December/000058.html )
> started with observation that there're few things wrong withe exactly
> this approach.

Its to both of you. Your original mail seems to be to basically say you
don't like the idea as its "unclear" and "weird". These are more
documentation issues.

>   And PocketPC have exactly the same problem of having sucky
> bootloaders. But I wouldn't like to accept that as the eternal state of
> affairs, but tackle it to get some generic and reusable solution. The
> path I see here is:
> 
> 1) Stop issuing broken kernel-image packages which don't actually
> have kernel image; instead, offer other means to achieve the
> result of not having zImage in rootfs, for the cases when it is
> needed.

Ok, so you remove the kernel-image package. What do modules then focus
on to make sure they're all in sync? The kernel-image file serves two
purposes - the first to add a kernel image file if needed, the second to
ensure the modules all have a common versioned dependency package.
Please don't suggest we need another empty package for this.

> 2) Argue to Angstrom maintainers to stop killing zImage from rootfs at
> all - consistently for all machines.

So we start to waste 1.2MB disk space on at least 50% of the machines
Angstrom supports? Thats a lot of space on a machine with a 32MB root
partition.

Also, it creates a user support problem. "I upgraded the zImage file on
my rootfs but my device still uses my old kernel?".

> 3) Move towards adopting 3-level bootloading with a tool like LAB (Linux as
> Bootloader) with the following stages:
>   a) 1st level bootloader bootstraps 2nd level bootloader out of NAND
>   and such - in most cases supplied by device vendor.
>   b) 2nd level bootloader boots LAB out of flash (what we have now is
>   that 2nd level bootloader boots actual production kernel). 2nd level
>   bootloader is vendor's stuff, or small bootloader like u-boot or
>   HH.org bootldr.
>   c) LAB, 3rd stage bootloader, boots actual kernel out of real
>   rootfs, like it is usually done on standard desktop systems.

Its a nice idea but its complex. Nobody has ever looked at LAB on the
Zaurus for example and there are nasty issues to do with the proprietary
flash translation layer which means we can't easily read from flash
partitions under boot loader control (e.g. where the kernel is flashed).

Also, on the Zaurus it means wasting a couple of megabytes of flash for
the extra copies of kernels you'll need.

> > Arguably, the machine files should perhaps set this...
> 
>   Well, in my initial days I was told many times what should be
> within machine's discretion, and what's not, and I think I got idea
> ;-). So, I'd argue that distro config should set it for machines it
> supports. This is based on the ideas outlined above - suckiness of
> a bootloader is not unalienable property of machine, you can easily add
> a 1Mb level to abstract away that suckiness. And in this regard, it is a
> distro policy, if it wants to abstract away at some expense, or deal
> with dirty details striving to save some space.

Machine config files set information that is specific to the machine.
Whether of not a given machine has a sucky bootloader is a property of
the machine. Whether the DISTRO wants to allow zImage removal from the
images is a distro policy. It can't enforce that policy without knowing
which machines need to do what though so you need some machine specific
information.

> > The only other solution probably involves a nasty anonymous function
> > acting on a setting of EXTERNAL_KERNEL_IMAGE = "1" in kernel.bbclass.
> 
>   The solution I propose,
> 
> ROOTFS_POSTPROCESS_COMMAND += "remove_zimages; "
> 
> is not nastier than what we already have and use.

Yes, it is. Try upgrading kernel-image and you have a user support
nightmare.

Basically, the Zauruii at least are going to be stuck with the kernel
flashed outside the rootfs. Even if we write a better reflashing util,
we'll probably stick to using that flash space for the kernel. The
Zaurus machines are therefore going to need support for external kernels
from OE. If things are unclear, we need to document them better.

Richard




