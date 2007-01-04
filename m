Received: from [64.233.182.184] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H2XtH-0006xg-Db
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jan 2007 20:04:39 +0100
Received: by nf-out-0910.google.com with SMTP id l24so7453319nfc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2007 11:03:22 -0800 (PST)
Received: by 10.48.48.1 with SMTP id v1mr25492332nfv.1167937402758;
	Thu, 04 Jan 2007 11:03:22 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id g1sm43530011nfe.2007.01.04.11.03.20;
	Thu, 04 Jan 2007 11:03:22 -0800 (PST)
Date: Thu, 4 Jan 2007 21:03:32 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <271237233.20070104210332@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>, 
	Marcin Juszkiewicz <openembedded@hrw.one.pl>
In-Reply-To: <1167392044.5616.16.camel@localhost.localdomain>
References: <53610736.20061228191750@gmail.com>
	<459403F2.4080102@dominion.kabel.utwente.nl>
	<1167337946.5596.77.camel@localhost.localdomain>
	<1065634639.20061229040545@gmail.com>
	<1167392044.5616.16.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
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
X-List-Received-Date: Thu, 04 Jan 2007 19:04:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard, Marcin,

      [Sorry for delay with response, due to holiday.]


Friday, December 29, 2006, 1:34:04 PM, you wrote:

> On Fri, 2006-12-29 at 04:05 +0200, Paul Sokolovsky wrote:
>>   Richard, is this response to Koen or to me? If to Koen, that's ok,
>> but my original mail (
>> http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2006-December/000058.html )
>> started with observation that there're few things wrong withe exactly
>> this approach.

> Its to both of you. Your original mail seems to be to basically say you
> don't like the idea as its "unclear" and "weird". These are more
> documentation issues.

  No. My original mail said that it lead to broken snapshots released
for hx4700, so I RFCed its removal for it, and for another PocketPC
machine, htcuniversal, because I'm pretty sure it can live without it.
As additional argumentation, I reviewed how it functions and hopefully
showed that it is hack at best anyway. This has nothing to do with me
thinking it's '"unclear" and "weird"'.

  My still remains the same - clean up PocketPC machines (and only
them!) from this feature/hack. I don't pledge for anything else but
removing 4 lines mentioned in the original mail, from
linux-handhelds-2.6 recipe. This whole thread continued with Koen's
request for an alternative solution. So yes, I tried to propose one,
but well, I wouldn't think it would be the fully general solution, and
responses clearly show it's not suitable for Zaurus, and few other
machines. But that doesn't mean that there's no need for alternative
solution, even if it partial/hack/workaround, because
FILES_kernel-image = "" (essentially having Zaurus roots) is the
workaround just the same. So, until we have fully generic solution, it
would be nice to at least have alternatives even with partial
coverage.

>>   And PocketPC have exactly the same problem of having sucky
>> bootloaders. But I wouldn't like to accept that as the eternal state of
>> affairs, but tackle it to get some generic and reusable solution. The
>> path I see here is:
>> 
>> 1) Stop issuing broken kernel-image packages which don't actually
>> have kernel image; instead, offer other means to achieve the
>> result of not having zImage in rootfs, for the cases when it is
>> needed.

> Ok, so you remove the kernel-image package.

  Well, there must be a misunderstanding - I don't suggest removing
kernel-image package. I suggest not to hack it into such shape that
it, instead of containing zImage, is empty.

>  What do modules then focus
> on to make sure they're all in sync? The kernel-image file serves two
> purposes - the first to add a kernel image file if needed, the second to
> ensure the modules all have a common versioned dependency package.
> Please don't suggest we need another empty package for this.

  Well, if there're two so different purposes, and that causes
confusion and tangled handling (no matter how you document it), then
it may be just a good idea to exactly separate them.

>> 2) Argue to Angstrom maintainers to stop killing zImage from rootfs at
>> all - consistently for all machines.

> So we start to waste 1.2MB disk space on at least 50% of the machines
> Angstrom supports? Thats a lot of space on a machine with a 32MB root
> partition.

  It's not going to be waste, as it is supposed to be used by LAB,
eventually. Also, while 1.2MB seems like a figure, here's the paradox -
the difference of what you can fit into 32MB and 30.8MB is pretty
small. Or to be more exact, the probability that a user will be
satisfied with what you provide in 30.8MB (or alternatively,
percentage of users which will be satisfied with what is provided in
30.8MB) would be almost equal to what you provide in 32MB - after all,
that's indeed not big enough, and what is put in that volume is a
matter of compromise and convention, and subject for users' tweaking
anyway,

  In this regard, why not adopt another convention - instead of
fitting yet another cool app, why not provide solid
upgrade/bootloading/troubleshooting/diagnostics solution by default,
and teach users that a kernel upgrade is piece of cake, you can't
brick a device by doing that, and generally, Linux on PDA foundation
is as solid as on desktop?


  Note that this is all relates to the future step 2 of the masterplan,
it's nothing but a thing to ponder about for now...

> Also, it creates a user support problem. "I upgraded the zImage file on
> my rootfs but my device still uses my old kernel?".

  Well, that's the crucial point. Could you gentlemen describe how you
handle kernel upgrade on Zaurus now? I imagine it's shipping a separate
zImage file together with some upgrade script, or rely on native
bootloader to install it somehow.

  With my proposal to use full kernel-image packages it would
be instead:

