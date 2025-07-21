Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17098C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 04:00:40 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.32558.1753070438304988395
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Jul 2025 21:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dVHm9WlP;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74b54af901bso2467696b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 21:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753070437; x=1753675237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jlm9J0prAp6YvEnSRIqFEKATOL060rjiKemeJeu2fIU=;
        b=dVHm9WlP/NuIzfzRrT8dH6KZiL6GmcyIQh7Tz44U0Nlk7H5BnX3rDVuHrM4Z3h9FSR
         iCp+3kIgLQh+Y2uCSuMwH+oY1O9D51gZZD+oLl23cP9GWag45HRH91XvV3AQ+m0rosBG
         0ju32nrIMoSHUqmLPpSzNYH2mSldBa5qB6rFshDX42fejQjCru4wFMV2OMvogH2g7/Sp
         DETUmdgbZy0OBllu/BWoeF/NA4d2WgD4CaV+inDnG0UD4KGKaEGdLIWfPbRZaiEuF7EX
         bjcst1GuRuxHYoR/OFJ9PF6Amj30HjhjNfdpOLoPQJgUkDrAEkxhxp1TEu/yannVeu9c
         mPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753070437; x=1753675237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jlm9J0prAp6YvEnSRIqFEKATOL060rjiKemeJeu2fIU=;
        b=WPm2KCG6QLjNJeSmJZE9ZdWEBjUjR/d9brRd7Xf6g/UMjXF4n+NgwWElsLKdUS/P/G
         mIdC+XZbPEL+jlTHUdz+BZkYZJr/LL9UGfmaw1Q50Q/VOHB6zb/PpYDvJzn8wa9fOHcg
         KW91dR2EpXdAnBF8YD0exf1TFHZWhGsaCLR//hUEB/heB0RJllhMSWxzHATcGQPaNnpN
         iS/WC4YFRvTqCEMouzcC7lriRud54HnvDFxoYV/PEclPRoxJPvAG8X+E9AhVAZSzqtbO
         w2HM+NAKOoLuVORndQiBiTbwukqRMZIFhBkYjsPgurQ10WSwhabkr/qhBK0Jq+a1oPt7
         IdYg==
X-Gm-Message-State: AOJu0YwdadnXBHfMUZSUtZ6pR9O0/Mzd0/VvUhN1sRhJuGObK5v6JKr7
	cxW/pV8LTkuSiW2SfRdJSC/TpgTk5ebjlupvOT8zJyKUmRKZef8mDkMkuV3anumcJ2Q=
X-Gm-Gg: ASbGncuEvQy4xZSWVd0btjZi6TEdNtf7ksL7E03sNGYjJhWxlHu3CcYMsmH90EM7miW
	3kMzMqghZiFVq5dal726FLd+3/RPg3bNasn0d+N80Kqs6EXcmBNFvMbp9ibx33d/Nn0NUaPlj/U
	H0couIg51h0UTUm4kTcLwy+KpdTXDqdd/ynBQrPCSvPL5X8UK6exFqz+vY2qXesH63DvRj9WB1b
	VpvPgSeu+EWliNQv47mexOeTcRYyzTdS/9h0d61fCW4Xi/s05Rvi/j4tc2qJLgEAUM0fvyxjFqK
	M1LWOkwFDSqe0qcdYoMtNTUyN/4izHn1pf8mfdUQCIOVTGM8ffwS4QMNgrJ+Cnf/Mjm3qbFBOxd
	uCtnRfby5L0K6VRaS2FpBQ2UR
X-Google-Smtp-Source: AGHT+IGQCAOMun/MUgR0nZAUj4jed7oHa99IgyTu4qwAKrHMltKsWNn5e4l8kQ2NgC6+jSodZRdRJQ==
X-Received: by 2002:a05:6a21:1fc1:b0:233:927b:3ffa with SMTP id adf61e73a8af0-237d661c579mr31041558637.12.1753070437005;
        Sun, 20 Jul 2025 21:00:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b985])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d5e73sm4812987b3a.59.2025.07.20.21.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 21:00:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/7] libc-bench: Always use libgcc runtime with clang on x86
Date: Sun, 20 Jul 2025 21:00:28 -0700
Message-ID: <20250721040030.641212-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721040030.641212-1-raj.khem@gmail.com>
References: <20250721040030.641212-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 04:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118648

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
index ae87262870..30313f4315 100644
--- a/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
+++ b/meta-oe/recipes-benchmark/libc-bench/libc-bench_git.bb
@@ -16,9 +16,10 @@ SRC_URI = "git://git.musl-libc.org/libc-bench;branch=master \
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
+# i686-yoe-linux-ld.lld: error: undefined symbol: __addtf3
+LDFLAGS:append:libc-glibc:toolchain-clang:x86 = " --rtlib=libgcc --unwindlib=libgcc"
 
 do_install () {
     install -d ${D}${bindir}
     install -m 0755 ${B}/libc-bench ${D}${bindir}
 }
-

