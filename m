Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5C278925
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 15:22:45 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id 9-v6so1169939ple.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 08:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=m0UrF1GzXgNFZ0aK/cCf+1AFgZbilcLkqvJafWiRLOc=;
	b=hIUJMiXMX4LA/98Heop+O58RRzpbquELIp2MwF2biNQhKBnjqA0mFAZktXI3T+FOkW
	SZ9I2+626B2j+T9JzmOAu4YsrRBy1hRS6h0EprR89HvwsblWRbvF9fMesLrObRSbc5Lv
	XTvxSq2+AV5Ml+ThfQW0K9aHKXaqG7stfmCpAgRchvxTVzfhYNgAqFaxK5G22g8sL/n8
	hLx60JZbeHu1Fski1B0++pe9LfENYU3S6Loxev3QTfBquHAwT2TV4139lPCxUhNY4Uhr
	OGNMSeCdaTkL7/2UcBXK/vmkynk30KpUvTR+7SY6HRK/Y2jTtAfeUmkl1vbMGApHFw3s
	/tSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=m0UrF1GzXgNFZ0aK/cCf+1AFgZbilcLkqvJafWiRLOc=;
	b=pOOphcYw8pwzg8pME2HjyguQtZFKYcWXaEbpWiHsNaKiLvbjzTBvZfbZfsBv6FkE/E
	iDcsXJDlxeHD5AOpDdZLbreBev5wPLFxs512o2n5vzSf0Q9oaBziRhLPZtBQhQ1UxrVX
	Ls38WGvvbDzwy6LJEniA9eciGY7AL2tTAYCi7+7T3imBQKgpTtFJEKnDm4ajKOMAyTjv
	6bpbI/gXDOam4NC/E3+zOaEIvu7KC4B6PeNr6OK0MjOG0PEEixZF9QfJ4+/xw9VA3976
	xqt5IbZCIi6ApiyLedKt8aJFh036McWphY7udS5tzUoEUFSfX3fcXKttGT5jjhpiiU/+
	utUw==
X-Gm-Message-State: AElRT7HyIV0QQ22D1ohcpXz1ZXRgcIvBpK/AsCb+oReZXXORT3BLmBpo
	ck/eRXbxW7yuL0SXo0Lkn677mw==
X-Google-Smtp-Source: AG47ELtlblCf3oLiEL/fhfoB94YCHF+91hirHQcK9EZpUO5XPsZPZB7oXdT+m8XHoQcRgeD2KTlhXA==
X-Received: by 2002:a17:902:b183:: with SMTP id
	s3-v6mr16890370plr.108.1521559367228; 
	Tue, 20 Mar 2018 08:22:47 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:8158:483b:1716:87df?
	([2601:202:4000:1184:8158:483b:1716:87df])
	by smtp.gmail.com with ESMTPSA id
	184sm4367723pfg.124.2018.03.20.08.22.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Mar 2018 08:22:46 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20180319060300.5366-1-raj.khem@gmail.com>
	<20180319060300.5366-14-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <fb3b399e-822d-3820-b7f9-3f5eb9de3cd9@gmail.com>
Date: Tue, 20 Mar 2018 08:22:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180319060300.5366-14-raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH 14/18] flashrom: Upgrade to 1.0
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
X-List-Received-Date: Tue, 20 Mar 2018 15:22:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/18/2018 11:02 PM, Khem Raj wrote:
> - Fix build on risc-v
> - Drop upstreamed patches
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Please check SRC_URI

ERROR: flashrom-1.0-r0 do_fetch: Fetcher failure for URL:
'http://download.flashrom.org/releases/flashrom-1.0.tar.bz2'. Unable to
fetch URL from any source.

I tried wget of the same url and it failed.

