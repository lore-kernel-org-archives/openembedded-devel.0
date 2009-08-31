Received: from [64.71.164.66] (helo=madrid.hostgo.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <javiroman@kernel-labs.org>) id 1MiBB5-000670-Sy
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Aug 2009 20:00:28 +0200
Received: from mail-fx0-f224.google.com ([209.85.220.224])
	by madrid.hostgo.com with esmtpsa (TLSv1:RC4-MD5:128) (Exim 4.69)
	(envelope-from <javiroman@kernel-labs.org>) id 1MiAt6-0002F5-M4
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Aug 2009 13:41:53 -0400
Received: by fxm24 with SMTP id 24so1887271fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2009 10:41:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.75.133 with SMTP id y5mr1904845faj.18.1251740507099; Mon, 
	31 Aug 2009 10:41:47 -0700 (PDT)
In-Reply-To: <200908311722.45126.mickey@vanille-media.de>
References: <12c2e32e0908310716r696a7dadrdc330ad9d4b1eb65@mail.gmail.com> 
	<200908311722.45126.mickey@vanille-media.de>
From: Javi Roman <javiroman@kernel-labs.org>
Date: Mon, 31 Aug 2009 19:41:27 +0200
Message-ID: <12c2e32e0908311041g71b15fd7j102c162d440a7776@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - madrid.hostgo.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - kernel-labs.org
Subject: Re: DISTRO minimal.conf for ARM architectures
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
X-List-Received-Date: Mon, 31 Aug 2009 18:00:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 31, 2009 at 5:22 PM, Michael 'Mickey'
Lauer<mickey@vanille-media.de> wrote:
> On Monday 31 August 2009 16:16:10 Javi Roman wrote:
>> I've been unable to build minimal.conf distro for an ARM architecture
>> (more precisely for Beagleboard platform), at this point I would like
>> ask two questions:
>>
>> 1. Is it minimal.conf distro ready to build on ARM architectures right now?
>
> Yes. How exactly does it fail for you?

/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/build.i686-linux.arm-oe-linux-gnueabi/./gcc/xgcc
-B/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/build.i686-linux.arm-oe-linux-gnueabi/./gcc/
-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-isystem/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/staging/armv7a-oe-linux-gnueabi/usr/include
-B/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/cross/armv7a/arm-oe-linux-gnueabi/bin/
-B/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/cross/armv7a/arm-oe-linux-gnueabi/lib/
-isystem /builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/cross/armv7a/arm-oe-linux-gnueabi/include
-isystem /builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/cross/armv7a/arm-oe-linux-gnueabi/sys-include
-O2 -g -Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
-isystem ./include  -I. -I.
-I/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc
-I/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/.
-I/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/../include
-I/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/../libcpp/include
 -I/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/../libdecnumber
-I../libdecnumber  -g0 -finhibit-size-directive -fno-inline-functions
-fno-exceptions -fno-zero-initialized-in-bss -fno-toplevel-reorder
-Dinhibit_libc  -fPIC \
          -c /builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/crtstuff.c
-DCRT_END -DCRTSTUFFS_O \
          -o crtendS.o
/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/crtstuff.c:1:
error: bad value (cortex-a8) for -mtune= switch
/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/crtstuff.c:1:
error: bad value (armv7-a) for -march= switch
/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/crtstuff.c:1:
error: invalid floating point option:
-mfpu=neon/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/crtstuff.c:1:
error: bad value (cortex-a8) for -mtune= switch
/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/crtstuff.c:1:
error: bad value (armv7-a) for -march= switch
/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/gcc/crtstuff.c:1:
error: invalid floating point option: -mfpu=neon
make[2]: *** [crtbeginT.o] Error 1
make[2]: *** [crtendS.o] Error 1
make[2]: *** [crtbeginS.o] Error 1
make[2]: Leaving directory
`/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/build.i686-linux.arm-oe-linux-gnueabi/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/builds/ASV1-BEAGLEBOARD.REVB6/build/tmp/work/armv7a-oe-linux-gnueabi/gcc-cross-initial-4.2.4-r8.1/gcc-4.2.4/build.i686-linux.arm-oe-linux-gnueabi'
make: *** [all] Error 2
FATAL: oe_runmake failed


I've thought, before to try to find out the problem, if the tuning of
minimal distro for ARM architecutes would be the Angstrom
distribution.

By the way, I'm trying to use the minimal distro for Beagleboard,
instead of Angstron, because of I have thought minimal distro is a
good point of start a fresh (o vanilla) basic distribution, and
Angstron is a more complete and cutting edge distribution for
Beagleboard platform (as Koen has told me).

Thanks.

-- 
Javi Roman


