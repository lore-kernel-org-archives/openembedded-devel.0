Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE85CCF9FE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 15:40:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.18420.1761925204094017925
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 08:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nsifToBP;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-475c9881821so22527885e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 08:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761925202; x=1762530002; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HAVOAviNGW0CavMzqg+VH5rl1MeAW/LZ9frOyh3bUl0=;
        b=nsifToBPcZXuQTqdyt07gUlYMmDK6SMfz4rra9fAqbBiRamDYGQ4Y1TXWUV8NQLNP+
         irLK14R8+JRxhcNJ0AE+fEXvGJ6KOiT+TcMC9bA+MFikL27jOkyoICJ2UB6jSUSd0ikY
         4p7MvWNGbWvW3Gk632B4GLnJAc+zwM54pF53jKi64qU0N//vsCFkPW1UvPRSnBgUbT/3
         ZArAnTP30H5FuGiLKmPZbqj3QCVpC9UHxeQLyAtMwPL7fF4K46u8YsKCOiIl+F5HAcsr
         qVlcpjEA7xErfTp+mfU3mfP64bJz+8vQEnIwgLITH4n+Foo95VNBa25zi+DmLZ/sL46X
         pe5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761925202; x=1762530002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAVOAviNGW0CavMzqg+VH5rl1MeAW/LZ9frOyh3bUl0=;
        b=V789d9nSyqc4//xpW5/p8xZ684sAQlEwt0MOmS7vnRnePvIyOrMQevChKNaXFJN4qp
         WunthZkPWcONq//72q3kz04AbzcCIAhLul6A4oNfWb0e3zlAvib/E8zs7aXyh88YRgd2
         xQ53+jHQBqC9iWPXWr+9ytVVX9zz5uoYikEZ7AftHsOdmTYvF6497eTKcYrvMK1MYBfg
         TnZRLg/U/dQ1Q590n0JmXP3OghJOM8npgMzqU7xbDV8PH71MMSZr1BrdtsFAAY1AyOnT
         /S2Y5SjyqM24cNd6vOMqlmfziRCZWmYtjgxpV/mpT/bGVGEb4aK9G0PznEIidCBC7PK1
         yBuw==
X-Gm-Message-State: AOJu0Yz7xoTvvqVk+9BCiFap+wAdep+RZQHilDF3Zydo4lVeSbyRTzIh
	jPW3sggySmdCOaxPa+TLvGKHSUrzaQeN5/IDMAmy1WhVXzwbvUvBMQPK
X-Gm-Gg: ASbGncuCDlDI0gDz2QCzMKQ2OlzjNjsxCbRTuBwPd8XIC1xffxW/5xVM12r/enUhw6P
	1eNMMnrDGAuhQeBh6GDHxIcw1JLzRdL8RNH6wBWgz1YE0JIE17Wyxass2xrf1adlzuhqGpRECzU
	/8ZcJibGkSgBOGcZUDK4FU89sVzrbTbhYWqlyAba4hOKmXo7xKKYtMrqj+Fk3YfOxNJ089Ejthu
	8qPrZaIu1ReWMKOhKu4wqQKdzyekeWHUkdGo8pp9SKKIjR+dOA7jAS3rnAmUdpv3Vlj2/H+c26L
	UkoQvhRfIF/VUtnZnbmqt5Rn7MGX7kdfUr0jH8MOtLi4pzmRdyNpnGscBahHnU1PAQYfX99/j+7
	H1AyP8yF4ikKSVvR/gO1sL/IN2XpaytnigKySE5zkPGo0rSpBZTS5r/Hhn85euUlTSJVeW1OFjk
	6h4JPdIyDHqI+fReTruuE=
X-Google-Smtp-Source: AGHT+IH89lzXDL5ZZMXhXx/p/3i1gIGKJbDQnXuH+QmstjjLbBUjK42uFpxcHys9SMzQTq8mLhQO/w==
X-Received: by 2002:a05:600c:1c93:b0:46e:37d5:dbed with SMTP id 5b1f17b1804b1-4773010414fmr41146615e9.12.1761925201917;
        Fri, 31 Oct 2025 08:40:01 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c374f84sm3266695e9.0.2025.10.31.08.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 08:40:01 -0700 (PDT)
Message-ID: <ee11170f-3e6a-4690-9b09-bc6304bcbfd3@gmail.com>
Date: Fri, 31 Oct 2025 16:40:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/2] psqlodbc: upgrade 16.00.0000 ->
 17.00.0006
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20251023144351.264756-1-skandigraun@gmail.com>
 <4248C252-5AC4-4D04-B9D6-B71509890D3A@arm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <4248C252-5AC4-4D04-B9D6-B71509890D3A@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 15:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121238

On 10/31/25 14:34, Ross Burton wrote:
> On 23 Oct 2025, at 15:43, Gyorgy Sarvari via lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> wrote:
>> -SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions.old/src/${BPN}-${PV}.tar.gz \
>> +PV_WITH_USCORE = "${@d.getVar('PV').replace('.', '_')}"
>> +SRC_URI = "git://github.com/postgresql-interfaces/psqlodbc.git;protocol=https;branch=main;tag=REL-${PV_WITH_USCORE} \
> Note that this recipe doesn’t set SRCREV, so this is now doing a remote tag lookup on every parse.
>

I'd like to say that it was a test to see if anyone's paying
attention... but in reality I just totally missed it. Thanks for the fix.

