Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22240C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:52:21 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.19068.1700171537544454477
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F93ZQNKL;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2802e5ae23bso1105794a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700171537; x=1700776337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rS/c2anHeG904611cLEGABWinZu9g6TiH0sYtHo8ErQ=;
        b=F93ZQNKLwkLbhvQKRmOwOw5GI8nVlR3TgYzfeuAVGcb/Il3zsdnw747aWYdDmb4cRA
         jpsBIBkB59AK1+Ecm7MtryqtrJT/JG+yEq8X8RKlb/JOddQpsdu6TQpepz64hSqh1Ebz
         lqTUWBLFw12QhuGO6Frf00vKATfIwycsPntP4CFWP0OCK6waFFd+F93BaMoLbAXmmjSM
         +D0/Atm+Kz9lQsDxuKOo3lUf+fnyfQh6WS14A2EcTHHa5MjFJzjDK8EzeIYKr9+u0zyG
         o/U0pnjiVzdRhgYhBSkzjNjowdO7KDXGVecw89JPJbhC4hfqSxkmUDFz3Mw395ptFj+N
         KciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700171537; x=1700776337;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rS/c2anHeG904611cLEGABWinZu9g6TiH0sYtHo8ErQ=;
        b=Jp7tadJw0eSmf5/VCjIg5KZtfJbING5Uzg3HyY99EVxOTYaxYuPvAzZsd7q8HyAlPy
         a/j1wSUIRFx2hG2YGd5BtANE4ICJzU72R1qLma1qqVA3fUMznUIsLioBc3AuNgsmVrcO
         pP4efn3Lrb00pBmO308G/A5zuV3FRmyey0vgPjoVY4ng2FmMaXyxVqIlqsIs6kBVx6BB
         5CLl3dnNgNZaGgPTfiMrF6ub6Mf2R4O9v2COJ2qpIdQZelVTMR/6/HV0BMvlJRKjpUMI
         eBGiif0s8tFarwN7dQMJUsxk3s9R7dXM7SBnpli9eqFVxMIj650IRfIGwRPr4Cr0aHHO
         OtTQ==
X-Gm-Message-State: AOJu0Yz6TQ239hppg35NPv8FAggE0syMGISLR9QabwrVAlzIOLNOgw3v
	Xm4k6CXBO3S9XvdtnzPa60Li/QvnS+8BWg==
X-Google-Smtp-Source: AGHT+IEhmmn+RZfiD79SOTufpJip4Bb503D+It5ArccnrR71UOIWjxyZRPRwiI8X4TX35gE0R57Sfw==
X-Received: by 2002:a17:90b:1c81:b0:27d:b3d:5c33 with SMTP id oo1-20020a17090b1c8100b0027d0b3d5c33mr20869688pjb.28.1700171536820;
        Thu, 16 Nov 2023 13:52:16 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id ck22-20020a17090afe1600b00279060a0fccsm181763pjb.9.2023.11.16.13.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:52:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Beniamin Sandu <beniaminsandu@gmail.com>
In-Reply-To: <20231115204533.1670977-1-beniaminsandu@gmail.com>
References: <20231115204533.1670977-1-beniaminsandu@gmail.com>
Subject: Re: [meta-networking][PATCH] unbound: upgrade 1.18.0 -> 1.19.0
Message-Id: <170017153611.250978.16653022536948115460.b4-ty@gmail.com>
Date: Thu, 16 Nov 2023 13:52:16 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106840


On Wed, 15 Nov 2023 20:45:33 +0000, Beniamin Sandu wrote:
> Full changelog: https://github.com/NLnetLabs/unbound/releases/tag/release-1.19.0
> 
> 

Applied, thanks!

[1/1] unbound: upgrade 1.18.0 -> 1.19.0
      commit: 24e6bcb3759f6dc331a6716a12124e6cfaa72c0a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


