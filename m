Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF37CCD11C2
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 15:43:15 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.82171.1712504594858437816
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 08:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xlhoq7mc;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ecf8ebff50so2005243b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 08:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712504594; x=1713109394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnpfN4uF+REy+HflOFBg6+EeoMnj1Y7G8CQ4l1AgvCg=;
        b=Xlhoq7mcKiHugAbbj+MRLr5VMvHIkMHIdEJJgsdDOWaQAW6ScZZnrCtfTLD+Hx8K6S
         LCh/opHOeZOaL65SkvtbcYq/idpjqss38X24Pqzc7DeCak238J68f9ODQ5lBFHceXhgK
         NVgdyncewtPKjpaJBFID0sJumpk1buFn353vnfT7wIbk4TBp3Yjulg01CsEgrJcMs7GP
         HMRBFMuVw5FPf+jow5eyV+u17xxKh9GNdya+2540aNFict6s8p9ZWT6k+qxCaJc9BKq6
         QoBgyI7Ps8Q+neUtoREc0l0j4P6Dk89HF8IR1t5LM5idbrM0U/WKe75zj3xMIU5+I8EW
         FO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712504594; x=1713109394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnpfN4uF+REy+HflOFBg6+EeoMnj1Y7G8CQ4l1AgvCg=;
        b=nYqNu67bF3ztzVg03JcKFnLh4thI9DqPYmCZKH8kQghQIeBI2k0Qw0VDbgSm773wTz
         zTpd0Q6ILxeb/jxO+CSAszeCJtK8i7ZqYHe5JrtOKnkJ7MYwlZcyBacOcv7HDxn1twpP
         qrtxBV//mODfWS/EJAVmPZTcloL6sC5XFm3t9IWjEzLUMkmEb3K0/32kE/Nlryh8cJix
         zzfZkd8EzF4Zv2m7y4g/xenix6IuSFQ1wMqHBdXK82JKY7qs6ujt+uKE83vgMmR/3ZqG
         gdFmXcbCfXXoLVBHhqv5sh+kVo2GHZEScUgv7+bq61UiwOUvD7mPkaojUNxIwCXin2Oy
         8bHQ==
X-Gm-Message-State: AOJu0YwCOE+AJF07dh1RSbVpJCGa4ARsXqBbXFIzbBSX0+R769IjRuka
	dDnaMbFkjeH66y4ymfEYbJjPIs2pqVLEgcIF1OxD2KZa2fxw9+Azima//T9s
X-Google-Smtp-Source: AGHT+IEOJiAesTE5trNKnszTYyIKviEBMKyI2sdl2u0zmYJ65MOueAThD0ho18tt8cMu75IVYCrepQ==
X-Received: by 2002:a62:8495:0:b0:6ed:e1c:1038 with SMTP id k143-20020a628495000000b006ed0e1c1038mr5428596pfd.7.1712504593976;
        Sun, 07 Apr 2024 08:43:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8384])
        by smtp.gmail.com with ESMTPSA id a23-20020a62e217000000b006e71aec34a8sm4760473pfi.167.2024.04.07.08.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 08:43:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Yi Zhao <yi.zhao@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH] rocksdb: fix build error for DEBUG_BUILD
Date: Sun,  7 Apr 2024 08:43:00 -0700
Message-ID: <171250415786.900727.9987553345509256302.b4-ty@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404125118.3067969-1-yi.zhao@windriver.com>
References: <20240404125118.3067969-1-yi.zhao@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 15:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109851


On Thu, 04 Apr 2024 20:51:18 +0800, Yi Zhao wrote:
> It fails to build rocksdb when '-Og' is set in CXXFLAGS (e.g.
> DEBUG_BUILD = '1' in local.conf):
> 
> rocksdb/9.0.0/git/util/xxhash.h:4491:1: error: inlining failed in call
> to 'always_inline' 'void XXH3_scrambleAcc_sse2(void*, const void*)':
> function not considered for inlining
>  4491 | XXH3_scrambleAcc_sse2(void* XXH_RESTRICT acc, const void* XXH_RESTRICT secret)
>       | ^~~~~~~~~~~~~~~~~~~~~
> rocksdb/9.0.0/git/util/xxhash.h:5139:19: note: called from here
>  5139 |         f_scramble(acc, secret + secretSize - XXH_STRIPE_LEN);
>       |         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> rocksdb/9.0.0/git/util/xxhash.h:4177:1: error: inlining failed in call
> to 'always_inline' 'void XXH3_accumulate_sse2(xxh_u64*, const xxh_u8*, const xxh_u8*, size_t)':
> function not considered for inlining
>  4177 | XXH3_accumulate_##name(xxh_u64* XXH_RESTRICT acc,           \
>       | ^~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] rocksdb: fix build error for DEBUG_BUILD
      commit: 11c7659ecc5f8992740119bba6f20642d07cd03a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>

