Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8178DC47422
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:06 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.31444.1704682023128419194
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cHja+qrO;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7bc32b0fdf6so57292739f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682022; x=1705286822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yjFm4RC+/MAbI0hIu0Yq1RadHe664P/hlEFfjMyP7I=;
        b=cHja+qrOWsYTsuIliiAwVHiAq+isr3uXYsXPmrWhVKGtHxhE5lYZU/svrRuYYM4ehz
         6MuCDxQ5cR3fwa9aa9Rn/SgewuknsddOLlxpbudUkDZID5VeQIpgDWRjjdC0UuNxtnfq
         LhThuY4gfIw7l5KTPPhfstQyUPakZwzGdcADbzETswAlgiYdy48+4H2QaXjsFdBkuNFT
         tTiZ6qv51f8AFMyiyLXK2ct7Gu5B3H83JJa7xfHl0F6wTfb/QLqML47xuB58bAycnXpp
         x16Ll8esP/mJ20CqZUPReMYhL6EGxTeztuzIreO8iGk+AtnPiTqVQE7I5sCUfnAFN3XT
         4usA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682022; x=1705286822;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yjFm4RC+/MAbI0hIu0Yq1RadHe664P/hlEFfjMyP7I=;
        b=Pf06/IxcWBOXcXvdZT3wXrcbPybjpBN4/jPw5MN5NVME3YielMRgz4GZiOenK8PkHa
         CICRWbSFpoPdUya6Hr59Y0nG/7NR2calncSyRI9FQrY0t65sFnkh/RdFQV2pxASE8typ
         9zpENTPunc3bZIJak7J7b9JA3ZWB0Jj3zJGDBCYKLOUvfeExMvYfz5ld/C6qWyHB0c6r
         pXL0XC7mmIqJ4cdprD1fj94Ef/tNMe84Ava7m3JsDLG0AKkaGW4fPj86gBUbbwZFhC1y
         PK+qWMc/pPH9j8R99wSeUCW6feh1noOp69q01HO1o6fKXA+jUdTcVWb1VqOmoL67+N7u
         3QLg==
X-Gm-Message-State: AOJu0YwBfG16/p05iqYBEkkeY6U0ndIpklYe99OYDYqoLW+Ms0jM7Y5m
	joT4bEivm2OEACibfyRhyQ75nytKhEY=
X-Google-Smtp-Source: AGHT+IH5vnQ3FU7HqtcklYc2FfXR+Wea4m7FOxbORdB8Ucwes2m8mSDCQemi7wsyg3D0Ls2sdYrv/A==
X-Received: by 2002:a05:6e02:2387:b0:360:7403:3cca with SMTP id bq7-20020a056e02238700b0036074033ccamr4380950ilb.51.1704682022337;
        Sun, 07 Jan 2024 18:47:02 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20240102122241.52039-1-alperyasinak1@gmail.com>
References: <20240102122241.52039-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] libpaper: upgrade 2.1.0 -> 2.1.2
Message-Id: <170468202172.912276.3122635839453929363.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:01 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108107


On Tue, 02 Jan 2024 15:22:41 +0300, alperak wrote:
> Changelog:
> 
> ==== 2.1.2 ====
> 
> * This release contains a change only to the tests, which improves the detection of glibc.
> 
> ==== 2.1.1 ====
> 
> [...]

Applied, thanks!

[1/1] libpaper: upgrade 2.1.0 -> 2.1.2
      commit: 0f4a2e7606e5440a59e1f326bab4ced8da3f03d3

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


