Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web08.41.1620093724661530762
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 19:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M4WJm+71;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id i26so7345181oii.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 19:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=mzZK7Jn4AVms7tQPm+Z8Dia7fYHLw1lnjq1//Hv2EcE=;
        b=M4WJm+71nAsfx9ywA0dADUY4hYPZ2PYfFR8iJSCtAONHywMV7vpurgq751SEGcCdzC
         7edmBwfcbmFvshmFcN8L9kT9r8d7MWmnTVKHVcYiheDpSDKMrgKUgBwz54fsuvwsDDiF
         Mg9JiBpQyaQk1KN+xxDb7XUyFMzpHAG1Xdk7QMMri1vCYE7rHdpCJNfFltY2pfn7zKfZ
         EOlnTAmAjuWhBoK/tSPASRDxGXh0x103VjRXnwdIpIbIzMJy70cTp7BUWgxTyeTlbHKo
         qe45qgzzRULNINDLl2neinETmvQWyG7tugew5kc9SSicV6IsBZqj0nFsp+woCmV14Hag
         TwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=mzZK7Jn4AVms7tQPm+Z8Dia7fYHLw1lnjq1//Hv2EcE=;
        b=Cdf9cZmA74E0uiCplNKS27nQe3bUc589CToCTVd+ygjZAjDSYC0LAbFsDgRQHz+iQM
         WGmXrPBriyuK+Ncqdd0aC3B8T2AocrCAFIODoMEaTQdwMZV+/2SbNeLHakvKlWBj+jFy
         TkJu2L1xAzi5HzxGN44fmahhNg2Xt+j15LV4VPUnc5qoW7Lr5ldbkj8eUsj8EcePtnEv
         kCBD09T5MUVzA8FVskfR5P5mNj6/QUMuOzFw0z++Aeu5rzrUURk++SciqPeHrfTAuOYY
         hQVYuvjF5kAIMymvQ/JX5L9vUsiIoyuWBNtDemr+zAYachsl/PJMfoFCfbuJ+47bxu2a
         d5Bg==
X-Gm-Message-State: AOAM532bGiUZSkEziS9DZ4FXvtuoMpe37rU/r1FL8Fo6aqsvYfXFMbOc
	DoiACklkSB52vSpXB60C17xv3VnIVAP+jA==
X-Google-Smtp-Source: ABdhPJxaq4mvAyy1TMjmQOh6/RtDfGvgF4DW40xqhdH0cPd6xy9HjxyurybHacPwU3hyHxXLZVEe/g==
X-Received: by 2002:aca:b387:: with SMTP id c129mr1138634oif.30.1620093723821;
        Mon, 03 May 2021 19:02:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:dc35:22d6:72af:c1da? ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id p1sm443321otk.58.2021.05.03.19.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 19:02:03 -0700 (PDT)
Subject: Re: [oe] [PATCH] tbb: Disable PPC as COMPATIBLE_MACHINE
To: Khem Raj <raj.khem@gmail.com>
Cc: Saul Wold <Saul.Wold@windriver.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210503154248.2359344-1-saul.wold@windriver.com>
 <20210503154248.2359344-2-saul.wold@windriver.com>
 <56aac87e-556a-dfba-4aca-70644a8fcd9a@gmail.com>
 <CAMKF1sqgwU5-KtiepOD-ct5dP=HV464Wis+1vQSXnXWVf6v=aQ@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <a9affa6e-e7d6-2b5d-5182-e29d469c173b@gmail.com>
Date: Mon, 3 May 2021 19:02:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqgwU5-KtiepOD-ct5dP=HV464Wis+1vQSXnXWVf6v=aQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/3/21 12:59 PM, Khem Raj wrote:
> On Mon, May 3, 2021 at 12:07 PM akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 5/3/21 8:42 AM, Saul Wold wrote:
>>> From: Saul Wold <Saul.Wold@windriver.com>
>>>
>>> The latest version does not support PPC architecture, so disable
>>> the it. Otherwise the following error occurs:
>>>
>>> /srv/nvme/yocto/hardknott/builds/tbb/tmp/work/ppc7400-poky-linux/tbb/2021.2.0-r0/git/src/tbb/tools_api/ittnotify_config.h:338:12: error: '__TBB_machine_fetchadd4' was not declared in this scope
>>>   338 |     return __TBB_machine_fetchadd4(ptr, 1) + 1L;
>>>       |            ^~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
>>> index b05a59dc7..d8a18866c 100644
>>> --- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
>>> +++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
>>> @@ -43,3 +43,6 @@ LDFLAGS_append_mips = " -latomic"
>>>  LDFLAGS_append_mipsel = " -latomic"
>>>
>>>  LDFLAGS_append_libc-musl = " -lucontext"
>>> +
>>> +# The latest version of oneTBB does not support PPC
>>> +COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
>> Should we also exclude including that package for ppc in
>> packagegroup-meta-oe.bb?
>>
>> RDEPENDS_packagegroup-meta-oe-support_remove_powerpc = "ssiapi tbb"  <<<---?
> yes it should be.
sysdig and opencv both have a depends on tbb. I suspect world builds may
fail.

-armin
>
>>> 
>>>

