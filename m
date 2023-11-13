Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC75C07524
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:33:51 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.3211.1699900424104572997
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HF377ENI;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso4767043b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900423; x=1700505223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cbl6A4IYcn/JYXFxMK8+YKMORVb+lSmHJ7Z+mLi1cvA=;
        b=HF377ENIBIwKEX3E0VLBy9rzxhvGc3lmZePZcARFCV67SGSQQBBBRSVcvMRkewBHzl
         zfcSwKmnN2zcqVC6R9/CmMe0UD3xAgGLrSbjOB4A15lez6VcnFSVzcQ858tY6TLsQwuD
         69re36EuP8ZysMB7lrAeslyuZV071RWcdnH08Ug068kZlXqdPvgL561adLkUk8Jg7T/k
         vAFIxUZfvX8sp21I23f1XiTFtzTXmAfXS0ew9Bk+X14w8/fe8SnlQVuJ9zFZ32W7K2bC
         w7IDPhylYSmeNXVH55bOApBCtgbphy1z9Me1PHBUWZV1e449bn5CrgzdKFD3/a4KGVpd
         HDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900423; x=1700505223;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cbl6A4IYcn/JYXFxMK8+YKMORVb+lSmHJ7Z+mLi1cvA=;
        b=XiVs2+KLE+tw8oa3RAHVBCUu7k0oFvtCE6RpQbyMl/YAsCvsTuc0Sb7XpqcQw6/nK2
         EUHSpvDtBjsSh5r/8hyJCZUOM9CkolmK0qBf2E+S0Ff9YDtkfadO83iTZ29qMsuwVIvc
         vrvEc1dyeAQQoFAi8JIyId+2sLWG8pvOoxvKgMF3qkZiAEVYg4jKxJbdCgF9mTU2po11
         syewsEVGw4EJWUn2wMHIrDj7RTQo5ZhwsfLMnMXvFzRfkoiXE3jiu7fQFQ0zgMTiB5vT
         +XJ9kp9yHHbqe1E4u5I8BiAf2VfpVWxv5Ivip0zuc0E9Z6iolivzSPQ//lDWpguRuPLh
         pnPA==
X-Gm-Message-State: AOJu0YwZIDMKPmfToA/jt1MYcOHYSaMkjPDWIOFN9M2NQ6dobmSCbv8g
	uGBlceigeK8RbLosbwsl3I1rfCmqaX+Lsg==
X-Google-Smtp-Source: AGHT+IFqUle2emDInfQsDRmOYFRtWU4/U0ga+MT3oKpBozwLMik5Wja+Ugiza2R05zxreBAJk9TNqA==
X-Received: by 2002:a05:6a00:c89:b0:6be:1f19:e604 with SMTP id a9-20020a056a000c8900b006be1f19e604mr9694322pfv.21.1699900423187;
        Mon, 13 Nov 2023 10:33:43 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231111194610.3426754-1-alperyasinak1@gmail.com>
References: <20231111194610.3426754-1-alperyasinak1@gmail.com>
Subject: Re: [meta-python][PATCHv2] tuna: upgrade 0.18 -> 0.19
Message-Id: <169990042199.4418.539658365180436505.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:41 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106648


On Sat, 11 Nov 2023 22:46:10 +0300, alperak wrote:
> 


Applied, thanks!

[1/1] tuna: upgrade 0.18 -> 0.19
      commit: 03e10516e8876db7e8ae866e215d7e354ddf2a2f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


