Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0729578B41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 17:05:05 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id 126-v6so4973243qke.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 10:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=G8b7DeNtMlNcuOhdT140iCxdZQXCR8u1wZNh9nt/lco=;
	b=Sai6AqKPPCdwab4MlW4FDyMHKFH+jkgoGiCNNxX77UCFWPRRYV+o5AAiqgYepdn1J2
	G9uYhKocrTklr9Niz2otLWAkl8wb4H5V8DVax5WKjnPT69KDlr7YPgfk2rOc3tkTCz2L
	sqpoE/+Oi9NZwNLylxl7wmmS9RI/DAPSYoV7FaJKk3lXFarpUSyOdn2wLlZ7BcftDqto
	90bf1KAuZXS3NPJZrgmmR1qENVWJ+cjcx+wfuHMBPBNgWgDoMOii2zo5NQhibPH8p2S5
	s+K8ZsI5Fno9/ze5aBkJMwFMnra1N7xuV+GX4zCyrOQ26tRhqjybt42NemouWqIpozBa
	OtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=G8b7DeNtMlNcuOhdT140iCxdZQXCR8u1wZNh9nt/lco=;
	b=ODn5spUvaltOPkGV2Kz0z3NS16jgCbMSVSbtRyc2wtUWatGZ9cTqJECL7BIgOij5Vk
	MLpBdpLLJmoX7DX6bHZmJe2n0CBvwOWVn5VmYJYouyfRxM0Zq4RBafghfiMBleZSTG/O
	DyHhXc1gYfsoR1A1Ad6YTjaej5wzQQykGjH1yVwvMDgraJNukif37GHjEATeRxIdy+BS
	DP/6chLw5O2h2zQs5G9fJ2q1W/W3su/PHmswX1iKqoqHJiLCFgsQ9CKwoqfnZ/5Cbs+K
	ZB5gvzmyYPQgx+a0gUBBRaJsH+gIkhsOZe/lOfoZ5ObFb0boUTrvIRmsV9fobCXZ1ovn
	GLYg==
X-Gm-Message-State: AOUpUlF8mLwx7bhSnQv3lGCxGjbnhM1hSir7xvOQTdtVDHIKebUqFCVa
	Y/hKLJxgjzRMqo0xUIF3iYGXMqAM2FVpRZCNvKA=
X-Google-Smtp-Source: AAOMgpdP6IdmC5YRlgRpWex1LqRUgK7J/GJKI59mVy/hxI55ngyPgDFgW7zffMaFWF3MWdGis9e5+gdCWVGP9D6Wvqg=
X-Received: by 2002:a37:417:: with SMTP id 23-v6mr2468033qke.12.1532106306520; 
	Fri, 20 Jul 2018 10:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <1532096077-26473-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1srz43sdVj_ZCOWFScFaBEmYYBoDMSSi+z0CLeeNgPCq4g@mail.gmail.com>
	<d4a53f9a-1c1e-1d03-c25f-cc1471ea85ca@windriver.com>
