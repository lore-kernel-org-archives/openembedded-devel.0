Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26ACDEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 13:21:01 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.18146.1686835255596971579
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 06:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=e9E3rOjF;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5702116762fso13200147b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 06:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686835255; x=1689427255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sM9Do8hYPSTNlvK9et7zBzUpHk4XogZh4Yumv0VmAdM=;
        b=e9E3rOjFhxdAyAL90Kum7pj3SY7I2UvfD9p4LrLUQkJp104IRW+XOmnv8pDOZKvFR7
         vX8P3K9JkO5/mvTpjxYNj75q/nzEfmitYJ99bswDRgzyu+t69A1oYbJA6bzVN1S3dbkJ
         SSyIlL8Nwj+jvrfal+hzSbnlrTumWVbaoSO11mE7Yg0ljtXzN6lPlZW0Vgk+lGYXZbrF
         rsRPD5uJ4KAWwc5diynJaO2KROKpNP6AcEVVtP+s/Z1dqsYlftLiU2QHRrrwp6PLtVgD
         HRXESKY+WTi7Dz4TYUMqJvgOq+lonoy0yJILWQ3iw6Q5Q5onppfbTge1utZoq3oXpeJP
         s0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686835255; x=1689427255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sM9Do8hYPSTNlvK9et7zBzUpHk4XogZh4Yumv0VmAdM=;
        b=TDsigfV69cN/i0ek4oipB3E4zpjEv5VOZBrYBaoDxHtNSrbK5PDKMM0no1NrNLDqNT
         1LSH5kavgtsDZ1NXukR8KbfPQkKcf85V21k013WSqc2I60E40Z6o0wsm9T6Fv2XTnUJP
         Fpwnmivq0/KUN5f7rm2RwgAL2pQ4EkgLfBvo9vW50N4ZtGGV1t3AS+C9PEigjMEc4/Iy
         l8WQL6X9fU69Fh7ystaUWScechXrKabJGGKp/jeJyOlPl5w5dhPVbJwxH+lAsCDLp1GT
         YF8foezEVrT7Bvx7CR/n45FQousFw01yDcaLGIIhVP9HOmgWBiNSb9qeJCyQmxI65OHO
         5mtA==
X-Gm-Message-State: AC+VfDyG6574wri/pwuw4KGLbN/8AR31VJIIFsg6M98hLcvi2uQjtnIl
	xlnsvilv4X86cez1VxBcyEg=
X-Google-Smtp-Source: ACHHUZ4T7j7I+URWrw+h3gVEMQ05JwffH2agKKAmcRhAWEump6+ZABY5jferZhuRpMuHEnQNFXjM0g==
X-Received: by 2002:a0d:d854:0:b0:55a:18e2:cdf9 with SMTP id a81-20020a0dd854000000b0055a18e2cdf9mr5091844ywe.49.1686835254731;
        Thu, 15 Jun 2023 06:20:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:b6a3:8a75:3124:ba44? ([2600:1700:9190:ba10:b6a3:8a75:3124:ba44])
        by smtp.gmail.com with ESMTPSA id t9-20020a0dea09000000b0056d4649670fsm2116535ywe.133.2023.06.15.06.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 06:20:54 -0700 (PDT)
Message-ID: <346f05f8-3700-68fa-a631-d2f430eafef0@gmail.com>
Date: Thu, 15 Jun 2023 09:20:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-oe][PATCH] exprtk_git: Fix SRCREV for exprtk_git
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, muhammad.hamzai@yahoo.com
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <1747474539.3138796.1686633366135.ref@mail.yahoo.com>
 <1747474539.3138796.1686633366135@mail.yahoo.com>
 <CAMKF1sq_tn2QHQtjEJ8yg5fZ4gOp_Aj2fNFobJufGEvqBQBoqA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <CAMKF1sq_tn2QHQtjEJ8yg5fZ4gOp_Aj2fNFobJufGEvqBQBoqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103304



On 6/13/23 1:47 AM, Khem Raj wrote:
> which release is it for ? master branch already is at
> f46bffcd6966d38a09023fb37ba9335214c9b959

Well that is this change:

  ExprTk: Update package to release/0.0.2

Which also changes the branch.

What is in the difference between the SRCREVs if this expected to be 
backported to stable branches?

- armin
>
> On Mon, Jun 12, 2023 at 10:16 PM Muhammad Hamza via
> lists.openembedded.org
> <muhammad.hamzai=yahoo.com@lists.openembedded.org> wrote:
>> exprtk_git recipe uses a SRCREV that does not belong
>> to any branch and results in a fetcher failure when bitbake
>> tries to fetch it.
>> This commit updates the SRCREV to fix this issue.
>>
>> Signed-off-by: Muhammad Hamza <muhammad.hamzai@yahoo.com>
>> ---
>>   meta-oe/recipes-devtools/exprtk/exprtk_git.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
>> index 52975c821..557c4f27a 100644
>> --- a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
>> +++ b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ArashPartow/exprtk"
>>   SECTION = "libs"
>>   LICENSE = "MIT"
>>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>> -SRCREV = "281c2ccc65b8f91c012ea3725ebcef406378a225"
>> +SRCREV = "f46bffcd6966d38a09023fb37ba9335214c9b959"
>>
>>   SRC_URI = "git://github.com/ArashPartow/exprtk.git;branch=master;protocol=https"
>>
>> --
>> 2.34.1
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#103258): https://lists.openembedded.org/g/openembedded-devel/message/103258
>> Mute This Topic: https://lists.openembedded.org/mt/99499725/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


