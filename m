Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98CDEE6428
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 10:16:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83112.1767176191715268880
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Dec 2025 02:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MnwaDOKv;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so8593711f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 02:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767176190; x=1767780990; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VRtnRnGmn4azREMXVxtz7jygEGgBBnMasLxV1hmd3zk=;
        b=MnwaDOKvZ/jEk6tKiFPDJN3RtDMEnj2IZ/WIsphXn7MBmOcCwTxrC9iYuYWj2/akJe
         xTUfe7ttGxrl1+yLSmM2ripWg41SBWjZfeGavb7zJ6lehumJY0Vnezzm1iCGQBZCkGEc
         +iibQ8haZ16OI9sUWewmkG8hpa1T0VmRAZfpUoFdtBg7+OgP6Pz8YHJpxXbtFX3Fcpki
         gqWb77WVoweVHyyLTFa6pMlu7nqEWXUVQQRu9bcI0j7CWrBXNo92DCWjktvpVGdiz42A
         q9+BQU5wnm+7fa4wGLVyoSam3o80fIOrVgDUSmHhV6r3SI+Aj9D+v706R6ESrGBLxPmK
         vWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767176190; x=1767780990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRtnRnGmn4azREMXVxtz7jygEGgBBnMasLxV1hmd3zk=;
        b=J34piO7zzQaX1/GsW4l82Qxyx6IEGsEzH355qrTPB8dkLCeFulQ9XUZtC0TUtc2KHg
         1N+Usf/Djeuf98gzG6O+0krz0aBIQww+Ye+nmYLI2nPcnH0L34T8KvwglqNIfs5eay7E
         US/fcTWYu0qpcRJHe6NJUcUaqK+jMF605pjrMqtMf+QoD5eD47aYD6tzr6geS3x4VstY
         lHX4zTPaxhx6DYrn6dJ7D/G4uG5M53Yax0c/CFybYGuE2VlTTzRcQK3cMJCBeORgtGvU
         5+MP43Z7P9OwDRfIFUG1DpNI+l58rb92keo2lr7zjmJ9V0g53R/3ayxXRc1bXKrtGe5V
         v0JA==
X-Forwarded-Encrypted: i=1; AJvYcCXEfIzFyDC73l4Pqk2aJxP4jXGHrWpIKrrU0DMnfgMafq9v9lnMPwr6IWcvAtGGVyK8pooCpTI2LDc08trXOtqTUz8=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz7TY5xbzrV0UttOafVCuvsW8uEJ6zE7UzL0vS8zxYZIB4v9wzZ
	aan3o6g4nIQI2R0kOdWl8jI7bvazD6ukQmsjQ93sNh3S2uo2dPTBMXQH
X-Gm-Gg: AY/fxX6KwIkgCtWKj3WFYZLdi4/KxDTJNKNl40EyrJvXoFZhOZIwHeMbqa6CIBKH+LM
	dtJYQgdqJEEW1RHR4PWiZxvSlyCsyWCsURmvm2fYnU0NQ21tcW6U8SDL2/bBaxLyVFrZFWqrxOh
	nl6j3Hk3kZ8gR7rSqLET2pZx3Qmip9K90uxLkTWQ2dECSIHchwV/cNwiV2ce4ZBtmfJy/Se7/eO
	4cRDwm3KyvQtd93kzJJzc3g/fayIf0JD+BgTT6hx/4b5ZXK3JbCO6HkJ+DgF2+IJk/WqH7CsZQC
	V+2zX1kvMuRjbhuXGZ/kB82+gLPGK2Deh//dYCKRoGqth7rGGGT38LynxXnVuBjjcKxMiKU5rjP
	lDjRuU8NWXFNpd24Um1qE15eTgOq42djgfBjCJEOvTrB8rnxY09OEh96VTzzo7hoSm7vs69qwHb
	3+wXPSNmaqMEgDSaRmTbPnzeFkxjdm1g==
X-Google-Smtp-Source: AGHT+IF/jR/L8JTPgNaUn8Yh5ulAseDF8/Ax9eL0koAm4gw/jN+31HrwKy1UO33jEjb+V0J3XH2H2A==
X-Received: by 2002:a05:6000:290b:b0:431:c73:48a8 with SMTP id ffacd0b85a97d-4324e4faa3emr47728239f8f.29.1767176189672;
        Wed, 31 Dec 2025 02:16:29 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2c4fsm73718753f8f.42.2025.12.31.02.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 02:16:27 -0800 (PST)
Message-ID: <200cc4a2-a92c-4601-9076-cf9dc706f928@gmail.com>
Date: Wed, 31 Dec 2025 11:16:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] Many CVE_PRODUCTS patches
To: ChenQi <Qi.Chen@windriver.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <3d4935dc-f9b9-400e-831e-843104190500@gmail.com>
 <ea64bef2-30db-477f-bd9c-9dd27d6599d1@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <ea64bef2-30db-477f-bd9c-9dd27d6599d1@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 10:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123076

On 12/31/25 09:12, ChenQi wrote:
> I think your finding is important.
>
> Yet, I'd suggest we change the default value in pypi.bbclass, removing 
> the 'python:' prefix.
> That would set a more reasonable value.
>
> Take NVD data as an example:
> $ grep 'cpe:2.3:a:python:' ~/.cvedb/nvdcve-2.0-* | grep -v 
> ':python:python:' | wc -l
> 159
>
> In all NVD data, from 2002 to 2025 (+ Modified, Recent), there are only 
> 159 lines that have 'python:' prefix.
> That's a very small percentage. To be honest, the number is way below my 
> initial guess.
>
> So, could you please try changing the default value in pypi.bbclass to 
> see how things work?

I think you are correct, and changing the default to
CVE_PRODUCT ?= "${PYPI_PACKAGE}"
would simplify things a lot, and probably would improve the status quo.
That would make about 80% of these patches obsolete, and I think the
introduced incorrect changes would be minimal (I know that it would
mis-identify as python a few wordpress and jenkins plugins and also 1 or
2 rust projects, but I am talking about ~10 recipes altogether in
meta-oe. All can be trivially corrected with specific CVE_PRODUCT) -
overall I think it would do more good than harm.
Though I haven't checked specifically, but I think there are recipes
with the same issue in oe-core also, which would be helped too.

With that said I am not on oe-core list, and I don't plan to go back
voluntarily- if you (or anyone else) would like to propose it however,
please feel free.

> Regards,
> Qi
>
>
> On 12/30/25 23:51, Gyorgy Sarvari via lists.openembedded.org wrote:
>> Apologies for this CVE_PRODUCT patch-tsunami.
>>
>> While reviewing an earlier submitted CVE patch, I was wondering why that
>> CVE didn't show up in the CVE report - it turned out that almost all
>> recipes using the pypi class use the default CVE_PRODUCT, however there
>> are quite a few where it is not appropriate, making the cve-checker to
>> miss relevant CVEs.
>>
>> For today I don't plan to spam further, but I'm only about halfway
>> through my list for the master branch, about the same amount left for
>> tomorrow-ish.
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#123037): https://lists.openembedded.org/g/openembedded-devel/message/123037
>> Mute This Topic: https://lists.openembedded.org/mt/116999150/7304865
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Qi.Chen@eng.windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


