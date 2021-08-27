Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.341.1630083146283223180
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Aug 2021 09:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jUQa4US+;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d17so4283975plr.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=yKRrazTDhgnkEBwBobC7+56GBJ46gq1xxSs9g6wNt0Y=;
        b=jUQa4US+33I23YKIOhIjzvhVfk85+zWTR4Lu1AURUcs7mpVOKkbM4XlkhoOXP4nypE
         9mBV+FC6OEkz7IIJ21y0lRPXPyaLYw9oOciwQV9NANGD26dLAZN7e8ECWa6S1Xk682NT
         HORn/0P3LD4L40DN+x9Smyqrilovf/gf8tEYGKyiyhqiNF4G9Gxdf4L0/mCxy0SPXox4
         0BNpJiAcVcID5UN1TepWhKVL3dJlT4rSgv33DPk12A5xdwalDgrE0siD1rhFasEILZA+
         GQ/sgg9jCVBRk4V3B2LYSJCKHYS7YiCvAnj4ASDqODgsoav3ZLETu+inR5VvFnd9vXZ4
         jKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=yKRrazTDhgnkEBwBobC7+56GBJ46gq1xxSs9g6wNt0Y=;
        b=r7cMQjHuyYYNxHSM9iO14RCqbe4MwHUnXypJwG1Z4UIHdRMNscalkxMZEyIOvbHMtt
         a5IZjEa4UYTw+PuJ72kj9/bmE0uCHe+eyV3hpAog1Co8DHZ5CHN2Pgz0dW/KV9x10xGc
         MdcK5PUXwYtCMXK8N685GU/v1YYkJEEG2PkWvhuW7aH0PsHcviTvpaReoyr7D1sfaMgf
         2yOhOU3L7HqAQdUNKUTXOkxUj7ALJbPOoCWNn1X7885+9Qh8C74oyD/O8mDfF01Tifs8
         X6LEZkmKX8kOQSjoWgHhy5xk3qW/dXY/Epz5W028YO+tpbv7cIZecF6yjM++QiGs/lJa
         PBtg==
X-Gm-Message-State: AOAM532zSEgpwpf60latskxsDM0+MLTua3i9gItE80wsmsT8JdRUoXrN
	Lo0og+tr+aIExFqDaYO8YQVbApJNTFiilg==
X-Google-Smtp-Source: ABdhPJwyz6U+pKNYTQjDL9dutcPFkbHwtCcygR2MvWFq8i8+vT7gQ+lSa7w/GhEQfcdGJ8BMMhaG6A==
X-Received: by 2002:a17:902:bb91:b0:138:7c08:b412 with SMTP id m17-20020a170902bb9100b001387c08b412mr9467778pls.25.1630083145595;
        Fri, 27 Aug 2021 09:52:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:2885:b622:d56f:490e? ([2601:646:9200:a0f0:2885:b622:d56f:490e])
        by smtp.gmail.com with ESMTPSA id n14sm521694pgd.48.2021.08.27.09.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 09:52:25 -0700 (PDT)
Message-ID: <93cb72cf-348f-d0ea-14d9-b1bc0147b2b9@gmail.com>
Date: Fri, 27 Aug 2021 09:52:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.3
Subject: Re: [oe] [meta-oe][PATCH] can-tuils: update to 2021.08.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210827130631.2865172-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210827130631.2865172-1-open.source@oleksandr-kravchuk.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The subject line has typo, secondly, I can apply this on master-next
please refresh and resend.

On 8/27/21 6:06 AM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../{can-utils_git.bb => can-utils_2021.08.0.bb}         | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
>   rename meta-oe/recipes-extended/socketcan/{can-utils_git.bb => can-utils_2021.08.0.bb} (80%)
> 
> diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_2021.08.0.bb
> similarity index 80%
> rename from meta-oe/recipes-extended/socketcan/can-utils_git.bb
> rename to meta-oe/recipes-extended/socketcan/can-utils_2021.08.0.bb
> index ad7fc596e..c470caf62 100644
> --- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
> +++ b/meta-oe/recipes-extended/socketcan/can-utils_2021.08.0.bb
> @@ -1,14 +1,9 @@
>   SUMMARY = "Linux CAN network development utilities"
> -LICENSE = "GPLv2 & BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61329e99f86fdd31"
> -
> +BUGTRACKER = "https://github.com/linux-can/can-utils/issues" LICENSE = "GPLv2 & BSD-3-Clause" LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61329e99f86fdd31"
>   DEPENDS = "libsocketcan"
>   
>   SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git"
> -
> -SRCREV = "e9dd86fa5c4e6ecdfc34e487634a32f19e5c4d63"
> -
> -PV = "2021.06.0"
> +SRCREV = "3615bac17e539a06835dcb90855eae844ee18053"
>   
>   S = "${WORKDIR}/git"
>   
> 
> 
> 
> 
> 
