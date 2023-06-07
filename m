Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378F9C7EE29
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 11:24:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.5861.1686137055924355203
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 04:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OmCC9LhW;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f7368126a6so32139365e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 04:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686137054; x=1688729054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eRTu7kfzDVTcJxm4x94fk4W/rE2pcBIfm7h4A4nlCzA=;
        b=OmCC9LhW8sFz8CR3BQKnJzFnhtx9OLFfxpBpYoz9zpH14WAsFlGkrVcHhrElJJhS+5
         vF1+RimbHd32PSY/noVj4x/mKDHf3NGU3O1Eq5FPReK7Priepy4QACvFYuf2e/mX6DI1
         t3U/YNySKXF7+T46BmspyrfLZPq066ByJMS9lwqXgdY39FLPO9eYoiCT3AQVb/xzYBn4
         SBkGDWoKEQ8DnG5jUvF+L661mt2T3PZ6Ggoinw7X3vRA/Z2GYqEDAVrw4Es1+n3oEfp9
         4sEayXu/LV94x7XPeuAyvv7WZ00PUD35Ex2ox5dK+ehB45pZR2BDU21OY+zpuQ3FXRyB
         ORWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686137054; x=1688729054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eRTu7kfzDVTcJxm4x94fk4W/rE2pcBIfm7h4A4nlCzA=;
        b=fuDECQtH1lD5LKGn73OZ2tTMMcknHaKFxcAgaQvh3MJUy9CW3MaMKqndQsZbT9x6r1
         d7Q7qy1bvwON3ZrO51Qik0utKmWNb/cO2Tn7iU0N1s0qXMMsxFzl6JtoQ9Ox7wglDU40
         VW04VbdjtYkl4K//yubXghzJvaGGVWUiGzhwgK6eFnmEvdAFG5OPm4cbwyFYDaABY7Xq
         5hRfyPg4ZPHHK5mNDkQw4dRopW4yPAoNQfsqVNAQIReWgHos/pEqTheLJDs0qEpEyC+C
         0ubcScEHi4Fb4J6CKRmYk5kBqDTptcHC/Qm+CAxLCUMfRctwraZVwq0aAK/SKYMaeUtF
         AxBw==
X-Gm-Message-State: AC+VfDys0AFSFKcs3vr8NXn1Qo5Jywy0cG8FqOtuIzOzY+V1UCuVDnZV
	fbSk0CerMxcQoVYNc2zt4iM=
X-Google-Smtp-Source: ACHHUZ42PnKHOtBeS6UQFgcBJRGoZwcSiEmZWBxCwqpaVo/6VE7clwUyt5akLqtGFbGyP+QaayT+Og==
X-Received: by 2002:adf:fccf:0:b0:309:5068:9ebe with SMTP id f15-20020adffccf000000b0030950689ebemr3760973wrs.50.1686137053774;
        Wed, 07 Jun 2023 04:24:13 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d6-20020a5d5386000000b00307c46f4f08sm15266639wrv.79.2023.06.07.04.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 04:24:13 -0700 (PDT)
Message-ID: <782e17f9-9ae6-b6db-6b61-f41e670d4030@gmail.com>
Date: Wed, 7 Jun 2023 13:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe] [meta-python][PATCH 2/2] python_mesonpy: New class
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
 Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>
References: <20230607065547.128661-1-zboszor@gmail.com>
 <20230607065547.128661-2-zboszor@gmail.com>
 <C15808F7-1E10-415B-9281-82CD6FE46FC8@arm.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <C15808F7-1E10-415B-9281-82CD6FE46FC8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 11:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103174

2023. 06. 07. 11:57 keltezéssel, Ross Burton írta:
> On 7 Jun 2023, at 07:55, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>> +# Filter out meson_do_qa_configure from do_configure[postfuncs]
>> +DOCONFIGUREPOSTFUNCS := "${@d.getVarFlag('do_configure', 'postfuncs')}"
>> +DOCONFIGUREPOSTFUNCS:remove = "meson_do_qa_configure"
>> +do_configure[postfuncs] := "${@'' if d.getVar('DOCONFIGUREPOSTFUNCS') is None else d.getVar('DOCONFIGUREPOSTFUNCS') }"
> A neater solution would be to just stub out meson_do_qa_configure in this class:
>
> meson_do_qa_configure() { : }

Thanks. I will make this change.

>> +# This prevents the meson error:
>> +# ERROR: Got argument buildtype as both -Dbuildtype and --buildtype. Pick one.
>> +MESONOPTS:remove = "--buildtype ${MESON_BUILDTYPE}"
> If mesonpy ever switches to —buildtype then this will break, right?  Might be better to patch mesonpy instead.

Why would it break? It does not affect what meson-python is adding internally.

This only removes the setting imposed by meson.bbclass
and only needs to change if meson.bbclass switches to -Dbuildtype.

>> +python_mesonpy_do_bootstrap_install () {
>> +    python_pep517_do_bootstrap_install
>> +}
> This looks redundant and nothing calls it, remove.

Ok.


