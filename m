Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C0CD116E2
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 06:15:17 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14972.1764569716942696712
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 22:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MwIWeYCT;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bb2447d11ceso2206794a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 22:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764569716; x=1765174516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGpz1FLGZnY5LimIkhLHjxTkLWz/sHo83ybsdAxxZqQ=;
        b=MwIWeYCTgyoxWaoRtYmMuwBowTaAXr/sW3P1BIlmirqTl1TBxDLdJfbKencBlwT2RN
         btJa2IVMmrQyjJPUedPTXtprCKXF5bG+nuRF5lH1uucIltQbsDuwwu9pNf8cd4xcTXnR
         PRUTylQvrrS7k77pG9spSJdJaRjhFs2MHp3cRQyOLqehm7JDv8w7ciX5u+IaFmDU7YQo
         0xex471fIN6lJPr0dI/JFgNDk1wfvFRm7+t7jf9ChKT/wuctU1ZRI9d7gVhv/T1ebgTS
         GBatuaN3kKqXFOapQs0UuH0vJMcVK+NjbGK5SnFBr0WhCOfqRWvMRIz8YGM15zHEkd/K
         qcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764569716; x=1765174516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TGpz1FLGZnY5LimIkhLHjxTkLWz/sHo83ybsdAxxZqQ=;
        b=YJ2yxkSefAdyLquZqIy29AfDnhNmMHFhlFgq4oJQhWEwBo2H5bDO/Asq0oeov/AaEm
         hu37+hoDRtzIbv7l9mlNB4NJXATwHMbnJLAXFlWx7aAjeKXoGGJ/KCoxqCabRtf9izF3
         uQyNsmiKUJ73Ftr4b1Z56u60nTyJYfLLXRKvKXXxbgFcxlzJXG0xo6iPPMyjPE+6quLZ
         mAS0cHTZA0PSPmpcG0CuxwHK4SE91Fft5jgploVDFWL5CzANAevxZLmK09ZGgC0P6sWo
         IP5+Z5Kk7SfbOgFer/m9UIINRA+kRv4ZePRV9NmkI9YROsQhMWLDLnsVQTKKg2uVOWtb
         OwXQ==
X-Gm-Message-State: AOJu0YxIfwb0o1pKyG4FRIsf7yHqzJdu86vVcstT5KiBKEPJUbCU1++v
	6gdvrZEFT9M5p9zNRLWX4DwvAWq8i2lTVtiVCQrdeVKffrPZAxKF2MsmIgIlwb6L
X-Gm-Gg: ASbGncthNqSZMX8e8Sw/zeYJJhBh+atq2nC4Zrt9hSuEUfpgP7UTk114I8OyE0aaGjQ
	SpI+CJLuvcsOzTjDDdaJORizsnbHdw0z1f5EgWIYi7PG+o112jh+ajc2avdTYayRhsTa0WhFRBC
	ivHuZ+H0wY83wraNV5gZihtAM4XhGZk1BUQxCx63IgyYQqi+jrTJxBuZ8LrDI4m4m2kHSshqFmF
	45WTVXIgOzAah0doc4LMDoH0VZ66hMCu6BMuIEV1Lab7u4LCJB+DmRSoCC7Yiy7y18wigy6sS3w
	aejtTRdpbK0ClXzqdJS+A+Ke3M45i7HCdD6uyngC1HfzkZp2MOffzqw8f9Ch4Q5K06pPu5l2tvt
	T4m04coQSeDeWklznnRcMa4eTkdDiHJK4xBzRB2sZxNSIE4d95VFUpkOJtLkCVjR3lokNhAqwPm
	3hV34RcH/hxk7R7YLbdCE2yG6iFfqg/gs14a2gPB710b5Os/o8yHE+yZ2KYmRz2TG3PhWkMHQep
	OmbqXAE+MWkQtwC5h0cfqdT5wfLjXMMvJ/Yn6f5suQ=
X-Google-Smtp-Source: AGHT+IFSOx5YVZsNB2yjt9wXg7GuBpp5E5B8iYUunFqbmLJWKUY9mOXBm/YrbP5XXtCe+Xpou741/A==
X-Received: by 2002:a05:7300:3f17:b0:2a4:3592:c5f3 with SMTP id 5a478bee46e88-2a941565084mr12786742eec.4.1764569715821;
        Sun, 30 Nov 2025 22:15:15 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::821d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a9653ca11esm40031104eec.0.2025.11.30.22.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 22:15:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] fuse3: Fix build with clang on riscv32
Date: Sun, 30 Nov 2025 22:15:12 -0800
Message-ID: <20251201061512.961293-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201061512.961293-1-raj.khem@gmail.com>
References: <20251201061512.961293-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 06:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122190

Clang needs 64-bit atomics on rv32 here and builtins does
not have them so help it by linking with libatomic

Fixes
 riscv32-yoe-linux-musl-ld.lld: error: undefined symbol: __atomic_fetch_add_8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/fuse/fuse3_3.17.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/fuse/fuse3_3.17.4.bb b/meta-oe/recipes-support/fuse/fuse3_3.17.4.bb
index 85991ff7be..fcd09059ab 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.17.4.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.17.4.bb
@@ -25,6 +25,9 @@ CVE_PRODUCT = "fuse_project:fuse"

 inherit meson pkgconfig ptest

+# fix  riscv32-yoe-linux-musl-ld.lld: error: undefined symbol: __atomic_fetch_add_8
+LDFLAGS:append:toolchain-clang:riscv32 = " -latomic"
+
 SRC_URI += " \
     file://run-ptest \
     file://fuse3.conf \

