Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA944C001B0
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 20:22:47 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.4774.1689452564574250295
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jul 2023 13:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Yy/YFnYb;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-55fcc0ab0b4so1269867a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Jul 2023 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689452564; x=1692044564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmh1GBvN9pR4C82TWISXMY88+7XwdN6wiDAFxrelLtU=;
        b=Yy/YFnYbafnHkZpMRPhCchbIahCaejFQlugMsETmOGEWue79LQbuCeTD9cW774UnVs
         FMRwdBP1fKI3QhgiiNn3S8Yek+TWxyNmLnbbcAbkULDG6EAGO9LRYOTNx/bQlwPHXTmn
         kpXPc+2XsaCUNlQRFiptCAusR/hIgCv5BjWX+H3fJzdkBMDtApR0R2y0F3+ozdDk4vfD
         0AdSVUYaex6gxS4iux6jCwKiZhccCGn/VLtHixl6FR0SLgthxktFOqqHVTOkFRYf1uFJ
         sXMZcJc4uLWL58wdXaDFvNtolRV62u8y3Reyo3SBlVK0t9eCcjIaVWluJ/CtjVqNHnhX
         ZrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689452564; x=1692044564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmh1GBvN9pR4C82TWISXMY88+7XwdN6wiDAFxrelLtU=;
        b=Q/DHKMewFiJdKXbwMOipMmlKaXec3JfYGFC+okzKhUiTEPlPiBPUeDe4Cv8BegCcC/
         zl2+yoOukCH+CtyPhNVAKtei+TwMiJPGyFfBDdt0EIvn9UpxHAt94OxyiaGnJEbPIlxX
         f3liv7Ozh9FAWEIby74zLEE/8EwukeLWCeCVZY4tP/vF0PwwYIOS0Ld4Hepov+e3+gGi
         G0NNSmGyvP/gK1iessZrJv+43JGMRO1dl9DrO/EZT9q+Qm98WIMgo1Uyt9HLltMr5rOo
         dAS7NM6uW/i2TJjQB3otLr74uQQllUnDPn6WCEJ0gIukDb6E3j/+sgoOkixUWwt8sFlO
         R16g==
X-Gm-Message-State: ABy/qLahoyrDFRMmgGYFm6EIFReG9KIwZigyD8Oh5rod2wTgWyJmzDid
	Wg9t/NE7rvR4CWv1R0TdC16XIUIGCS8=
X-Google-Smtp-Source: APBJJlG0Ytcf5R56CVils0KW4QWiD/RLqXe2Y1qObxy0aGuEXuTUyZDFwTkIKZ/l6I/Fpz5eqnH7Cw==
X-Received: by 2002:a17:902:bd83:b0:1b3:f8db:6f0c with SMTP id q3-20020a170902bd8300b001b3f8db6f0cmr8654980pls.58.1689452563732;
        Sat, 15 Jul 2023 13:22:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::1069])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902bc4400b001b9c960ffeasm9832129plz.47.2023.07.15.13.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 13:22:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 2/2] zfs: Disable builds on aarch64 for now
Date: Sat, 15 Jul 2023 13:22:39 -0700
Message-ID: <20230715202239.3162521-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230715202239.3162521-1-raj.khem@gmail.com>
References: <20230715202239.3162521-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jul 2023 20:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103874

It does not build with 6.4+ kernel, it is using symbols which are not
abailable to non GPL modules anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
index 72ad49408c..a62a8a39b1 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
@@ -73,3 +73,5 @@ FILES:${PN}-dev += "\
 COMPATIBLE_HOST:riscv32 = "null"
 # conflicting definition of ABS macro from asm/asm.h from kernel
 COMPATIBLE_HOST:mips = "null"
+# FTBFS on aarch64 with 6.2+ kernel see https://github.com/openzfs/zfs/issues/14555
+COMPATIBLE_HOST:aarch64 = "null"
-- 
2.41.0


