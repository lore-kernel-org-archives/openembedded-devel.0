Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16229C636BD
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:02 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.121178.1700784059019460335
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KYNnB3cn;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cf59c07faeso10319765ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784058; x=1701388858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q19eMEYeL7lkDEzZlpCdn+OoOvIvVfCniDyLF1XdrE0=;
        b=KYNnB3cniHijiWqhj41NZ0cb6GNiLc0jDQb+9jH1HrCsw0w1f2jsBSDFllXgMSlzkF
         HCNRGk584SVWEXCmh7L7gp6+3hBXnyEBKf4wfoRD1pVZfyZfbJMxdsff09wnxzdIe5g6
         auoVsTrlfjZ3ISOCEz2LniPLIoLQIwJR9QMcGP0HJIBmnDplnyh2OtLaqR5A7bYpIbZT
         LFhWV8mzlN1cEWo6Co+QlHMqH+UBvfU3esv8GkHtURQO4WIIflPk+SlZDIp7359BqZJ0
         YaEC6ujyOs62lHYIaJGp1aXcIzp4we4wBTsI9pKpqWBj/D+owxcnazLOOafSTIDyOTqB
         r3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784058; x=1701388858;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q19eMEYeL7lkDEzZlpCdn+OoOvIvVfCniDyLF1XdrE0=;
        b=lAEAQqpwEJn0i9uZBboYihqhwCnaqwYtc/ESke2h5sjtxd00bnJPUPMu+mY1s8W82Z
         p0FBrd66scWuvrMEeUkQLeuJ7YqHqCV0UUBaEA0MAxOhMu2o97DlDsk9sIbyXc2DZ8V5
         1SFkd8W3HEz3Q/bxZnLXEPX70oQN2SHxpsgbQy07XlWHFQ4fv1akbIdi+lmTwC/JN92y
         Wg+6ueqVazrGdFnn+jKYb8UF7+I91XbCvSNovyQHCi1X0TC/jshUP1LmW+867ENvfKpO
         e8koZD7fZBEW8K6VB9YzS59y/M4x7M5z1FMEg3ZVds5bTwF48SNeWGRRP3L/cYM4kST+
         hCNA==
X-Gm-Message-State: AOJu0YzUxTjBxg6xQXFIXq9M92Ty2aJRGoG+P/0v/Oiud+K/aPmhCyO9
	i9GNw764gkDng/ic7dm/328HI0paa1WnnQ==
X-Google-Smtp-Source: AGHT+IFgHHnPHgLacs4OSQ+tl4yPbXid+PPtjOs5CHk7dwDi1Wz4PEc0dsxXtY7xvxH+MPnxdyGIrA==
X-Received: by 2002:a17:902:d4c6:b0:1ca:b820:74ed with SMTP id o6-20020a170902d4c600b001cab82074edmr1256788plg.14.1700784057852;
        Thu, 23 Nov 2023 16:00:57 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:00:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700633744-7702-1-git-send-email-wangmy@fujitsu.com>
References: <1700633744-7702-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20231112.0 ->
 6.0.20231119.0
Message-Id: <170078405719.3118595.10728245034407597944.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:00:57 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107027


On Wed, 22 Nov 2023 14:15:44 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] ctags: upgrade 6.0.20231112.0 -> 6.0.20231119.0
      commit: 40dd5bd576a34d50be555790ce9531642f90dec7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


