Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id D40427E790
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 15:09:27 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x15so3773262pfq.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 08:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=71aqJHa8CjhMqqY/TzasVgy1EPK/iDbQQt4ErI0g65c=;
	b=FT6WHJ8XVjoUnKAFSgAlrSXPDyC0OAzHdDHf12d0RnNjcjI5gK+ydvhrHtGfZbnA32
	0ZDGLlzVLikdD37Vk+TmMqlUGc7tNbo4eGZaiuEgcARYiSu7XLYEXg3zSukPHtI+RI7w
	uJKWIfs5njSub0NCiiQx4kPe/VsciuVcyHbHAAA4jFjiQKPreVPqxPOw5RNcTbPMdvn3
	zJCbAMYXcBIeLuIP/2RtdYwkvUDlxPEd76khOUrkGY+eFSlb3BpnbCF1g21AMKyHgFic
	qDS4juhBfG+rAz4YVcl3jhBpLu6Z+cvCPA3uPeJJ0A0godQvDBiM4Fg+wkqOf05qu0gE
	SvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=71aqJHa8CjhMqqY/TzasVgy1EPK/iDbQQt4ErI0g65c=;
	b=WhmIWAbMBgEynOPHh89ayta7EKt0tCbsXhNmbwCIWGmc9dIDlWuoufD8XxDmpHywdT
	+KGE2UEZzWWYPD8kvEhCgcp6g7Jc7+AJexLw4taU87jUUukmomopD2QmHsBGvdOqGolf
	P54qDH4M/5h1PcHZHRHVyFFRqXFPd5SvUlF5JMzF6kW+ctIlQ5TyXvcPSjqNMCGrbuqv
	r4u5dyCrq/8EH79CrLyx5WAKzOgna7u3HNgrtvumv8i3ftKFIt8w9jPYDh/JQSuUTpcQ
	HzgbPj6NDzP7bke7TuX/alWxc0VNAg+7NIGeeC1FOPQmb6j7Fr5rS8WvC2nBrp5cy0Jz
	bQgA==
X-Gm-Message-State: APjAAAXT4pyiIv3wOYQRV5a+9QsPM6mkg+6g3taK3qiRexe5Nau+SZym
	h8RTdnEjO4oDAPeOyvYqeKFVfDt+M4f3oJiKh/0=
X-Google-Smtp-Source: APXvYqyvTBIhNvl/osMEqWwXv2vaEPAQQPjGEyF7OGoQemeWy8xYKuuVK/OOzTfUFMhVchoeoyoYIwCEfass9EIujis=
X-Received: by 2002:a63:5726:: with SMTP id l38mr19615557pgb.344.1561129768756;
	Fri, 21 Jun 2019 08:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190529084806.13342-1-ankit.tarot@gmail.com>
	<CAMKF1soiTZwgAQM3-RD6PttxUJw88rLqpvomL-0j9X1sCJn9qQ@mail.gmail.com>
	<CAM_RqkNM+uqH4HsM6Y=cdWpPSJLyDoXUaf5_rY++fYwXy42W5A@mail.gmail.com>
	<CA+chaQcaiox8wTmgf9V6-Pp0a9zMcZaurX9yDoubgY1_s7rhfQ@mail.gmail.com>
	<CA+chaQcUxQX_k-c_qDu_XNR+39B-trmqih9fSAbHU=1y_9mBSQ@mail.gmail.com>
	<CAM_RqkPzmXNUkTZxt0H-FgvPiG4V0HEYPOJ1joet0NxWa8DDsA@mail.gmail.com>
	<CAMKF1sq0f9zP46zQ9ZkjbTQ+Tp-m36hBoSt_o4APBjJfsfvSXw@mail.gmail.com>
In-Reply-To: <CAMKF1sq0f9zP46zQ9ZkjbTQ+Tp-m36hBoSt_o4APBjJfsfvSXw@mail.gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Fri, 21 Jun 2019 20:39:17 +0530
Message-ID: <CAM_RqkMtOhH5e+WR+-NP2bgMEXg+qve-B2V_V7MwEk1=EpHAdg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] safec: Initial recipe for safe C library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Jun 2019 15:09:28 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raj,

