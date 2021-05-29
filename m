Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.23281.1622310839480874539
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 May 2021 10:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=axFTo5p/;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id n12so1811632pgs.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 May 2021 10:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SKTQv71EeIJ8ePyFtt/o1Ff3m+Vz2P/tgby7XgNXGvg=;
        b=axFTo5p/bslWyUSYDDbNG7d+tRsFT2NDMR3C0EMoBmZJCLo0XbbQliY/KspzCk5Qda
         UzdT4mQnmDw8vy4R/29ARte5gMi5j4NBOAvtM0DbOd3Ub29Zh8UYG+zYJIixqRz4MB9u
         lQR1ZBdOOfr0x3gO+wysV3qtf+DhCi36j53ydVwpJlYOHcYZ6N2nf7U9pu/lWraYmogZ
         EvUptWTDAEjzzaRaW0DdDj6g0GiH/5rd8YCZDxQtEzpzABlU0ODpBcTDVPynfv7nEjda
         OPOI/ftIXmtLBRQrIRjcgy10TKEaAN1e0zVTK69AEiBr5AUk86qxw61/fZRXcI90iDaE
         BDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=SKTQv71EeIJ8ePyFtt/o1Ff3m+Vz2P/tgby7XgNXGvg=;
        b=Us7JqpLp37WXPOswC1mY0nope/o/H3VqbragCvB3banucqccDiEOdOTWJWzUG9pcIT
         SlG9NGuUTYnQw0B9BuDzMUo+09edSXNYnTCZ9RYLv+5mNNwxBpZBMGe9nnA/r1F/Gd1v
         vbvrT12KUebPg5tlHJxjpRuuCXrzw5gipe2LbfkhkHkC2mh9ctrJWxcKpQOjbh6nHVhk
         tV2y6ua9f7QMxPH7IktGvpl5Hl0nSfyxIe9kS0bEEBNZB/sySvGcKdzUYCIOj9luHa0X
         hcJcELNrq9LCRq+gUd/P40TqRJfB32AWYRFE6rv4b71DFJhdgJeQRmh/cYqPYZlUQWqS
         /tPQ==
X-Gm-Message-State: AOAM533p6pZX446qrlialAoy8rbZT5Q1K1BqJyhXrFv4yBPOedZDRsy5
	u1U0vspIa1iT2DnaQU4+2NuOd5aG/fyS5A==
X-Google-Smtp-Source: ABdhPJwHJJSYFWGxUL32HJiPCw8ILVHqKGh/iRqTGbgdoX2S4HYo9MPQFS3adBa95SNQeRLCX3g49A==
X-Received: by 2002:a63:4145:: with SMTP id o66mr14951252pga.4.1622310838631;
        Sat, 29 May 2021 10:53:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:69a6:1b71:6b06:2b49? ([2601:646:9200:a0f0:69a6:1b71:6b06:2b49])
        by smtp.gmail.com with ESMTPSA id h18sm2559294pgl.87.2021.05.29.10.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 May 2021 10:53:58 -0700 (PDT)
Subject: Re: [oe] [meta-oe][master][PATCH 1/2] p7zip: build and package lib7z.so needed for fastboot
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20210526173229.553-1-Nisha.Parrakat@kpit.com>
 <57321835-c8d5-754f-b974-6ee35912f88d@gmail.com>
 <PN0PR01MB52838F54DAB2752439C8C9BEEE249@PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM>
 <CAMKF1sqZ1B1CXha8DPVPZxz+JOjyLoqVCptuLfexJStnjroAhw@mail.gmail.com>
 <CA+chaQeQruUasefzSrxG1YuaFvNer85RwduAA=Om4HYYQFFFfA@mail.gmail.com>
 <9cb3d254-988e-ddbe-60e2-cdc61e45e822@gmail.com>
 <20210529171641.6pbvt37failkvqcn@jama>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <18aa231b-c9df-dbb1-1f8e-d0aab9c448bc@gmail.com>
Date: Sat, 29 May 2021 10:53:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210529171641.6pbvt37failkvqcn@jama>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/29/21 10:16 AM, Martin Jansa wrote:
> On Sat, May 29, 2021 at 10:06:33AM -0700, Khem Raj wrote:
>>
>>
>> On 5/29/21 1:55 AM, Martin Jansa wrote:
>>> The version merged in master with:
>>> https://git.openembedded.org/meta-openembedded/commit/?id=3c36a8efe2a964c3aa9bfcd836cee3f80a837fcd <https://git.openembedded.org/meta-openembedded/commit/?id=3c36a8efe2a964c3aa9bfcd836cee3f80a837fcd>
>>>
>>> still doesn't apply cleanly:
>>>
>>
>> yes infact and CI reported it too
>>
>> http://jenkins.nas-admin.org/view/OE/job/oe_world_qemuarm/2665/console
>>
>> and I missed loooking beyond the gensio issue there.
> 
> Understood, you still do a great job catching (and fixing) most issues.
> 
>>>
>>> Will send a fix for this.
>>>
>>
>> really appreacite that.
> 
> Maintaining meta-oe for many years, before Armin and then you finally
> removed that burden from me has taught me how much work it is just to
> keep it build-able and how little help maintainer gets - so I'm trying
> to continue submitting fixes in the little spare time I've left.

I encourage everyone to chime in and lend a helping hand in whichever 
way they can. Even if someoone looked through CI builds [1] for errors 
would be a great help, perhaps tooling the failures to be emailed to OE 
devel ml could be done too if someone has spare time.

[1] http://jenkins.nas-admin.org/view/OE/

> 
> Thanks Khem!!!
> 


> Cheers,
> 
