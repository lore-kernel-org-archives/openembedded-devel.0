Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291D2C54E76
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:52:21 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.19090.1700171535725889531
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:52:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W+stL60w;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-28039ee1587so1025262a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700171535; x=1700776335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXL4c7Y7qyOuK1jDRALcWwDCkLgbHtOOlLwb/IbTatc=;
        b=W+stL60wti81EjljyWehiDHlIAjmpqFCw7LrSYnrM3kltPHYXFxY/Z4NWu/i0iej7R
         umpmecmb067axYNWRQvEGRz6ncDIMYM1/3sSALTqvXIbfYfHLGjX2j81UL4APT8CqoO2
         bACFBKE7BxkL48AmEbJF11K2r4rB2fo32pnBYTRNuZ58LJNSyKoFamrKDUxEqYW1hh7l
         Y//zT2i+nY+dc4Wr/yevtDafmo3zKzGs1HtmN/hIaCu+bo9HIEWojbZJ6Ww1FwbrPAyw
         Uwo/R2ZJUUnCBVQACpZR2M7WTODGV0fLvyQPTXYW4yBw8QNlDfr23nZMcLpXiVF8g1Mq
         h5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700171535; x=1700776335;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXL4c7Y7qyOuK1jDRALcWwDCkLgbHtOOlLwb/IbTatc=;
        b=UNG+1ufPJ0vPucgjwze1G8C0TF1BwtzSt6Bhw2UNvifMXFp9JaYg+OONdC62euke/n
         3pi4EWBtU2YQVlz9MlAreZBeuC30ZADiYhINonoHEN6i0NZ6y16s52DlL/Ai9uwAwERF
         pCG3sRBxj5CB2/5DC5+WpIEAiNIBZh4IjMXHX46dlRh9mNLvA9aBxLWOU75UjGGorFaX
         bDVi5EkdsiT5COdL6vlLJwXgdckbxfg0F3IjoJK+KxYSDVXs+kfY3yk4ZEV2LLY6gPjE
         4DIejYOQNolM+i8W8cOKBqf9K0Jp2jUFie6hCk1ViYWRQkMUqgZqst7m4pOnfRbh5RTF
         25RA==
X-Gm-Message-State: AOJu0YzOPG9OvAfEjKHgmtFxsRZKDasVH3FRa/g5O51lo5ZCSRg+ndM9
	NnnjSmL9EqXfQ2veZ3S5S8sqLIE77wVWTA==
X-Google-Smtp-Source: AGHT+IHqx27cMXY0eD0qoPdEnMBliS2oyQ07a/yprZAQ9RPJhc4p5PxlRrAQpWDZhrVDmf2RXv+Wvg==
X-Received: by 2002:a17:90b:1c02:b0:27d:4282:e3d2 with SMTP id oc2-20020a17090b1c0200b0027d4282e3d2mr16446962pjb.30.1700171534986;
        Thu, 16 Nov 2023 13:52:14 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id ck22-20020a17090afe1600b00279060a0fccsm181763pjb.9.2023.11.16.13.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:52:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, 
 Phil Howard <phil@gadgetoid.com>, Martin Jansa <martin.jansa@gmail.com>, 
 openembedded-devel@lists.openembedded.org, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20231115164704.2932248-1-brgl@bgdev.pl>
References: <20231115164704.2932248-1-brgl@bgdev.pl>
Subject: Re: [meta-python][PATCH] python3-gpiod: setup target config in
 ptest compile
Message-Id: <170017153423.250978.1951785059969153770.b4-ty@gmail.com>
Date: Thu, 16 Nov 2023 13:52:14 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106838


On Wed, 15 Nov 2023 17:47:04 +0100, Bartosz Golaszewski wrote:
> The python3targetconfig class does not setup the build config for target
> in do_ptest_compile_base so we need to do this manually. While at it: use
> the provided nativepython3 command instead of using the full path.
> 
> 

Applied, thanks!

[1/1] python3-gpiod: setup target config in ptest compile
      commit: 936ae8ef2e7943a8bc9fba33ef099901e59a028f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


