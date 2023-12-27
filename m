Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D9DC47073
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:59 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.98067.1703665310448623252
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QZXkFgvk;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5c1f8b0c149so1247837a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665310; x=1704270110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2pVBKo1JubOmX3hMznUhjIJKD5SFAdzito1hp7asW0=;
        b=QZXkFgvkCQZVSDWLsVi18l5Pg/ixW6t2tN3dmY+tmpqRE44jG62sWpa8l1MF6dnpne
         fe45CbmpQlrs2QE0WPC0Y2fwyhDXATLNcGDCTCR9R0IuhDTzX5KIFeXoJ1hPji0D6UAI
         8B4cnVmkFtw3sxD01VInSMQ85mhmCM2jwOWjuPZcr6YisRBKM1rSTQFTkJiGju+riSGw
         Wmw44hRHhZD1bgwZcbu2q61JYZgWp3SasnIkCnmh8v0GjrA3r/tvisCn9MQbzEb1NSmy
         IS1CqOYO2VSp7ePSALg3N5kCY8GW9VQClLJsx5U6ZohEKcpUJykVz6OpjI/AItAZLQgT
         Uu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665310; x=1704270110;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2pVBKo1JubOmX3hMznUhjIJKD5SFAdzito1hp7asW0=;
        b=dmbrKoENJw2JlExR9IZWNv7OjIPJzio9dDspmf0ft97xtHomO8sSPby102Iqd7E2IL
         Kta6Ejgc5b97SKwmsOp7BqTB+oRaxxr70+dbbOKWZZM+nueXL5X1ceL6VSdcmCpVViIR
         EQiqPoPkfwKRx2jQqUaKEC8SlzznOWQR5H0UI+kc2XZY04aYlI5VJQ0omWPabWoNvxOP
         E6ibAlzV9rKTwV93tZXtclbSSa06Zp2UMFjrLwdjZgFlmSM/k4fPe5ukxwUS3l+sGw4n
         m3UOMsgFuheRlCDeCVJmwxNG66RGHM3+JteojSPqO0Rp5rgFKZTVW9OJzAvx+k/S2EOm
         o9ZQ==
X-Gm-Message-State: AOJu0YyQ3U9jkm4Ul3Q+uKC20JIAF4ofQtLXESbkldpzY/ZM8OY8QJc8
	+MzYtu31mA3bCbqc1z3vGDYdt6AvNpI=
X-Google-Smtp-Source: AGHT+IH/DH1hDRuCCgG61bcPacqGwmUoNhSbtXoGIgvZFkC5fK0O/dIUBf7xtjU+Y3O3o/Nb2WnqqA==
X-Received: by 2002:a17:90a:9f8c:b0:28c:4a6:2190 with SMTP id o12-20020a17090a9f8c00b0028c04a62190mr2573017pjp.10.1703665309821;
        Wed, 27 Dec 2023 00:21:49 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221185513.3930632-1-derek@asterius.io>
References: <20231221185513.3930632-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-pyroute2: update to version
 0.7.10
Message-Id: <170366530920.1947762.16596878914181608149.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:49 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107857


On Thu, 21 Dec 2023 18:55:13 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-pyroute2: update to version 0.7.10
      commit: 2ebd36666a0db8d9d0e676ea186bea43b9f2a55d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


