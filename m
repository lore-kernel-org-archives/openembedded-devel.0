Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id D2AA07E63B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 06:26:39 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id a14so8353547edv.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2019 23:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w1Lzxetq1IFqnTIPHXFI3fo3jkyOj534wDrmGSUZQt4=;
	b=JgUIctKy0vX3KSgmI3WSd645K5ofWNCqgFu89E+D47eKsWzyrbV1tlNJGvrOZAAbbx
	yvL8u2/CrzZSgmbrM/qmtyMeLT3auFO6YRJJ/5hV5owrWNGETPWRFO46G6CUOT7rTwf3
	r0U/GbpUDpqESAz80eAP4h3Ck6ezxmIaOK9dSbhV0/n/pjoJSF16pGsMo98gkn6PdBFE
	LAADgDmI9TJz3t/7EtQg24t/zBKsYfh8/XkNgU0wT+gyX6ROnaddG50p/k5ESqRXumxl
	DhaM3KI0KKoVGJh/IywbEg2XV6at2eQFKhC0OCBCKDKNkarDsMmx1j+vG1oNoiuk5vxK
	ybKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w1Lzxetq1IFqnTIPHXFI3fo3jkyOj534wDrmGSUZQt4=;
	b=E2MOYJ7Fwn7g545bq0jPvlkaLAJ2qiBegGSWsec3/YzBy79GcQODlOAnyse3Itzu1S
	Ezfnu58jRAVAOGSUzvaIXFpKJ6xVhakKa6zp/kFld5YhjWsT0qzgcxaEvWsl3o/pxOgV
	Ja++QjvVw7aXuwz7ITHkIskPV1F3P837E+3iW6yUdSsFrT7QjA1JRFsnXi7n69pdFcXT
	wpLAVa1JNpKK1DkYzpYITDEWWhVQS72Qyuedt9BKqyutPGZxptRF6ZgZ4UWF3JVemRlU
	u8m+QlW+O9pqsmY09MCKlZgFwDvyHiMyy9pvkGTvUNus74NTjQRoRcp665VlCh14iUQ1
	b9Dw==
X-Gm-Message-State: APjAAAWQwIF7R9Wn0wOI0aqWCR/p3yL20Y4T7Ah3hV/HFlyV2IszWK/9
	tz+yS5IX2Vo8yWKKK1NBqqvH7eMrNV0OUdDJDDo=
X-Google-Smtp-Source: APXvYqzJIwu7Joojyf1MCdW7x3+3XKr4pxA1eBZj5t7prS197JbUcGhWT/rEKm/tfPG+YNIgO9WFBAUCMEdKkz78Mts=
X-Received: by 2002:a17:906:2e59:: with SMTP id
	r25mr19607624eji.293.1561098400369; 
	Thu, 20 Jun 2019 23:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190529084806.13342-1-ankit.tarot@gmail.com>
	<CAMKF1soiTZwgAQM3-RD6PttxUJw88rLqpvomL-0j9X1sCJn9qQ@mail.gmail.com>
	<CAM_RqkNM+uqH4HsM6Y=cdWpPSJLyDoXUaf5_rY++fYwXy42W5A@mail.gmail.com>
	<CA+chaQcaiox8wTmgf9V6-Pp0a9zMcZaurX9yDoubgY1_s7rhfQ@mail.gmail.com>
	<CA+chaQcUxQX_k-c_qDu_XNR+39B-trmqih9fSAbHU=1y_9mBSQ@mail.gmail.com>
	<CAM_RqkPzmXNUkTZxt0H-FgvPiG4V0HEYPOJ1joet0NxWa8DDsA@mail.gmail.com>
In-Reply-To: <CAM_RqkPzmXNUkTZxt0H-FgvPiG4V0HEYPOJ1joet0NxWa8DDsA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 21 Jun 2019 08:26:29 +0200
Message-ID: <CA+chaQfA5qTJ-ZGSDTXRa8mOqX8ZYm1DB-5RmECpouEF07SaZA@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
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
X-List-Received-Date: Fri, 21 Jun 2019 06:26:40 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, sorry I didn't notice this change before.

And what about the aarch64 failure? Should it just be removed from
COMPATIBLE_HOSTs? or is there some aarch64 where it is supposed to work?

On Fri, Jun 21, 2019 at 8:20 AM Ankit Navik <ankit.tarot@gmail.com> wrote:

