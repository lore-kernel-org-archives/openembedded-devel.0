Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67CEC10DCE
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:29 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.31062.1702451241321783547
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O/7BUUkv;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5c21e185df5so5574515a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451240; x=1703056040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISbl+dK62cLJAV/IlAqBgeUy9IvnEbB34cZtNNduRfM=;
        b=O/7BUUkvz5qdRNE+a4MXOPc+5w1sh9+AzzAOQXEQKIH89cw0V5VZ3DTAs0Fe1zWcTJ
         UcvDlkRjq0lucV765iLYzbH7vj2wfV12ZNaaJQkaKVkj905J8xJhJTu3PrEtdRRZnYgD
         pjb6zHroXbKZ3m4iH4jPPntyJMKO8qkJ82jqXQIHbh0SWAI9PDRsXgs023vgKV9AYF9n
         C8NCHpwIrVwca215LVGoWYVEFBsNng/1P3gTdxlgp47Ax8WNpLqJ/yWBK0C0h+QiSpPB
         2VWSJDbInbRl/g3Q4f6M1tDuMPKr8b69o2333z+PJ/7pZm7T+ZZ4gVKRh7slrp7JCzmt
         h0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451240; x=1703056040;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISbl+dK62cLJAV/IlAqBgeUy9IvnEbB34cZtNNduRfM=;
        b=MU2bWL/ufSmSvARv1G1qicpF96aRjm3RNVDvmIW6JHZheqjO8wzCUoTnGq8vyELWD3
         ZcVllCrE3Q6Jyfk7T43N8ySvmc52Z7rYG/bcwG2iNzBRLWSch8PmGG6UF8IzhYr5FH10
         N1LSDNDi8ntyaosre0Ij/fPbE2Y3FZecf41cgrkwKQOLyjWLy/5oirpUwmB1HvAybK7x
         fDFVPSN8gAWdaD3nnPhqqhMaAsh2+qCJzhBiHoP2EX/cT59oIOQcuvg0zxyRnGsAXvUH
         rE1NbNfa5U8fRE/NqPuDwt0flLeOj0QvF43KSmAt/Jj+BFNm8YMk0S+G+u08Ppl6I8H0
         CM0A==
X-Gm-Message-State: AOJu0YxB+fGr7BFyR/KcIUNpPf1LNm8iXGoQzrTDv5qCTMO5ZTNpI4Fp
	JE7Dlf8KZv4GiC4RVfBKslmxxiSxAA8=
X-Google-Smtp-Source: AGHT+IGafo/IbBg7d1+Z8ILzAJJ42UXpoK0JzCs7jp010yb/mV0vsMNdo8Ud7pKgWAXIOMOY8uGsQA==
X-Received: by 2002:a05:6a20:1445:b0:18c:aa14:ad4 with SMTP id a5-20020a056a20144500b0018caa140ad4mr9935719pzi.30.1702451240226;
        Tue, 12 Dec 2023 23:07:20 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231206132435.311230-1-alperyasinak1@gmail.com>
References: <20231206132435.311230-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] xlsclients: upgrade 1.1.4 -> 1.1.5
Message-Id: <170245123957.133993.11757209234150263190.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:19 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107357


On Wed, 06 Dec 2023 16:24:35 +0300, alperak wrote:
> Changelog:
> 
> * Resolve implicit conversion warnings from clang
> * usage: add cold & noreturn attributes to function
> * Handle -Wsign-compare warnings
> * Quiet -Wmaybe-uninitialized warnings from gcc
> * gitlab CI: stop requiring Signed-off-by in commits
> * Build xz tarballs instead of bzip2
> * gitlab CI: add a basic build test
> * Update configure.ac bug URL for gitlab migration
> * Update README for gitlab migration
> 
> [...]

Applied, thanks!

[1/1] xlsclients: upgrade 1.1.4 -> 1.1.5
      commit: 5b20a3c8f2b5c2f9c5270af964b08797c762d426

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


