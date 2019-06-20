Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD62E6C37F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2019 19:09:48 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id p15so6191482eds.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2019 12:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6f7o4Jyl4TOGAwnstz0n1y2JC3F0gjjwJMfD3i/V2Sw=;
	b=uZewonsYgkTh4vajjWNkTeM1vIZjFlvW8t8JjyNkDphmLkt3tURKHCuNWXJTM5n0Bk
	E2QCEuBJhjh1pDdBm1OdRuvKYYlxvwmvihvyX8qTCuDzoAiOqCSBOZPJp2RM8Dy5o+K0
	MU1yLogqBKnKaRpWCfyU9DgsLrdOYGKovMLMp7JO5BzIu7yKYKSEYgZNogC+EFcX/50d
	3Luj/AQT8dvmKMwi9208qpbih3nj0s7M6eQnsQ1NfLdiD8N3WexM67kYXab+ACucwAl9
	HaY5jpwhxDXdXwE53dJdQ3a4TC3KGAxRbSKzzosOjJs75Dk72Q0Rdb3MAla3FyV3SIyt
	Fi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6f7o4Jyl4TOGAwnstz0n1y2JC3F0gjjwJMfD3i/V2Sw=;
	b=R3IFJ3u444AjvmitdvSzN9whb18+uC70ZFMd6KtNs7WZcjcpjjQGHhMavQQs1pX7Ok
	2dp0lZqX4Fnp/zpvZEAif98fcixjIAmyjDeFJWaWQt3ItFZ5LRxMee/ucQI7V5XMnvTa
	5nC3nqk8eAb0OMnq7dw3kmdF14E3PfT0x9XJKpyHwm48vKI1cfwP701UkBIZf5V2W+ss
	kNIQojt+RDdq9PPZzHHdV0yJZcfC4DEomPm7vZIqIGLjOxB/1ZWDVv9GfsUYyy8Cn0zG
	h+wvEkKRxy2Vg2Hcyn0sDjV3hgpGt0J8fEz7mR0E+pGJ0h0Km6qt3NLGOoLqnJhXkVw1
	HSHg==
X-Gm-Message-State: APjAAAUsNWJQEaNI1qj5S5MKiyTFynhaDnM4D1wojjYGlvvcdDDhgG7F
	jV5rbb9ZelnNoOHqhx0S9NweVC9qidwBpTKKak8=
X-Google-Smtp-Source: APXvYqxKtL1oemf36lAVSjhqQbiiL1qXpsDS8E2lJ0+s4Demh6++3WsNqtU2akRMsvlM6+gIZx69uxq70mbtDSQ1JRw=
X-Received: by 2002:aa7:c14f:: with SMTP id r15mr76054831edp.116.1561057789533;
	Thu, 20 Jun 2019 12:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190529084806.13342-1-ankit.tarot@gmail.com>
	<CAMKF1soiTZwgAQM3-RD6PttxUJw88rLqpvomL-0j9X1sCJn9qQ@mail.gmail.com>
	<CAM_RqkNM+uqH4HsM6Y=cdWpPSJLyDoXUaf5_rY++fYwXy42W5A@mail.gmail.com>
	<CA+chaQcaiox8wTmgf9V6-Pp0a9zMcZaurX9yDoubgY1_s7rhfQ@mail.gmail.com>
In-Reply-To: <CA+chaQcaiox8wTmgf9V6-Pp0a9zMcZaurX9yDoubgY1_s7rhfQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 20 Jun 2019 21:09:47 +0200
Message-ID: <CA+chaQcUxQX_k-c_qDu_XNR+39B-trmqih9fSAbHU=1y_9mBSQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 20 Jun 2019 19:09:49 -0000
Content-Type: text/plain; charset="UTF-8"

And there is also:
WARNING: safec-3.4-r0 do_populate_lic: safec: No generic license file
exists for: safec in any provider

Add the license text to the meta-oe/licenses/ directory.