1. One does "ipkg install kernel-image"
2. One prays and with shaking hands runs
"adhoc_kernel_update_script.sh /boot/zImage"
3. Optionally, rm "/boot/*"

  Note that we could automate it if we bother (so it's probably better
to make user responsible for possible bricking, and make one do the
above manually).

  As for "user support problem", how that differs from what you have
now? User installs empty kernel-image package and also doesn't get
upgraded kernel. You likely solved this for Zaurus by telling users
that installing kernel-image doesn't really upgrade their kernel.
Well, "Zaurus" appears to be the keyword here.

>> 3) Move towards adopting 3-level bootloading with a tool like LAB (Linux as
>> Bootloader) with the following stages:
>>   a) 1st level bootloader bootstraps 2nd level bootloader out of NAND
>>   and such - in most cases supplied by device vendor.
>>   b) 2nd level bootloader boots LAB out of flash (what we have now is
>>   that 2nd level bootloader boots actual production kernel). 2nd level
>>   bootloader is vendor's stuff, or small bootloader like u-boot or
>>   HH.org bootldr.
>>   c) LAB, 3rd stage bootloader, boots actual kernel out of real
>>   rootfs, like it is usually done on standard desktop systems.

> Its a nice idea but its complex. Nobody has ever looked at LAB on the
> Zaurus for example and there are nasty issues to do with the proprietary
> flash translation layer which means we can't easily read from flash
> partitions under boot loader control (e.g. where the kernel is flashed).

> Also, on the Zaurus it means wasting a couple of megabytes of flash for
> the extra copies of kernels you'll need.

  Well, just in case, let me repeat again - I don't pledge for
converting every machine to this scheme, especially that it is still
more of tentative work in progress. I wouldn't touch Zaurus with any
such ideas at all. All I probe, and ask, for, is allowing to make
such experiment on PocketPC devices, and for Angstrom maintainers,
to be favorable towards this.

  As for LAB, that's exactly its strength - if you have support for
some device (like funky flash) in kernel, LAB will be able to use it,
as it's just kind of module for the kernel itself. The price of this
is that LAB is indeed too big as for bootloader - ~1Mb instead of
usual 256Mb/128Mb. So well, if you have good bootloading scheme for
Zauruses, you don't need it. But for PocketPCs, which come in dozens,
if not hundreds, looking for adhoc optimized solution simply doesn't
scale, the current situation is a good example of that - after so many
years of porting, there're only 2 devices which can be called well
supported. So, PocketPCs need some general solution do leave dark
ages. Optimization can be left to happy folks who have time for that.


>> > Arguably, the machine files should perhaps set this...
>> 
>>   Well, in my initial days I was told many times what should be
>> within machine's discretion, and what's not, and I think I got idea
>> ;-). So, I'd argue that distro config should set it for machines it
>> supports. This is based on the ideas outlined above - suckiness of
>> a bootloader is not unalienable property of machine, you can easily add
>> a 1Mb level to abstract away that suckiness. And in this regard, it is a
>> distro policy, if it wants to abstract away at some expense, or deal
>> with dirty details striving to save some space.

> Machine config files set information that is specific to the machine.
> Whether of not a given machine has a sucky bootloader is a property of
> the machine.

  Point of view. It's all just point of view. Many-many people would
consider you crazy for wanting to install something else, handmade,
instead of vendor-carved-in stuff. But you smile and do just that. And
yet you tell that /home partition and bootloader are carved in stone.
But someone else will flash them away just as easily.

  That of course doesn't mean I disagree with the current
state-of-affairs of mostly adhoc bootloaders to be used, and need to
account for that somehow. It's just one day it may become a limitation
to have it in machine config.

> Whether the DISTRO wants to allow zImage removal from the
> images is a distro policy. It can't enforce that policy without knowing
> which machines need to do what though so you need some machine specific
> information.

>> > The only other solution probably involves a nasty anonymous function
>> > acting on a setting of EXTERNAL_KERNEL_IMAGE = "1" in kernel.bbclass.
>> 
>>   The solution I propose,
>> 
>> ROOTFS_POSTPROCESS_COMMAND += "remove_zimages; "
>> 
>> is not nastier than what we already have and use.

> Yes, it is. Try upgrading kernel-image and you have a user support
> nightmare.

  As argued, on the order of magnitude you'd have been had already.
But err..., I don't ask Zaurus to switch. Just to let PocketPCs try it,
and preferably, consistently. We already have user support nightmare
just because there're few adhoc kernel install/upgrade methods for each of
the few well supported models, and lack of any booting for the rest.

> Basically, the Zauruii at least are going to be stuck with the kernel
> flashed outside the rootfs. Even if we write a better reflashing util,
> we'll probably stick to using that flash space for the kernel. The
> Zaurus machines are therefore going to need support for external kernels
> from OE. If things are unclear, we need to document them better.

  Ok, so it's clear that Zaurus machines need to keep using existing
methods, and those methods should not be touched. On the other hand, I
hope I was able to argue that other machines might have other
requirements. In this regard, I'll still need to argue to machine
mentors of (PocketPC!) machines in question to drop
FILES_kernel-image_MACH = "".

  But anyway, I think that ROOTFS_POSTPROCESS_COMMAND +=  "remove_zimages; "
thing is still useful. It doesn't mean that machines should switch to
it, but it offers nice, potentially machine-independent, way to remove
zImage file from the image. So, besides alternative way to produce
real rootfs image without zImage which will be still possible to
upgrade with ipkg (even if semi-manually) - and that's considered to
be a feature, not breakage, it can be useful for other things, like
initrd creation.


> Richard




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



