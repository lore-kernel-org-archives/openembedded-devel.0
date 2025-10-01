Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81BDCCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 16:23:06 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.1445.1759335780527425127
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 09:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BbJy1H8D;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b5579235200so2842a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759335780; x=1759940580; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JfyaBPE3XcYiSTodID3dIMUl4mwR4NgwiBPiEkAAcoE=;
        b=BbJy1H8Dgo36+uDAd4l+TW/PIdVPOsdEcn91ymrTlLwxacz9EWm8Gx6te18E6TT/Pf
         QU+FkIU5+VZkiIGoAJFOK+MjfTyLgafDD3n3Ta7WCRNvP8Hee+AvpX5x9hB+V0yRAphJ
         TmnOTc4soC7OoDwdddSAl5x1/FfoRXXZw/7EV504p8GFCtgk8QOgS6+uC5DPJ6ZkEYCw
         TzLU65hTDEDfClfnz5zLmYVEuR2aEZz8nWagX7i2xbv1jZmtTQ9ZtEeIneKkMVvph7rd
         8k4FUJ5iE9X8Tay3M99yATFqWiAVJWzX4fxhbKx+DPjB8gsXj748OSVJcAmWXe5gk/Ov
         M/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759335780; x=1759940580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JfyaBPE3XcYiSTodID3dIMUl4mwR4NgwiBPiEkAAcoE=;
        b=T0Z0+z1K5P3nhSogPWy1+evrSR89ihbai3OjBhSZrneROxnDJt9wKLLCLgkxR6pKe1
         Pt3vMVcqmmvSylyrmpfLZ7nLXuP0wzffpkJJiW/86d7yRrOIyIAwJPoFjlxzdVhjCsLi
         IgipV1xib/v3a242kg7s+SyA2KAN+WOGTYnfZ7/cyxFbI1rnPiFaRCCjrrKuujSZIQi1
         2dSENpbMd7ImXZbSFC88Pa1e+nv8yMu8/lpfDfX4+rh+OlB1ZLU6N6BoPH3GT0+XiQL+
         qkXXGb8Wrrs+58rrlbQmQJb1RRvJATarPnVLkAvSwqmxdFHURmmU/ALDSU7WQWWOhzBD
         l2kA==
X-Forwarded-Encrypted: i=1; AJvYcCVj5RN8lGtA7ZJJzSnNlyra9qe3F9ZfnSJWh8M5/E12EyMe4rzoV415shY2GOc8nTp4UhXPh0rSm7+es5zvBpL5uY8=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx19HnS4aWRhVnGJ4ROVgvbzInqUes2U0mP709pOrAuAy59Ok/a
	3DyPdXc5eU96DYK90XnrNTI6M5A9A95aFLPS5IRq7Dv9KXnT20Z+/5zG
X-Gm-Gg: ASbGncvUtvzsyayrPiIoqwHzEMI/uRezl73cdNRfcsJoAaHMFFi9bhmugl2vlD502YO
	LktwPll8ncziD2Tr4icno0AJIjTEpp2nl2jm4qz3U3A15z2Uh8C7dgT5SWjbLgEwJ/hKxZZQeJe
	rFK5sdw/bQjh6zuxT719PsGB9lRVEtcSUKX1lH+sRPUoJFeeAmZNGG2MOtvAUp5Zzeei79SerFg
	zsd0wY4jlbmC2LGkfBEOIg94Z+X3n5SaYN9ajM8J2RxkCHbILuWPRVnZPfH7zu0TuTqOA7SapkD
	7GvmMeaAXKo0pT87CGFOTOGrfylDNz6nV2TcRTQr46Yn+8lOzHxEDnM0xDUnTIBm35DYIXhCc+p
	PXQVfjlCVDDam0l2UP0SBw7Hv3dv9pPZydNZ3wYP+ZcyY0KG7uKe/Z4fP4JGvij1d+TLcY5VuoN
	wm+GHtVNuKjIBRwNz8Fn/m+6Z1LbvUnRHUH8hJa9Hiq7aCepHLdwniNEvAo5P+7dvJR6pY8xnvG
	ra4qI3bHKOLJvpE9YnjbsV6X/R2XylH4VVCc131X5PzmPUkhKm14SA=
X-Google-Smtp-Source: AGHT+IHlLYcjxBIk44I8+u79uz36uBc1bqQ/7KQ5ShtMfrnSsGbkvQLFrnPby1sjUXKz+CyLvx0+eA==
X-Received: by 2002:a17:902:ef0a:b0:27b:defc:802d with SMTP id d9443c01a7336-28e7f48a31bmr55408325ad.28.1759335779727;
        Wed, 01 Oct 2025 09:22:59 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:8593:d4dc:f652:ce93? ([2601:646:8201:fd20:8593:d4dc:f652:ce93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d12c07asm760525ad.56.2025.10.01.09.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 09:22:59 -0700 (PDT)
Message-ID: <a799cdbe-54b5-484e-84e2-4a847236aa3d@gmail.com>
Date: Wed, 1 Oct 2025 09:22:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 0/3] openocd: Add dmem support and update
 dependencies
To: =?UTF-8?B?TGltYSwgSm/Do28=?= <joao.raul.434@gmail.com>,
 openembedded-devel@lists.openembedded.org, joao.lima@hbkworld.com
References: <20251001130452.542-1-joao.lima@hbkworld.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20251001130452.542-1-joao.lima@hbkworld.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 16:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120142



On 10/1/25 6:04 AM, Lima, João wrote:
> From: Joao Lima <joao.lima@hbkworld.com>
> 
> This patch series updates OpenOCD to support direct memory access (dmem)
> via SWD emulation for Texas Instruments AM64x and J784s4 platforms.
> 
> Changes include:
> 1. Version bumps:
>     - openocd: 91bd431 -> 66ea461
>     - jimtcl: fcbb449 -> f160866
>     - libjaylink: 9aa7a59 -> 0d23921
> 
> 2. Platform support patches:
>     - Add SWD native configuration files for AM64x and J784s4 boards
>     - Configure DMEM access parameters in ti_k3.cfg for direct memory operations
>     - Set up DAPBUS debugger and emulated AP descriptions
> 
> 3. Build configuration:
>     - Enable dmem adapter driver (--enable-dmem)
>     - Enable internal jimtcl (--enable-internal-jimtcl)
>     - Add both features to default PACKAGECONFIG
> 
> This enables self-hosted debug configurations where OpenOCD runs on one of
> the CPUs inside the SoC.
> 
> Upstream-Status: Submitted
> - http://openocd.zylin.com/#/c/9020/
> - http://openocd.zylin.com/#/c/9021/
> 
> Joao Lima (3):
>    openocd: bump the openocd, jimtcl versions
>    openocd: add dmem support to am64xx and j784s4 platforms
>    openocd: enable dmem and jimtcl
> 
>   ...wd_native.cfg-Add-support-for-direct.patch | 77 +++++++++++++++++++
>   ....cfg-Add-support-for-direct-memory-a.patch | 65 ++++++++++++++++
>   .../recipes-devtools/openocd/openocd_git.bb   | 13 +++-
>   3 files changed, 151 insertions(+), 4 deletions(-)
>   create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-tcl-board-ti_-_swd_native.cfg-Add-support-for-direct.patch
>   create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0002-tcl-target-ti_k3.cfg-Add-support-for-direct-memory-a.patch
> 


Thanks for the patchset, Please rebase it on latest master branch or 
master-next branch and resend. While resending send the whole series
together with git send-email *.patch or something so tools like 
patchwork and lore can record this as a series.

