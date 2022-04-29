Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D27C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 00:30:12 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.4583.1651192209347071300
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 17:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P4/fNkC0;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id n18so5769100plg.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 17:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=tPAaFH2Fk7z3C2gd/7sI2tl0IG4MDKGp7UsyetVRtBw=;
        b=P4/fNkC0YbUe2OQ17cMZxSm7wGUQtOYYOhx2C6RrXBs31RLtbqzbdR2H/9qEMJ62bc
         lZvHoWZMej3d4myZZ1XjYR21n1Zm6pJmoY09aHgb4fs+vqDBi5nbertnGxCm8KttX6TS
         Zwsd3zJTS3s+rhUsPjC4VmJGghmgQ4BvAuo2MAmH8OveKoP/vZ/qByE5IjqKEyTPS47r
         IK2pfCoMklNz6Rh8fNC+09/VghCiiXSYt28f0c/Pm/Faxd6iiBAFZJLFDWI7EcBnS2Me
         MrO7cnomb5kEtEpU9xvn+rfs3mi7pYJgEVp3RPAdiFngcc1J2lrlf9Ho7hNwAzU3eklK
         wLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=tPAaFH2Fk7z3C2gd/7sI2tl0IG4MDKGp7UsyetVRtBw=;
        b=NgE5JcwfmLBU8/U5LBUfxyjMGREoDa0xaiuVsEcG+O/P6+sWbMJvNpbUejd9UD03O+
         C8Ce+ozOmMxxQVy2pz04VzEuZXVJJwm4ozpHrIufGAmqlmyosoPO2OZzgR+BOpZ9ZXhS
         SP5ncrKFfQX7LbruWoK47YECK9BG0vKNDibuN67wkGH4GWocYHIE9Ppe46DeLfgBUrXG
         SqboLNmPvnLmT5h+2sR/ZLFOM+odGIZ87IzX0pKDGtoBrMjcIQ7jqu75iIu4R8og4aIi
         mrLkbsAa5Pgwf+erOhk4Rbw/oMifaYp49LXg9e0VxJE0aI1m57mBXcqTvSgbVIdSdTRU
         g+xw==
X-Gm-Message-State: AOAM5312NA2kdxuNsBcQzYzKZRJLn03utYNk76EKAaOj6XoDSOFM5ukr
	VliHwN0ux+YaYXZAWP9y/7w=
X-Google-Smtp-Source: 
 ABdhPJxazLkMP9U98/bPAxklS9X4ac1y/W/Xmrc7ewyq0Y1tLyFBMvhQ2N5ltGcT52tx60F5osvTbg==
X-Received: by 2002:a17:90b:4d8f:b0:1da:aa93:afc6 with SMTP id
 oj15-20020a17090b4d8f00b001daaa93afc6mr1036805pjb.12.1651192208625;
        Thu, 28 Apr 2022 17:30:08 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::2ec0? ([2601:646:9200:a0f0::2ec0])
        by smtp.gmail.com with ESMTPSA id
 l7-20020a63f307000000b003c14af505f3sm3877613pgh.11.2022.04.28.17.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 17:30:08 -0700 (PDT)
Message-ID: <66219d6d-9a8e-e4c9-5d88-a4a37ca9115e@gmail.com>
Date: Thu, 28 Apr 2022 17:30:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [oe] [PATCH] cryptsetup: Add luks2 related PACKAGECONFIGs
Content-Language: en-US
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>,
 openembedded-devel@lists.openembedded.org
References: <20220428230012.3467800-1-alejandro@enedino.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220428230012.3467800-1-alejandro@enedino.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Apr 2022 00:30:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96851



On 4/28/22 16:00, Alejandro Hernandez Samaniego wrote:
> Cryptsetup allows for certain luks2 related defaults to be
> set for libcryptsetup, these include the default PBKDF
> algorithm, memory limit for PBKDF2, parallel threads and
> iteration time.
> 
> Add these options as PACKAGECONFIGs to cryptsetup while
> setting variables defined as the current cryptsetup
> defaults, making this change transparent for the user but
> allow these knobs to be customized.
> 
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>   .../recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb    | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
> index 8f9f663a3..7baca98cb 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
> @@ -44,6 +44,14 @@ PACKAGECONFIG:append:class-target = " \
>       udev \
>   "
>   
> +
> +# libcryptsetup default PBKDF algorithm, Argon2 memory cost (KB), parallel threads and iteration time (ms)
> +LUKS2_PBKDF ?= "argon2i"
> +LUKS2_MEMORYKB ?= "1048576"
> +LUKS2_PARALLEL_THREADS ?= "4"
> +LUKS2_ITERTIME ?= "2000"
> +

is this something that can be selected at runtime too ?

> +
>   PACKAGECONFIG[keyring] = "--enable-keyring,--disable-keyring"
>   PACKAGECONFIG[fips] = "--enable-fips,--disable-fips"
>   PACKAGECONFIG[pwquality] = "--enable-pwquality,--disable-pwquality,libpwquality"
> @@ -69,6 +77,10 @@ PACKAGECONFIG[nss] = "--with-crypto_backend=nss,,nss"
>   PACKAGECONFIG[kernel] = "--with-crypto_backend=kernel"
>   PACKAGECONFIG[nettle] = "--with-crypto_backend=nettle,,nettle"
>   PACKAGECONFIG[luks2] = "--with-default-luks-format=LUKS2,--with-default-luks-format=LUKS1"
> +PACKAGECONFIG[luks2-pbkdf] = "--with-luks2-pbkdf=${LUKS2_PBKDF}"
> +PACKAGECONFIG[luks2-memorykb] = "--with-luks2-memory-kb=${LUKS2_MEMORYKB}"
> +PACKAGECONFIG[luks2-parallel-threads] = "--with-luks2-parallel-threads=${LUKS2_PARALLEL_THREADS}"
> +PACKAGECONFIG[luks2-itertime] = "--with-luks2-iter-time=${LUKS2_ITERTIME}"
>   
>   EXTRA_OECONF = "--enable-static"
>   # Building without largefile is not supported by upstream
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96850): https://lists.openembedded.org/g/openembedded-devel/message/96850
> Mute This Topic: https://lists.openembedded.org/mt/90765285/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

