Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B29E8B393
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 03:06:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11132.1770174359286231589
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 19:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fjy9Q7rr;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso1348905e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 19:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770174358; x=1770779158; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JhIamiEgbPWM9aHO3P1YlfLiztpXP6aAVo/n+8/KZ1I=;
        b=fjy9Q7rr1Ms0m/f7PhjjY7V6LRDa5oauPdZyGSXZiy7uQdEMAvj7zp6AchqJ8+YUba
         e0bNR8iE7o9/fRPdqRjVXyD7ggodcw0nTLa87M/ukeKbZIuB0FdXUC7Fla7RZfucZroO
         AtqSynpUnsFx84pKXg6Dp5858MjkQJRATCL4HyCN1jXQenGqAG4mHlpavxDfsQv9pNta
         FRPDtKn3QcTI4srgm2Z6ifAzubH3fffBPsCNxDYF9TSLO9KCW3eGAkZPVmtFEKcMCxZ6
         MtGrjWsaAaJ5wbbOhLWug/HF66alkm3QGefCPme0YNSXIYKgQCW0/jrRTvYrYKIRZt4o
         c/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770174358; x=1770779158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhIamiEgbPWM9aHO3P1YlfLiztpXP6aAVo/n+8/KZ1I=;
        b=oRGrZJzbhrTp4uh9YzokfTcLi8506POBqoKoR0dsRGmlLhIY/FnQmcz5DwpIAZjBeh
         6Ffs4Tmh51NDK09lXTbwjcUps2TeFrOWy/5vGMSy6Hb3BEl3c8aU76t+ZEzfGg9J+Vf3
         UeKPO7rVHU4EYFCStYcgg1Umn7xGVnxPRIx9IkG66QiM+m2yH/nPNYHAiH3p+FxA+s1E
         Rkp9P60c+07DC+F1fmb2QMud10iye2spDoM2CD5OsUu3zN7EAJKLYAG8hlG9JeKTvub3
         Crbel1itPekWZ2kcLJZsTj5wsDdEMUK5SRCvM+5enZgtUF1MMY+lMYlNrf3WbkDNlcNW
         BhDA==
X-Gm-Message-State: AOJu0Yw0/7/z7aiFsPZ6HUZpyTPgUXziGBGzqVTMEECDkg5y68kLZkME
	sVKzbovGlj87rY7wl+gTcDEl8aDqubbH3c+wQS/ZUu8OgvrukjwGXlt1+Avd0Q==
X-Gm-Gg: AZuq6aLM4Zbw15aC0/Q8ViKzYgrrmuFSkTpzBQM7V/DHRmY1XzzBCzJOIHLpV44nh5I
	iz7nODssmqlmRgrn7/yu6nE0mPZ6IjQ5+ACQUMUzy41lQVNr5MKbNrWmvcZlDwfGY5H1LOxSFDE
	tfff4Dgb1WIe/nBXg+8urstzNzD6JS3Fpj6LAWv/2CC4J6Nq5g1AGkU1BLaE2r8dAPdvKkGx2KU
	vKDeTUCCn91GA1jxz7yqiKi0sp3eYZGIBMcjqXPK8HyT3halplc/e2pvgQwfO4CbduYW+83CRdf
	nURGV26iy8ZU9h6l6045flDYkLoFb9Wa+tMxTKVailDnW2EsYk8WIEt/qGTj8KTcHUH/KLr1DaD
	Ht/CHjiMhuLBDFf2K7W8q9B304lYStxukK2oBPQBypLDvhI57dtXCwR+gtzdJXU5Hyl+I1smWZt
	9sjwxCfwUo618+p/LWnBc=
X-Received: by 2002:a05:600c:34d5:b0:480:1e9e:f9c with SMTP id 5b1f17b1804b1-4830e930f27mr18505115e9.10.1770174357514;
        Tue, 03 Feb 2026 19:05:57 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831092788esm16012025e9.12.2026.02.03.19.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 19:05:57 -0800 (PST)
Message-ID: <fd69d4fe-1cb8-46e0-90b0-abfacae6ccc1@gmail.com>
Date: Wed, 4 Feb 2026 04:05:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 3/3] freerdp3: upgrade 3.20.2 -> 3.22.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
References: <20260202135045.1476359-1-skandigraun@gmail.com>
 <20260202135045.1476359-3-skandigraun@gmail.com>
 <6OLW9T.MSA6ATTTL1ZT1@t-online.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <6OLW9T.MSA6ATTTL1ZT1@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 03:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124120


On 2/3/26 23:12, Markus Volk wrote:
> On Mon, Feb 2 2026 at 14:50:45 +01:00:00, Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> Dropped manpages PACKAGECONFIG: when it is enabled, it requires an
>> executable that is compiled from the project's source, but since it
>> is cross-compiled, it is not usable.
>
> This fails for me with:
>
> | CMake Error at client/common/man/CMakeLists.txt:27 (add_custom_target):
> |   Error evaluating generator expression:
> |
> |     $<TARGET_FILE:generate_argument_manpage>
> |
> |   No target "generate_argument_manpage"
> |
> |
> | CMake Error at client/common/man/CMakeLists.txt:23 (add_custom_command):
> |   Error evaluating generator expression:
> |
> |     $<TARGET_FILE:generate_argument_manpage>
> |
> |   No target "generate_argument_manpage"
> |
> |
> | CMake Error at client/common/man/CMakeLists.txt:27 (add_custom_target):
> |   Error evaluating generator expression:
> |
> |     $<TARGET_FILE:generate_argument_manpage>
> |
> |   No target "generate_argument_manpage"
> |
> |
> | CMake Error at client/common/man/CMakeLists.txt:23 (add_custom_command):
> |   Error evaluating generator expression:
> |
> |     $<TARGET_FILE:generate_argument_manpage>
> |
> |   No target "generate_argument_manpage"
> |
> |
> | CMake Error at client/common/man/CMakeLists.txt:27 (add_custom_target):
> |   Error evaluating generator expression:
> |
> |     $<TARGET_FILE:generate_argument_manpage>
> |
> |   No target "generate_argument_manpage"
> |
> |
> | CMake Error at client/common/man/CMakeLists.txt:23 (add_custom_command):
> |   Error evaluating generator expression:
> |
> |     $<TARGET_FILE:generate_argument_manpage>
> |
> |   No target "generate_argument_manpage"
>
>
> Explicitly adding EXTRA_OECMAKE += "-DWITH_MANPAGES=OFF" solves the issue

Huhh, not sure how I managed to mess this up. Thanks a lot for testing!
v2 sent

