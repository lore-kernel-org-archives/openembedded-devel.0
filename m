Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C9AD6B6BD
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 18:28:30 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.22875.1730312902351135542
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Oct 2024 11:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yBJOKQHS;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43155afca99so8033485e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 11:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1730312900; x=1730917700; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ytMfCJJkpDcylkoSKDJgue37hp9S9rs9IgVQHldvuvw=;
        b=yBJOKQHShhsW4zVPSt8zvzvDnNlH7e8nFZeP+0dAaehQ1Cnprz3uxd+RRf1EBJeDe6
         b0vqiSx9iNiszznVHYbIo4kylK63ALFvjAvPqJTP4U3eU6DlgbTipcLrbW4GfifLyAdW
         4XeM7aO6FouGFrqbCEq8eu5ZjSXDl+pQApT98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730312900; x=1730917700;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytMfCJJkpDcylkoSKDJgue37hp9S9rs9IgVQHldvuvw=;
        b=dYf/Cy7/J/wRHS70HMo8+DcCjnmiA7wNeyPJKdLI48QbNA/qgkgBM0CF5BEkWb9uQC
         Mgbbgv7/lt8tIZZ3nL2xs3Q3G/HjTCBC+WkkiB2Y4N7PLB0DmQlQa6UnZ2UtiphOw4Sx
         BUCy9SyTVFx9ZtsaZwUUjKhywm/Vd/niqleJMESUPE6h6Z3O0p30G5Swv86/RX1VowxM
         XoEv19pW7FKe9b1fOdsXQz6BZEH0CLoRAAX7+/FrMOgVcLRDy3gkormIFtucrHCcKi/+
         1Dyf1dAYYUmpNdujQ8NAxXMG2PcaO72ONmVb4V5pSixlUDqNdGLOrX1M1foz4AAzZb3v
         DKAA==
X-Gm-Message-State: AOJu0YzMrP3dnTlHHzHk39vmOxnk42WkE7Jf37jmMXxyLsVOishscVtQ
	DMHkWtc/GYhCItsNM6LSbqJK7YJKOxY6uHM5zB3yGHxJWIxzXUqkROU70GwAOaxhb4BMvsfzMXV
	0
X-Google-Smtp-Source: AGHT+IF59N38UTKJxcOZwyfYlLkXorQNi4qNef6ilI8Hz6sXw/UuPd4f0jMwhVYsGO3TKXrdPEXgAA==
X-Received: by 2002:a5d:4c4e:0:b0:37c:ca20:52a with SMTP id ffacd0b85a97d-3817d61324emr6159849f8f.8.1730312898863;
        Wed, 30 Oct 2024 11:28:18 -0700 (PDT)
Received: from ?IPV6:2a02:8440:3340:a7b7:1de7:fdbd:ee8e:2203? (2a02-8440-3340-a7b7-1de7-fdbd-ee8e-2203.rev.sfr.net. [2a02:8440:3340:a7b7:1de7:fdbd:ee8e:2203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b4ad08sm15950520f8f.64.2024.10.30.11.28.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 11:28:18 -0700 (PDT)
Message-ID: <e4beb6ff-ecbc-48f7-89a3-4f250ddef8a4@smile.fr>
Date: Wed, 30 Oct 2024 19:28:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-filesystems][PATCH] non-repro-meta-filesystems: update
 known reproducible packages
To: openembedded-devel@lists.openembedded.org
References: <20240915210222.2237434-1-yoann.congal@smile.fr>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20240915210222.2237434-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 18:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113349



Le 15/09/2024 à 23:02, Yoann Congal a écrit :
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> Re-include packages that are seen reproducible in the last 3 AB runs:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/41/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/42/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/43/steps/12/logs/stdio
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta-filesystems/conf/include/non-repro-meta-filesystems.inc | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/meta-filesystems/conf/include/non-repro-meta-filesystems.inc b/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
> index 4975593277..509907d889 100644
> --- a/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
> +++ b/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
> @@ -3,7 +3,4 @@
>  KNOWN_NON_REPRO_META_FILESYSTEMS = " \
>      e2tools-ptest \
>      xfsprogs-doc \
> -    zfs \
> -    zfs-dbg \
> -    zfs-dev \

zfs is not reproducible: it changes depending on host distro. We just
had (bad) luck with the AB worker.

See:
* https://valkyrie.yoctoproject.org/#/builders/87/builds/16
*
https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-filesystems/oe-reproducible-20241027-tsrqdzze/packages/diff-html/

I'll send a reproducibility fix forcing the "debian" target distro which
does match OpenEmbedded configuration.

>  "

-- 
Yoann Congal
Smile ECS - Tech Expert

