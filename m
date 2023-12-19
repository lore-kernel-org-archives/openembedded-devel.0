Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530B1C4706C
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:36 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.6765.1702967252449670353
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IZRNB29D;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d3e416f303so136395ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967252; x=1703572052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eF8cZc8WssVk99pjSkFLcPTZezbDqg6VlKwep+J8y+Y=;
        b=IZRNB29D2pZA78fQ/K9UVhjnLVHAULqMTm/iNM592weIWFRVzG1cbFq2/HBJeIbVt4
         vOgtDlbcxv3LMhxc7Sh0OgdWmsL9Uu5tcr0YMeL9rQTkC58hRE/ZRqxG/3xJYxyd3uxX
         7t26voByaOhueaJU8ggfi7yrOOtpojCWxm5sRn8OZIH751Jkj3IzNxPCtuZPwCEvLYJ6
         9w2erv0Hz2Mtqk+jQ0tA2omQn+nORGlUjDb+BY7rQgaw+oUhi5EiyLMM89RZe8ASr6U+
         HS6NIu5Wbc/BCoc4gmZ56UkvRn++tmaDP9gsqp0UoXXbAJ32jlsfJHT+EGYVl93k8lBU
         ep7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967252; x=1703572052;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eF8cZc8WssVk99pjSkFLcPTZezbDqg6VlKwep+J8y+Y=;
        b=mnp7FLZnKkFWVQUMsxXeUdosDAgQ95ujIyNPaF5qAN95l86NF9A3/ZS/gsGtS4/vxA
         RlOBlK5GcT9X7UW8nRh73eNq2aG8Fr8VVvzrpr2ZtYjGUZcIAtuObf+75ReikS8hpsAI
         KSf42BT48tElBZt+calYKYnD2kiIHENfYrQ3MrIcHRlk111TZjO8usbSXiJk6t2pyacc
         /xM6mfKMWJsNNVr0o/rXxujTh1L3MrGHBgjWdEB3wm/+csFeo76posTPbP93elZAhvHU
         bF5WIT/4D08zONVLt9AxWtsXPnFWuf7K806jCCg4MDa1wkUe9RRAlJ1F8i0bkR4pRbJw
         ntnA==
X-Gm-Message-State: AOJu0Yy+FocCqnI7e8sZ7VwZIaqn8TQ+ZWpDrsTy/m6kK/YZhiPOZYVv
	uZZC7+9NNLJIaCBApBQDLB4=
X-Google-Smtp-Source: AGHT+IGc6eTGE9VqJpxrbfBkGpU+7O1MCkdtX06sgRSGVmEmg4bEUIuaKDvESsFWgVn7DCAuTPtsjA==
X-Received: by 2002:a17:903:190:b0:1d3:c8ff:4f63 with SMTP id z16-20020a170903019000b001d3c8ff4f63mr1358048plg.121.1702967251853;
        Mon, 18 Dec 2023 22:27:31 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702544736-28467-1-git-send-email-wangmy@fujitsu.com>
References: <1702544736-28467-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.37.1
 -> 1.39.0
Message-Id: <170296725122.1627685.6757637112891936089.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:31 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107591


On Thu, 14 Dec 2023 17:05:36 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Add support for cluster clients from Redis SDK
> -Improve location reporting for timer metrics
> -Fix Celery TypeError with no-argument apply_async
> -Fix Lambda integration with EventBridge source
> -Add max tries to Spotlight
> -Handle os.path.devnull access issues
> -Change code.filepath frame picking logic
> -Trigger AWS Lambda tests on label
> -Run permissions step on pull_request_target but not push
> -Hash AWS Lambda test functions based on current revision
> -Update Django version in tests
> -Make metrics tests non-flaky
> -Various fixes & improvements
> -Only add trace context to checkins and do not run event_processors for checkins
> -Metric span summaries
> -Add source context to code locations
> -Use in-app filepath instead of absolute path
> -Switch to jinja2 for generating CI yamls
> 
> [...]

Applied, thanks!

[1/1] python3-sentry-sdk: upgrade 1.37.1 -> 1.39.0
      commit: 6c98ed4d1af68cf0a6e236e5cb6e5a0d798f874c

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


