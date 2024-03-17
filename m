Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DE5C54E68
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 20:18:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.27249.1710706713809918164
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 13:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TeRa3b8w;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e00d1e13acso1385855ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 13:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710706713; x=1711311513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndPlEG00X9a+SnKb5qluMRIDdumgrH4V0vjpdHY8faw=;
        b=TeRa3b8wZ/dlGMdgP5C1auWr6GuraI7zzm8OtTzZEPhOSndXNJyLKQFaYCA5y55TvN
         DvsOIGCt7RFUl2CmXO9SNAsyiVU1NHSGYCkpsPWNTEpbbtYWUKrHYuPuVNYS5qjm4k6s
         41/Mr8TMvXdrTuOYSZ9JJRZpQWDaoIp+0ZLPTczg/LUCVl4XJSufMcOokbkto2Bbeyai
         ioIWtINcpMOwCz+nY/q5TRWOo7nkEWkm2UzNZv99Ij07BrZxOmZ95Rpv7vP8a3i1s/94
         xpJqfdihow/AEFodr90zMQCr4z548P5cEr6YT7zbk0f2yLtdQs1jPnCWKcwVgHLe4/A2
         bTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710706713; x=1711311513;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndPlEG00X9a+SnKb5qluMRIDdumgrH4V0vjpdHY8faw=;
        b=oUJfhglSVDUdqEFi0W+XNS7sleDlYHHh2yAf/1BYBxj7tYisSUboqRgrx642mu9dAt
         jaddEpNnqesqJQHpnfCHNWMkg7RpZODuk29HmhCzNv4VJhUWb11n4BxXfFBMvSC5dBTm
         fe2Q0m+husGsTH2tJIHMC+DXH+VIiwjQPsPl/rZN2QsTZklM01wdStuuQ/KbpvEaIvDu
         OCUYVZitqRlDuwpDShcQWjGHmP0pBQkQYwYKQ84u+dA43W7zkCw9OPTR2MrrBu5HxlKx
         7Zg92olQQ/+TiHoueU6kQKbaC16UQL9bQmsIJ/ZqIYVzDGi2M+gDfMSwh+v3HDKA8dcU
         Sfzw==
X-Gm-Message-State: AOJu0YznTPmXqfdyT5RQnO+NLQCsylE0GNN2azz/j6GKs4y9doZSVpsi
	9J9PvKxusZK/GIIIsI0nP0EBBIP5K70B1Zk+e7Pf3jkIugiYi604F9bFn1xZ
X-Google-Smtp-Source: AGHT+IFoLSzU4nz1t7ilFRyuWPQF/7EKpDdolxjAtYf1X8eqFerpsOiwNNJ4hJmB9rtVgTE/6chIaQ==
X-Received: by 2002:a17:902:7ec9:b0:1dd:df8c:433b with SMTP id p9-20020a1709027ec900b001dddf8c433bmr9426208plb.23.1710706712671;
        Sun, 17 Mar 2024 13:18:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::68dc])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001db717d2dbbsm1465604pla.210.2024.03.17.13.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 13:18:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
In-Reply-To: <4b6630f81955208dbd94091d3d7fff8c5ebd9167.1710577386.git.joerg.sommer@navimatix.de>
References: <4b6630f81955208dbd94091d3d7fff8c5ebd9167.1710577386.git.joerg.sommer@navimatix.de>
Subject: Re: [meta-multimedia][PATCH v3] spandsp: new telephony DSP library
Message-Id: <171070671152.939783.6092122190722383387.b4-ty@gmail.com>
Date: Sun, 17 Mar 2024 13:18:31 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 20:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109390


On Sat, 16 Mar 2024 09:23:07 +0100, joerg.sommer@navimatix.de wrote:
> 


Applied, thanks!

[1/1] spandsp: new telephony DSP library
      commit: 6a2b29e98d77de46a2885eff15bc8e4bc42e9396

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


