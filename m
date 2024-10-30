Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F3CD5CCBC
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 15:18:09 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.17650.1730301488612538838
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Oct 2024 08:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wWhh51Yf;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so4280914f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1730301487; x=1730906287; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sGmMsz5yXUEtH/ujNTZPYbX0EshWVSEkaCBmzPaSIoE=;
        b=wWhh51YfWulSMAgvDGcpfTGMaimjKzgQeXJ3h+YJZlVRL6WNPe8Ct1Qk7gtXPEHteX
         /29Uw92AW9Y+UZ2oNJgWN1GhSkf8AxCelW/UFcM8Ng+XCKh3WaIP+JN5b85BVZUHVzSm
         Q4ovHaTbh6bknV74xb+f2uSv5J8ovdwU/g/fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730301487; x=1730906287;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGmMsz5yXUEtH/ujNTZPYbX0EshWVSEkaCBmzPaSIoE=;
        b=uqCYyH1/QpRmW/2vxnVuic6Eau0GwJDk5JRYXX491EeQVDpu9C6paaZkPh1MtFBUX5
         f0kD90VDKT2NdibNTD0IqiWmX4axPSGjHlGvF4QDgl+BvdFbeMHdLHwJ7B2acx/clyrB
         RrteTQNQ8I3yIqyfMOv7q2PTbTXJlUWNJtoLnAgjVUpxUWj+uHhV5W8TZiOcYY+aLYSK
         bLMCUUaZgWIY9Jxt8rljv0tSPSyBSY83cXH8ENbDe2kQZBe5yhXZwlYFpf6cosKFF7vk
         kEvhEJPWMIEUNmgrJGgKiCjD1JgxNDjSnhLfVrxTm1f4c+lB2qG+gNs+DPe1mDAPbMAO
         i5vA==
X-Forwarded-Encrypted: i=1; AJvYcCVIbYAF6OBuk2cqjfpipcH0oleBP1yCz2EgG6lGq5n3cGJq13O97FBRGthdivXIJzHL4BomcTdnodUyHJZnEhRSsfk=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+EtfAwTFf0pS9t75vvSCP6UarrOPgWgp1parPef7ZOCEYs2B5
	0sxVzkqBi20LjWr5KDNO50vJYDlKt8k6Ic+OSfUBMBn30QTNG+57iRSt8Rk7EQA=
X-Google-Smtp-Source: AGHT+IH/yUg+9FXgZgIhohF3MMkWHZBBRPZ6ialGHSZyKiGQlAo2O1KT5J3Y84yeGsJLIU/TjiaiWA==
X-Received: by 2002:a5d:4a4e:0:b0:37d:50ed:daa8 with SMTP id ffacd0b85a97d-38061128d58mr10690503f8f.18.1730301486944;
        Wed, 30 Oct 2024 08:18:06 -0700 (PDT)
Received: from ?IPV6:2a02:8440:3341:21e:7e81:ce1b:ddf5:9331? (2a02-8440-3341-021e-7e81-ce1b-ddf5-9331.rev.sfr.net. [2a02:8440:3341:21e:7e81:ce1b:ddf5:9331])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b9279esm15623212f8f.104.2024.10.30.08.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 08:18:06 -0700 (PDT)
Message-ID: <54c371b7-d67e-4a12-b9b4-1d7a50ed0a1c@smile.fr>
Date: Wed, 30 Oct 2024 16:18:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] libgpiod: drop wrong S assignment
To: martin.jansa@gmail.com, openembedded-devel@lists.openembedded.org
References: <20241030151409.208066-1-martin.jansa@gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20241030151409.208066-1-martin.jansa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 15:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113345



Le 30/10/2024 à 16:14, Martin Jansa via lists.openembedded.org a écrit :
> * the default from bitbake.conf:
>   S = /

You meant
S = "${WORKDIR}/${BP}"
?
>   works better, because it points to correct directory even with e.g. when
>   building lib32-libgpiod with multilib
> 
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> index 3d9758e27a..00252dfe64 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> @@ -17,8 +17,6 @@ SRC_URI += "file://gpio-manager.init"
>  
>  SRC_URI[sha256sum] = "ee29735890eb1cc0e4b494001da5163d1a9c4735343201d22485db313601ca07"
>  
> -S = "${UNPACKDIR}/${PN}-2.2"
> -
>  # Enable all project features for ptest
>  PACKAGECONFIG[tests] = " \
>      --enable-tests --enable-tools --enable-bindings-cxx --enable-bindings-glib --enable-gpioset-interactive --enable-dbus, \

