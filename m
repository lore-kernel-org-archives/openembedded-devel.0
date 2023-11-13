Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A97C07545
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:33:51 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.3214.1699900427496965312
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RUMDVYsc;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6b2018a11efso4927555b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900427; x=1700505227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LllE7lCPGgUIszx/VQ3UTmhFX+7ZfdwDfMNQTZsGZSw=;
        b=RUMDVYsc8XAxnsNddR4dDpEBTI44j4h2CSE3HzRUvBpPJxJ6eSW/36RYruUjjosM4p
         RQbArZ7ySMTH//TuY4XTfRJQ5iBvM331pcf44P23aOOhG4oHOxQCRinunLSNAf8TOiDj
         oiJq9T6H2eaPscWL1y/BIil+d0Y5XWmVsqQXNF/XaBcpgH6t2DoFn8ES8DZRLFV2YfyN
         a2IwvdptRZo0U/ACXwU69agtenxed4cCz9YyMVAmhWE+apCB6X0h03rkJ/76+KaUpgJQ
         GMjsBQpaaYKF9vi5WznvZX0FvVlU18HEXWzIfsm2DZok/t7jwwX2+lcLhxuTkvNJ1wOv
         2qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900427; x=1700505227;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LllE7lCPGgUIszx/VQ3UTmhFX+7ZfdwDfMNQTZsGZSw=;
        b=mRB3N6WiXt30pM+TJyUG8lWuOxpjcdSIHc+cuF0ZPesN46pnYuUcasvN3JzERCXiFh
         SBACuFeN7wGsSLsxxCAAYY8Ct2mC1uv7qFrUhc7zbELSws5RjO2H4EVo2b5lblyWRCZN
         yRD+yg8ox3aYJrbu9dMiBlxcQcbAE+I6V+Jxp6tXGkvR3Lz2/oXo46ywCIRQU6DQmrOe
         Rz0BeCr6rb9w3DA4wlbRHBcbPQgFwgQlbybPi8oOsYmdMEaXyJVEmjOgZUboprkXS0Ur
         eFD3fXpBxE5ICvXxrHv7pisvGFbQXxH5hwwxGUfX5YhT58h2pHGk9NAUGv50IIhCZY00
         IxBg==
X-Gm-Message-State: AOJu0Yyuotk1HcdpT7FPr4cRByEbKmXvjQ8Koe6uYjEf/pCYjq7F4a2l
	wCuuedJYhGsx5M1Q1JOl3JT8/d08wYspXg==
X-Google-Smtp-Source: AGHT+IExfpKQKLAML2EopcPNhqKRV6/h5T68bOh+MQs3yZfJ1ZjqtB1E/ChFi2jw2pPp5TLP3RylyQ==
X-Received: by 2002:a05:6a00:1492:b0:68f:b5cb:ced0 with SMTP id v18-20020a056a00149200b0068fb5cbced0mr9651051pfu.34.1699900426697;
        Mon, 13 Nov 2023 10:33:46 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231112005941.3689515-1-f_l_k@t-online.de>
References: <20231112005941.3689515-1-f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCH] cups-filters: Upgrade 1.28.17 -> 2.0.0
Message-Id: <169990042605.4418.17328445695395731594.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:46 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106651


On Sun, 12 Nov 2023 01:59:41 +0100, Markus Volk wrote:
> - `universal`: Enable `application/vnd.cups-postscript` as input
>   There are filters which produce this MIME type (such as `hpps` of
>   HPLIP), and if someone uses such driver on a client and the server
>   has an IPP Everywhere/driverless printer, the job fails (Pull
>   request #534).
> 
> - beh backend: Use `execv()` instead of `system()` - CVE-2023-24805
>   With `execv()` command line arguments are passed as separate strings
>   and not the full command line in a single string. This prevents
>   arbitrary command execution by escaping the quoting of the arguments
>   in a job with forged job title.
> 
> [...]

Applied, thanks!

[1/1] cups-filters: Upgrade 1.28.17 -> 2.0.0
      commit: 71e6fa9b086cdd8c0c30afbda48c2f40add8cded

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


