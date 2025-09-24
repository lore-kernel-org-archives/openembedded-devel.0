Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7AECAC5B0
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 10:22:36 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.9234.1758709353611917644
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 03:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gVhql/6u;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62fd0d29e2bso8049233a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 03:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758709352; x=1759314152; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1bXIi9YXBJ66/PJZLlxfr8/O5CkrjXu4+x0wYDnZxs=;
        b=gVhql/6uC2bcHdls7Qwgfc/EVSHG11lzcHtZq/7JcNw+Phn2ruE9CQLAqB76C0ipoK
         O9auy1NnJQ9SAcP0GmgmSf4xWexhiQ7LjQqLEz97mW1YwofGWH6Kdd3dZey5sS0bvnHF
         FnarksYyfojPEKPgiZVsEoCPglOp6Nf7/cXLnAQljc2d9adG2Mg3T+8+z2BtD7OXGCyP
         /ko8gBC8UhCwXJJ70ozfU8bbbT4ipLdKkDuRmRpI58PTn30uccv/NvBDZoXscPL04eeT
         h9FSM7RAwGXjue1Eu2KMMfJH5nC9TKTjiD3cO6ws3+9sWf3XYYlA2fw9a1qeRpy79eKp
         zJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709352; x=1759314152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1bXIi9YXBJ66/PJZLlxfr8/O5CkrjXu4+x0wYDnZxs=;
        b=TV9TjcVqaysbR21aOFvoT6GdlaAQaxoezWxKf4QvPSqQppYjr9iftOMH2+WOuYnqaI
         G52HvtZ1mLHY2z9+fM9hH72TW1V13ObTOIBGEoEFgiQC/eES0bHqXs4V7LUnph22u1X8
         QxH4l0/xYXhs/T7y8jKTOusv4kRo8H7LDl3hJi9JXlaCEjBWPr05IGP1Njbm684XPgka
         wBXd8iP7ULis5mL0ndTdC8HAcRxdjP/nxcVLkQcNb0gLIPRumfGyZH1DHQ7mgQrr/W3w
         ERp1DhVtP76oPJJsTlXVEaeE9+5mKARSXfkNs4m/ZuwQx+wdlbVdTVK82AIC/uFp/Jrd
         /goQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh3QCRApT53u6jKS3VhzKe4LdtMTLzX8P0TtqAWW3w9FNr+UgzY+ulSXdLfYI4yASRHMs0gGy0uXhDrOdALfLnxi4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyUp1RDTZc6XmOEFCsMnVgTQm4hUhVMAYvCLI593G0lYAhgt3Uu
	shZAat1mzzeeCT81zEzd2mSTuz/7epa7IeRY0lWubaKGbPyFWXORdmXL
X-Gm-Gg: ASbGncvWJ7D0QGbdW05WZG2BcHivrgk5lbuBuGXaNSf96Z96c7GZamYRphMs6KQrBo0
	e18FmE+mHf9JABLoCIXY24zMjZO290IPSYN4vKTzLY7HsZLM9eyY2xPpc15H7JLNQU0ia8b5fxS
	NRsvW5IPLNMY+poG/IT89rvTMrLH8Wqla1FzaxeXggWT13ZvwGVQJ+lqIXTmJ7XELwDGRtuH4/6
	pGJKumymVqFEXGCKYMJkHxfXngm+w1ebLoRzlHsWb4LLHBgoos4UAe/YYLclbrRKzXqXSFP0SvB
	neD4acpSnqnBda6Y007OOU8UluLsKCEguXzSAao0Pf2OB6Dxpe9T5xZw+Cdun6/zOrimCZ82Zu4
	s7HYMx2qvNilFRvgatrnn48fuHIMfE/4=
X-Google-Smtp-Source: AGHT+IFYEVTKTgmcvz8ZVaElJSHR5E+yGGhPUOwWaky0L3ozeJiHxrBw2a6BUZoKZrDTn84cjkVPVA==
X-Received: by 2002:a05:6402:5046:b0:626:8e29:8d42 with SMTP id 4fb4d7f45d1cf-63467a1a9cbmr4595475a12.37.1758709351467;
        Wed, 24 Sep 2025 03:22:31 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-633148d2df3sm6843715a12.30.2025.09.24.03.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 03:22:30 -0700 (PDT)
Message-ID: <2dbed234-0810-49d1-b7f1-570f9cfc9882@gmail.com>
Date: Wed, 24 Sep 2025 12:22:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][walnascar][PATCH 5/6] ledmon: upgrade 0.97 -> 1.1.0
To: Ankur Tyagi <ankur.tyagi85@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
 <20250924075643.2047506-6-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250924075643.2047506-6-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 10:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119799

This update does some api refactoring[1] - at least one library function
is removed and another has a different return type. This version bump
looks too big for stable branch - if it fixes something important, a
separate patch would be better IMO.

[1]:
https://github.com/intel/ledmon/commit/fec14ba294307eb98798941d5e3ca04ff2a501fb

