Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3ED2C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 05:44:12 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.115489.1699508644888968981
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 21:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mjxyAmac;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6bee11456baso432223b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 21:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699508644; x=1700113444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nJ/H5cpdB/27FNBL6vOQxMRRYkyj5yppZGthtxp2sFo=;
        b=mjxyAmaciM4Sc48H9BDs7V7LXFri3D4NJhVG4DwtAB40DM93oaPce/oy2PfsNJWyR0
         7Jy1QAXb7goBzcRyON+D3c5whvYNiRwnAI9OtIs12Tu3rEJjaByGlwL74Hm8tD8rs/3Z
         PPls4BHwiYgrpntwWfeIlJs2z2sDqm8WWiUBVwYGE8srNko0ZsbKWU+8BUSi7yJXXZo5
         DsmJMF7WL/R9gfyarZ9a6dJFQMdBY4IP5sZjHDjSYeOclzIEr8kyitavwjgis4VjLOO9
         9boUFbfnjLK7b9Dwhl/ER4DA+QIiJxFQ/YWWbDeruu4AJiGoaTB/BKKvJr8CTDxn/udH
         KAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699508644; x=1700113444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJ/H5cpdB/27FNBL6vOQxMRRYkyj5yppZGthtxp2sFo=;
        b=ayKdl924gNqmF0Hl8Os78lE7L/dqKTULlssr++w85I9ML7A8JpuoS0fwXWsiLwbNVP
         QRfzn+8PlDRAv76qESBNtNvAkADr8p41XzvCf1vSJkUfceg7NpAkInGi8vPcE5rQBtTT
         kFEomJ1/CnXADTKASaX+iKqWKR2ytkGKtQ7tVC0IFcSCNQNnb7MIrqRCJWQt/CJZbtN2
         L4HSFcZLi/KQmucBPOOdBFa5+dC441oDieAtcFU3hp/xHYMgrs9FFr33tgQfR1p0Tzmx
         2hwEHeCIJZhqjNufURl0PQAKENdDoErLau11Z6qtIhGoamvUIlPEFUaUShRGuft2ZI5N
         N8Mg==
X-Gm-Message-State: AOJu0YygRqopq49mjj4ubtB4n9VDSA9v/FIsSX3/BzN9rBZ5bzjPo4MN
	Xl2Mfu1JwPyhbp/ySo4taYkK/D+nkt9cqQ==
X-Google-Smtp-Source: AGHT+IEe64oJ5/OdbpEKRhi/21wS1XZpk+ViD0xHlZftF2oUxP9thWb1bgndP89EZjEKQbgMGN+mAg==
X-Received: by 2002:a05:6a00:2da5:b0:6c0:3e5e:1d46 with SMTP id fb37-20020a056a002da500b006c03e5e1d46mr3991952pfb.21.1699508643980;
        Wed, 08 Nov 2023 21:44:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71b7])
        by smtp.gmail.com with ESMTPSA id du4-20020a056a002b4400b006884844dfcdsm9848884pfb.55.2023.11.08.21.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 21:44:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] makedumpfile: Change COMPATIBLE_HOST check to exclude unsupported arches
Date: Wed,  8 Nov 2023 21:44:01 -0800
Message-ID: <20231109054401.1672977-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 05:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106508

Right now riscv32 and mips architecture support is missing.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.4.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.4.bb
index e46dca53a6..b016d5da4d 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.4.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.4.bb
@@ -16,8 +16,9 @@ SRCREV = "3bc3b3e3be33a9aa040e654f055912063e576c1b"
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"
 
-# mips would not compile.
-COMPATIBLE_HOST = "(x86_64|i.86|powerpc|arm|aarch64).*-linux"
+# mips/rv32 would not compile.
+COMPATIBLE_HOST:mipsarcho32 = "null"
+COMPATIBLE_HOST:riscv32 = "null"
 
 PACKAGES =+ "${PN}-tools"
 FILES:${PN}-tools = "${bindir}/*.pl"
-- 
2.42.1


