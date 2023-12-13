Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C82C3DA7A
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:30 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.30698.1702451245457368211
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VU/0TRCw;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3ba1be5ad0aso1106291b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451244; x=1703056044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGCSlCOqnWyxPrUrGOmWCgv13hyD1dJ1U1eXOOX9+xY=;
        b=VU/0TRCwQIvAtNGjedjXC3L2ESWkocDIH16oynj4y3XhujB3wf6YitEySdndEldt8E
         UbuHjC2t42qrpUJ9H2T4RupqYQGs72jt9YAekSPDcsufrb5nzlMnZcQUw57KBcXxA1aK
         PbjvYkLJRPMf6Q5r61v2jc0aLpCmJSJBA6dBQ6JcsJqjrs38/73aqNwPOmWVGlgbwQUy
         ZAahRs6bTJg0l6rzUI3TliwkUGDa95VshjG5dfiKBgkHTS3KruisOXPZ6yGVL8uO0VUD
         xNPwF0gQ/H1sO6eKYVelV37gXpjjCkMpzlAqU41YO2FrcAIyjQGaNK70d+4a+31tEJ+E
         lwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451244; x=1703056044;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGCSlCOqnWyxPrUrGOmWCgv13hyD1dJ1U1eXOOX9+xY=;
        b=A3rnxKRZ0pu5J7EiWNQ+FRwr8qTaxYbAxBuzKp4NhmmtjJ0r4cm7IUOtVOX761Sje3
         gZWws1/LEVE/sbgCSBEHXShRZW7D2HKwl0g61xVKQxu4JAIjGrYX8SKk+WWSh40bM53Y
         1/XcZuXkOqSyh1cPb9ywV1aGcwSFucKtgEK3jYW0z2yhKX5q8ET3vEjpz+VSb9BKsNGa
         jBPeWwAWh6hmpienfFkTgNejuknwtDCPPnJpFStsxzvjSSDmIzUG5e4MSdBkAH1n3yvS
         nhxSZleTvP3kW5pDitgbWiXuAmWUecb7w8ZLV1dRGfJxcVfEHNytZv5bQimKLurGP4Po
         asAA==
X-Gm-Message-State: AOJu0Yzv3mSMDcHyxCWs5bPbLKMDdSj0vlWhG9igOzmQmk/IiPGOX65r
	FrkQHcQDWr6iQSIPl6z7Vn2stuKQy7Y=
X-Google-Smtp-Source: AGHT+IFWxCZWikIyF/WCwi8c9dYT/YOpJcB6ybEIgW/0iOEdfxCcOxc2ZX3pfom6csElQuMS0zKbcg==
X-Received: by 2002:a05:6808:2e85:b0:3ba:8d5:4009 with SMTP id gt5-20020a0568082e8500b003ba08d54009mr8265759oib.110.1702451244410;
        Tue, 12 Dec 2023 23:07:24 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <20231206155217.4013715-1-leon.anavi@konsulko.com>
References: <20231206155217.4013715-1-leon.anavi@konsulko.com>
Subject: Re: [meta-oe][PATCH] sip: Upgrade 6.7.12 -> 6.8.0
Message-Id: <170245124365.133993.13191524658280436894.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:23 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107362


On Wed, 06 Dec 2023 17:52:17 +0200, Leon Anavi wrote:
> Add runtime dependencies and upgrade sip to version 6.8.0:
> 
> - Added support for specifying the project metadata using the
>   [project] section of pyproject.toml as defined in PEP 621. The
>   use of the [tool.sip.metadata] is now deprecated.
> - The latest version of ABI v13 is v13.7.0.
> - The latest version of ABI v12 is v12.14.0.
> - The conversion to a pure Python implementation is now complete.
> 
> [...]

Applied, thanks!

[1/1] sip: Upgrade 6.7.12 -> 6.8.0
      commit: 61cd30fc786fe95c47ca59e800224382d3bd763e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