> Hi Martin,
>
> On Fri, Jun 21, 2019 at 12:39 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> And there is also:
>> WARNING: safec-3.4-r0 do_populate_lic: safec: No generic license file
>> exists for: safec in any provider
>>
>> Add the license text to the meta-oe/licenses/ directory.
>>
>  I have already added licenses.
> https://patchwork.openembedded.org/patch/161305/
> There are no comment on the patch but it is in change requested state.
>
> Regards,
> Ankit
>
> On Tue, Jun 18, 2019 at 8:02 AM Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>>> Hi,
>>>
>>> it seems to fail for aarch64, I've noticed it in world build for
>>> raspberrypi3-64:
>>>
>>> aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc
>>> -mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
>>> -Wformat-security -Werror=format-security
>>> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
>>> -DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include
>>> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
>>> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
>>> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
>>> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
>>> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
>>> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
>>> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
>>> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
>>> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
>>> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
>>> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
>>> -Wno-error=missing-field-initializers -O2 -pipe -g
>>> -feliminate-unused-debug-types
>>> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
>>> -c ../../git/src/wchar/wcscpy_s.c  -fPIC -DPIC -o wchar/.libs/wcscpy_s.o
>>> {standard input}: Assembler messages:
>>> {standard input}:161: Error: unknown mnemonic `memory_barrier' --
>>> `memory_barrier'
>>> {standard input}:389: Error: unknown mnemonic `memory_barrier' --
>>> `memory_barrier'
>>> {standard input}:649: Error: unknown mnemonic `memory_barrier' --
>>> `memory_barrier'
>>> aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc
>>> -mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
>>> -Wformat-security -Werror=format-security
>>> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
>>> -DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include
>>> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
>>> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
>>> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
>>> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
>>> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
>>> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
>>> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
>>> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
>>> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
>>> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
>>> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
>>> -Wno-error=missing-field-initializers -O2 -pipe -g
>>> -feliminate-unused-debug-types
>>> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
>>> -c ../../git/src/wchar/wcsncpy_s.c  -fPIC -DPIC -o wchar/.libs/wcsncpy_s.o
>>> aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc
>>> -mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
>>> -Wformat-security -Werror=format-security
>>> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
>>> -DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include
>>> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
>>> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
>>> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
>>> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
>>> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
>>> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
>>> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
>>> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
>>> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
>>> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
>>> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
>>> -Wno-error=missing-field-initializers -O2 -pipe -g
>>> -feliminate-unused-debug-types
>>> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
>>> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
>>> -c ../../git/src/wchar/wmemcpy_s.c  -fPIC -DPIC -o wchar/.libs/wmemcpy_s.o
>>> ../aarch64-webos-linux-libtool  --tag=CC   --mode=compile
>>> aarch64-webos-linux-gcc  -mcpu=cortex-a53+crc -fstack-protector-strong
>>>  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
>>> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
>>> -DHAVE_CONFIG_H -I. -I../../git/src -I..  -I../../git/include  -I../include
>>> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
>>> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
>>> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
>>> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
>>> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
>>> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
>>> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
>>> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
>>> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
>>> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
>>> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
>>> -Wno-error=missing-field-initializers  -O2 -pipe -g
>>> -feliminate-unused-debug-types
>>> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>>
>>>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>>
>>>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
>>>
>>>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
>>>   -c -o wchar/wscanf_s.lo ../../git/src/wchar/wscanf_s.c
>>> ../aarch64-webos-linux-libtool  --tag=CC   --mode=compile
>>> aarch64-webos-linux-gcc  -mcpu=cortex-a53+crc -fstack-protector-strong
>>>  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
>>> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
>>> -DHAVE_CONFIG_H -I. -I../../git/src -I..  -I../../git/include  -I../include
>>> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
>>> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
>>> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
>>> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
>>> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
>>> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
>>> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
>>> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
>>> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
>>> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
>>> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
>>> -Wno-error=missing-field-initializers  -O2 -pipe -g
>>> -feliminate-unused-debug-types
>>> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>>
>>>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>>>
>>>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
>>>
>>>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
>>>   -c -o wchar/vfwscanf_s.lo ../../git/src/wchar/vfwscanf_s.c
>>> Makefile:1432: recipe for target 'mem/mem_primitives_lib.lo' failed
>>> make[2]: *** [mem/mem_primitives_lib.lo] Error 1
>>> make[2]: *** Waiting for unfinished jobs....
>>>
>>> On Wed, May 29, 2019 at 12:31 PM Ankit Navik <ankit.tarot@gmail.com>
>>> wrote:
>>>
>>>> Hi Raj,
>>>>
>>>> On Wed, May 29, 2019 at 2:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> > On Wed, May 29, 2019 at 10:48 AM Ankit Navik <ankit.tarot@gmail.com>
>>>> > wrote:
>>>> > >
>>>> > > Add generic recipe for safe C library.
>>>> > > This library implements the secure C11 Annex K functions on top of
>>>> most
>>>> > libc
>>>> > > implementations, which are missing from them.
>>>> > >
>>>> > > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
>>>> > > ---
>>>> > >  meta-oe/recipes-core/safec/safec_3.4.bb | 15 +++++++++++++++
>>>> > >  1 file changed, 15 insertions(+)
>>>> > >  create mode 100644 meta-oe/recipes-core/safec/safec_3.4.bb
>>>> > >
>>>> > > diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb
>>>> > b/meta-oe/recipes-core/safec/safec_3.4.bb
>>>> > > new file mode 100644
>>>> > > index 000000000..d55d081f3
>>>> > > --- /dev/null
>>>> > > +++ b/meta-oe/recipes-core/safec/safec_3.4.bb
>>>> > > @@ -0,0 +1,15 @@
>>>> > > +SUMMARY  = "Safe C Library"
>>>> > > +
>>>> > > +LICENSE  = "safec"
>>>> > > +LIC_FILES_CHKSUM =
>>>> "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
>>>> > > +SECTION = "lib"
>>>> > > +
>>>> > > +inherit autotools pkgconfig
>>>> > > +
>>>> > > +S = "${WORKDIR}/git"
>>>> > > +SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
>>>> > > +SRC_URI = "git://github.com/rurban/safeclib.git"
>>>> > > +
>>>> > > +COMPATIBLE_HOST =
>>>> '(x86_64|i.86|powerpc|powerpc64|arm|aarch64).*-linux'
>>>> > > +
>>>> >
>>>> > I see its excluding mips/mips64 from core supported architectures, is
>>>> > that intentional ?
>>>> >
>>>>
>>>> I'm not sure. This library is required for another component i.e.
>>>> ipmctl.
>>>>
>>>> Regards,
>>>> Ankit
>>>>
>>>> >
>>>> > > +RDEPENDS_${PN} = "perl"
>>>> > > --
>>>> > > 2.20.1
>>>> > >
>>>> > > --
>>>> > > _______________________________________________
>>>> > > Openembedded-devel mailing list
>>>> > > Openembedded-devel@lists.openembedded.org
>>>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>> >
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>>

