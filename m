Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5974BC07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:18 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.14506.1701215712472313554
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EBSapQft;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cfb83211b9so30072425ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215711; x=1701820511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXJ8FaVPtZbEy6J0ueSewW6ZUExMaD37rvjtJFgHuuw=;
        b=EBSapQft/N2xlW3/Nj6xlBkaIdwR2CE3bpOhRe+WgZvmxAuNh/3q7xnacfK+5afeTf
         WYL+FlBEBKp287CmBW/PUQ/F/JH8FQkCoctqHIQz8reF4d3HaD6RA6VL9Xoi+SKEnx9O
         1qZ+hDWP2ZSm1En7oROJhTg6Oh4u+of5/HLcfcn3Juw6cyyfdYc3TiWwFT5bZqh9tGg0
         iK7RwVvR/o72k7jEc508pwLWS+owjS6gaDGxYZma9lLk52cIYnIlu3kIGy2taV28KlmD
         CRCUACH7/RARidTWDpIhFE1yrb9Lq2uyE9SdpoSMUc0aHD2C3qTEf97nTSzxZwRXSIms
         4D2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215711; x=1701820511;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXJ8FaVPtZbEy6J0ueSewW6ZUExMaD37rvjtJFgHuuw=;
        b=aWAIO47T7RB79EIKGLY6ul746qzHYLmLZMeQVqm+Gmb2CTxRWL2WbaT+yPgx86xOh9
         c0QbAwYIvtIVDUNCgKPlXXUiOF0QSquoo/58rv6jtDbzwtp2TDpKU9HSudaZllAjzvcv
         52op9R7j9y+pFoEam8wPoHfjOTWJY1rMDRUDWdORJewJwTOJ1ZZw9EHMiex1bfKKp5CW
         PjZCXCnRhTcFGfVf80fXVV6CBtBahVfddg0YUUQu+Ybta/tvyfI359ZnQgklITd3kQpO
         /fYssa3Tx1fNqtOaFkPuE6cn0PaeZ0/KcEJR+lUzqu2POlmwdXXUgC2HCmleD+BGLd3j
         9BAg==
X-Gm-Message-State: AOJu0YyJxaQG0tNhge37TCf2fs7vuduBq0or6sM333m0TrG5XHsNvdak
	uAxJIML/jYgomazr19xG99o24axmP/1W/Q==
X-Google-Smtp-Source: AGHT+IHqBaIwphicSb8rPwoQ59/ZlUR3sq9JtFaqaSG9lD9p35kVk9iCL8UPpoyMcRCDeSuWs1AXkg==
X-Received: by 2002:a17:902:c211:b0:1cf:c9ca:501e with SMTP id 17-20020a170902c21100b001cfc9ca501emr8640212pll.4.1701215711552;
        Tue, 28 Nov 2023 15:55:11 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701159224-27689-1-git-send-email-wangmy@fujitsu.com>
References: <1701159224-27689-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] dnfdragora: upgrade 2.1.4 -> 2.1.5
Message-Id: <170121571033.1187527.4297565538582371778.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:10 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107102


On Tue, 28 Nov 2023 16:13:44 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -Fixed Segfault error when there is no package description.
> -Added Info window after transaction.
> 
> 

Applied, thanks!

[1/1] dnfdragora: upgrade 2.1.4 -> 2.1.5
      commit: 0a1199bebbbfe9b8942a78570ebdde2fed62665d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


