Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1B33678B6B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 14:18:27 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o2-v6so6278487qkc.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 07:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Nc7m5T7DA3jcSqEvgNvE33MSqdUYv+MCzdT9FIKbJ98=;
	b=cr/1AKzJVRgaiMyUsbebDPPvyEHtD0RAFFFtGlV7FLeGLUOnr6nhvZF6IQv5wo8GrV
	sID9wB92i8cPXYfCN0GTgyJKttgWuMEL3MWadYmUSLha073YjWXApV+iJ63ae7g+1BkV
	h/7faCg/+70hiZA3YS2tNlIyv47anAlWmBAnPJznbOvdvc4ucL3hwhN4FQHjXTDhBCgq
	tIECddllzuifG2vOmx8l2iFfvG9lAsqORaeSjWTT+6+anlXvwavA4eBHcv7IRD5kqnPt
	JShmM3fifme7EYwKyaXyX+jiGzmGhkqFrMyJhLSSTegGvMc9MGGUi0yXjAHLtB3Vqk7Z
	aA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Nc7m5T7DA3jcSqEvgNvE33MSqdUYv+MCzdT9FIKbJ98=;
	b=oiUfDPh9HYuirtaAaEJmYkcVxIZkvI3w042vHSIgjNphDrfqKry8vWhtxbQMDowzXG
	7Dkg9gJRL9phGG9E8zkNDPsUheTgOrLAZ4JCZqCj6NBUq23zCgIVAaP/J8BsGsw9NmZz
	zrnUsdxYSQCQNEY7eB4G8RnJ1cbkXtF6d/KDSEQy9+gd7FPmTin7FZOq1j3NTv9CYkt+
	L3ASsnAvt2xTHGzYKWwVsZkIkAZkhsD7tOvACCcqagIX2ZrjeGYQWKyViJFLPw/63FzR
	DjcI/h1R3j5j1OprPCkZm8DsBdVZaFLrZLpjHD2MTcb1EuxnxLVtk2EiVyAMwAEUX5wu
	9++A==
X-Gm-Message-State: AOUpUlEEzQcoxS5PX/zbzZM4nls4agU6BzaToGuB38MY2/XMHSPLh82g
	I3OYPQA5vn77Ch+YAVa8i/o54mX0Wryj3LfAI7jWriR0
X-Google-Smtp-Source: AAOMgpfIKbhQjku3vu6H6/IizFCDWLq0a7q38Nt92PZ/H2p9iOF7x7Degap8PKTuvjTgwki/yFZrAsrvkh8tD1Nc3N4=
X-Received: by 2002:a37:417:: with SMTP id 23-v6mr1866103qke.12.1532096308606; 
	Fri, 20 Jul 2018 07:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <1532096077-26473-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1532096077-26473-1-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Jul 2018 07:18:02 -0700
Message-ID: <CAMKF1srz43sdVj_ZCOWFScFaBEmYYBoDMSSi+z0CLeeNgPCq4g@mail.gmail.com>
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
X-List-Received-Date: Fri, 20 Jul 2018 14:18:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 20, 2018 at 7:04 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> - Tweak configure for mips64-n32
>
> - Disable gold linker which not supported by mips64-n32
>
> - Since n32 and n64 use the same registers, add n32 to
>   n64's register definition.
>

btw. I am also seeing do_configure failure on qemumips

mozbuild.configure.options.InvalidOptionError: Unknown option: --disable-static


> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...1-fix-compiling-failure-on-mips64-n32-bsp.patch | 79 ++++++++++++++++++++++
>  meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb     |  7 ++
>  2 files changed, 86 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
> new file mode 100644
> index 0000000..bc1af3c
> --- /dev/null
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
> @@ -0,0 +1,79 @@
> +From 5ad700c92224193bfc789f7d53af38fc6f8b8904 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 19 Jul 2018 17:31:35 +0800
> +Subject: [PATCH] fix compiling failure on mips64-n32 bsp
> +
> +- Tweak mips64-n32 with mips32
> +
> +- The toolchain of mips64-n32 supports both of macro
> +  `__mips64' and `__mips__', but 32bit is required here.
> +
> +- N32 uses 64-bit registers but restricts addresses to 32 bits.
> +  https://www.linux-mips.org/pub/linux/mips/doc/ABI/MIPS-N32-ABI-Handbook.pdf
> +  Table 2-1 specifies the use of registers in n32 and native 64-bit mode.
> +  From the table, N32 and N64 have the same registers
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + build/moz.configure/init.configure                | 5 ++++-
> + js/src/jit/mips-shared/Architecture-mips-shared.h | 4 +++-
> + python/mozbuild/mozbuild/configure/constants.py   | 2 +-
> + 3 files changed, 8 insertions(+), 3 deletions(-)
> +
> +diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
> +index 6fe6591..a77b46c 100644
> +--- a/build/moz.configure/init.configure
> ++++ b/build/moz.configure/init.configure
> +@@ -357,7 +357,10 @@ def split_triplet(triplet):
> +         canonical_cpu = 'mips32'
> +         endianness = 'little' if 'el' in cpu else 'big'
> +     elif cpu in ('mips64', 'mips64el'):
> +-        canonical_cpu = 'mips64'
> ++        if 'n32' in triplet:
> ++            canonical_cpu = 'mips32'
> ++        else:
> ++            canonical_cpu = 'mips64'
> +         endianness = 'little' if 'el' in cpu else 'big'
> +     elif cpu.startswith('aarch64'):
> +         canonical_cpu = 'aarch64'
> +diff --git a/js/src/jit/mips-shared/Architecture-mips-shared.h b/js/src/jit/mips-shared/Architecture-mips-shared.h
> +index 7afe305..c6e29dc 100644
> +--- a/js/src/jit/mips-shared/Architecture-mips-shared.h
> ++++ b/js/src/jit/mips-shared/Architecture-mips-shared.h
> +@@ -24,6 +24,8 @@
> + #define USES_O32_ABI
> + #elif (defined(_MIPS_SIM) && (_MIPS_SIM == _ABI64)) || defined(JS_SIMULATOR_MIPS64)
> + #define USES_N64_ABI
> ++#elif (defined(_MIPS_SIM) && (_MIPS_SIM == _ABIN32))
> ++#define USES_N32_ABI
> + #else
> + #error "Unsupported ABI"
> + #endif
> +@@ -91,7 +93,7 @@ class Registers
> +         ta1 = t5,
> +         ta2 = t6,
> +         ta3 = t7,
> +-#elif defined(USES_N64_ABI)
> ++#elif defined(USES_N64_ABI) || defined(USES_N32_ABI)
> +         a4 = r8,
> +         a5 = r9,
> +         a6 = r10,
> +diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python/mozbuild/mozbuild/configure/constants.py
> +index dfc7cf8..27f83ab 100644
> +--- a/python/mozbuild/mozbuild/configure/constants.py
> ++++ b/python/mozbuild/mozbuild/configure/constants.py
> +@@ -83,8 +83,8 @@ CPU_preprocessor_checks = OrderedDict((
> +     ('hppa', '__hppa__'),
> +     ('sparc64', '__sparc__ && __arch64__'),
> +     ('sparc', '__sparc__'),
> +-    ('mips64', '__mips64'),
> +     ('mips32', '__mips__'),
> ++    ('mips64', '__mips64'),
> + ))
> +
> + assert sorted(CPU_preprocessor_checks.keys()) == sorted(CPU.POSSIBLE_VALUES)
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
> index 7909602..5996812 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
> @@ -15,12 +15,18 @@ SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mozjs52/mozjs52_52.8.1.o
>  SRC_URI_append_libc-musl = " \
>             file://0006-support-musl.patch \
>             "
> +SRC_URI_append_mipsarchn32 = " \
> +           file://0001-fix-compiling-failure-on-mips64-n32-bsp.patch \
> +           "
>
>  SRC_URI[md5sum] = "3a44c2fd3d7b5a370ed9184163c74bc4"
>  SRC_URI[sha256sum] = "fb5e11b7f31a33be820d5c947c5fa114751b0d5033778c1cd8e0cf2dad91e8fa"
>
>  inherit autotools pkgconfig perlnative pythonnative
>
> +inherit distro_features_check
> +CONFLICT_DISTRO_FEATURES_mipsarchn32 = "ld-is-gold"
> +
>  DEPENDS += "nspr zlib"
>
>  # nspr's package-config is ignored so set libs manually
> @@ -31,6 +37,7 @@ EXTRA_OECONF = " \
>      --libdir=${libdir} \
>      --disable-tests \
>      --with-nspr-libs='-lplds4 -lplc4 -lnspr4' \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "--enable-gold", '--disable-gold', d)} \
>  "
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> --
> 2.7.4
>

