Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.6903.1588325864303010116
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 02:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wsdo5xxj;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: robert.berger.oe.devel@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id g12so5743194wmh.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 02:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cBRWT3+HD3rGpHoMq8epw6u3Xc8f7vPSStnzjLPJSmk=;
        b=Wsdo5xxjnXyPFWrQZ6C4E0ZSRpOqfxsZB/WPbVXeMM+a2ZjMQjX3bFONW/nGco4TTp
         2lSYitVRQ+XhxDYAHsJbpBeIcN5ZePfwkDzVzbWA6WMzhPHlOMT9o726weqvLSTCLTUN
         DyDsBEW22IxemkXvB5772+b3NWo+et4sVbEfQkikfKZcUP7mBrDL4BCrFcUs34Vo/7eK
         bFTYL+gF1HJBztUfEKHgXrhvVNIcCkjhpQnVjWExMo+rOYPMot0CTYuqbVQTfnyysNIx
         ZjeKRxUS2tcZ1q3XwLv9WROimnCxxtkTHE5N0rBhQMQOAOWlxscaay+i8TU5AMvX6rDY
         9ENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cBRWT3+HD3rGpHoMq8epw6u3Xc8f7vPSStnzjLPJSmk=;
        b=lQHwacuHkR4WWQ03G3mYknUiBn1gZ5102s02J5NmScWJWLJnFKygKuveV5VYScHuZ9
         OKN78nCa6AgPkTM8ZN1mlYr1C4pE01XILAahgi+qswcMM4KkQcqSDdwHV1GVlBqS1wgF
         Mzw2/Ys8hhZ8D+Gg73iRQ/eqAfCGQWlviZanE0ySDgubiBrko3O2nlssqVRvXFzyYRqF
         gAIb43/5Gt3wb+CRIPI1E7HUSRLisStez452GOjFpkx0S7CB3Lsfed/Xp3l37+jGM2n5
         rmpPAd8iuJs7Slt2olE0amPMJPTsq54OC47sMKTVviWuyYHGwCAQnv9hALXPyLPuXHnf
         XcKA==
X-Gm-Message-State: AGi0PuaEAjdXYeDoH601IFm0t4UfE6RqiMMbFONc/a7jnzt+eCJ1KLqV
	zOpmagkjaDw7hyVNu0aL7uJYMsDw
X-Google-Smtp-Source: APiQypJ1H0EoT1vV7tH2KNWQiUeb43hAZowvujdmHU/aY/YhGr39uq65oPJ7VWgKCf9SN8LZ5DBUUw==
X-Received: by 2002:a1c:5683:: with SMTP id k125mr3038636wmb.17.1588325862469;
        Fri, 01 May 2020 02:37:42 -0700 (PDT)
Return-Path: <robert.berger.oe.devel@gmail.com>
Received: from [192.168.42.52] (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id h17sm3111612wmm.6.2020.05.01.02.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 02:37:42 -0700 (PDT)
Subject: Re: [meta-java] host gcc-9, icetea-7 gcc-9 but how older gcc versions?
To: Richard Leitner <richard.leitner@skidata.com>,
 oecore.mailinglist@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
 <20200429100259.GA249641@pcleri>
 <92bb1785-280d-ba90-9366-e2a7793d36d5@gmail.com>
 <20200429130233.GB249641@pcleri>
 <1550debd-8a7f-9a1a-0e12-9566b69405b4@gmail.com>
 <20200430211352.GB410632@pcleri>
From: "Robert Berger" <robert.berger.oe.devel@gmail.com>
Message-ID: <2b20147c-2312-e230-a437-d6d59b7b1c66@gmail.com>
Date: Fri, 1 May 2020 12:37:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430211352.GB410632@pcleri>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Please see my comments in-line.

On 01/05/2020 00:13, Richard Leitner wrote:
> On Thu, Apr 30, 2020 at 06:43:46PM +0300, Robert Berger wrote:
>> Hi,
>>
>> Is this supposed to work with host gcc 9?
> 
> Yes, for me it works with "gcc (GCC) 9.3.1 20200408 (Red Hat 9.3.1-2)"

Hmm for gcc (Ubuntu 9.2.1-17ubuntu1~16.04) 9.2.1 20191102

it needs additional CFLAGS.

Do we really need to distinguish also Distros and/or 9.3 vs. 9.2??

Does it do any harm if you add this?

https://github.com/RobertBerger/meta-java/commit/3db52ddcb7771e989cf39048a7b084d040d6b5b0

> 
>>
>> This was the first test I did and it bombed.
>>
>> I used all upstream unmodified dunfell branches plus your branch.
> 
> same did I on my Fedora box and it built and succeeded tests... That's
> strange.
> 
> Have you a clean build?

Yes all fresh and also no SSTATE or SSTATE cache.

If you would like to reproduce the problem I can provide you with ssh 
access to my build environment to show you quickly.

The build docker container I use is this one:

https://hub.docker.com/r/reliableembeddedsystems/poky-container/tags

Tag: ubuntu-16.04-gcc-9

Also I believe it can be easily reproduced with a "dirty" build as well, 
if I remove my 2 lines and just build icedtea-native.

> 
> regards;rl
> 
>> Regards,
>>
>> Robert
>>

Regards,

Robert