- armin
> ---
>  .../flashrom/0001-Remove-undefined-behavior.patch  | 82 ----------------------
>  ...001-platform-Add-riscv-to-known-platforms.patch | 37 ++++++++++
>  ...fine-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch | 28 --------
>  .../{flashrom_0.9.9.bb => flashrom_1.0.bb}         |  7 +-
>  4 files changed, 40 insertions(+), 114 deletions(-)
>  delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-Remove-undefined-behavior.patch
>  create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-platform-Add-riscv-to-known-platforms.patch
>  delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch
>  rename meta-oe/recipes-bsp/flashrom/{flashrom_0.9.9.bb => flashrom_1.0.bb} (63%)
>
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-Remove-undefined-behavior.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-Remove-undefined-behavior.patch
> deleted file mode 100644
> index 51397dc55..000000000
> --- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-Remove-undefined-behavior.patch
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -From d2a03b3e43043b596a79803bcb93f70e513bbb50 Mon Sep 17 00:00:00 2001
> -From: Patrick Georgi <pgeorgi@google.com>
> -Date: Mon, 13 Mar 2017 13:48:03 +0100
> -Subject: [PATCH] Remove undefined behavior
> -
> -Per clang-3.9, the compiler fails on #define ...defined(...) statements
> -as they're undefined behavior (apparently with different behavior
> -between gcc/clang and msvc, too).
> -
> -See clang's cfe repo commit r258128 for details.
> -
> -Change-Id: I82b6235e11b425fae45eebbe06b08f81c5bdbb98
> -Signed-off-by: Patrick Georgi <pgeorgi@google.com>
> -Reviewed-on: https://review.coreboot.org/18792
> -Reviewed-by: Stefan Reinauer <stefan.reinauer@coreboot.org>
> -Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
> ----
> - hwaccess.c | 18 +++++++++++++++---
> - platform.h | 18 +++++++++++++++---
> - 2 files changed, 30 insertions(+), 6 deletions(-)
> -
> -diff --git a/hwaccess.c b/hwaccess.c
> -index aede7e3..2bf6f42 100644
> ---- a/hwaccess.c
> -+++ b/hwaccess.c
> -@@ -37,9 +37,21 @@
> - #error "Unknown operating system"
> - #endif
> - 
> --#define USE_IOPL	(IS_LINUX || IS_MACOSX || defined(__NetBSD__) || defined(__OpenBSD__))
> --#define USE_DEV_IO	(defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__))
> --#define USE_IOPERM	(defined(__gnu_hurd__))
> -+#if IS_LINUX || IS_MACOSX || defined(__NetBSD__) || defined(__OpenBSD__)
> -+#define USE_IOPL 1
> -+#else
> -+#define USE_IOPL 0
> -+#endif
> -+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
> -+#define USE_DEV_IO 1
> -+#else
> -+#define USE_DEV_IO 0
> -+#endif
> -+#if defined(__gnu_hurd__)
> -+#define USE_IOPERM 1
> -+#else
> -+#define USE_IOPERM 0
> -+#endif
> - 
> - #if USE_IOPERM
> - #include <sys/io.h>
> -diff --git a/platform.h b/platform.h
> -index c5a52ef..b2fdcd0 100644
> ---- a/platform.h
> -+++ b/platform.h
> -@@ -25,9 +25,21 @@
> - #define __PLATFORM_H__ 1
> - 
> - // Helper defines for operating systems
> --#define IS_LINUX	(defined(__gnu_linux__) || defined(__linux__))
> --#define IS_MACOSX	(defined(__APPLE__) && defined(__MACH__)) /* yes, both. */
> --#define IS_WINDOWS	(defined(_WIN32) || defined(_WIN64) || defined(__WIN32__) || defined(__WINDOWS__))
> -+#if defined(__gnu_linux__) || defined(__linux__)
> -+#define IS_LINUX 1
> -+#else
> -+#define IS_LINUX 0
> -+#endif
> -+#if defined(__APPLE__) && defined(__MACH__) /* yes, both. */
> -+#define IS_MACOSX 1
> -+#else
> -+#define IS_MACOSX 0
> -+#endif
> -+#if defined(_WIN32) || defined(_WIN64) || defined(__WIN32__) || defined(__WINDOWS__)
> -+#define IS_WINDOWS 1
> -+#else
> -+#define IS_WINDOWS 0
> -+#endif
> - 
> - // Likewise for target architectures
> - #if defined (__i386__) || defined (__x86_64__) || defined(__amd64__)
> --- 
> -2.13.3
> -
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-platform-Add-riscv-to-known-platforms.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-platform-Add-riscv-to-known-platforms.patch
> new file mode 100644
> index 000000000..7ba69a917
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/flashrom/flashrom/0001-platform-Add-riscv-to-known-platforms.patch
> @@ -0,0 +1,37 @@
> +From d2a28dcdbd1051d2f48320e2eda3393581fe0519 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 17 Mar 2018 23:08:29 -0700
> +Subject: [PATCH] platform: Add riscv to known platforms
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Submitted [https://review.coreboot.org/#/c/flashrom/+/25260/]
> + platform.h | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/platform.h b/platform.h
> +index b2fdcd0..2cadbb3 100644
> +--- a/platform.h
> ++++ b/platform.h
> +@@ -69,6 +69,9 @@
> + #elif defined (__m68k__)
> + 	#define __FLASHROM_ARCH__ "m68k"
> + 	#define IS_M68K 1
> ++#elif defined (__riscv)
> ++	#define __FLASHROM_ARCH__ "riscv"
> ++	#define IS_RISCV 1
> + #elif defined (__sh__)
> + 	#define __FLASHROM_ARCH__ "sh"
> + 	#define IS_SH 1
> +@@ -77,7 +80,7 @@
> + 	#define IS_S390 1
> + #endif
> + 
> +-#if !(IS_X86 || IS_MIPS || IS_PPC || IS_ARM || IS_SPARC || IS_ALPHA || IS_HPPA || IS_M68K || IS_SH || IS_S390)
> ++#if !(IS_X86 || IS_MIPS || IS_PPC || IS_ARM || IS_SPARC || IS_ALPHA || IS_HPPA || IS_M68K || IS_RISCV || IS_SH || IS_S390)
> + #error Unknown architecture
> + #endif
> + 
> +-- 
> +2.16.2
> +
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch
> deleted file mode 100644
> index 4170fefd2..000000000
> --- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 7c65a465a3ddeb7afb9a7c49d010ae7e5d5b1ad1 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 18 Jul 2017 20:25:49 -0700
> -Subject: [PATCH] spi: Define _XOPEN_SOURCE to enable ffs() libc API
> -
> -musl exposes this issue
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - spi.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/spi.c b/spi.c
> -index 894f73f..aeb6518 100644
> ---- a/spi.c
> -+++ b/spi.c
> -@@ -21,7 +21,7 @@
> - /*
> -  * Contains the generic SPI framework
> -  */
> --
> -+#define _XOPEN_SOURCE
> - #include <strings.h>
> - #include <string.h>
> - #include "flash.h"
> --- 
> -2.13.3
> -
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_0.9.9.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
> similarity index 63%
> rename from meta-oe/recipes-bsp/flashrom/flashrom_0.9.9.bb
> rename to meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
> index 4cdd8ad23..6f5c037a8 100644
> --- a/meta-oe/recipes-bsp/flashrom/flashrom_0.9.9.bb
> +++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
> @@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  DEPENDS = "pciutils libusb libusb-compat"
>  
>  SRC_URI = "http://download.flashrom.org/releases/flashrom-${PV}.tar.bz2 \
> -           file://0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch \
>             file://sst26.patch \
> -           file://0001-Remove-undefined-behavior.patch \
> +           file://0001-platform-Add-riscv-to-known-platforms.patch \
>             "
> -SRC_URI[md5sum] = "aab9c98925d9cfb5ffb28b67a6112530"
> -SRC_URI[sha256sum] = "cb3156b0f63eb192024b76c0814135930297aac41f80761a5d293de769783c45"
> +SRC_URI[md5sum] = "42d999990c735d88653627cefcc13b9a"
> +SRC_URI[sha256sum] = "3702fa215ba5fb5af8e54c852d239899cfa1389194c1e51cb2a170c4dc9dee64"
>  
>  inherit pkgconfig
>  


