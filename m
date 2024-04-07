Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D25CD129D
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 15:43:16 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.82167.1712504591957988137
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 08:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ghB6Lsov;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ed04c91c46so1909989b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712504591; x=1713109391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9mnov6FGmY/p95BNMaHQKn119J0yIcM/1cBQjBEvI8=;
        b=ghB6LsovdLn/kZMT9gPOjuwtF47eir6tJ66WycupNUItZVGwcrNmuoajKsi/OVoD/j
         uY1ToAkAhXkALF+1aos/i+KmzSdcod9Uh3HRB0oYiW42jD865xnuL7tLI5+mViy+iqq4
         prw7k+Dnuln/YkFeqsdjpzTcBOb66Eq/zjnwRlLv11p5+bufsOXvkOlA8/dnOcfgsvMu
         2Z6XfNvn6gFrxlt7CLO5MeqCtWkl7rSo0t0+zCG8uRf4rYsSZd10Y1M1dYXPZwNgHwmT
         f4pt09Vk92IHkOF9cQzih3XQqCajRTK+geATqpPADc2Pavf0Iizjh9IWxsP/nzYQMlxx
         VxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712504591; x=1713109391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9mnov6FGmY/p95BNMaHQKn119J0yIcM/1cBQjBEvI8=;
        b=gGJyzXzF6bq4RzTQZ9onPP0ch2qatiI99CcjwfDKpCwHmrTJ9oP/iVutL3Zo6OvUwV
         fU8UyZIJexN5Sj89VPKctHLBurBoRUKr/5l9mQfp+UnbAmFerYXgINdDExlPpRqn1fKq
         NJ44CGJYZZaTUwsspoW/mBIfwBKIuqBBO2s5kpi2Orzo45aWyXd1kLMkXRrYBE8Ydam8
         i9Tt17fATk4kV6gG8N3rm0JOW5dvUBiT6WsyKqfZ2KSPzOB/rwqCeepA1gyKSq7gU/YG
         EBN1ZEwAOA96YGDZc02yaX6ew1Op4kILwddbEZ6G5ydLqKwx5y91y1zXRVsHXBDvEESE
         OXzg==
X-Gm-Message-State: AOJu0YzFw+n4zdCTc1bUedfAM/RoE0oGUm2WWdK3ZALQhbsDKOOkcOwY
	f6zTBAeFD5vaQqjCPUqjgcwDguT/QLzKrT2Lq/PSz0JWRsxguWhCFd/661R4
X-Google-Smtp-Source: AGHT+IGcdgxjTuskAY5P+k7fET8TfSL/z1HgHvccyNDX2dsOasHcbW1rj5D9MS1cx5MH0iLsHUmi3A==
X-Received: by 2002:a05:6a20:a12a:b0:1a7:4a8b:afb1 with SMTP id q42-20020a056a20a12a00b001a74a8bafb1mr5675949pzk.40.1712504591106;
        Sun, 07 Apr 2024 08:43:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8384])
        by smtp.gmail.com with ESMTPSA id a23-20020a62e217000000b006e71aec34a8sm4760473pfi.167.2024.04.07.08.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 08:43:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Dan McGregor <danismostlikely@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	Dan McGregor <dan.mcgregor@usask.ca>
Subject: Re: [meta-oe][PATCH] dash: correct licence
Date: Sun,  7 Apr 2024 08:42:57 -0700
Message-ID: <171250415788.900727.17338974751023304225.b4-ty@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405170025.3299913-1-danismostlikely@gmail.com>
References: <20240405170025.3299913-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 15:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109848


On Fri, 05 Apr 2024 11:00:25 -0600, Dan McGregor wrote:
> According to its copyright file, dash is only BSD-3-Clause. It has
> a build time tool from bash that's under the GPL, but only the
> tool's output is used, not the tool itself. So all compiled artefacts
> in dash appear to share the same licence.
> 
> 

Applied, thanks!

[1/1] dash: correct licence
      commit: 8eba35f8b03659ffd73aceb52b6e78da8661a6dd

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>

