Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9073EC433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Jun 2022 18:55:03 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.8671.1654973701574539648
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jun 2022 11:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FIZ8prj5;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id u18so1896324plb.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jun 2022 11:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=cWIqmDIsTXcEfvJxR/HuDxAbhHTDeCeyVQ8ysTDMV2Q=;
        b=FIZ8prj5RO5EpqJlGk3cd3NJWxsyE3b1qPHc4YlgwtlFHt6ER/GUieBqUAwrvWT7SY
         4V4Lory5XRFEaQ0PkDYVuXUWl+S1sPgeH7E7P0gC1zgUUn3I64FX1xAhpYV4ebOvwajt
         8UdZVGIx6l51iduwsL8RUNTzVPPPWIR6ni1+Qk7TU/iap1jozFk1kc822r0SGiudUbc3
         TQdR5tZb4t5CAI4d5srlqfV/xhhryIUg2mZ3KsbwvCr2DX6eQ3WVHr2+jP6c111z0LWD
         xxh/0pZu+PMUTgaAyJ1zpdpMEPsD8N7QFBo9MzgH2F54We82ulby5zD5N9lnMhnJGAcE
         eJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cWIqmDIsTXcEfvJxR/HuDxAbhHTDeCeyVQ8ysTDMV2Q=;
        b=ItPPe9ivjs0LGpFEw7fDNEKzD63+WbeEks6eS87f+grzzCThKiytjEknC0svxqVtQT
         b27Y7qi8lPZ8ak4YaVgmAnhgwsQydPn22LlkaGg5aFA0UXPB6HuxdhAZboHAcNnhclEN
         NR3SDb1lWUDwKSMAjINqfo4jREdOdgde8Cuo/CI6HDH4Omz+FV0Mnj0283BRDJCdCphR
         mnc33wb+Bl4Wcm6SO9H1fcmPTsYq97yxL5gj9HMZLfZGnzAW47Gifhcry0GusgAfWbSN
         PhVzU0JZ9HfxooNvKhzJ7fMFAezEIy8aowDCCp0N1xj8NZdgWabS4uNVauxjPo9Zjmhu
         gT4g==
X-Gm-Message-State: AOAM530zjIJeU/nZ/LO2237oTMp0LHYC/YZbJKy5fZ2YiJg//y1UYWnl
	rwGTC9iWjRMX0yac1XZlicd2g18fB+g=
X-Google-Smtp-Source: 
 ABdhPJz7liS+lzYnhWriM8jZUqVqteqM6SALU9Vp702kyqgcuKGtKAs2oPvDiT83j3GA2/q2arYo2A==
X-Received: by 2002:a17:902:c94b:b0:166:4f65:cffb with SMTP id
 i11-20020a170902c94b00b001664f65cffbmr45685296pla.103.1654973700520;
        Sat, 11 Jun 2022 11:55:00 -0700 (PDT)
Received: from ?IPV6:2601:202:4180:a5c0:7af1:42f3:a8aa:9b00?
 ([2601:202:4180:a5c0:7af1:42f3:a8aa:9b00])
        by smtp.gmail.com with ESMTPSA id
 142-20020a621994000000b00518b4cfbbe0sm1884612pfz.203.2022.06.11.11.54.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jun 2022 11:55:00 -0700 (PDT)
Message-ID: <2ac0195d-dfd9-da2d-628a-fad632a5476c@gmail.com>
Date: Sat, 11 Jun 2022 11:54:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe] [meta-oe][PATCH] openldap: pass correct URANDOM_DEVICE to
 CPPFLAGS
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220611132312.4070200-1-yi.zhao@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220611132312.4070200-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Jun 2022 18:55:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97473



On 6/11/22 06:23, Yi Zhao wrote:
> We encountered a runtime error with slappasswd:
> $ slappasswd -s foo
> Password generation failed for scheme {SSHA}:
>
> This is because the URANDOM_DEVICE is not passed to CPPFLAGS correctly,
> then the program can not open /dev/urandom.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>

backport to kirkstone?

-armin
> ---
>   meta-oe/recipes-support/openldap/openldap_2.5.12.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
> index a0ca2b5d3..c01db08e4 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
> @@ -131,7 +131,7 @@ PACKAGES += "${PN}-overlay-proxycache"
>   # Append URANDOM_DEVICE='/dev/urandom' to CPPFLAGS:
>   # This allows tls to obtain random bits from /dev/urandom, by default
>   # it was disabled for cross-compiling.
> -CPPFLAGS:append = " -D_GNU_SOURCE -DURANDOM_DEVICE=\'/dev/urandom\' -fPIC"
> +CPPFLAGS:append = " -D_GNU_SOURCE -DURANDOM_DEVICE=\\"/dev/urandom\\" -fPIC"
>   
>   LDFLAGS:append = " -pthread"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97472): https://lists.openembedded.org/g/openembedded-devel/message/97472
> Mute This Topic: https://lists.openembedded.org/mt/91688155/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


