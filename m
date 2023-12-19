Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A84BC4706D
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:36 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.6823.1702967251711859866
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SxPGct/J;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d045097b4cso15985965ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967251; x=1703572051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xq+7itL6/IHVt+v8l6Rhxy+I8B4cUYCGamJGsTO/WVA=;
        b=SxPGct/JsUzsUvZgTJNfylTJ7v1mPjPStu7VB8SWrvnfSXa7Fi/F4fh639rd030ANk
         Lnft9aftj4US8KdJt708B8LDeSajq8WHdqcNLz9dgCmdlibUN9NmzGhaoVVCfDEgOGRE
         ehBjAYDv8bgkE5oRXCRRiSQLT7PBaNuxA45pviCOJ7DkKZ58qlvgjJ+TsjOX10WABQDQ
         I/DFXpccv/ES+OjHoY5KPysjE6+NOEGx/KPeV8p6tVeZH62+tLinqXynVKOrD5DP8oW9
         EO6xKJ/8xSKRtLbxyCiA7Jeu1yIRXZvV01oHACi/5SgVxcV4lrENLm56IYYxewznXvLm
         9tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967251; x=1703572051;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xq+7itL6/IHVt+v8l6Rhxy+I8B4cUYCGamJGsTO/WVA=;
        b=Vt55rhF7aEwfK12UQzuPUU55kXZracIShmuFyA4UOXQZViyLvkOSFUsllEAK5HipVZ
         JHFyeWbsNkpk5dYwbRpaUIwrENX7AHx8ih1I+T1v/Zr8q7GqGEQQrbylaFh8zo2Ayt/u
         wIIYsNGGaGK1cXPXkbXFO86aaxiInpiaoWko9c90G2aGjMdpip5/0c/uCpQaH5Y65ied
         7lWIiVqMoDCJ/31D2huBk0FjuY+rSeimhR4hl4CbAaHyBBcInRNSiCPsJCNy6Hd+XhP8
         NexWDPVnGvNB7NOF9Wm+9HJkgXu1xY7lmsBdkZbox1bMCR2AUWmTH38srvUXevQ8sF9B
         u+6Q==
X-Gm-Message-State: AOJu0YxKMR+zXhC9KP2LFAo69vkMysJ2VaC8oSGrlzwVV9Jp7SuQ54Uo
	UI16B+hthjm8iKc6ckl+xJLaJar+mUg=
X-Google-Smtp-Source: AGHT+IGJextrpSC6/TToJcFFw9MHi8zbQcEfRq/7XoI+gVQC+TJ2kBqjHtDNbTF7UfTbZwCtPyDxXw==
X-Received: by 2002:a17:902:b287:b0:1d3:91e0:1330 with SMTP id u7-20020a170902b28700b001d391e01330mr2441966plr.35.1702967251069;
        Mon, 18 Dec 2023 22:27:31 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702544659-28375-1-git-send-email-wangmy@fujitsu.com>
References: <1702544659-28375-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pytest-asyncio: upgrade
 0.22.0 -> 0.23.2
Message-Id: <170296725033.1627685.15122666007432594995.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:30 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107590


On Thu, 14 Dec 2023 17:04:19 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
> -Fixes a bug that caused an internal pytest error when collecting .txt files
> -Fixes a bug that caused an internal pytest error when using module-level skips
> -This release is backwards-compatible with v0.21. Changes are non-breaking,
>  unless you upgrade from v0.22.
> -BREAKING: The asyncio_event_loop mark has been removed. Event loops with class,
>  module, package, and session scopes can be requested via the scope keyword
>  argument to the _asyncio_ mark.
> -Introduces the event_loop_policy fixture which allows testing with non-default
>  or multiple event loops
> -Introduces pytest_asyncio.is_async_test which returns whether a test item is
>  managed by pytest-asyncio
> -Removes and pytest-trio, mypy, and flaky from the test dependencies
> 
> [...]

Applied, thanks!

[1/1] python3-pytest-asyncio: upgrade 0.22.0 -> 0.23.2
      commit: 616fb9ccb7c69992a3bbe6cb29d1ffd6ae524d77

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