On Fri, Jun 21, 2019 at 6:42 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Fri, Jun 21, 2019 at 12:20 AM Ankit Navik <ankit.tarot@gmail.com>
> wrote:
>
>> Hi Martin,
>>
>> On Fri, Jun 21, 2019 at 12:39 AM Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>>> And there is also:
>>> WARNING: safec-3.4-r0 do_populate_lic: safec: No generic license file
>>> exists for: safec in any provider
>>>
>>> Add the license text to the meta-oe/licenses/ directory.
>>>
>>  I have already added licenses.
>> https://patchwork.openembedded.org/patch/161305/
>> There are no comment on the patch but it is in change requested state.
>>
>
> It was part of series where one patch was in that state and was updated
> and applied but this one missed out resending full series would have helped
> I will cherry pick this again
>
Thanks for the information. I will take care next time.
and I will submit patch to aarch64 from safec.

Regards,
Ankit

>
>
>>
>> Regards,
>> Ankit
>>
>> On Tue, Jun 18, 2019 at 8:02 AM Martin Jansa <martin.jansa@gmail.com>
>>> wrote:
>>>
>>>> Hi,
>>>>
>>>> it seems to fail for aarch64, I've noticed it in world build for
>>>> raspberrypi3-64:
>>>>
>>>> aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc
>>>> -mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
>>>> -Wformat-security -Werror=format-security
>>>> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
>>>> -DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include
>>>> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
>>>> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
>>>> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
>>>> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
>>>> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
>>>> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
>>>> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
>>>> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
>>>> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
>>>> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
>>>> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
>>>> -Wno-error=missing-field-initializers -O2 -pipe -g
>>>> -feliminate-unused-debug-types
>>>> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
>>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
>>>> -c ../../git/src/wchar/wcscpy_s.c  -fPIC -DPIC -o wchar/.libs/wcscpy_s.o
>>>> {standard input}: Assembler messages:
>>>> {standard input}:161: Error: unknown mnemonic `memory_barrier' --
>>>> `memory_barrier'
>>>> {standard input}:389: Error: unknown mnemonic `memory_barrier' --
>>>> `memory_barrier'
>>>> {standard input}:649: Error: unknown mnemonic `memory_barrier' --
>>>> `memory_barrier'
>>>> aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc
>>>> -mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
>>>> -Wformat-security -Werror=format-security
>>>> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
>>>> -DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include
>>>> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
>>>> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
>>>> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
>>>> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
>>>> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
>>>> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
>>>> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
>>>> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
>>>> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
>>>> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
>>>> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
>>>> -Wno-error=missing-field-initializers -O2 -pipe -g
>>>> -feliminate-unused-debug-types
>>>> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
>>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
>>>> -c ../../git/src/wchar/wcsncpy_s.c  -fPIC -DPIC -o wchar/.libs/wcsncpy_s.o
>>>> aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc
>>>> -mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
>>>> -Wformat-security -Werror=format-security
>>>> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
>>>> -DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include
>>>> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
>>>> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
>>>> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
>>>> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
>>>> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
>>>> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
>>>> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
>>>> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
>>>> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
>>>> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
>>>> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
>>>> -Wno-error=missing-field-initializers -O2 -pipe -g
>>>> -feliminate-unused-debug-types
>>>> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
>>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
>>>> -c ../../git/src/wchar/wmemcpy_s.c  -fPIC -DPIC -o wchar/.libs/wmemcpy_s.o
>>>> ../aarch64-webos-linux-libtool  --tag=CC   --mode=compile
>>>> aarch64-webos-linux-gcc  -mcpu=cortex-a53+crc -fstack-protector-strong
>>>>  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
>>>> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
>>>> -DHAVE_CONFIG_H -I. -I../../git/src -I..  -I../../git/include  -I../include
>>>> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
>>>> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
>>>> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
>>>> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
>>>> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
>>>> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
>>>> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
>>>> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
>>>> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
>>>> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
>>>> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
>>>> -Wno-error=missing-field-initializers  -O2 -pipe -g
>>>> -feliminate-unused-debug-types
>>>> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>>>
>>>>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>>>
>>>>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
>>>>
>>>>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
>>>>   -c -o wchar/wscanf_s.lo ../../git/src/wchar/wscanf_s.c
>>>> ../aarch64-webos-linux-libtool  --tag=CC   --mode=compile
>>>> aarch64-webos-linux-gcc  -mcpu=cortex-a53+crc -fstack-protector-strong
>>>>  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
>>>> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
>>>> -DHAVE_CONFIG_H -I. -I../../git/src -I..  -I../../git/include  -I../include
>>>> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
>>>> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
>>>> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
>>>> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
>>>> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
>>>> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
>>>> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
>>>> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
>>>> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
>>>> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
>>>> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
>>>> -Wno-error=missing-field-initializers  -O2 -pipe -g
>>>> -feliminate-unused-debug-types
>>>> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>>>
>>>>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>>>
>>>>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
>>>>
>>>>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
>>>>   -c -o wchar/vfwscanf_s.lo ../../git/src/wchar/vfwscanf_s.c
>>>> Makefile:1432: recipe for target 'mem/mem_primitives_lib.lo' failed
>>>> make[2]: *** [mem/mem_primitives_lib.lo] Error 1
>>>> make[2]: *** Waiting for unfinished jobs....
>>>>
>>>> On Wed, May 29, 2019 at 12:31 PM Ankit Navik <ankit.tarot@gmail.com>
>>>> wrote:
>>>>
>>>>> Hi Raj,
>>>>>
>>>>> On Wed, May 29, 2019 at 2:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>>>
>>>>> > On Wed, May 29, 2019 at 10:48 AM Ankit Navik <ankit.tarot@gmail.com>
>>>>> > wrote:
>>>>> > >
>>>>> > > Add generic recipe for safe C library.
>>>>> > > This library implements the secure C11 Annex K functions on top of
>>>>> most
>>>>> > libc
>>>>> > > implementations, which are missing from them.
>>>>> > >
>>>>> > > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
>>>>> > > ---
>>>>> > >  meta-oe/recipes-core/safec/safec_3.4.bb | 15 +++++++++++++++
>>>>> > >  1 file changed, 15 insertions(+)
>>>>> > >  create mode 100644 meta-oe/recipes-core/safec/safec_3.4.bb
>>>>> > >
>>>>> > > diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb
>>>>> > b/meta-oe/recipes-core/safec/safec_3.4.bb
>>>>> > > new file mode 100644
>>>>> > > index 000000000..d55d081f3
>>>>> > > --- /dev/null
>>>>> > > +++ b/meta-oe/recipes-core/safec/safec_3.4.bb
>>>>> > > @@ -0,0 +1,15 @@
>>>>> > > +SUMMARY  = "Safe C Library"
>>>>> > > +
>>>>> > > +LICENSE  = "safec"
>>>>> > > +LIC_FILES_CHKSUM =
>>>>> "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
>>>>> > > +SECTION = "lib"
>>>>> > > +
>>>>> > > +inherit autotools pkgconfig
>>>>> > > +
>>>>> > > +S = "${WORKDIR}/git"
>>>>> > > +SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
>>>>> > > +SRC_URI = "git://github.com/rurban/safeclib.git"
>>>>> > > +
>>>>> > > +COMPATIBLE_HOST =
>>>>> '(x86_64|i.86|powerpc|powerpc64|arm|aarch64).*-linux'
>>>>> > > +
>>>>> >
>>>>> > I see its excluding mips/mips64 from core supported architectures, is
>>>>> > that intentional ?
>>>>> >
>>>>>
>>>>> I'm not sure. This library is required for another component i.e.
>>>>> ipmctl.
>>>>>
>>>>> Regards,
>>>>> Ankit
>>>>>
>>>>> >
>>>>> > > +RDEPENDS_${PN} = "perl"
>>>>> > > --
>>>>> > > 2.20.1
>>>>> > >
>>>>> > > --
>>>>> > > _______________________________________________
>>>>> > > Openembedded-devel mailing list
>>>>> > > Openembedded-devel@lists.openembedded.org
>>>>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>> >
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>
>>>>

