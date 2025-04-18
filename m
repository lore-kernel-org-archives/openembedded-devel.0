Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056CEC369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:52:37 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.10265.1744977147852053435
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pb+2W0FD;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso3365434a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744977146; x=1745581946; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WTxS/yrrEsXv+W/ZnZdwIvAjX3zj0vaZxxdbA6kfvTc=;
        b=Pb+2W0FDPqRAmi6EIJcCK/ZmEqfDiV14lej7ygv5+ZVmoHzwEo19FVZHJhS+HMQ/78
         /Bvv4fXHgqQTi4gWhPJGL3I27ByQc0obgmQOa0DqmIVYtEoCEJnIcsxhIzU4bWpO3/5u
         k/UH+RRKT9VAsl4HBtyLQGrJAUGK1GGXWARWVD01t8hKaLDE9hFyCvpXh89iSSE55HeL
         erCjfXFr6N4HuSa433a4a1d9Dij1V1iywk9jPvfstUHaGd67oX/paSQK024Sdorf7RrU
         1RWnlt4ATXGYy1JQgUyC28sa4rXdCQ+3ldomsof31741vCAkYwKR89vMOC52IQyhiZU3
         nzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744977146; x=1745581946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WTxS/yrrEsXv+W/ZnZdwIvAjX3zj0vaZxxdbA6kfvTc=;
        b=YCQd71mE071KbZlk0UtdEbOqEoFTm7rtacl3faOgvkqQy5zENBNbFZzm9ZWw8Ju0fE
         hW/Et3BfaNG9nPUVlOPcy//qmHaDFr1O2f1poaY5TcSLXG267+C/3o2U7S6qNK7HxXzG
         nEdMNCyfSLuWct0vZrIbCy/6mCIoZTiyEkNuGLB1dHZyeQxez4EFE4a20N76k4hcPO/8
         UzFGnmm95GeE4eg22XuioBydnXQuHb/BDJFI7iDzPnWk5KFitAQis2Sdf8Vdlha5ivt7
         aV/HaSGqp684Uj5FoA9DVxH2+LASFXApBdsgd+UqidJAVNepZRUrZm3wEVhZf0+PXWJa
         5y0w==
X-Gm-Message-State: AOJu0YxAGefWEdgYYXlPuYjYGzwLu70RiL2AJ8p1e85QboTH58ipXrih
	nums6zN7comoJkn9hbtkC6fmEEir5/kzMnVfW8xvKhlGf3+LR3cK
X-Gm-Gg: ASbGncspbP4k4BW5UxuuNHSB1CV6RuL7wOqfQUFKnM0wNCx6M6Tr4SP49AldotS6nYV
	4VmP+1XcvCpiohhfOp0U7npmidd+CAyPhHjuYktTtW/+GCVvfwAwmx+mQVPKcNCSmb0dT8WrHR7
	aVasDzrKX68rM4w350neoKh91ZogYUkbh88YaaXtCvodOTrJSAOatjBNfEfILAyTcxaCSDWW/oN
	BRobDjIXLA6sDzlclJdjrQNHV2kq1Ab0R/yx4KgYIRSKKk0p2WngFVasBSjfqbjpSZE/M2Uq5aA
	MQlYuXObkLCxnnrJ9hUy3e0TLUBsoHu6KPMXo/gtiBLqC1Pe
X-Google-Smtp-Source: AGHT+IGZ5KvWfwhFxxhI3Kvyx6hiE69GpWZz+HZwHfZ35t21aLB1Rg9+FYHuZ+bpuEJRgGRs8IQwCw==
X-Received: by 2002:a05:6402:34ce:b0:5dc:7823:e7e4 with SMTP id 4fb4d7f45d1cf-5f628520a49mr1929923a12.12.1744977145781;
        Fri, 18 Apr 2025 04:52:25 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625577bb7sm906618a12.23.2025.04.18.04.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 04:52:25 -0700 (PDT)
Message-ID: <3274dc53-62ed-4efc-bb0d-c92f6657c62a@gmail.com>
Date: Fri, 18 Apr 2025 13:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/5] can-utils: Split mcp251fd*
 into sub-package
To: alb3rt0.m3rciai@gmail.com, akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
 Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
 Mark Jonas <mark.jonas@de.bosch.com>, Khem Raj <raj.khem@gmail.com>
References: <20250418113148.142480-1-alb3rt0.m3rciai@gmail.com>
 <20250418113148.142480-3-alb3rt0.m3rciai@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250418113148.142480-3-alb3rt0.m3rciai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116963

Don't know if you had any discussions about this outside of this mailing
list (such updates are not in line with the LTS/Stable policy, but I
guess there can be exceptions...). However at least this looks like a
breaking change - if anyone is using these tools in their project, after
this update most likely they will face errors. Not a huge breaking
change, but still one, nevertheless.

On 4/18/25 13:31, Alberto Merciai via lists.openembedded.org wrote:
> From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
>
> The mcp251fd* tools are specific to Microchip MCP251xFD Family CAN
> controllers. This commit creates the package can-utils-mcp251fd to keep
> these tools separate.
>
> Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
> index cad41944ec..932aa1de20 100644
> --- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
> +++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
> @@ -20,6 +20,7 @@ PACKAGES =+ " \
>      ${PN}-isotp \
>      ${PN}-j1939 \
>      ${PN}-log \
> +    ${PN}-mcp251xfd \
>      ${PN}-slcan \
>  "
>  
> @@ -56,6 +57,10 @@ FILES:${PN}-j1939 = " \
>  
>  FILES:${PN}-log = "${bindir}/*log*"
>  
> +FILES:${PN}-mcp251xfd = " \
> +    ${bindir}/mcp251xfd* \
> +"
> +
>  FILES:${PN}-slcan = "${bindir}/slcan*"
>  
>  ALTERNATIVE:${PN} = "candump cansend cansequence"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116953): https://lists.openembedded.org/g/openembedded-devel/message/116953
> Mute This Topic: https://lists.openembedded.org/mt/112329372/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


