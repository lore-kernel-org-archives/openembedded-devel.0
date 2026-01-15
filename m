Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A637BD41159
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:07:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32274.1768471612494761009
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 02:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kGNeaX5q;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee974e230so6263225e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 02:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768471611; x=1769076411; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A3lW9BsvFjWXRHt6Nz4+e53Kd70BD2N3+Yw96E7ZXo4=;
        b=kGNeaX5qk9vMkAzgxZOOiHMtsUtZVpOo6fxuSMMll8gwefvELG2kHhFUtwofD/UZRP
         aJlTb8QLyD/KHtuoum9+CriJkhQ1shXGUnlbzivav9EK7npb2XkiQjgAGYBV1UzzmUwP
         VyhOTifyRmdTwBaCTNf+PT1Ls7eso6DnIXXXEzgxK2ynfxhPD6whBya4Hw0DPBPW5Ua3
         Mmu+FiCFCUuwJ7L0eV3dqKKqsg3595bM6kjSq4a/rM9lROhfM+FFtfhoyvhuKlXOOUvA
         p5Geuy2Ej/DDOk7o+Zi6845pU5bGEfvCTmUh7RhNMzXoONpEEKh5ANrUQCfW0HnUnx1E
         iEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768471611; x=1769076411;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3lW9BsvFjWXRHt6Nz4+e53Kd70BD2N3+Yw96E7ZXo4=;
        b=GAwcsitIkrcO0Kkvs3q4C3Shxnhd7R/18GJGh2d+fQJWBtSsR0aZM5NpowB7CyhH2Q
         s9zc6/mrgZmkKLr3jBruxTDTZ3oFQXJUhh/OWDzZohz6tF/fxaaLjgDaZR5FATInDSVu
         yEp71uZ4WWJN5ymPx2/soSYzGLy2t9VhhEFL6e6GQ28q9ojTUn61Mh2w8cxyFk/P2xC9
         jfotYvzXUhuO6fhbttjd+O0Hx/TCFKTwPFtBD/ew5BEvcfXtJA8bPrbGFJl/g7OlQ5tG
         Qi7arHPF23jPLerNSTPByfb6nWMjnEh3D/zYWcFJnCQBNv+EvX6xHbeaUKIA1+EeGggp
         Qong==
X-Forwarded-Encrypted: i=1; AJvYcCXSu9FN8pRfw64gfy71V5MRAi1dbHomOD6wXr7Dda7G2jWxAg84Ykvq71sqaZBwxluXpY3O+ZkE7NeB32zhdwRw9Hc=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywh4W58xW9Vjs3+4/nwJy1dsjeFykv1OI1+tJsO27GR26ea6g66
	KYVnQO9jbXeFrM901DilDs5NirHgWpWCJd5Nu/wuePRGl5T7/8nBz5QQ
X-Gm-Gg: AY/fxX6oE/Nao9YrBvIuwlY3M7qlAD7RDco8x7RZl/r+mnOaUO/GCjltBd1FsvdkFNP
	XHPF+/4ezLdlsNe0PBjsZHEZvmaNiw9BWhmEVTN4AU4kTZboNnxbV9Gfp+55VkqtIohy769sfOU
	+yDJj/1F2qJrDqT7Hel/5ev0ktnhzDpPsuf8gRDjdllzqb6PVDADzYwYDxPj4EwM93/U6x1RiB6
	vJ97RSEp4tVqX9SXYo8gyO8BK+99lScvJvQO2WWzj10S4iNWGHiAHnUzxb2V5bfyM1GlMq39HZV
	PAYTWLFzRKl+N/nUPAlyvXLq3queqJQ3cXOcsAzPLNlNblb4rxrkPJI+D7SLgROsqHemtQLVMFn
	AgLY8Ua6O8/RPQSdPSt27ueIiE4bXhSyi6p6GboJN/7bnxpWd20ufPXXdkDOpE50FMqCznAqUX5
	DZkr5tC65HKa+xOD6WiyM=
X-Received: by 2002:a05:600c:6487:b0:480:1a22:fce8 with SMTP id 5b1f17b1804b1-4801a22fd9cmr15560395e9.26.1768471610619;
        Thu, 15 Jan 2026 02:06:50 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428cebdcsm38281355e9.12.2026.01.15.02.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 02:06:50 -0800 (PST)
Message-ID: <c9820ac6-8383-4e03-8964-38e7e2fc3ac3@gmail.com>
Date: Thu, 15 Jan 2026 11:06:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [RFC][meta-oe][PATCH] libtoml11: build with
 CMAKE_CXX_STANDARD 20
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
References: <188ADEF99F4A855B.2595076@lists.openembedded.org>
 <X5HW8T.AHLKZAK448352@t-online.de>
Content-Language: en-US
Cc: adam.duskett@amarulasolutions.com
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <X5HW8T.AHLKZAK448352@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 10:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123500

On 1/15/26 11:01, Markus Volk via lists.openembedded.org wrote:
> By default, libtoml11 uses the C++11 standard. However, when building
> budgie-desktop-services, I get 'undefined reference to
> `std::enable_if' without having c++20 enabled. I flagged this RFC
> because I don't know if anyone relies on C++11.

I remember that this recipe was moved to oe-core[1], because I reviewed
some version of it... but apparently it didn't reach the actual repo yet.
I have nothing against the proposal, but if it is done, it should made
somehow in a way that it won't be lost when the actual repo transition
happen.
I have added the transition-author on cc.

[1]: https://lists.openembedded.org/g/openembedded-core/message/227581


>
> On Thu, Jan 15 2026 at 10:55:52 +01:00:00, Markus Volk via
> lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
>> Signed-off-by: Markus Volk <f_l_k@t-online.de> ---
>> meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 1 + 1 file
>> changed, 1 insertion(+) diff --git
>> a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
>> b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb index
>> 38786b79ed..973a39fc21 100644 ---
>> a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb +++
>> b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb @@ -28,6
>> +28,7 @@ inherit cmake ptest EXTRA_OECMAKE += "-DTOML11_PRECOMPILE=ON
>> \ -DTOML11_BUILD_TESTS=${@bb.utils.contains("DISTRO_FEATURES",
>> "ptest", "ON", "OFF", d)} \ + -DCMAKE_CXX_STANDARD=20 \ "
>> ALLOW_EMPTY:${PN} = "1"
>> -- 
>> 2.52.0
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123499): https://lists.openembedded.org/g/openembedded-devel/message/123499
> Mute This Topic: https://lists.openembedded.org/mt/117276714/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


