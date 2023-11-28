Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4C6C10DC1
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:38 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.14757.1701215734048681085
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H6sX/f2L;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-280351c32afso5654513a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215733; x=1701820533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MmCSQLLEfM+9TcANCS68kwaMC7rA90oSXP4MbD+3OY=;
        b=H6sX/f2LHxeHnzktM/d0saD1458XYEl8rwKEuo6SRS+zJEJNrhu+ots67pzsSjTDRM
         MkJN4J3gVbnHAwEY4XPTradKqG/YcLviLR7u3WrwV1MmdkvYggQmPuwt0ns2GKwWMHWX
         V0N6CAX3IbrItrOUU2ruq1kCUTHIZP4QGNZAalkfxUBOXtRpQJXlcafTYngUiaf7BT+r
         iSkBptlxFYfrwoQidxKhnvL4bLzggJXuEFxAnd2Gyh8xDfkFzFWS3c2y6lovJDionNO3
         pZixmYVI+qNuRGjBHwYmmC54Ror7BZL1Sgve4KXSHJb0n46q4GH22gjzk8FLFel6iTPS
         reDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215733; x=1701820533;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MmCSQLLEfM+9TcANCS68kwaMC7rA90oSXP4MbD+3OY=;
        b=SCEyy+NG37MR8WfPG2slyse966mm1LJeGsb1Cfk4zkfVLErbmCni+u9rB65PisoZEY
         38u6EbX5oakOPVtpBK0SkdytczjBfUMhHV7NSWWDyketHg4jUVAW0e5fIP9pd+aKbPUn
         3pzEfwuPy5N10wKA/1m6SS3MN3c9m+mcrw5e7RF8vpneAFcLXrAOcxql7n1g6u5KckCh
         g3j187HZ6trUwfPwZsLS4y86pdc0Hfvyv98gyL5RvKv7v4QrpfJKvn1KJX609lASxz0N
         2/hd6crTZRNdU4JDXB9F9AUNxHAzS0v/L6HjfpBvoVAvBnipWCKJxhC4STSilpeHT0ZG
         dA2A==
X-Gm-Message-State: AOJu0YwY+41bfbHf+cidweKQInS9Caichw7JXpxFFrR48G844X1THZFs
	+0tfEij3BvMu2vMt5up4bLw9tR5Gv3T6UA==
X-Google-Smtp-Source: AGHT+IFwPkoqfrtdIjCms7cRKdub46QCPXYnGyNrlnnByFhnDFOzTjSmMnlRgqUp1Yfw0Cm075aAFg==
X-Received: by 2002:a17:90b:1b07:b0:285:9d0d:7e3 with SMTP id nu7-20020a17090b1b0700b002859d0d07e3mr16848637pjb.38.1701215733237;
        Tue, 28 Nov 2023 15:55:33 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701160806-28448-1-git-send-email-wangmy@fujitsu.com>
References: <1701160806-28448-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.178 ->
 2.4.179
Message-Id: <170121573224.1187527.17410375749346632307.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:32 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107119


On Tue, 28 Nov 2023 16:40:06 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> - Bump deps.
> - [misp-objects] Bumped latest version.
> - Eml and msg are in sync again.
> - Update calls to getStringStream to the public method.
> - Avoid confusing error when an auth key is limited to an IP.
> 
> [...]

Applied, thanks!

[1/1] python3-pymisp: upgrade 2.4.178 -> 2.4.179
      commit: 178cae38187e1aad1ef4c37ec7bb09e531f309e8

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


