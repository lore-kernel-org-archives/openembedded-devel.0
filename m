Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596F1C47255
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:28 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.98047.1703665283819782686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jkphoYGH;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-28bc7155755so1899935a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665283; x=1704270083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2y7N+2gYgSgzpf5RZp4It/SpaCMJ8wLCtN2fPxpaF3E=;
        b=jkphoYGHopYhzqSvo3hT0j/0s653tP/9wI8HQWYVOg5/odqCCSeu1RTWh9syMnrAW3
         g4KejaTl2sgCEUb5Ht3ep48IFmNWY0XVoxISgsGM0iSGF7Pd1NbtWA6LTsl42sZSYiGS
         QHwZ/mTqycREyVg9Vpalwwq9I7PYPvAXpx+0Gz8a67iHf6TXmX26QhEZyX8JC+K/pn6F
         piBeHYKgGg2EUlWux2UC/6mHiqkY1pmYB6jsZOGK+24+bX8SwWFBOwGjWjb2/BP66Kb1
         +1y7o2ZEcMPh3hZ6ACZ6e/at0vP7BWEd5ct3YXOfEoAr8WGAAiwWIVs7Gz4p6pFcYKVl
         Dxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665283; x=1704270083;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2y7N+2gYgSgzpf5RZp4It/SpaCMJ8wLCtN2fPxpaF3E=;
        b=o4Ecsz9/9E/IgFkPVaxctjUv5QM+3dEvB7NnGo1iCP4Jch3ftZhZaSKYLpXoPOvB1w
         zGoHudhEjRQN1yx//2AEu5qCdFRD+R83tNqDsodvHQBzrqk0ysFLQRZacpG5iooxf/lV
         SQCXt3cQ722yYFzQ7YfHvAN38h7vF5HKkw221mpasMjzjSgg69HE44FcWZCjgBaUyMj4
         hwu+rkNloglaZY3ZJhH0OsGSyvjEMWUDozAuloK264AroQlDcPFLDW9qPaOTsb+2fXR/
         1U37d8ai3ZqFUH1UZtlajyfC3CLue2BX/+ydZ/Wdjvjn3vbgFzHeOAMnryyXx9YpRvtM
         YcCw==
X-Gm-Message-State: AOJu0YxAb+MuDvFuOW+1rBexc8Q4dNyskJi4p3a8eXCPGE4LFG6SYoWu
	skRqmhGsLG85AXMtRvnAjJhFMOq/Z3U=
X-Google-Smtp-Source: AGHT+IER84+iOADNZxvG6DELNkCCbRGIvec7PjdFBc7eez0CojRoaxS/P9N16XZe9+++EvoHK6hQ+A==
X-Received: by 2002:a17:90b:951:b0:28b:db7d:71cf with SMTP id dw17-20020a17090b095100b0028bdb7d71cfmr2360133pjb.70.1703665283188;
        Wed, 27 Dec 2023 00:21:23 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220222535.3810653-1-derek@asterius.io>
References: <20231220222535.3810653-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-zeroconf: update to version
 0.131.0
Message-Id: <170366528221.1947762.5202564355147009977.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:22 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107827


On Wed, 20 Dec 2023 22:25:35 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-zeroconf: update to version 0.131.0
      commit: ef76589e4b89f7b8e794624963f8dcab94788ad3

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


