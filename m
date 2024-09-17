Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE520C35FE4
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:04:46 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.14875.1726553077967794018
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jxewahnK;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20573eb852aso41322985ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 23:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726553077; x=1727157877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pwbbOvDho+2d/pOQCvDGLlpCPIA59mIYngKti4Z0eo=;
        b=jxewahnKwLD9LI3UvF+zx8Pp4ddnyU2tTfhFdbhIbOHAOhFTYSqtfBxHsjpddQT2hL
         RFSQJvElLq1/dDeyU2AFTaxsQ/wD18haeTjoqJAhenUTxRT2T2Viw0dSSKoUEqiKRjQd
         jBaCNf8RjC+1pUdHZTqKM6gimopyMyIB68V9zrmQnWEWgO4ARpeWPP+KI7Vf0G/MKn0N
         C6nH2cv0TbiRpFdzH8MSkoITPO7PJH4YEdyckhpDhsIfM33fR97etC/HKvsZ22a6Aipf
         C9GN879hh8hQutk8va0gVeYr1tNUwWH+pX/JhILClfGCkcrXvd44dSL2jnq2gNAP5eXZ
         vk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726553077; x=1727157877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pwbbOvDho+2d/pOQCvDGLlpCPIA59mIYngKti4Z0eo=;
        b=rIe+7nUJP8FkUup/jaZ9QyB/BqxcE/eeIPxE7EgHLPfo0AbKDXcKJy01uAKKzGdBjy
         JrgBPVLojXMASN+DQqtsbX0C33YSSHmnndwVrU+pJNCuYwZkK1W7ak9o0A8bkviy7ms5
         utAIgWX8IE2HDzlXnb0C8Dwylzecuuo1WY72KS4Crb14jVqOGWTRTF9Ef60UED7WCVUX
         xpGgDlH/7vrKFzPeT/Y2pKEUFF74h4R0/BBoOMifGdR2C3dpMfqrmmn2ibApRUeP/Vwc
         Grit/YaRxkAfJ0fjoMp5dr9xUduDTLYyY0XX+/wfn4MHMVgbGggndDmKvdVgEUS/r+pL
         xa6g==
X-Gm-Message-State: AOJu0YxHbmulHIDjtRrlzkz2NqVvUKbCKZnr2o9j4AmrCxKRKLjC4AJ0
	u/RGkmOqyc5tDF4SDeN74F7+R8HL5jDam9iuJYT6SEt05gwIz3zZeO58BTh0
X-Google-Smtp-Source: AGHT+IGd0YWed8O0T6HnhH29lqRinYAvROL51PU7Gw4DNgwfCwqvzvAAphCRckDmCez+7OHdo+3T9w==
X-Received: by 2002:a17:903:22d0:b0:205:4d27:616e with SMTP id d9443c01a7336-2076e5f7b8amr304662775ad.22.1726553077245;
        Mon, 16 Sep 2024 23:04:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079475df17sm44294645ad.298.2024.09.16.23.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:04:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/12] mozjs-115: Fix build on riscv32
Date: Mon, 16 Sep 2024 23:04:23 -0700
Message-ID: <20240917060424.1692067-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917060424.1692067-1-raj.khem@gmail.com>
References: <20240917060424.1692067-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 06:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112337

Link with libatomic explicitly, fixes
riscv32-yoe-linux-ld.lld: error: undefined symbol: __atomic_store_8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs-115_115.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.11.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-115_115.11.0.bb
index 4a0baf5fa6..f25c5a8f95 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.11.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.11.0.bb
@@ -67,6 +67,8 @@ ICU ?= "--with-system-icu"
 ICU:mipsarch = ""
 ICU:powerpc:toolchain-clang = ""
 
+LDFLAGS:append:riscv32 = " -latomic"
+
 do_configure() {
     cd ${B}
     python3 ${S}/configure.py \

