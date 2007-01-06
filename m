Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H38lk-00033w-9j
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Jan 2007 11:27:20 +0100
Received: by nf-out-0910.google.com with SMTP id l24so7979139nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jan 2007 02:25:54 -0800 (PST)
Received: by 10.49.65.19 with SMTP id s19mr8428422nfk.1168079154106;
	Sat, 06 Jan 2007 02:25:54 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id y24sm99241503nfb.2007.01.06.02.25.52;
	Sat, 06 Jan 2007 02:25:53 -0800 (PST)
Date: Sat, 6 Jan 2007 12:26:05 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1286157628.20070106122605@gmail.com>
To: Marcin Juszkiewicz <openembedded@hrw.one.pl>
In-Reply-To: <200701050941.46341.openembedded@hrw.one.pl>
References: <53610736.20061228191750@gmail.com>
	<1167392044.5616.16.camel@localhost.localdomain>
	<271237233.20070104210332@gmail.com>
	<200701050941.46341.openembedded@hrw.one.pl>
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
X-List-Received-Date: Sat, 06 Jan 2007 10:27:21 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: quoted-printable

Hello Marcin,

Friday, January 5, 2007, 10:41:45 AM, you wrote:

> Dnia czwartek, 4 stycznia 2007 20:03, Paul Sokolovsky napisa=B3:

>> >> 2) Argue to Angstrom maintainers to stop killing zImage from rootfs
>> >> at all - consistently for all machines.
>> >
>> > So we start to waste 1.2MB disk space on at least 50% of the machines
>> > Angstrom supports? Thats a lot of space on a machine with a 32MB root
>> > partition.
>>
>>   It's not going to be waste, as it is supposed to be used by LAB,
>> eventually. Also, while 1.2MB seems like a figure, here's the paradox -
>> the difference of what you can fit into 32MB and 30.8MB is pretty
>> small.=20

> I can see difference in fitting in 14.4MB which collie offers (or 21-23M
> of poodle, tosa, c700, c750). Keeping not needed files in rootfs hurts.
> We currently have problems with generating rootfs small enough.

  Ok. But machines for which that was intended, neither have such
flash limits, nor files would be not needed.

[]
> pdaX people tried to switch to u-boot on Zaurus line. Look into OESF
> forums to check how many users failed to follow 'simple' 2 step reflash.

  Don't tell me, I know how many users can read two words in row.

[]

> On PXA models you flash two files: kernel and rootfs. Any of them can be
> flashed without second one. There is a 'encrypted' script built by=20
> zaurus-updater recipe which do it under rescue 2.4 system (kernel +=20
> rootfs) which is stored in 2 others flash partitions.

  I see. Thanks.

[]

>>   As for LAB, that's exactly its strength - if you have support for
>> some device (like funky flash) in kernel, LAB will be able to use it,
>> as it's just kind of module for the kernel itself. The price of this
>> is that LAB is indeed too big as for bootloader - ~1Mb instead of
>> usual 256Mb/128Mb.

> So why not u-boot or Apex? They are much smaller but maybe does not=20
> provide some stuff which LAB do.

  LAB is essentially a Linux kernel. People spent years adding support
for all the funky CF, SD, network, etc controllers to the kernel. But now
LAB can use all that as the boot/access sources for free. If instead
people will spend their time porting all that crap to u-boot, to the time
they finish, their already old PDAs will drop to the floor, they will
buy new PDA instead, and will have to follow all the multi-year cycle
again.

  Taking into account that multi-year thing was followed by bunch of
people already, it's nice idea to try something fresh ;-).

[]

> OE support machines in a way which maintainers want. If some Joe Dev=20
> decided to change his machine to work in other way he is free to create
> own variations of configs/recipes. Flash resizing needs changing kernel
> CMDLINE which some bootloaders (like Zaurus one) does not support.

  Joe doesn't even have to use OE for all that coolness. So I hope, OE
will concentrate on best practices, one of them being clear separation
of recipes, machines, in distros. That will help Joe too, btw.

>>   Ok, so it's clear that Zaurus machines need to keep using existing
>> methods, and those methods should not be touched. On the other hand, I
>> hope I was able to argue that other machines might have other
>> requirements. In this regard, I'll still need to argue to machine
>> mentors of (PocketPC!) machines in question to drop
>> FILES_kernel-image_MACH =3D "".

> I'm open to changes for machines which CAN support it. I do not like to
> have machine which do:

> 1. 1st stage bootloader (small, usually vendor provided)
> 2. 2nd stage bootloader (big LAB)
> 3. kernel (also big)

> Think about booting time...

  Current boot time in 95% depends on runtime of bunch of inefficient
shell scripts, 5sec kernel boot time is nil comparing to that. Also,
as I hinted above, for many machines it's not a question of liking vs
not liking, but of having vs not having.

   By all means I think that people should optimize boot procedure for
each device, and OE should support that. But at the same time, it
would be nice to find maybe not so optimal, but generic solution.

>>   But anyway, I think that ROOTFS_POSTPROCESS_COMMAND +=3D=20
>> "remove_zimages; " thing is still useful. It doesn't mean that machines
>> should switch to it, but it offers nice, potentially
>> machine-independent, way to remove zImage file from the image.=20

> Which will get back when user update kernel-image package. Which is BAD.

  No, that's feature, as was described above. And besides, not every
images needs to be package-managed at all, mentioned initrd's are
example. In this regard, a machine may want to have zImage in rootfs,
but not having zImage in initrd, and obviously, you can't achieve this
by having either hacked or not hacked kernel-image package.




--=20
Best regards,
 Paul                            mailto:pmiscml@gmail.com



