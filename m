Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F187E81A49
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 17:03:04 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24387.1771261378640488443
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 09:02:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DNJU1TVu;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so32801845e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 09:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771261377; x=1771866177; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vT0nhQEW7MFV4uKk3NVNRJDqbSkPdhj4YnukXh1B5wU=;
        b=DNJU1TVuZHGXtU/qMbNXMJbDr388BtaMC2gfGq5ocqXpMi+DMuT/TaxCcTEdN5MZgy
         APEDnIR263ekBUCd730Fldv6Q+Q4wcDmfJXRx+UlGy0vv/5zrJKhPOe5vCXXGsFKZY3m
         wCSAHXn2+ujVajQiMvKtT6jLYn415KvYDy/aavlqID+Yp9jzHuflCSxYWugdCoqiuxBE
         ihjHBZN46duUFvsKzCqvibS51vS+AMyeZXUU8Z4IsYTgMQ0FsY6WnTkggYkgSWZbebUP
         R0/T9/taWKZnyxbhhUtdejg+B7GdnHquBt50gc0YzggebzGLb1hGjYV+tYP6wzuZ1eX0
         yK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771261377; x=1771866177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vT0nhQEW7MFV4uKk3NVNRJDqbSkPdhj4YnukXh1B5wU=;
        b=tCatppqAIyraGTXfO/gbprb6F6v5+bcOGEq/p5Kv8rq0iecRcDra5yaaEUgVQOXYlc
         vko9mqY47LF/0TqOskmFl+G9KURPhJA3XJK+EB8nWfC1YqCpC9GsCz7jfECnE/trlOFx
         QZwilfX6IxknNWj0SmfzG1tW/HMO1l8Mr+4JjwYnmQHsKyNEp+Ec2PmefWJ8SeOOOV+i
         AjF8UYiclB+nxzBnFLaYVoolPnLm7keO6IWdqdjuYh4ySwmcDF9BrOsFzIvFluBLX4Ar
         DH0VBy7tV9DZ8fqm9NqGNfG+Xs1JeUpYOQXhCqkeTM142twvFpmCd+TMQ1BQvCbUEiok
         gX6A==
X-Forwarded-Encrypted: i=1; AJvYcCUfyRpM4a+ZjUJCY4fDH7aAgVQ11jy2bOwTmMLpngEWVPLRMzrGm54Up8bb4iGe+ohXBdlh1uK3DJg58gpBiZmHMNQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxL2SGugwnkksyampYPvaXF8e4ObeQQiWk9ZrJ1IPErLZM3I5Rb
	Ixw3ixhW7ZUzNiQjlphR4oRI/eWtECiM8fuFFlTC7/3L6WNRCu1Jcs4s
X-Gm-Gg: AZuq6aL2r3+L/bWsvelcVfORUReCEVmE0dWzsiUoUq4WPuqw6PRqttAq5/KTuzqr3BH
	s6kQqhmsRfwvNSKtAfesTxzvA1AvG0ht71PR9Crq3TL3eHPpi1ckm8BgAEIa3XN85puSWYVyPkO
	tTa9qYSNExD2ngi4ALi1Uy8j3wl3ZgxpnK5oiDY7HMx2OuJx6+NVuLNxzrNCxwnExx+adVcOQWr
	avxzxW/7Hg2SXllG1OENCn6jO5ABrTt5liDHsoU6VrPLwCz3AAU03g1/XHwCh75o+E+kVO6XVWW
	j3jzGI2XiG/GqWbO8pOJ1rrcQ0w4dyezp4+yePuLL5ZbrWV0jdkdoR8FKYq2oF8sm26+6/tyG8j
	vFZXp+I/5FpwjnJbNc350C/5BUfx8RxjhikU3FYZ7+g+Hu8eyStRe51mob/mXxn7kAqQdskKQfv
	s7Gm8mgG1Wd9TgXvhgT3qGwkc0lp6N0BA=
X-Received: by 2002:a05:600c:4f4b:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-48373a160b8mr215665985e9.3.1771261376738;
        Mon, 16 Feb 2026 09:02:56 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4afsm825051835e9.11.2026.02.16.09.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 09:02:56 -0800 (PST)
Message-ID: <8e0422a2-d70a-46a8-98fa-8093bb7764c1@gmail.com>
Date: Mon, 16 Feb 2026 18:02:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] rocksdb: Add an option to set
 static library
To: mail2szahir@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260210133500.30649-1-zahir.basha@kpit.com>
 <700cc6f1-6aff-430a-8e8c-086df76cb5df@gmail.com>
 <920657.1771260365675421294@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <920657.1771260365675421294@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 17:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124427

On 2/16/26 17:46, aszh07 via lists.openembedded.org wrote:
> As per these change, the static library option is turned off through
> Extra_OEMAKE config. The same way we had done in scarthgap and master
> branch.

My point would be that if someone relies on generating this library for
whatever reason, that build will be broken.
If someone has a change in a bbappend to disable it, that will be broken
also.
One expects breaking working builds in the master branch, and when one
migrates between branches. In a stable branch (especially a few weeks
before EOL), not so much. That's why I'd prefer to have this change as
opt-in, and preserve the existing recipe behavior by default.

>
> Also We have confirmed that with the default setting ON, it generated
> a static library without -DROCKSDB_BUILD_STATIC=OFF in the
> EXTRA_OECMAKE section of the recipe. 
>
> However, according to official upstream comments from RocksDB
> developers, it shouldn't be ON by default as it breaks their Java build.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124426): https://lists.openembedded.org/g/openembedded-devel/message/124426
> Mute This Topic: https://lists.openembedded.org/mt/117737559/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


