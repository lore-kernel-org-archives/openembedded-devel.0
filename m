Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05D7C46CA7
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:48 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.14764.1701215741793057325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HiNPkD3H;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cff3a03dfaso12876375ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215741; x=1701820541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aj5eKq5OLVEGvb8fqxw4/m5GYmRPdBwJcfnJ76Uie+k=;
        b=HiNPkD3HX5fRtszByfe+A7bNara6EFYChNgx9DWM0juLbWQxSUStMZxXeNnT+QDZmw
         TTInDQAY+wcctGIIIH1ZoH3LFJXe5iDCyIMBNts0V/ASXRuSD9EJ92sXezZg8ECgfphe
         gzSoTaV1FtBN10zc12X+u8thgTFEtrfRZAACwb/kbngvR13uqC/K+5CP/Fz1Af4Wjxoz
         l6EY0WAN7nBLiKsQHnLe976X3BDjR6Qd6tQ9fLAqTLm4m42YD7Vi8EGv4pFmhxPgSh0t
         zul3bILX72X9ORT2ztRx+x9Q4isiJfd23dbQZaQ2T5iIS9OI+v0jZeWQb/jqTMFnpM1p
         /gUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215741; x=1701820541;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aj5eKq5OLVEGvb8fqxw4/m5GYmRPdBwJcfnJ76Uie+k=;
        b=l1yxbQF2IZ+OUC3waGqjj7cnctJ7gId+pNwkcygvRqMpQevG0BmmMw/qjUD5LSwoou
         NgtVwtJM1mAY49fu1T9aH1y04afSZvlikh4TvmSDGrHxBbbTQy18BO/ltTR1zbr2t5oT
         3S5YSaxXgvV1VMEv9mR5iHMqBGkWM593JhzBeOnXH6HCxaXfWgT1jOVu+vxma5neUZrH
         b2oGuCoqht9+8NvpJ/N5bExA3mEaQuS2psPq3InhFat/WnrhMA5qlayHBYk8PdwepnuM
         cf3AWuqKUjntv6EPQH32ec22YIxbKCC6HJq9GIhzdSgaT+a+tvzGc+k6lkStpGwQfTcw
         ragg==
X-Gm-Message-State: AOJu0YwB5VX3/0SKHAMwXtZd0P3dBntGeCDEpS3rld8GpS7qeNzABP0l
	grLLnWUUGcfLnGXav126rzkdLTxUHqktOg==
X-Google-Smtp-Source: AGHT+IGpGHrlEj31OF60dD6o9A4m1DbYDMfQmfSbQaoIzBE9Lc64TnW7f4ZhQeBJOhjngLzed5/Vag==
X-Received: by 2002:a17:902:7409:b0:1cf:a2e7:f851 with SMTP id g9-20020a170902740900b001cfa2e7f851mr16523479pll.32.1701215741065;
        Tue, 28 Nov 2023 15:55:41 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231128095502.33820-1-alperyasinak1@gmail.com>
References: <20231128095502.33820-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] tmate: Fix finding msgpack 6+
Message-Id: <170121573995.1187527.2554446270630038759.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107126


On Tue, 28 Nov 2023 12:55:02 +0300, alperak wrote:
> 


Applied, thanks!

[1/1] tmate: Fix finding msgpack 6+
      commit: 69d80c3a192d494daf3bd7df7310d9f2fbb1907b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


