Received: from [86.43.120.173] (helo=[192.168.5.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cgagneraud@techworks.ie>) id 1LbQ4M-00009Y-UW
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Feb 2009 02:57:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by efirewall.techworks.local (Postfix) with ESMTP id 9636C39C022
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2009 01:54:27 +0000 (GMT)
X-Virus-Scanned: by Endian Firewall
Received: from [192.168.5.191] (unknown [192.168.5.191])
	by efirewall.techworks.local (Postfix) with ESMTP id 552DF39C01F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2009 01:54:21 +0000 (GMT)
Message-ID: <49A201CC.8050509@techworks.ie>
Date: Mon, 23 Feb 2009 01:54:20 +0000
From: Christian Gagneraud <cgagneraud@techworks.ie>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <d741b6090902221034t224cd1e5ja6b3e863fd54bbda@mail.gmail.com>
	<49A1C706.6000906@techworks.ie>
In-Reply-To: <49A1C706.6000906@techworks.ie>
Subject: Re: ep93xx, ts72xx, gesbc-9302 and more (was Re: Angstrom, ep93xx, broken rootfs)
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
X-List-Received-Date: Mon, 23 Feb 2009 01:57:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Christian Gagneraud wrote:
> [this is a not so short email about EP-93xx CPU, EP-93xx based machine, 
> and a request to have them officially supported by OE/Angstrom]
> 
> Alex Williams wrote:
>> Hello!
>> I decided to update my OpenEmbedded from git today. Result: broken
>> rootfs, many applications lost such as busybox and many other files,
>> symlinks. Tried to build minimal-image... One week before update I had
>> perfect rootfs and everything work fine... Resetting many commits
>> since last week did not helped me.
>> Details here: http://pastebin.com/m7ddd3941
> 
> I'm just curious, which board do you use?
> 
> I would like to highlight an "issue" to oe developpers: The machine name 
> "ep93xx" is completely misleading, because it refers to a CPU name not a 
> board/machine name, the conf/machine/ep93xx.conf file says that this is 
> for the "Cirrus Logic EP-93xx Development Platform", which is the vendor 
> development board for the EP-93xx CPU, so the name should be something 
> like "ep93xxevb" or "devkit-ep93xx", or whatever saying it refers to a 
> dev board not to all EP-93xx based machine.
> 
> As well, there is a conf/machine/include/tune-ep9312.inc which is not 
> used by any machine conf file, does anyone know why?

OK, found why! There's lot of trouble with maverick crunch, it seems 
to be buggy, and for now, nobody came with a solution to have it 
working correctly.

For those who are interested, a very good start page to understand the 
issues is  http://wiki.debian.org/ArmEabiMaverickCrunch.
A toolchain can be found here: http://simplemachines.it/tools/ (it 
seems to be the most active for the moment)

Regards,
Chris

> That's  a pity because this serie of CPU (EP93xx) has FP support support 
> through maverick crunch. Which is supported by linux and gcc4, and this 
> is exactly the purpose of this tune-ep9312.inc file (i did not test it 
> yet, see below).
> 
> By greping "ep93" in conf/machine and packages/linux, it comes:
> Known machine that use the EP-93xx CPU:
> - ep93xx (the Cirrus Logic dev board)
> - ts72xx (Technologic systems board)
> - gesbc-9302 (
> Kernel declared as EP93xx compatible (via COMPATIBLE_MACHINE = "ep93xx"):
> - ep93xx-kernel_2.6.17+2.6.18-rc1.bb
> - ep93xx-kernel_2.6.19+2.6.20-rc7.bb
> Kernel compatible with EP93xx (via patch whose name contains "ep93"):
> - linux_2.6.22+2.6.23-rc5
> - linux_2.6.22.6.bb
> - linux_2.6.24.bb
> 
> I'm currently working with a TS-7260 and a TS-7800 boards. I would like 
> to contribute to oe:
> - add machine conf file for ts7800 (based on marvell orion CPU)
> - add a kernel "linux-ts" (vendor provided kernel, currently 
> linux-ts-2.6.21 which support both ts72xx series and ts78xx series)
> - add the latest kernel patch published on the ts7xxx mailing list, 
> which bring support for kernel 2.6.28 on ts72xx boards, i was told that 
> the this vanilla kernel fully support the ts7800 board, still need to test
> - add the possibility to the user to select which kernel to use in 
> local.conf, by changing the ts72xx.conf file with something like this:
> PREFERRED_PROVIDER_virtual/kernel ?= "linux"
> PREFERRED_VERSION_linux-ts        ?= "2.6.21"
> PREFERRED_VERSION_linux           ?= "2.6.28"
> 
> With the above modification, I am currently able to build rootfs and 
> boot into it with both kernels (linux-ts-2.6.21 and linux-2.6.28), and 
> with both angstrom stable (2007.1) and dev (2009.X) branches
> 
> Later on, i would like to experiment with maverick crunch, to check if 
> it is usable and really brings noticable FP performance. If so, then:
> - rename the conf/machine/include/tune-ep9312.inc to 
> conf/machine/include/tune-ep93xx.inc
> - make the machine conf files use tune-ep93xx.inc instead of 
> tune-arm920t.inc
> 
> Of course, i don't want to break anything, hence this email.
> What people thinks about this?
> 
> Finally I would like to see the machines ts72xx and ts7800 officially 
> supported by openembedded and/or angstrom (so that we can use Narcissus 
> for example!;))
> 
> I'm willing to be a machine maintainer/mentor for the ts72xx and the 
> ts7800. At work we use them in lot of our products, and we decided to 
> switch to OE/Angstron distro (after encouraging test results).
> What's the procedure for this exactly?
> 
> Regards,
> Chris.
> 
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



