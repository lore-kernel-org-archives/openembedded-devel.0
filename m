Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8025BCCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 18:56:53 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.845.1762801005579175337
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 10:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UzAOHmxg;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so18650845e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 10:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762801004; x=1763405804; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gRLrA6paA6zzRHrhKg1gXequtVvysQHWYphsqxmVhxw=;
        b=UzAOHmxg65CKA5Ky8v2U2Yasss0MqgnMD3VCkIBRuSpMMURCXk7VqO3TcFMIIPk0lk
         feJPInMixiVz9OG9UJl79Qio8pHFPe83wKp/izEh9fw5JJUo6OkLZvC6DwqPYVyH7sAX
         WLd4a+o7U6sW9ZPsUhxBZYdPQ0r5sG0Pi7TGVV0eMpMCXfcLwkehBvOzWSO6sph8KzYr
         98wSXj7nwe6XVeVgmAVkGJyaa5ebZETTO7RNAVFVS3Zhv+tQis+Jtd3iGQmqWq3ICmqj
         tqCk86R0mbbPb10HyrqIjGchUhuZqZLwf+Nh9AV/YuPsy7/+Q0y3slQzJfpPrS/nRgC6
         8dKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762801004; x=1763405804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRLrA6paA6zzRHrhKg1gXequtVvysQHWYphsqxmVhxw=;
        b=v2uhNHETGlB99se9ULTPHDtrzLjbtZCGMbvYEv+VPyuPQPw8tvK0vzl06jddcTMFuA
         JC7ZiSaNK0QDfyW/a9FgueUnaFyUW3+pOJeRW82pn9rBb9ZhZ57Dl9qUcxRaf93VJa02
         98PjeLwJ2ujH9hgNQvkj5rvrLkF6mxbIb7y5kFid/Q+FvUKCdrl//3oh6yjTSnqc+4CE
         U9enk7JZIZB63T5IAdoqdTXu1joh+MFRiyFz0xW3Lp2yHVXgd/JrCkK0hdjPD2WnFtuM
         mNKldcSP+rpgzF6Fuyj2Ayzt6srEV9JMeDmWHw36ynitjZ7qAnY9xfqwIM3mvjsA/IMg
         ZYjw==
X-Gm-Message-State: AOJu0YzhLS9QLc/TWjTx14h+qyKevn3Hx1MeVLCks8tyIQDWuYASigK9
	8QjU/gul8HldA4OZcfGJ6v1G6fpf20UeGbZ/XK4+yFAHguSWI5arUT8/bSWwrjUB
X-Gm-Gg: ASbGncvqHcnGh1/LHG6sSajwbtL2xxUzBHwHLbH0fhxu0F0+0PwQt0mfmIqy1BVDgBj
	YMN225FzujzJ6zYtM9jMFtXQRHPiZoDiKYrG5bqmj4/F+AFHOIoPwjeSxqR+QUz7CVZhecJ2mV7
	S5j0Ynpw8JvScfRudAn08exeWP5pwI7pvkPA2RPWX4QYVQCWEgkF6/U+SZ+Y7f7qcLbH8V7vL9Y
	237oFIXRBu7vpVlsowLqf8t/ywTSISnn7m+l71R4AISOPrazDq9aFmY7ZYzas7t0gaTw+zx+e6c
	E2K+OWKlgmuSDtcg/YPdTnMjPhgtPlQ84ijL7OkU89B4/y2IucgJ3g8QLU5UqU5bOwMjWuvFnkc
	zyVOmBev1lBEV6T6amFJMDygwlWl+7MNJ3bxQqDGee/LoNE9+mAP1tPhSk3VnHOc2g6XzyXOhKi
	ElumC4aDSp
X-Google-Smtp-Source: AGHT+IEhWq0bWs50V1eHGpJ+5VEjCqZOw6YbHVBNi029+JuIDY3J+paOnlkvD0apJLGWcT4Hv265PA==
X-Received: by 2002:a05:600c:3b90:b0:471:672:3486 with SMTP id 5b1f17b1804b1-47773234812mr72441685e9.15.1762801003920;
        Mon, 10 Nov 2025 10:56:43 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm89648585e9.13.2025.11.10.10.56.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 10:56:43 -0800 (PST)
Message-ID: <c15247c7-7bf8-4c96-b75a-af723dbaa027@gmail.com>
Date: Mon, 10 Nov 2025 19:56:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] poco: remove mongodb from ptest
 RDEPENDS
To: openembedded-devel@lists.openembedded.org
References: <1876BA219CE56AED.840386@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1876BA219CE56AED.840386@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 18:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121472

TBH this is far from being my favorite patch. If anyone got a better
solution, I'm all ears.

On 11/10/25 19:55, Gyorgy Sarvari via lists.openembedded.org wrote:
> mongodb is in the dynamic-layers section of meta-oe, and not available
> by default - which makes the layer not YP compatible.
>
> To avoid this breakage, remove mongodb from RDEPENDS.
>
> To run ptests fully, this is still required to be present however
> (bbappend, or local.conf...).
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-oe/recipes-support/poco/poco_1.11.2.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/poco/poco_1.11.2.bb b/meta-oe/recipes-support/poco/poco_1.11.2.bb
> index 53ea13a480..b8a1b571b1 100644
> --- a/meta-oe/recipes-support/poco/poco_1.11.2.bb
> +++ b/meta-oe/recipes-support/poco/poco_1.11.2.bb
> @@ -101,6 +101,9 @@ FILES:${PN}-cppunit += "${libdir}/libCppUnit.so*"
>  ALLOW_EMPTY:${PN}-cppunit = "1"
>  FILES:${PN}-ptest += "${bindir}/TestApp ${libdir}/TestLibrary.so"
>  
> -RDEPENDS:${PN}-ptest += "${PN}-cppunit redis mongodb"
> +# When running the full ptests suite, mongodb should be added to RDEPENDS, however it
> +# is in dynamic-layers folder, only available when meta-python is
> +# available - thus breaking signature generation and failing YP compatibility.
> +RDEPENDS:${PN}-ptest += "${PN}-cppunit redis"
>  
>  BBCLASSEXTEND = "native"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121471): https://lists.openembedded.org/g/openembedded-devel/message/121471
> Mute This Topic: https://lists.openembedded.org/mt/116225114/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


