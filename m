Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6880C4707B
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:38 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.98054.1703665294180241363
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DAToWLHL;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28be5a5fdedso2131769a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665293; x=1704270093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cL2Gi+mmcFqFXMG8iuIZdf+IeVIvLR+dGnknv+K5S0=;
        b=DAToWLHLgQ5T1VOVOSQsgb6Ro46g2zZopgWl7dQ4uJSbvTUtbJl+mvhaiHDRr0XvTd
         EhCtG2OaBb8VHiSkFw99BJ1mHF00hIHnCESA3ddRlCbolOwExYmzcF6Z+HXMyEzGO+G3
         yT9UCLW2nrEhMeO+mybUl6S1uHLHk58amr/aSAhQChNjBLF2YgYUiMm+fer8L6G8Dh61
         s0SQ26np6Xx+LMu5M8deNNQYs5ubYvcE24D6rzsgfwxGqyEUXLBSntCwMQ8DBgsHmrbQ
         aMKESluf+0cbTFW/aS5uo2vUV6AX5x6Ix099OTNQxM76qktZ7lN9UK7duOBk+aD8sYE+
         snGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665293; x=1704270093;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cL2Gi+mmcFqFXMG8iuIZdf+IeVIvLR+dGnknv+K5S0=;
        b=cxnOVjm6nUD8OEBuf5yVSdt0J/NQMPI3gY7caCeRQqVSr3squ8hHcNYeYbzbISBMHW
         S4kuAyQxlHEwwJp08sIv/Wf4YIpH/f3T+ysXNK1lSz2quBzQpn6LbkMOgOXfLyclyxdY
         KBU79QGgV1JKHrHCoJW6yMmhHkXSk98N9ExHw5vyklQPpNYfuwrBZG3StVbeBG0d81RE
         4Riupw/ggInZWYwSX8Aim9n4VA++nCpYW/pcaZ04hDpXqj2uNHzUvIsm76Sigsr0wdNc
         5RPuN0zCCTbRFWMeUxdlSHJe1fgHbhX+zXwUswS4BO0SDigALdLsr+JEYEEi+kg3eX2V
         h65g==
X-Gm-Message-State: AOJu0YxPUphhVXNP/X3nWsIcw4A7nuRsJqvjyRRcD65ekf6IHj6atsfN
	fdmwvuMsRPYjq9dhfaSM9mtVTNRHM64=
X-Google-Smtp-Source: AGHT+IGdkJzYO5bN9jpPD+pW/HyiXIV0J5WmLkuGMtB/0Iv76/6WbInBGIqZpzSH8CM6G+Ep2ysa8Q==
X-Received: by 2002:a17:90b:3447:b0:28c:9605:f643 with SMTP id lj7-20020a17090b344700b0028c9605f643mr51027pjb.28.1703665293344;
        Wed, 27 Dec 2023 00:21:33 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, ross.burton@arm.com
In-Reply-To: <20231221102015.1080653-1-ross.burton@arm.com>
References: <20231221102015.1080653-1-ross.burton@arm.com>
Subject: Re: [PATCH] renderdoc: no need to depend on vim-native
Message-Id: <170366529265.1947762.13634750070553067063.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:32 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107839


On Thu, 21 Dec 2023 10:20:15 +0000, ross.burton@arm.com wrote:
> Remove the patch to bring back the user of xxd from vim-native, the
> patch claimed that the cross-compiling rules were broken. However they
> work just fine if you tell it what compiler to use, as the default is
> "c++" and that isn't in HOSTTOOLS.
> 
> 

Applied, thanks!

[1/1] renderdoc: no need to depend on vim-native
      commit: fc035a8c4dc84e7414a5a06a0949c514fdc69531

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


