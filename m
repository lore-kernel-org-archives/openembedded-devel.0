Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB6BC2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:46 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.43655.1700452299931499127
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZHcbyLg6;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b3e13fc1f7so2717884b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452299; x=1701057099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2SzDHS4Anc4TP144jMRxtv+8IuyTWDlfHir9vy813E=;
        b=ZHcbyLg6MmozRHvChjAkMM6lta/7OCephGCnHSKnNuRBUFsDMV3ZdIGZr3ZTmdF4xj
         HKfUH+SEfBCdVysfDpT/yQCkLlAy2E64ra7CzOkVJegjjbCckH2pEqnCvnuzg4Sad2L3
         Y/7x16n55CYBF7AraoYVFbsyPYKLphJCjZn1be2sNxxIFT6lzwlYeyTLB2jkTPZJBU2Z
         S2PP6VAw45kOAp97Eb/vpoCNf3p4OZplliZV27OJ+WVgp1tl3gHo8/2AUUtDfXfq8z9m
         Mqb+sAULBmRhAFqrs0DifBlZjPt9/w6oRuuSqvTjb6lmancIJDB1l3kCYN5jebTynVZ+
         rhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452299; x=1701057099;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2SzDHS4Anc4TP144jMRxtv+8IuyTWDlfHir9vy813E=;
        b=TgtwcqTVNRJE5tXIjCFRqwDgHtG5nEGVCxlbkwzoz0m+Pwvx3Od6wCFtVyVkshXEiC
         IuVUBDBaQzwFh/DcJT9GyxkiKVVc7ZaVerdnwfIGBtiMnc/mrFIorKLZ7gPk+JCczjO/
         aaUwc8FMboyU+bpIFeUdBCABBO9KK5iZ2F8//lqEh212Y/liN3oQlrVsoHGiL8leaEk3
         BdzOvnYTnRFh14ZxNubUTnplRgoD6Gbssd/zNXIZT+jK4UxArXCNbas0JJpeKVQ8y2ox
         lBgtocfDcYjt49sYfQpAyZYsqlx5Icn7PiXendN5WJvbfNRbm7NSD2FroDkkDarptyHQ
         zxog==
X-Gm-Message-State: AOJu0Yw10xW680/Bw635SIfa/xZ+89e4bf1bRYxRHYQN1scqzrwC9tts
	uPjm4kk1eCuc1P8Hb9dgt37sJ7+37EUg8A==
X-Google-Smtp-Source: AGHT+IFEQ1T7024PiVL9+bx3PNfMfsC5Fth3dXuc/OVR+J5G91yu/ESQ1QCacoe7ZGeWfAfdfi0T+w==
X-Received: by 2002:a05:6808:2f1b:b0:3ae:2024:837b with SMTP id gu27-20020a0568082f1b00b003ae2024837bmr9964457oib.34.1700452299224;
        Sun, 19 Nov 2023 19:51:39 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231118095225.222275-1-alperyasinak1@gmail.com>
References: <20231118095225.222275-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCHv2] ledmon: upgrade 0.93 -> 0.97
Message-Id: <170045229832.1416826.13757346407449668144.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:38 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106954


On Sat, 18 Nov 2023 12:52:25 +0300, alperak wrote:
> * Added 0001-fix-build-with-clang.patch to fix build error caused by missing 'value' initializer
> 
> * License changed GPL-2.0-only -> LGPL-2.0-only
> 
>   - LIC_FILES_CHKSUM changed COPYING -> COPYING.LIB for LGPL-2.0-only
>   - Changed license headers in required source files.
>   - Changed copyright years to 2022 in modified files.
> 
> [...]

Applied, thanks!

[1/1] ledmon: upgrade 0.93 -> 0.97
      commit: f13feb0adfe150c922756eef366a69ccb1f1c49f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


