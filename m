Received: from [62.179.121.47] (helo=viefep27-int.chello.at)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mailinglist@miromico.ch>) id 1JOtED-0008Au-8J
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Feb 2008 12:23:09 +0100
Received: from [192.168.1.192] (really [77.57.15.173])
	by viefep27-int.chello.at
	(InterMail vM.7.08.02.02 201-2186-121-104-20070414) with ESMTP
	id <20080212112322.EHEH28299.viefep27-int.chello.at@[192.168.1.192]>
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2008 12:23:22 +0100
Message-ID: <47B180DC.1040107@miromico.ch>
Date: Tue, 12 Feb 2008 12:19:56 +0100
From: Alex <mailinglist@miromico.ch>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47AB02C4.4060202@miromico.ch>
In-Reply-To: <47AB02C4.4060202@miromico.ch>
Subject: Re: Init fails with segfault on AVR32
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
X-List-Received-Date: Tue, 12 Feb 2008 11:23:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi

While waiting for support from the mailinglist I tried a few more things 
to get my atngw100 system running.

I tried to use init from (statically linked) busybox. This will suffer 
the same problem but gives me a better clue where
the problem lies.

I found out that in a first step /bin/mount.util-linux is responsible 
for the segfault. And this is due to the shared library
"ld-uClibc-0.9.28".

If I replace this library with ld-uClibc-0.9.29 from atmel's buildroot. 
The segfault is gone!

There are rumours that some of you have OE running on ATNGW100 hardware. 
So what can I make wrong?
Can someone send me his local.conf?
I update OE from time to time in the hope this will save my problems.

I use:
- bitbake version 1.18.11
- monotone 0.31

And I update OE using the following commands:
 > mtn --db=/oe/OE.mtn pull monotone.openembedded.org org.openembedded.dev
 > cd /oe/org.openembedded.dev && mtn update

Hope someone can help me. I'm trying for weeks to get this stuff 
running....

Best regards,
Alex
> Hi
>
> I finally got minimal-image compiled in OE for AVR32 and the kernel can 
> boot just to the point where it tries to load init.
>
> This will fail with a segfault. Last messages on boot log:
>
> VFS: Mounted root (jffs2 
> filesystem).                                          
> Freeing init memory: 68K (90000000 - 
> 90011000)                                 
> init[1]: segfault at 00000008 pc 2aaabbe8 sp 7fabbf40 ecr 
> 24                   
> init has generated signal 11 but has no handler for 
> it                         
> Kernel panic - not syncing: Attempted to kill init!   
>
> I tried NFS boot and boot from flash which both produced the same 
> result. I am using U-Boot 1.3.0.atmel.2 (from Atmel buildroot).
>
> Anyone an idea what could be wrong?
>
> To find the problem I did the following:
>
> I have a working rootfs (from AVR buildroot). Booting with OE-Kernel and 
> Buildroot rootfs works. I can mount OE-rootfs via NFS and then I can 
> execute programs such as sbin/init => this seems to be valid AVR32 
> binaries.
>
> I copied init.sysvinit into my buildroot-rootfs. Now the system doesn't 
> segfault anymore.
>
> Thanks for any hint
>
> Alex
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   



