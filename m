Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A2FC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 19:10:11 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.56770.1745867403313241374
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 12:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lfqcBESc;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so9325928a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 12:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745867401; x=1746472201; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8IkMYs5UpZCM0syjmBpzg+4XMPa+mun9x1vcl8pPl50=;
        b=lfqcBESc7pFBwSQ0e966przCvY4GY6XYIlehD1vQBj3OoCbAW7o50L62s39oHdE5dj
         RWltfxk/w4o/wOZze53VZks0cgnGrUf0d6XlmPzL6i184RCZV/wgocVMzrAbM0j5ifor
         E57DmcP4Fcjzs5/cA3javPBVHiIKkKHNw6hPPzH2qPtV40PEPuqMDWO9srEWniArJrdq
         VjyF73C9du2bTKc/4wxu3jTx/AzhXrti8zdzODh1JN4CcH19hY70mFQG4XFm0Rr4qt/y
         Qi8tOycimLljVMap18lhpl8lEdk80RsMqtuBnj8SpOb8C+khMiUnl3uHARKq4hXqO1u6
         vinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745867401; x=1746472201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8IkMYs5UpZCM0syjmBpzg+4XMPa+mun9x1vcl8pPl50=;
        b=fdaeT+nZ+YSBnWWErSMLsk6wkaTpOQwSFKpu6pbe5bhKcHqvXvivkfGu+JUgFkTERM
         NffH8N+hU3ft1eRAEtuKSBaQzNj+nRdmzP5vwD9rnHTS85oUZrvXetNsWdwsrcII76gx
         xev1KUxnpLdhrfecMAmeK19tkxrkeXcIgdgZx5vF72LZdplXJxjrBtTYKNlpJO7LIxop
         1L1A8465wtr5EXCof6Lpwh3G4/RGWjUmHBv5SSB33mWskwzLKVnt/ibEZ9HzdxxzRIXP
         LjhWSrFhAK6PxS4kXrFljEBX9vZ0krD3GYG5fvNmlM0Ih/0JKmwnqiYb088j5suRZRYp
         0GdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3qOQbfHZ9Bz/t2byHwxZzak88krC0Zex0522ay68fa6bvlkmEn9wnSiDfPoNVN2VAWacLp6ZPX1T73CpZLnEyvco=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzXxe4/wDOnhEhhtS9Uq1kXmr2yGm5qzqQE665i66VvN7l0nz9H
	2FyGwUll9gJad/RwEXVggvjAeGXrhEW0XB6xgGJt0wYK+kG+kROEM8E3iUpe
X-Gm-Gg: ASbGncs2Koqe1yQ9fLCkqNv/n/gjYBJzQO2nPAxG4i9IVuyag5OrDU82CN7/MVv1NGL
	Rdz+Cb6NshN6BLwL/aJX9OFnqPGe7DAtPTbRc1sm3p3op8moIH4cRUqRHiV/iQQTKeU1fmii37I
	oxEO0GUK58zgtLtwuYoN1XbEbXicvk189jEM7RuIrdNJcNrbtAM8dcwhPDYfjlabCSmViUAVOIs
	UHd2dpUE70zWhkYOhBzppbHJkRVMVtqour7qYH/SkYqxDcAwMhnnWVtrSXG78T1P/Bas/TGVNXl
	dIEZtrkhW4DmFHZDH761KcC3feH/CrphWjwjaTMNmrr+rbxk
X-Google-Smtp-Source: AGHT+IE+1erf9p6jSyeMRp9DdU+rNwaXzM14Z5UWiD4nVm/9kdiuFGTw/WHG4mm96KKQULZF6E9dig==
X-Received: by 2002:a05:6402:350b:b0:5f6:2758:149c with SMTP id 4fb4d7f45d1cf-5f83884b6b6mr719074a12.10.1745867401281;
        Mon, 28 Apr 2025 12:10:01 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f6418sm6456945a12.40.2025.04.28.12.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 12:10:00 -0700 (PDT)
Message-ID: <28c0da79-8fcc-45d8-8067-ad1b028472b9@gmail.com>
Date: Mon, 28 Apr 2025 21:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] About Nmap License
To: yi.zhao@eng.windriver.com,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <382f1864-39e5-4c5f-8407-296c64cc7155@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <382f1864-39e5-4c5f-8407-296c64cc7155@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 19:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117203


On 4/27/25 09:39, Yi Zhao via lists.openembedded.org wrote:
> Hi all,
>
>
> The nmap has changed its license to NPSL (Nmap Public Source License) 
> since 7.90[1][2]. This has caused a lot of discussion, as NPSL is no 
> longer considered a FLOSS license[3].
>
> According to [1] and [4], 7.92 is the last dual-licensed version:
> "Note that some releases of Nmap may fall under a previous version of 
> this license, or a different license entirely. The exact terms for a 
> given version of Nmap can be found in the included LICENSE or COPYING 
> file. To ease the transition to the NPSL, the first three Nmap releases 
> made under that license (Nmap 7.90, 7.91, and 7.92) may also be used 
> under the previous Nmap license terms by anyone who prefers those. "
>
> For other distributions, Fedora has kept nmap at 7.92[5]. Suse has kept 
> 7.92 in OSS repo and moved 7.93+later to Non-OSS repo[6].
>
> So do we need add a recipe for 7.92 and set it to default build?
I don't have a lot of opinion about setting default versions, but for
what it's worth, I think it would make sense to have a separate recipe
with the last GPLv2 version.
>
>
> [1] https://nmap.org/npsl/
> [2] https://lwn.net/Articles/842436/
> [3] https://github.com/nmap/nmap/issues/2199
> [4] https://nmap.org/changelog.html#7.92
> [5] https://bugzilla.redhat.com/show_bug.cgi?id=2296006
> [6] https://bugzilla.opensuse.org/show_bug.cgi?id=1211571
>
>
> Thanks,
>
> Yi
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117158): https://lists.openembedded.org/g/openembedded-devel/message/117158
> Mute This Topic: https://lists.openembedded.org/mt/112479917/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


