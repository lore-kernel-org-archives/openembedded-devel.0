Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E1CC46CD7
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.6771.1702967265275485538
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LOBXafXA;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d3b5f9860bso8582555ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967265; x=1703572065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4itLiD+0OW6UxPCSSOwX0cck8m5LWA4AR0Y5g2CgsaU=;
        b=LOBXafXAKaruspTR6DZyz6zbyq2un8x+qYSxQpQvRzZDGWFXC/JCH1P6HpflCgH99s
         FbuyBcxN61979JohEfcuTafWW2WyfTpmLcMtAjbCGlj2Y4RgkM3odnIrRDl10WcOYYNw
         XFjekFHEugXTkak6suiAUPNphTykeeSvv+iri/XlYVsAV0CJa6w1wCiGs748HtThRGH1
         Sevx5YkXvPGu8zXJMsfgOKGxXhBC70pN5DZxib7M72Ko489NrVxJ3BBfq4qjYOeDS0/5
         IAE4aoxeL+WTnMSItYXPTnFO64i2QarqqL/nzrih6OpPXFh5vKPaCmVCafIZGIosKKAO
         Z8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967265; x=1703572065;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4itLiD+0OW6UxPCSSOwX0cck8m5LWA4AR0Y5g2CgsaU=;
        b=GEtZC8Hycn9y3IrT9jWeydeO64fs0HIbgk+EeTews0wbNUm0Szqx/RwZyjU8pnZnYe
         Sk0eOWGi24cdKcSxC5iWKwuT9xfStyHKwlhgVLjMKcCO9AmYWOf3m5tFMpuU7HMFZQ75
         Vxi+wq1KOUpml3QkGMq7M6MrTWfkf2snOHEN0fngNeXn9c2cID0PdrYadXArUguh2O44
         iBPxvU9eAozvd+uEofMrmRylvTKaHiAW4sezSm0lZJXbOr401RHutjC8uHR/k8MNePc/
         6zknOBVfBkUlagGaqd2U/TIoqNNtN68mqZTzehBDzMiEQfoCdjZvZTHxJV9y8zV4DJyE
         mO7g==
X-Gm-Message-State: AOJu0YwyvcDLHC+DkmjgSvDjcxMJdkX0z8D+4TPdKqe3XsLTsOdSjEPA
	5WzA8vQAuRetzK1AH7YkUJw=
X-Google-Smtp-Source: AGHT+IG1N5YiwCo9DTGts4fPgXIZJ+NSftNpgkwl4/umJJ/aKZOaPIKFD8RI670nFOY4gwP2Bxwr8Q==
X-Received: by 2002:a17:902:8bc8:b0:1d0:a0f2:afac with SMTP id r8-20020a1709028bc800b001d0a0f2afacmr8015250plo.131.1702967264669;
        Mon, 18 Dec 2023 22:27:44 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702599981-1808-1-git-send-email-wangmy@fujitsu.com>
References: <1702599981-1808-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-virtualenv: upgrade 20.24.7
 -> 20.25.0
Message-Id: <170296726415.1627685.9897290395593183393.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:44 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107604


On Fri, 15 Dec 2023 08:26:21 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -release 20.24.6
> -Allow platformdirs v4
> -Bump wheels package
> -Bump setuptools and wheels
> -Run CI tests on Python 3.13, fix tests
> 
> [...]

Applied, thanks!

[1/1] python3-virtualenv: upgrade 20.24.7 -> 20.25.0
      commit: f145529e61b473ea95916c73a3443d9bccd03367

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


