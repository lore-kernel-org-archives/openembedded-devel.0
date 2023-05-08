Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B9FC7EE23
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:50:28 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.104174.1683543027826643195
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VJZpzivy;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so47397076a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 03:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683543026; x=1686135026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A2WnG8Uz5bbqs2avZ6XkSvNtHsuCkPciIKU7wAP+N0U=;
        b=VJZpzivylertuw+Qfd3MNGm04R2O4JPk/e7uOUCVo4DkloX4yeTZ13HjcRXsELRpEC
         /Pz9SLMPXVErrAFhK8UXr6xIojMGskgrtmncqZ6GL7INvdzdySvRd7LB9dUiTmQFobAW
         Q6woj21COs0YghKSqTqzVrVZZC5CTEG330eZ+h3bdB7Ko0xemVzm6gbR9YUe1FmQ64Co
         ZhUSisRczSpiXWCrxqKGDCDuttHw0mLeevh2BrBZGOJK3TP8nw5+pV+oInql95FD48WG
         ASteEIQpGW25ZFy2B9RacPjry1d4arOfJV5+TDSgonuuI7bGMrYpoLt41AcERXxfZx7d
         6hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683543026; x=1686135026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2WnG8Uz5bbqs2avZ6XkSvNtHsuCkPciIKU7wAP+N0U=;
        b=T4eYvMtunymn5zzjsQ1Xct3LnpkSebFvFAy/HZd8glNa3dwYKfI42dmR7tNmUewq75
         edORrQCo7pC93j2Jx3PwAb+oP3EqyputuRs7T9bhwp6XUSuQ53VQziTGC0sSTM6FEH7A
         yijVScio3pwJdkU8T1PEVZNC1cwiKQtd9FEbiRI6kSb9H0tb8ghtC9f0fHZu7l7nL94A
         WRMWknRBaGWpIEzNOcSM0e73vQ5u0/9lqQzudneCyn5JpXwsh0NWxBe8f6ps2eQjkF8U
         awIECs1bV4g8DDDIg07qc3uFYFKyeG5+ZVfYHZU9yv6obKQqTQD8+jE5Dej9Zc/F/Gq9
         bWOQ==
X-Gm-Message-State: AC+VfDzNknR3yRFTRVYjDZl2oCilCdrB1hofTgxPF236LuPBDTy9Xpex
	89pt3itIJwcx6WndEexYJfc=
X-Google-Smtp-Source: ACHHUZ4xe/I6T8WnfdE+86WCJnekZ/n7QJ5CzJ6IK/pcfqr4SJzDjDgDhdFdrgtLoYyhFS/vC0A2wg==
X-Received: by 2002:a17:907:6d22:b0:965:d7c7:24db with SMTP id sa34-20020a1709076d2200b00965d7c724dbmr8724573ejc.32.1683543025622;
        Mon, 08 May 2023 03:50:25 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id z10-20020a1709063a0a00b0094b5ce9d43dsm4800385eje.85.2023.05.08.03.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 03:50:25 -0700 (PDT)
Message-ID: <aa0bb88c-b1ac-c021-341f-33b870831da2@gmail.com>
Date: Mon, 8 May 2023 12:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe] [meta-oe][PATCH 3/3] meta-oe/conf/layer.conf: Add
 PREFERRED_[R]PROVIDER_virtual/opencl-icd
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20230309081036.3179583-1-zboszor@gmail.com>
 <20230309081036.3179583-3-zboszor@gmail.com>
 <DB5PR02MB10213D9166C80E435523C7EB3EF659@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <DB5PR02MB10213D9166C80E435523C7EB3EF659@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102436

2023. 04. 26. 19:29 keltezéssel, Peter Kjellerstedt írta:
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Zoltan Boszormenyi
>> Sent: den 9 mars 2023 09:11
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Zoltán Böszörményi <zboszor@gmail.com>
>> Subject: [oe] [meta-oe][PATCH 3/3] meta-oe/conf/layer.conf: Add PREFERRED_[R]PROVIDER_virtual/opencl-icd
>>
>> Select opencl-icd-loader as the preferred provider for both
>> build and runtime.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta-oe/conf/layer.conf | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
>> index a1f50879e..aee1fa786 100644
>> --- a/meta-oe/conf/layer.conf
>> +++ b/meta-oe/conf/layer.conf
>> @@ -50,6 +50,8 @@ PREFERRED_RPROVIDER_libdevmapper = "lvm2"
>>   PREFERRED_PROVIDER_android-tools-conf ?= "android-tools-conf"
>>   # Configures whether coreutils or uutils-coreutils is used.
>>   PREFERRED_PROVIDER_coreutils = "coreutils"
>> +PREFERRED_PROVIDER_virtual/opencl-icd ?= "opencl-icd-loader"
>> +PREFERRED_RPROVIDER_virtual/opencl-icd ?= "opencl-icd-loader"
> There are no runtime dependencies on virtual/opencl-icd in meta-openembedded.
> Runtime dependencies on virtual/... are also considered wrong as they
> do not work as expected (they only work as long as you do not try to
> create a package feed AFAIUI, which is why OE-Core uses VIRTUAL-RUNTIME_...
> instead). So why do you need to set PREFERRED_RPROVIDER_virtual/opencl-icd
> (and add the corresponding RPROVIDES:${PN} to ocl-icd and opencl-icd-loader)?

See this mail thread:

https://lists.openembedded.org/g/openembedded-core/topic/97477512#178183

>
>>   SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>>     fbset-modes \
>> --
>> 2.39.2
> //Peter
>


