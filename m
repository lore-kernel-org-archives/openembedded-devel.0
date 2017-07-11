Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 78AF877BF0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 14:35:12 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id 77so295551wrb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 07:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hzphfkIGBt1G8Lo25OuqSSqvU6mrBG4ZrL9X2tjxkQQ=;
	b=rFFDXKNoWQnfxBbFy2iyAxJeqh0Q+H7I0RTPHHAVUYa2z5v54oT/jBcPt8fRA47Yp2
	wYi4Dnhd4xQFjolr851nW5mOxRcNuqbjKGYN69hRJWPNw9xKN4KhpO8Pc2OKAtgw0ctp
	DNoFHcQRNoIv4T0xFHWfQsQ99WzPcQYq2fFzE4pbr4ooORbJBnHkR9OoMJ9MxlGH76Dj
	obyCTrJu6rWodclLuzdmkSkDROzBsk+9BhbAlAzpmRpVL6txEBsfOu55akGU3hVvda8R
	ym8JeYfAx9M4cLKm4lmZmMGkZPOwh5j5P+0+0b2NwWHNejx69HbfURMPx9Sh6aM+PX5n
	lxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hzphfkIGBt1G8Lo25OuqSSqvU6mrBG4ZrL9X2tjxkQQ=;
	b=E9vWDA49xBW1a/74g9PT3P7CGHdzxqJ7wVMPXLHUQzsrPIt/8uw5gMAesC3tyCi03G
	Jugrd/EypD81YyFilV4wq98gFEiF7gtO/BakZR7ap5qokRcNxwH+mx/xSmbpgbRz/8TP
	BFppwH3pguXyD0u0QiRBO0UJTpx6QTa8+21LuA1unzwgc9N3aZYW9xzLIHgZ2eqSkoEv
	g+jxddiojRACkgfp6/gNEXiVDNv9vvAkqxlrrRVQh3Q6iKJy7yaG6tovlJ7DxtLQtWRd
	PwRZUKDjgfD05oZdLFHHm2vncBvs2cNAwvvGov49YmQrpYaD4WMljopLHPECKrZTqH46
	HIOg==
X-Gm-Message-State: AIVw112PT2n25bagJxPpirsCJaF4QIt6wmGWaQJ/DVs27bvd3nD4KRXH
	wThLa2KTTm/HXDh5ofYjWQD+Po2Otw==
X-Received: by 10.80.146.154 with SMTP id k26mr2859969eda.23.1499783714010;
	Tue, 11 Jul 2017 07:35:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Tue, 11 Jul 2017 07:34:43 -0700 (PDT)
In-Reply-To: <CA+chaQcka+1Pjc7OJ=KVgAsyGdL7m05OThcpgXdCCThAWNcABA@mail.gmail.com>
References: <20170711045423.21332-1-raj.khem@gmail.com>
	<20170711045423.21332-2-raj.khem@gmail.com>
	<CA+chaQcka+1Pjc7OJ=KVgAsyGdL7m05OThcpgXdCCThAWNcABA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jul 2017 07:34:43 -0700
Message-ID: <CAMKF1sotTwfa1io40i_N=_9hjny74xthD7wuBUnptpxxrvXhBg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH V2 2/3] klibc: Fix build with musl
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
X-List-Received-Date: Tue, 11 Jul 2017 14:35:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 5:30 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Seems to break the build for qemuarm:
> http://errors.yoctoproject.org/Errors/Details/147256/
> http://errors.yoctoproject.org/Errors/Details/147257/
>

seems its digging gold again :)

> Also there is small typo in commit message "resepct"

good find

