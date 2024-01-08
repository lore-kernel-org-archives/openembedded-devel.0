Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16218C4707C
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:56 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.31423.1704682012295367307
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=npaPeGrf;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d3ed1ca402so11748445ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682012; x=1705286812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kW0wKky9jdf+slxpY/ItSBgZxBXdHlx/syeJO7/6uFY=;
        b=npaPeGrflI6s/JmI5x1sKXRyQWCw3OtTCCmBuTj90Nc01aUsmDCsN3Ku6mrfWUja2j
         tuHXJna8CtiKPOFloEKqoLdioJnnJZ7KDMtG/hB5HTzHy8qOs1W3QFFkROmqoJuPiUQE
         Qg4UTr/nIvtTzh/HGieSQbjokg2L0kXLt6OqNorTprTQjCLLfyrvXrP1SZn/J59eM2hq
         Pk2tEYnE8NeS8NCsiSOb4OkbUTo5cQJDulAKu+E84EcPFcw+K8IIQghMzJ0h5PEmdUjq
         WDTE7DLs/zec9xL52/0xIRGc0uHm3LUJfOig9DEqu4K2H/UK/WXMlP4xVhHPMSXwwCHe
         kFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682012; x=1705286812;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kW0wKky9jdf+slxpY/ItSBgZxBXdHlx/syeJO7/6uFY=;
        b=U0pYGCrNB+oHs4jb7Fl1I7D1xpDOkq/r+2Xz+LSOv12rYNLG0aYCGyNPez9V0TTzIU
         UeUIDpVTdogwrP/V+Aaa5dcZckqyClnU3c9tKQAGaBDTgz7k+NewW0E6Hd9yoCl6Wikl
         /XkD/croXQlVIVTe8UhVGJBlyHcwC2Dbgt4buqn5B2Xc2vtQiOS9RY9KhwQ/rIuWETuK
         Vi9ovekmoVIAClHOO3I+vMKLI4pJD0BjYFrbRAGEUPVx4mDjPZIl5YDU0pKSUWDN0tXa
         W+gVAbP0OIbh/nYiuQmWYX3v3rveFVfcEgRQUhYSX3n+4L0BSh0rIzzYT7HtDBJyG3NI
         gD1w==
X-Gm-Message-State: AOJu0YzyTXOSdg28Wds7EfWHu9/Dvm2aZ/a9Q1YoVUWTlneVs59iEMMi
	spjgI5HjJzHPIapAQSeZrRg=
X-Google-Smtp-Source: AGHT+IGFfmXUEmPDLm6yK3AxLMioEJZZywlZX1MBXAzOfXZcUn1M17T5MRyoJr9zlEGrxpcI/dm14w==
X-Received: by 2002:a17:902:db0c:b0:1d4:83d5:71a1 with SMTP id m12-20020a170902db0c00b001d483d571a1mr3646889plx.110.1704682011739;
        Sun, 07 Jan 2024 18:46:51 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704179026-7898-1-git-send-email-wangmy@fujitsu.com>
References: <1704179026-7898-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] imapfilter: upgrade 2.8.1 -> 2.8.2
Message-Id: <170468201112.912276.8779141885540665534.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:51 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108094


On Tue, 02 Jan 2024 15:03:46 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> - Add IMAP support for UTF-8 (RFC 6855) when "charset" is set to "UTF-8"
> - Don't use FETCH FAST macro use for better compatibility
> - Bug fix; recovery mechanism error on Lua 5.1
> 
> 
> [...]

Applied, thanks!

[1/1] imapfilter: upgrade 2.8.1 -> 2.8.2
      commit: 2667ce85d0a622c99140fe1e755d6ebdc662dee5

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


