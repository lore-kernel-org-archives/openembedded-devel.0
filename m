Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABFEC433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 16:09:30 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.10107.1645978168819289873
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Feb 2022 08:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DBJXxXGL;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id e13so8753314plh.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Feb 2022 08:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=k0HAhbvhwoSiN9UOo4nAdJpPcEOp80PGhs1UaEeKlIs=;
        b=DBJXxXGLZ7t47URmAkBXoj86CWodgoS/thJ/96j54JJ6gGFcoIX6XQxQJ2/YIFKyFk
         Rq5loGD1PUhXIOEJyZ4nSnA44s6iVsFi3JQr2gvhAYja21XnKenOmSqI0ZOmrdNRTNle
         rjCvEkClE380xvQkYjMrBMq7QpAlKh2CSlJ3HpiZs5IwDyuNvbJi7UCtaY2xD5Z3C+lK
         NTH2XCc7bCg/7GaeqDMqekYSDxEoYrSxd5anxF7m5p9tIxlVwFmeUZ4V0b5TMASMfoaQ
         3iYA9hkhRkbm+j6z68wTUk+15AA7ecauggabvemYW12vStW3a/9GOzoAzpGupajYseo0
         AFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=k0HAhbvhwoSiN9UOo4nAdJpPcEOp80PGhs1UaEeKlIs=;
        b=b5rPMH3epStVJMH8CmKxgKqBV0UrRtSKo6UCNPnuBz7sO4prRvDYUXW0cpOOQSYdtB
         cKpBjCy+2bCZlIMmYVdNM7Q7fHABUH1E5K2anu0FTc1//vACTzGasF3BboaJgf3LZus9
         w4+XbEA0nOlPb2IBRojVOE9xH7otE6rzBs1IAJcWL8Z9zfUrADj4vLVygzlnQNWwc4DW
         3yUbFZv6YpyBLrgaOkpZ+4pU2ROJbZL2LRDCbKKX2qUV3LE5OCsPC4XqR9LN4l5pafjb
         lEBK+UO8HQ7mS9ss5Ypj4zmMj3UUFH84c9S3KdLVSFEaRLR2H9ZnbSGvAuwnG0FP5fGK
         mlvw==
X-Gm-Message-State: AOAM532yHyACpYEZHKKzpbKkzVT1HONaXCPVGLAfR4UCwyMPmVgGKzp2
	b93rwL4fuDsuTiUkXecUs8U=
X-Google-Smtp-Source: 
 ABdhPJzpRY+sBW2AugllN+snCAh/PmpfwtZaCrm2qaSuxiPNuXwn6Dtipla0BVyx6IdtwtkcGSuj8A==
X-Received: by 2002:a17:902:ea01:b0:151:4750:9588 with SMTP id
 s1-20020a170902ea0100b0015147509588mr7882561plg.80.1645978168269;
        Sun, 27 Feb 2022 08:09:28 -0800 (PST)
Received: from ?IPV6:2601:202:4180:a5c0:e27b:269f:eaf1:cc42?
 ([2601:202:4180:a5c0:e27b:269f:eaf1:cc42])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a63fa45000000b0037407b6ffdasm8089623pgk.5.2022.02.27.08.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 08:09:27 -0800 (PST)
Message-ID: <e58829eb-707e-5535-d01d-4f765b296f63@gmail.com>
Date: Sun, 27 Feb 2022 08:09:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-oe][PATCH 5/6] guider: Set PYPA_WHEEL
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20220227075848.610467-1-raj.khem@gmail.com>
 <20220227075848.610467-5-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220227075848.610467-5-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Feb 2022 16:09:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95560



On 2/26/22 23:58, Khem Raj wrote:
> Fixes build with wheels
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-oe/recipes-devtools/guider/guider_3.9.8.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> index 47d872a400..3c3f069df2 100644
> --- a/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> +++ b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> @@ -14,6 +14,7 @@ SRCREV = "a502cd93b13235b7539557a91328de00b7c51bc3"
>   S = "${WORKDIR}/git"
>   
>   inherit setuptools3
> +PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-3.9.8-*.whl"
Any reason not to use PV here ?
>   
>   RDEPENDS:${PN} = "python3 python3-core \
>           python3-ctypes python3-shell python3-json"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95558): https://lists.openembedded.org/g/openembedded-devel/message/95558
> Mute This Topic: https://lists.openembedded.org/mt/89425252/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


