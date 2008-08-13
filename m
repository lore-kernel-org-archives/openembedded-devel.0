Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KTEKT-0002jU-0m
	for openembedded-devel@openembedded.org; Wed, 13 Aug 2008 13:15:49 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KTEJq-0004J1-HG
	for openembedded-devel@openembedded.org; Wed, 13 Aug 2008 11:15:10 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 13 Aug 2008 11:15:10 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 13 Aug 2008 11:15:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 Aug 2008 13:14:59 +0200
Message-ID: <g7ufnj$67o$1@ger.gmane.org>
References: <48A13D3B.6040302@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080700)
In-Reply-To: <48A13D3B.6040302@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: outstanding avr32 issues (and their workarounds)
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
X-List-Received-Date: Wed, 13 Aug 2008 11:15:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Robert Schuster wrote:
> Hi,
> for the last 4 days or so I am trying to build Angstrom 2008.1 (uclibc)
> for Atmel's NGW100 board featuering an AVR32 CPU.
>
> I have not been able to boot the image I built with OE yet but these are
> the issues I encountered so far:
>
> 1) binutils-cross 2.17
> Something is b0rken with the configure script code that puts the
> arguments to configure into a variable. The variable contains
> environment variables. This in turn causes the binutils build to fail
> afterwards. There is a workaround which does a little bit of sed magic
> on the generated Makefile. This fixes the wrong variable and lets the
> build succeed.

This should be 'solved' now

> 2) gcc-cross 4.2.2
> When the objective c language is enabled the build of gcc-cross will
> fail because the compiler crashes when compiling some objective c source
> file.
> I have not examined this in detail. Maybe this is fixable with a patch
> to gcc.

This should be 'solved' now as well (ugh, it overrides a variable and 
unweaking it in the process :()

> 3) util-linux-ng 2.14 (when building console-image)
> Needs UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y in uclibc.distro.

Fixed

> 4) console-image
> When the rootfs is generated it will fail with:
>
> Collected errors:
>   * ERROR: Cannot satisfy the following dependencies for task-base-extended:
>     *  libgcc *
>
> There is no libgcc package because it is empty and OE normally does not
> create empty packages. Unfortunately I am not experienced enough with
> uclibc to say why there are no files for libgcc nor do I understand why
> some package requests it. I did a very dirty workaround by declaring
> ALLOW_EMPTY = "1" in gcc-cross.inc

Try a clean rebuild, Khems toolchain changes should have fixed this.

> and optional:
>
> 5) linux
> This is only important if you want to boot from SD/MCC like me. The
> defconfig should say that ext2 or 3 (or both) is built-in. Otherwise you
> cannot boot from such a filesystem.

I tried to update the stk1000 kernel a few weeks ago and ran into 
'funny' issues. If you build in the ps/2 module (the board has 3.3V ps/2 
connectors) the kernel fails to boot. If you enable keyboard drivers 
(HID) the kernel fails to boot. If you enable scsi (for usb storage) the 
kernel fails to boot. If you build in usb support (if have a cf-usb 
adaptor) the kernel fails to boot. I now have a defconfig that builds 
with the current kernel *and* manages to boot, but updating the avr32 
patch makes it unbootable again.
So changing the ngw defconfig is ok, but please test on a stk1000 before 
updating kernel sources.

regards,

Koen



