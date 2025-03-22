Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D74CC35FFC
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 05:11:11 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.4315.1742620263441608737
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 22:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ic67mTNo;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so8082514a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 22:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742620262; x=1743225062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CYVdzzPuhF/TotgfNM+Nu1w65OSvmOhDaPpiFZciccM=;
        b=ic67mTNoRbsh6f6an+8fWmmAU6ksl97uzNPJUqL9Yu6hb0YA/PbWGBm2nz4ooPl/cE
         Tv23K+VQaJU0iw2RrZMZUYsEte9pdiCklkEN0Rs8NFbQUb4vQGbvT1gWZ3G1HdxCSLSm
         RsXuODH7NiejFLgmCBjpBLJEbE9vE/dYmAwraWR6Kp9tXF4LajhHpEHsZS7HEIv8catK
         1rBMoFKCOTPvNfa32w8IPCM3cniokdPSvBF0NxaqNnE1Q0rcYpSzjmV7CHQVDyhtbhmk
         4bu0T6bIRTA6XxjUr1t1L1U4kq6w4MNE9N/nRFLufufGIQv9OFa5XmCuxYkXPWvXa2lB
         Y3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742620262; x=1743225062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYVdzzPuhF/TotgfNM+Nu1w65OSvmOhDaPpiFZciccM=;
        b=TDKjnigfeN4Lj3Ctm+8AhqXQkcfL+JoFg6sY8UMzI1OiESgqHEFEGTDTRIKJdpulK6
         r/QUky4bSu/MJtKyFaeLMl7bedi/0Ip+js1N0FyqGerVwGBlk/i8A874jm6fQsIDmqrq
         djxJifW3jMpYK0wwGav/lpYntZoSvy8xzOa/iokRlzLhYL/fKc/4H2szF3o4UksiAHaY
         sZ5BFQ3Wpk5HI+SI1IW5wOUioCJAckFCqMdKK9o0s0EIq+8KOTkNn5QKLgtvJffUUfKY
         NzZXFPPLnL/+wJWLmkV/41W8a7TWimn6WqK7krJkfygOaoRJo3l9L7JEQXBIsu1sH+Ev
         V/Yg==
X-Gm-Message-State: AOJu0Yx9D+NCJWAufWCbgTqcMfeY36oQzR3yoKgQO8j20o/dKP4q97ED
	0Nlyt1+VIYMlHY0cv7sD+vL+lkg6af9NE/9ieXDfgt9WH+NHOn8e8bw5YzkV
X-Gm-Gg: ASbGncutTJpRZcjdikjv1PYvgnYgIaCiP7fZVelcYH9XIxjdQQtFpudycK2OLL0D5l/
	LH4wlSdSVSPH7+YwHqHaYSTuTknN5mdEf2pubcPDnj8LgDliTnVvpo1nkktkoptpZ0+lOYCjtF/
	oXW0NzPP22LVwgsfkwVNfdDSWRhtvAUeGju90afAObJtcT9SrLMNe283z2UjoV4N2B+Kv35H6Pv
	cFiX8Rj1mxYIAzUV9NKE3aXp+rc9LJASx5Un76wg3iR1j7CpLtj7CyfvShfai/ZpMSgXTQLT0bt
	FBWKVAm3AS9FOU4qbJgRqxKTH/2UbawZWDkIEdL2Q+gpqnQ=
X-Google-Smtp-Source: AGHT+IFe8saAqIL69RYzT/MITrSuJAcIiQtQkeVPIfb4M57PtiBN1tBAl6ZeHl3gVNelSy7ossAXzA==
X-Received: by 2002:a05:6a21:7889:b0:1ee:c7c8:cae with SMTP id adf61e73a8af0-1fe427f34bdmr9423590637.9.1742620262329;
        Fri, 21 Mar 2025 22:11:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fa402csm3101384b3a.28.2025.03.21.22.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 22:11:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] protobuf: Link with libatomic on riscv32
Date: Fri, 21 Mar 2025 22:10:59 -0700
Message-ID: <20250322051059.1120732-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 05:11:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116195

rv32 does not have compiler builtins for 64bit atomics

Fixes
| riscv32-yoe-linux-ld.lld: error: undefined reference: __atomic_load_8
| >>> referenced by /mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/protobuf/5.29.4/recipe-sysroot/usr/lib/libabsl_cordz_info.so.2501.0.0 (disallowed by --no-allow-shlib-undefined)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
index 777378369e..9d49e0d3e4 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
@@ -51,6 +51,8 @@ EXTRA_OECMAKE += "\
 TEST_SRC_DIR = "examples"
 LANG_SUPPORT = "cpp ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
 
+LDFLAGS:append:riscv32 = " -latomic"
+
 do_compile_ptest() {
 	mkdir -p "${B}/${TEST_SRC_DIR}"
 

