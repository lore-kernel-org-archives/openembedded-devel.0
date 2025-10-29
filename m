Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F18DCCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 17:46:10 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web01.11161.1761759964108129306
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 10:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e3BWM/PK;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29292eca5dbso1417895ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 10:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761759963; x=1762364763; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tmjCrgmxr+JzuD9gNv01t39IdT1M6tNQWnhAsGghgGk=;
        b=e3BWM/PKhpyw3Pn+dDgwm6rmJ6LTY+rM4Iv6NwW8m6X2MXhJkO+3GYCqZW3tvlZry6
         GGUQHaeRR3qFvAVMUOvEci493F0OO7jyLbGSDyEavyTrCu6X4yCjhOEcojTJYzauGUxs
         nFTEmok7hR71OgYL9bAZQsGT7RV6ZPyIdxHPm1d8Ys5QxHuwawaH1EzpO0V0HUeihHVs
         AsYMOfu5vyEMWvO4YS7dTI883E/iCYtDlKnKtEovgJNoK8iedVr6B+q/WzLEWJYMefxp
         MtIrF94SNgvKNqmcc1aFHetGQPWu7kNf8ziOCtV9Niy6D5144LZQoAonVd97msaac3Bv
         BJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761759963; x=1762364763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tmjCrgmxr+JzuD9gNv01t39IdT1M6tNQWnhAsGghgGk=;
        b=mKLHs3z80Qw12u3xWzhyUR3csDEjPlg+x8ksZoPsUt+JQ6DZek8awOd6BRibCuQdWx
         w/W9N+eR+2j22RMGwYHfIOKrT/82BJB0Qq3nlChxXAAqCcsSrLrNkL6PZYF2k68rp3cJ
         c42HKlAYIEYJBSYJailfzMNWjkpb6ET6OYxiIqE6lpEiDjjqXlUAV9151ydjI9Rb1tO1
         ZRAIOKT+vLspu12tkgiXaSC60oWb8lOx50bDrO46nJX92DMvvzBpNzMYqa7QBEciKbYd
         FIPBLWTxtlK9eFemlvZrOYVXVW7RtRVc5rLB5/6LKJCg8FN0r3dfAOGbCtzwzGa6VyN5
         QFjA==
X-Forwarded-Encrypted: i=1; AJvYcCWOLEsB9SbMxbMruKWflgGpHoenaTSN/COE9xUuuXmwOXbH5Fpi5u55arYOlAnIlD+sh8YLuTClK2CCH9yv/OwSbRQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwSp/uyOJhoOt99Kn8khDsI9nyUo3akmY8JsAayP2ctMz3Z7a71
	KpLhW0xz0c56aCpYfoAMQcsl+6vWN/ff+rlh2BA9lH+OJQNDds3PMo/W
X-Gm-Gg: ASbGncvafwxq4ZNOtLqfZ4Sz0gVj2o5kbgtQNTcOAJgvPs+ThLhQDs2LvHiHL+uxiDi
	9qFOF+w4mG9HYX/lURmr9CWoJGn9ctLThDk/0n2eNZt6CHzu70CtFMIUZXL5fk33BI7n0bLorbm
	Oa5VbkKluPIlu2HRiEjL2c0Uf98QdLIX5n2WlHF8ibsHdn3vwq4g3UyI0j+PgrV9S70QrNaRGCo
	g87aZPcaEhUs0XCIRW2IGmz6k0vaVj2n+xv6h1jm/BAYZAmI+gEoLs9TA88vqr36KeWr2cywBzI
	6CNnPuKElmHx5eVY2GeqbTCjACmzx9588w9ZvPW+tJBBRCKJaBTcdKAB7CoRc9TRVt88mEaNoCb
	hBhY+RxnQU51kMdWdMaVX0K4qnuzPHBU+HyV3aPJ95v/doc4gx7J6qNqlCP4sq0fHJwKN9L4Gt9
	hnbxnLwtNhn9hXRNssj6ysgAOZkbXXvf/M6tqQMOggQ9nMMWaJ3KS1Y1yc04XZCLWG7imA0pnsK
	r0bCPmohxu8L5bkX9MsjURvm4Djxg6salPLWnbAJUBbv+DZgEPU
X-Google-Smtp-Source: AGHT+IGA8oZKeXZkIeaALJ5+o7iaBj2QWvFmM091kE6nFtRjnXfmyP0WF6Ed/N2NqfvpUVu/vjgsAg==
X-Received: by 2002:a17:902:f601:b0:24c:cb60:f6f0 with SMTP id d9443c01a7336-294ee479ab4mr1435515ad.58.1761759963294;
        Wed, 29 Oct 2025 10:46:03 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:1103:ba81:afc8:4f67? ([2601:646:8201:fd20:1103:ba81:afc8:4f67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0acecsm156955825ad.38.2025.10.29.10.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 10:46:02 -0700 (PDT)
Message-ID: <43896f35-8987-492f-8428-fe70039cb7ea@gmail.com>
Date: Wed, 29 Oct 2025 10:46:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python] [PATCH 18/32] python3-grpcio: upgrade 1.75.1
 -> 1.76.0
To: skandigraun@gmail.com, wangmy@fujitsu.com,
 openembedded-devel@lists.openembedded.org
References: <20251029001505.528-1-wangmy@fujitsu.com>
 <20251029001505.528-18-wangmy@fujitsu.com>
 <e6122055-c186-4d79-91c7-f1fba7c68250@gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <e6122055-c186-4d79-91c7-f1fba7c68250@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 17:46:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121169



On 10/29/25 1:25 AM, Gyorgy Sarvari via lists.openembedded.org wrote:
> I wonder, aren't these python3-grpc* packages supposed to be updated in
> lockstep with the grpc recipe, at least regarding the major version? Or
> are these backwards compatible?

I do not see it depend upon system libgrpc which means its building a 
bundled version in that case it will be fine. 1.76.0 will communicate ok 
with a server running 1.75.x, so technically its ok IMO.

> 
> On 10/29/25 01:14, wangmy via lists.openembedded.org wrote:
>> From: Wang Mingyu <wangmy@fujitsu.com>
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> ---
>>   .../{python3-grpcio_1.75.1.bb => python3-grpcio_1.76.0.bb}      | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta-python/recipes-devtools/python/{python3-grpcio_1.75.1.bb => python3-grpcio_1.76.0.bb} (94%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.75.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
>> similarity index 94%
>> rename from meta-python/recipes-devtools/python/python3-grpcio_1.75.1.bb
>> rename to meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
>> index ef0bf126d5..c4282502e1 100644
>> --- a/meta-python/recipes-devtools/python/python3-grpcio_1.75.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
>> @@ -13,7 +13,7 @@ DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
>>   SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
>>              file://abseil-ppc-fixes.patch \
>>              "
>> -SRC_URI[sha256sum] = "3e81d89ece99b9ace23a6916880baca613c03a799925afb2857887efa8b1b3d2"
>> +SRC_URI[sha256sum] = "7be78388d6da1a25c0d5ec506523db58b18be22d9c37d8d3a32c08be4987bd73"
>>   
>>   RDEPENDS:${PN} = "python3-protobuf"
>>   
>>
>>
>>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121141): https://lists.openembedded.org/g/openembedded-devel/message/121141
> Mute This Topic: https://lists.openembedded.org/mt/116004761/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


