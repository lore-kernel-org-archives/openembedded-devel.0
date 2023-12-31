Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DEEC4725D
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:29 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.198976.1703983102499005991
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=msARn1Dq;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d422c9f894so50702275ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983102; x=1704587902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKYMQHuJpS1XalgMT0061zRrzJOdMcWeTXTaydZfG2M=;
        b=msARn1DqXZGvW4XdXWRG2hjaMAJimVVIQp1zjEDufyYezP13B/MNVbGWZ5O/ghGGeY
         LXe60VYVIX6YWgabPph9urOSTvP+X1ZLmlC0TeEdGFdAbrbUeswSK8up/fez0OxK8gYu
         OMlDshnUweQsvFkNSxk3Gf1IF4NIvGX9XYwLZRygdy/81rg2LENEN9cKiroYqJCAjFsR
         G3LjG8F/S1RxKhnYOk2PzSZaxsTTSds3ib43/W3pKy48/HboH0004LFJibJ2P40sBTTC
         zb7iU9NJ61s004sVNDSwJ92jAYuCKio0kCC/TIKbO1gsPY8DgIOVgxJWCkWgPqvCQSMw
         TnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983102; x=1704587902;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKYMQHuJpS1XalgMT0061zRrzJOdMcWeTXTaydZfG2M=;
        b=vdrYi8Z7W2JGerWkgWaSj6Nbw8zRnCqOn/3X2la52gxBsFliatkSVWeJWen3dlIRxQ
         8d/VF4nzL7SMiL8WaoGvoKs+5OXN/lpqpze1qINnihs28AyXvRDGy0QC8zy6ziBfxD3U
         Y/ROxZgPsR4sD8rRovsQkvSkky8Pg3qwwUEUCcUC5pTx0oXmMXNyrOge7Oug1jntmxIY
         au7AUrL4Bt6KUUc31z7YSzH/Yz/8yV/IAM3cGw7A8hGHLNmukloO1LLZ+hm4vLiiCWcD
         5gJLrfXkQHd59hAUIRaN7iXGFcf/rA0b53vgUGHFNdIRN2gIvN6Kg1Ee++tHudtltS5H
         0YrA==
X-Gm-Message-State: AOJu0YzLF+Nq7Kds1zbHQz28auhTBM9SdteSSUgbAYm7fZUTB+H5Bnck
	BQBBj/YS7gCLEGSwEPn/gKWVrqhIh1w=
X-Google-Smtp-Source: AGHT+IHVkGHQa5xRvqkJiLOpbzAKUjvz8Sm2hTS8KHsN+eExkDa4GVvG9p2rvvfmAFAKDxoRzhhEXA==
X-Received: by 2002:a17:902:d2cc:b0:1d4:2c93:39c1 with SMTP id n12-20020a170902d2cc00b001d42c9339c1mr14249492plc.73.1703983101526;
        Sat, 30 Dec 2023 16:38:21 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Alex Kiernan <alex.kiernan@gmail.com>
In-Reply-To: <20231224154459.27680-1-alex.kiernan@gmail.com>
References: <20231224154459.27680-1-alex.kiernan@gmail.com>
Subject: Re: [meta-oe][PATCH v3] bearssl: Upgrade to latest
Message-Id: <170398310079.873206.18205187478483269339.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:20 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107916


On Sun, 24 Dec 2023 15:44:58 +0000, Alex Kiernan wrote:
> Install headers so that dependencies can use this to build against. Make
> `brssl` executable, fixup library soname. Drop patches which change
> build flags in favour of command line overrides. Add support for static
> build.
> 
> Changes:
> 
> [...]

Applied, thanks!

[1/1] bearssl: Upgrade to latest
      commit: bf4d7f62840ceef1f6319f161a40c4cdc8b2338a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


