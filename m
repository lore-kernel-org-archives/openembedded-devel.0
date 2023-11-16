Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145ACC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:51:31 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.19073.1700171484042586131
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y45q7q/c;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2800bdf888dso998410a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700171483; x=1700776283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3RBLAkayFyr0v9e+u5tcm4EmRlXZgxutvyTLnRoXuFo=;
        b=Y45q7q/c0baRf2qj7urV8KKMzrh68JqWKNwiFZTfKFx/qb/CdwDk1SMLC4bl5AIsLQ
         A0mXTDIH8as/1IFSTcBFFwsNOLzSkGHrIPlM5lH0GBalSjxGnkAPr8FBZn9EaPFBnLjP
         Udk/ipyoyJHuLfS3swqYDwO8J8xwvIB21tL14ajhSjZ9y44ODqJfx7Sj/29suPGw0SsV
         D3feVycvKj0V0PVQFrUKyWYOYQkXeHW4GrBUQSdmZ16ZMC4KjYyRXTA9Pb4rouAC/c6y
         hLMu3Ev4u+GiZTW0FFGZ1K1IwtsNfaRYamcAmfQav6SLGFM7wxAkUko5HrCiE0BcLZum
         80lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700171483; x=1700776283;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3RBLAkayFyr0v9e+u5tcm4EmRlXZgxutvyTLnRoXuFo=;
        b=TJK+tewP20iP4Su6qAHt9chMkO7sQBIHknBQBXzihb3fSC9Jyrir1bNRyiG3QtDR2P
         7YZCGzNf8CnWeUIANZga9VtOiUexogPLHZWfSkZMqP9uHNF/zMf8fycbhxph7dyibiSj
         2a8e7ydq71+DEa7hIzDfZ/v2vKs8s25IoOnf5ePfA3Fqs+nPKx+zui0ReSzhA2E9wzVB
         Iwe5lBsPW5qVVtnpWSFJ094Udgbe6ouQcuxd5H704joAR4/ilXe3G8txKy7JAGcpP/WL
         nkEx1wYluqkRJ5YyqVtD12kW4mGs3mGfIX+SAeO7BI+iboAxewJtoauuxW03wf0Nh9Rt
         YJrg==
X-Gm-Message-State: AOJu0Yw82w8CGBoAfzS6wNvGA7Q3bvKuHozElQsOAjV8YJkm8Rjt3QLw
	trsVeY0kuFGhafLVbHWoEs1abT9inrwRJw==
X-Google-Smtp-Source: AGHT+IH9P2ngPVFpXgCz5jDfTqtaUY1G+29rI8EODKkjojFxpSLYet5wvziJqOr5r9VN93JMQmuu4Q==
X-Received: by 2002:a17:90b:3b47:b0:27d:d9a:be8b with SMTP id ot7-20020a17090b3b4700b0027d0d9abe8bmr4287584pjb.6.1700171483473;
        Thu, 16 Nov 2023 13:51:23 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id o17-20020a17090ab89100b00280469602bcsm1997692pjr.2.2023.11.16.13.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:51:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Yoann Congal <yoann.congal@smile.fr>
In-Reply-To: <20231115161443.2181675-1-yoann.congal@smile.fr>
References: <20231115161443.2181675-1-yoann.congal@smile.fr>
Subject: Re: [meta-oe][PATCH] meta-oe/static-ids: Change postgres to 28 to
 match forced id in recipe
Message-Id: <170017148269.249256.3879809271285798607.b4-ty@gmail.com>
Date: Thu, 16 Nov 2023 13:51:22 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106836


On Wed, 15 Nov 2023 17:14:43 +0100, Yoann Congal wrote:
> Current recipe does impose UID=GID=28 in the recipe code.
> Change postgres static ID to match in order to avoid a warning in
> reproducibility tests.
> 
> 

Applied, thanks!

[1/1] meta-oe/static-ids: Change postgres to 28 to match forced id in recipe
      commit: f1607d9617a515e8ae61f1c31e193b0dee2333b6

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


