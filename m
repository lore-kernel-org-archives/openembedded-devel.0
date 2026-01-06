Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3964ACDC170
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 11:59:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88370.1767700777143424604
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 03:59:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UwBzQKxe;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso7780325e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 03:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767700775; x=1768305575; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=un44gaEnu/8o4TtC886t5fW9vVPj/S8VY15J3+swEcY=;
        b=UwBzQKxeTVEkP02jqKnbs6Uo5jPImqW1eFP+ba0W8jpgMcgAvUUnE7uvg6+255PaBl
         wpLCMz/Vav2bd1SCkttnxsOMcUSv8ezz0xe2ZgNVbz+AetexIPpGsT643j3Qa4sLvKWR
         yCikKm/mZfeMkZT6PNkVaGr/HYg0cQfA6ag6UkQLKqgOmnhPrrgDZ+C1JHJ6iDEA0Bg9
         TUD2FT5O7FjBhnNAA84ZgenotGEhTHnjzzXJWKYe3mhb0V2DrCb2/ZCIfOKUFO0rX59X
         nd1ZIBFR8TJZhrD26ZVCCwmA48xxWdl6Qoh620u3RnSqAIE3DsqW7QfpLYLlzNNApXxl
         OOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767700775; x=1768305575;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=un44gaEnu/8o4TtC886t5fW9vVPj/S8VY15J3+swEcY=;
        b=PH1X+/gHMYRDYuZlsxXF1V0WIPgzH9QyTZ0eMUOiEOwykrlY8wnuQUJSZ8VsMQzywK
         T2a9WfGfkyKmAL+je8rkOAhyYXlrS0rckcFF7j6XkMcx/n/3AiDqMSGCt2Uicp7xP5j/
         zhB8wBOUds5RVpfMkz66f9FoTJE9Rifq+TrDzfRjxhn7cpeGOzJ3+b4BwEN3JP1AkthY
         mijGgg/F7wE3xmKTgqucFyMW3jQJmqK33gHPKUM6r+UiHCml9VYmn2h7qZyzsgF0njR1
         hp3mQZ1ybRdjAQHWmwZEFSo+sYO0h4P9WkIwcGGp359gWx2sRs7pTZwgQRVDKOssWs0u
         44Cg==
X-Gm-Message-State: AOJu0YzOT5C4FSg194u4E/4ixsJPTQTVt4qObz1y7KvFkLmNJLi3gXlE
	dlkedCbIGOwXWPc7G8WoX0jJSvRpR81Fvm70J+/ZkwgVpJArGzA9nKxb/GG9mQ==
X-Gm-Gg: AY/fxX4/xE3Ce3Hup68b7oyO0oZno/DuyiH9F1dzrbO1IoBk7R8xAPYjU0WTHM5rULo
	3cqRa0jKI945Feu9LeyE61GJ8KpsYa+eWpy8qRNytSKfEwTAfzjlGToepTwDhEPXOMnKyn+e7pH
	B9QgpCfgeZDIxvzYsZqqcGX0bqwsMtiaZClhuAeKyI625JcJcBOgwCIxmuHdgmDThD3P3CbUlM+
	2v+ec2hfoxGUEIiC8N2VQ+akjKYGwiXTWWO0lActXmvd/7bzJLNNvtq5MzV1Ihs9evQEbDMVWd0
	hhI7H1tm6u0tKWX0xamoq6s9OPOXyKkSAI6TnMWkMKz5dokDp3hKpCG8UvKkJYVyu0kYpC0oHpU
	CiJSycA/X18GgfCiICL4E6ECerNLKIPM7GdhpNviWGCMos84hOI/p1aWGqUQu5U01FPCR1eBmKb
	LFnDVrEynLu1jqIWWoZhw=
X-Google-Smtp-Source: AGHT+IF67XT3LGSx4AilBOC/kOXP2orPXy+q1zkZn4ksW3orZTnk2m2p1n7Le76wXZMiZW+sUCm8FA==
X-Received: by 2002:a05:600c:848d:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-47d7f06eddemr34293955e9.12.1767700775247;
        Tue, 06 Jan 2026 03:59:35 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f65d9f0sm39908365e9.12.2026.01.06.03.59.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 03:59:34 -0800 (PST)
Message-ID: <f6042124-832a-4beb-b377-7ff9888b4a27@gmail.com>
Date: Tue, 6 Jan 2026 12:59:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: Call for Kirkstone patches for next release
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 11:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123179

Hello,

The next PR for meta-oe Kirkstone branch is planned early next week.
Patches that arrive until the end of Saturday (10/Jan, any timezone)
will be considered for inclusion. Patches that arrive after this time
will be part of the next merge cycle.

You can find the currently queued patches here:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/kirkstone-nut

Thank you,
Gyorgy

