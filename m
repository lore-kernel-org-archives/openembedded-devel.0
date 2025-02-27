Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D99C19F32
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 16:56:51 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.15846.1740675407622321075
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 08:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gpvaQFu+;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abee54ae370so171716366b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 08:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740675406; x=1741280206; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIdFKoRHMAFxIzpuuLwz93fpXfsXNpZNFvMytwUEW2E=;
        b=gpvaQFu+5y7NMelH/5irTu/govB+/Vy/UzBSncuTiyp5ro6jNa1n51uMZz1KmHANxN
         PjOFN8IhmpXHATIaLw5YnVD8/g7JvGVz+DBfkLRQrkST2HdSyZKfvDkpFdsrROBEWT/V
         qEedc5f17hg5O0v6piRln6lnNECYWmYbYccI5n4jFrGe05WHHXPUMb1S50OXP7yIjJ9O
         BOEz2iT/6k35TEja+r+e+Nd6ZlxtLQzhT5EHCk3798yD0ziLCEKA1k7zYhJA5zOSNzRM
         x2yGr1ORv2E4TDUWCkWT4CsMaxwgOW5rGZ7kq3NtHLekRMaDtPDMyoLV78v0dEbdHVFr
         6dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740675406; x=1741280206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIdFKoRHMAFxIzpuuLwz93fpXfsXNpZNFvMytwUEW2E=;
        b=c8nkq3iTvR2od42dGlRrM/HjS+5ZXvgj2ugzUDdceXPqHzyO6AUII1ZbCrjEf70cYs
         kBpLcb6IHC/SbWxabcusuxUfbAprUzQYmliHt/96zQ7LLJ3V296S9DKneCWdonGX7nen
         FAyxetkOY2tFoNWio2xz/3YrMOvqAQURYR3z09z8Jm5r1dibfHpjtQbJ5u3AxRq4Xj5E
         R6gAVbb0O3aPkuT1Zs/QDTw6deOlS1AawXoTe/Bvvc52eE70NrQXzLOY6maJUH3NUV94
         Pkf3KNr8fhthFwXZDHYMk3qVCUCx1M/TYV+BMlpRvNZfhZyXPOgSpec4gMhGX2Eb/ddy
         +SpQ==
X-Gm-Message-State: AOJu0Yx2Hzit7+DdErPoWJcNs4SAUNWcUjOsh6zY7pWs7jyku+rI/Jfq
	gjhZ0U0a1LOPokEzQ0vwhN76F9uuCgrSe8A3fIWYEFPCCz/7JDpk
X-Gm-Gg: ASbGncuIAD6vVQFGAG9jbrRJGMxTUgXjfbBkSHb3bguhvMb0xeRQKKEKBOVurfkxHfq
	Bj0lJqguW5Z6lbqYFriQr0YpoEQYFQ8TFeda036uPwJsGSH8JM0x8X8JCqHS818qm0H4ZO3upmg
	tUiGKDtN3smnqDLc/eKec0nxMRdQI7GhoIexbl87xETkYoXjecvsynaaST3P2L/EZEySpitdFEF
	Udarhhft4To81YrBfi54N3SfgCSXBXvzsf1HX+u3jsvtEzmOE9fefUe90v5m7tSIjIE8OExW6ed
	MlAUXA5DjXtp65Ub3bZqlBkQJO1AKCF6Sw==
X-Google-Smtp-Source: AGHT+IFBIBIf1XQJpvGsbDqTQqunJfvWqqWYRYLLRQJaaNGFP4bSeXzBJEBurxYI2MMak0UrVmA7lA==
X-Received: by 2002:a17:906:d542:b0:ab7:e3cb:ca81 with SMTP id a640c23a62f3a-abf2657c56dmr20619066b.30.1740675405606;
        Thu, 27 Feb 2025 08:56:45 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c7c083esm150630566b.175.2025.02.27.08.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 08:56:45 -0800 (PST)
Message-ID: <84505909-2f35-4897-ba38-07220ede9f21@gmail.com>
Date: Thu, 27 Feb 2025 17:56:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] thin-provisioning-tools: add target and
 sysroot to bindgen flags
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250227120412.1465709-1-skandigraun@gmail.com>
 <CAMKF1sreKdR6d2x35f80pKGo6nxQKPj4dR4v8AGiEFLVZrth3Q@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sreKdR6d2x35f80pKGo6nxQKPj4dR4v8AGiEFLVZrth3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 16:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115694

>     Fixes the following do_compile error:
>
>     |   /usr/include/linux/types.h:5:10: fatal error: 'asm/types.h'
>     file not found
>     |   thread 'main' panicked at
>     /yocto/sandbox/build/tmp/work/cortexa72-poky-linux/thin-provisioning-tools/1.1.0/sources-unpack/cargo_home/bitbake/devicemapper-sys-0.3.0/build.rs:24:10:
>     |   Could not generate dm.h bindings:
>     ClangDiagnostic("/usr/include/linux/types.h:5:10: fatal error:
>     'asm/types.h' file not found\n")
>
>
> Good catch I forgot about target vs build here once we point it to
> target sysroot we should not need build flags perhaps passing
> TOOLCHAIN_OPTIONS would suffice 
>
>
Yup, you are right - TOOLCHAIN_OPTIONS seems to do the trick.

