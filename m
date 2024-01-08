Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB0AC47DAC
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:56 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.31424.1704682008426700162
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cuEHG7i5;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6daf694b439so91514b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682008; x=1705286808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFQ//EGOlw0/G7RO4iqit11+H4xXT/Xea0lv8Zjo6QI=;
        b=cuEHG7i5c2dSS0jCpLWfzftTw2ONyqARsP4XULt7HWksOZjmbIx6obeLDV8McCkyEM
         2oJdJqQxnp3/b9JsZSfnkS5+vstHcJHbp4fwu0/TO6jWAXPYG0AwsXPcp3Lf1XKo8aFp
         TdOd23QoWAhjLjlreL8cG4yaGYt+EwBxo/62dXDhirbKGpQ1k2WNibvn5uf9hbN3+ZRL
         8lCsloD9IKXRVzg8C9vkd8m5/IslYEGrW8T+x7EhR7otk+Buf4m4rKw3H/eo+qfFtZO+
         kwuExY1cyoS42FuZvNpZkx63FmoscQn9PIB940kC7VZJ3sFsFDrODSUi1VZq2uH1MixD
         nmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682008; x=1705286808;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFQ//EGOlw0/G7RO4iqit11+H4xXT/Xea0lv8Zjo6QI=;
        b=mUKi/lGorOH4efi7ARYtT20iQMXyuabNhMEFCQQBdt96g9pHw7UPOOL+q9QLzzhb7O
         8QRM5kF7JPvmaalCn8nVyG0bVCxA/wZB7xyCyVeAC8DFcRxCS6HVUUR35RGMhnbCcCCp
         pz57T9ExV0qGV09nW5r562+SsLf9PrBsh2/htQwmYBv9bN64Hu4xqs5YRaw5Hb3srl0b
         X7XKQC7jM3MymQLShNdPkjIuLSAKrmvnpPz90OZXHn04EAyurnSkl9egGs2e5rDnV3Ug
         ZMPHT0V6d/iglfUb2/TW7igVhhXEfyM/CqFNTmedW42ab3b/3cuVbIT1wyPQf4QGv0bN
         Zljw==
X-Gm-Message-State: AOJu0YxZPEYhNxGN/em12zl82RCEJdVwIj4FQhqdZo4liPgldtI2+qHk
	EJAfcZafuh2vHFOIsJhti+8=
X-Google-Smtp-Source: AGHT+IHhc3jTbu24Q6j/z6Qp7QerX4KviV1GgOh9uUpsrBbFmEAnalIprTzkVA1b58DeKM6MQiJeIw==
X-Received: by 2002:a17:902:da8b:b0:1d4:ceaf:e7bd with SMTP id j11-20020a170902da8b00b001d4ceafe7bdmr966007plx.99.1704682007665;
        Sun, 07 Jan 2024 18:46:47 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704176840-7507-1-git-send-email-wangmy@fujitsu.com>
References: <1704176840-7507-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20231224.0 ->
 6.1.20231231.0
Message-Id: <170468200679.912276.15856997811547655723.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:46 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108089


On Tue, 02 Jan 2024 14:27:20 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] ctags: upgrade 6.0.20231224.0 -> 6.1.20231231.0
      commit: bcf04e4948c0679555bbdd727f29a804d4a165be

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


