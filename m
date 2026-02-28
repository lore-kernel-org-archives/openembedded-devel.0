Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8E2FEE4FF
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 20:26:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126275.1772310405621117540
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 12:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AHoqIeXK;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43945763558so2196354f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 12:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772310404; x=1772915204; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nJLhmd5QTGJ9ZBg8EZKQuCVFgsvks/izJLextAVckEM=;
        b=AHoqIeXKSivL1YfRtVTQQXOkAk6JPqGUcc9AWKD6y/PrvpXl2GtoHuq+vND1Bctmfc
         qdLTmnhiLYXumkfsG3/kd30bFN4RsJNzMsh5NhL4xxtFar5rlf/RJt7/xHx6pYMq/hj8
         oiUGQldZ2aJnSSVtasNmUzN+gDtwopEcftFuhfvRkG8giFxFC32ZbvRKd1gc0osNpOxP
         f1b1J7A2Gr8ooF5WTWLqhBbMCeQ94CabopmK69Ld8xK13/Fy6/tSWKTlAbcRe6B7vuk/
         5TbHGww6FPA3nAlmriX6yDuc41jOC0gXjEgq8yUXYeTBYkwl5mi8Uqa489uLGImcsYHM
         D7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772310404; x=1772915204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJLhmd5QTGJ9ZBg8EZKQuCVFgsvks/izJLextAVckEM=;
        b=c5By/fWcfPYtwtplDMYUfG60aoqgY4/opwUEj15UjmYp3WyY5SUwiTW+UMkWqiajJG
         hMGfLzGRcjhCOtZLf2RR8VAlaeJv6Fdjkg2OARbjk3qsxzlx0BmdIQmFKjZNBKfF9Kvg
         VtYKIq0zzkuTiPtl3X0e8581AKGztWHk4y9ZQcdRwN4HpP8KqKVRi6OgdHe7EM1kw5Fq
         UjDChx6f/Urv7A4N30UwHRdmfK/vYzrzxZOiVZXhJOV8/J+p7Z9zBNORNXLQz89LRG37
         WX/YNSQEmmXyiHWW4wlmhSkVqHbBJWml8YTKb2QowHZ/xv9f1a89wwoPfWpk7uvIzyea
         MacA==
X-Gm-Message-State: AOJu0Yy/HL2B0HJNsrI5UvfrY/P8/pcR3efVuThOllqcv7w1HGTGRoko
	3z/6p0vvZ8HOZR76xYBxJumjlG1mXi2vF3ml5K+PbxRREUN7LpmNOu+xRaudPg==
X-Gm-Gg: ATEYQzwzczj6x9nIE/Dzry6joYvScygKndzIoP/uSaz9wfriyMojTrvlEXYh9psMI/+
	0A+zqy9xtKyt1OD7tZUspBqYBzta4ckQMBnGVSEB5BUxnqMpxutG3QoUeFCVzjoR0viUXdGlFhv
	1IjHsPlJfQGNfUxwnQyxLrLZ38jAlWkW9vc+bULPJtcEHtZH8zfJXVi/GmaJsEKlLXmVVvZCqup
	We+jWWBPrpGq25PjXV4glRO7HLDi7YCF5npFoWnU3kizpRWJ0oSZHSbsCNsxPot3TgKW8uJz0SO
	TOU31IiWk3S/6mllkFo5jqfQXHLh1ceSjL7xcW1AF/nixZBuCfSXZCqdm3fc+Iq2zYYZsLYFQOY
	Cv4VZLhyN5sIBuZjzzZVJ5eftHsqMbSVNIKChtFSOXJwcJ6Tg9rB3xubId746IrEf84SFTLFAYC
	GFsvr4nPJ1m2BlJYDJVyFISum7ExhwDEs=
X-Received: by 2002:a5d:584f:0:b0:437:8fd6:d849 with SMTP id ffacd0b85a97d-4399de3a908mr12332028f8f.54.1772310403698;
        Sat, 28 Feb 2026 12:26:43 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70f8casm28682942f8f.14.2026.02.28.12.26.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 12:26:43 -0800 (PST)
Message-ID: <3164964e-458a-4a0d-845a-07ad46328a81@gmail.com>
Date: Sat, 28 Feb 2026 21:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] live555: set CVE_PRODUCT
To: openembedded-devel@lists.openembedded.org
References: <1891222EDB0CC87A.3765343@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1891222EDB0CC87A.3765343@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 20:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124790

ping

On 2/4/26 20:35, Gyorgy Sarvari via lists.openembedded.org wrote:
> live555 is an old project, it has multiple CPEs associated with.
>
> Set the ones in CVE_PRODUCT that are still active.
>
> See CVE db query:
>
> sqlite> select vendor, product, count(*) from products where vendor like '%live555%' or product like '%live555%' group by 1, 2;
> live555|liblivemedia|1
> live555|live555|7
> live555|live555_media_server|2
> live555|media_server|1
> live555|streaming_media|160
>
> All of them are relevant to this recipe, although media_server hasn't been used since 2007,
> that one wasn't set.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-oe/recipes-multimedia/live555/live555_20210824.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-multimedia/live555/live555_20210824.bb b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
> index 1622a97fe1..cd738f9575 100644
> --- a/meta-oe/recipes-multimedia/live555/live555_20210824.bb
> +++ b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
> @@ -13,6 +13,8 @@ URLV = "${@d.getVar('PV')[0:4]}.${@d.getVar('PV')[4:6]}.${@d.getVar('PV')[6:8]}"
>  SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz \
>             file://config.linux-cross"
>  
> +CVE_PRODUCT = "live555 live555_media_server live555:streaming_media live555:liblivemedia"
> +
>  # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
>  MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124145): https://lists.openembedded.org/g/openembedded-devel/message/124145
> Mute This Topic: https://lists.openembedded.org/mt/117641158/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


