Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E028C7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 11:20:13 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.5549.1750504807295597627
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 04:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eww9gr14;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ade5a0442dfso517119466b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750504805; x=1751109605; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miXFRqXKmZaNJcoX0jjFR2gAQKB92sLgbnot2l2TBrc=;
        b=Eww9gr14x9GjfjkdyGtZZB2iEaGyTrNdOcY2w4Cy1x/eGoTYnxlJCe5V4dQ60DWZAm
         oteM3nm7xq0Rm7k5ufiVP3Uj3ZaydWsP7NUEI6ZLXmn9CNll0T/vn5XoKX4aMwawBW7R
         p3tWDYa1abE4C+SgteyG0kUEdyE9RHhrfBGRVuqwBoOc33LGQUt/PCQxfI8H+XscwoJE
         Pi1Sr4utp5J3Mh0XrsBJDR/76hIPzWN7gebFF9phqNgBcjxRVX9WxDeCjnB0TgiGhHAn
         Qja5TdVWX38SDVe+mvca12dap0qniwexflLUigKiC2E1F3AtrLn7k8+UEa65gSw3qnHT
         pPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750504805; x=1751109605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miXFRqXKmZaNJcoX0jjFR2gAQKB92sLgbnot2l2TBrc=;
        b=DFJdvLAspj/7A/wMJwQ10FjD32IAciJEFtXBOtw//HdY2BNJLkusGCwemHCHh0LCDs
         TLJ9ppGcmy8Rv0zXX9RNBd/NMcynPXePj4vMH9GEY8n+n7L1GJ5sktWCM1M5h+1VM/xI
         L25zrK72uVGF18djmMY0xjq1yrXBJDjr80atIpFjQ2JRFjfsQ1SbP4qORCaJK8HWjA50
         JZI/KH7saQ1YWHB8ApRtN2K1zWhtmJP1UtH5U2nERfEyamQl6duyFmRw21eD1plP80BB
         lNC+jD+bGqNIRjlooHXO4ap3zMe5d9XsHD1ad2wocghR8B2z/u8TWvjBFD0ap+p5kUT9
         j6/A==
X-Forwarded-Encrypted: i=1; AJvYcCWetIMYx4X0t/B9FJkIXwU6hxCAsT3fNP4JPm+Fw6i3LQaKVEfwe2h3WYZ6a6eB08wDj3eameOefPJRUghrSSevrPY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwoE2CDWpNkCZgBaEYH0QwxR20jl8pIj84cmL7HHSXKjjzaIfzM
	zLW0f7o9l9KxHcsjezkNlKOc2X5/3r6oLCBz6HXfk2I59z+p1q2Wwz7h
X-Gm-Gg: ASbGnctClzdNx+YSDmsU7FLk+UAGko6Gj3A6ksEPNXdgXdS7nnztFA/yULYJSRHu3h+
	yevoA2zy5zla9ZD2ZEsgcURcL9Z76bynLNCzZfkL+ZBnWDL6p1pMEnI5JakWLE0IuV3O6Dk0ETa
	Je/Q3viiluIDIg5lD6XBz/ClSl4Tb46Tf6XpaceKBw4ihKrK3RUVc6J19q6YOIFndvRyeqWgWDg
	RoQz/1T20x1+AoL5O7MWIOIjxsLmw/tIIKnLOMxyqNMktjeqPMKZwxusScSgnrtiPjBBra1wM9O
	/XCJplFmgrlI3DayWDMun/Pf/ElLISnJmp+KiB+btyoC6u9nmClwg1W7NnCey7rIAUrL2w==
X-Google-Smtp-Source: AGHT+IFF7TxmASKUuSl5GTWqfluF9/9in7eEcbf+Cegk+PRObAPKH+YiHSQ9u9Wm76au3TKTLfmf5w==
X-Received: by 2002:a17:907:6088:b0:ad5:7bc4:84be with SMTP id a640c23a62f3a-ae057b97f80mr566473066b.52.1750504805347;
        Sat, 21 Jun 2025 04:20:05 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541bb5c3sm344684466b.129.2025.06.21.04.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 04:20:04 -0700 (PDT)
Message-ID: <0123aa94-7e4d-46db-a7de-84af5cc7e407@gmail.com>
Date: Sat, 21 Jun 2025 13:20:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] crucible: Allow network access during
 do_compile
To: alperyasinak1@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250621090926.1466318-1-alperyasinak1@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250621090926.1466318-1-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 11:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118003

On 6/21/25 11:09, Alper Ak via lists.openembedded.org wrote:
> Allow network access during do_compile to let Go modules be fetched at build time and avoid network unreachable errors.
>
Is the new go-mod fetcher not usable with this recipe?

