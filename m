Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C43CAC5B9
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 18:12:13 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.5454.1759169532954463951
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 11:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ct4nFd+s;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so402553766b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 11:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759169531; x=1759774331; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uZoVfL0Y4cAqDcNJ+MZlCkzMrykGQUTGBqVL5Q6yIXA=;
        b=ct4nFd+sniUeulqLDQdCHG27YjkN2GugoZdq+jk+wVqThFlD2EDJZHWMMlrG0N3GQ8
         L5RDo7WHz023w2TCQa3U65X49+Z1OxdnrWDL/3Epb9/7p3Rm/OsRsclJJ468Tv+Z3aWM
         2nM0m1wbOQdn24HtlF6fMZt9tr+Oecg14z7kCHdaceIQtVLGTcWOpzgNWYRw8/f+Va8x
         ixWNtYTLY5e/mNVfB6iDnra74X0Dphb+ukewwOa6Ei35h6wvZ9gDPT1FcIKOXoca6iI3
         kve+MS6TttduydHfaB8ANNFTK1Gev8B1kjY1SeEjgTtMdK+0N1/R0m2BQKOQ/DeZww6r
         /fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759169531; x=1759774331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZoVfL0Y4cAqDcNJ+MZlCkzMrykGQUTGBqVL5Q6yIXA=;
        b=fHa3Nq9zY1ytW5sjFSRPeklwLjUuDKSXIh/fkjv1HZxEE+edmUozeiXWwVHFRNKZKP
         bhw296AFT1Vd2PlAii1eD5rqArWewJOWRCHVYJhf9bsnU6AgQFOXoyH3RzFhvdquULmt
         XtA0ewUtALNsYE5P+OLqtL6xhpEjiyeGuMBrY7LP6xzf4QYotl6d5FbUGjKhLX8gXxkS
         RN+AzqDwWui7gfvHsGMSpvvnAPam1ZjLW0urgxi5q8++XdJuITlkjtv+LRKMt9jECt0g
         w/A9cmccc1lFqqOhHO/SdUdRicnDCPFMbcBfh3G5Dvz3i7ok2JulMibk3IK17/55sRAG
         OzEg==
X-Gm-Message-State: AOJu0YwC02LANoUffDxyBMwfv++KAYI3vxVotsqX4LPYfT+3P62D8Ahf
	3VtzKddf/PBA0BQKjHWoLUUfSTpWfn6pe1diBBISUT/PKUFcFYA65i2S
X-Gm-Gg: ASbGncvVeh/z81W1N0T2VOF8tDCoakIpg2x/RTuzHOzV0J1M8vEeztbZc79tXI2dVoX
	cKg4vHcaYMXZ39oUzjREFFYZTs6RT+V2GkDQAxIqyiAWVdNIrjIIScLaWmxU62Z2I3Yf5dsj3K2
	btaLISIr8obQ8vEe06luxBaomTKzQpTqX1Fa0usELevwUmDn5H0gL0+hl4IHi0UhfsvYL/6K8t6
	41gxeTs4ojqTvfOHs4zdz+XJQACRRv7MCC9pias3aFqe6sNj1faV5EKftGtbrcM2lnYmY4bxjfo
	gI4+qGKaSGsmh0QELR9+S6NLs7Wl6BPiOD9r+G5X96a5Seq3v/w9ePs4IbXkoA1ifSDRT6EQR+k
	iyfOhgx6xnxqeAONGoUzVN3RCJk7Rgq2o4eP9VSmruw==
X-Google-Smtp-Source: AGHT+IG5JwSPAnUYKH+OMuPUYtGLbAKwGcTN+Bczv7jz2j2nAfvk+/Sg9wXpTgRC+3zWB3HjtEBmHA==
X-Received: by 2002:a17:906:c105:b0:b41:2c75:6a9f with SMTP id a640c23a62f3a-b412c757743mr178951766b.60.1759169531231;
        Mon, 29 Sep 2025 11:12:11 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3ca6592cadsm383759166b.31.2025.09.29.11.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 11:12:10 -0700 (PDT)
Message-ID: <244654fc-a39a-4c3b-8e9a-a945af84452a@gmail.com>
Date: Mon, 29 Sep 2025 20:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 16/22] iwd: upgrade 1.26 -> 1.27
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <20250929130425.2912077-1-skandigraun@gmail.com>
 <20250929130425.2912077-17-skandigraun@gmail.com>
 <CAMKF1srcdO5qpYewHLUNEAE-odDrcwUO0mzAiziaK66S4+Gp7Q@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1srcdO5qpYewHLUNEAE-odDrcwUO0mzAiziaK66S4+Gp7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 18:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120043

On 9/29/25 19:01, Khem Raj via lists.openembedded.org wrote:
> is this only bugfix release ?

As far as I can judge from the commit log, yes - test fixes and generic
fixes.
But I will drop it - just to avoid concerns around it.

>
> On Mon, Sep 29, 2025 at 6:06 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> From: wangmy <wangmy@fujitsu.com>
>>
>> Changelog:
>> ==========
>>  Fix issue with hidden networks on connection error.
>>  Fix issue with directed roams if already trying to roam.
>>  Fix issue with checking for connected in FT frame event.
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit 9f359e3eb01cc0b1511569573062c40909db3ef6)
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  meta-oe/recipes-connectivity/iwd/{iwd_1.26.bb => iwd_1.27.bb} | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-oe/recipes-connectivity/iwd/{iwd_1.26.bb => iwd_1.27.bb} (94%)
>>
>> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.26.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.27.bb
>> similarity index 94%
>> rename from meta-oe/recipes-connectivity/iwd/iwd_1.26.bb
>> rename to meta-oe/recipes-connectivity/iwd/iwd_1.27.bb
>> index 6248850413..dc29bc3fd5 100644
>> --- a/meta-oe/recipes-connectivity/iwd/iwd_1.26.bb
>> +++ b/meta-oe/recipes-connectivity/iwd/iwd_1.27.bb
>> @@ -8,7 +8,7 @@ DEPENDS = "ell"
>>  SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
>>             file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
>>             "
>> -SRC_URI[sha256sum] = "0ff4541c2b7f14ec010c3cbd1f02350f1b58cb0c103412db22550e90d8040d6b"
>> +SRC_URI[sha256sum] = "013b4a0a79629c20d915954fc3b5d0620ef6e0d6065db3c342f4b3f9111f46ec"
>>
>>  inherit autotools manpages pkgconfig python3native systemd
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#120040): https://lists.openembedded.org/g/openembedded-devel/message/120040
>> Mute This Topic: https://lists.openembedded.org/mt/115494451/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


