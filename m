Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587CDC47BCB
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 08:58:57 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86143.1767689930533043863
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 00:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iIybW4xL;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2e77f519so427191f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 00:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767689929; x=1768294729; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j4AtNnbsAxwjKNjn4WpalREcBp10tSxZ4vuJ4QZWGT8=;
        b=iIybW4xLqIOGyksJ6VLhq9PcLEYJAod+tttkF1B4MxWCtckLYBTEgrPryXHCETh6wr
         cVKu4sPMHrBLuMExQQFRjB0jADZ/CqrJUIcKBZxHp72iJjIOeXXvLy3IgQYjJ3y2Va+r
         FrJ4wIcMNpJpV4JmbMSP2FCaITzjrfrpD6tYJE1akIa7bIsWYlHoqHgrEmbOkJVPZPSt
         4FOIjQDZG/oE5wydhVuRMEOBzR1QtCfwVFDoRh/W39ix/KDys+EhA//kPd+14g9XNMG7
         wad2Yg+oQ6iImt9EPcIPQ1DON5LV243fLnO2ueQ/XSUc9Kn3jPDC+07OpjP318nE3tgO
         Kq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689929; x=1768294729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4AtNnbsAxwjKNjn4WpalREcBp10tSxZ4vuJ4QZWGT8=;
        b=aOOj//knbeSOFKHkgLtqE45a7Wgw3YDmiIf0TuAEIvH+XTbC9kZV6KS0Pq+iYdiDeL
         jGu9/nq2V722ZrAKdgIRkL+C/EiuL3euPc1y9UfdwNQ8JVghmdGXdDSs7FNSmr5cE35Z
         haQ+3iBsdaleKbqes4g4Nlcuv6VCENWLt1sBnZgSDC/suzNq9j60VCf+Oo8pMzZap6Eg
         2xzoBLwYtYL+04xvD2xPJwMhe+wifw8pipznBsCdTGpj8MpMaawfEcW7ygN1ic3jpbFG
         iYWNNODLyQipL8npbg+Z+t90DQx9sL0dTaoOvvCymodyznG88nx8ms8ihFz2XlDX0qJu
         ADwQ==
X-Gm-Message-State: AOJu0YxxSD/qYRJXvDOfhinlyx1+9vYQ6iXWWNSA49+kqEDi+yhRu3Zg
	m1xl1306LspOkjIJ+LqvP8wGkEDD/MVfp82c7yXIDz7VLKdBdDJXxUje
X-Gm-Gg: AY/fxX7EPvfF+Nf6VSG7b6qLpCo4C+QARdXDWUcFSj2/7vIgsuBxxjKbdKFWkD19eVF
	Y9HcU8vaw9eqzryC3q/oRutVdObE7FYSGYc7IomH6JrbEuArnMu0r9cdDm4KbTpHzu3JBWeuMag
	KeB/pn6jD+dwozQ6lg3UfAhd7VEogVG+ul0GiPPEEwc5BHFmdJDQYMdCY5/1mDAn254nZaITbUC
	IpwxpoKM5VlIQp6T1MK62x1WCRcDc9KOwoJRiwJYjWSf53WRxtSuNdN09Rb14KslJKhbwsiduf4
	jScz099AD61P8z+fzPjlehiz0QQ4xkqEeW2nrdT6Pjaxk6STDQe7VxWC8UxzdykinEsJvhW5aNm
	XGH5lEVuYwjRBO6nc0LfCKh9CmDex0ap32ZHl3fqbaQJscfDU0hb7ffJiml3i6Yys8gDpcuNhsz
	bf2hmYXVskPU+ZkR0Sn6A=
X-Google-Smtp-Source: AGHT+IE8XcmN3Hs5ZG3XYup8ZOO6LnGwNJqILQJY6ZxlFp3CSy0HbfpfEocr6GYoE9sJbctuzesdBw==
X-Received: by 2002:a05:6000:2884:b0:431:808:2d49 with SMTP id ffacd0b85a97d-432bc9cc8dbmr2425188f8f.8.1767689928377;
        Tue, 06 Jan 2026 00:58:48 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16ffsm3242147f8f.12.2026.01.06.00.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 00:58:47 -0800 (PST)
Message-ID: <1d9c77dd-c059-4624-b978-b0fc6e68aa85@gmail.com>
Date: Tue, 6 Jan 2026 09:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][whinlatter][PATCH 04/17] gimp: patch
 CVE-2025-14422
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260105100237.3081345-1-skandigraun@gmail.com>
 <20260105100237.3081345-4-skandigraun@gmail.com>
 <CADySD0Gv8qkYZuYtuuu+5FCdM1gcvNcjmTjskMdNG6rAusemcg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CADySD0Gv8qkYZuYtuuu+5FCdM1gcvNcjmTjskMdNG6rAusemcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 08:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123168

I don't really see the relation between these and the gimp patches...

For mozjs you could take a look at this[1] patch - I believe it solves
the same problem.
For libjxl, Khem has commited a line some time ago[2] that touches
CFLAGS. Try to do the same, but for CXXFLAGS.

