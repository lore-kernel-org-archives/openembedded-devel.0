Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBC8C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 11:41:37 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.6136.1686138093424888538
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 04:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YYxANCqh;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30e53cacc10so905534f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 04:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686138092; x=1688730092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2EdA5TpwOW3H1FhjLC/wcZhDRjtxxp9Ax+eQkKCgi70=;
        b=YYxANCqhNygLUnCZMorMTabfi5QgyiJAlNnHipoIT0z51y9FyEEQ1FVUFLAUlsFDab
         nXjg1110F4t+PGRRbttlZ/+8TBjWg1fJCoyzPx/+RgZjZMr9J5t7xU1QOdXqBuZMhzsy
         3Kh/rCr/Y7EPMlGx1a5EEA3LrCOG06A6fN+wLikdYrEEITKKKr5OnV7ctkAVz9D0fuOc
         eZVEaxDlPOLQ2viP5bJgTnDgRB82aE5ke+Mpu2jP4UewJ8GRG1QnyFHN5GJwOiAOrxBJ
         6cpBHOEYpv04IFxTf2Au90GXIYR1iTBvqq1CcDrgG/5oOD5Z77WEL3SCr7SXJN+QogJA
         NeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686138092; x=1688730092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2EdA5TpwOW3H1FhjLC/wcZhDRjtxxp9Ax+eQkKCgi70=;
        b=TMGcpXHzHPxQ7pd7BX36x42F9vucFpRNnz5puJGSNEK5VlHwRz/iP0fPMAVTEidRSi
         JCuTHNIkI0X9tEWdp3vYW+bLc2KgsKOfQVp8R7wgn0ELjL57+WoIxuyZh33uT2uKEup2
         /tbiIl73IwmxMzpKb84OWwguXkHwkeyFQhtORs6WOZPeE9VhwdR1TWM/a1V0O3fd4tHK
         4dI6Bmp/WPhTZuEwH5fKoA+972/hCaxIkevSg3f8/7VIU5tVEXYivBXtab5GsNKJzbSw
         KdPv9kL+E07Egl4y3PSU6m/G2iyvU87rIYyZRsjWXeNlE2lN8M/Nb0jLEUaEX8UlOIvf
         0NKg==
X-Gm-Message-State: AC+VfDwpYTSD/QqYVlJ0f8zgrAYB95Y6THbfpbiA87f8eLUdFyk4f6QZ
	mAdHej611s+gOpjIks4YYGc=
X-Google-Smtp-Source: ACHHUZ4oPoGPPux1KZcxFJVC+o7JiDES32SuCTdtgfjHLiDmIA/8T6g8ddFmPv3hQR1kCJOaga6FEQ==
X-Received: by 2002:a5d:6045:0:b0:306:2e48:6ded with SMTP id j5-20020a5d6045000000b003062e486dedmr4581944wrt.13.1686138091739;
        Wed, 07 Jun 2023 04:41:31 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id y2-20020a05600c364200b003f4e3ed98ffsm1928894wmq.35.2023.06.07.04.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 04:41:31 -0700 (PDT)
Message-ID: <cdd1f449-d73e-edb5-4572-563818dbbbb8@gmail.com>
Date: Wed, 7 Jun 2023 13:41:30 +0200
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
 <782e17f9-9ae6-b6db-6b61-f41e670d4030@gmail.com>
 <8236819D-4370-4B6E-AFD1-845010C00239@arm.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <8236819D-4370-4B6E-AFD1-845010C00239@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 11:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103176

2023. 06. 07. 13:26 keltezéssel, Ross Burton írta:
> On 7 Jun 2023, at 12:24, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>>> +# This prevents the meson error:
>>>> +# ERROR: Got argument buildtype as both -Dbuildtype and --buildtype. Pick one.
>>>> +MESONOPTS:remove = "--buildtype ${MESON_BUILDTYPE}"
>>> If mesonpy ever switches to —buildtype then this will break, right?  Might be better to patch mesonpy instead.
>> Why would it break? It does not affect what meson-python is adding internally.
>>
>> This only removes the setting imposed by meson.bbclass
>> and only needs to change if meson.bbclass switches to -Dbuildtype.
> My understanding is that meson.bbclass is passing —buildtype and then mesonpy is passing -Dbuildtype.

Correct.

> This :remove removes any —buildtype option, so if mesonpy changes to using —buildtype instead of -Dbuildtype then _both_ buildtype options will be removed, which isn’t what you want.

Wrong.

This only removes the --buildtype setting from MESONOPTS set by meson.bbclass.
This variable is internal to meson.bbclass, not exported.
It it used this way there:

meson setup ${MESONOPTS} ...

mesonpy doesn't use the MESONOPTS variable to set the buildtype
and since this variable is not exported, meson can't see or use it either.


