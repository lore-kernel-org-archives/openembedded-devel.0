Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D3BC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 14:58:24 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.16645.1685545096329926791
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 07:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=phicB+Ay;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6af9dcc98f0so4501094a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685545095; x=1688137095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cc5gdcplauP19oy4Yy9+IUYVQbRArh4eBQLdk5pzoWY=;
        b=phicB+Ay1AnnVpsF6yfSq2D+C7RY3TV9YQe056lFViZRpASFiV1keGpX58ISAL2iFq
         m7xECXv6MzA+DPVQw7nExQ/n8Zl0Fcdq19pSFnO+vkCRr0NVkPhrfvsHGuuJkPcdhdUW
         mE2Qgp2287hwUxPxdpCoUW9VDVP5dXMW97vsjJwkuUo9/ZwPsNIm1j6tzQeFg3XPUnOp
         GyPjPEFf0kYdN5NbcMnYYr4yXLynWzYcOaOImVFYxoflrD39FYngF5I68THiaXdR4nst
         JQg7CuM5fc09NaMMFnBYc9tkZronNV9YCWnGH36VUJ2MOiDVQWowtBseiWXvDRHucMGp
         djyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685545095; x=1688137095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cc5gdcplauP19oy4Yy9+IUYVQbRArh4eBQLdk5pzoWY=;
        b=TY9o5HrLrZekx0dzi6t9MSRGDLweVTbECA+0imIbmj+SBz2Qv2bYFbgKz12QuCgtse
         jStvXQjw7FYiOy+c75C+++nlT2Od9Ykv7bO+gm/yEkF+6nOJWCMaHR7UptasnpuQBvxc
         fel5WyAa2Y0Bejrc9u/PY9NdaxHo4PZ1YX6BEUm5kR0uESCvw+K9dMFwLK0mVddbXoFV
         8d8lUVFp1FR4xOwwDDXejf9KdoMSt5opSVjuYIVfjsWBAiSq1+tBF4tlv5SznhZbXEWB
         a/hY5FeRyZ3GZPDx/4PapxUwqaQPFgnVTkN2HHkPvZzpxVixCWJrp+kUQulFUPGKZG0M
         WfnA==
X-Gm-Message-State: AC+VfDzyujZnrcdSFvQKr8T29w33gSu+/a83SKQnq9aMIgulKPtjpub+
	sbYclW4DxNB+Hyye6Y8FCPM=
X-Google-Smtp-Source: ACHHUZ6/tKa0+HeAg3ipz4Gjqc0RioQVSEca7hXUdOK8Y4cww2VoaIwYbH+g1Gjn58oQcY6xZQhiXg==
X-Received: by 2002:a05:6358:88a:b0:127:766a:36f8 with SMTP id m10-20020a056358088a00b00127766a36f8mr787286rwj.19.1685545095453;
        Wed, 31 May 2023 07:58:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:6e6a:b791:76e3:f9c1? ([2600:1700:9190:ba10:6e6a:b791:76e3:f9c1])
        by smtp.gmail.com with ESMTPSA id y16-20020a259290000000b00baaf5cccd72sm2450991ybl.31.2023.05.31.07.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 07:58:14 -0700 (PDT)
Message-ID: <55c48667-31c7-4d52-d0bf-18fbfd753188@gmail.com>
Date: Wed, 31 May 2023 10:58:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-oe][PATCH] gnulib: Update recipe name to 2018-12-18
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)"
 <schitrod@cisco.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20230519052617.2747159-1-schitrod@cisco.com>
 <SJ0PR11MB6717297349042BA59351FBB2DC4B9@SJ0PR11MB6717.namprd11.prod.outlook.com>
 <CAMKF1somw8Oxxe7QsQv-zOqE7mx4=WrbnH2y4F4Y=rg5CbT0jg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <CAMKF1somw8Oxxe7QsQv-zOqE7mx4=WrbnH2y4F4Y=rg5CbT0jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 14:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103066



On 5/30/23 12:12 PM, Khem Raj wrote:
> On Tue, May 30, 2023 at 2:27 AM Sanjaykumar kantibhai Chitroda -X
> (schitrod - E-INFO CHIPS INC at Cisco) <schitrod@cisco.com> wrote:
>> Hi all,
>>
>> Any update/comment ?
>> @raj.khem@gmail.com can you please guide me on how to procced further ?
>>
> the master branch has gnulib_2018-12-18.bb so this patch is not for
> master. which branch are you referring to?
> if its for a release branch then we do not allow version upgrades only
> rare exceptions, I will leave it to Armin if its for a release branch

This seems like a reasonable correct that does not change the sources.

thanks,
Armin
>
>> Thanks,
>> Sanjay
>>
>> -----Original Message-----
>> From: Sanjay Chitroda <schitrod@cisco.com>
>> Sent: Friday, May 19, 2023 10:56 AM
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco) <schitrod@cisco.com>
>> Subject: [meta-oe][PATCH] gnulib: Update recipe name to 2018-12-18
>>
>> As per gnulib_2018-03-07 recipe information, SRCREV = "0d6e3307bbdb8df4d56043d5f373eeeffe4cbef3"
>> This revision was committed on "2018-12-18".
>>
>> There is a discrepancy between SRCREV and the recipe version.
>> Which reports "CVE-2018-17942" as unpatched.
>>
>> To report "CVE-2018-17942" as patched,
>> We need to align a recipe name with SRCREV commit date.
>>
>> Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
>> ---
>>   .../gnulib/{gnulib_2018-03-07.03.bb => gnulib_2018-12-18.bb}      | 0
>>   1 file changed, 0 insertions(+), 0 deletions(-)  rename meta-oe/recipes-support/gnulib/{gnulib_2018-03-07.03.bb => gnulib_2018-12-18.bb} (100%)
>>
>> diff --git a/meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb b/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
>> similarity index 100%
>> rename from meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb
>> rename to meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
>> --
>> 2.35.6
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#102899): https://lists.openembedded.org/g/openembedded-devel/message/102899
>> Mute This Topic: https://lists.openembedded.org/mt/99006605/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


