Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77DDC433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 04:31:53 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.4235.1638419511340603614
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 20:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gUC0lO6U;
 spf=pass (domain: mvista.com, ip: 209.85.222.181,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-qk1-f181.google.com with SMTP id p4so33469757qkm.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 20:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=y92H4Ik+6gXo3d96KQ5iUbG4JezXYFWiC91W/CpCDVU=;
        b=gUC0lO6UP371FNckejFTdWiFxuqwrj8610qaR71F1dmS3ut+ygGhoYEEsRMymzW6NQ
         nCIiimHYcCkOkBGnM2OzqNfa9/dIKGNNc6ySjI6Sr4hFUpBPh/cdyRJqkqulYGkeov8c
         q18NQYkPd/WctwOqybymFPeObprcIZiHAjlNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=y92H4Ik+6gXo3d96KQ5iUbG4JezXYFWiC91W/CpCDVU=;
        b=nreslwbgS5t6bloL2BqDITU4169TytPYYs2oJpa6zviwxmFxMHwFShAugR27Gg5MM6
         gUDhpIsain5+nx7cZU0XRUgNLoicINxO/rr4SWIKHAZXqFzaJJIC4WTQ7KTsiBum4IHE
         +hNArvlkMcwS9z3pZN+2R5yXFzUBiYHWpRBaxOgpdZkLDYpb3UyhXQNHYcH8IQwfEKBs
         tZam2XCKZZrgi76rlK2rnQP4bi1UBSEq09tyYT4PWFAV5DYreD1rQLB7e+kI5LVHVu4r
         ZHFe3WEjEhwzJxaUhjwzGRqXMJDhH9dTQsQFh9AKAx2FrT4XDOL2AZT/5LByOD3S2cyj
         KfIQ==
X-Gm-Message-State: AOAM530u06xH7guKnFbBoaHTOPih7dPIHKnkyyr1u98fFuNvDxAi78vD
	e4bw/5ZXiW/+KXFbO/Kkqz595A==
X-Google-Smtp-Source: 
 ABdhPJwAa6qALcva+nsKcDqAQ6kwS5OW2VQ8/rnWA4o2hjuoaC1ZHpyZio2pisUlrRgqCwyG2v3Lng==
X-Received: by 2002:a05:620a:1991:: with SMTP id
 bm17mr10437870qkb.459.1638419510440;
        Wed, 01 Dec 2021 20:31:50 -0800 (PST)
Received: from [192.168.1.23] (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 m15sm926162qkp.76.2021.12.01.20.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 20:31:50 -0800 (PST)
Message-ID: <afc2524e-418c-5731-f055-76a2f200c018@mvista.com>
Date: Wed, 1 Dec 2021 20:31:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [oe] [meta-networking][hardknott][gatesgarth][PATCH] ifenslave:
 Add branch=main
Content-Language: en-US
To: akuster808 <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20211130193715.32154-1-jpuhlman@mvista.com>
 <888231dc-1302-2dc6-aada-51c5b6132824@gmail.com>
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: <888231dc-1302-2dc6-aada-51c5b6132824@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 04:31:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94170



On 11/30/2021 2:34 PM, akuster808 wrote:
>
> On 11/30/21 11:37 AM, Jeremy Puhlman wrote:
>> master branch has been removed upstream
>>
>> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> thanks. I have a fix already staging in stable hardknott testing.
If you mean:
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/hardknott-nut&id=7fbb2767186a4db729efe4f440cc9a992f2ab183

That adds branch=master, which does not exist in the repository anymore, 
which is why I sent the patch in the first place.
>
> -armin
>
>> ---
>>   meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
>> index 0db9e8a0a..5e547a462 100644
>> --- a/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
>> +++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
>> @@ -9,7 +9,7 @@ inherit manpages
>>   MAN_PKG = "${PN}"
>>   
>>   SRCREV = "c26e9310f552e69d0d44eb48746e02c9ae4b4f6f"
>> -SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https"
>> +SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https;branch=main"
>>   
>>   S = "${WORKDIR}/git"
>>   
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#94150): https://lists.openembedded.org/g/openembedded-devel/message/94150
>> Mute This Topic: https://lists.openembedded.org/mt/87411068/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


