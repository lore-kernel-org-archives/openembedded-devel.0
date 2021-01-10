Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.23320.1610308324991266939
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Jan 2021 11:52:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OsuWGgtu;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id be12so8387736plb.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Jan 2021 11:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Linq2zl2yeq9B47QxvBt5UwNOUPFeepG0PT/KTo9qlw=;
        b=OsuWGgtu+qAFY4dv0eQp6pPKlFkRosKdQ6agPlU5AjvFZ511U0Cmq2+NiqCBSBfrau
         ZSqg7ubTADoYLlqryUx0pIn2xdD0UlQj7JTy4ShB23hdUbKjd1oWGB2tPz0jYbeGy5kf
         scsLnW5XxXmNSfSy2IPXh3C6E6pk2mDx7EgN2TcSATWLRNf2wS7Cjgggz6NSJBDOkDws
         +/qJ5/tqHOORYZ0lJlBMc09RtqSHRdskCaMF6bKvv30tRKeL1UoqWm0kbsLM/gJLzUI/
         khDCaHY6jq2BtA77XAor2iEiEfoH7i7LZOFCA0nqSxhUe7JCQRPmYh5CzhE0KnLGDZpX
         7k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Linq2zl2yeq9B47QxvBt5UwNOUPFeepG0PT/KTo9qlw=;
        b=CdsO8Kr/4QbpozVcPDj9DtqQF76f1zvppzLvoXh2av67s1FJW0BBQVOPIxTQJWWeqQ
         igwR2lVPtsBUJDuZ+Y5T8lwB6UWidmHxQoGX0hhcabyAdW8x4MJhQ8KgSACmPdpLcsZ6
         BCAPngNqtfecOm2Ct1Kth/9Fryqj9N1q7/eXq5Gu/nL60KxYSV3e77Wq020jSkHjeZK8
         EZBsNczkDWIOm8LMAHsivUb0xSGlNINk12NRnjfAhE1hV0a7iRaMOFmyfqWZhXYOQO1A
         kmJMvZ4+1xdLhLFDiFK+9qRymq/D/Q/qtGkdHSD9ObJLMu7YdmSYSCvoJ+ra/EYZItGl
         8XCQ==
X-Gm-Message-State: AOAM533nIQaCTn5YotXYseWNEnstZJ9uy6EAnWb58dAbEd0n05QT9/7e
	Fh5iiQsNmmwq3M+M8AGCqTXyQeUh5mQsRw==
X-Google-Smtp-Source: ABdhPJwvLLA1HvfVPTBG3UcJkvDvHbfXJ3LjB4uor7wMP/9PxK8KH/6kTadiXkGTG4HYNe1S41c5dg==
X-Received: by 2002:a17:90a:e386:: with SMTP id b6mr14127271pjz.134.1610308324169;
        Sun, 10 Jan 2021 11:52:04 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:88e9:9a33:2bf9:607d? ([2601:202:4180:a5c0:88e9:9a33:2bf9:607d])
        by smtp.gmail.com with ESMTPSA id e5sm15562578pjs.0.2021.01.10.11.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jan 2021 11:52:03 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH 1/3] nodejs: 12.19.0 -> 12.19.1
To: Sean Nyekjaer <sean@geanix.com>, openembedded-devel@lists.openembedded.org
References: <20201216053013.1661310-1-raj.khem@gmail.com>
 <88ab18eb-725c-0e36-debc-ddd21fd36772@geanix.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <50947271-f320-c221-1049-cbbca2f085b7@gmail.com>
Date: Sun, 10 Jan 2021 11:52:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <88ab18eb-725c-0e36-debc-ddd21fd36772@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/5/21 10:40 PM, Sean Nyekjaer wrote:
>
>
> On 16/12/2020 06.30, Khem Raj wrote:
>> From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
>>
>> Uprev nodejs in order to fix CVE-2020-8277.
>> This CVE allows an attacker to trigger a DNS request for a host
>> of their choice, which could trigger a Denial of Service in
>> nodejs versions < 12.19.1.
>>
>> See https://nvd.nist.gov/vuln/detail/CVE-2020-8277 for details.
>>
>> CVE: CVE-2020-8277
>> Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Hi Armin,
>
> Will you please backport this to gatesgarth
sure thing. its in the test branch.

thanks for the input.

-armin
>
> /Sean

