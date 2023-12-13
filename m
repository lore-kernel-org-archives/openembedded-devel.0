Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FEAC46CC5
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:30 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.31064.1702451244607367632
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CDwB3bsL;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-35d67870032so41941085ab.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451243; x=1703056043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43qGKBlqAauQWLIaIR275lqQGl6OVldzvK+/4CcXxUQ=;
        b=CDwB3bsLpQzriRTul2UKvVraGykeIJqhOm6Y3skAnbIyI2EmaoElQS6y0sKkV/wsMU
         33tFkD0E9kIhNXaTSU0E2S2+wqM3jxOOLojOx1AJtxfgMZqzOlwIZg/89YQJTRs8Utz1
         pJlG0mJu22KfoFWyDTLjWAVIT0zmPzWV1SwnYRJ91bkr9KX8xMjfsLO3/rjVx9nsYs7E
         rj1eC7ovDudNORV8NqkdYLGu7xfikvuG+XRnHCIAngKf0a4inAk+K5cjpkw4hLem6b47
         5sVUVxVDcjmhBDQD/oVVp+jFxjF0R/FNxN8N+kMAli9Sat4xKFyLNd1i43PfF2FREOQ4
         nJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451243; x=1703056043;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43qGKBlqAauQWLIaIR275lqQGl6OVldzvK+/4CcXxUQ=;
        b=NmQ7U/1XfWn8oFrGNgFTTLpZfLYYiWiNm6Cim7WWY0gU/k8DqVh/6x6jX8Uw+S4vSS
         vWey6d89Wk7n/87jUJP+ecuwjIv1D51GK6OohLgI4GwqQ8Y14cUIGyEfAFS9rMdRDzUs
         q2xihRZ83wT9E9sGPUDwS8hZxxswq5zhqcIC8SEgRPAPRGuASFLnu8oSac7M3/Hothzu
         jHaYmT0NBM/IcoA072vTjzCt3CHRn3R9r2wMJmJZs4eRgabk/BBMlDVxmgC8ZjKX/t8i
         8euFiGR2o3J51dAzn37wXxrsgLYL6HDn8H3AcUhu+izvlSgapex7xa+mZ9rxJn2qU553
         OqXA==
X-Gm-Message-State: AOJu0YwfNQZmg7dt/QnTgWPfPg8vrXqSYASgUqNT11Ob0aRDDhw5Hiy4
	aNpbiD4U1ZOV3M5nag6WbobOgvHn25Q=
X-Google-Smtp-Source: AGHT+IF1lxxO6BAGOFoHwmK3BQdl0lmMq/b5ETVLE7gW0/BhB4DFFlwQAZXfo+ryGSeLXZHMq3yf0Q==
X-Received: by 2002:a05:6e02:1a06:b0:35d:59a2:2a2 with SMTP id s6-20020a056e021a0600b0035d59a202a2mr11760584ild.66.1702451243526;
        Tue, 12 Dec 2023 23:07:23 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231206141727.390133-1-alperyasinak1@gmail.com>
References: <20231206141727.390133-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] sessreg: upgrade 1.1.2 -> 1.1.3
Message-Id: <170245124291.133993.6315068217826582032.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:22 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107361


On Wed, 06 Dec 2023 17:17:27 +0300, alperak wrote:
> Changelog:
> 
> * Fix -Wstringop-truncation warnings in safe_strncpy()
> * gitlab CI: stop requiring Signed-off-by in commits
> * Build xz tarballs instead of bzip2
> * gitlab CI: add a basic build test
> * Fix spelling/wording issues
> 
> [...]

Applied, thanks!

[1/1] sessreg: upgrade 1.1.2 -> 1.1.3
      commit: 5ec9943b2d67692e07ea09b807332463209489be

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