[1]:
https://github.com/OSSystems/meta-browser/blob/master/meta-firefox/recipes-browser/firefox/firefox/0001-add-musl-support.patch
[2]:
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-multimedia/libjxl/libjxl_0.11.1.bb#n47

On 1/6/26 05:42, Ankur Tyagi wrote:
> Hi Gyorgy,
>
> This is causing following build failures on qemuarm with musl and clang
>
> mozjs:
> | /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810:(.text._ZL15unwind_callbackP15_Unwind_ContextPv+0x4):
> undefined reference to `_Unwind_GetIP'
> | arm-poky-linux-musleabi-clang++: error: linker command failed with
> exit code 1 (use -v to see invocation)
>
> libjxl:
> FAILED: [code=1] lib/CMakeFiles/jxl_dec-obj.dir/jxl/convolve_separable5.cc.o
> /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/recipe-sysroot-native/usr/bin/arm-poky-linux-musleabi/arm-poky-linux-musleabi-clang++
> --sysroot=/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/recipe-sysroot
> -DFJXL_ENABLE_AVX512=0 -DJXL_INTERNAL_LIBRARY_BUILD
> -D__DATE__=\"redacted\" -D__TIMESTAMP__=\"redacted\"
> -D__TIME__=\"redacted\"
> -I/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/sources/libjxl-0.11.1
> -isystem /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/build/lib/include
> -mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a15
> --dyld-prefix=/usr -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2
> -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64
> -D_FILE_OFFSET_BITS=64
> --sysroot=/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/recipe-sysroot
>  -O2 -g   -ffile-prefix-map=/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/sources/libjxl-0.11.1=/usr/src/debug/libjxl/0.11.1
>  -ffile-prefix-map=/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/build=/usr/src/debug/libjxl/0.11.1
>  -ffile-prefix-map=/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/recipe-sysroot=
>  -ffile-prefix-map=/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/recipe-sysroot-native=
>  -pipe -fvisibility-inlines-hidden -fno-rtti -DNDEBUG -std=c++17 -fPIC
> -fvisibility=hidden -fvisibility-inlines-hidden
> -fmacro-prefix-map=/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/sources/libjxl-0.11.1=.
> "-DHWY_DISABLED_TARGETS=(HWY_SSSE3|HWY_AVX3|HWY_AVX3_SPR|HWY_AVX3_ZEN4)"
> -funwind-tables -Xclang -mrelax-all -fno-omit-frame-pointer
> -Wno-builtin-macro-redefined -Wall -fmerge-all-constants
> -fno-builtin-fwrite -fno-builtin-fread -Wextra -Wc++11-compat
> -Warray-bounds -Wformat-security -Wimplicit-fallthrough -Wno-register
> -Wno-unused-function -Wno-unused-parameter -Wnon-virtual-dtor
> -Woverloaded-virtual -Wvla -Wdeprecated-increment-bool
> -Wfloat-overflow-conversion -Wfloat-zero-conversion
> -Wfor-loop-analysis -Wgnu-redeclared-enum -Winfinite-recursion
> -Wliteral-conversion -Wno-c++98-compat
> -Wno-unused-command-line-argument -Wprivate-header -Wself-assign
> -Wstring-conversion -Wtautological-overlap-compare
> -Wthread-safety-analysis -Wundefined-func-template -Wunreachable-code
> -Wunused-comparison -fsized-deallocation -fno-exceptions -fmath-errno
> -fnew-alignment=8 -fno-cxx-exceptions -fno-slp-vectorize
> -fno-vectorize -disable-free -disable-llvm-verifier
> -DJPEGXL_ENABLE_SKCMS=1 -DJPEGXL_ENABLE_TRANSCODE_JPEG=1
> -DJPEGXL_ENABLE_BOXES=1 -MD -MT
> lib/CMakeFiles/jxl_dec-obj.dir/jxl/convolve_separable5.cc.o -MF
> lib/CMakeFiles/jxl_dec-obj.dir/jxl/convolve_separable5.cc.o.d -o
> lib/CMakeFiles/jxl_dec-obj.dir/jxl/convolve_separable5.cc.o -c
> /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/sources/libjxl-0.11.1/lib/jxl/convolve_separable5.cc
> error: out of range pc-relative fixup value
> 1 error generated.
> ninja: build stopped: subcommand failed.
>
> It builds on qemux86 with musl and clang though.
>
> Having said that, I don't think the problem is due to your patch as
> gimp fails to build on qemuarm with musl and clang even without your
> patches.
>
> So this needs to be investigated separately.
>
> cheers
> Ankur
>
> On Mon, Jan 5, 2026 at 11:02 PM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14422
>>
>> Pick the patch referenced by the NVD report.
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit a0b41204afe57f9b2b3f2e8ff496be72d04e0eb7)
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  .../gimp/gimp/CVE-2025-14422.patch            | 66 +++++++++++++++++++
>>  meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb    | 12 ++--
>>  2 files changed, 73 insertions(+), 5 deletions(-)
>>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
>>
>> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
>> new file mode 100644
>> index 0000000000..420e013916
>> --- /dev/null
>> +++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
>> @@ -0,0 +1,66 @@
>> +From 0a941cab81396d65a8ab547847f8c542039e214f Mon Sep 17 00:00:00 2001
>> +From: Gyorgy Sarvari <skandigraun@gmail.com>
>> +Date: Sun, 23 Nov 2025 16:43:51 +0000
>> +Subject: [PATCH] plug-ins: Fix ZDI-CAN-28273
>> +
>> +From: Alx Sa <cmyk.student@gmail.com>
>> +
>> +Resolves #15286
>> +Adds a check to the memory allocation
>> +in pnm_load_raw () with g_size_checked_mul ()
>> +to see if the size would go out of bounds.
>> +If so, we don't try to allocate and load the
>> +image.
>> +
>> +CVE: CVE-2025-14422
>> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/4ff2d773d58064e6130495de498e440f4a6d5edb]
>> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> +---
>> + plug-ins/common/file-pnm.c | 13 +++++++++++--
>> + 1 file changed, 11 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/plug-ins/common/file-pnm.c b/plug-ins/common/file-pnm.c
>> +index 32a33a4..9d349e9 100644
>> +--- a/plug-ins/common/file-pnm.c
>> ++++ b/plug-ins/common/file-pnm.c
>> +@@ -674,7 +674,7 @@ load_image (GFile   *file,
>> +             GError **error)
>> + {
>> +   GInputStream    *input;
>> +-  GeglBuffer      *buffer;
>> ++  GeglBuffer      *buffer    = NULL;
>> +   GimpImage * volatile image = NULL;
>> +   GimpLayer       *layer;
>> +   char             buf[BUFLEN + 4];  /* buffer for random things like scanning */
>> +@@ -708,6 +708,9 @@ load_image (GFile   *file,
>> +       g_object_unref (input);
>> +       g_free (pnminfo);
>> +
>> ++      if (buffer)
>> ++        g_object_unref (buffer);
>> ++
>> +       if (image)
>> +         gimp_image_delete (image);
>> +
>> +@@ -1060,6 +1063,7 @@ pnm_load_raw (PNMScanner *scan,
>> +   const Babl   *format = NULL;
>> +   gint          bpc;
>> +   guchar       *data, *d;
>> ++  gsize         data_size;
>> +   gushort      *s;
>> +   gint          x, y, i;
>> +   gint          start, end, scanlines;
>> +@@ -1070,7 +1074,12 @@ pnm_load_raw (PNMScanner *scan,
>> +     bpc = 1;
>> +
>> +   /* No overflow as long as gimp_tile_height() < 1365 = 2^(31 - 18) / 6 */
>> +-  data = g_new (guchar, gimp_tile_height () * info->xres * info->np * bpc);
>> ++  if (! g_size_checked_mul (&data_size, gimp_tile_height (), info->xres) ||
>> ++      ! g_size_checked_mul (&data_size, data_size, info->np)             ||
>> ++      ! g_size_checked_mul (&data_size, data_size, bpc))
>> ++    CHECK_FOR_ERROR (FALSE, info->jmpbuf, _("Unsupported maximum value."));
>> ++
>> ++  data = g_new (guchar, data_size);
>> +
>> +   input = pnmscanner_input (scan);
>> +
>> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
>> index 9f38cdcd03..f529930dff 100644
>> --- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
>> +++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
>> @@ -56,11 +56,13 @@ GIDOCGEN_MESON_OPTION = "gi-docgen"
>>  GIDOCGEN_MESON_ENABLE_FLAG = "enabled"
>>  GIDOCGEN_MESON_DISABLE_FLAG = "disabled"
>>
>> -SRC_URI = "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz"
>> -SRC_URI += "file://0001-gimp-cross-compile-fix-for-bz2.patch"
>> -SRC_URI += "file://0002-meson.build-reproducibility-fix.patch"
>> -SRC_URI += "file://0001-meson.build-dont-check-for-lgi.patch"
>> -SRC_URI += "file://0001-meson.build-require-iso-codes-native.patch"
>> +SRC_URI = "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz \
>> +           file://0001-gimp-cross-compile-fix-for-bz2.patch \
>> +           file://0002-meson.build-reproducibility-fix.patch \
>> +           file://0001-meson.build-dont-check-for-lgi.patch \
>> +           file://0001-meson.build-require-iso-codes-native.patch \
>> +           file://CVE-2025-14422.patch \
>> +           "
>>  SRC_URI[sha256sum] = "246c225383c72ef9f0dc7703b7d707084bbf177bd2900e94ce466a62862e296b"
>>
>>  PACKAGECONFIG[aa] = "-Daa=enabled,-Daa=disabled,aalib"
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#123135): https://lists.openembedded.org/g/openembedded-devel/message/123135
>> Mute This Topic: https://lists.openembedded.org/mt/117084023/3619737
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ankur.tyagi85@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


