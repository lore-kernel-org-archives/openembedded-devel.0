Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9A910A62F9
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:31:22 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49690.1774535475315101052
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SgbPqnkW;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b6d9c981so649220f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535474; x=1775140274; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=coxek7SK4f3nwqXMQvZVjmFA9PqsaGGTeEV22i1pYoI=;
        b=SgbPqnkWuEXYcGv7l1ND4f6d7lKYOJFTOpiREEm7012y0EcZYr4C7teNRDAbiKpV5q
         q9gg5Exs5S006+dXhFFM+PX3NUq9XukCNY93pk2j8hlt7nXMrTn01AQl3KJpxRSxILtr
         eaX71YczozcgkquPsSXSMiY6xwPeSdrKk3529h7x9mQo951GuBeSNxXKZ8vDhFF8Nc4t
         d2QWIKYTR2jXODmAkwfpldSvIOtPEl2tXGqb1uZELGaFEWPQSnKspJ7bp/MbJJiZEKWB
         StzhND2Pb+Mxz2xBAlUzYEqG42KBat0rUMP0xbbzFeevvZmEtsokRi+CIBXLEWOuWixX
         mBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535474; x=1775140274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=coxek7SK4f3nwqXMQvZVjmFA9PqsaGGTeEV22i1pYoI=;
        b=RfW6nJQofrXud5so0Xe8YwQ4WMJzsYwTb/6wHiiy7qQMK3N5R+3HTzVhMlRl+CBRzd
         ns6QbrH3YpIiTqH9tHb0WSsKSgZBWtbAk55l3USRkx8hkvPphtUb4QowFwsmQW7qVRTC
         xxbOzA7ABs+MnabSGyYHZRoZxLoDXXpuusv1S9kmgDjKII7LDUT/DIHTnlIsJXHvBwBB
         auPn83V8fTkls3D4xm+Bcp7XhyVLHZxMyjG5L5VsAsCF3J5D68vjmsQm4gHDj6ZqlS6s
         A+rTqZHGwQ3c9iZG75XKClveeNyMTD/1MSyTkDEYlm0b1DWKbk+lW0KoUKyANa3c0qIE
         VByQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPLU65Dt7AFyT4aaYNybOxU6vgx10vE96mLQt7c4OwR1cpkTIqWZq6ql7dISU1f6NYpBdcqqMfhIxxxVAJM/Uxc8Y=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzPf3Va6B7hrvZPgmVBoN/2evg7cktdb3g9ItfiWiN+hgs7yrlo
	//24D++CRF+BMjHrcGfl/xVTSfTph8ezyalvh3kZZtKJg3dPyNEomr6St7dA+A==
X-Gm-Gg: ATEYQzyOjpSFF7uw9zAC93a6cjmyWTJ2omsPXXMagfPDIPnGlhauyGtKITZKgykopaX
	o1zC0AmRjNYZdar78fbREX0keR824ilwPEltnupyQy+Eh/sp8rpqCnmdBL/Sk3+ML6rebUCil/+
	oxcM3JzPMCBa9kZadXCIrkFRV3R/wjWz58wMPCPKDILdwXvpS7fCsFfnkKhQUTYuEjGRZXiiTdM
	05Q600Q/nwPqi7qKO2rkhQBV59IOdF8vIr1z9BDJOBoEqU8ogaTzXn7T3MM8hJjCCr3xiBBpdjf
	2ddf9U6/pK9Jn4IBjrD57V7aBh02soQJXjQ3MOzSETvkG89n+P2sawlxEuYkmO8XUXV2GfDnldx
	DHbZQfW+rIYmVqZ6t/0naRfX0ycvmcMiiyMnz4hMzCVenqpp97kcl48fszD4+WB+gKsamRUF4e6
	OMpeFvJI4XxpaNlWTEPV7O55AKbRl2TcZdX35Lmx3mG0vHHOhQPPOAUFdiYe+C2LYnhg==
X-Received: by 2002:a05:6000:1786:b0:43b:8c38:af5 with SMTP id ffacd0b85a97d-43b97a141camr3589486f8f.7.1774535473425;
        Thu, 26 Mar 2026 07:31:13 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm9740732f8f.2.2026.03.26.07.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:31:12 -0700 (PDT)
Message-ID: <a31088dd-4f63-4e9c-9e25-0e0c9f14f62e@gmail.com>
Date: Thu, 26 Mar 2026 15:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH v2 01/12] python3: Add warning comment before
 PACKAGECONFIG[freethreading]
To: Gyorgy Sarvari <skandigraun@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326141213.2081121-1-zboszor@gmail.com>
 <20260326141213.2081121-2-zboszor@gmail.com>
 <c9fb9a9a-59c8-4e75-9614-feb4d3dd589f@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <c9fb9a9a-59c8-4e75-9614-feb4d3dd589f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 14:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125737

2026. 03. 26. 15:16 keltezéssel, Gyorgy Sarvari írta:
> Wrong ML?

Yes. Careless copy&paste from ~/.bash_history. Sorry.

>
>
> On 3/26/26 15:12, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> The warning comment is really needed. While Python 3.14 supports
>> free-threading officially, the ecosystem around it does not yet.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/recipes-devtools/python/python3_3.14.3.bb | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
>> index 7a1ad1e386..c23605f59c 100644
>> --- a/meta/recipes-devtools/python/python3_3.14.3.bb
>> +++ b/meta/recipes-devtools/python/python3_3.14.3.bb
>> @@ -112,7 +112,14 @@ CACHED_CONFIGUREVARS:append:libc-musl = "\
>>   
>>   # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
>>   PACKAGECONFIG ??= "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
>> +
>> +# Some LLVM/CLANG subprojects (e.g. lldb) and many Python modules
>> +# do not build when free-threading is enabled. Also, the support
>> +# for free-threading in many Python modules is not yet production level,
>> +# although they may build fine.
>> +# This is highly experimental. Do not enable it!
>>   PACKAGECONFIG[freethreading] = "--disable-gil,--enable-gil"
>> +
>>   PACKAGECONFIG[readline] = "--with-readline=readline,,readline,,,editline"
>>   PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"
>>   # Use profile guided optimisation by running PyBench inside qemu-user
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#125723): https://lists.openembedded.org/g/openembedded-devel/message/125723
>> Mute This Topic: https://lists.openembedded.org/mt/118518888/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


