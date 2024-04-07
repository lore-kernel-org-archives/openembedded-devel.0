Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2101DCD129F
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 15:43:16 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.82165.1712504589839869506
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 08:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U6optQD5;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e74bd85f26so3280436b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 08:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712504589; x=1713109389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbmA6eWSHtR6mQugcG1DyLzr1Kp06BahxU3fENt81SA=;
        b=U6optQD5X9c33mznvHbZubQIHuK4mk28sh9dT4lvgSW2+7n0eDhFdI48NVWZtk+SuU
         aMHNXbcMZTl6mSORxcADRxDfBDpiQxP/bW/mqrJ3/r9g6Pmb5OYsTtDs7GQCABBrk59T
         /sScy1dY8B8lMv7Vk3S4sGScrOxj/n68+LAk1eRwGUCSk5OE7E2HfCHcduWf6vXtdQYw
         ybBkxqSsh0V2OrvQ3s040fPh5BC4r47wxlt6XCoxm2ODsieACWfRMrSOXPwyzLMndWJn
         EdG0ZoElsw5Wkmzs68Hc+QX8GjK5888bo7uWteOPlVNTa7nksU3ByzyBMuzE9LNd4hjv
         Nqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712504589; x=1713109389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbmA6eWSHtR6mQugcG1DyLzr1Kp06BahxU3fENt81SA=;
        b=sQW+ejrkVc+Gjbqmen2TqvH11TmjsEfbufCkGUeJnBT4a6kBx2jdu2rCUsmlddJeTm
         zc+FJyYI6bjosQ8CsQBlaeAxLElyaoLY87dZANzCNmc0xDgaSC/eqWBrx8Vkf8LZbB6H
         cNHPKhNDqt6256aMBoJLNNSlUQSUmym6NDkPY1Kv2hHHRYTCW7SCWu68xpaqsBsxfuIX
         XEx8/iUnuYh/pJlS5c5DdukMMYmpS+Jf5ZhTku1uOFCKf5jsLkjL7IzhEffpo29cUUfx
         jwZfiELLkShIsbv+AjUyjwMwo9lU+lZxmBav18pfBqIgi6cMClDACEyQWNQpmN4dVC/x
         ymnA==
X-Gm-Message-State: AOJu0YyZg3MrujYQU4jzPP/YVNIXhVC/GcjxoWxqKjRlSEFG9QVSiph4
	2a0oUJ8UeDhBVbWGGoJFMmc2R38Q2bNEV2n9ZHOLygLcZLHNWTl4XPz4E63b
X-Google-Smtp-Source: AGHT+IHITPOEgJVIl76tEGmXGEMhaL6bMalbVwviNx/aAOlDC9SfY9AeTquGfpm+uqH+JjoifsmsBQ==
X-Received: by 2002:a05:6a00:9288:b0:6ea:ad01:358e with SMTP id jw8-20020a056a00928800b006eaad01358emr8292700pfb.0.1712504589019;
        Sun, 07 Apr 2024 08:43:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8384])
        by smtp.gmail.com with ESMTPSA id a23-20020a62e217000000b006e71aec34a8sm4760473pfi.167.2024.04.07.08.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 08:43:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Beniamin Sandu <beniaminsandu@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-networking][PATCH] unbound: upgrade 1.19.1 -> 1.19.3
Date: Sun,  7 Apr 2024 08:42:55 -0700
Message-ID: <171250415788.900727.18118285414238536334.b4-ty@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405150646.51942-1-beniaminsandu@gmail.com>
References: <20240405150646.51942-1-beniaminsandu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 15:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109846


On Fri, 05 Apr 2024 16:06:46 +0100, Beniamin Sandu wrote:
> Includes security fixes for:
> CVE-2024-1931 - Loop with Unreachable Exit Condition ('Infinite Loop')
> 
> Full release notes:
> https://github.com/NLnetLabs/unbound/releases/tag/release-1.19.3
> 
> 
> [...]

Applied, thanks!

[1/1] unbound: upgrade 1.19.1 -> 1.19.3
      commit: c581a72619dde503344173ed8e807d712c674be1

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>

