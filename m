Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227F5C636CB
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:02 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.121180.1700784061605589286
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SiiPxDQF;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cf8720c6b7so10425625ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784061; x=1701388861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1YtRWzYk1xSACJVvSBxU5AtlxZNY064lkr6Tjm7o80=;
        b=SiiPxDQF43ZAOG8Tsb1rkvcMoMUBWNc2P9QQnS+QArAWrF7rCocn8pfsmoD9lFbhpo
         Mld5oG0DNKxFVcmY7HGw1JOz/ceng0Eifd55M6HTZv1r1Lh4VtmEKVjs5KVgJrZRpZ2l
         5Ncbj92KlsliCN1yTU9EQQC3bFF56RFP8o7zUNlYXSaA7BtDzMeWhunsOmigxT8zpf5K
         I5YuFMz9HFVnNyyfRdZBbYgmoiL7uFE1UzMhL5O1+HKo83BZOeDHON2foUg1d12Ef63I
         gyuRfegh+olLFSl6i+JnPLYpIGogMJkXJLZ3Lnq6BfwxNO3VosnNhlssPziQAGf2/Sw5
         Arow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784061; x=1701388861;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1YtRWzYk1xSACJVvSBxU5AtlxZNY064lkr6Tjm7o80=;
        b=rgYMxOKj1MNhiEa/K2D4tR/LkOmGGu8za2FZZFF+lDXHD7Dpd5n+BGzswZ8ySf0pIN
         n93f1R9V10RB8hUsHWhR1infjmGj0/nyz9bcVMETce2ajraAx3Nbi7UzueAe3yOQbWpO
         XoDK/R6k/xCPD0GYMDXbqhUco5C9Kxui1sUyqkmhrCHQs8A8MfcFAwChWYbZNPDVu57+
         vLwEpMyB8pQEFFMemV7PH0BUAXOG5Z2HsAecJB1LNQBbjZsyjo3kUh5VC9Y9rEPAfTnC
         XKR9kS9WXPda1N8sgVK6JWoh1TLT6QG9e32bgrx6CBv0K6mwkqY2bmQHczMjVB1U5wA+
         knXQ==
X-Gm-Message-State: AOJu0Yy5bk5IqTClOcRklzLjtAIrbrqrfUlCLkJEzDX3+b44v/XZwsWV
	y+wL6K+lXNc6IPkraJMCSwXEoCXHNUB1tg==
X-Google-Smtp-Source: AGHT+IFv86hUei0kVhV2K5gtqaxA4OYwupyS/aLsBxZvNXxanP6xc227IYZgSkiepFWuuoFmmh6rPA==
X-Received: by 2002:a17:903:44d:b0:1cf:7a4b:9dc6 with SMTP id iw13-20020a170903044d00b001cf7a4b9dc6mr827767plb.61.1700784060581;
        Thu, 23 Nov 2023 16:01:00 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:01:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700633942-7833-1-git-send-email-wangmy@fujitsu.com>
References: <1700633942-7833-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-perl] [PATCH] libextutils-cppguess-perl: upgrade
 0.26 -> 0.27
Message-Id: <170078405970.3118595.2047112430132886596.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:00:59 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107030


On Wed, 22 Nov 2023 14:19:02 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  support C++20 and C++23 standards, and vendored version output
> 
> 

Applied, thanks!

[1/1] libextutils-cppguess-perl: upgrade 0.26 -> 0.27
      commit: fdb279bc33c1dff36678bc822da22666a4c9ab18

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


