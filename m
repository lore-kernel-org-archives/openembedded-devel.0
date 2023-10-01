Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED28FE7849B
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 22:43:49 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.70040.1696200225498737803
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Oct 2023 15:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QMr6b7H8;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c364fb8a4cso144034205ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 15:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696200225; x=1696805025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7WAoRFp5sMfT/HNxS4a0vcWuTT2NScbIOgpyIZLLtfI=;
        b=QMr6b7H8ewoCwzOh1WTAN+ocSBkDhQJ5zYigDbWSLGX+T0fk6IGIg8Iq+SvR1EgzAV
         yrtbZDp+/nUUvdwPmJnMmv4fbjjv0WrxYFZ6fxf/heqWQftyoXRB/7YUnwoFpV2aIYj/
         XIrggnkik4Bz6wCBiKlDsLcxJqylwJmmwaLyrXS4m48uPAJd4vkyihb3/PmNTAn9jZ80
         m8jyUkihJRJOa3gV2ngkPHxA9JwmXbmDYkBPa5Y5e9RaC3c3LLbIvR6TLRNWMVpAS7Mr
         8QcXo8tu6yHYcZY2KlnaHDGR6PPBoJjPLNP98UPUvGs5lznHxxokB23AIf+Np2WSZYul
         YapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696200225; x=1696805025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WAoRFp5sMfT/HNxS4a0vcWuTT2NScbIOgpyIZLLtfI=;
        b=KKaxu+xfR8Nb1ZcR6Qy9c6beqYXLKcK2QZVRdNqQBaFy/1c+/Ke1XdG3mZWnG++mPq
         +zbL4LGp1LlN3ILyjzijptwFe+B4mSYMh1mmgensPVvG9S6mlASH+pZngoyNsUyF3fuT
         fgbX7f7tPYmA2ubsS0FXwJQL8dvcdjBHAorHRfxWT78gRifVwCtsr6S1BoAziD2E6NLx
         dbTaX34my+by7zZXXOkFSL9ESGVQxh0oCReEuzPuegKK1LcPS3PotU7awPBnD/t/DNyl
         0WN5dvR3kLbXO2dLfelTd1kODTxD0xP93jJSR2uBP8KfAL/VTB99pOPPJlw44SPitCAH
         a1cQ==
X-Gm-Message-State: AOJu0YyWC9IcwbR+n9UImi288k3CDWNa4m9MfSSG+4/AF8Nw0PlKY5sO
	q54r8iG1tc0AI29kGxbsrCXhr65FW9oAKw==
X-Google-Smtp-Source: AGHT+IEJhhP3SGNlUUPlLHVozkJvTuxx27GW4SwGOqIR11KXscPyZr+XvLJ0aNlaLC8nlgzUWNnwvQ==
X-Received: by 2002:a17:903:456:b0:1c6:19db:7b69 with SMTP id iw22-20020a170903045600b001c619db7b69mr9897143plb.66.1696200224621;
        Sun, 01 Oct 2023 15:43:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id n9-20020a170902e54900b001bc21222e34sm20590492plf.285.2023.10.01.15.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 15:43:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] kernel-selftest: Build headers before compiling tests
Date: Sun,  1 Oct 2023 15:43:42 -0700
Message-ID: <20231001224342.817597-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 22:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105300

This fixes build failure with kernel 6.5

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 3d97ea0967..4d6e0e3717 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -74,7 +74,7 @@ do_compile() {
 either install it and add it to HOSTTOOLS, or add clang-native from meta-clang to dependency"
     fi
     fi
-
+    oe_runmake -C ${S} headers
     for i in ${TEST_LIST}
     do
         oe_runmake -C ${S}/tools/testing/selftests/${i}
-- 
2.42.0


