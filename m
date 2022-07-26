Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09649C00144
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 13:51:44 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.6819.1658843496812019852
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 06:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=op2Bx8SO;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 v16-20020a17090abb9000b001f25244c65dso9981958pjr.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 06:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=oiOMS0lbY++U4y0+/TV06VwFtAl1tvPo3Sl5zUEjZqU=;
        b=op2Bx8SOn3PqyjI7j3GTjJcVfjCPFQXKOefASmJqBecbOUxcLDElto5Y55xI7GqWrP
         d5Wy+sWA8VnJnW07YyshfD9XQl8/XmhAmSO5qiHmR4j+Nm9kjsgfG9HlCvCa3xGNWYNo
         rU+LdLnxHRKGNZrc/QzVyt+elb1O8uSK1NKHuHhqgmmxDx0dKAk9k5lCNOPSOK8fSN3o
         CHRQSOGwi7o1vnbtoIIaPX3bsDII/HHqZ08D7tJ9BgEj018qav05MtlulpyloU/fAQLP
         yLihTBoHlugr4E6spGJlF5LwjVjFgz3AzEuxERxJZbL3TNVCO9NWNpwR2lLGPkGL6jd9
         9aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oiOMS0lbY++U4y0+/TV06VwFtAl1tvPo3Sl5zUEjZqU=;
        b=qpJvK6L6zMQlKnuEsf4eYgaFgf8wOk7AhkUrYWZdenmu81Na5CeO9MeDXVEpzIF7pi
         qhEOVj/RVkDk+pJARYw/Zz5Ns3U57cF5Ir+4X95YGZDoEI/8NJPn5U7/6f2FOnX8AB+z
         vCfxsQQUd5RupPYSWAJhLPJ423ISoWnY0bnC66+WlxqHqWQEXP/3lYlC87CZ3DKzUavd
         w11pxgxZK2qZ/UZjs1iYG9Zl/7RgpKzu22VhmosQi7DtXIwpvSsVAWQFVFXI5PB0tWXP
         Yd98D3ga8fBCm5Qvyk13K6uwNuVSZpo6YLEw6RW/2eXMJ2R0a13r2OVqkz0zmPmIT5p+
         r7fA==
X-Gm-Message-State: AJIora9FiEhempFXMBWsWRyhtkxz50d8vWYPn3QRkY/B4jxJXINbnwWf
	O3BWZOSMKOS4HYY9xed17Z0=
X-Google-Smtp-Source: 
 AGRyM1vnn1tNSYJ4bqsqs771iziHwPizxqkOGm89B6zkkYTaiV5k8cpOGomPgKbr5QVnOwo3tfpmWg==
X-Received: by 2002:a17:902:f682:b0:16d:a4d6:6d05 with SMTP id
 l2-20020a170902f68200b0016da4d66d05mr1781436plg.18.1658843496210;
        Tue, 26 Jul 2022 06:51:36 -0700 (PDT)
Received: from [192.168.18.39] (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 j66-20020a625545000000b005289cade5b0sm11752644pfb.124.2022.07.26.06.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 06:51:34 -0700 (PDT)
Message-ID: <cb4a9e15-3339-f708-8f24-c41e68869ace@gmail.com>
Date: Tue, 26 Jul 2022 06:49:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe] [meta-oe] [PATCH] googlebenchmark: upgrade 1.6.1 -> 1.6.2
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1658554568-9257-1-git-send-email-wangmy@fujitsu.com>
 <1658554568-9257-4-git-send-email-wangmy@fujitsu.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <1658554568-9257-4-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 13:51:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97990



On 7/22/22 22:36, wangmy wrote:
> License-Update:
> Update LICENSE file to clearly state which file needs BSD 3
> Only benchmark/config/generate_export_header.bzl depends on BSD 3-Clause License:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   .../{googlebenchmark_1.6.1.bb => googlebenchmark_1.6.2.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-support/googlebenchmark/{googlebenchmark_1.6.1.bb => googlebenchmark_1.6.2.bb} (76%)
>
> diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.2.bb
> similarity index 76%
> rename from meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb
> rename to meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.2.bb
> index b44d3bee27..11f09c6fd6 100644
> --- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb
> +++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.2.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "A microbenchmark support library"
>   HOMEPAGE = "https://github.com/google/benchmark"
>   SECTION = "libs"
>   LICENSE = "Apache-2.0"

Shouldn't the LICENSE be updated to include BSD then?
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0f6f3bbd074b822ddbb3b4d0e7f8d652"
>   
>   SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main"
> -SRCREV = "0d98dba29d66e93259db7daa53a9327df767a415"
> +SRCREV = "d845b7b3a27d54ad96280a29d61fa8988d4fddcf"
>   
>   S = "${WORKDIR}/git"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97976): https://lists.openembedded.org/g/openembedded-devel/message/97976
> Mute This Topic: https://lists.openembedded.org/mt/92620754/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


