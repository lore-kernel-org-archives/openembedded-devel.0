Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DCDC83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 09:15:04 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.17789.1752657302709245055
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jul 2025 02:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hHpI9rz8;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so11862435a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 02:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752657301; x=1753262101; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQzfqr1plsUne1oNO0WFvkNu4ETfl2FhaOOfAJ8skJ8=;
        b=hHpI9rz8uoSw7uxM7GCj9JY0ppv5N69quLpKEj6jvJk6URcYb09G7jh41JdUk9RZ3K
         m3RdheBiQIbYIy7YdW470mQxKBX+39rzZ9+7or4QQBNoyViMi7FvdCbNlFyclN70g0Rx
         u+26U/d/FBHzLzGZ+ZaZ1E4qtAHhIrMzbaYCSDrqygYYmcOX/de9LCNcvFX6jug7S12Q
         gB0vCOJtkLXqT3UHpercF7fIsbc8qGhF81sRVd3oacAi9pb9o8GE2yltWuS8nh+1Nhf5
         ydIqsUGqv22BhXDVl5wM4sa3UHIQcv+Am0zz/NABkVf2jKK/f6Tj7dbA5iTzcz7wNTM3
         1NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752657301; x=1753262101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQzfqr1plsUne1oNO0WFvkNu4ETfl2FhaOOfAJ8skJ8=;
        b=VQEkzl/cPfvCPxvcElTiuOK3Y+LA/VIOo/hczUB6YDKz+OcM2MWhGaxrXtlnWsgwVv
         gfOX2XVsHj3XDCOTc1rdwf+byR8DEGlCgDK+MZSfRBus+6s3AAVxQwqdDmDV9vguZXZQ
         +wLzBJdA0nLyvCKXcqvqS+trVzzZ04cf86E5cGV2F1V8XBz3cmJAOVkS1ZHZEYXxnQ4Z
         SBxHe3sgRgP20OOATMp/12to08raQp/YzCYPXkPPBEqVF602iGPF8K8APwHl0YaQxsmQ
         XzgMljLLBo8j45j5Z/3WORsXKEJ5gQqR4FQRkeC8b6ysml0B00viw4QjO6sXS50EGRgN
         zbEg==
X-Forwarded-Encrypted: i=1; AJvYcCX0A/inAuMbjWZdSDd9k2486swlxUY8nI0IjbZZ5zcmNEozvSAaVjuXPPVXsiczz61cBGGm+rQ4gMQFd0SuVeG0SKM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyToeOxMTBkARW2J76mPjK3umXfLc6XsA952UPGj+7Ew5N60D9P
	fW0kKHPBPh/y2qH3KGPK82Q5IgUxtdpMqHLxqGW1csV5QmVR5MxhJKOROfUYQg==
X-Gm-Gg: ASbGncsAbg15Y2VA/tJZU0fdwVK063Fw8lLc/NkFcYZS9o6uZOeGD39kGq3UWkKH0HP
	N8FB/5kPCbfED27J6FLlCEgTOL5t9hrndGICRqpgsUME+AcuwLMHRraklYTvS4ny/W+TtxmAt9N
	3gixUzIeU5qu50htr9dTTvbeJqXsiwQW6CUm4o20RT26Cypp/YFhEftMM2mKkQ4MXk9PhQkKcd+
	+BjmGnaggELvy2oOVL3B8nOkybR0/CEfGUAY3RIkH4F+QPxnJ2ItOvge2zSgiCNM2Dn9p8NGBd7
	Td6kQn7Bg4rm6iFUSyd4mxAIgPoamDHo3o55qCRnoPygJQgg8RaB+Mb+snM/HZEVIV3tS1gUtje
	ME7qoOFLWPUNAr1dlBTXl58sAH5fAfw==
X-Google-Smtp-Source: AGHT+IGkYtUlKyBXugpBR1gfNaSj/o7MYgyALBHEvOszcn3o/2U7tlIGOSLn3I7t+JGNjKRG0Uw8RQ==
X-Received: by 2002:a05:6402:348a:b0:606:df70:7aa2 with SMTP id 4fb4d7f45d1cf-61285bf41c5mr1706610a12.31.1752657300460;
        Wed, 16 Jul 2025 02:15:00 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976fd50sm8357938a12.67.2025.07.16.02.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 02:15:00 -0700 (PDT)
Message-ID: <d84a18d7-b26f-4e7b-8a36-6d47f82bc8f9@gmail.com>
Date: Wed, 16 Jul 2025 11:14:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [kirkstone][meta-python][PATCH] python3-aiohttp: fix
 CVE-2025-53643 and drop CVE-2024-42367 patch
To: Jiaying.Song.CN@windriver.com, openembedded-devel@lists.openembedded.org
Cc: changqing.li@windriver.com
References: <20250716073758.3031818-1-jiaying.song.cn@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250716073758.3031818-1-jiaying.song.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 09:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118593

On 7/16/25 09:37, Song, Jiaying (CN) via lists.openembedded.org wrote:
> - Drop CVE-2024-42367.patch:
> According to upstream discussion and advisory [1][2], aiohttp 3.8.6 is
> not affected by CVE-2024-42367, and the patch is therefore no longer
> needed.
>
> [1] https://github.com/advisories/GHSA-jwhx-xcg6-8xhj
> [2] https://github.com/aio-libs/aiohttp/issues/11149
>
>
Offtopic: I'm a bit surprised that this patch was merged eventually,
after it was agreed that it is not useful after its original submission,
a few weeks ago.

