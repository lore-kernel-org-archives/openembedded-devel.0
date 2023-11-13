Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3956BC072A2
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:12 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.3159.1699900444650926553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DjDWYp/d;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso3630452b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900444; x=1700505244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=089cyy2fehTAG+YffvDp5Ji48eI/REggS+JGbGJlcFU=;
        b=DjDWYp/dexctr+aiZh1S6txdbxDSeq5diMr8hWCivwZMEQWMmGQqO59IzyU4xoEvYh
         +7PHoXh8sydM3ZnXQ1NosU82SwqO9VOEEloHLYEjH8poAc+f++VyknMqQ8enEf9tjZTZ
         3YAU0RLMk+2BHKVengQ5ZTNNw9/Niask7eMzrH+c9DxaK7KBvhTywCFWAant9nFqxRlc
         72ytFwQFTJ4AMD6Fr/cq46pSFzfHdblQLQwXOO9ZZqY4zUJTnzdBOFA7ZMr6+7GlgybP
         zAW6YFrLaphmSABMU6Y2wuIjxiP85TAD2JysPkaN6b45Q5ZnUmqTL18cSMbqwwGsfQBT
         uzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900444; x=1700505244;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=089cyy2fehTAG+YffvDp5Ji48eI/REggS+JGbGJlcFU=;
        b=AoEBNudwjpHwAjZc6oOW99wbM6P3q9Z/9KHZY87/8M3QQNUp0ysZTBsp1EVt51KutZ
         IaeKagZie4vdW0pK6druuVYv2TYsRio+R8mQLoHrvicPVVVae1HU7yS1tBJ6jkt73243
         OYcNu+wbowvppsCPCJTeH/6xWKCUJzq1Zzr4ipbnb4ZMAECeZ/f+ypv8cosW5TTsPQI8
         YrgIrAiN54626Vg2LplDtI21Amx/Zepje0eYSkpnIRifBgQhY+2S1occPcmKmSJoWlmw
         6z0EeskjT1XV1fWY6WEP32PHCtdX/OaEIo1OPY5O5/yDx/NO7QqAorCS/VNDMGw46H7+
         Kv1g==
X-Gm-Message-State: AOJu0YzKO6n9eOmoRGYF+7taHJAoWT8Ih8dEeZ5dND5cAEfjbZXl0Yt8
	FzTtW9zLq494MTMuNOgBjR+8vz9nOWs8nw==
X-Google-Smtp-Source: AGHT+IFIyT/ANGnQ7QtCoL+sN2GE7XU2tiopGzPBp/vdf9Rz8tC2Zs6DwX50yyoOES8l87Xvt7twLg==
X-Received: by 2002:a05:6a00:8714:b0:6c4:d78d:498e with SMTP id hj20-20020a056a00871400b006c4d78d498emr462075pfb.2.1699900443743;
        Mon, 13 Nov 2023 10:34:03 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:34:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112200451.610152-1-alperyasinak1@gmail.com>
References: <20231112200451.610152-1-alperyasinak1@gmail.com>
Subject: Re: [meta-networking][PATCH] civetweb: upgrade 1.12 -> 1.16
Message-Id: <169990044289.4418.17847146329656884233.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:34:02 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106668


On Sun, 12 Nov 2023 23:04:51 +0300, alperak wrote:
> =========================
> - Added "-DCIVETWEB_SSL_OPENSSL_API_3_0=ON" because of following error:
> 
> civetweb.c:1561:2: error: #error "Please define OPENSSL_API_#_# or USE_MBEDTLS"
> 
> You may also want to check out the available CMake options here:
> 
> [...]

Applied, thanks!

[1/1] civetweb: upgrade 1.12 -> 1.16
      commit: fc60d791b82b306ae0ba154990fa94ca91ac84ee

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


