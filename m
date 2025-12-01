Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A411DD116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 22:16:09 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3873.1764627362426558116
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 14:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GQCNPeVy;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775ae77516so47098315e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 14:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764627361; x=1765232161; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2cMap9ZgEbE/EIJ5gF88VNIhihYAY5QlpmSwxM+B4bE=;
        b=GQCNPeVyPENDYgozfQcUXCLNV2O3ka5Sl0EBFFkYuiNVhkiGYLJrXqvTBqe7kcdQJ7
         H7bVMjBZFL2WwcJG9D00oq0r/+nUk6FfTy5xsOyncVzC1yeP14QS5a4tYj8dnfAR4HZr
         jCVC+IJXRY3vI7qdVQLCfRh6VWBXHI/psgoh4NwRE9Dwkrs5g6MsUVrChOxEleaGIrYB
         LxE+zxpsfo1TSv2njKZZlyfbYYZ1xhZsn4Q6eAYk2oYyifDMq48kE/09BioP+76EfAac
         cX96HvsKC0MI3vfzQd4AEqhdLALY+Y02101etGX4yv1gKtkjXDwufseh2A6S4Qwa4PG0
         bQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764627361; x=1765232161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cMap9ZgEbE/EIJ5gF88VNIhihYAY5QlpmSwxM+B4bE=;
        b=iujF/SGmjdgGS2v806XwQwTzMxJvxz2U01R7gJNiFlWXQXyJGqh5tYvPPu7fgSwSns
         StTeTb9GpvJwmpkLxrfoAPM9KN1WiRJrxsPXyR9cj6MOl9oM+35tKcKhyBsP+R6a2Aw9
         4kkIw0dOwSNCtsE7eaaLK4lsXZzf7eMCK2H8Ovd67SSrukTZP/CaEUZCrAEUne3e+q6a
         u91CFXxXqzhoN6KPSbV/X9ZNszCfECpZvmC5Qa2R1J/o7YfaEXnpaNWIXbQy3qYUBBax
         r9CfbGHG4q8OjzR3B4mFrMw67YJcGYCiZ9LKm0jUQ5PY9bLWdu9kyV47ebnWONn1HOri
         MQZQ==
X-Gm-Message-State: AOJu0YzJ7F0r/u0ftVK4fqDm+DuaeCm9iDvr3thLS7WGXav+75ZjQLk8
	9zl61xiWqryz5PG0SUtpy8r8c2YWSiYP/8YJ9NNMK4GRup0GyEruTV7y/bgBEg==
X-Gm-Gg: ASbGncuoKl0M8lF2cG59l9DLJL8Ii3MBjN3cxDis/rkyfVNVYRggltA26gLYXeeGSGC
	gcKkUPVyjgQjyTuxsH1ECKkRjLtaWpfDCrnRwQZt1rXnk4abWT4HHDMmbtWmTHGentoHiSF3izz
	3f9uiLiMnc5QpCB8N3m91n6bAJ29HPnjqjsHpzDgPUSyYPSoncGFZVZeCdiq4jjDXn1FhasDfIK
	5MoKJ15zUV+O/der4Gf49jfshixdrUSmh9wzAHRPjMM1Kz07mvT/kj78NU57iIFGqmLLfDiJ97C
	EnUdxz9j4XjcjGn7MNq0WjQTI8oxRXNj3WXHpnRuVS3Zrzv5DIOBV/nODEGSjCWdigy85EqeGGk
	LMG2Uv+E0NLjPoJntkq6QVt2h9vZUdHKHDeo0JBCkv2igAjoM6LbJv9HnH6E7DMVsd0NQGptDPF
	6XlV1+PsIR8Od9TZd9V3s=
X-Google-Smtp-Source: AGHT+IEt/4yS2+4owQpY8d61H66FIfDaigtf1sM0oVfHOBHkxJmQSk7i3cI27IXSBXWuMOfS9NY0EA==
X-Received: by 2002:a05:600c:1551:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-477c10c886emr428514925e9.3.1764627360483;
        Mon, 01 Dec 2025 14:16:00 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791115caa7sm256824235e9.6.2025.12.01.14.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 14:15:58 -0800 (PST)
Message-ID: <57241818-f677-4853-bac5-36893e331475@gmail.com>
Date: Mon, 1 Dec 2025 23:15:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] yasm: drop recipe
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>, Yogesh Tyagi <yogesh.tyagi@intel.com>
References: <187D36E873800CEA.493995@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <187D36E873800CEA.493995@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 22:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122222

Yogesh,

You are on cc because it looks like meta-intel is using yasm at least
for some tests[1].
Yasm is on the chopping block however in meta-oe, mostly because it
became abandonware lately.

This is mostly FYI - probably you want to be aware of this change.

Thank you

[1]: from
Khem: https://git.yoctoproject.org/meta-intel/tree/lib/oeqa/runtime/cases/libipt.py

On 12/1/25 23:09, Gyorgy Sarvari via lists.openembedded.org wrote:
> Yasm was introduced as a rewrite of nasm, however its commits
> have dried up over the years, while its unmitigated CVEs keep
> piling up. Also, nasm is a healthier project with regular
> contributions still.
>
> There are no known recipes depending on yasm.
>
> Let's remove it.
>
> Cc: Ross Burton <ross.burton@arm.com>
> Cc: Yogesh Tyagi <yogesh.tyagi@intel.com>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>

