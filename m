Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D47C47074
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:06 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.31431.1704682016407874330
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sth48R/Z;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5ce10b5ee01so791050a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682016; x=1705286816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jewl1um4JLAM1U4NvAZ6x+C/fcFTK3oMQt1egzdhlsY=;
        b=Sth48R/ZxSfqjO3v5CGR7sK3WkhGLPk0Ll/cF25X15e/HVGjQzh19qLIy4a5rRlv+b
         Qdil9nevYElsdnqVgYo/GGwzs/coIihIJGuQJWVn+cF/pdFupt03oJTsYSurz2a3XEq8
         IRLUkwHQ5vf00L4O5AGSFX6rupCiXrBAOf4H5kaXUuVtChL9vxs12sQlWFVFcZo6/yk/
         pTazpOPmtEYLCGwyXoX3aRV9SxvCVvs+zqxWHi/EZN5Uv/2EXJrf2Vbm4ey06ZyUzspK
         bw9YrO4kv9kO1+FiHILvfjnF0n1Tr8k88sb4t32x7gt5kll6HNZyzstcoOP79JMrrqeO
         F9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682016; x=1705286816;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jewl1um4JLAM1U4NvAZ6x+C/fcFTK3oMQt1egzdhlsY=;
        b=biLLGanJKKlSodf2f5yuvcU4CpZAiwyHYDP4gmjkUGF5ZChItKblnY0THzjpDf6yNr
         R/mDTzxPUFQaeI3iCiJo+WC/PBSbzrGgEXlfEgQ5LWoURNoXLuScRy1hU0RDvKX2sWQP
         DvFftF8z+EAzp69nZqCozTm77qz4YFQSd5FEoPJIc9S3KyUpzqToU1ZWLZuuqIIgsmUq
         w5gx6QBiQaDuWbWcfbYcyjoOO3QJxXdCXmYmZ/6nO5KSsfcn7YA7H9+G4oLCnZW/gFR/
         2Jc0Svh9YsUmWtgixjKsxi4vkdeV4lGBwJY2z30vZH88167R4B8QIjMOXOoXaY7WOGOc
         fElQ==
X-Gm-Message-State: AOJu0YwW8I/97HCBry0Ut0nAxJf8CiM1RE3JBMRYdqWc+z5Hx/vDJwTD
	oaLl6p81y3IYFeLCAmXnDznCR/JCGRg=
X-Google-Smtp-Source: AGHT+IG1xkrKasHmVUA+bQOJQwpSnYZ95wfmIlbftYA0jDGgEsfCKCmKN8ymNIAOmOns9LNEOKMqtg==
X-Received: by 2002:a17:90a:420b:b0:28d:1fe:2d26 with SMTP id o11-20020a17090a420b00b0028d01fe2d26mr3852364pjg.5.1704682015852;
        Sun, 07 Jan 2024 18:46:55 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704179257-8102-1-git-send-email-wangmy@fujitsu.com>
References: <1704179257-8102-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.3.4 ->
 7.4.0
Message-Id: <170468201527.912276.15123790989161707128.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:55 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108099


On Tue, 02 Jan 2024 15:07:37 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] python3-coverage: upgrade 7.3.4 -> 7.4.0
      commit: e17de9ffb93b97ab9a8d069b402133dabe0e5a99

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


