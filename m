Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D26CAC5B0
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 10:00:06 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.9079.1758708000307477596
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 03:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OIaXvQ9c;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso11240037a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758707999; x=1759312799; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MEDIyVYjEcKA/TUD86f+h7fvsUESmncxnBMuBW3j6Ak=;
        b=OIaXvQ9c+sHQmSr17eRX7yyVrpLWyTHx8jlhCXGiz9ZA/aD6rkNHfSVRS+1ElY2aYb
         YsYAe01C7u+9ZDYdfJJv+wJTl4u2yViP82xesXAswfQuQW1o15C5rdfrwnFmAkpDmFtd
         elgYB5/jpv3TEIlASJTc4wmWrXH5q4g3fbtj4dP0DfD85YUyjmPU8kDJ1QwrGqoYCKwf
         dhwq6OintDzrQvKOQ1zv2M0SKxoXzeiHJgFeMsCEzs/cFTsAAzmAd3RuAIeZdVgtIh5n
         u3ogzuQ6SKAooU0eEtw1O9t3L7dnsHhB1tkwRfvlHDTL+Fq5Fcxq1N9KwUWPiHhJ/+zH
         3GcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758707999; x=1759312799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MEDIyVYjEcKA/TUD86f+h7fvsUESmncxnBMuBW3j6Ak=;
        b=YK7WMsrnDpVkn+hAOcQ8g7PIVKQpGUmt1mBSjazyRppDUqFexp2hEhv9WjesL8+P/M
         wYDivtHvWBv5NHTrJk0rVogJQjK/iVinWDq5k12E0F/Tdd0Hb71Hug4hkskJ2/GD5oK3
         UKC09a1uGVfXdiprQRGeQeuUTCxBeF3A+LWIZe4N9dq3oepl8VzmMy+DzEmrhUtZLBiZ
         wb0bfU27nrwXlxrRYhRWOjxWS+uw+1QSC3Mqg7+8DP0muv4BBc9JBsfU5dOp209i1gYd
         qnkpXoIP4cXCjc2DZrul5aC6wiAbJStwTpcT9MHTTDelJPDJktHHniXUHBy5pd6IFA9V
         0OVw==
X-Forwarded-Encrypted: i=1; AJvYcCUdKAokjJD28+1hdmSjgFelxJt4nLUOv4VBE7zOsoul11kVEx5SFznEerQmFVI3xZUK8kbStOx7Ls9EKLrO0EksMds=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyys4hrP7VNMq7w5EqKBE2vM9mbXk+X2/V1idj4N/x8khYPGyxm
	YZvA0TuRQv7FPZoWUiZ2eDEE9fPnO1fYXjO9MowSHhXB3mQphA+1Fvgw
X-Gm-Gg: ASbGncs+hk8hcs0ijuk5ZSgXgPxd7B30K/FJxPUPnmVmP6VCsbAFoYfzyC7nyFGNN2Y
	N0SaxLmGRv5eYwWen4c71djsTWPHwQObV9OWFKGyAnpeHBLpV9qDbmAvzA25HvY8tE5cqYuk0eG
	b3Y8PH2HmWsajSi6PSptamsiShgxuQ1wE95GooDyovj19V/lo9tjAuQzoEUmvZmcx7OFbFNer++
	HRl1YnntBuwu2vMtthy/EJU6dNBgvel5yZnkt8u3AlbcPFIB4dJ1D22Nn0BnInamGSAscYiZGVm
	ccZ7IWcFYAhnjGBVTLKStbuk6mHm9xV30mNLmQyXZ/c39L5CoH3M5HZnbt9E/J6oLDyw0Vqp57O
	vUJlg9LMK5DdqdOejQfvkVBliCwqc984=
X-Google-Smtp-Source: AGHT+IEllpkwppfYIrRX47NKbduvaTlQwbyXObi1WbcWVF3m6yptZp2XiCUidfMFhQbi4fZCpMCa+A==
X-Received: by 2002:a05:6402:42c8:b0:634:544b:a740 with SMTP id 4fb4d7f45d1cf-634677eab0emr5643545a12.22.1758707998467;
        Wed, 24 Sep 2025 02:59:58 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5f1221fsm12822408a12.32.2025.09.24.02.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 02:59:58 -0700 (PDT)
Message-ID: <6ff96dff-9cde-4e69-a7cb-b9617f25b51d@gmail.com>
Date: Wed, 24 Sep 2025 11:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][walnascar][PATCH 2/6] flashrom: upgrade 1.5.1 ->
 1.6.0
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <raj.khem@gmail.com>
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
 <20250924075643.2047506-3-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250924075643.2047506-3-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 10:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119797

This one came with a lot of new features and changes, including some cli
changes, and it also deprecated some APIs from the previous version. I'd
rather leave this in master.

