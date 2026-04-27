Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21B4FF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 11:42:32 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42919.1777290149177469749
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2026 04:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dDTxQaru;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4890098abbaso79992875e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 04:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777290147; x=1777894947; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5qqj7dTgP5ntULlsv9hACrVrL/BNg0o1SLXwblLZSiM=;
        b=dDTxQaruylqNEFwsQe804wZlpOexZdZLdABkcMt537AYEiyiOPSugq0u3xugXw9R0m
         nlBkQFnA5I0dO8gFgzJE6xLo313Sk90817ikKg5ZrKgLa+XrW+GfWZ5KoOKuCsMv1QNN
         ZDgOdgdy5vo+ZbM9sGcaQ7aM35LhK3QXsRubYKapr/tVt6ZQcpIoHvygWgwnNhXNI72S
         QtfFVCaYbapjrELUDMJYVDoVtmncl6iLMq8UDdSZPt34SncmPR04KwxI4hWPTnzlLv/i
         GUbpcmRph8xi38pZYobsXCFGo5fpX/atgv7FAV7TzBlLhLIx6mt+iHLQ3LL2I3BH6t9G
         xcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290147; x=1777894947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qqj7dTgP5ntULlsv9hACrVrL/BNg0o1SLXwblLZSiM=;
        b=gPf5g61G0o/JDNRSjAi0gdbRqiK/YffyGsW50SzKqMHsc0PuPEgZJ/Ewc1KQfFaZqI
         EH8pohMn+0Dne9hafgxavdMSmDfbHJVLFBj6NJBKmJe/04qssuaCIIs5nW3scmzBxNtO
         N6wDu6t6IhhtlHXsaLkqB/Wzv86oFxv3AoeDWlr536QbvDKQrlRXWWwBnm1Y9qoQoY0v
         ElGj9H7pGwQk0RBg+KS7w0uonEDsVTgZf5KzuRqNy7grfpSXIIx9eFogHRQxn9u9EEpA
         n/kOL//iFYM5yCJjMcKQBrjHsusEFeoAHBbvBXmYMbV5kQ5KfkAf0ZVscO1VeuFqcq3g
         KKbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8P4tL48ThGEcZVKXNZFl9ALKqreVdJGwos5/wpTtZ9rgH6qWLzKX0kJ4D5uoOrdHddnJt9sbSIS3ipQX9dhX+CFA0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyH9aThbGQ+sKUsVIRkD5jibQrkMJDyYFRDtb3exoq5fRKzZ58E
	ay9koII1Z0NX4JbIulvi79aS+m8QYvQYCjIWM+DqKPkl2XM4kjaj4KfA
X-Gm-Gg: AeBDieuCD2zWEbQDUPy2hwtelpj7n1I8RKdBCLiuEfODTQde/eaLLQwu9crvkH8BKrQ
	2M+KLOa5OZghd3YCGoIAt09XLTW1R71xi2TjbqiYG4YP+1A8vemhvOf00ZtYRh8ADRaZ1IS6Zfe
	PCaD+BpwTyOiZGmWikuP4Vxgmx1UKvxOTmf7ZzFNg1B2qaIInC13FO8OJ1U0lcX74d2CrT2bnRY
	QP733LbsDav/FSUrgBHbgXPb3me62pp03/+RlstBjCqsMoocuQEaKgcwYr/t8IIV1kyafLF5aH/
	zizOzQ8TRi/pyTrCxgzctwTSBfmAk/NACRgK/RXIpOo1LLZu5HpvOarioNl2AA8CR4i0BJ3tr8Y
	9FzMraZLQh33C9PI2xkmQSdK5GOYsxcxyhWsyNzgIsjwPEP7yeN2sM3V4PqEK2//TQpGd8sJsf2
	z4mnvxRFoBx2eIFI1WxDaghb6JXbUSh3Rm/WiNcUGfbA==
X-Received: by 2002:a05:600c:8b04:b0:48a:7605:751e with SMTP id 5b1f17b1804b1-48a76057587mr7680265e9.4.1777290147252;
        Mon, 27 Apr 2026 04:42:27 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm802596075e9.12.2026.04.27.04.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:42:26 -0700 (PDT)
Message-ID: <c883abf1-d9cb-4103-acec-f57e405f8b39@gmail.com>
Date: Mon, 27 Apr 2026 13:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] rocksdb: remove rocksdb_static
 from default PACKAGECONFIG
To: mail2szahir@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260415182040.1193544-1-zahir.basha@partner.bmwgroup.com>
 <2b4203a9-6dd0-48b9-bb67-91c134acc010@gmail.com>
 <1451444.1776366643402500662@lists.openembedded.org>
 <7a1772a1-238f-487c-ae6f-b258261d783a@gmail.com>
 <899824.1776420752741307226@lists.openembedded.org>
 <1095967.1777285219759238549@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1095967.1777285219759238549@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 11:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126639

On 4/27/26 12:20, aszh07 via lists.openembedded.org wrote:
> Hi Gyorgy,
> 
> May i know, what is the staus now for this patch?
> https://lists.openembedded.org/g/openembedded-devel/message/126431
> 
> 

It is queued up for the final PR:
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/kirkstone-nut&id=9dc7ca5feb00e7971a0cf95b90dbc0b75987121b



> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126638): https://lists.openembedded.org/g/openembedded-devel/message/126638
> Mute This Topic: https://lists.openembedded.org/mt/118845876/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


