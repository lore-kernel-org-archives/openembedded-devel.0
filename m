Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gumstix.com>) id 1PvbA6-0003yt-At
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 20:59:45 +0100
Received: from homiemail-a76.g.dreamhost.com (caiajhbdcbhh.dreamhost.com
	[208.97.132.177])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 317AB17C556
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2011 11:58:04 -0800 (PST)
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id 4FD54458079
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2011 11:58:02 -0800 (PST)
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gumstix.com; h=message-id:date
	:from:mime-version:to:subject:content-type:
	content-transfer-encoding; q=dns; s=gumstix.com; b=gDGnWHswWfyWb
	sJurwNfKqBIBSbcmXXhfm7Rec9+pkzLGuvocBf5ms83VlXWyPIesZ8pBil7vVxJz
	OUTSONsx8t0sRFgQlT/1t0nu13bauza0yL4p7lTKj0dNQg4TFdVLlCGfC38Xujtn
	wp9ItfAMdV0IptVX8P8PW268YJda7M=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gumstix.com; h=message-id
	:date:from:mime-version:to:subject:content-type:
	content-transfer-encoding; s=gumstix.com; bh=buWKD5NmjJf3FlB7nQo
	yHU9j/u0=; b=imfj5nqCIxt0gsgDoolrPkmR6Ec/JGiiqQ9RO5DFBEF7iJW5eO8
	BAsSuibmDbBRfvxj03g5OI2gUpInicAAQ4Y3vu42C8k7BSnDNDcl0KwiOw7e/yQh
	N3AmPsQPHb2PetrFxBEVIHTdaRCE+lMzxno5w9jYHrYmXUbbNR0gWeuI=
Received: from [10.0.1.35] (s64-180-61-141.bc.hsia.telus.net [64.180.61.141])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: neil@gumstix.com)
	by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id 204EE458071
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2011 11:58:01 -0800 (PST)
Message-ID: <4D714447.1000104@gumstix.com>
Date: Fri, 04 Mar 2011 11:57:59 -0800
From: Neil MacMunn <neil@gumstix.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Floating point exception in Xorg
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
X-List-Received-Date: Fri, 04 Mar 2011 19:59:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I've started getting a floating point exception when gpe-dm starts Xorg 
or I start it manually. It only happens when I'm using a small display 
i.e. 4.3"LCD, works fine with DVI monitor. Here is the end of my Xorg.0.log

> (II) Loading /usr/lib/xorg/modules/drivers/omapfb_drv.so
> (II) Module omapfb: vendor="X.Org Foundation"
> 	compiled for 1.7.4, module version = 0.1.1
> 	ABI class: X.Org Video Driver, version 6.0
> (II) omapfb: Driver for OMAP framebuffer (omapfb) and external LCD controllers:
> 	omap1/2/3, S1D13745, HWA742
> (WW) Falling back to old probe method for OMAPFB
> (WW) VGA arbiter: cannot open kernel arbiter, no multi-card support
> (II) Running in FRAMEBUFFER Mode
> (WW) Error opening /sys/devices/platform/omapfb/ctrl/name: No such file or directory
> (WW) Can't autodetect LCD controller, assuming internal
> (II) LCD controller: internal
> (II) omapfb(0): Base plane capabilities:
> (II) omapfb(0): Base plane supports the following image formats:
> (II) omapfb(0): VideoRAM: 512KiB (SDRAM)
> (II) omapfb(0): Creating default Display subsection in Screen section
> 	"Screen0" for depth/fbbpp 24/32
> (--) omapfb(0): Depth 24, (==) framebuffer bpp 32
> (==) omapfb(0): RGB weight 888
> (==) omapfb(0): Default visual is TrueColor
> (II) omapfb(0): Output LCD using monitor section Monitor0
>
> Backtrace:
> 0: Xorg (xorg_backtrace+0x2c) [0x57ca0]
> Floating point exception at address 0x734
>
> Fatal server error:
> Caught signal 8 (Floating point exception). Server aborting

I ran a backtrace with GDB and got the following.

> #0  0x401820ac in raise () from /lib/libpthread.so.0
> #1  0x40661fbc in __div0 ()
>     at /home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r23.2/gcc-4.3.3/libgcc/../gcc/config/arm/lib1funcs.asm:1079
> #2  0x40661f90 in __udivsi3 ()
>     at /home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r23.2/gcc-4.3.3/libgcc/../gcc/config/arm/lib1funcs.asm:834
> #3  0x4065edc4 in OMAPFBOutputGetModes (output=<value optimized out>)
>     at omapfb-output.c:128
> #4  0x000f8c60 in xf86ProbeOutputModes (scrn=0x90a990, maxX=2048, maxY=2048)
>     at xf86Crtc.c:1575
> #5  0x000f95dc in xf86InitialConfiguration (scrn=0x2, canGrow=1)
>     at xf86Crtc.c:2345
> #6  0x4065e47c in OMAPFBPreInit (pScrn=0x90a990, flags=<value optimized out>)
>     at omapfb-driver.c:422
> #7  0x0006f6c0 in InitOutput (pScreenInfo=0x1, argc=7, argv=0x0)
>     at xf86Init.c:817
> #8  0x00021fbc in main (argc=7, argv=0x0, envp=<value optimized out>)
>     at main.c:204

I suspected that there was a change in Xorg or omapfb_drv.so so I 
replaced them with their counterparts from a working system to no 
effect. xorg.conf hasn't changed. I'm using a Gumstix Overo with desktop 
and palmtop images. Has anyone seen a floating point exception from Xorg 
or have any ideas where it might originate?

Thanks.

--
Neil


