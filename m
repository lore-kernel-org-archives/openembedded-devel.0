Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DD5C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 11:16:53 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.40021.1679483804421907706
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 04:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tm5iMASV;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id c18so22084356qte.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 04:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679483803;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=COeD3d+jxpUKm6wnjN1uKrGlFT3wQ+pRWTS2Alp9S5w=;
        b=Tm5iMASVACl9QWHDQVz05SEdvOyKO/UknbbMwc9Fz3f3fZh5cNMQ5CFVAKzWGH4uyr
         e1OsfJiCtouzJeA1nSO+oSI/rcz6Iamnq6TNUCB0el4z02mVTAZN/ovm8Hph+AAaoboP
         blJL261wqYT+yIBPe+A/q4X6DTKuJrN9iP0z3ZcRirOrQweUptMRzCm/QCECwXuF9ATe
         33IIu1FXuY21JXJHQdUnbnMvzwg7X1z0tk50WBGM5tEBfocupmvpFctQK+AYNoQTAC+f
         pztaUw1sbexxGeT6UvYaXpAKX2YvPCj7kYN8abcIxGr0DQgaAg4s0X/YVrfqqXxilyTJ
         xxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679483803;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=COeD3d+jxpUKm6wnjN1uKrGlFT3wQ+pRWTS2Alp9S5w=;
        b=XEfSga52u2yuUhxAPtKTA+LsqR9US2P+rMi90vupAc1j6W/bflLIJT1Mkp/c6a/QLB
         MS4zODkkz5omlKREsM/2Z/lU9tzzIOwUikIZMPjgTkQkRbhE3yElfFF5G3EvMIkk/yk1
         EIOPzZbKHU5bynjiB6c5CN+PTmS+EyPQdOrnePke3z4y5shyNE2msXHIupTLpJ1NxSnE
         49OlTPUyG37IVk6cbgY/xPy/V4tsPKXS1LvjvUAUE2OjyyZB2rrfBlx4ydGL302k9a+B
         Q4Mo/5AvYZKy/E/Mij54ngBFF8aApWBjrgPF7kVgQPM5THDitZMTTgQVylGSR9QwghSa
         E4qQ==
X-Gm-Message-State: AO0yUKVT9kpEef1o7E5O1U6/BwrdJTNUpystoaqLL8WjMovP3V5CYZG8
	LtTzPIuY6/xn3KoLn0Zp/cOVfzdfMKriXg==
X-Google-Smtp-Source: AK7set8OzHdKz3y9yJpGg57lgYLWlEuPI41kJ5QjNuFY5utHL/uT/lopuquezZfLOy8E0/IxolNqDQ==
X-Received: by 2002:a05:622a:170b:b0:3b8:6b6b:28c2 with SMTP id h11-20020a05622a170b00b003b86b6b28c2mr4742252qtk.68.1679483803405;
        Wed, 22 Mar 2023 04:16:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:3ea:5110:ed2a:eb0c? ([2600:1700:9190:ba10:3ea:5110:ed2a:eb0c])
        by smtp.gmail.com with ESMTPSA id k3-20020ac84743000000b003e07c09cabcsm5871550qtp.4.2023.03.22.04.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 04:16:43 -0700 (PDT)
Message-ID: <78c22105-2fb9-109a-0c93-00b243d3c17e@gmail.com>
Date: Wed, 22 Mar 2023 07:16:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [kirkstone][meta-webserver][PATCH] apache2: upgrade 2.4.55
 -> 2.4.56
Content-Language: en-US
To: Changqing Li <changqing.li@eng.windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20230322074736.418308-1-changqing.li@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230322074736.418308-1-changqing.li@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 11:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101634

This is already queued in stable/kirtkstone-nut a few days ago

-armin

On 3/22/23 3:47 AM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> This upgrade contains two CVE fixes,
> CVE-2023-25690 (CRITICAL)
> CVE-2023-27522 (HIGH)
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../apache2/{apache2_2.4.55.bb => apache2_2.4.56.bb}            | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.55.bb => apache2_2.4.56.bb} (99%)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
> similarity index 99%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
> index 84bd0062e..8b857d2f0 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
> @@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
>              "
>   
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
> -SRC_URI[sha256sum] = "11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f39c71bdc5f69ac"
> +SRC_URI[sha256sum] = "d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0cafe5442d41afdb2d7c"
>   
>   S = "${WORKDIR}/httpd-${PV}"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101629): https://lists.openembedded.org/g/openembedded-devel/message/101629
> Mute This Topic: https://lists.openembedded.org/mt/97773568/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


