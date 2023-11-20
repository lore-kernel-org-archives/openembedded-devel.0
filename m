Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2624C5B564
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:15 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.43638.1700452267230246839
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cwEzL7uq;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a86b6391e9so44442107b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452266; x=1701057066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQgkmVOx0onLe9Y6wkzVfxs00hOjqasPLLYqqyY2FXQ=;
        b=cwEzL7uqdBWfqF9gBIZopumMgWB2JcOlHkfPzwEnB8NLE58zeIVP0+OOUXa80JEH/j
         jAH4cHLViJIc0ellug4VapLx24e5vHlglL6E7lR3CZonIgk2Ts67GGL3z54YS5tBXkOx
         cfVTXuRuDSPOLhoUjOTlMG+Y56kmpdlfZ6iVc/fRrPcUG7enabHyBqVE/9Vq3lXUaEly
         wToBGBaTiz8D7tw/al1kX8LgCvji9KDFT4Rgcwjm/HOHnVGjJp/TvNkLGN7pHp7/7eFn
         wR4SCvHAKUWF2OHm5c2IfVol6k5ai65iuT6hLVVKMxdvAaIJ8fEBF2/hPBthu0f+8ttW
         Eoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452266; x=1701057066;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQgkmVOx0onLe9Y6wkzVfxs00hOjqasPLLYqqyY2FXQ=;
        b=rtbgy4isxiz5a8a6vvP9tAmO19AX20tHa0SoygqLvfqsxXhbeu/fcsuJIoa02yyGiv
         mjh0ZiYD4Irb2IaT1xz0PZ8dNdzCxw/IfnczLtTNyG/vlBbxP3pxdJCPkUBo2mo+51PI
         QVH7i5/H6lwtJmxOcmUPZr3bb6/kgDvh8VcfPE82IPHeWR79tBwyM2Sbx0KT0wTy2DIC
         1pihOeq1kjXwB6u1IpHUgryvIxcOBevYaoAFJYEubWPrLTVLzrzhkZQsjVcb0VK1NSD/
         yKDkUH3ksVmW5uAyRSzI/0qaBZlPDgREX9mUUbtF88IGQ6ai8G2JomGoMiViCBC+N94x
         DZlw==
X-Gm-Message-State: AOJu0YwDlHjDSD/POO3AgwA1elr2zxkmf02O55HM8qYH9QeLFH2GHR6S
	/uPsriCAfhe7QvUv2xefET0=
X-Google-Smtp-Source: AGHT+IHKSPqPcbKK+QwF78B4eKGu1xC4gl2Rv7Nh5F8AG9PwmPUECT60grFTIK9Nk4RF3ZpZll0xnA==
X-Received: by 2002:a81:4f02:0:b0:5be:7046:b2fa with SMTP id d2-20020a814f02000000b005be7046b2famr7029314ywb.12.1700452266026;
        Sun, 19 Nov 2023 19:51:06 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700123524-22496-1-git-send-email-wangmy@fujitsu.com>
References: <1700123524-22496-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.34.0
 -> 1.35.0
Message-Id: <170045226496.1416826.5000867431740886399.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:04 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106922


On Thu, 16 Nov 2023 16:32:04 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Updated gRPC integration: Asyncio interceptors and easier setup
> -Python 3.12: Replace deprecated datetime functions
> -Metrics: Unify datetime format
> -Celery: Set correct data in check_ins
> -Celery: Read timezone for Crons monitors from celery_schedule if existing
> -Django: Removing redundant code in Django tests
> -Django: Make reading the request body work in Django ASGI apps.
> -FastAPI: Use wraps on fastapi request call wrapper
> -Fix: Probe for psycopg2 and psycopg3 parameters function.
> -Fix: Remove unnecessary TYPE_CHECKING alias
> 
> [...]

Applied, thanks!

[1/1] python3-sentry-sdk: upgrade 1.34.0 -> 1.35.0
      commit: 88d7d576d7827deb40a814fe27df82721c3d17cc

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


