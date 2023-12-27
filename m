Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EE0C4706F
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:28 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.98048.1703665285475701305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DcxasKzW;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6d9b3a967dbso1869303b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665285; x=1704270085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bj66QXsBsZZBzzlYje/StOVN/EjGwblGr0YGIStqgkc=;
        b=DcxasKzWIvTwXSxbQW4Qiw7WFKaFM12jC9cXCxdXb/r9u8w8q/NuJe8han+ciQEzIt
         tMhC9FMHaug00xaMHrrNns3zbi/wWERsXBsco0cpI3AaP0O44Jvou4WzkgTuumH4cDQU
         Bw6FScsu7E6xCwWHr6QkNbuN8tZiUMi387tsM8TtSIIrYk7p30lla/VUbTQvovyWvNOr
         c7GT5nKyDoFtaVTe/7KPcsPTPAmsVp2MmBODL8QVOoFtbL7m9hKp5YXn86di/ghqJfib
         WL9VL5u1G8cjoS2HWtg14hXGynRRGjC4ACeV9atLJRUEhDm2TIlESPWQKtMOc0ZWBZBz
         s4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665285; x=1704270085;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bj66QXsBsZZBzzlYje/StOVN/EjGwblGr0YGIStqgkc=;
        b=LlUp1O9mQnutR0G8hK7xody9IhTMa+j2IsZFJG/V2jlR+1kXQPCSYtduGGCSIRdt9b
         a4NxaiAX8QoubENAYK5RUhbKcsd+F29NXakRrrCmL8amKY5FijierYJo7bZWylCL1vUq
         sif6jt78wx39lDnEwSpAoHl4sVR3HPJCWA6duOWS353CYSNZTRIypQtIvzmJkw6jtKcw
         kuImFJOV7Ya8sGNa7Wmppn5RH0TAqWuTSEW9PlyBKPvxoFi+GXdq9Ej0VgZ2XZO2AAjN
         ZmF393Hi1kVMyBT40rDfZbJWrd6TDPfuXfkPt5a0r2YyXdj/cDBkeGrDJQgtrYNhwapR
         hvBw==
X-Gm-Message-State: AOJu0YwhUlZPMapN0OKLZ5rsOj6RVthBRQfy5B62/zBwmj2MA10r1hkN
	uNlo39fj4oNnYu6HnSiNtqx6275Zh0o=
X-Google-Smtp-Source: AGHT+IEkhEH0sytSeJ0g8nkrlwWrQcjmv3CdfJqwsT5GpazMKSdbTzJohSFX7knmy1XluUA5yxVddQ==
X-Received: by 2002:a05:6a21:9991:b0:196:179c:f809 with SMTP id ve17-20020a056a21999100b00196179cf809mr1035593pzb.95.1703665284831;
        Wed, 27 Dec 2023 00:21:24 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220224258.3816313-1-derek@asterius.io>
References: <20231220224258.3816313-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-isort: update to version 5.13.2
Message-Id: <170366528421.1947762.11565270896080663596.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:24 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107829


On Wed, 20 Dec 2023 22:42:58 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-isort: update to version 5.13.2
      commit: 4531f0ff6d70e5d837fd1f7453bc4410f8f1418f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


