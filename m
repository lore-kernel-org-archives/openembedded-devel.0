Received: from mail-fx0-f210.google.com ([209.85.220.210])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1Nh68N-0004kF-E8
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 19:57:30 +0100
Received: by fxm2 with SMTP id 2so2222913fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 10:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=F9EFLEUni+aAWQftNgbYYmJ6hYBDFe2Lk74vVzjlKaA=;
	b=dHsas134+1tY4ElsuZuFpBWaOQyn0cA+wAOps0y39VQGMO7FyIVTsa973AQhbNehh1
	SjKl8yWXl9P4v+Fdli58hE5IPR4vX2qxvhLhKEliDVK+cTFWOm3/tKuJM+g87mJcatHd
	pnelz5+9VhI37K2QFNZYkv7ZdNnGVbquvF9P8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=eDOqHkmJwcBTOfxvPa+mbjYk/9n7X9NXT2okgLCIy2zKLt3kMYCWNpSYJJ2jiyeFTQ
	YLkvRDsZnrNEDC7q21AjiSQwakwSHsgMUnQzraC/1vKGFTydKbBG3jAbDangs8PzZnk2
	mui4Fz5PDQVwxnveZxObiBYNxr0dTFGMVBfww=
MIME-Version: 1.0
Received: by 10.223.77.66 with SMTP id f2mr6389443fak.84.1266260089075; Mon, 
	15 Feb 2010 10:54:49 -0800 (PST)
In-Reply-To: <4B798EEF.6000503@balister.org>
References: <1266255767-4031-1-git-send-email-aalonso00@gmail.com>
	<4B798EEF.6000503@balister.org>
Date: Mon, 15 Feb 2010 12:54:48 -0600
Message-ID: <d1ded4381002151054xd9a4fb7r822e2d6ae4daeff0@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.210
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] add xilinx ml507 machine
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
X-List-Received-Date: Mon, 15 Feb 2010 18:57:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Oops didn't know about the commit guide lines.

Actually I haven't found a guideline my self but some of the things that are
needed to
support xilinx dev board are:

Linux kernel recipe with the ability to specify to build a simpleImage so we
can program the fpga with a Jtag
u-boot recipe to preserve the u-boot elf image this also in early developing
stage for programing the fpga.

All hardware changes performed in the fpga must generate a new device
tree descriptor using Xilinx XPS tool  and should be replaced in the Linux
kernel and u-boot (actually some peripheral address in xparameters.h) to
match with the fpga hardware model.

I'm also going to crate a repository with my hardware project to make
available the hardware model (bitstream) used as target reference; and post
on my blog how I'm trying to use OE with the ml507 target platform.







On Mon, Feb 15, 2010 at 12:14 PM, Philip Balister <philip@balister.org>wrote:

> Can you make the commit log examples look like this:
>
> http://wiki.openembedded.net/index.php/Commit_log_example
>
> Do you know of any guides that could help me test this on my ml403? I would
> love to test this stuff!
>
> Philip
>
>
> On 02/15/2010 09:42 AM, Adrian Alonso wrote:
>
>> From: aalonso<aalonso00@gmail.com>
>>
>> ---
>>  conf/machine/include/tune-ppc440.inc |    2 +-
>>  conf/machine/xilinx-ml507.conf       |   33
>> +++++++++++++++++++++++++++++++++
>>  2 files changed, 34 insertions(+), 1 deletions(-)
>>  create mode 100644 conf/machine/xilinx-ml507.conf
>>
>> diff --git a/conf/machine/include/tune-ppc440.inc
>> b/conf/machine/include/tune-ppc440.inc
>> index feca186..6a56bfa 100644
>> --- a/conf/machine/include/tune-ppc440.inc
>> +++ b/conf/machine/include/tune-ppc440.inc
>> @@ -1,4 +1,4 @@
>>  TARGET_CC_ARCH = "-mcpu=440"
>>  BASE_PACKAGE_ARCH = "ppc440"
>>  FEED_ARCH = "ppc440"
>> -PACKAGE_EXTRA_ARCHS += "ppc440e"
>> +PACKAGE_EXTRA_ARCHS += "ppc440"
>> diff --git a/conf/machine/xilinx-ml507.conf
>> b/conf/machine/xilinx-ml507.conf
>> new file mode 100644
>> index 0000000..c376cfe
>> --- /dev/null
>> +++ b/conf/machine/xilinx-ml507.conf
>> @@ -0,0 +1,33 @@
>> +# Copyright (C) 2010, Adrian Alonso<aalonso00@gmail.com>
>> +# Released under the MIT license (see packages/COPYING)
>> +#@TYPE: Machine
>> +#@Name: Xilinx ML507 FPGA Development Platform
>> +#@DESCRIPTION: Machine configuration for Xilinx ML507
>> +
>> +TARGET_ARCH = "powerpc"
>> +TARGET_CPU = "440"
>> +TARGET_FPU = "soft"
>> +#tune for the 440 cpu
>> +require conf/machine/include/tune-ppc440.inc
>> +
>> +#ASSUME_PROVIDED += "virtual/kernel"
>> +PREFERRED_PROVIDER_virtual/kernel = "linux"
>> +
>> +KERNEL_IMAGETYPE = "uImage"
>> +
>> +MACHINE_FEATURES = "kernel26 ext2 usbhost udev"
>> +MACHINE_EXTRA_RECOMMENDS = "kernel-modules"
>> +
>> +UBOOT_ARCH = "ppc"
>> +UBOOT_MACHINE = "ml507_defconfig"
>> +
>> +# Xilinx EDK override paramater definitions for xilinx-bsp
>> +# Include in your local.conf
>> +# XILINX_BSP_PATH = "complete path for Xilinx EDK project"
>> +# XILINX_BOARD = "ml507"
>> +
>> +# Don't use tty1
>> +USE_VT = "0"
>> +SERIAL_CONSOLE = "115200 ttyS0"
>> +
>> +
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

