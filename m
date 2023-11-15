Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD089C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:19:47 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.8081.1700032777977335113
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BHjUoah1;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6c4eaa5202aso4997380b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700032777; x=1700637577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IosoTkQdHmCywsMy5Ujd12Uu7DFWVAL3tVgbFttnMGM=;
        b=BHjUoah1cjvfptThZjAVUTjRCK3R6N/9bRusqsWC0E8nuDx+QyF453WBUpl4lleihy
         cVS5q2NJxWBiNPHosA841+YghN7wFIwjlIM6OZwJzlm0MvGMXZnt/4p9q9xO/6V60Q/0
         /nMrfhZYOUSD54L5eKLtNj7TW9rUdKwUhTX94rvAETrXgf9cfDvssoDc0WYNWnrohcYj
         /le/JKTZalfuqnrvkiYarvjX2rxbp9v8b50KV/T5GcDVT/dzFbBmfOJI8ppFMi9aoEt6
         xM3fmlBj4eI4cBvV9ffCri6mkNfyMVrNPTkJjFUC1MwmGwXu+euK2SIPMuiAs8ITC7nq
         ZuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700032777; x=1700637577;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IosoTkQdHmCywsMy5Ujd12Uu7DFWVAL3tVgbFttnMGM=;
        b=an9JgRfngNJuL/nriMUQhl7eOO4MUwOstrmHJazyRbYedjPwLFlIs4yhUgX6wyShkV
         r8JQnqqAJPivK2gnVHO6KsVepkpQzUnRiGAFouaWdI++epdbv/nMvVPSh7gmxJab9EBc
         1I9c3EVe8uiGlblFdkHExOxmnvpJAw6kY4Mz9rPGbFmkumXUEuAdVOmSfZyHlllaohPm
         Kbt0q771AWkv3xDoN9jVvKIS73AXzcW3rtY9MiP3cKFdfRv0IjTqskiJRur7I/jcQjAT
         hzpKzq32YTWlSfL8SmS+fejsAZp4f66q2Lz4+LaTXwzcYf2aHc9R8CYn8oANW6G0y57S
         f+eg==
X-Gm-Message-State: AOJu0YxXj3gV7pW3YhK4UrlGBH0tVhqXbQCXN2gBxgpz4Nk1+p6UBuJW
	agDTJqhvkmi0C1aPj4KJryY=
X-Google-Smtp-Source: AGHT+IFnkHamIluhSVbcP46cd5ohQzxpTNar2lkGRSaOmTnfHn3l4jwKJWZbUhVwdAZ85xWRRGqwLA==
X-Received: by 2002:a05:6a20:1602:b0:136:e26b:6401 with SMTP id l2-20020a056a20160200b00136e26b6401mr15735495pzj.16.1700032776928;
        Tue, 14 Nov 2023 23:19:36 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id e3-20020aa78c43000000b006c4d4d5a197sm2310492pfd.171.2023.11.14.23.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:19:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231114092417.1842461-1-f_l_k@t-online.de>
References: <20231114092417.1842461-1-f_l_k@t-online.de>
Subject: Re: [meta-gnome][PATCH] gtksourceview4: Upgrade 4.8.2 -> 4.8.4
Message-Id: <170003277597.3928366.7659169650305581518.b4-ty@gmail.com>
Date: Tue, 14 Nov 2023 23:19:35 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106738


On Tue, 14 Nov 2023 10:24:16 +0100, Markus Volk wrote:
> News in 4.8.4, 2022-11-03
> -------------------------
> * Style updates to kate, classic, tango
> * Language updates to vala, python3, c, cuda, latex
> * Add unit tests for language specs
> * Translation updates
> 
> [...]

Applied, thanks!

[1/1] gtksourceview4: Upgrade 4.8.2 -> 4.8.4
      commit: 92e9869aac40ca9fd16bfaff17e2bfced399c8f4

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


