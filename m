Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D90C47077
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:38 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.97659.1703665296836166943
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SL1qh9dS;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5cdbc7bebecso1401910a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665296; x=1704270096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2wlHB4ptGgyHHi6h99BhbiuGjUcOjsZZzUB6xq+/yI=;
        b=SL1qh9dSaMiHTGcbknZg89KauiDLPntI1UoFnZo0Lu1hQ/I/oNP1XpYPRTUULsraJt
         X3Y1M9xVfoJXF/sP6plHLwPdtr4Fh9xNnZvDqhCN/z2HzPl2L+ZG121/vaKbulo1RIq9
         ASXl/wna11rq3EXQ9p8y7cS/ml5Pzkz6kdeOXkTaLRO+duO1dpldzrJUHTd3efeq9Bg4
         f12LTwiHYH4nebStz7tMAVadi0CBiIlBscVkHhU/zxxQ80CFJdAsFEKhHn0t/zTNK6xX
         hOYfFG4xpP6KrYz2rlEIK65h2Tjy2xUKvEZvhid+XiParDRYGFxRaurff5AmSDtjmPTl
         /zeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665296; x=1704270096;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2wlHB4ptGgyHHi6h99BhbiuGjUcOjsZZzUB6xq+/yI=;
        b=LMoUJ5V5bazi0RBbXQJ+V/4ZKI6sF6vYsansDjVYBvQ4A3q6/2OCY2fOpLsVhmaegJ
         KYJdKPNDWLvaa26YSxdArHthkOmP9PmwXzJOlXcPaPAeM0egraL0M7kMlAJ1AbjBUQ2j
         pLpHqHiI8qFCy5Ho51i25FKeLkpLMP5CMse6pcKcizG+OHMqLkwhDhoX92QIGAnZNSIF
         YY+5DTR8HDhxM5KX1O5vTSP9FbmrLLfYwXrqaWE8JNRg5s+rlPy4ldxqMbDIb2ZMGuyx
         kpwI39rtGXNPuHYKr8C4AyDmJGZ5x1e332Zrn5Npn/Dk0lDwMxONENNwn3/RqIXbW1k5
         T3Yg==
X-Gm-Message-State: AOJu0YyHpcgTqW48Mf3Dt0Tz1mt+UgOlJuNlBCi8wwpv+sG6XL8VmJ9Y
	MBGU1Qx2EZ1vuaG959CPquWNkc9v0IQ=
X-Google-Smtp-Source: AGHT+IGGS/UryiJL7Jp1PXigak/S20xu8xrlMq4qPziOxGMIFa+LArPT21xgFCzvUpuFUimd1qWVMQ==
X-Received: by 2002:a05:6a20:8e0d:b0:18f:97c:5b87 with SMTP id y13-20020a056a208e0d00b0018f097c5b87mr3262056pzj.85.1703665296243;
        Wed, 27 Dec 2023 00:21:36 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231221061916.69041-1-alperyasinak1@gmail.com>
References: <20231221061916.69041-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] cpprest: upgrade 2.10.18 -> 2.10.19
Message-Id: <170366529513.1947762.8535534872569753156.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:35 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107842


On Thu, 21 Dec 2023 09:19:16 +0300, alperak wrote:
> Changelog:
> 
> * PR#1982 make Uri.is_host_loopback() only return true for localhost and 127.0.0.1 exactly.
>   The old behavior could potentially return "true" for URLs that were not, in fact, local,
>   and this could cause security issues if is_host_loopback was used in certain ways.
> * PR#1711 Fix likely typo in SafeInt3.hpp, that results in error with clang 15
> * PR#1496 Support for oauth2 with "client_credentials" grant type.
> * PR#1429 Add constructor from all integer types for json value.
> * PR#1577 export http_exception for non Windows builds using visibility macros.
> 
> [...]

Applied, thanks!

[1/1] cpprest: upgrade 2.10.18 -> 2.10.19
      commit: 85c7f15d17364a735f294e5ed7daaaba7ca919a8

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