On Tue, Jun 18, 2019 at 8:02 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> Hi,
>
> it seems to fail for aarch64, I've noticed it in world build for
> raspberrypi3-64:
>
> aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc
> -mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
> -Wformat-security -Werror=format-security
> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
> -DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include
> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
> -Wno-error=missing-field-initializers -O2 -pipe -g
> -feliminate-unused-debug-types
> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
> -c ../../git/src/wchar/wcscpy_s.c  -fPIC -DPIC -o wchar/.libs/wcscpy_s.o
> {standard input}: Assembler messages:
> {standard input}:161: Error: unknown mnemonic `memory_barrier' --
> `memory_barrier'
> {standard input}:389: Error: unknown mnemonic `memory_barrier' --
> `memory_barrier'
> {standard input}:649: Error: unknown mnemonic `memory_barrier' --
> `memory_barrier'
> aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc
> -mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
> -Wformat-security -Werror=format-security
> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
> -DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include
> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
> -Wno-error=missing-field-initializers -O2 -pipe -g
> -feliminate-unused-debug-types
> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
> -c ../../git/src/wchar/wcsncpy_s.c  -fPIC -DPIC -o wchar/.libs/wcsncpy_s.o
> aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc
> -mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
> -Wformat-security -Werror=format-security
> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
> -DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include
> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
> -Wno-error=missing-field-initializers -O2 -pipe -g
> -feliminate-unused-debug-types
> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
> -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
> -c ../../git/src/wchar/wmemcpy_s.c  -fPIC -DPIC -o wchar/.libs/wmemcpy_s.o
> ../aarch64-webos-linux-libtool  --tag=CC   --mode=compile
> aarch64-webos-linux-gcc  -mcpu=cortex-a53+crc -fstack-protector-strong
>  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
> -DHAVE_CONFIG_H -I. -I../../git/src -I..  -I../../git/include  -I../include
> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
> -Wno-error=missing-field-initializers  -O2 -pipe -g
> -feliminate-unused-debug-types
> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>
>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>
>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
>
>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
>   -c -o wchar/wscanf_s.lo ../../git/src/wchar/wscanf_s.c
> ../aarch64-webos-linux-libtool  --tag=CC   --mode=compile
> aarch64-webos-linux-gcc  -mcpu=cortex-a53+crc -fstack-protector-strong
>  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
> --sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
> -DHAVE_CONFIG_H -I. -I../../git/src -I..  -I../../git/include  -I../include
> -I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
> -Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
> -Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
> -Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
> -Wmissing-noreturn -Winit-self -Wmissing-include-dirs
> -Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
> -Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
> -Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
> -Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
> -Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
> -Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
> -Wno-error=missing-field-initializers  -O2 -pipe -g
> -feliminate-unused-debug-types
> -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>
>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
>
>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
>
>  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
>   -c -o wchar/vfwscanf_s.lo ../../git/src/wchar/vfwscanf_s.c
> Makefile:1432: recipe for target 'mem/mem_primitives_lib.lo' failed
> make[2]: *** [mem/mem_primitives_lib.lo] Error 1
> make[2]: *** Waiting for unfinished jobs....
>
> On Wed, May 29, 2019 at 12:31 PM Ankit Navik <ankit.tarot@gmail.com>
> wrote:
>
>> Hi Raj,
>>
>> On Wed, May 29, 2019 at 2:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > On Wed, May 29, 2019 at 10:48 AM Ankit Navik <ankit.tarot@gmail.com>
>> > wrote:
>> > >
>> > > Add generic recipe for safe C library.
>> > > This library implements the secure C11 Annex K functions on top of
>> most
>> > libc
>> > > implementations, which are missing from them.
>> > >
>> > > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
>> > > ---
>> > >  meta-oe/recipes-core/safec/safec_3.4.bb | 15 +++++++++++++++
>> > >  1 file changed, 15 insertions(+)
>> > >  create mode 100644 meta-oe/recipes-core/safec/safec_3.4.bb
>> > >
>> > > diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb
>> > b/meta-oe/recipes-core/safec/safec_3.4.bb
>> > > new file mode 100644
>> > > index 000000000..d55d081f3
>> > > --- /dev/null
>> > > +++ b/meta-oe/recipes-core/safec/safec_3.4.bb
>> > > @@ -0,0 +1,15 @@
>> > > +SUMMARY  = "Safe C Library"
>> > > +
>> > > +LICENSE  = "safec"
>> > > +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
>> > > +SECTION = "lib"
>> > > +
>> > > +inherit autotools pkgconfig
>> > > +
>> > > +S = "${WORKDIR}/git"
>> > > +SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
>> > > +SRC_URI = "git://github.com/rurban/safeclib.git"
>> > > +
>> > > +COMPATIBLE_HOST =
>> '(x86_64|i.86|powerpc|powerpc64|arm|aarch64).*-linux'
>> > > +
>> >
>> > I see its excluding mips/mips64 from core supported architectures, is
>> > that intentional ?
>> >
>>
>> I'm not sure. This library is required for another component i.e. ipmctl.
>>
>> Regards,
>> Ankit
>>
>> >
>> > > +RDEPENDS_${PN} = "perl"
>> > > --
>> > > 2.20.1
>> > >
>> > > --
>> > > _______________________________________________
>> > > Openembedded-devel mailing list
>> > > Openembedded-devel@lists.openembedded.org
>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