In-Reply-To: <d4a53f9a-1c1e-1d03-c25f-cc1471ea85ca@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Jul 2018 10:04:40 -0700
Message-ID: <CAMKF1srXv9nMXrXABp2EgQe6kXMUNd2JPGXe9gCPdeybFraMFg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mozjs: add support for mips64-n32
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
X-List-Received-Date: Fri, 20 Jul 2018 17:05:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think we should change it in bbclass
On Fri, Jul 20, 2018 at 8:35 AM Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
>
> On 2018=E5=B9=B407=E6=9C=8820=E6=97=A5 22:18, Khem Raj wrote:
> > On Fri, Jul 20, 2018 at 7:04 AM Hongxu Jia <hongxu.jia@windriver.com> w=
rote:
> >> - Tweak configure for mips64-n32
> >>
> >> - Disable gold linker which not supported by mips64-n32
> >>
> >> - Since n32 and n64 use the same registers, add n32 to
> >>    n64's register definition.
> >>
> > btw. I am also seeing do_configure failure on qemumips
> >
> > mozbuild.configure.options.InvalidOptionError: Unknown option: --disabl=
e-static
> >
>
> Hi Khem,
>
> I could not reproduce the failure on qemumips even though
> add `require conf/distro/include/no-static-libs.inc' to local.conf
>
> DISABLE_STATIC =3D "" is already set in mozjs recipe.
>
> There are two guesses:
> -  A DISABLE_STATIC_append =3D " --disable-static"  in conf?
>
> - The var-DISABLE_STATIC setting sequence, first in mozjs
> recipe and then in conf/distro/include/no-static-libs.inc
> Should tweak the setting in conf/distro/include/no-static-libs.inc?
> --- a/meta/conf/distro/include/no-static-libs.inc
> +++ b/meta/conf/distro/include/no-static-libs.inc
> @@ -1,4 +1,4 @@
> -DISABLE_STATIC =3D " --disable-static"
> +DISABLE_STATIC ?=3D " --disable-static"
>
>
> Run `bitbake -e' in the failure build could tell us.
>
> //Hongxu
>
> >> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> ---
> >>   ...1-fix-compiling-failure-on-mips64-n32-bsp.patch | 79 ++++++++++++=
++++++++++
> >>   meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb     |  7 ++
> >>   2 files changed, 86 insertions(+)
> >>   create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-fix-com=
piling-failure-on-mips64-n32-bsp.patch
> >>
> >> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-f=
ailure-on-mips64-n32-bsp.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-=
fix-compiling-failure-on-mips64-n32-bsp.patch
> >> new file mode 100644
> >> index 0000000..bc1af3c
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-=
on-mips64-n32-bsp.patch
> >> @@ -0,0 +1,79 @@
> >> +From 5ad700c92224193bfc789f7d53af38fc6f8b8904 Mon Sep 17 00:00:00 200=
1
> >> +From: Hongxu Jia <hongxu.jia@windriver.com>
> >> +Date: Thu, 19 Jul 2018 17:31:35 +0800
> >> +Subject: [PATCH] fix compiling failure on mips64-n32 bsp
> >> +
> >> +- Tweak mips64-n32 with mips32
> >> +
> >> +- The toolchain of mips64-n32 supports both of macro
> >> +  `__mips64' and `__mips__', but 32bit is required here.
> >> +
> >> +- N32 uses 64-bit registers but restricts addresses to 32 bits.
> >> +  https://www.linux-mips.org/pub/linux/mips/doc/ABI/MIPS-N32-ABI-Hand=
book.pdf
> >> +  Table 2-1 specifies the use of registers in n32 and native 64-bit m=
ode.
> >> +  From the table, N32 and N64 have the same registers
> >> +
> >> +Upstream-Status: Inappropriate [oe specific]
> >> +
> >> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> +---
> >> + build/moz.configure/init.configure                | 5 ++++-
> >> + js/src/jit/mips-shared/Architecture-mips-shared.h | 4 +++-
> >> + python/mozbuild/mozbuild/configure/constants.py   | 2 +-
> >> + 3 files changed, 8 insertions(+), 3 deletions(-)
> >> +
> >> +diff --git a/build/moz.configure/init.configure b/build/moz.configure=
/init.configure
> >> +index 6fe6591..a77b46c 100644
> >> +--- a/build/moz.configure/init.configure
> >> ++++ b/build/moz.configure/init.configure
> >> +@@ -357,7 +357,10 @@ def split_triplet(triplet):
> >> +         canonical_cpu =3D 'mips32'
> >> +         endianness =3D 'little' if 'el' in cpu else 'big'
> >> +     elif cpu in ('mips64', 'mips64el'):
> >> +-        canonical_cpu =3D 'mips64'
> >> ++        if 'n32' in triplet:
> >> ++            canonical_cpu =3D 'mips32'
> >> ++        else:
> >> ++            canonical_cpu =3D 'mips64'
> >> +         endianness =3D 'little' if 'el' in cpu else 'big'
> >> +     elif cpu.startswith('aarch64'):
> >> +         canonical_cpu =3D 'aarch64'
> >> +diff --git a/js/src/jit/mips-shared/Architecture-mips-shared.h b/js/s=
rc/jit/mips-shared/Architecture-mips-shared.h
> >> +index 7afe305..c6e29dc 100644
> >> +--- a/js/src/jit/mips-shared/Architecture-mips-shared.h
> >> ++++ b/js/src/jit/mips-shared/Architecture-mips-shared.h
> >> +@@ -24,6 +24,8 @@
> >> + #define USES_O32_ABI
> >> + #elif (defined(_MIPS_SIM) && (_MIPS_SIM =3D=3D _ABI64)) || defined(J=
S_SIMULATOR_MIPS64)
> >> + #define USES_N64_ABI
> >> ++#elif (defined(_MIPS_SIM) && (_MIPS_SIM =3D=3D _ABIN32))
> >> ++#define USES_N32_ABI
> >> + #else
> >> + #error "Unsupported ABI"
> >> + #endif
> >> +@@ -91,7 +93,7 @@ class Registers
> >> +         ta1 =3D t5,
> >> +         ta2 =3D t6,
> >> +         ta3 =3D t7,
> >> +-#elif defined(USES_N64_ABI)
> >> ++#elif defined(USES_N64_ABI) || defined(USES_N32_ABI)
> >> +         a4 =3D r8,
> >> +         a5 =3D r9,
> >> +         a6 =3D r10,
> >> +diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python=
/mozbuild/mozbuild/configure/constants.py
> >> +index dfc7cf8..27f83ab 100644
> >> +--- a/python/mozbuild/mozbuild/configure/constants.py
> >> ++++ b/python/mozbuild/mozbuild/configure/constants.py
> >> +@@ -83,8 +83,8 @@ CPU_preprocessor_checks =3D OrderedDict((
> >> +     ('hppa', '__hppa__'),
> >> +     ('sparc64', '__sparc__ && __arch64__'),
> >> +     ('sparc', '__sparc__'),
> >> +-    ('mips64', '__mips64'),
> >> +     ('mips32', '__mips__'),
> >> ++    ('mips64', '__mips64'),
> >> + ))
> >> +
> >> + assert sorted(CPU_preprocessor_checks.keys()) =3D=3D sorted(CPU.POSS=
IBLE_VALUES)
> >> +--
> >> +2.7.4
> >> +
> >> diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb b/meta-oe/=
recipes-extended/mozjs/mozjs_52.8.1.bb
> >> index 7909602..5996812 100644
> >> --- a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
> >> +++ b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
> >> @@ -15,12 +15,18 @@ SRC_URI =3D "http://archive.ubuntu.com/ubuntu/pool=
/main/m/mozjs52/mozjs52_52.8.1.o
> >>   SRC_URI_append_libc-musl =3D " \
> >>              file://0006-support-musl.patch \
> >>              "
> >> +SRC_URI_append_mipsarchn32 =3D " \
> >> +           file://0001-fix-compiling-failure-on-mips64-n32-bsp.patch =
\
> >> +           "
> >>
> >>   SRC_URI[md5sum] =3D "3a44c2fd3d7b5a370ed9184163c74bc4"
> >>   SRC_URI[sha256sum] =3D "fb5e11b7f31a33be820d5c947c5fa114751b0d503377=
8c1cd8e0cf2dad91e8fa"
> >>
> >>   inherit autotools pkgconfig perlnative pythonnative
> >>
> >> +inherit distro_features_check
> >> +CONFLICT_DISTRO_FEATURES_mipsarchn32 =3D "ld-is-gold"
> >> +
> >>   DEPENDS +=3D "nspr zlib"
> >>
> >>   # nspr's package-config is ignored so set libs manually
> >> @@ -31,6 +37,7 @@ EXTRA_OECONF =3D " \
> >>       --libdir=3D${libdir} \
> >>       --disable-tests \
> >>       --with-nspr-libs=3D'-lplds4 -lplc4 -lnspr4' \
> >> +    ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "--enable-g=
old", '--disable-gold', d)} \
> >>   "
> >>
> >>   PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)=
}"
> >> --
> >> 2.7.4
> >>
>

