Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8893EC3ABD8
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:04:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.14902.1726553068578420796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k1kzSodn;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2057c6c57b5so31584745ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 23:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726553068; x=1727157868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iq/o8HK4FPV1glZEERD7iefsK8aiPXZlPu/zcw9yAAg=;
        b=k1kzSodnAoDcRyu3+Ss6Pb0m/kBWAx8bt0xJbcD2YpqJ1CRwa83vx4CIaxULXWUnu7
         mjIs4KBwCjARk4z5T0puw936dQxM0JZn4rxTszfRaq+4y9n9H1ZXfBjCQVzc7FZHiL0S
         Dq9I+sOSh3X5L2qeoI8xOkhGpaKQjluYhAd4zVFDjRHdB8Ey/oePeRLvLuesKctN9eJp
         enuOnulODv+n9P9SiSZPbFZARmO3vCfZ/FKp+cMDyva9Fhmui8neYkL0f7tWSZasrL/s
         CLbHuTHF7Wjhoe/UscS4LDKYsPtZBf52FW1uzsHcAUydvhuN9VXxRl30SPeBedoL7zjw
         BCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726553068; x=1727157868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iq/o8HK4FPV1glZEERD7iefsK8aiPXZlPu/zcw9yAAg=;
        b=ARJY5TChCAgv3a852EvzDY7EHj1PvgeQALnAwRb4/xBYPT8tuQRBNy3fNyOwLubwt2
         xvn48Z8OrhsaMZJi22yV/XRQ7YyuuCLEFRsZsEOd6el3gzFg1y7E1Comsb4ba1vHe5Jk
         Fa+DSPcjPfvnaojeqppNADFrlxxBKD/FVIamlzmKvY6g8vFg04WZO9ki18HD1dijPGjC
         nkKMVsxUN23WNvz09z8k/Y6qcE7GUVev/mXM8TKFVnWCDDJ9vtzGXpHig6viDLu8sIcG
         I0eZjlnX/fO9pCLa45T4NeOfhetxQef4fxUzGU/YQzOHB9YhJA+9rtcBF79LLWlSae2x
         WLlw==
X-Gm-Message-State: AOJu0YzUVp57s6+tNN2Jz4ueZZLjMOG9bJPo5Jt+8sIOFcJueDyUAnaN
	xJDICs2fd1KY2z0I9LhQwNZrCK7seXz/zsmpDJqtOkpPh/9JdzjYGWDR6Yh0
X-Google-Smtp-Source: AGHT+IFdmniDGLM95+pcXiOtOanPPSI02gulkwDq2wn5eN8c6RsYNFc0L2WMdvbGdarag2M/soSkPg==
X-Received: by 2002:a17:903:22c9:b0:205:6a64:3144 with SMTP id d9443c01a7336-2074c798c92mr358920545ad.27.1726553067665;
        Mon, 16 Sep 2024 23:04:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079475df17sm44294645ad.298.2024.09.16.23.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:04:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/12] protobuf-c: Link with libatomic on riscv32
Date: Mon, 16 Sep 2024 23:04:13 -0700
Message-ID: <20240917060424.1692067-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 06:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112327

No 64bit atomic builtins provided by compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
index 24de6b8119..82aaf1bae6 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
@@ -36,3 +36,6 @@ RDEPENDS:${PN}-compiler = "protobuf-compiler"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# No 64bit atomics
+LDFLAGS:append:riscv32 = " -latomic"

