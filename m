Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E3DC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 14:44:14 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.17394.1668696243931864042
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Nov 2022 06:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ppTEkxdr;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-12c8312131fso2375288fac.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 06:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oa+EYCIbX1ds+/g6zRn6tV++ugFZTB9TXt3xJ86UxVo=;
        b=ppTEkxdrkWy3hr+N8iV+IKvuQ7O7IMprc9THGzADWxkSMRJuDK2+qJMhgzJujhvxUO
         yVAI6tYn4zasABba3BkQHeeiSjau5aaC6sNDdcYEhjDpGRPm8zOxsRYfJWTL6hiKTpZo
         RkQINgMT6AJWI+D6WaLeWkHSnOKkmavAhOr5NIKsCK//2WQYR7XmOKMU2wEb1qdRCUsT
         bMsJ3EstdFkZZnwi8Hy8JgEGDod2FaprUL/FtbNSP0cNtv3ZIwNmX70SYjLlQ+VkI9Y2
         xbKc9yEIJKa15YR90Eqs+EwSBSec4bpzAkBRfvi5k41zUcHutaH2765aN+zHbJZt/EPn
         0s3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oa+EYCIbX1ds+/g6zRn6tV++ugFZTB9TXt3xJ86UxVo=;
        b=hITX5E+GSjoOl0mRMP30ynwyZzBMqXhjQlvBWXZ1198P6KacheQpjyiiGjju9FYMZ3
         IY4BFT9Vps/3M4jntYds9zk8oqpkZhnR1eEWLPmy4pEDXeVxZHRvmzya991uoGldd8xI
         RL7wSxxghrIFOCNnmGAbz6CrQRjSeGSdcfEm2y+D+p/5uujDd+naW+fAYaL6FXCHuog5
         mBHNSSfPV+2ttvYhY38CIebYdzkpghY7GHmZXRIo5R9+gvdVTyAOtXqfLMgOp1ieJuri
         HnOa0VAcjDb00f872r3XxGesnDaR2NNynB8MR1IAJ5PmGGQ2r1CWiahGYmWLapf0AWSa
         YFfw==
X-Gm-Message-State: ANoB5pkbWrxbu0a2mc1Qr3jcGYq9XIbFIxC14RDosiW1zObpLgNnpysX
	swed4chjqSUeKo6mikFnFXA=
X-Google-Smtp-Source: AA0mqf6vW6hD98s8argewWYepV9Tsa+Z6e3ubQYJj9yzItbtZLkylmc4mfi2Tpr6mpbLJMxY5yuuZg==
X-Received: by 2002:a05:6870:3c10:b0:13c:ac50:ff72 with SMTP id gk16-20020a0568703c1000b0013cac50ff72mr4499868oab.164.1668696243301;
        Thu, 17 Nov 2022 06:44:03 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:f729:3f6d:92d:73af? ([2600:1700:9190:ba10:f729:3f6d:92d:73af])
        by smtp.gmail.com with ESMTPSA id k65-20020acaba44000000b0035aa617156bsm372955oif.17.2022.11.17.06.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 06:44:02 -0800 (PST)
Message-ID: <9d34f83a-c684-08ac-cead-9e3ed1b659c6@gmail.com>
Date: Thu, 17 Nov 2022 09:44:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe][meta-filesystems][dunfell][PATCH] ntfs-3g-ntfsprogs: Upgrade
 2022.5.17 to 2022.10.3
Content-Language: en-US
To: omkar <omkarpatil10.93@gmail.com>,
 openembedded-devel@lists.openembedded.org, omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com
References: <20221117082359.19378-1-omkarpatil10.93@gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20221117082359.19378-1-omkarpatil10.93@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 14:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99609



On 11/17/22 3:23 AM, omkar wrote:
> From: Omkar Patil <omkar.patil@kpit.com>
>
> Changes:
> Rejected zero-sized runs
> Avoided merging runlists with no runs
>
> Fix CVE-2022-40284

Won't this affect langdale and Kirkstone too?

-armin
>
> Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
> ---
>   ...3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)
>
> diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
> similarity index 95%
> rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
> rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
> index cb52c5567..efb331d7b 100644
> --- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
> +++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
> @@ -10,7 +10,7 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
>              file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
>   "
>   S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
> -SRC_URI[sha256sum] = "0489fbb6972581e1b417ab578d543f6ae522e7fa648c3c9b49c789510fd5eb93"
> +SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
>   
>   UPSTREAM_CHECK_URI = "https://www.tuxera.com/community/open-source-ntfs-3g/"
>   UPSTREAM_CHECK_REGEX = "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99602): https://lists.openembedded.org/g/openembedded-devel/message/99602
> Mute This Topic: https://lists.openembedded.org/mt/95086139/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


