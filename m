Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12870D3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 16:32:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1086.1765211533062453249
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 08:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DLz5EKqU;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477563e28a3so33665885e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 08:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765211531; x=1765816331; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8x1RyTo3X5mwXyMOsrOUmfcjRoQpjBTbY5pvFWj11zo=;
        b=DLz5EKqURVTQM1Bj6YkPncswe03wkOPH3ote/rqoAcNlOV1iN27nGqrSLhdZ3Ix7hy
         6GmDvcw3K5dqXPxjm9BM4b9iylpSOxt7LVbPSV8U1zCr+5HiSyO9fJWg71TEBgp62J35
         jfXtSt93AUWNzAGxPcoIE2pZBq3WYd215y4BMLjJ682WFdaVYqt2zXw6UmpC/Da6y9YK
         jZt5JCWV7TkJETgZExMLagFNGMgieYSY5HjJQFtBpm0EjVSWxEnypBvRQ9UsY0VuRLZi
         you1+M8iLRPZ2IxD5aUSkVpKC90pS+PsrrQ+ppi/2tP2Q9Ej84bV0CX4KC2KygiEFbIY
         sdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211531; x=1765816331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8x1RyTo3X5mwXyMOsrOUmfcjRoQpjBTbY5pvFWj11zo=;
        b=lMCacYUskBrbnzb7A3+KdhA9v9Eztm7YINuC4ylAWQlBZeHee9iVaj5wGU3/MSmfG9
         0YeVWWcClaVYXQ+pGvJfYuYwWH6agfjYp0Gw9+x9ti8+TsIWh6idKS/ok0QNnSITO/OH
         lAutb2OisZpcMxRk4zwO0jbUVG+5g2UEyryasW9lmhyadjYl71lRCm/cPh/3DNG/b2Ww
         DhvHcRiJMMTAKbeKojHcvLHo78qNIp8sbhrpiSxGN6o6z4kTia8uTIg+Z/rgD0pnTX2H
         yyxetK8Nxzu2YmAHL6j1+TsR65uezPMmw+G9TdBY1V4IiBIrR0OtfMnovEuzgunaVVQ3
         IdKw==
X-Forwarded-Encrypted: i=1; AJvYcCWSDmGjGTDUXu4G8IPEm3BIGU9y9SbaKrNlyMzbQN3KABOHwzWmMdM/Na3IFmD+yRygBeu4+bIpc0mHf8fK2PX1lHg=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy2urUm/7xH5FEXiO6lub+yay/7fAN3WCFTKeaZlikDekJxVvwJ
	8uP1nYGKBmn31YX0dCY9Wy2+mS0k2ShIoFEfCfMpgZBVIEz7QesW4nQAI+eoYg==
X-Gm-Gg: ASbGnctP8unppx9vom7T0Uk30+YrOIV0Hje+pDunh/yti7p87F/FiNY5WsN9a2P5vjb
	nmvwMF0DsGrrXMWCmOxkVUJUN8crbCeR6aWmci3gc3qQUuL5REupR/nnmREeptgqgVX5vQghPKH
	nx/Awzxy0px38I2eDJyjmpVJJ2n4mt8OAaQsriN++HOs0s2IyW9xi/UHBAWAHZdCCt1o+KaYP1x
	KvS/NZjPRo5POtnmR427ej/eox+D3CjUSL7+cpamPQRyQmOMcJM2jGLX/+MBH3Ybu2nMmLxYZQW
	rBAQ0FvFiPakp06/8Jq/Z0D66PpnFhg3tKaA4qGaqfDLm3rrBA945kGFduyFA0KdlUwfc/HLk5g
	YUMrqTqb1ld49g+qFWYDtBbHRO6jm43BOqfCjOuqZjdPD3QKs2d3gy1veTtJeV7OBqzJJkG3mos
	s5AkUNATXy3italjRQUj0=
X-Google-Smtp-Source: AGHT+IEA6ZE6cuZ957zIzuulY72y1pFZSpXhMPxAKjJ4Sb7WoDSt0GSjVUqaL7YpfIAwuMwdlJFMEg==
X-Received: by 2002:a7b:c007:0:b0:477:a2f7:74de with SMTP id 5b1f17b1804b1-47a7ce3ffd6mr224565e9.3.1765211531094;
        Mon, 08 Dec 2025 08:32:11 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b14ad9dsm131985245e9.12.2025.12.08.08.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 08:32:10 -0800 (PST)
Message-ID: <5eef6300-783e-4908-b4bb-ca3bc1b4ab4c@gmail.com>
Date: Mon, 8 Dec 2025 17:32:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][master][scarthgap][kirkstone][PATCH] apache2:
 upgrade 2.4.65 -> 2.4.66
To: valeria.petrov@spinetix.com, openembedded-devel@lists.openembedded.org
References: <20251204204911.198119-1-valeria.petrov@spinetix.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251204204911.198119-1-valeria.petrov@spinetix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 16:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122382

On 12/4/25 21:49, Valeria Petrov via lists.openembedded.org wrote:
> Security fixes:
> - CVE-2025-66200
> - CVE-2025-65082
> - CVE-2025-59775
> - CVE-2025-58098
> - CVE-2025-55753
>
> See: http://www.apache.org/dist/httpd/CHANGES_2.4.66
>
> Signed-off-by: Valeria Petrov <valeria.petrov@spinetix.com>
> ---
>  .../apache2/{apache2_2.4.65.bb => apache2_2.4.66.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.65.bb => apache2_2.4.66.bb} (99%)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
> similarity index 99%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
> index 58b324795e..630c6f3b1b 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
> @@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
>             "
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
> -SRC_URI[sha256sum] = "58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3"
> +SRC_URI[sha256sum] = "94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596e4116efcfea25a"
>  
>  S = "${UNPACKDIR}/httpd-${PV}"

Note that the UNPACKDIR is only valid for Master and Whinlatter -
Scarthgap and Kirkstone doesn't know this variable, and patch fails to
apply. Could you please resend his targeted to the branches?

>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122334): https://lists.openembedded.org/g/openembedded-devel/message/122334
> Mute This Topic: https://lists.openembedded.org/mt/116626050/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


