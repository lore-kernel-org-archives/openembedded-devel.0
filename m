Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9351CCFD379
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:31:08 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13418.1764063052808677338
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=IN3BNMUw;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7291af7190so774770366b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 01:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764063051; x=1764667851; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hw7ILlcsZD9IQzyi8sbtCfTUqfLzEaBYsZM47dxK+pQ=;
        b=IN3BNMUwyWF40l0AYvTW5v8l3nZl5w2tQXAH8sMIE83LnKYkqFFm1e88oVhghFAXIp
         ATO+UQ05vyIKaBrnbbXMdy1gvY5WEDxWcGqBhsKV7gyPSJ+Ihra4jsB+MgQKGySEK4Mo
         SaN+XrPItmp/n4hWCRbu4eiS4vofxPrVNya5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764063051; x=1764667851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hw7ILlcsZD9IQzyi8sbtCfTUqfLzEaBYsZM47dxK+pQ=;
        b=VtrkhjIOzkOSxE/8vYe1nFr3xWReoQbnqLUO7d+NKOoaESf4g4QDDKHUSCAGnK+jzZ
         VwFo0xw5tBRSU0BexzatyOb/O5/JQPfixSCKHzjUAvvpKFGf77V69zyd7+oZ2EnxCiKv
         c+JSJqSNg0vejmUaven2SehL/S3PQZWliu4/FdBHPaLGdiejrj9+1QgoA7govTHqLdmN
         5QG+Nbfw99JUqRrLXthYM+gqrhGKNNobRdPMsCwz8DsKNEXAZRziU0lRckaBi3Yn/IHC
         V+mlEFN2mIGt8O6NrDNxkXaunfmtXVo1WxsAalYnQovHK9j5W4W0PyXe0uHTSuLxsIbf
         zNDg==
X-Gm-Message-State: AOJu0Yyl/C/bA4ZavTLFdnrCHwSjB8FwVJoC6We4iJPD73a+nTQzUhAx
	m/wPgLgbdbMk1MR0Kowwa+AXG6trNGG+2OsX81OvtKV5MsZkSSYc4HElzJzfq2tUK7yXN835KwT
	9wuUU
X-Gm-Gg: ASbGnctplJY01Xaio6eJbAGbU9mNxoOA2Ib6ZjZN7WPjx8h+0fRYszT8S46zxqGegr/
	ckdivC1SLgLUsfUJ4tbGdC6cIHep0K20yGf9193S/5I99V4hgalQb/+Aw3VC6hPXiJpOIBhACe3
	zdpkIWymwHD2FNBgJXQYyYoHg35VpJUI/mmpiwJlwdm8EhxdvsFPsC0Y65rj/sktfCnNlY+eJ3X
	PtUbMR1tsMSDYqeEvr8NBhBJp7i9kGjLrQQBdRteZnbsQuP1E/NmmwLT6DR7KwyntFVp9rKvAla
	k76SERuHFUVviwR2xtzQKWqmAuJ1IULXiCO/aJJU0RQYSHdWoTVYmagoKKxHXCg9Bri043Zq9JT
	vNW34+3dxYetE2e+9OihQwm5I92Z5GzNMt+cZP7Sf1oJwr55EQRTA/+uloGQomL7HEt7RlQAPkr
	q6eNtlHAYgyeEYqWarmg==
X-Google-Smtp-Source: AGHT+IEYU1TTYUhUjNmVfgodfhmZ9WXX5hlsn6UNjZqheIlwoIC6pOYhMEvBvH+KXAHaHX8xpZ7+GA==
X-Received: by 2002:a17:907:94cd:b0:b74:983b:4056 with SMTP id a640c23a62f3a-b767150b98dmr1378629266b.8.1764063051005;
        Tue, 25 Nov 2025 01:30:51 -0800 (PST)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76550512d2sm1539988366b.67.2025.11.25.01.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 01:30:50 -0800 (PST)
Message-ID: <9e1752f6-85af-4c4f-a215-57b75a3c9449@konsulko.com>
Date: Tue, 25 Nov 2025 11:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] valkey: Upgrade 8.1.4 -> 9.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251124092909.3234487-1-leon.anavi@konsulko.com>
 <CAMKF1sqOhnb6t9O1HPnYAFpt5JWQ-XbkKzMgGfGX65_LZ+zHoQ@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMKF1sqOhnb6t9O1HPnYAFpt5JWQ-XbkKzMgGfGX65_LZ+zHoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122052

Hi Khem,

On 11/25/25 07:59, Khem Raj wrote:
> Fails on qemuarm - https://errors.yoctoproject.org/Errors/Details/889836/

Thank you for informing me.  I was able to reproduce the issue locally, 
submitted an updated version of the patch and opened a GitHub pull 
request with the fix for valkey's upstream:
https://github.com/valkey-io/valkey/pull/2873

Best regards,
Leon

