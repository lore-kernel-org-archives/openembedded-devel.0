Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046F2C07E97
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 05:22:34 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.26229.1701148945759380029
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Nov 2023 21:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JdTJ48vd;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5b9a456798eso2976311a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 21:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701148945; x=1701753745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xoypaId4eVjBmCNVoQysEERGj7pU6y52XxNrvCvPvNg=;
        b=JdTJ48vdr2McYbQs2ThgdiTU0uPKk89lcTZ/GQphQd+b+1yBco6tv3DxTzm70UFTuj
         GlTRM7SfOg514DYjgdp+z6KgeX60ic5In+jk11oNsBcUE1K50xVeA6dOT2bCjxMrDO5C
         eUS0rpUlvKpTmb+syb6TCHmQSatbN82qdWTvWCYVu3jnXeeiMmQOCGUY6NAF08YAIwtB
         es/DiBqBfB42WqA4rX29VLgI081jlrbFy4hfLRZsLVlkJLPipnwS2EDAn2AVHjAu175y
         RhX6r4Ch+W/lcGP3AJZeNqYuhsstX3QUXRes/GIyqE3j5yiObEwR8iG4XBvUrugADF4W
         /OjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701148945; x=1701753745;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoypaId4eVjBmCNVoQysEERGj7pU6y52XxNrvCvPvNg=;
        b=K5p7osIlazU+I50b8wuCaBcO+N+mMaD9GAlus4eodRWcTfpzKpSESEci98nbEDUvEJ
         Rzt7l+8LbQsCQrK1VdgieusyZqurR0p/ARbdxNQpVMq0WCK//UZeBHRtWRNf3J2UNNBN
         flQomGt/B40dTlFhCzwzOLL0XQ4UkPVSdLWTQvjDhw4/gPVM5LnJXHLMsGaiHghCFMeD
         BfKKGSvtNe3upSZnJyLNcxin7Wagcd+JJ7AhKhSGLadYox592zKIhNsXXSS4DsrzKdbv
         S1HNLS2VySXCGa0+5mim62ePEf63ksMQbe8vw258/9xarlaOAeM3v0MCwn4EwM5r6ASw
         zRZg==
X-Gm-Message-State: AOJu0YweCF51yJ8oCdvvA3JvQcQALI1LRf87NouIU+Zje9/P+yCQabTl
	7XomlWDKQ66q7/bBS8K0RMtqIyFFc94Xeg==
X-Google-Smtp-Source: AGHT+IFpNLjWSifb5hXn6lLdFZChTZC+48gxPP5VQ/L74C1PzPI245SBGSa6sxAhfjnyqeZyoTj7PA==
X-Received: by 2002:a05:6a20:3d11:b0:18c:4800:b0ac with SMTP id y17-20020a056a203d1100b0018c4800b0acmr8840596pzi.23.1701148944548;
        Mon, 27 Nov 2023 21:22:24 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902e5c600b001cfde4c84bcsm1608485plf.141.2023.11.27.21.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 21:22:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Peter Kjellerstedt <pkj@axis.com>
In-Reply-To: <20231126055440.2844048-1-pkj@axis.com>
References: <20231126055440.2844048-1-pkj@axis.com>
Subject: Re: [meta-oe][PATCH] redis: Inherit pkgconfig
Message-Id: <170114894374.164097.13059047132110560680.b4-ty@gmail.com>
Date: Mon, 27 Nov 2023 21:22:23 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 05:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107064


On Sun, 26 Nov 2023 06:54:40 +0100, Peter Kjellerstedt wrote:
> The Makefile uses pkg-config if USE_SYSTEMD is "yes".
> 
> 

Applied, thanks!

[1/1] redis: Inherit pkgconfig
      commit: 0d6871a86be6f791180b7ab6bdc6673c4f6368b0

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


