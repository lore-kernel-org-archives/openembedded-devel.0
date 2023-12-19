Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F853C4706E
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:28:07 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.6847.1702967277931527818
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KRgW8i7W;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d307cf18fdso15843015ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967277; x=1703572077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqgecLsjBg20gjs5poglItC9iLo4K8aJ/upCybcvEtA=;
        b=KRgW8i7WVDnfYed1KqYNITR74kBESz0CBANGbH+MDBY8fWzemK6S+XKGkIX14YW3bX
         ALzsnkAbjfEvs9bVu12HA+rAAQzFdD6UYliWIvHAXPrEB2s020i7v4LR00y+LtE8Ksfh
         eb4vQn1i78ulaSdxxJX0m67+XVLKyxqZ6fpffFQ8NS3QQ7p2qvD53nnr3b3FVr6C8rut
         752ALpvHiLb2r90Nb9RJSnvER6cCki1i1dH0DKI3q4OC7kmhOR/hyM65Gfb0UyFiXlLX
         DdilZ3qZgMPLEQK9rmLAFGErb/c1zhJbDMzNYzLyNBHIC0sgLG5YXgddsJMuD1CmHgyw
         sqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967277; x=1703572077;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqgecLsjBg20gjs5poglItC9iLo4K8aJ/upCybcvEtA=;
        b=TCRm+grHviPUmSagAHKQSqi2kC9pt4dHNCUK2X8MqRGzUfAMGkCHcScgFRetA1ah0D
         WoOnv5x5Q77WUld4czeHUiTn+MVd1V83XhBVFCrCbZaC2Izbs5/Ou1PSalF/l0HLPEGU
         tcpALtT80i44KefVB6dJH7hnLU3jh7KYpsNXex/iJyvxH0QG4Lx7GvWW7oD/kkb+kLuz
         NhXozCN7Np6C5/MVbSrs4CDGwgT4HnVao01BFLxvcIxk0x0EtnzioM7dnTZdGulJJZek
         D0Y301gNxAq61Djyh1waE8YIhtE1xnpdj7Ff8QkRMs59t7xUC9l/HQThmjtLGKrHFdZh
         OfMg==
X-Gm-Message-State: AOJu0Yy+hmWKxTEags1WVSdfayoMFtzih4jqO/S8z4fQjMuuX33xuf/O
	0JIRrk6KS926eKBpmphTQYHf68rlE2w=
X-Google-Smtp-Source: AGHT+IFgGvJB4g4DwCJYauSoBz7pKKxnCCXuvuOFbL4GFeAC7EE6X0agguIb17zTVPlNz6WVov0lDw==
X-Received: by 2002:a17:903:32cf:b0:1d3:be14:3733 with SMTP id i15-20020a17090332cf00b001d3be143733mr1650901plr.124.1702967277392;
        Mon, 18 Dec 2023 22:27:57 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702619939-4313-1-git-send-email-wangmy@fujitsu.com>
References: <1702619939-4313-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-networking] [PATCH] strongswan: upgrade 5.9.12 ->
 5.9.13
Message-Id: <170296727669.1627685.10553226233026018361.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:56 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107620


On Fri, 15 Dec 2023 13:58:59 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> - Fixes a regression with handling OCSP error responses and adds a new
>   option to specify the length of nonces in OCSP requests.  Also adds some
>   other improvements for OCSP handling and fuzzers for OCSP
>   requests/responses.
> 
> 
> [...]

Applied, thanks!

[1/1] strongswan: upgrade 5.9.12 -> 5.9.13
      commit: 5be2e20157f3025f9e2370933267a56fd526c58e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


