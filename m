Received: from [209.85.223.190] (helo=mail-iw0-f190.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N5kPR-0007zj-Vp
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 19:16:45 +0100
Received: by iwn28 with SMTP id 28so5328012iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2009 10:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=W4SVcnX5MxOJAh/ib/JgIhW1W/RNwBCvUnTFrS6FkN0=;
	b=htl1XjNSvxLdRxPqRXHDDnVpliB247GYmj7qZWZLlkjRf7ZWKXOZmxWX61ZHPsHqee
	sj8r4hn/9hsWpZ33/zHQJdjA+9mdEKTLkcRpbNOmFe5xcxrjMowST0mT0G/4ueGKQgxb
	NPO7rXJo0TiSRWkoWbMSI6ZV4mxl4kJd9CGgw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cVPgumGdktpRNWDb5+/mMd0JOgozL3n1hSFn1Iew4+PrKqdC5amCO60Zg6gMP7Mq4W
	rl1QrwC3T4NvjxsEPDk3vwoRf66Vvm+eDM1IHU3075UBBn9ETh5TOnHtg+BaavPYJZkp
	t7hE0+CKQ2wUNeAu4vvNxCJEnh7PiScF7tTDA=
MIME-Version: 1.0
Received: by 10.231.148.135 with SMTP id p7mr1744720ibv.27.1257358528676; Wed, 
	04 Nov 2009 10:15:28 -0800 (PST)
In-Reply-To: <OF1FFB6143.17AC4B58-ONC1257664.005737F1-C1257664.0057601B@cirsa.com>
References: <OF989014BA.63B33D1E-ONC1257664.00568597-C1257664.00570B60@cirsa.com>
	<OF1FFB6143.17AC4B58-ONC1257664.005737F1-C1257664.0057601B@cirsa.com>
Date: Wed, 4 Nov 2009 10:15:28 -0800
Message-ID: <19c1b8a90911041015x52a6f139w5d243eec57b63b80@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.190
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problems building binutils-cross_2.18.50.0.7.bb
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
X-List-Received-Date: Wed, 04 Nov 2009 18:16:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2009 at 7:53 AM, jorge fernandez monteagudo
<jorgefm@cirsa.com> wrote:
> Sorry, the error log was truncated!
>
> NOTE: make configure-build-libiberty all
> make[1]: Entering directory
> `/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/bin=
utils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-linux.arm-angstr=
om-linux-gnueabi'
> make[2]: Entering directory
> `/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/bin=
utils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-linux.arm-angstr=
om-linux-gnueabi/libiberty'
> if [ x"" !=3D x ]; then \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc -c -DHAVE_CONFIG_H
> -isystem/mnt/hdb1/arm-beagle/angstrom-dev/staging/i686-linux/usr/include
> -O2 -I.
> -I/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/bi=
nutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/../include
> =C2=A0-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binu=
tils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c
> -o pic/fibheap.o; \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else true; fi
> gcc -c -DHAVE_CONFIG_H
> -isystem/mnt/hdb1/arm-beagle/angstrom-dev/staging/i686-linux/usr/include
> -O2 -I.
> -I/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/bi=
nutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/../include
> =C2=A0-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binu=
tils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c
> -o fibheap.o
> Use of uninitialized value in concatenation (.) or string at
> /usr/share/colorgcc/gcc line 200.
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binu=
tils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:
> In function 'fibheap_union':
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binu=
tils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:151:
> warning: implicit declaration of function 'free'
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binu=
tils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:
> In function 'fibheap_delete_node':
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binu=
tils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:258:
> error: 'LONG_MIN' undeclared (first use in this function)
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binu=
tils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:258:
> error: (Each undeclared identifier is reported only once
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binu=
tils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:258:
> error: for each function it appears in.)
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binu=
tils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:
> In function 'fibheap_consolidate':
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binu=
tils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:360:
> warning: implicit declaration of function 'memset'
> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/binu=
tils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/libiberty/fibheap.c:360:
> warning: incompatible implicit declaration of built-in function 'memset'
> make[2]: *** [fibheap.o] Error 1
> make[2]: Leaving directory
> `/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/bin=
utils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-linux.arm-angstr=
om-linux-gnueabi/libiberty'
> make[1]: *** [all-libiberty] Error 2
> make[1]: Leaving directory
> `/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/bin=
utils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-linux.arm-angstr=
om-linux-gnueabi'
> make: *** [all] Error 2
> FATAL: oe_runmake failed
>
> Regards,
> Jorge
>
>
> <openembedded-devel-bounces@lists.openembedded.org> escribi=C3=B3 el 04/1=
1/2009
> 16:49:45:
>
>> > On 04-11-09 12:17, Koen Kooi wrote:
>> > > On 04-11-09 11:27, jorge fernandez monteagudo wrote:
>> > >> Hi OE list members!
>> > >>
>> > >> It's my first message on this list, and it's related to the
> problems
>> I
>> > >> have building
>> > >> OE for my beagleboard. My host machine is a mandriva 2008.0.
>> > >>
>> > >> I'm following the steps from
>> > >> http://elinux.org/BeagleBoardAndOpenEmbeddedGit
>> > >
>> > > If you're going to build for beagleboard, don't use that guide, but
>> use
>> > > http://www.angstrom-distribution.org/building-angstrom
>> >
>> > Before someone says "it's a wiki, fix it!" I must point that this it's
> a
>>
>> > wiki and people have already unfixed it multiple times. The amount of
>> > unfixing is just too vast, which is why the official angstrom
>> > instructions aren't in a wiki!
>> >
>> > regards,
>> >
>> > Koen
>> >
>>
>> Hi again!
>>
>> I think I was so fast saying that it was ok!
>>
>> I get the same error:
>>
>>
>> NOTE: Running task 570 of 2946 (ID: 2357,
>> /mnt/hdb1/arm-beagle/openembedded/recipes/perl/perl-native_5.8.8.bb,
>> do_configure)
>> NOTE: Running task 571 of 2946 (ID: 1256,
>> /mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.
>> 18.50.0.7.bb,
>> do_qa_configure)
>> NOTE: Running task 572 of 2946 (ID: 1257,
>> /mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.
>> 18.50.0.7.bb,
>> do_compile)
>> NOTE: Running task 573 of 2946 (ID: 1765,
>> /mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native_2.6.1.bb,
>
>> do_install)
>> NOTE: Running task 574 of 2946 (ID: 1766,
>> /mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native_2.6.1.bb,
>
>> do_populate_staging)
>> ERROR: function do_compile failed
>> ERROR: see log in
>> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>> gnueabi/binutils-cross-2.18.50.0.7-r6/temp/log.do_compile.26067
>> NOTE: Task failed:
>> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>> gnueabi/binutils-cross-2.18.50.0.7-r6/temp/log.do_compile.26067
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of
>> /mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-cross_2.
>> 18.50.0.7.bb
>> do_compile failed
>> ERROR: Task 1257
>> (/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-
>> cross_2.18.50.0.7.bb,
>> do_compile) failed
>> NOTE: Waiting for 3 active tasks to finish
>> NOTE: 1:
>> /mnt/hdb1/arm-beagle/openembedded/recipes/perl/perl-native_5.8.8.bb,
>> do_configure (25414)
>> NOTE: 2:
>>
> /mnt/hdb1/arm-beagle/openembedded/recipes/glib-2.0/glib-2.0-native_2.18.0=
.bb,
>
>> do_configure (21833)
>> NOTE: 3:
>> /mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native_2.6.1.bb,
>
>> do_populate_staging (2781)
>> NOTE: Waiting for 2 active tasks to finish
>> NOTE: 1:
>> /mnt/hdb1/arm-beagle/openembedded/recipes/perl/perl-native_5.8.8.bb,
>> do_configure (25414)
>> NOTE: 2:
>> /mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native_2.6.1.bb,
>
>> do_populate_staging (2781)
>> NOTE: Waiting for 1 active tasks to finish
>> NOTE: 1:
>> /mnt/hdb1/arm-beagle/openembedded/recipes/python/python-native_2.6.1.bb,
>
>> do_populate_staging (2781)
>> NOTE: Tasks Summary: Attempted 570 tasks of which 0 didn't need to be
>> rerun and 1 failed.
>> ERROR:
>> '/mnt/hdb1/arm-beagle/openembedded/recipes/binutils/binutils-
>> cross_2.18.50.0.7.bb'
>> failed
>>
>>
>> and the error log:
>>
>> NOTE: make configure-build-libiberty all
>> make[1]: Entering directory
>> `/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-li
>> make[2]: Entering directory
>> `/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-li
>> if [ x"" !=3D x ]; then \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gcc -c -DHAVE_CONFIG_H
>> -isystem/mnt/hdb1/arm-beagle/angstrom-dev/staging/i686-linux/usr/include
>
>> -O2 -I. -I/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 else true; fi
>> gcc -c -DHAVE_CONFIG_H
>> -isystem/mnt/hdb1/arm-beagle/angstrom-dev/staging/i686-linux/usr/include
>
>> -O2 -I. -I/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-l
>> Use of uninitialized value in concatenation (.) or string at
>> /usr/share/colorgcc/gcc line 200.
>> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
>> 7/libiberty/fibheap.c:
>> In function 'fibheap_
>> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
>> 7/libiberty/fibheap.c:151:
>> warning: implicit
>> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
>> 7/libiberty/fibheap.c:
>> In function 'fibheap_
>> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
>> 7/libiberty/fibheap.c:258:
>> error: 'LONG_MIN'
>> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
>> 7/libiberty/fibheap.c:258:
>> error: (Each unde
>> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
>> 7/libiberty/fibheap.c:258:
>> error: for each f
>> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
>> 7/libiberty/fibheap.c:
>> In function 'fibheap_
>> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
>> 7/libiberty/fibheap.c:360:
>> warning: implicit
>> /mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.
>> 7/libiberty/fibheap.c:360:
>> warning: incompat
>> make[2]: *** [fibheap.o] Error 1
>> make[2]: Leaving directory
>> `/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>>
> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-lin
>> make[1]: *** [all-libiberty] Error 2
>> make[1]: Leaving directory
>> `/mnt/hdb1/arm-beagle/angstrom-dev/work/armv7a-angstrom-linux-
>>
> gnueabi/binutils-cross-2.18.50.0.7-r6/binutils-2.18.50.0.7/build.i686-lin
>> make: *** [all] Error 2
>> FATAL: oe_runmake failed
>>
>>
>> I've check the 'fibheap.c' file and I've seen:
>>
>>
>> #ifdef HAVE_CONFIG_H
>> #include "config.h"
>> #endif
>> #ifdef HAVE_LIMITS_H
>> #include <limits.h>
>> #endif
>> #ifdef HAVE_STDLIB_H
>> #include <stdlib.h>
>> #endif
>> #ifdef HAVE_STRING_H
>> #include <string.h>
>> #endif
>> #include "libiberty.h"
>> #include "fibheap.h"
>>
>>
>> #define FIBHEAPKEY_MIN =C2=A0LONG_MIN
>>
>> The problem is that HAVE_LIMITS_H is undefined in config.h then LONG_MIN
>
>> is undefined. Where can I check how the 'config.h'
>> is generated?
>>
>> Regards,
>> Jorge
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

what version of gcc is installed on your build box ? My guess is that
-isystem/mnt/hdb1/arm-beagle/angstrom-dev/staging/i686-linux/usr/include
is causing trouble for you in the CFLAGS. IIRC there was some issue
with gcc 4.2 where isystem mucked with compiler defaults and it did
not search the default include paths correctly.  You can build a local
version of different gcc (say gcc 4.4) on your build box and install
it and use to compile the cross and native packages.

Thanks

-Khem


