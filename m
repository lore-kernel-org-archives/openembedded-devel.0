Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD00FA1FDE
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 18:08:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89088.1776881289315599587
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 11:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LWTnMzC6;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48374014a77so75400775e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 11:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776881288; x=1777486088; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D0a9zfbFDWa7UNyGREnLu+N/St1EShlHIQCmpMZv+Q0=;
        b=LWTnMzC67h1q2m1o5Ha7q045jsaGTQ+vb/bpFn6DY7wuKRWjUdATUUafnEUKMvuDNH
         jxCfQBFP2BHeswlD06WI3cHqOfKWtHF7TCO4zdH+K97tGv01NXEe6qJk94ppl14YrKHd
         3GYbuZIgMwEIqsWyJDjpgoC1nw0y63mKdkhxHakJd/XmZCVHKatBr6qniWst/CH4NeCl
         /h6pd7f7pqHJfwe9/KSTTt2vDxmZBB90lpPFu1rrZkrRahPHd7TAW4CeHhDqcrHt2GPE
         qDOr6+GQHcn48smKFX7YfM4LyQfO8aFSDsrfSVuYklwyiLxW8G9ooiM+brJ2Vs/UwoS3
         ehdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881288; x=1777486088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0a9zfbFDWa7UNyGREnLu+N/St1EShlHIQCmpMZv+Q0=;
        b=Hx/ku+GmpViI7SWj2KNR+Lcm90t10wgYKqUnz8QrBbKwAcryeyoqNA4ZSLLjcz4Fv9
         iq1/KuIFBgp/IwZ9TQYN0+D/DqFTJhzNZeCUmIpceR9GIhqGOCk3KU8jUfOJsC4rvZPH
         xiCsOJrrfTbGd9uR5NCVziM/35qrgjJrhQX2n6nxdjzoAIcY/YMBVOKSAZK0l6o+gY0l
         Ga6Cz42k0QUCTDSofKH93vr6EMxy7gBX7/z1JqJ1w+V8tRyGeOVEJLLpRwFuOEC2m6hi
         sKSWmtJ4N6w8YccRnz2yln0UU8W5YxRXOABbGGxuJsfvx4NylRR7vhjrJVrLOEr2t4XI
         FrIw==
X-Forwarded-Encrypted: i=1; AFNElJ+UFK3th/q9FYJf6mMxQcgMqa61g0zRAy6DyVNzIdJ6ADr/RaZn476IiYvgRR8QI2vjfEjlmFqzd2E409+pDe73KCM=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy4gR9CHFRfL0kAK+O4tBqOnEQy2hEOVcw6Yp6GVFhie/2lvRHj
	vs0yXrYcCnVwhCa+zx0W+8BK68kxv0JRXNqTAbXSMOTcai/eyMGDoxHf
X-Gm-Gg: AeBDiesUW18pJtOk65/Z0VCLwf3yiqv09gzh1/MOV5VfN3s4kEoP1UzM2MmiCnh4sGe
	5JVI6WXbBgObsdvit4bSjGGQsioq6DrjOq1lwc6Azv7b5A5K8DykE3ZzIw7LdFyYqXXSM7JBg6s
	bFJPthW67g4AQDpFQZ3mvJPmNBeD2Km4PtJ8UwfZjAYIALWJMO0x7zN/t21BHCyNy+g+qMZsTQw
	pe3M3VVJWElPGFfE2U+XSLHCB0RWa1tMUXy951QlVXwIUFFaRmYzdixu2J7samrhdsd6FhBMbG4
	jxxoqzisV65Xvn1otZeIOwVfmEU+3qldH4dsdol6JaxX09oA/6hht9EU8NyLX/WAZmCvxyVgQZk
	2QEzvGVkIsEKXpRQEUQKMir5rGa9bljDQNWduuYZbym7KpTOYEwxU70yrNENXls7v3rFraR4wKv
	rMVpfZJ7gfv2NFU5ATs/yNVqUu2ZYPv+ffxOODk7GfIg==
X-Received: by 2002:a05:600c:4c08:b0:489:1c1f:35f1 with SMTP id 5b1f17b1804b1-4891c1f3850mr120917285e9.4.1776881287333;
        Wed, 22 Apr 2026 11:08:07 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7c0eacsm146440435e9.35.2026.04.22.11.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 11:08:06 -0700 (PDT)
Message-ID: <dee16b43-e185-4fa3-9e08-b1f4c75a49e6@gmail.com>
Date: Wed, 22 Apr 2026 20:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] canopenterm: update to version 2.02+git
To: mail@michael-fitzmayer.de, openembedded-devel@lists.openembedded.org
References: <20260422104646.7769-1-mail@michael-fitzmayer.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260422104646.7769-1-mail@michael-fitzmayer.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 18:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126554

I think you forgot to include the deleted old recipe in this patch.


On 4/22/26 12:46, Michael Fitzmayer via lists.openembedded.org wrote:
> - Introduced a new API function: print_result()
> - Added support for configuring a dynamic number of filters when
>   executing replay.lua
> - Added script to interact with the STM32 CAN bootloader (stm32.lua)
> - Add Unified Diagnostic Services (ISO 14229-1) script written in Lua
>   (uds.lua)
> - Various updates and fixes required by the Debian package and to be able
>   to get certified by Microsoft
> - Added manpages
> 
> Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
> ---
>  .../canopenterm/canopenterm_2.02.bb           | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
> 
> diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb b/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
> new file mode 100644
> index 0000000000..b544fc4a9f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
> @@ -0,0 +1,31 @@
> +
> +SUMMARY = "CANopenTerm is a versatile software tool to analyse and \
> +          configure CANopen devices. \
> +          "
> +DESCRIPTION = "CANopenTerm is an open-source software tool designed for the \
> +              development, testing, and analysis of CANopen CC networks and \
> +              devices.  It extends its capabilities to support other CAN CC \
> +              protocols, including SAE J1939 and OBD-II. \
> +              "
> +HOMEPAGE = "https://canopenterm.de"
> +BUGTRACKER = "https://github.com/CANopenTerm/CANopenTerm/issues"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=bd2edc721b4a0289efe949bdbe7dda79"
> +
> +DEPENDS = "canvenient cjson isocline libinih libsdl3 lua pocketpy"
> +
> +PV = "v2.02+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/CANopenTerm/CANopenTerm.git;branch=main;protocol=https"
> +
> +SRCREV  = "7a9466029a6e88345e65e794ff1779f778c9358a"
> +
> +
> +inherit cmake ptest
> +
> +EXTRA_OECMAKE += "-DUSE_SYSTEM_LIBS=ON"
> +
> +FILES:${PN} += "${bindir}/CANopenTerm ${bindir}/codb2json ${datadir}"
> +
> +RDEPENDS:${PN} = "canvenient cjson libinih libsdl3 lua pocketpy"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126548): https://lists.openembedded.org/g/openembedded-devel/message/126548
> Mute This Topic: https://lists.openembedded.org/mt/118952637/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


