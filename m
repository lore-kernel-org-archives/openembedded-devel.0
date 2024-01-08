Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551BDC47DA6
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:56 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.31423.1704682007344263036
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cLeWaQVk;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-28b6218d102so1251439a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682007; x=1705286807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoAwITAvZFzIcW19BmrHu4DDRtLny1ZGTWuiL8h++ls=;
        b=cLeWaQVk5CHlLs9tJjZQkOTsQMICuiS9wVqwsp+0zxY9i4z5HwgMyqCnYhqpmlZlxW
         c/gjqSGe87EKmatbCxaQkYPccAW9oHsXW9jYd/QQiVStgmrUp5daFnYBRieU31FGrmKM
         dFhU56oeXU/lS0JJVRFRBl/Nh1YTjJIqpJwXzzXlEzvnjhTOrpLiDa2Hs2P07J/BA+ml
         2UThNy4akE3qaZ7bk0WEcPJyhDa7d1wA8ttxLOQ0XLMKwNmrXzTL5xwoL0gZNTh8OhyI
         KbtwujV7Esm8LCYF7BqWc6uXWVIHcjOAI1GUNvIAIiVXjGniZLA11QfCz2GLpZTisWPA
         N9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682007; x=1705286807;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoAwITAvZFzIcW19BmrHu4DDRtLny1ZGTWuiL8h++ls=;
        b=eab4Oh6z/e6/AnOxy31kL/mUAJgzdy0pyjQLbz97nPUlsasMtOj8cNwZqbzB3gtKB2
         ajALN/atAmeyUb+uBrhzejkKmCQ7o3M/fWfwQzOUeM/oLUbfdXMUsKLPxRql1l9tYdQC
         I9yas/MVAcataxGaCX5n+4JIn+sASmRZhvch5WFLZYF3ZEDDFPOavD1/3Oad/jkVvKms
         kbioEmqf1WyGY42BxAZQ1sYwbnHUoFlWGlBOUZiJgmCpGJZqNB7BBbuHpYoL8POlakni
         j96lbGPrntvmoMkwAj2jfOWAHr+7qN0zepUBcWkv803E5fimPIp0/aePbjCxXBAeh1tM
         DAUA==
X-Gm-Message-State: AOJu0Yy8leFqIrzNCIICO7UqEWezoR/veHFMTP1WVopieWYSUTFXFs3v
	SvEugvLtxWS7oL50vCzmBqz4MHr1VFY=
X-Google-Smtp-Source: AGHT+IFUL1hlRDib2KFM5+HG5a4orFaHfZamPLRpGYghQtPr+t70HXncJMP3Q562L2+KwkaRR5cc4Q==
X-Received: by 2002:a17:903:244c:b0:1d4:7abd:a05d with SMTP id l12-20020a170903244c00b001d47abda05dmr4717450pls.86.1704682006671;
        Sun, 07 Jan 2024 18:46:46 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704176804-7471-1-git-send-email-wangmy@fujitsu.com>
References: <1704176804-7471-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] cglm: upgrade 0.9.1 -> 0.9.2
Message-Id: <170468200604.912276.3034006219507578792.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:46 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108088


On Tue, 02 Jan 2024 14:26:44 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -add aabb2d
> -add euler to quat functionality
> -add new subtraction family of vector functions
> -many others improvements and bugfixes
> 
> [...]

Applied, thanks!

[1/1] cglm: upgrade 0.9.1 -> 0.9.2
      commit: a871d5edc43cfce9357c3011993d9948a512b1c8

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


