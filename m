Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9741CCEE349
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 18:03:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3422.1763488985465303545
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 10:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=mm0dGJCg;
 spf=pass (domain: baylibre.com, ip: 209.85.128.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so41970965e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 10:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763488984; x=1764093784; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NNZWk9DTfTsnzEWzDJQgWWZCZ10DalDqkSyLBwkufBQ=;
        b=mm0dGJCgwm6OJajKHJURHEmQ7RbKR8IhCrdmFbojCDXgc407ORJM+FDmCxlwGLD3DR
         gRC6DktiyeBL54oJuOs6opZNpoCipu3FpHegbmdKA049eUMS2mJqCaT0P4R2nH4NlVKh
         Pbgr+de0PTvseUYVFtmmTDNwStqbiqeG/dWwaYEUGqlpdmG97L+2CGM3fhBCQRUI+Ksr
         dVo1o3E3ei0aLd2pnj8VR8AV2RSm1hhcQIdmKlH+8eUfUQ/xxrbpi+POYxoctad77mYo
         ArgMMILiLP4E21TtjBub9+3VX3WXDxGjGr7P5WAYC/me+JR4/6phuZVFad+gODrtJ55o
         KcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763488984; x=1764093784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNZWk9DTfTsnzEWzDJQgWWZCZ10DalDqkSyLBwkufBQ=;
        b=WqpFjKK5d+18P4kWT/oBEN/uJFQi/UMeGw+b4OK1PqiTcjJ4mXXG/3bVSkugVQRGt0
         nSQmbiLu+w5+feHzMpggMB0rIbbVmCzsaIfzMdTZ9i+ESqf+TUB05ZKAxKCpgLR5lZAQ
         L+QYBGpBiOTAL7mzonqid22DwyWpa1M3MojiMZN83rm/Mn+7D3FwTB9qlDmvjS4v4Q6f
         fxNLBhkwgiDmh2jaM1j+BqVCCAUD7M649fJP2OVQQM9CU3ZW1JFTCAWcTnewAJRg9X+l
         NB80/t5zcbVGRuRvljQXTSaNoJviP6NGuxbOIM7kKvw+oAMBHyyytKchK2V2aAC6Uw0k
         QzTQ==
X-Gm-Message-State: AOJu0YxD9i+J3kunqQS1GZZr+ZncMIsvkGM01obgbX8E1HtmSdLqeS5h
	BmV60+sk2qwyMkuspdgN1dK4lMuEn4tEf5dIrSOUVfUm5YYhd/hNeqn9mjOwi0gb9z8=
X-Gm-Gg: ASbGncvRIzhi4ZgY5cFDFhVKFt8ELtBBh7oRuKbiaVY45udvh0pZNksWX+EjKqUK1LN
	oqllGu9oL3fohqDIreweOrke/MZU5EbnsINPhHJl1RUcQ6TKyuxck9FeIhAEyn/Q0Wkod+J+VDU
	N6koEqspqnRKA6iYv03iWcOI3Rtak2uZfSQ4eKGpMYaW4lgS9Ml2nn/HyKDXDEkIzuHYTTIXxls
	g0VQOjhGYzvWS6eH97GJV0c21pMGncvspJGhiAcHw/NZNF9vSWCU/RHf3nUFpFRIA3yVHZ45aUt
	zHBM/l8WRGqdqBoRt+g6u17FhFZIgmGsJvRE0CFP2DN/3vPdHSRq9ktCp4aGOLVEUqhQmWq+t1u
	yVi9LYO/zEqxTOnRgsizQzw8RG1C4nEDo1Gc6Xakl5BxugprL6xg91V+lKfPI4Kw7IoWd1XWzqw
	PdGyGzsotpAQunxZs+5WsuIKGEXSYO6kbwIKQ3a0Xe93LanMH4cKR8wrjEvmyXjA7fPGpdJs5YL
	Os=
X-Google-Smtp-Source: AGHT+IEdmUgAUcQX+1mgQEJe0Lv8iTtIcL7C0VIr9nYkg1vJA8WHXHNNEWVBjU7eGq69qEPzFDR4lQ==
X-Received: by 2002:a05:600c:6289:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-4778fe62100mr163326995e9.9.1763488983399;
        Tue, 18 Nov 2025 10:03:03 -0800 (PST)
Received: from ?IPV6:2001:1970:3847:e000:84f2:c6ad:afd9:6725? ([2001:1970:3847:e000:84f2:c6ad:afd9:6725])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1041defsm2516855e9.15.2025.11.18.10.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:03:02 -0800 (PST)
Message-ID: <897cf7ec-7354-4c5d-9e46-b262fcf6431c@baylibre.com>
Date: Tue, 18 Nov 2025 13:03:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-orjson: 3.10.17 -> 3.11.3
To: raj.khem@gmail.com, t.f.g.geelen@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <20251116225013.2063395-1-t.f.g.geelen@gmail.com>
 <CAMKF1soQYmApxJ1weUw1PSxQGA0sbGiiYPPH8zFENCyPwZogkQ@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAMKF1soQYmApxJ1weUw1PSxQGA0sbGiiYPPH8zFENCyPwZogkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 18:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121868


On 2025-11-18 12:24, Khem Raj via lists.openembedded.org wrote:
> this fails to build on riscv64 - 
> https://gist.github.com/kraj/8d818b0bb2ec93afc4abf5b1ed06a7df
Seems like it's trying to pull in x86-64 extensions. That maturin call 
should be able to accept '--target riscv64-unknown-linux-gnu'... Would 
be interesting to see if that helps.
>
> On Sun, Nov 16, 2025 at 2:50 PM Tom Geelen via lists.openembedded.org 
> <http://lists.openembedded.org> 
> <t.f.g.geelen=gmail.com@lists.openembedded.org> wrote:
>
>     Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
>     ---
>      .../{python3-orjson_3.10.17.bb <http://python3-orjson_3.10.17.bb>
>     => python3-orjson_3.11.3.bb <http://python3-orjson_3.11.3.bb>}  
>      | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>      rename
>     meta-python/recipes-devtools/python/{python3-orjson_3.10.17.bb
>     <http://python3-orjson_3.10.17.bb> => python3-orjson_3.11.3.bb
>     <http://python3-orjson_3.11.3.bb>} (84%)
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
>     <http://python3-orjson_3.10.17.bb>
>     b/meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
>     <http://python3-orjson_3.11.3.bb>
>     similarity index 84%
>     rename from
>     meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
>     <http://python3-orjson_3.10.17.bb>
>     rename to
>     meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
>     <http://python3-orjson_3.11.3.bb>
>     index 7db76c9415..7fdd0fef9b 100644
>     ---
>     a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
>     <http://python3-orjson_3.10.17.bb>
>     +++ b/meta-python/recipes-devtools/python/python3-orjson_3.11.3.bb
>     <http://python3-orjson_3.11.3.bb>
>     @@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/orjson/"
>      LICENSE = "MIT"
>      LIC_FILES_CHKSUM =
>     "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
>
>     -SRC_URI[sha256sum] =
>     "28eeae6a15243966962b658dfcf7bae9e7bb1f3260dfcf0370dbd41f5ff6058b"
>     +SRC_URI[sha256sum] =
>     "1c0603b1d2ffcd43a411d64797a19556ef76958aef1c182f22dc30860152a98a"
>
>      require ${BPN}-crates.inc
>
>     -- 
>     2.43.0
>
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121864): https://lists.openembedded.org/g/openembedded-devel/message/121864
> Mute This Topic: https://lists.openembedded.org/mt/116329171/7611679
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

