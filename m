Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DBBC47079
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:59 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.98070.1703665314054895863
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FZ1tQ29B;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso3898015a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665313; x=1704270113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDTCPsiwYUlEFOdy2I2MfF2RFgy/Xv0urdt0vja09J0=;
        b=FZ1tQ29BwMuZxSY9zrOVqc/oXuv1D+liq3e/81ZsiGLiLOj77ImS/cu79dskST3jA9
         yaJ27B+2Nejjbf6xzL/Xix5fFYlVi5RkMi6vD8lkGklFYe+EVWrOHnN4/WiSOx6k/BPG
         ss/WM9Co0INQwpF3bosRqpB98KYKZCl3OWWZoiMXDyTtenakcBS9u2KwV5B85BNjDkEV
         rDHe8giOmF+Qd10PTNKkdsJk7XlLIXEgkB7KwOcJamalBCZnJnl3EItg31oDYJzsdwY/
         kKnLt7MJKOO9oDh0abhv9qVpiz8GgH8/IHc7fYwvLuiKQ6BK6uBr4/XwEU/TxB5J3EN+
         UfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665313; x=1704270113;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDTCPsiwYUlEFOdy2I2MfF2RFgy/Xv0urdt0vja09J0=;
        b=kkgeKqSYbv3o5zhRsNzNZ+SswGjSqm9iqSAGFXL9wzFQ3Ya+/wym7L337xU8OWK+va
         bE8mNa5IDxvQkyfTiPUJQoPSW/J1Z5WXkvd+y4fe2JFSvEER4vjsSJ+/a2eTLAC16Lr4
         UzEU5DJesvlcoCLDDRM3tlZsjfH3A8uhR2BnpxNpOaCfQDMnPfkDXZpd4T5bI/z6E9kz
         CtrcOuZvixK6oK/xa77ghmL83UAGuBwaY30denB81mK0fEi/FxEYzDvHgwt5uLRWiUVU
         9YdzLt/1Vgxcv3IaY1KoGryu5k0oSiLxFmCdc9GsCzfUkncx2RcmdfPNMOgHjZcaC0fm
         0Dpw==
X-Gm-Message-State: AOJu0YziB3X3gn0SP6Uf4uoPMBCJ0m2Q+gH9AT7D+KA0RWZLf7T5WRZy
	KOqjx4Amf7naq3t3nQpvL5U=
X-Google-Smtp-Source: AGHT+IE6LSCus5pKrPL57JwaHIVClGHq+1Wn91QKXC7ZYOWkipD7SNSgXwDYBp3T9Uih1rAVQxI1sQ==
X-Received: by 2002:a05:6a20:3724:b0:190:1e0c:d29 with SMTP id t36-20020a056a20372400b001901e0c0d29mr8220703pze.4.1703665313460;
        Wed, 27 Dec 2023 00:21:53 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221225303.3948208-1-derek@asterius.io>
References: <20231221225303.3948208-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-greenlet: update to version 3.0.3
Message-Id: <170366531279.1947762.613727961050919898.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:52 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107861


On Thu, 21 Dec 2023 22:53:03 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-greenlet: update to version 3.0.3
      commit: 377c236a04511f582284015843c9b9b7b6398841

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


