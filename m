Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FD5C47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:06 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.31450.1704682025947831551
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jSv4TiSy;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d40eec5e12so10714165ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682025; x=1705286825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+2CspRvFiBsXJgPosj+DVGiMYSrm4TmfS3JUkADR8Q=;
        b=jSv4TiSyspR1/DWsa16AshLk5O6WGK/Hap6p7Myn1SmvJ6BeZpKGuA+a/ArnGCT/rK
         PV8txkkOFIFRG4pFrNN3sK8TfIiejsYntVnabkhHN+HFcl40R0pTdijGid9z1bnY9UE0
         s9LXkwLqDfNs/+o5vESyzQN+RVCCwxUnyhnkuQLeAO4ZLeCCtOzinMJhKN903TpupsUr
         C/2LgLHEijCm+zPi6AlCSu8UwlE5vMW61eqC9Pggfel+46G7u3q71U/lxA3DJU23M43n
         asJ8AiJBye50QRro9kJTvLnWqZz3f8eI2M/sc/7n7DX9hSOS7upBZ/F2hbQFw8xZxWWB
         Qcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682025; x=1705286825;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+2CspRvFiBsXJgPosj+DVGiMYSrm4TmfS3JUkADR8Q=;
        b=sWhxbJl3mczzbFHP1p1tRM+7NGVKI9skmCoZ7Kjqj2lisaFSyETEGBhBvG2ylwKbWb
         JeGYppUwVzb2mVGnKIz9cxyGlDXZT10KWmq7uV8beGo525atJrMCUhhoiA0OFJjqaAbe
         qvCeftfGSXS5VHv0I1H4ZzfK9ZCkBKowHVh97CbTB/BKw2RbyfpZODl4ql9p/t+IM0Ri
         dBkwQ5e+y3ocm+FKyVIQbRi2HU455JJ5SIiFqLv+rcqB6p4vWEgvWpxtfA8ZDyeBdgQZ
         Sz1CgH//FGEpZXbZYHI+805I1tR3n6uRTy9sfdqQeqENVo66fLtj2qBc6x7T4lad63EW
         qf6Q==
X-Gm-Message-State: AOJu0YwfZvyJr4BWTjyBGcZRbNBF2/ZNo1uKq/PffJ1yabQGfNkG+VwN
	OXtEz79s3tQMGqcM+GYbrxQ=
X-Google-Smtp-Source: AGHT+IEYnL1Kbyq9kHETa+ay4EuQ0FNKPRpvMc/VyOKWqbqCXqPzjp3w9wo0yALeGasX95r2//aTqA==
X-Received: by 2002:a17:902:e5cb:b0:1d4:be62:f1d3 with SMTP id u11-20020a170902e5cb00b001d4be62f1d3mr3810216plf.108.1704682025328;
        Sun, 07 Jan 2024 18:47:05 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <20240102185410.3720762-1-leon.anavi@konsulko.com>
References: <20240102185410.3720762-1-leon.anavi@konsulko.com>
Subject: Re: [meta-oe][PATCHv3] ssd1306_git.bb: Add ssd1306_linux
Message-Id: <170468202470.912276.11492817766889533361.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:04 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108111


On Tue, 02 Jan 2024 20:54:10 +0200, Leon Anavi wrote:
> Add ssd1306_linux, a simple OLED I2C SSD1306 Linux driver based on
> the i2c library libi2c from i2c-tools. Example usage for a
> compatible display with resolution 128x64 pixels:
> 
> ssd1306_bin -n 1 -I 128x64
> ssd1306_bin -n 1 -c
> ssd1306_bin -n 1 -r 0
> ssd1306_bin -n 1 -x 1 -y 1
> ssd1306_bin -n 1 -l "Hello World"
> 
> [...]

Applied, thanks!

[1/1] ssd1306_git.bb: Add ssd1306_linux
      commit: 13a1b1b1a56b41d23933ee5113a338ad5e5156fc

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