On 9/24/25 09:56, Ankur Tyagi via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0002-meson-Add-options-pciutils-ftdi-usb.patch
> refreshed for 1.6.0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit d03d56c13e3245933bf2308276deefe03279b4cd)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  ...02-meson-Add-options-pciutils-ftdi-usb.patch | 17 ++++++++---------
>  .../{flashrom_1.5.1.bb => flashrom_1.6.0.bb}    |  2 +-
>  2 files changed, 9 insertions(+), 10 deletions(-)
>  rename meta-oe/recipes-bsp/flashrom/{flashrom_1.5.1.bb => flashrom_1.6.0.bb} (89%)
>
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
> index 8dfed855b4..b1dd5d0773 100644
> --- a/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
> +++ b/meta-oe/recipes-bsp/flashrom/flashrom/0002-meson-Add-options-pciutils-ftdi-usb.patch
> @@ -1,7 +1,7 @@
> -From 3ea99c117aa4c7a3502c93e4e4df50b3623e46c3 Mon Sep 17 00:00:00 2001
> +From 5cf5fc64c6aab35b89b8cf7f69b84b6f5100d7a6 Mon Sep 17 00:00:00 2001
>  From: Patrick Rudolph <patrick.rudolph@9elements.com>
>  Date: Tue, 15 Oct 2024 10:42:05 +0200
> -Subject: [PATCH 2/2] meson: Add options pciutils, ftdi, usb
> +Subject: [PATCH] meson: Add options pciutils, ftdi, usb
>  
>  The options have been dropped in favor of an array option called programmer.
>  Since this doesn't integrate well into yocto add back the old options.
> @@ -16,10 +16,10 @@ Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>   2 files changed, 6 insertions(+), 3 deletions(-)
>  
>  diff --git a/meson.build b/meson.build
> -index 6c8d3d3..61b794d 100644
> +index 35feb33..b5bb722 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -150,9 +150,9 @@ systems_serial     = [ 'linux', 'openbsd', 'freebsd', 'dragonfly', 'netbsd', 'da
> +@@ -140,9 +140,9 @@ systems_serial     = [ 'linux', 'openbsd', 'freebsd', 'dragonfly', 'netbsd', 'da
>   
>   cpus_port_io = [ 'x86', 'x86_64' ]
>   
> @@ -33,10 +33,10 @@ index 6c8d3d3..61b794d 100644
>   group_serial = get_option('programmer').contains('group_serial')
>   group_jlink  = get_option('programmer').contains('group_jlink')
>  diff --git a/meson_options.txt b/meson_options.txt
> -index 87456a9..570b152 100644
> +index 2829cd1..0e9d769 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
> -@@ -24,4 +24,7 @@ option('ni845x_search_path', type : 'string', value : 'C:\Program Files (x86)\Na
> +@@ -26,6 +26,9 @@ option('ni845x_search_path', type : 'string', value : 'C:\Program Files (x86)\Na
>   option('delay_minimum_sleep_us', type : 'integer', min : 0, value : 100,
>          description : 'Minimum time in microseconds to suspend execution for (rather than polling) when a delay is required.'
>                      + ' Larger values may perform better on machines with low timer resolution, at the cost of increased power.')
> @@ -44,6 +44,5 @@ index 87456a9..570b152 100644
>  +option('usb', type : 'boolean', value : false, description : 'Select programmer group usb')
>  +option('ftdi', type : 'boolean', value : false, description : 'Select programmer group ftdi')
>   option('rpmc', type : 'feature', value : 'auto', description : 'Support for Replay Protected Monotonic Counter (RPMC) commands as specified by JESD260')
> --- 
> -2.43.0
> -
> + option('log_message_length_limit', type : 'integer', min : 64, max : 1024, value : 256,
> +        description : 'Log message length limit for v2 logging API')
> diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.6.0.bb
> similarity index 89%
> rename from meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
> rename to meta-oe/recipes-bsp/flashrom/flashrom_1.6.0.bb
> index 9a8e81bae3..4f07da79c6 100644
> --- a/meta-oe/recipes-bsp/flashrom/flashrom_1.5.1.bb
> +++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.6.0.bb
> @@ -7,7 +7,7 @@ SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.xz \
>             file://0002-meson-Add-options-pciutils-ftdi-usb.patch \
>             "
>  
> -SRC_URI[sha256sum] = "1f934b076ed49eace203655ec249fc7861a6b8e87fe4aef732e47b6e485b6293"
> +SRC_URI[sha256sum] = "8b9db3987df9b5fc81e70189d017905dd5f6be1e1410347f22687ab6d4c94423"
>  
>  S = "${WORKDIR}/flashrom-v${PV}"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119757): https://lists.openembedded.org/g/openembedded-devel/message/119757
> Mute This Topic: https://lists.openembedded.org/mt/115408375/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


