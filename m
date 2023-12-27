Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176BFC47077
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:18 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.97646.1703665272564894922
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hmuA5vat;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-28b9e9e83b0so2264237a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665271; x=1704270071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67g43iN2MZNsqBfO+wGgBORlkEwE4/LPSEoi7c88QgU=;
        b=hmuA5vats9+2tpdKhW4IRnrar46rPnbFv1yNkdV67a5LbRmjmKvR0RLFcGtfmzrN3r
         MF8qgJdj45p0aYt/F9wajgAkKvvIiVTONQlraomfweybDT3xzEIAwfaYPsdeG/9fWrRW
         IncIm4Yz1CFtDLOz4hgSn564LxOhmccanRKZqDURa2SWsUxqLfsexkxbld9Laedz1rg1
         i3s8LToSrJUAkBcH7a57c3jf3gpv/SNa+aCOf8LQc0B8cWl1doZgYXby33BT5VGPiPd/
         +2H18AuGYNFyyeN8jAwvYbEKPTnML4NdVzK7IuycsAccQrL9mCHtWca5E1NeKTslTGVC
         WrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665271; x=1704270071;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67g43iN2MZNsqBfO+wGgBORlkEwE4/LPSEoi7c88QgU=;
        b=sGHCT9KZJiSO2KwXMGJ9m7Dv29rzkF1+R6Z8onird6u0gut+S64KcpWuqSYvG0P293
         l34vv8Ik0auxuKtpryiZu2tWpBj9SZTiNOF1eacU54JSGtmr8bUvX3yMtOQ6QMtREsdQ
         H5b4/U92aLWOJR6kTBm343grEySuAlczC6SLjTSTKBzlJ5+CjPdcbfrFrM4eYy6vPSaM
         mZXXPv4vY+KAflcr2S37WE3cPW9PYdONCyxrocalYDCY33waclDdZvAPq4uU91xfQmFL
         lkt5JdJOC1YX7pzlHPgTgN0Vyw4h4FGF984ra6ozM0ZqmxlAykZ5iudnuWHMmmzO94ES
         PZvA==
X-Gm-Message-State: AOJu0YyrqOjNoEkHenL+6HJjo0zAlrxHfcGo9O0Skduy+9Vxfqa3nMln
	X8XiCSyX6PwyNeKlDSjKkaGYh8KQ4zA=
X-Google-Smtp-Source: AGHT+IE1JoIdvDZkeVfhFjRocOBgNtiPy9130Ni5enUvW0r4F9FFy14Wx6rLL+1mjCg9N/4lL3hWUQ==
X-Received: by 2002:a17:90a:a516:b0:28b:c0fe:ba16 with SMTP id a22-20020a17090aa51600b0028bc0feba16mr2407374pjq.60.1703665271460;
        Wed, 27 Dec 2023 00:21:11 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, thomas.perrot@bootlin.com
In-Reply-To: <20231220141550.1777282-1-thomas.perrot@bootlin.com>
References: <20231220141550.1777282-1-thomas.perrot@bootlin.com>
Subject: Re: [meta-networking][PATCH v2] networkmanager: fix some missing
 pkgconfig
Message-Id: <170366527060.1947762.11361160584139149181.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:10 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107815


On Wed, 20 Dec 2023 15:15:50 +0100, thomas.perrot@bootlin.com wrote:
> - to build and package nmtui
> - to automatically append networkmanager-adsl and
>   networkmanager-wwan in recommended packages.
> - to fix an invalid-packageconfig QA issue that is raised when
>   adsl and wwan are added in pkgconfig.
> 
> 
> [...]

Applied, thanks!

[1/1] networkmanager: fix some missing pkgconfig
      commit: c331f59e42e9c0bda9d47d0365e6c276746fc81d

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


