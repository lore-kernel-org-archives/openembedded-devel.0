Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id D3C1A7D597
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 06:02:39 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id w13so19847633eds.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 23:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DtGaXfjWobP6SOjc1WU2hYorbg7BdlfL8O3RZjGP6F0=;
	b=VLA00A1624ZAh5Y3ZD5acGuw1B9K3ZZFvhYeJ0M6cX5kp6t09qU5it5hMCtL59JdKT
	gnuKP6JV/jduJ/iO+rBD4uRpFuYTTclMYRsBjVyz9B1TiAot+wFt1lth9P2MxQYFkeNp
	s1KfC4vR5W/MIWTYZeoQKCdhSGBfVWhQ/4BCfb7N0RzcwQ0Ngjtg6aCAq2klhsFk47Ol
	hwsMp1ORLF9LMoAEVcPPS8hef9dFse6zInyRgakTMWeTFN+BXNi0WnAtSe3cUG0gV08w
	alT9Q8Y93thcf/MMQMXyFTP3BDiSTgYm4GDo002VGJWV/fZqEK4GaWAS2z/ZV7Y5oINB
	mkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DtGaXfjWobP6SOjc1WU2hYorbg7BdlfL8O3RZjGP6F0=;
	b=pWInMP0GMOqfyDiKWinhFw83BFHfeSI9Q5E8XRpc1ztOkZi9yrL1C/46vvToe9xIzG
	lo20BmdL+vTvDA1ozJdJROdCJ7xGQm805snZDfhM1QPZFiRUdtdaC3c5xeKzx++HJ27C
	cNPMqUwlciiAr3sLowS8WAjDX8dYyMSQabthELos6yVpdHvoSGyjhpEpgGyn1UukGFEl
	TSQJDsHd7B4Ge/2ZoBvharWlWi1ogY/xeqt4MmhDQmWu23Xvmjdm0uWbwjiFTgHDCAuR
	DQzcrJrIwMi//v6o6FoygwULWGP3sNFMBT0VRPnzSYNfOCuRdPWBemPvT76Eh8pLv53Y
	xwNw==
X-Gm-Message-State: APjAAAXIMNwMeCIgh5I5Mn+uLdLjIuPRUvJmJSWEIcJTGcGxOpngEdi9
	y2GN1SIPT0lIwZuys1BsDEqecM/fmL46jGi9KNE=
X-Google-Smtp-Source: APXvYqyreSWAEL/ELRR/0cNvZa4VjgTUlWx+tI9GSg26arE04xBSAWFI4uT9lZJfdo04lWSAn6P+IBVLweXNMRAtHtg=
X-Received: by 2002:a17:906:6a87:: with SMTP id
	p7mr79909470ejr.277.1560837760163; 
	Mon, 17 Jun 2019 23:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190529084806.13342-1-ankit.tarot@gmail.com>
	<CAMKF1soiTZwgAQM3-RD6PttxUJw88rLqpvomL-0j9X1sCJn9qQ@mail.gmail.com>
	<CAM_RqkNM+uqH4HsM6Y=cdWpPSJLyDoXUaf5_rY++fYwXy42W5A@mail.gmail.com>
In-Reply-To: <CAM_RqkNM+uqH4HsM6Y=cdWpPSJLyDoXUaf5_rY++fYwXy42W5A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Jun 2019 08:02:35 +0200
Message-ID: <CA+chaQcaiox8wTmgf9V6-Pp0a9zMcZaurX9yDoubgY1_s7rhfQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Jun 2019 06:02:40 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

it seems to fail for aarch64, I've noticed it in world build for
raspberrypi3-64:

aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc
-mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security
--sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include
-I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
-Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
-Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
-Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
-Wmissing-noreturn -Winit-self -Wmissing-include-dirs
-Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
-Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
-Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
-Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
-Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
-Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
-Wno-error=missing-field-initializers -O2 -pipe -g
-feliminate-unused-debug-types
-fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
-fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
-fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
-fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
-c ../../git/src/wchar/wcscpy_s.c  -fPIC -DPIC -o wchar/.libs/wcscpy_s.o
{standard input}: Assembler messages:
{standard input}:161: Error: unknown mnemonic `memory_barrier' --
`memory_barrier'
{standard input}:389: Error: unknown mnemonic `memory_barrier' --
`memory_barrier'
{standard input}:649: Error: unknown mnemonic `memory_barrier' --
`memory_barrier'
aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc
-mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security
--sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include
-I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
-Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
-Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
-Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
-Wmissing-noreturn -Winit-self -Wmissing-include-dirs
-Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
-Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
-Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
-Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
-Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
-Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
-Wno-error=missing-field-initializers -O2 -pipe -g
-feliminate-unused-debug-types
-fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
-fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
-fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
-fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
-c ../../git/src/wchar/wcsncpy_s.c  -fPIC -DPIC -o wchar/.libs/wcsncpy_s.o
aarch64-webos-linux-libtool: compile:  aarch64-webos-linux-gcc
-mcpu=cortex-a53+crc -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security
--sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../git/src -I.. -I../../git/include -I../include
-I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
-Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
-Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
-Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
-Wmissing-noreturn -Winit-self -Wmissing-include-dirs
-Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
-Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
-Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
-Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
-Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
-Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
-Wno-error=missing-field-initializers -O2 -pipe -g
-feliminate-unused-debug-types
-fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
-fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0
-fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=
-fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
-c ../../git/src/wchar/wmemcpy_s.c  -fPIC -DPIC -o wchar/.libs/wmemcpy_s.o
../aarch64-webos-linux-libtool  --tag=CC   --mode=compile
aarch64-webos-linux-gcc  -mcpu=cortex-a53+crc -fstack-protector-strong
 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
--sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../git/src -I..  -I../../git/include  -I../include
-I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
-Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
-Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
-Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
-Wmissing-noreturn -Winit-self -Wmissing-include-dirs
-Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
-Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
-Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
-Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
-Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
-Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
-Wno-error=missing-field-initializers  -O2 -pipe -g
-feliminate-unused-debug-types
-fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0

 -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0

 -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=

 -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
  -c -o wchar/wscanf_s.lo ../../git/src/wchar/wscanf_s.c
../aarch64-webos-linux-libtool  --tag=CC   --mode=compile
aarch64-webos-linux-gcc  -mcpu=cortex-a53+crc -fstack-protector-strong
 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
--sysroot=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot
-DHAVE_CONFIG_H -I. -I../../git/src -I..  -I../../git/include  -I../include
-I../../git/src -pedantic -fno-strict-aliasing -Wall -Wextra -Wundef
-Wwrite-strings -Wpointer-arith -Wmissing-declarations -Wredundant-decls
-Wno-unused-parameter -Wno-missing-field-initializers -Wcast-align
-Wformat-security -Wsign-compare -Wstrict-aliasing -Wshadow -Wpacked
-Wmissing-noreturn -Winit-self -Wmissing-include-dirs
-Wunused-but-set-variable -Warray-bounds -Wreturn-type -Wswitch-enum
-Wswitch-default -Wduplicated-cond -Wduplicated-branches -Wlogical-op
-Wrestrict -Wnull-dereference -Wdouble-promotion -Wnested-externs
-Wmissing-prototypes -Wstrict-prototypes -Wdeclaration-after-statement
-Wimplicit-function-declaration -Wold-style-definition -Wjump-misses-init
-Werror -Wno-suggest-attribute=format -Wno-error=unused-parameter
-Wno-error=missing-field-initializers  -O2 -pipe -g
-feliminate-unused-debug-types
-fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0

 -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0=/usr/src/debug/safec/3.4-r0

 -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot=

 -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi3_64-webos-linux/safec/3.4-r0/recipe-sysroot-native=
  -c -o wchar/vfwscanf_s.lo ../../git/src/wchar/vfwscanf_s.c
Makefile:1432: recipe for target 'mem/mem_primitives_lib.lo' failed
make[2]: *** [mem/mem_primitives_lib.lo] Error 1
make[2]: *** Waiting for unfinished jobs....

On Wed, May 29, 2019 at 12:31 PM Ankit Navik <ankit.tarot@gmail.com> wrote:

> Hi Raj,
>
> On Wed, May 29, 2019 at 2:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> > On Wed, May 29, 2019 at 10:48 AM Ankit Navik <ankit.tarot@gmail.com>
> > wrote:
> > >
> > > Add generic recipe for safe C library.
> > > This library implements the secure C11 Annex K functions on top of most
> > libc
> > > implementations, which are missing from them.
> > >
> > > Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> > > ---
> > >  meta-oe/recipes-core/safec/safec_3.4.bb | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >  create mode 100644 meta-oe/recipes-core/safec/safec_3.4.bb
> > >
> > > diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb
> > b/meta-oe/recipes-core/safec/safec_3.4.bb
> > > new file mode 100644
> > > index 000000000..d55d081f3
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-core/safec/safec_3.4.bb
> > > @@ -0,0 +1,15 @@
> > > +SUMMARY  = "Safe C Library"
> > > +
> > > +LICENSE  = "safec"
> > > +LIC_FILES_CHKSUM =
> "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
> > > +SECTION = "lib"
> > > +
> > > +inherit autotools pkgconfig
> > > +
> > > +S = "${WORKDIR}/git"
> > > +SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
> > > +SRC_URI = "git://github.com/rurban/safeclib.git"
> > > +
> > > +COMPATIBLE_HOST =
> '(x86_64|i.86|powerpc|powerpc64|arm|aarch64).*-linux'
> > > +
> >
> > I see its excluding mips/mips64 from core supported architectures, is
> > that intentional ?
> >
>
> I'm not sure. This library is required for another component i.e. ipmctl.
>
> Regards,
> Ankit
>
> >
> > > +RDEPENDS_${PN} = "perl"
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

