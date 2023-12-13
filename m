Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351EAC46CA3
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:30 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.31065.1702451246494984032
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bXsNQNrr;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-35d64ad4188so29153275ab.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451245; x=1703056045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8FOSDESp6V9kIF7pYebQcQUo53YIujuJYkwgv/m4cQ=;
        b=bXsNQNrrk5//gRHVPwrmiQEuvnoUXEU0d2vknPfSQznRhhMFzaOYAvw1CslBDwPfwm
         CHok52RFSuCVZzMIJkLxBeAUT4lnULkfwarKmClcDOdKk1COINrBqyFgMJ8tYZy5M42y
         4b8NmPoRqyTUdDP5ug8H334oAg47rGLMovU5iuFfwpqJD1mzSBYaTobohcBvehi4VLKb
         O/KvxrokOP9O2R/8vHLdwmwMxojeg1ogHSkANEYP98IwoHhHqGBLzveEhTfBMvhDFvrz
         QQkERhdzjSjz4WCHHDHJR6SZbdlXS6gRjJfWKtGWPgViE+ABkWezfDeCAINIkiRuwrmm
         xsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451245; x=1703056045;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8FOSDESp6V9kIF7pYebQcQUo53YIujuJYkwgv/m4cQ=;
        b=iHz1jP4K5UMEhWYzGPCJPXknGs82C9R/gTRQsdPwbG8QXZOGho8cdiIJ8tkl1cmVxh
         bZ+35khAYakxGP4FqVoK/5zqEopiOtJE0dhUGYLyYwvz5J5QSPQVI8hHy8NfLdyvTPgS
         anZb8mkHtU07873czqCjRXfL2YIqCtI0jjeUu7NbgTfFBy2a2CPV+y9SsYv76SFn4v7E
         RL/rCE+gGh2oj4MYWMGuyldg6eSA2+jj9nKIyF30OOqcQggJxV0Mca1cXgVeHIq5mq4m
         TGsjuA+6XFbHHhNSDyisj/Z/5ieSAiej5/Qkiyff75xEXrMp4xkk2qYGRtg6THnBrKid
         La5g==
X-Gm-Message-State: AOJu0YyVcuHy8MeoQPU5aALaiEGKb2tpf/PMGDnqsR0U3PxIxe6OkZPB
	JNRQJ3qQEWLUZiWfcK8WZYborhjNIDs=
X-Google-Smtp-Source: AGHT+IE1eVV3n6BUCWk5ne7k56NOevp1rtFAlVCJnbqFITgG3QhXNz2LuWp58nKi3P21wSaFNYdDYA==
X-Received: by 2002:a05:6e02:19c8:b0:35f:7581:294 with SMTP id r8-20020a056e0219c800b0035f75810294mr254493ill.9.1702451245297;
        Tue, 12 Dec 2023 23:07:25 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20231206175453.2967092-1-martin.jansa@gmail.com>
References: <20231206175453.2967092-1-martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] monocypher: pass LIBDIR to fix
 installed-vs-shipped QA issue with multilib
Message-Id: <170245124451.133993.4806074865374003185.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:24 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107363


On Wed, 06 Dec 2023 18:54:53 +0100, Martin Jansa wrote:
> * fixes:
> ERROR: monocypher-4.0.2-r0 do_package: QA Issue: monocypher: Files/directories were installed but not shipped in any package:
>   /usr/lib/libmonocypher.so
>   /usr/lib/libmonocypher.so.4
>   /usr/lib/libmonocypher.a
>   /usr/lib/pkgconfig
>   /usr/lib/pkgconfig/monocypher.pc
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> monocypher: 5 installed and not shipped files. [installed-vs-shipped]
> 
> [...]

Applied, thanks!

[1/1] monocypher: pass LIBDIR to fix installed-vs-shipped QA issue with multilib
      commit: 0cda5a8fb9fb5bc309ba470fceccf65e8bd121d2

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


