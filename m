Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE7DC3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 07:39:46 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.15171.1702798779668365472
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Dec 2023 23:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Af7CmPoe;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c2c65e6aaso25056115e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Dec 2023 23:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702798777; x=1703403577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx+DpCx6U42B5lT01EUsRoXelpUFuifMYBN0tyME/E8=;
        b=Af7CmPoe3OaDFXK2Jc5+utOQtuuHUdu6QAu6XvS8TF2InUT0Cy8WAYz97ZFyLK/N34
         GpB6r/sg7jwLbhsvlkEzE/trIovddPTPcaQjYQi7Yi7exMTLdWyeffCmy9AuJfuhYwzp
         Hh2e6NLynSaVK+sEDzTDA0ZcSgQQqgnGfma0cpDXyCpI5UreGLTxJhf23tinrwpO5Qxr
         1DA//CiA3yI6PRZqGtRZbv0T9TDKgzlzFkilf8TPiyQv/LnP1mlizpKmCzxhTDt98Son
         b04ENzo8bEuS/azPS88Xd8YFAfxSDpPiExUCv2kf49d9RGw29u5Xmlzk4QonwjFN5F/J
         qnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702798777; x=1703403577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tx+DpCx6U42B5lT01EUsRoXelpUFuifMYBN0tyME/E8=;
        b=k6YaeDYE89KTM+9knaCkyhQjQtV8WUYYyk7iNtWbp3IOUFhsruHiTryvqiGswxYYoW
         U6qfQQuGkbips8nL5pz61ceo7t7NbW+IDwWduh526gAR2IFIz2AkbX/s2Nj+1iJU3LsU
         lgPVpCMpxqsIr4Xi94IzG1HAIjVZInMhVlKTsOlktKNV/gcmRUjByjiUmaGdryqzzCHK
         sK0TkgH+kbI++H9dFC2F5A7Yy8aQqhs2QbjKdhZrAuEB4nwaLeHGpkrFaD998nwAj0Bd
         BwOx3gnhXH3oISE/2fTw9YCvygwgJxUYkJwPVfKndmGleNXXGh9fDt0TRTq7gb2RU/wP
         BPjw==
X-Gm-Message-State: AOJu0Yxn7YbB5ScupJ8Iw8MmRkVS8habh0472niyF3/um7FX+LSQQB0X
	ez0iCPkF1BjFv/8Cs9ya2l6kYm1bmTuXHA==
X-Google-Smtp-Source: AGHT+IEUiNXzhOOeOvf5NlBHfB9Ib70ek0x0xjCKmbxrkQr1sq2YrdE/DIqFOh0bgb/fiIPUNEO4gg==
X-Received: by 2002:a05:600c:178a:b0:40b:5e21:bdbd with SMTP id x10-20020a05600c178a00b0040b5e21bdbdmr7376155wmo.76.1702798777201;
        Sat, 16 Dec 2023 23:39:37 -0800 (PST)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:2e8:740a:5bbd:1d48])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003feae747ff2sm39240750wms.35.2023.12.16.23.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 23:39:36 -0800 (PST)
From: frederic.martinsons@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [meta-oe][PATCH 0/3] Introduce crash-cross-canadian and update crash version
Date: Sun, 17 Dec 2023 08:39:27 +0100
Message-Id: <cover.1702798681.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Dec 2023 07:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107534

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This series brings a cross canadian recipe for crash utility.
This is particularly usefull for using crash in an sdk to analyze
a vmcore file generated on target.

The following changes since commit 0a0ea87b8dda01a2887a525cef78eb6c3f4c2c32:

  pgpool2: use autotools-brokensep instead of setting B (2023-12-12 14:40:59 -0800)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/meta-openembedded master

Frederic Martinsons (3):
  crash: factorize recipe with inc file to prepare cross-canadian
    version
  crash: add cross canadian version
  crash: update to 8.0.4

 .../crash/crash-cross-canadian_8.0.4.bb       | 53 ++++++++++++++
 .../crash/{crash_8.0.2.bb => crash.inc}       | 29 +-------
 ...001-make-src-string-const-in-strlcpy.patch | 69 -------------------
 .../crash/crash/config-site.crash-7.0.9       |  1 -
 meta-oe/recipes-kernel/crash/crash_8.0.4.bb   | 29 ++++++++
 5 files changed, 85 insertions(+), 96 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.4.bb
 rename meta-oe/recipes-kernel/crash/{crash_8.0.2.bb => crash.inc} (82%)
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0001-make-src-string-const-in-strlcpy.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/config-site.crash-7.0.9
 create mode 100644 meta-oe/recipes-kernel/crash/crash_8.0.4.bb

-- 
2.34.1


