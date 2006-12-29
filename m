Received: from [64.233.182.191] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H078T-0001Ek-7o
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Dec 2006 03:06:17 +0100
Received: by nf-out-0910.google.com with SMTP id l24so5282739nfc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2006 18:05:40 -0800 (PST)
Received: by 10.48.210.20 with SMTP id i20mr7252628nfg.1167357940057;
	Thu, 28 Dec 2006 18:05:40 -0800 (PST)
Received: from CUBE ( [82.193.96.233])
	by mx.google.com with ESMTP id l21sm68334937nfc.2006.12.28.18.05.39;
	Thu, 28 Dec 2006 18:05:39 -0800 (PST)
Date: Fri, 29 Dec 2006 04:05:45 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1065634639.20061229040545@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1167337946.5596.77.camel@localhost.localdomain>
References: <53610736.20061228191750@gmail.com>
	<459403F2.4080102@dominion.kabel.utwente.nl>
	<1167337946.5596.77.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] [RFC] Get rid of adhoc machine-specific messing with kernel packages
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
X-List-Received-Date: Fri, 29 Dec 2006 02:06:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Thursday, December 28, 2006, 10:32:26 PM, you wrote:

> On Thu, 2006-12-28 at 18:50 +0100, Koen Kooi wrote:
>> Paul Sokolovsky schreef:
>> > Hello angstrom-distro-devel,
>> > 
>> >   Thanks for providing pre-holiday 20061219 snapshots for testing.
>> > They don't provide separate zImages, but well, that's ok - they are in
>> > the images, after all.
>> > 
>> >   Well, not for hx4700, for example. Because:
>> > 
>> > ======== linux-handhelds-2.6.inc =====
>> > FILES_kernel-image_hx4700 = ""
>> > ALLOW_EMPTY_hx4700 = "1"
>> > FILES_kernel-image_htcuniversal = ""
>> > ALLOW_EMPTY_htcuniversal = "1"
>> > ======================================
>> > 
>> >   Oops. Sources of such a special treatment of hx4700 and htcuniversal
>> > would be unclear to outsider, but people who deal with (mis)features
>> > of "ipaqs" know, that hx4700 has one (sic!, even if the most popular)
>> > bootloader which doesn't use zImage in the image, but instead requires
>> > adhoc means to install kernel, ditto for Universal, though bootloader
>> > is another.
>> > 
>> >   So, what is tried here is to "save space". But there're few issues:
>> 
>> Those lines should go, but not before we have a way to exclude 'kernel-image' from the
>> rootfs *and* kernel-module-foo doesn't depend kernel-image anymore.

> The accepted approach is to make the kernel-image file empty which
> solves both those problems.

  Richard, is this response to Koen or to me? If to Koen, that's ok,
but my original mail (
http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2006-December/000058.html )
started with observation that there're few things wrong withe exactly
this approach.

> This is the same as the Zaurus which also
> requires an external zImage file (and this code is handled in
> linux-rp.inc in the same way as the above but for all machines).

  Well, looking into linux-rp.inc, it becomes clear what is actual
problem:

---------
# Compensate for sucky bootloader on all Sharp Zaurus models
#
FILES_kernel-image = ""
ALLOW_EMPTY = "1"
---------

  And PocketPC have exactly the same problem of having sucky
bootloaders. But I wouldn't like to accept that as the eternal state of
affairs, but tackle it to get some generic and reusable solution. The
path I see here is:

1) Stop issuing broken kernel-image packages which don't actually
have kernel image; instead, offer other means to achieve the
result of not having zImage in rootfs, for the cases when it is
needed.

2) Argue to Angstrom maintainers to stop killing zImage from rootfs at
all - consistently for all machines.

3) Move towards adopting 3-level bootloading with a tool like LAB (Linux as
Bootloader) with the following stages:
  a) 1st level bootloader bootstraps 2nd level bootloader out of NAND
  and such - in most cases supplied by device vendor.
  b) 2nd level bootloader boots LAB out of flash (what we have now is
  that 2nd level bootloader boots actual production kernel). 2nd level
  bootloader is vendor's stuff, or small bootloader like u-boot or
  HH.org bootldr.
  c) LAB, 3rd stage bootloader, boots actual kernel out of real
  rootfs, like it is usually done on standard desktop systems.


  Package management of the kernel is fully ensured. LAB, being
essentially a full Linux kernel itself, offers amazing capabilities
for diagnostics and recover in the case of problems - it can easily
boot from secondary storage, NFS, whatever.

  I already heard ideas in that direction from Koen, and well, knowing
that he worked on LAb himself, I assume he would have close picture in
mind to what's written above anyway.

  So, I'd like to start initial small steps in that direction. I don't
pledge for them to apply to anything else but PocketPC (hh.org)
devices, and just hope that Angstrom maintainers will support further
steps outlined above.

  Of course, it's clear that it's a case of common "choose 2 of 3"
compromise, but I really think that general-purpose distro like
Angstrom has good reasons to value "consist and general support across
all (many) devices" over "could hack a way to save a megabyte".

> Arguably, the machine files should perhaps set this...

  Well, in my initial days I was told many times what should be
within machine's discretion, and what's not, and I think I got idea
;-). So, I'd argue that distro config should set it for machines it
supports. This is based on the ideas outlined above - suckiness of
a bootloader is not unalienable property of machine, you can easily add
a 1Mb level to abstract away that suckiness. And in this regard, it is a
distro policy, if it wants to abstract away at some expense, or deal
with dirty details striving to save some space.

> The only other solution probably involves a nasty anonymous function
> acting on a setting of EXTERNAL_KERNEL_IMAGE = "1" in kernel.bbclass.

  The solution I propose,

ROOTFS_POSTPROCESS_COMMAND += "remove_zimages; "

is not nastier than what we already have and use.

> Richard



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



