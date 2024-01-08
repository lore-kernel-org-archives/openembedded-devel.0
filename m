Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1787FC47DA2
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:17 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.31456.1704682035669220962
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lc/KQxJK;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-36074b286d8so10633965ab.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682035; x=1705286835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zjVjh726XCjBJLR5KksmpBynWrFBN2Mp8bNU7qmkmU=;
        b=Lc/KQxJKw5yV2hp7UVbSL9/ZkiZ52OX+CNG0cGVh7UL/ydumHRI9UF/dD5X3iq1xyZ
         jO2jLepeVCXjVv9BqR4ZRrJKQBYnWN51EckxiFEzHVcSnIyL+tFPTMEb8E7o138+7hjm
         8azjJYeLygZJBLCV4gxtv+1i49aGffT0CwTqbKVYQoOxMkfUAVJpJuXRFEgx5SW7ZDKR
         Uzk/O9a+jq7F3OZcn1EPTF8POwkhHjb06XRvKEFlQrlMYpeya6TQ2KttVaIvNamWE/xs
         e0bOMjb4bPb8f7XolpksyWcBG1Yq4VeqkGoBVIoG54MiJcLicUr51/OzcGgJb3p4/hC3
         VjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682035; x=1705286835;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zjVjh726XCjBJLR5KksmpBynWrFBN2Mp8bNU7qmkmU=;
        b=McrMt44YthDEGhk6VskeWvvIpWJvRcqKswhkYSNUvZe+ZM3HLDw+GRDO+YamLdu6Is
         5nREkOUE3kJM2uWKt5K3+jV2faqSLBOBh0+hZJBgSEdq9QEYkSvIaBGmeHj4Vt3oqiK/
         moeC/HKH9A1mVmTNA0uqUWSd/TW/9RXtVC/qfRis+SPVQgp10kw4SNNC1m2AMlNiPl+E
         WH+EBEvyVgeXDoNBWX2w9wqx43jz0+w66vD0OFSN9Mx6lY7aRpCwX9PIckCpQA/mW9Sb
         tIIKc/qPYaL9FeDBYlbe22QaJuLQvP4EgtG7sctUUOwZU/BlJXuUkRkXvqV4nlc7w5ea
         02fg==
X-Gm-Message-State: AOJu0YwFlSpEIKZrdr0mx+/7XjeEBaenzfMG6GxmZG+IYvznthkWDAAK
	fp1ZzjE3u9459ld8p3zBVQW1ZK/Y1fc=
X-Google-Smtp-Source: AGHT+IGNJcJwl4JyAIow05mDIDMvXUK5qj5xA3RMnIcHkuR8ipE8rLHwo9GO9lVfxvf86xFHW0f2ag==
X-Received: by 2002:a05:6e02:2491:b0:35f:b16d:cd75 with SMTP id bt17-20020a056e02249100b0035fb16dcd75mr7623287ilb.14.1704682034924;
        Sun, 07 Jan 2024 18:47:14 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, mingli.yu@windriver.com
In-Reply-To: <20240104071301.3366088-1-mingli.yu@windriver.com>
References: <20240104071301.3366088-1-mingli.yu@windriver.com>
Subject: Re: [meta-oe][PATCH] usleep: Make the version consistent
Message-Id: <170468203389.912276.14968849531015939123.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108119


On Thu, 04 Jan 2024 15:13:01 +0800, mingli.yu@windriver.com wrote:
> The package version is inconsistent as below:
> 
>  # rpm -qa | grep usleep
>  usleep-1.0-r0.core2_64
> 
>  # usleep --version
>  usleep version 1.2
> 	 usleep --help for more info
> 
> [...]

Applied, thanks!

[1/1] usleep: Make the version consistent
      commit: 65116b253bf4692c8232f50d2007a924f522aff7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


