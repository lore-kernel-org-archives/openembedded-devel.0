Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80D6C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 17:04:20 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.950.1635181459824121386
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 10:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NsC0zlwA;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id c4so11551856pgv.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BeyErttW3/ERCAMfOMEpS52VMIuvShslLBe11plnD6g=;
        b=NsC0zlwA4MZxdW3jEW9QKFp4d5/rMkYyzGRnazK65Bina80OeVrj8m+2zVBC78NnBj
         2qy76eH34FXFnJCpcj0mWUEgu4rifkrU2IjTHP8rEwWBf4HEVtu952nnV/yKRJVAmkuM
         nYgtYpj6Wezvz3p9Q1LnrRkfFiVNmpnQu4cApICcPsTg9/Vjw4Rtq13+sn9NdzGYnCiK
         ME5ZaKBB2tQ2VeihzUCeoqBQWIQjfgKMCKUaxCayKkIFx62DX22WXk/ETjLHw36GsDsl
         K85UuatCC97dWguH7UDJp7bl8VUhIaUM8D4yx47fkpDzwho/F/RpsB7F9DzTYpDSzVYj
         O8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BeyErttW3/ERCAMfOMEpS52VMIuvShslLBe11plnD6g=;
        b=TXP93JPk5uGoyioRR0+hFIhkTleuAqdo2jT05V+AYwTEqFits63Mfj7pj/m3CavPvA
         WNC69B9D8y6+I/KHy12lFUwv/+gqLnoYO1s9egbcuBhfOpn2hpwwwwMljAf1IU2Q50Mk
         eMlxDhEF2qesjK0ZMqoDFpE71msOd+K+ij/NtqAn+8Ft/Qqg1kVbPqg9TU0zHaXPgJQz
         h9AE24zC+Royesk8K5MbkUE7cPCEP+v9pCjzO97f7Ccugc1I1CClXrywGnbZeaA5JQJL
         u7qJVc39YgLkqe8+wFxzs/eI7PmNQa/xdnGXSxWcZ3AAmWubUJuglG6MUWwGUxF8pRze
         lodg==
X-Gm-Message-State: AOAM532zyCDPZaiY2oQKTBszMlUTW60yclSDjeuu7NvkpIdQkbuVEDex
	DiuPpUHOC+yUBY5vrpc7lZmxubItapY=
X-Google-Smtp-Source: 
 ABdhPJy5EKL/48wJz91dxZqqQxx78ppTFWDqc6kLmweaa8XsZPSlX2895xP0Q/L5a3Ol9jwiRlUcOw==
X-Received: by 2002:aa7:8209:0:b0:47b:df8c:7ec5 with SMTP id
 k9-20020aa78209000000b0047bdf8c7ec5mr14508861pfi.7.1635181458942;
        Mon, 25 Oct 2021 10:04:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 j11sm7087278pfj.40.2021.10.25.10.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 10:04:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] tbb: Link with libatomic when using clang compiler
 on rv32
Date: Mon, 25 Oct 2021 10:04:16 -0700
Message-Id: <20211025170416.917433-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 17:04:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93571

This helps fixing opencv builds where lack of libatomic link in tbb
ends up with build failures e.g.

riscv32-yoe-linux-ld: lib/libopencv_core.so.4.5.2: undefined reference to `__atomic_fetch_add_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
index 36ca8f91ae..c726bef3b5 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -45,6 +45,7 @@ ASNEEDED = ""
 
 LDFLAGS:append:mips = " -latomic"
 LDFLAGS:append:mipsel = " -latomic"
+LDFLAGS:append:riscv32:toolchain-clang = " -latomic"
 
 LDFLAGS:append:libc-musl = " -lucontext"
 
-- 
2.33.1


