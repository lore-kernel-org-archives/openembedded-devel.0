Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31584C61DF7
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:12 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.121184.1700784063501558232
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gq3GyTyZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cf8720c6b7so10425925ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784063; x=1701388863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/hgnpM8pI6evbxvrz2pS0deAQrXGxeh8TkE0LyhWcs=;
        b=Gq3GyTyZhFRWvwM3cTKHGWwmu8J2uiNOh1CbTAiO259e7Z3k4hr8xPb+AFTDE8X01u
         Z8vQgzVx5HWbmJkKU5jB/r9X+rRTFPw2MLhpCtAA1z98yGaoXnGvlmffEjHKWJ4D/sYl
         jq2mzDYh2ooXUZbPvU8VZgwYNy48MNfwfQT9MuispLDHUf+jzmTDXmWQ/IhaWJY1aIdC
         MnLvw2hMkWE9t6EzEsb32FlgSIrc5/oELcjLMbs5zF1BdFdwSwa3Utu6Athk2/8WyXk9
         MLsBugTg77gfPT/gvirJikSTInelg2dviypn45OfYgOMSpWWzir5iBgBnQrF6Ik406fv
         TXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784063; x=1701388863;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/hgnpM8pI6evbxvrz2pS0deAQrXGxeh8TkE0LyhWcs=;
        b=YAknnR3i+FgTJTlOHUwMA+IrGVYDfSwnXD8DskAlyJayNNWP31zQH04lZNRTnPkqIx
         5xu2RcQu2U7sTuIV8g/7PTcZWJ2CgjODnkbt7jjfQJ8f58hquoP7u1XOBOKUL9VbMt/n
         5/jGp4Nv43BTKLa7NRwow049dOalqK/yXXvIvma5UzHYN9rHsvKguTYeKAs/5lKzEDPv
         OgYK/GJSjjbtabELxI1DB9pUGx7eAkWkKjCSFqWKzbKCqG25F4lhuXc2NaWnfAIdAdpu
         2ATwX8Af4PmzjSohw5bFplGCqgDw7Lso+yJZBCANe3JymDY43Wjs1mHnz5sN2vzAStHj
         XvKQ==
X-Gm-Message-State: AOJu0YzSt0pvVqu3/skG7/r8OSK6TW2I8AD7IDVj7imSr1v3JgXewmTo
	HkRldlcYLqAzyNyOA0Z6Z5vclNFBOLmfZw==
X-Google-Smtp-Source: AGHT+IEnAqc8Q7rL1tpf6otc8hYm/EC46FLCVn7rfwLXsedMjN5tF0Igt7JHMzqCzGSCVWDzsEHt4A==
X-Received: by 2002:a17:903:1103:b0:1cf:6e3d:d8e7 with SMTP id n3-20020a170903110300b001cf6e3dd8e7mr1087022plh.26.1700784062730;
        Thu, 23 Nov 2023 16:01:02 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:01:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700634039-7908-1-git-send-email-wangmy@fujitsu.com>
References: <1700634039-7908-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-aiohttp: upgrade 3.8.6 ->
 3.9.0
Message-Id: <170078406187.3118595.9489739640542741952.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:01:01 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107032


On Wed, 22 Nov 2023 14:20:39 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  https://docs.aiohttp.org/en/stable/changes.html
> 
> 

Applied, thanks!

[1/1] python3-aiohttp: upgrade 3.8.6 -> 3.9.0
      commit: 46512556357d80d6e2a9f8f61ea24f7297350315

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


