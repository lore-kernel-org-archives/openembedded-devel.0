Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JZoGw-0007R0-Lz
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 15:19:15 +0100
X-ASG-Debug-ID: 1205417813-043e00680000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id D32C01E14E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 09:16:54 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id Ush9iZBi8PmBMdi3 for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 09:16:54 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] Eureka! AVR32 ld-uClibc.so segfault solved
Date: Thu, 13 Mar 2008 09:16:53 -0500
User-Agent: KMail/1.9.7
References: <200803121450.09688.geoffrey@pager.net>
	<47D83769.5020405@linuxdevelopment.de>
	<19c1b8a90803121833o48bf80dfhe27516bd2cba4d04@mail.gmail.com>
In-Reply-To: <19c1b8a90803121833o48bf80dfhe27516bd2cba4d04@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200803130916.53297.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1205417814
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Eureka! AVR32 ld-uClibc.so segfault solved
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
X-List-Received-Date: Thu, 13 Mar 2008 14:19:17 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 12 March 2008 08:33:01 pm Khem Raj wrote:

> Try to build uclibc with V=1 on commandline and check what extra flags
> are passed due to this option. I think these flags might be incorrect
> for AVR32

Pass V=1 on which commandline?  I assume we're talking about the uClibc 
compile flags, though.

I knew that ld-uClibc.so was the culprit.  Atmel's buildroot's ld-uClibc.so 
worked, OE's ld-uClibc.so didn't.  How were they different?  uClibc source 
code was the same.  Configuration, slightly different, but making them the 
same didn't fix anything.  Binutils were the same.  gcc was within an 
epsilon.  I even checked the preprocessed ldso source code.  It was the same 
in every way that mattered.  That pretty much just left the compiler options.

Here's what buildroot, which built a working ld-uClibc.so, looked like:
/home/geoff/src/buildroot-avr32-v2.1.0/build_avr32_nofpu/staging_dir/usr/bin/avr32-linux-uclibc-gcc -c 
ldso/ldso/ldso.c -o 
ldso/ldso/ldso.oS -include ./include/libc-symbols.h -Wall -Wstrict-prototypes -fno-strict-aliasing -march=ap -fno-stack-protector -fno-builtin -nostdinc -I./include -I. -msoft-float -std=gnu99 -Os -funit-at-a-time -fno-tree-loop-optimize -fno-tree-dominator-opts -fno-strength-reduce -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/avr32 -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linuxthreads.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthread -I/home/geoff/src/buildroot-avr32-v2.1.0/toolchain_build_avr32_nofpu/linux/include/ -isystem /home/geoff/src/buildroot-avr32-v2.1.0/build_avr32_nofpu/staging_dir/lib/gcc/avr32-linux-uclibc/4.2.1/include -DNDEBUG -fPIC -DSHARED -DNOT_IN_libc -DIS_IN_rtld -fno-stack-protector -fno-omit-frame-pointer -I./ldso/ldso/avr32 -I./ldso/include -I./ldso/ldso -DUCLIBC_RUNTIME_PREFIX="/" -DUCLIBC_LDSO="ld-uClibc.so.0" -DLDSO_ELFINTERP="avr32/elfinterp.c"

Here's what OE, which did not build a working ld-uClibc.so, looked like:
avr32-angstrom-linux-uclibc-gcc -c ldso/ldso/ldso.c -o 
ldso/ldso/ldso.oS -include ./include/libc-symbols.h -Wall -Wstrict-prototypes -fno-strict-aliasing -isystem/home/geoff/lrs/playpaq/tmp/staging/avr32-angstrom-linux-uclibc/usr/include -fno-stack-protector -fno-builtin -nostdinc -I./include -I. -msoft-float -std=gnu99 -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux/avr32 -I./libpthread/linuxthreads.old/sysdeps/avr32 -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linuxthreads.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthread -I/home/geoff/lrs/playpaq/tmp/staging/avr32-angstrom-linux-uclibc/usr/include/ -isystem /home/geoff/lrs/playpaq/tmp/cross/lib/gcc/avr32-angstrom-linux-uclibc/4.2.1/include -DNDEBUG -fPIC -DSHARED -DNOT_IN_libc -DIS_IN_rtld -fno-stack-protector -fno-omit-frame-pointer -I./ldso/ldso/avr32 -I./ldso/include -I./ldso/ldso -DUCLIBC_RUNTIME_PREFIX="/" -DUCLIBC_LDSO="ld-uClibc.so.0" -DLDSO_ELFINTERP="avr32/elfinterp.c"


Ignoring the obvious differences in pathing, the buildroot command line has 
the following additional options:
 * -Os
 * -fno-strength-reduce 
 * -fno-tree-dominator-opts 
 * -fno-tree-loop-optimize 
 * -funit-at-a-time 
 * -march=ap 

I thought -march=ap was probably the magic option.  I figured out uclibc.inc 
was overriding it by passing CPU_CFLAGS="${CFLAGS}".  When I got rid of that 
override, -march=ap was being passed to gcc now, but ld-uClibc.so was still 
broken.  So I got rid of the OPTIMIZATION=' ' override as well.  The BR and 
OE command line switches now matched, except of course for the paths.  With 
that change, ld-uClibc.so now works.  

I'm not sure which of the other flags is the magical one.  This does match my 
experience with other voodooish pieces of code, like bootloaders, being 
extremely sensitive to compilation flags.

As an added bonus, the libc.so and friends are much smaller.  On a cache 
cramped processor like the AVR32, this probably also means faster, although 
I'm not inclined to actually benchmark it right now.

So, for anyone who's still paying attention, why are CPU_CFLAGS and 
OPTIMIZATIONS being overridden in uclibc.inc?  If this is needed to make some 
other platform work, it seems like the wrong way to go about it.  Especially 
since it breaks the AVR32.  Obviously, anything that breaks what I'm trying 
to do is the wrong way to do it ;)

---
Geoffrey


