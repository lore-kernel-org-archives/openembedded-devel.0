Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2720CC47258
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:18 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.98042.1703665277526331751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PEp1J6c/;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7ba84a3cc96so266882139f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665276; x=1704270076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjtJiXof8Pqnk8cem2JNbxCzafwRCGU7q1vnts3LGBM=;
        b=PEp1J6c/Sn7dJmDZbrXdCU0v7q6ZIirbOJAaJM+qzGPNrKYcUMuqpdpdSdi24RxaP9
         I7dBKWS7kqXl5wQJcddqXIvAINdgsKUpVMe8U/QiSj1rjjufU452ucq1+JX3mPRU/d5V
         +SiP4QY36Eq3EMggSCBCPboGO0g8rabB+vbsSw6LpAsP9dneSEEwOXv36cKWwF29IhkJ
         mml3j0N7IwCzUGsmf+3O0AUHZM37uQLuZoZZiIAEGZxv/3wnlOTIEbM25qDUKnuWbqqq
         Ly3+fMRQkgFEmk4V8xzQ8WFXN5tph0Hac7zFo1vpPrmQlTtdSewHtrvTZTokdB49XQwP
         X7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665276; x=1704270076;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjtJiXof8Pqnk8cem2JNbxCzafwRCGU7q1vnts3LGBM=;
        b=weffXmJc/rGhSzrVPR/KxG3vvU1xA98GUNFdbmR+t7GxRueyOSsYnTAWqWaYYSd3vT
         6hEJQ9CUBg6QrDvwYsOpKrIL1EEkSILuGp9dved0L8W2wdWLt//wWmC5vimmlGarM/yi
         pUwk8JLlOsebCm75witZVmxuNWm6+BGht8QVmbTBuOCbr5+St87b9yFsTtqpygWf/Lv1
         M3+oFViQ3YNESOjZ5ln6qc5BXBYSd7el4Q2xXZQJR3sibKM6EiPBwJRia2zXwg4J3gFX
         QOvVfYweAoJI+ua54itzQ97YLqhsubAOZSqq91EZngJlCReoSjLUy4InjJ+en/dPqRlN
         MOjw==
X-Gm-Message-State: AOJu0YxWuhNGnAbygcB2u7jzXKX6r3FdeFknATx8qmmjzDbjEkrMAb9M
	ZfwvyjNYTeUcV27bhX25uDM=
X-Google-Smtp-Source: AGHT+IEnol9r6kES/bQQWkg0j8ZeOIHV2S8A5P38VCTSoLMh5keeiG6n+4Xz7aQL7s0gfqSWLT1DjA==
X-Received: by 2002:a6b:c9c8:0:b0:7b4:28f8:d9 with SMTP id z191-20020a6bc9c8000000b007b428f800d9mr13383631iof.34.1703665276558;
        Wed, 27 Dec 2023 00:21:16 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220211326.3610507-1-derek@asterius.io>
References: <20231220211326.3610507-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-alembic: update to version 1.13.1
Message-Id: <170366527567.1947762.1650055321298300134.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:15 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107820


On Wed, 20 Dec 2023 21:13:26 +0000, Derek Straka wrote:
> Misc bug fixes for typing, versioning, and environment.
> 
> See https://alembic.sqlalchemy.org/en/latest/changelog.html
> 
> 

Applied, thanks!

[1/1] python3-alembic: update to version 1.13.1
      commit: 62d9c729df3e5c6bfa9605eaa0d62781736122de

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


