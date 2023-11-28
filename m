Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75F1C10DCE
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:38 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.14758.1701215736460522437
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fW0E0mTI;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cfc1512df1so24540195ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215736; x=1701820536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zt2faot6+/YxzRlIQ02OxlikqeYl7RAL8chTbn+mcOA=;
        b=fW0E0mTITxnUS8MZ5+t//yoGIWZTbGbE/AimG+gHS1q1WK24gRkQmoTpUsiGNSEX9y
         Sb9o7XdUNARDCE/ragLlVp+dva72LdKfjUPPmKt/J+P/8035R1QwnzyQzaapCY+Hq6a+
         fTQIx6CSAhCk07eGPk9i3SP2aEdGIVk5w5b0Rl4XHqHG8JDELH5JgsudJtzHFGcwrs0G
         nfjW+3UOi6tuEuPCyUU57QE5PVGu7ACJlnTJgv8TgYvNV/fG1IDHn1foMjzeAQYMM6cY
         8/dG421cVqb5vxaZqkC3gbbe0hVBzjy6yCXXb9HEfVnM7w2TT08Re1pl1SVoeag5Ky8V
         eSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215736; x=1701820536;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zt2faot6+/YxzRlIQ02OxlikqeYl7RAL8chTbn+mcOA=;
        b=GtM1BxDZk0HuL3f9lu3sG5MitOWQ+turZdu8TUYViVQhVDCClIOwXRcfkWaxOvbOcK
         iDfvip4PdkwZdaZGOduOHl47mJhoHCigD7Z+WfQmCbVHzQqVXiU6JpU8f7yr/MmaUzMo
         0NbMIM9icYue1pAtVI/wJsbTxrl9micwX9e9MVYCfz9BgcS9d/35EFU9ckMFGUcoKXNy
         1X1hj6hhwuRc1odIFq6TGT5wkg/603SsZd439uijMCCGAY24iuqZbEzW1A08pXbd8XwZ
         3OomMKfsRIhXxOCKm9o9vMkW5ZNVrKPGPC8kK3Pqpc9wLL8jfbYhI35BnZQ0uvra//P2
         Gbsg==
X-Gm-Message-State: AOJu0Yzrnwmmq7JkgdVkQcMb0gYXMYGYmxKsOS1zFwqlYsJ19sgN9IuW
	Y3nhMzvbk0SJfVCym83JjfQft7BAlv2GrA==
X-Google-Smtp-Source: AGHT+IEzbgaAYPiCn3rSA5ndA36l/VRDKKigNnejmcM/D1LOH+KKa8dwo2UgxuWocQd4m7phE57Cdw==
X-Received: by 2002:a17:902:d4c1:b0:1cf:c329:6204 with SMTP id o1-20020a170902d4c100b001cfc3296204mr10562588plg.14.1701215735579;
        Tue, 28 Nov 2023 15:55:35 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701160971-28544-1-git-send-email-wangmy@fujitsu.com>
References: <1701160971-28544-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.35.0
 -> 1.37.1
Message-Id: <170121573467.1187527.16147103690464391709.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:34 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107121


On Tue, 28 Nov 2023 16:42:51 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Fix NameError on parse_version with eventlet
> -build(deps): bump checkouts/data-schemas from 68def1e to e9f7d58
> -Move installed modules code to utils
> -Note: We moved the internal function _get_installed_modules from
>  sentry_sdk.integrations.modules to sentry_sdk.utils. So if you use this
>  function you have to update your imports
> -Add code locations for metrics
> -Add query source to DB spans
> -Send events to Spotlight sidecar
> -Run integration tests with newest pytest
> -Bring tests up to date
> -Fix: Prevent global var from being discarded at shutdown
> -Fix: Scope transaction source not being updated in scope.span setter
> -Django: Support Django 5.0
> -Django: Handling ASGI body in the right way.
> -Flask: Test with Flask 3.0
> -Celery: Do not create a span when task is triggered by Celery Beat
> -Redis: Ensure RedisIntegration is disabled, unless redis is installed
> -Quart: Fix Quart integration for Quart 0.19.4
> -gRPC: Make async gRPC less noisy
> 
> [...]

Applied, thanks!

[1/1] python3-sentry-sdk: upgrade 1.35.0 -> 1.37.1
      commit: aff494f4c071b7d88525436ace810a866d10c3ea

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


