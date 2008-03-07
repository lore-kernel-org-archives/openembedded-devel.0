Received: from [212.227.126.188] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@linuxdevelopment.de>)
	id 1JXjS7-0002Q8-5U; Fri, 07 Mar 2008 21:47:18 +0100
Received: from [10.0.0.200] (Mb13f.m.pppool.de [89.49.177.63])
	by mrelayeu.kundenserver.de (node=mrelayeu5) with ESMTP (Nemesis)
	id 0ML25U-1JXjQU27PD-0003Ut; Fri, 07 Mar 2008 21:44:25 +0100
Message-ID: <47D1A923.50103@linuxdevelopment.de>
Date: Fri, 07 Mar 2008 21:44:19 +0100
From: =?ISO-8859-1?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.9 (X11/20070801)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200803071113.40387.geoffrey@pager.net>
	<fqrti8$nlt$2@ger.gmane.org>
In-Reply-To: <fqrti8$nlt$2@ger.gmane.org>
X-Enigmail-Version: 0.95.5
X-Provags-ID: V01U2FsdGVkX1851cbPiWpVtxFW3TMppgqGs+/5jda6vXq5X4V
	+Khjf7pfWZJQQGBxTwD1RxDHKJQMNXCpQ1T6wQx2nmMBIi7N40
	wQ8j0ZKY6XSMURu8JR+RaWdQfW3AZl8BBfhvbVwVNo=
X-SA-Exim-Connect-IP: 212.227.126.188
X-SA-Exim-Mail-From: robert@linuxdevelopment.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: AVR32 init segfault: Any resolution?
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
X-List-Received-Date: Fri, 07 Mar 2008 20:47:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Dear all

Put up on the below message i started a new toolchain and added
uclibc-0.9.29 as preffered in angstrom-2008.1.conf

I dont have the atmel toolchain on this box and the minimal-image ends
up like this:

NOTE: package uclibc-initial-0.9.29: started
NOTE: package uclibc-initial-0.9.29-r9: task do_configure: started
NOTE: exceptions.AttributeError:'module' object has no attribute
'get_srcrev' while evaluating:
${@bb.fetch.get_srcrev(d)}
ERROR: function do_configure failed
ERROR: log data follows
(/srv/home/bob/oe/avr32/tmp/work/at32stk1000-angstrom-linux-uclibc/uclibc-initial-0.9.29-r9/temp/log.do_configure.10484)
| NOTE: make OPTIMIZATION=
CPU_CFLAGS=-isystem/srv/home/bob/oe/avr32/tmp/staging/avr32-angstrom-linux-uclibc/usr/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
STRIPTOOL=true LD=avr32-angstrom-linux-uclibc-ld
LOCALE_DATA_FILENAME=uClibc-locale-030818.tgz
CC=avr32-angstrom-linux-uclibc-gcc  oldconfig
| /bin/sh: avr32-angstrom-linux-uclibc-gcc: command not found
| make: avr32-angstrom-linux-uclibc-gcc: Command not found

am i supposed to install the atmel toolchain and set them as
preferred_provider as this message says :

NOTE: multiple providers are available for
virtual/avr32-angstrom-linux-uclibc-libc-for-gcc (external-toolchain,
uclibc);
NOTE: consider defining
PREFERRED_PROVIDER_virtual/avr32-angstrom-linux-uclibc-libc-for-gcc


On my laptop i have both the atmel chain and "somehow" manage to get a
oe build up to minimal-image.



Regards Robert

Koen Kooi schrieb:
> Geoffrey Wossum schreef:
> | Hi all,
> |
> | With Richard's help on the toolchain and a patch to the
> | conf/machine/at32stk1000.conf (submitted via Bugzilla), I can now boot
> the
> | kernel on my AVR32 based AT32STK1000.
> |
> | However, init segfaults.  Here's the last boot of the boot activity
> before the
> | segfault:
> |
> | Waiting 1sec before mounting root device...
> | mmc0: new SD card at address b368
> | mmcblk0: mmc0:b368 5     249856KiB
> |  mmcblk0: p1
> | VFS: Mounted root (ext2 filesystem).
> | Freeing init memory: 64K (90000000 - 90010000)
> | init[1]: segfault at 00000008 pc 2aaabbe8 sp 7ffd0f20 ecr 24
> | init has generated signal 11 but has no handler for it
> | Kernel panic - not syncing: Attempted to kill init!
> |
> |
> | Alex reported the same bug about a month ago to this mailing list.  I
> haven't
> | seen any resolution to it, though.  Is there a resolution to this bug yet?
> 
> You should be able to use busybox as init nowadays, or add add uclibc
> 0.9.29 for avr32 :)
> 
> regards,
> 
> Koen

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 

*Robert Woerle
**Linux Development *

phone: 	+49 (0)821 4442253
mobile: 	+49 179 4744527
email: 	robert@linuxdevelopment.de <mailto:robert@linuxdevelopment.de>
web: 	http://www.linuxdevelopment.de
UStNr. 	102/289/51264









This e-mail message and any files transmitted with it are confidential
property  and are intended only for the person(s) to whom this e-mail is
addressed.  If you have received this e-mail message in error, please
notify the sender immediately by telephone or e-mail and destroy the
original message without making a copy. Thank you.






