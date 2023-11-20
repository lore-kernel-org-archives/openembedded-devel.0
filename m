Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3DFC197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 07:26:37 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.45541.1700465189932460944
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 23:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g5d9uONb;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cf50cc2f85so13312915ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 23:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700465188; x=1701069988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UmCluS88x9HW+Yi4TNeTMeHzmrqIr/uPQq4qqFJc7aQ=;
        b=g5d9uONbqxmfZbhNhdW0I+YpIJeZeN8rbRA4lhoaLAPZOPznhDRZyJ2LzPefpGVJIS
         Jz1MAvPYPaOvBt+kR2wg9scneyiozttqZLKKl6S3RM1OUh7Z+zLsktCN0IH+lQVf+wzr
         zrmFZdpJCPzltQZh0tXJ85kjFkbV3CVC3ADH6o8JQYTbkJrwEM2Fp1OGLVII2NugaSIp
         JRHtpYoFi/aefjDQnS9k/SKH2FTvRX1C0KyT4h7aUlCoeEHRuKtGv9k34hASMpzqMMrJ
         WfyE+s6RLXmtgXmsDkfUa/E5jPcLNP/5QGPiSmzFyo1KdaqX8nrE4HQ0q3K4WxHU3lRx
         Dpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700465188; x=1701069988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmCluS88x9HW+Yi4TNeTMeHzmrqIr/uPQq4qqFJc7aQ=;
        b=vfekjfXMVlisirrjv3riwgvEeHY27l++bUyx/WtNIWgoD26WMbxEOM68mCki9M9vSP
         SsQ3PXVQiUois/hSjq4HBnky8K5ln+yIJK28gPxlHD47wGKs3kKrydfXVUTFg89cPuva
         f87XFfX8uzvcYIeJzWWCynzqKy5+55DJ7ktBV+gj2Q7ArIrI6eT0dbHTciFImYFdjhvs
         K6dtTotD0A6J8U1co0Dywb2RyKaJ0hCXWA9ZZO0LSl+MsPaJ95BzA02IFRKSsmBDxS48
         i/gHxzSty1ju0hLv2yN2XzmmmBDi6jvX24rbNr7U/Q54gpZUPQeAzboRsC8f3kSksFY4
         8wqg==
X-Gm-Message-State: AOJu0YzhWJ8tLiRp0/rsXxx0ph5/RaHlOPDuG7QtMp82UD5rSc6RCk2s
	X6a4SYAyhWqZGbU1LrSjaJR5blYK2Cg=
X-Google-Smtp-Source: AGHT+IHZ6GCe6mj/J+9qcT5Cfr37VUkMSY/oeUSdZZH6Nr+/w4xx0TkUbnb32lDk2JjO171ux2VsLg==
X-Received: by 2002:a17:903:1212:b0:1cc:6cc3:d9eb with SMTP id l18-20020a170903121200b001cc6cc3d9ebmr7227069plh.68.1700465188391;
        Sun, 19 Nov 2023 23:26:28 -0800 (PST)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902d38900b001c8a0879805sm2332104pld.206.2023.11.19.23.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:26:27 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [meta-oe][PATCH 0/2] Upgrade idevicerestore and libplist to latest master
Date: Mon, 20 Nov 2023 15:24:14 +0800
Message-Id: <20231120072416.2556340-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 07:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106958

This patch series upgrade both idevicerestore and libplist to latest commit of
master branch on github to support newer macOS and iOS device restore.

Potin Lai (2):
  libplist: Upgrade to latest master
  idevicerestore: Upgrade to latest master

 meta-oe/recipes-extended/libimobiledevice/libplist_git.bb    | 4 ++--
 meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.31.1