On 9/24/25 09:56, Ankur Tyagi wrote:
> From: Gyorgy Sarvari <skandigraun@gmail.com>
>
> Dropped 0001-fix-build-with-clang.patch, because it is included in this release.
>
> This update also fixes building for x86 platform.
>
> Changelog:
> https://github.com/intel/ledmon/blob/main/CHANGELOG.md
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 219f5c96cc744c73b732ddfb7c62d0448aa565ae)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../ledmon/0001-fix-build-with-clang.patch    | 90 -------------------
>  ...nclude-sys-select.h-and-sys-types.h.patch} | 27 ++----
>  .../{ledmon_0.97.bb => ledmon_1.1.0.bb}       | 10 +--
>  3 files changed, 13 insertions(+), 114 deletions(-)
>  delete mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch
>  rename meta-oe/recipes-bsp/ledmon/ledmon/{0002-include-sys-select.h-and-sys-types.h.patch => 0001-include-sys-select.h-and-sys-types.h.patch} (56%)
>  rename meta-oe/recipes-bsp/ledmon/{ledmon_0.97.bb => ledmon_1.1.0.bb} (79%)
>
> diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch
> deleted file mode 100644
> index f1e1d6f780..0000000000
> --- a/meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -From 28fd86fb4e18af181174176530a80672de4449d2 Mon Sep 17 00:00:00 2001
> -From: alperak <alperyasinak1@gmail.com>
> -Date: Sat, 18 Nov 2023 12:27:17 +0300
> -Subject: [PATCH] fix build with clang
> -
> -struct ibpi2value is a structure which contains 2 unsigned integers.  In
> -a number of cases the code was not initializing a value for the last value
> -in the pair in struct ibpi2value ibpi_to_attention.  This was raised when
> -using clang compiler.
> -
> -vmdssd.c:49:27: error: missing field 'value' initializer
> -[-Werror,-Wmissing-field-initializers]
> -        {LED_IBPI_PATTERN_UNKNOWN}
> -
> -dellssd.c:74:27: error: missing field 'value' initializer
> -[-Werror,-Wmissing-field-initializers]
> -        {LED_IBPI_PATTERN_UNKNOWN}
> -
> -amd_ipmi.c:57:27: error: missing field 'value'
> -initializer [-Werror,-Wmissing-field-initializers]
> -        {LED_IBPI_PATTERN_UNKNOWN}
> -
> -npem.c:76:27: error: missing field 'value'
> -initializer [-Werror,-Wmissing-field-initializers]
> -        {LED_IBPI_PATTERN_UNKNOWN}
> -
> -Upstream-Status: Submitted [https://github.com/intel/ledmon/pull/179]
> -Signed-off-by: alperak <alperyasinak1@gmail.com>
> ----
> - src/amd_ipmi.c | 2 +-
> - src/dellssd.c  | 2 +-
> - src/npem.c     | 2 +-
> - src/vmdssd.c   | 2 +-
> - 4 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/amd_ipmi.c b/src/amd_ipmi.c
> -index 726f77d..ad36e9e 100644
> ---- a/src/amd_ipmi.c
> -+++ b/src/amd_ipmi.c
> -@@ -53,7 +53,7 @@ const struct ibpi2value ibpi2amd_ipmi[] = {
> - 	{IBPI_PATTERN_FAILED_ARRAY, 0x45},
> - 	{IBPI_PATTERN_REBUILD, 0x46},
> - 	{IBPI_PATTERN_HOTSPARE, 0x47},
> --	{IBPI_PATTERN_UNKNOWN}
> -+	{IBPI_PATTERN_UNKNOWN, 0}
> - };
> - 
> - #define MG9098_CHIP_ID_REG	0x63
> -diff --git a/src/dellssd.c b/src/dellssd.c
> -index 3c10ec7..7f02ea1 100644
> ---- a/src/dellssd.c
> -+++ b/src/dellssd.c
> -@@ -71,7 +71,7 @@ static const struct ibpi2value ibpi2ssd[] = {
> - 	{IBPI_PATTERN_FAILED_DRIVE, BP_FAULT | BP_ONLINE},
> - 	{IBPI_PATTERN_LOCATE, BP_IDENTIFY | BP_ONLINE},
> - 	{IBPI_PATTERN_LOCATE_OFF, BP_ONLINE},
> --	{IBPI_PATTERN_UNKNOWN}
> -+	{IBPI_PATTERN_UNKNOWN, 0}
> - };
> - 
> - #define DELL_OEM_NETFN                      0x30
> -diff --git a/src/npem.c b/src/npem.c
> -index c21276d..3499169 100644
> ---- a/src/npem.c
> -+++ b/src/npem.c
> -@@ -72,7 +72,7 @@ const struct ibpi2value ibpi_to_npem_capability[] = {
> - 	{IBPI_PATTERN_FAILED_DRIVE, PCI_NPEM_FAIL_CAP},
> - 	{IBPI_PATTERN_LOCATE, PCI_NPEM_LOCATE_CAP},
> - 	{IBPI_PATTERN_LOCATE_OFF, PCI_NPEM_OK_CAP},
> --	{IBPI_PATTERN_UNKNOWN}
> -+	{IBPI_PATTERN_UNKNOWN, 0}
> - };
> - 
> - static struct pci_access *get_pci_access()
> -diff --git a/src/vmdssd.c b/src/vmdssd.c
> -index 51af591..9c63d90 100644
> ---- a/src/vmdssd.c
> -+++ b/src/vmdssd.c
> -@@ -45,7 +45,7 @@ struct ibpi2value ibpi_to_attention[] = {
> - 	{IBPI_PATTERN_REBUILD, ATTENTION_REBUILD},
> - 	{IBPI_PATTERN_LOCATE_OFF, ATTENTION_OFF},
> - 	{IBPI_PATTERN_ONESHOT_NORMAL, ATTENTION_OFF},
> --	{IBPI_PATTERN_UNKNOWN}
> -+	{IBPI_PATTERN_UNKNOWN, 0}
> - };
> - 
> - #define SYSFS_PCIEHP         "/sys/module/pciehp"
> --- 
> -2.25.1
> -
> diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0002-include-sys-select.h-and-sys-types.h.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-include-sys-select.h-and-sys-types.h.patch
> similarity index 56%
> rename from meta-oe/recipes-bsp/ledmon/ledmon/0002-include-sys-select.h-and-sys-types.h.patch
> rename to meta-oe/recipes-bsp/ledmon/ledmon/0001-include-sys-select.h-and-sys-types.h.patch
> index 75bf2b4f5e..833f38a042 100644
> --- a/meta-oe/recipes-bsp/ledmon/ledmon/0002-include-sys-select.h-and-sys-types.h.patch
> +++ b/meta-oe/recipes-bsp/ledmon/ledmon/0001-include-sys-select.h-and-sys-types.h.patch
> @@ -9,16 +9,19 @@ sys/types.h is needed for ssize_t
>  Upstream-Status: Pending
>  
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Adapted to latest release - sys/types.h is already included in the project.
> +
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>  ---
>   src/dellssd.c | 1 +
> - src/utils.h   | 1 +
> - 2 files changed, 2 insertions(+)
> + 1 file changed, 1 insertion(+)
>  
> -diff --git a/src/dellssd.c b/src/dellssd.c
> +diff --git a/src/lib/dellssd.c b/src/lib/dellssd.c
>  index 7b8d431..e97fe45 100644
> ---- a/src/dellssd.c
> -+++ b/src/dellssd.c
> -@@ -27,6 +27,7 @@
> +--- a/src/lib/dellssd.c
> ++++ b/src/lib/dellssd.c
> +@@ -13,6 +13,7 @@
>   #include <unistd.h>
>   
>   #include <sys/ioctl.h>
> @@ -26,18 +29,6 @@ index 7b8d431..e97fe45 100644
>   #include <linux/ipmi.h>
>   
>   #if _HAVE_DMALLOC_H
> -diff --git a/src/utils.h b/src/utils.h
> -index 720447a..c106529 100644
> ---- a/src/utils.h
> -+++ b/src/utils.h
> -@@ -21,6 +21,7 @@
> - #define _UTILS_H_INCLUDED_
> - 
> - #include <getopt.h>
> -+#include <sys/types.h>
> - #include "config_file.h"
> - #include "stdlib.h"
> - #include "stdint.h"
>  -- 
>  2.21.0
>  
> diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb b/meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
> similarity index 79%
> rename from meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
> rename to meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
> index 23a49a7d1b..eba5428856 100644
> --- a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
> +++ b/meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
> @@ -8,18 +8,16 @@ HOMEPAGE = "https://github.com/intel/ledmon"
>  LICENSE = "LGPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>  
> -DEPENDS = "sg3-utils udev pciutils"
> +DEPENDS = "autoconf-archive-native sg3-utils udev pciutils"
>  
>  inherit autotools systemd pkgconfig
>  
>  SYSTEMD_SERVICE:${PN} = "ledmon.service"
>  
> -SRC_URI = "git://github.com/intel/ledmon;branch=master;protocol=https \
> -	   file://0002-include-sys-select.h-and-sys-types.h.patch \
> -	   file://0001-fix-build-with-clang.patch \
> -	   file://Correct-get_uint64.patch"
> +SRC_URI = "git://github.com/intel/ledmon;branch=master;protocol=https;tag=v${PV} \
> +	   file://0001-include-sys-select.h-and-sys-types.h.patch"
>  
> -SRCREV = "b0edae14e8660b80ffe0384354038a9f62e2978d"
> +SRCREV = "f70201d255b667de00f15880e99732699df6dce0"
>  
>  COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>  COMPATIBLE_HOST:libc-musl = "null"


