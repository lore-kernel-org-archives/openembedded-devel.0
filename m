Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7106C4707C
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:59 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.98069.1703665313353325023
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KRve5nQN;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-28c2b8d6f2aso963540a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665313; x=1704270113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xv8zOeF/ldkBQ8v51hjheqgQ/LfNu/cz3dUGDx79mIA=;
        b=KRve5nQNnAWbVYqjpd6b8fMimf908ATa9gHVldXsspAEraqiGU5rw/1btmgYBf+11W
         KVbwYWBYZfVKcAnQLF9A55vcn5b6IHmXIIta2Kr0/BE82ILXJmxXESIDA6e6paLccFVg
         lqrvMqAORtqfeJtXwMhX31mypYd+h/z9X+e1kQfCuWzU1y94eRy74O1Mpazy2wpe0629
         9S0cnZTgpHf2HgspfsdLOhDmCqY9Eyg09RWaGo7W+1v598xt/eK5XT7HPyZGiEb1LLIz
         eZEgfAQMbnkOk2wapcpQb215cY4qvp6ixPfRG+KP1i+kQmBsOwaaFMNaVfzzyaIXr3Ub
         b0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665313; x=1704270113;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xv8zOeF/ldkBQ8v51hjheqgQ/LfNu/cz3dUGDx79mIA=;
        b=h96VnRkzqVyIyuQyBAhRUm6qdxOqukDdDL6Y3YNWjgAfpZAfvdY6Zckz4kb+aSb4A/
         ZvrWVfCWDnLFkwBvqHqeIn1MqXrHGjQnFzw5miBQS+1+pBYyiZd+iDzSeCowCQJWUL3w
         1jd4jrHbJwOm3ijNvZIRTq+0QmbJekQinH4AVcNfBtbJWFAAnxVr+/FdDEtmc8Vu/Uy/
         MTFjN/G73+eJN1ip2DxLpfwJSs/5U2V1RWc1bAVs3pydHtT7xb7OoCUY9hzIFR3oSNMN
         jVOpc0R1vV16VdBLD+5t4gHvYjz/gzZoe3zs4PFLtv1yBLcxUIEqC5/ID+NQf3IgtU/M
         haeQ==
X-Gm-Message-State: AOJu0YxRYfPff2H9vGV4pM3VPK6Z7M9qqneZ6mBBjmn/nGgEbHkwLaqB
	L7j0d0sTM9JEYNlGDywTzeQ=
X-Google-Smtp-Source: AGHT+IHWrB8F3lVH2cZNVCaqzNiSD6DKU6JgCRNZxPkoQjvHNX2NnSHMINvry27YF8Ui/BQEldzC0g==
X-Received: by 2002:a17:90a:b016:b0:288:7c01:8c94 with SMTP id x22-20020a17090ab01600b002887c018c94mr2165361pjq.80.1703665312658;
        Wed, 27 Dec 2023 00:21:52 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221224633.3940940-1-derek@asterius.io>
References: <20231221224633.3940940-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-flask-jwt-extended: update to
 version 4.6.0
Message-Id: <170366531184.1947762.15544855591924407358.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:51 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107860


On Thu, 21 Dec 2023 22:46:33 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-flask-jwt-extended: update to version 4.6.0
      commit: 52891f17294e04255027a0981bbe5aa669b7f6d8

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


