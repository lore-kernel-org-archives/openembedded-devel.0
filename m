Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843A1C07E97
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:28 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.14515.1701215721290329553
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hkhUOk4N;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1cfd78f8a12so21813835ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215720; x=1701820520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsWQCKQvB2qhcgxBs2C9WlTn6IVqXU04j9wBGFtE6aE=;
        b=hkhUOk4N9AdC0wb9LDmBWHebX4tyYrte3WA8Qsj9s/x1JWOPO4RDrigpj/rvY9Mrp9
         qMx6hZHU6X3+tJGA7blts52AiWqkm2SmRNAgr+Hmmleeghi7edRgw0Tk0iQ+1ncOfJOQ
         RXSnKdn/uOjWgbpF/iorKwh24PgH8uvmKwReGDkqZQSiy7F6fCd0DJ0Ls0uw3FrnhXRO
         PPA50dcH5B93DPChrpPfqvQ0/+C3MuHkjwGkb47Rx82mGyGLb//pC8GPz/mapIG3uots
         Y92LIX6wCJPkOgPGd0FwMSh26UU+GqDjf9GlZ1NbEhRmY4BQV6Uro8/ZLKExO55b2rq4
         y0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215720; x=1701820520;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsWQCKQvB2qhcgxBs2C9WlTn6IVqXU04j9wBGFtE6aE=;
        b=Vp5PgnL1Rwe/fpnAd9o/UzPuboM+SE/HmWnWghH1jg/u9l/EBa5a9i2tHa7Lky+ULt
         3QmYkH0EiUzrnUb5zdhnKiKotuLwuBDMGgNZO5zfsIxiqlqRGemwVuSPg4U/hmbxSRZT
         qIGiTnEPxbmr3QhLNeA5IQa2FYXbtV6On14P3eluX/5eSxgesdFoIpTb1JpFjcO9yIgK
         6ztdPnP7DjAOV7VMDUIx3cbQXHLf4E34ft1ekTO4SH0onc/+XFcDUxqSl2hvOW+e3tmA
         2CaOUU14HS9y+7DedSJJ4OiWF4PBrloShEZb4/rc0YVBupJBEN/XlpGpYQSabuKRNqAN
         oGmg==
X-Gm-Message-State: AOJu0YxrPM2kewDr7NXu9rJzvsXVZaz83MwuYZajiyos1rJjZRBH/I/8
	eLVWL8+VGF9pKnFsOKP4E4C8Pb3INYiSfg==
X-Google-Smtp-Source: AGHT+IG0mjtrzIHVCkDfrXjaCo9ZzskalZve4DNqAr+cKZMbni18z+WN/PIWyZO57fucYQpx0kEdEg==
X-Received: by 2002:a17:902:ea84:b0:1cc:68c1:cab5 with SMTP id x4-20020a170902ea8400b001cc68c1cab5mr17870733plb.14.1701215720544;
        Tue, 28 Nov 2023 15:55:20 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701159901-28014-1-git-send-email-wangmy@fujitsu.com>
References: <1701159901-28014-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-aiohttp: upgrade 3.9.0 ->
 3.9.1
Message-Id: <170121571927.1187527.12132451500629754297.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:19 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107109


On Tue, 28 Nov 2023 16:25:01 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Fixed importing aiohttp under PyPy on Windows.
> -Fixed async concurrency safety in websocket compressor.
> -Fixed ClientResponse.close() releasing the connection instead of closing.
> -Fixed a regression where connection may get closed during upgrade.
> -Fixed messages being reported as upgraded without an Upgrade header in Python parser.
> 
> [...]

Applied, thanks!

[1/1] python3-aiohttp: upgrade 3.9.0 -> 3.9.1
      commit: a75bbe3862240d7b5a4e36bebee9b1e8e76c2834

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


