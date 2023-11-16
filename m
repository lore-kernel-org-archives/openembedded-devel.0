Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06469C54E76
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:51:31 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.19072.1700171483188565068
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:51:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SfO2NijF;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-280351c32afso1029309a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700171482; x=1700776282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raBfgGJv1SXwMvZ/fUtntkACAnaeP6EN/wB5Uu1XGV4=;
        b=SfO2NijFZdH7JJSHBDif3OGtMkoPUxme6eab7O2duxaohcfQQ3RYWbgxaz7ATNxaGG
         5vKwSB/bbG2WDIb91JP3djPwApTAKl69YhoBFBmjR+174TpzFreEWeUHaqYU74Z8jKWq
         rwCgpuZC/zKDp1zz56E3cmxm2C/TjU837QgMQJKM2Hjk0e4eowOOQtGW3jyc2viCVge6
         6XzEdwmK3JTgOhmQxnDx/sRRutmyknMsTUAyx799ONjibDt6OwDsFops3ntOjkjkNuqT
         DFuR5cyobAbrxU06VRiDsfwgwhgN7k/g9T4pYye4qPW2W3ANdq7xVaj/ZRNLMWKsxpev
         RaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700171482; x=1700776282;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=raBfgGJv1SXwMvZ/fUtntkACAnaeP6EN/wB5Uu1XGV4=;
        b=os68nqDsFHlMNdY+Ao96/XgtAl0dea4rLfCKyBxwrp3mCmiC1/w1zkZW896lMMKuga
         kqLt7ZFG8GQoHqrgbYxjXe6WUEgYqcPSUIyaushLZpqj2M10R8zsps9+HVCcGoB2MKGo
         MLBx8NaI000QLBln0LRP/h3QJuoGSEN8Aa8dg+rEcNYD06VCfDTVDm8mbdOaL5wcRVcE
         rlp+lFuGHIgpPQvhqT5XJfXkXNh6btRZvtxKKQ7RL3cV1mlhxeYUrShKlQx2+lyJLHCn
         0/uiTLiGq5EfCl3QMi4FFZSA+4Zj8p3rmUTWJcOOVLmjhexOvhY4ar8sPwEOb23Kmegm
         K4gg==
X-Gm-Message-State: AOJu0Ywg+G6iHzuo3jTy8ElJoKQL4GA7PIb2CH6h4RBOrA3kx4MHcN2b
	pjoHj52eu5/xlc+2NvlxnGlzNkA/YBi/vg==
X-Google-Smtp-Source: AGHT+IH8mFwHfk5itaUPgNicF+M/nBEzVCUlkj2ZXO2E4qRK0Pn73AxWoVGQdxg7IuCC7fUaz2Lb1Q==
X-Received: by 2002:a17:90a:4a0c:b0:27c:fe72:6e9 with SMTP id e12-20020a17090a4a0c00b0027cfe7206e9mr18058662pjh.27.1700171482586;
        Thu, 16 Nov 2023 13:51:22 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id o17-20020a17090ab89100b00280469602bcsm1997692pjr.2.2023.11.16.13.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:51:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Yoann Congal <yoann.congal@smile.fr>
In-Reply-To: <20231115143519.643477-1-yoann.congal@smile.fr>
References: <20231115143519.643477-1-yoann.congal@smile.fr>
Subject: Re: [meta-multimedia][PATCH] juce/projucer: Backport a fix for the
 compilation under recent GCC
Message-Id: <170017148165.249256.9406904882455727940.b4-ty@gmail.com>
Date: Thu, 16 Nov 2023 13:51:21 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106835


On Wed, 15 Nov 2023 15:35:19 +0100, Yoann Congal wrote:
> This backport fixes this error:
>   note: 'std::exchange' is defined in header '<utility>'; did you forget to '#include <utility>'?
> 
> Note: The fix is on version >= 7.0.0
> 
> 

Applied, thanks!

[1/1] juce/projucer: Backport a fix for the compilation under recent GCC
      commit: 7fb028ebf0349b3ada78432edfb9a022cd78dd31

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


