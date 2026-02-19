Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBEAE9A03B
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 10:34:34 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11081.1771497272136883800
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 02:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KYaXtTxY;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso5838655e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 02:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771497270; x=1772102070; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/WkjfeVYaHWqye31Ua/1z3FmsvseRtM/x/KJf4V6rEo=;
        b=KYaXtTxYBh0sz/nzbuASN/ebPPbTrrv9by0NhtBx0TxoUmqY7+raa30reZVvXK9png
         q+aKFSpas5Gfv4Af0pdSWDdM9tmnV1O8Yp0evVUIr7GSvyw6WfiGZwumrILRx3QbHzsK
         dJft8AtNKWqYUTgHJPUkOIbnw4ky0p/yluj4kwoGnwjecltQ13Mzz5bJzThWSAz/i/hx
         gfJEuiJdFgj0iixB6KekqSPSQKWZLoIfl366YuMkSag+FLshLOOnr6zuUItBLT3hbi5x
         KYnidp4Mvz63UpVA49KzKKPPiga78v5jlqhBmOLnE7FzN+XVG87Y9BltJV6x21RHsslU
         k/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771497270; x=1772102070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WkjfeVYaHWqye31Ua/1z3FmsvseRtM/x/KJf4V6rEo=;
        b=REm6D/VILjrfYrLiLVfBYZAcqxQU2+D6atbuzFW3fSVAjGTQYiTw4OoMofZFVFldFK
         FPgegBqMtDYkcSSL+2ZhFuBj/93i+E3X99qUBKpOVQSONGlmGZ13YoX0y5aHgKU41bsX
         CyRgTes3uovSMm4NN+hl6BnarQdTjuZwEkTDadBoMGxMcxQR9uxKx0YBJssZAAtNuicm
         WW8QQJf6cjnk8YqNtsUmpy6Cr+HowbwcxVDs/jYnhuUrWj92JUvBvkxl16cr3rTOkqXR
         wCr2EfeKQHZbxflX22/bFNvLiKGHmWbiuYYBDhg8/o9fQyN1KsbwecdYTXa5bFtvjnip
         EevA==
X-Forwarded-Encrypted: i=1; AJvYcCUXNWJVZfkFv6FgD2YrcqVKlxtYqfrhFKvmfiVVDhy/S+sz8AQoI4krg0jz1ydH35K3afO5b2vM3Oj0ISkUN1VKQPY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBACvMrSdpZvu48pp4zd7KzStuPkub6QcIM3k6c2aXIJP1TAgd
	+YQTZqNAwztPWDVHCQfiYgT5XV0lQvNCh1TpgqmbPRHOhsz/gdCv5GtFqNs9Tg==
X-Gm-Gg: AZuq6aJLYIugtxG/zYlZfcCmY05lP0GIyO2pmX3k//457isrIUW8+0BeNtapAoQkLoV
	H3CyC4paIOnAJWdZSfDB7O5B0kNTz/rqCR/89HPDm8PjjjQzLkoA3QV878Bm0cCQ/3S8XgfBBkt
	274KOGUBHrh24+0lK9Pi2UaLyhPl2yeHUGy2aD/ymXGPb3Lpuq8mI4Sf6bFk0Ss/RcgRWgSD+Im
	GzOTx8T530vaeuQdih/Ws6r+hAUUOW7xvPF+esjDsglXwpgFQRVkudPoBCN2o9p9CksKIV0SKS9
	RK3LvonHsx0ENH4/ngx+FGEI9Ks7D+ep5G4oAJ/jCJi8fRT/9tz57wLcN4MSG6OCr4Onuyoa4zy
	1q/2Q4oq+GtbZIlpAW7fA86JZfvZ8u8itvcm+x+3l4I5jq1rn8GAwyZM3OwANssVYNo69V6VUnh
	fetizQzZMS4A78w2iZbk6hs86/X954z6qO9Po6ooJLjw==
X-Received: by 2002:a05:600c:5296:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-48398a42672mr78981075e9.6.1771497270408;
        Thu, 19 Feb 2026 02:34:30 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f990384sm23995485e9.5.2026.02.19.02.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 02:34:30 -0800 (PST)
Message-ID: <1b945bbb-041e-4f12-91cc-4dd5850fdf40@gmail.com>
Date: Thu, 19 Feb 2026 11:34:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH V1] rocksdb: Add an option to set
 static library
To: mail2szahir@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260217125514.34002-1-zahir.basha@kpit.com>
 <1727f87b-6567-485b-93ca-4b63e5b8d831@gmail.com>
 <991492.1771485025027262629@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <991492.1771485025027262629@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 10:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124506

On 2/19/26 08:10, aszh07 via lists.openembedded.org wrote:
> Added PACKAGECONFIG and upstream the patch again. Please check now
> https://lists.openembedded.org/g/openembedded-devel/message/124481?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2Czahir%2C20%2C2%2C0%2C117873927

Thanks a lot for the new version, I have nothing against it - will add
it to my staging repo, test it, and I expect it to be part of the next PR.

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124498): https://lists.openembedded.org/g/openembedded-devel/message/124498
> Mute This Topic: https://lists.openembedded.org/mt/117855568/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


