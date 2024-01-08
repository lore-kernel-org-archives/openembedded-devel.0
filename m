Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E598BC47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:55 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.31430.1704682015750144578
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LllWqVtw;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6daf694b439so91536b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682015; x=1705286815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlUAcYkOfFn4RkBNUYy2QLJ/QZ+HnwS4UsqTaLxleG0=;
        b=LllWqVtwok+KInhlkwP//jar+hVZ5dBVD2KTVZNyNOTwUDutO2rAdoASbYd8CxtlsC
         Bsg6jY5NtMXhVnKT1YkOIq4imm7/IvMNJEAPy+bJzz4JM+F5ezpYNwutKppGCYi8QVGe
         dwRpNBfGoazBg5KPyDnJOdypZ/qhYmtrA/JCjHBMXhi1mKc3Wern9i64hMYH8yH5wehu
         CQ1QtfpXDhWyNUsQ1Kt3hQrJ191geQUQf8pm0ZAkUPTuT9ViMPPqRzdYn23wiJqduGQZ
         PYA7pCGhcAKbG/huYnEgOKdBABd23R4PKrH4//WQgeJpFwyeIk5DLdaZHvQJD7bnZO50
         2UXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682015; x=1705286815;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlUAcYkOfFn4RkBNUYy2QLJ/QZ+HnwS4UsqTaLxleG0=;
        b=WDMhd2jnOBrt8gleP/vvRgCX5vAVea4nU2yMJQefTW6HrhYnykl8ecjyq6yt0z+oS2
         lPZHmQHHxvO1f6ripKtv/Tdv5luPXAj41wqrIDqy/52hmNH1NBUAStHVabNp/3RbPYi/
         /Kj9VoDWeTFib9PsyGE5D+8IFbPafVyqsJR5kTwHYbwgmlltW2Pk7VpVbd+w9oCyDpZx
         6bXkpQFFZ6v9Gq3pbnqrC0HwzfXzLhaAtzxeTRVcZEr0Bxx5wFBHGG07tXMA1msSrGmA
         l6/RqbKiRqU6OQwcwLr2y/sA/l8ztDJbdOrj+wAwgqjnBXGPhVX0YoCpgoUjMj2rBbkd
         cNmw==
X-Gm-Message-State: AOJu0YwXl0lz+RjhnM3Kzso2Gjwc+FZTEvrItDIdB3pzOHErRF8z/C+3
	TWz4Fo/XlnsX3IJprBH0nHA=
X-Google-Smtp-Source: AGHT+IG9FYHzOX8KEmzK0i5RK+SNdwIlnORmXS9Et6cypzcuikzlFw/pQjY1fiWodZFPli5nbn5XVQ==
X-Received: by 2002:a17:902:aa81:b0:1d4:3314:d3ec with SMTP id d1-20020a170902aa8100b001d43314d3ecmr750939plr.46.1704682015140;
        Sun, 07 Jan 2024 18:46:55 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704179215-8066-1-git-send-email-wangmy@fujitsu.com>
References: <1704179215-8066-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-cantools: upgrade 39.4.1 ->
 39.4.2
Message-Id: <170468201447.912276.169052923092548079.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:54 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108098


On Tue, 02 Jan 2024 15:06:55 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  Fix range check with negative scalings
> 
> 

Applied, thanks!

[1/1] python3-cantools: upgrade 39.4.1 -> 39.4.2
      commit: a10314fdd0a70dcc0a93df38bd9bfe7e16010697

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


