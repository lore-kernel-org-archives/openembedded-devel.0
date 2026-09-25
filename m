Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ED3C98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 16:32:49 +0000 (UTC)
Received: from mail-wr2-f30.google.com (mail-wr2-f30.google.com [74.125.225.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2425.1790353963360679035
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 09:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Wq3IZq1b;
 spf=pass (domain: konsulko.com, ip: 74.125.225.94, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr2-f30.google.com with SMTP id ffacd0b85a97d-48439feca17so801754f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790353961; x=1790958761; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3Kn2GKFaEV+v7yqgRey4oZHR0VI/t4hVriOmPJ2xAY=;
        b=Wq3IZq1bRJEkYLBb5A++u1knDewLlI/q6E0uypW+vf3eHGcTUzBGjkPjaoBrhCLA4Z
         R6XOI+LPUXVhXEZfGC5Qf4VbBbWnkgch3SzZiPV2vO+neSZW9tW6x+ZQ9avn2GwN/5Py
         rknMyMXbP61f48UkrlxeiF8w7vG6S19lU6AJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353961; x=1790958761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3Kn2GKFaEV+v7yqgRey4oZHR0VI/t4hVriOmPJ2xAY=;
        b=CCnM0A/0syonR/+0JEDtFvzk4LmkuITyZF5LU1+3U+6AfYAkRPYhB9NZYCFSOKBzey
         QbmUi0k+UA1Rtbl3VEVPRvxJ4HLbRMh9/ZR8brIeaAnr7XzY2QKG7TacRBNqMAOHDu5N
         3vYgj8BGzKCMMMEirOxvZa+LqmOp8TEcfZfL5vfOaolBSsq0G8+a2vl632AWG2lgWoo5
         RKBeJhRFKaLEzCr4qbs0NxUvP8SNQJt4g1528djayCFsJVJJH2YRUKGxgScdvGUB70C9
         HFz+A/xe5p51NLFtsSosOkvBlu6aszPKcr3iMkW1Jpsg7xQr2SFOe7s1Ir3H5LRl9JbL
         qeiQ==
X-Gm-Message-State: AFuF++lj3oPPi/YMScCdbSh1zMRZbamlkfNuoBz6C8OvPUNon8NR1Yan
	i7Matv6GY4Yms3+vFm5MSayXpq3c2ctjtcWARRY99qddlkKt3BvA4X9Lq1xfUGGPURcxvKogqm2
	yPx8T
X-Gm-Gg: AYBFou35B4qJ8qexxrgNDVYxiQx7EDXi4iS/v7xmpNs+TxkIPqSpF9dIwU1QQuHX8YG
	04Fsl21wq6+yLjqcPN2alrpMtXFl2I0bjEwKJuKqlskqpjYWlrr6u6yCmy/0xqo+Zy8Mw5os0e7
	Yy75V4o6jGmKQahEVtbLk9S+L/Up6V97nGf+AH72+NiSTDN88nnziFhonrsBiF0r4cRyslSvMyu
	EbI+kfFFS+tt8GF1vvqxf0Lsa+9SdQxtyItsi/EJ+gXf0ZZ2Gsjwh99ZG5JepmtPSWvebrEZprm
	OBLCS1OMZ5IpOO4PmOztcSWYDWC9qVgJRnOy0/ESB02iq3psF2xepL8Htdb4B74F8NHI7bajfIj
	Ki/ye9L6PpC4G4vYDDdc/bYJ8p6Va9NR496q9Web/vIJaAVQFae3lFZHQLTb653CFGJrl5elWo+
	Uihko6TyV5fsMIkmky/AoC+eAdFsQuj2lnEvI/stDpoEYw1hj2E/8hdbglygs+Jz0jv0q/B2HTe
	G9ucr43W+6Psctv3mYM4j6ER5tqbZQytYuSVvlIah/FhetHfUgfE0XPnBvoKQOmwrBECbh+0Mvo
	QMvtWOAZ8COFf2mF
X-Received: by 2002:a05:6000:384:b0:488:63f2:8766 with SMTP id ffacd0b85a97d-48871728c55mr11234523f8f.21.1790353961023;
        Fri, 25 Sep 2026 09:32:41 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm8672808f8f.1.2026.09.25.09.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 09:32:40 -0700 (PDT)
Message-ID: <d0902746-e356-4df2-8e3c-a14d26a5ba02@konsulko.com>
Date: Fri, 25 Sep 2026 19:32:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pydantic: Upgrade 2.13.4 ->
 2.13.5
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260924125848.526537-1-leon.anavi@konsulko.com>
 <20260924125848.526537-2-leon.anavi@konsulko.com>
 <CADySD0HVsCvbEJQs8K3i9hVCDMsMEkacWSQVezF5EKVxV1=zxw@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CADySD0HVsCvbEJQs8K3i9hVCDMsMEkacWSQVezF5EKVxV1=zxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 16:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130307

Hi Ankur,

On 9/25/26 05:41, Ankur Tyagi wrote:
> On Fri, Sep 25, 2026 at 12:58 AM Leon Anavi via lists.openembedded.org
> <leon.anavi=konsulko.com@lists.openembedded.org> wrote:
>> Upgrade to release 2.13.5:
>>
>> - Allow reuse of validators when plugins are set
>> - Fix missing GC traversal on some pydantic-core struct fields
>> - Fix missing GC traversal in pydantic-core for
>>    GeneralFieldsSerializer
>> - Count validated model fields once in smart unions
>>
>> This work was sponsored by GOVCERT.LU.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   .../{python3-pydantic_2.13.4.bb => python3-pydantic_2.13.5.bb}  | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta-python/recipes-devtools/python/{python3-pydantic_2.13.4.bb => python3-pydantic_2.13.5.bb} (98%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
>> similarity index 98%
>> rename from meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
>> rename to meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
>> index 17a6941d14..7c5dcdcb26 100644
>> --- a/meta-python/recipes-devtools/python/python3-pydantic_2.13.4.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
>>
>>   inherit python_hatchling ptest-python-pytest
>>
>> -SRCREV = "cf67d4b3193c3fe43ede18612ed62785eee11382"
>> +SRCREV = "001dea020e0809844e5b17666432c9135a976f46"
>>   PV .= "+git"
> no need to set PV

OK, thank you for the code review. I removed it.

>
>>   SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v2.13-fixes"
> can please include tag=v${PV} in the SRC_URI

OK, but in this case with oe.utils.trim_version.

I have just sent v2 of the patch.

Best regards, Leon

>
>>   DEPENDS += "python3-hatch-fancy-pypi-readme-native"
>> --
>> 2.47.3
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#130285): https://lists.openembedded.org/g/openembedded-devel/message/130285
>> Mute This Topic: https://lists.openembedded.org/mt/121408815/3619737
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ankur.tyagi85@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

