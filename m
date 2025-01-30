Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC352C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 14:58:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.17062.1738249118564687749
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 06:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=egjZ0Os0;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so863810f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 06:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738249117; x=1738853917; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vilbiletl7Ntj0oL0V/vZpuTWMgtsDexKJgDlj1Wn3o=;
        b=egjZ0Os0yrBgsoyWHOhRTLJo6VFy31HpOB2NZ24/WZEeYs3gHnPoEDo9fMkIYVL7GN
         OCKSItD+NGftO9SqeyU+ctXUsyGFwDhv1t+vsV/ig3HP4Ki63nfmQHrcXO31NN3nVVSY
         zVvXqi6yRG3Q009B0PSIHspfYhwoNsWk6ESuxi2TgSp3hnrH2CQn6TnWkr3Dr6DuE3Mj
         ItqI2opAga5FrUhzuyiybTGByM1v1vWavBwadJ3U0C+BYWphTPLUNx9bvqPo6jl/3bVs
         8G9XJYe3JvEhAp5xsICrS3pGXn82ZdhimH81/9akd5JH9g/xusmW/YKTZr2cp08pp1lx
         NnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738249117; x=1738853917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vilbiletl7Ntj0oL0V/vZpuTWMgtsDexKJgDlj1Wn3o=;
        b=dvKg4F+LZN59r1A04Br5ObcvXGp4Xxdb5L953z0Jy56Hg5BFE91WNw4bD1q+3DHwO2
         5AZoWeqxaGEYQXdrdY1MqXharkbzR9xglFF8guvKH/4t4XC2AhBtq9c5AZXtATYU+UMA
         yRZC/cbEDPy272s0TlKrWPMau1KZQp+mp/PuhIOvvzIr5Pntey5wJ9YQ8YCCw6R7oIKv
         tpTatdN77BhdWLSippIc3R6nfz8OYZniyAhVh8tzv2s1JGxYkwSUB2IKhwerG0cU6tc5
         llSHlHgZEzQupqpwmZWSNtYiWaZdvNmMoAZm2vCOpp05CNyrpaBMN+SsoJc25MMuXVGv
         KLfQ==
X-Gm-Message-State: AOJu0Yyr8sWVV80fY7b7039sj3uA9pZ2HOcQF1LkBcwSc3JNW7ZTIAN1
	SULDEoqrz7xvIVem44LnvqKbeQH/rycEG6O/CUk3BSLVtOPes07J44IKYw==
X-Gm-Gg: ASbGncve1whk/ZjdRgFLibew8WcOxctV+SLsyM1h9JQGLgVBcZ/FSqmUf7KzwzlC7OT
	gyn9fjpojmK0veVHXf6KYTH1PtwKMreqCoq81e2E+UJdWyiku7Vcu3Ym0cgtyjVx+ffBguYcAfA
	Rb772T0VYBCIibTWsNE0FacSg+pNBtfW4wukEDQi4VXUo1I0iBLZ3RsXGDg4Wxb1Y1aqbCXr6tN
	TLiHWvIAD1Da2GJNtNvQKe93EOaLIw/zx0gkQNOz7H9vo7Qo0A5KPOLRU1kD738GkGDh+CvrRnu
	DwZ4cjkuWmaBmoQGqD5F+Uw=
X-Google-Smtp-Source: AGHT+IF/PhuOTO66LhsPljWhEx4xwrjjTGfIZBS5Nt9kNGsHtCIpVfMhGQLkjUI4vCLMezBXZl9pGA==
X-Received: by 2002:a05:6000:1886:b0:386:3082:ee2d with SMTP id ffacd0b85a97d-38c520904c9mr6284955f8f.41.1738249116739;
        Thu, 30 Jan 2025 06:58:36 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102bccsm2192448f8f.27.2025.01.30.06.58.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 06:58:36 -0800 (PST)
Message-ID: <df9d3d5c-aa4c-4de2-a6fe-c0e83733885e@gmail.com>
Date: Thu, 30 Jan 2025 15:58:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][styhead][PATCH] sip: Upgrade 6.8.3 -> 6.8.6
To: openembedded-devel@lists.openembedded.org
References: <20250130142940.2771682-1-leon.anavi@konsulko.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250130142940.2771682-1-leon.anavi@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 14:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115153

> @@ -6,12 +6,14 @@ SUMMARY = "A Python bindings generator for C/C++ libraries"
>   HOMEPAGE = "https://www.riverbankcomputing.com/software/sip/"
>   LICENSE = "GPL-2.0-or-later"
>   SECTION = "devel"
> -LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1d69a33480ebf4ff8a7a760826d84e"
>   
That license hash change looks significant: apparently it was relicensed 
to BSD at version 6.8.4[1].
Also, it has a new homepage: https://github.com/Python-SIP/sip

[1]: 
https://github.com/Python-SIP/sip/commit/f32039b07c47280039dcdcd0f8a2b1323fda912e