>
> On Tue, Jul 11, 2017 at 6:54 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> klibc failed to build with armv7+ when using thumb2
>> it needed to resepct TUNE_CCARGS
>>
>> Add patches to fix build with musl, to sort out
>> the linux header maze.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Andrea Adami <andrea.adami@gmail.com>
>> ---
>>  ...ine-in_-structs-for-non-glibc-system-libs.patch | 85
>> ++++++++++++++++++++++
>>  ...0001-dash-Specify-format-string-in-fmtstr.patch | 31 ++++++++
>>  .../0001-include-linux-sysinfo.h-directly.patch    | 32 ++++++++
>>  .../klibc-2.0.4/0001-mkfifo-Implement-mkfifo.patch | 29 ++++++++
>>  meta-initramfs/recipes-devtools/klibc/klibc.inc    | 34 ++++++---
>>  5 files changed, 200 insertions(+), 11 deletions(-)
>>  create mode 100644
>> meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch
>>  create mode 100644
>> meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch
>>  create mode 100644
>> meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch
>>  create mode 100644
>> meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-mkfifo-Implement-mkfifo.patch
>>
>> diff --git
>> a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch
>> b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch
>> new file mode 100644
>> index 000000000..8d1ec69ae
>> --- /dev/null
>> +++
>> b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch
>> @@ -0,0 +1,85 @@
>> +From f414dea1316a48aba3e8e293201ebd51652d3ef4 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sun, 9 Jul 2017 15:17:29 -0700
>> +Subject: [PATCH] Define in_* structs for non-glibc system libs
>> +
>> +These defines and structs are required to be coming from
>> +userspace netinet/in.h, which is being overridden in klibc
>> +however, libc-compat.h from kernel is only written keeping
>> +glibc in mind, and does not provide adequate guards for musl
>> +to infer that these structs should be defined in linux/in.h
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + usr/include/netinet/in.h | 33 +++++++++++++++++++++++++++++++++
>> + 1 file changed, 33 insertions(+)
>> +
>> +Index: git/usr/include/netinet/in.h
>> +===================================================================
>> +--- git.orig/usr/include/netinet/in.h
>> ++++ git/usr/include/netinet/in.h
>> +@@ -5,6 +5,42 @@
>> + #ifndef _NETINET_IN_H
>> + #define _NETINET_IN_H
>> +
>> ++#ifndef __GLIBC__
>> ++#include <linux/libc-compat.h>
>> ++
>> ++#undef __UAPI_DEF_IN_ADDR
>> ++#undef __UAPI_DEF_IN_IPPROTO
>> ++#undef __UAPI_DEF_IN_PKTINFO
>> ++#undef __UAPI_DEF_IP_MREQ
>> ++#undef __UAPI_DEF_SOCKADDR_IN
>> ++#undef __UAPI_DEF_IN_CLASS
>> ++#undef __UAPI_DEF_IN6_ADDR
>> ++#undef __UAPI_DEF_IN6_ADDR_ALT
>> ++#undef __UAPI_DEF_SOCKADDR_IN6
>> ++#undef __UAPI_DEF_IPV6_MREQ
>> ++#undef __UAPI_DEF_IPPROTO_V6
>> ++#undef __UAPI_DEF_IPV6_OPTIONS
>> ++#undef __UAPI_DEF_IN6_PKTINFO
>> ++#undef __UAPI_DEF_IP6_MTUINFO
>> ++#undef __UAPI_DEF_IF_IFREQ
>> ++
>> ++#define __UAPI_DEF_IN_ADDR      1
>> ++#define __UAPI_DEF_IN_IPPROTO   1
>> ++#define __UAPI_DEF_IN_PKTINFO   1
>> ++#define __UAPI_DEF_IP_MREQ      1
>> ++#define __UAPI_DEF_SOCKADDR_IN  1
>> ++#define __UAPI_DEF_IN_CLASS     1
>> ++#define __UAPI_DEF_IN6_ADDR     1
>> ++#define __UAPI_DEF_IN6_ADDR_ALT 1
>> ++#define __UAPI_DEF_SOCKADDR_IN6 1
>> ++#define __UAPI_DEF_IPV6_MREQ    1
>> ++#define __UAPI_DEF_IPPROTO_V6   1
>> ++#define __UAPI_DEF_IPV6_OPTIONS 1
>> ++#define __UAPI_DEF_IN6_PKTINFO  1
>> ++#define __UAPI_DEF_IP6_MTUINFO  1
>> ++#define __UAPI_DEF_IF_IFREQ     1
>> ++#endif
>> ++
>> + #include <klibc/extern.h>
>> + #include <stdint.h>
>> + #include <endian.h>           /* Must be included *before* <linux/in.h>
>> */
>> +Index: git/usr/include/net/if.h
>> +===================================================================
>> +--- git.orig/usr/include/net/if.h
>> ++++ git/usr/include/net/if.h
>> +@@ -1,6 +1,17 @@
>> + #ifndef _NET_IF_H
>> + #define _NET_IF_H
>> +
>> ++#ifndef __GLIBC__
>> ++#include <linux/libc-compat.h>
>> ++#undef __UAPI_DEF_IF_IFREQ
>> ++#define __UAPI_DEF_IF_IFREQ            1
>> ++#undef __UAPI_DEF_IF_IFNAMSIZ
>> ++#define __UAPI_DEF_IF_IFNAMSIZ         1
>> ++#undef __UAPI_DEF_IF_IFMAP
>> ++#define __UAPI_DEF_IF_IFMAP            1
>> ++#undef __UAPI_DEF_IF_NET_DEVICE_FLAGS
>> ++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS 1
>> ++#endif
>> + #include <sys/socket.h>
>> + #include <sys/types.h>
>> + #include <linux/if.h>
>> diff --git
>> a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch
>> b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch
>> new file mode 100644
>> index 000000000..ae8c1f11a
>> --- /dev/null
>> +++
>> b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch
>> @@ -0,0 +1,31 @@
>> +From 2fff607fd0b5550e5072a6fffcbb01c29d5207d2 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sun, 9 Jul 2017 13:51:25 -0700
>> +Subject: [PATCH] dash: Specify format string in fmtstr()
>> +
>> +Fixes build with hardening flags
>> +
>> +usr/dash/jobs.c:429:3: error: format not a string literal and no format
>> arguments [-Werror=format-security]
>> +   col = fmtstr(s, 32, strsignal(st));
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + usr/dash/jobs.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/usr/dash/jobs.c b/usr/dash/jobs.c
>> +index 009bbfee..299bcacc 100644
>> +--- a/usr/dash/jobs.c
>> ++++ b/usr/dash/jobs.c
>> +@@ -426,7 +426,7 @@ sprint_status(char *s, int status, int sigonly)
>> +                               goto out;
>> + #endif
>> +               }
>> +-              col = fmtstr(s, 32, strsignal(st));
>> ++              col = fmtstr(s, 32, "%s", strsignal(st));
>> + #ifdef WCOREDUMP
>> +               if (WCOREDUMP(status)) {
>> +                       col += fmtstr(s + col, 16, " (core dumped)");
>> +--
>> +2.13.2
>> +
>> diff --git
>> a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch
>> b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch
>> new file mode 100644
>> index 000000000..1b033acc4
>> --- /dev/null
>> +++
>> b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch
>> @@ -0,0 +1,32 @@
>> +From ab060a57b41f989665ade20e813bbcb67f91f1f2 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sun, 9 Jul 2017 15:56:28 -0700
>> +Subject: [PATCH] include linux/sysinfo.h directly
>> +
>> +This is done to avoid the kernel header linux/kernel.h to use
>> +__GLIBC__ define to decide on if libc implements sysinfo() API
>> +or not. Kernel headers should be independent of such assumptions
>> +but until its done in right place, change the local header
>> +override to avoid this assumption
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + usr/include/sys/sysinfo.h | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/usr/include/sys/sysinfo.h b/usr/include/sys/sysinfo.h
>> +index dba68dc6..d145c0b1 100644
>> +--- a/usr/include/sys/sysinfo.h
>> ++++ b/usr/include/sys/sysinfo.h
>> +@@ -5,7 +5,7 @@
>> + #ifndef _SYS_SYSINFO_H
>> + #define _SYS_SYSINFO_H
>> +
>> +-#include <linux/kernel.h>
>> ++#include <linux/sysinfo.h>
>> +
>> + extern int sysinfo(struct sysinfo *info);
>> +
>> +--
>> +2.13.2
>> +
>> diff --git
>> a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-mkfifo-Implement-mkfifo.patch
>> b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-mkfifo-Implement-mkfifo.patch
>> new file mode 100644
>> index 000000000..9791412e4
>> --- /dev/null
>> +++
>> b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-mkfifo-Implement-mkfifo.patch
>> @@ -0,0 +1,29 @@
>> +From b4e120f5edf06e6df138b1804a8b5180584cea6b Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Mon, 10 Jul 2017 20:42:50 -0700
>> +Subject: [PATCH] mkfifo: Implement mkfifo
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + usr/utils/mkfifo.c | 5 +++++
>> + 1 file changed, 5 insertions(+)
>> +
>> +diff --git a/usr/utils/mkfifo.c b/usr/utils/mkfifo.c
>> +index 5a758b2a..f1f577e6 100644
>> +--- a/usr/utils/mkfifo.c
>> ++++ b/usr/utils/mkfifo.c
>> +@@ -26,6 +26,11 @@ static int make_fifo(char *dir)
>> +       return 0;
>> + }
>> +
>> ++int mkfifo (const char *__p, mode_t __m)
>> ++{
>> ++      return mknod(__p, (__m & ~S_IFMT) | S_IFIFO, (dev_t) 0);
>> ++}
>> ++
>> + int main(int argc, char *argv[])
>> + {
>> +       int c, ret = 0;
>> +--
>> +2.13.2
>> +
>> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc
>> b/meta-initramfs/recipes-devtools/klibc/klibc.inc
>> index e039cb2c1..be59aa443 100644
>> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
>> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
>> @@ -7,17 +7,23 @@ LIC_FILES_CHKSUM =
>> "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8
>>  DEPENDS = "linux-libc-headers perl-native"
>>  SRCREV = "4d19974d7020488f63651244e1f9f51727c3f66c"
>>
>> -SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git"
>> -SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch \
>> -                                 file://armv4-fix-v4bx.patch \
>> -                                 "
>> -SRC_URI_append_linux-uclibceabi = " file://klibc-config-eabi.patch \
>> -                                    file://armv4-fix-v4bx.patch \
>> -                                    "
>> -SRC_URI += "file://klibc-linux-libc-dev.patch \
>> -            file://staging.patch \
>> -            file://klcc-consider-sysroot.patch \
>> -            "
>> +SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
>> +           ${ARMPATCHES} \
>> +           file://klibc-linux-libc-dev.patch \
>> +           file://staging.patch \
>> +           file://klcc-consider-sysroot.patch \
>> +           file://0001-dash-Specify-format-string-in-fmtstr.patch \
>> +           file://0001-Define-in_-structs-for-non-glibc-system-libs.patch
>> \
>> +           file://0001-include-linux-sysinfo.h-directly.patch \
>> +           file://0001-mkfifo-Implement-mkfifo.patch \
>> +"
>> +
>> +ARMPATCHES ?= ""
>> +
>> +ARMPATCHES_arm = "file://klibc-config-eabi.patch \
>> +                  file://armv4-fix-v4bx.patch \
>> +                 "
>> +
>>
>>  S = "${WORKDIR}/git"
>>
>> @@ -30,9 +36,12 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
>>                  'INSTALLROOT=${D}' \
>>                  'INSTALLDIR=${libdir}/klibc' \
>>                  'SHLIBDIR=${libdir}' \
>> +                '${KLIBCTHUMB}' \
>> +                'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
>>                  "
>>
>>  export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
>> +KLIBCTHUMB = "${@['',
>> 'CONFIG_KLIBC_THUMB=y'][(d.getVar('ARM_INSTRUCTION_SET') == 'thumb')]}"
>>
>>  do_configure () {
>>      ln -sf "${STAGING_DIR_TARGET}${exec_prefix}" linux
>> @@ -51,3 +60,6 @@ KLIBC_ARCH_x86-64 = "x86_64"
>>  KLIBC_ARCH_powerpc = "ppc"
>>  KLIBC_ARCH_powerpc64 = "ppc64"
>>  THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
>> +
>> +SECURITY_CFLAGS = "-fno-PIE -no-pie"
>> +SECURITY_LDFLAGS = "-no-pie"
>> --
>> 2.13.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

