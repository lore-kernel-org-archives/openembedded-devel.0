Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A69C5B55F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:25 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.43644.1700452280469564998
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=du1x+sO+;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6cb7951d713so530554b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452280; x=1701057080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Sn2seGs1BbNl+yHdDCBoDj93sD9AHoLSfhh41+K0+8=;
        b=du1x+sO+rLetN/tFpOJ7edO/s2y7pToUe44ALkP4zA/XUbgl7rt7aEWt3y6VkMKDz4
         IxsKv74xctWyKyjKsr0KbAIMWVyOt5uC5aKhnNqKPJL+nAGvNbe6DMv5cbnibOBLGFBy
         YtIPdIAIF9RI31pO1u5x54IN6w0SZjx4mhX/SImHr8RsLW4hn8Vk4Tcj3V9wBQZWsK+M
         OTtErCAxpHcc+qPPHhugxAdAVu8JEn4b5cs5gY/MO5cS1SwXog+Nn3JeniVFbjQcPsWJ
         dloC2jM9Krcuf1jN4wyIv7k3E4RUl7tMT6huvNGE7pHqLYOwsGeU8oZZ6S5aimFESJ0d
         +mjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452280; x=1701057080;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Sn2seGs1BbNl+yHdDCBoDj93sD9AHoLSfhh41+K0+8=;
        b=q6oUQEsPC1Ij/WQMgmxCHL+dwkHq7rYp0uD7y1fD3kzHqqBLV5oN1kyUlhnelV+/j/
         07fUx5b3aMTCHWChN3ypKT45iAEHBSU8zzh+MIHxAYjta1JLcIxcpNo3htrCY90Mv7/B
         w/Uv2S+QAEdJNB8YTZI1p1u5Sb+t4MHwhflk0ncb/2GW5q6rGAu4U4ct+J/arWbKQO3i
         /uyhCvXORL3aYfIgWwITxMaC3LfLcoGqNjOFJ5UG43w3wD1PVg9yJY/3rTshu/nTIYTm
         xfUC0ECdV8IzHWXyvPKERsy77hxSLx3LjgoW0LPzQTN+tsWzGs7v31as1DGMMYuYb289
         FBrw==
X-Gm-Message-State: AOJu0Yy/neDCZU5Sgy0+tdGYSo09BB6Fuh2gSB7bFmN8mRZy/08DGyxf
	asGMYrPNxuYI3s6r80bv/EQ=
X-Google-Smtp-Source: AGHT+IFCPOqBiMptdmf8lsXwG/sDh3qc6vr27sYpqdJ9GUJ1Q2TEBMi6oh8EX+zO7wQJv9waIaHxkQ==
X-Received: by 2002:a05:6a00:1d26:b0:691:27b:15b4 with SMTP id a38-20020a056a001d2600b00691027b15b4mr17915873pfx.5.1700452279745;
        Sun, 19 Nov 2023 19:51:19 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116123546.982858-1-alperyasinak1@gmail.com>
References: <20231116123546.982858-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] opencl-icd-loader: upgrade v2022.01.04 ->
 v2023.04.17
Message-Id: <170045227885.1416826.2714963617164896895.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:18 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106935


On Thu, 16 Nov 2023 15:35:46 +0300, alperak wrote:
> Changelog:
> 
> - Synchronize with OpenCL v3.0.14 specification release.
> 
> 

Applied, thanks!

[1/1] opencl-icd-loader: upgrade v2022.01.04 -> v2023.04.17
      commit: 259491990ae65e060c5e8cfb50d34b788da30825

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


