Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21998D3C559
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:27:03 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15648.1765373213794905182
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:26:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cyv8+R4C;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29568d93e87so61313975ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373213; x=1765978013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nquWpF1/ipfg2Rlho2gkuhJi/5a0XCxjFOUOWIfI8E=;
        b=Cyv8+R4CFmvrmu3XfLOOlMy+31bJCOeNOUgRufMbusXxs4VwOiL2gc+iOqePr/E64W
         9bX9pPxpzOer1Ba7jqwf6l33l57a0F8XPNbfnj8J/bTUBtpqdWTVciL7PjDBC5EXAMxT
         +gYEiHSJp8wSbQu9Il9nZOIzroMOVfgQCOUCCUyKt4VyIh6QbqXdWaiV+1ezEAMUoKly
         cKaz4ISuZ75g+cqc0tWPqnsPMRPhUFIQppa8+bBe3QgGvzTAQMI88rusFiBQW2faDaH1
         klaYfGh8RNnbYtnO9OgyiNEp1Okxw9JvvLEOuc3ogm24BHSpoDycaI9/V3ontMtSLdl3
         pxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373213; x=1765978013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7nquWpF1/ipfg2Rlho2gkuhJi/5a0XCxjFOUOWIfI8E=;
        b=J/PHxc0frl2xkshRk5CkuC39DY8OeuSSyrC7p6X3sDnwUlFFRZgvjqA3+XYmG5Oy67
         Y6pelSewyNYYmKAyr38YijH7cl5sO2LHB4aSJK0tjps7NjRSLhnBj9FxS455lVap5n0T
         QtI+ck9ynIrXlumuXiznfLOV4CzFsyAIW68INy2K05GAOitfpkdEohhvV0fiwiRq+soU
         VEW1M9U6msBu1YJg50pxFy5SU503emMMgEGuRtksEIOc0km8wkIqJ3B6MHojpRzAgg8I
         zzV2djyoMHA88M5QdHRURzZkhsKe3syjWLXX/1nadI4MSkqKZq3U18lyRryxp3xA5PI1
         v0Jg==
X-Gm-Message-State: AOJu0YwHjCwvmKPFcU0GjJTuvtgzsxx8q8uc6lfhu8GFosGeLYTsRcSz
	EPU40iVILJMYi/TzQmp6qtGbR0n/Hawn2tn6Mkztgx9VOAhKafzYXwBkNxgnPg==
X-Gm-Gg: AY/fxX41hUz0w+VfE9R+WEX4wXJdvn2GUnXMRkxZBN55Xr4xSm84LG+sGyJI6r556BF
	grPaOAaZVCvtfL2d+sUYL9/C6qTkBBdJpKpsnCiJ/L7PdyOnrqoED29Jsc6yPJYg1hU8kO8bLgB
	ukgp/VCO9X81IoLgCvUu7c6osSemRYLfJwtra67QAIZ8To1+CY87RQ10oDE+VuvwdYOafvEVEHr
	u8RhwpyJViKo3E4gp7nNSX7wf6i0mvg6KU1K4gN4h4lWGTQcOGnnYEVaXAwePm522MRMyShQ4gy
	Mfvi4Jwk8sI96cwGclk5cuYLobIOge95SlbO3YKl8Ye8TSv7A8F5wu8VUKvDpUIBPFtBtuDbDpA
	IuJsPQO6eataMZUu7FZfOsxoF1GaoaOFeeJVCg40UrZ3Bmiz34WqKMXn6DOgY8omC5e/B8qRDYN
	iM+zzTcF/BJTDkFkv/g7bQdXo=
X-Google-Smtp-Source: AGHT+IGP41vUUrcJo8Tpj9xwJnYO2zYbT8oRuWkgBnal/pKjUlAt2Cid5sswioPJ/DjkHs4y1E2EfQ==
X-Received: by 2002:a17:902:e784:b0:29e:9387:f2b9 with SMTP id d9443c01a7336-29ec22ef35bmr23046925ad.24.1765373212911;
        Wed, 10 Dec 2025 05:26:52 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f20bsm182972465ad.46.2025.12.10.05.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:26:52 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 28/43] fuse3: Fix build with clang on riscv32
Date: Wed, 10 Dec 2025 18:56:34 +0530
Message-ID: <20251210132641.323679-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
References: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122532

From: Khem Raj <raj.khem@gmail.com>

Clang needs 64-bit atomics on rv32 here and builtins does
not have them so help it by linking with libatomic

Fixes
 riscv32-yoe-linux-musl-ld.lld: error: undefined symbol: __atomic_fetch_add_8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e3257c3360a732914ae02a07a7c0fe8c845a492f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/fuse/fuse3_3.16.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
index 2747e6c8be..4fc94b4e52 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
@@ -25,6 +25,9 @@ CVE_PRODUCT = "fuse_project:fuse"
 
 inherit meson pkgconfig ptest
 
+# fix  riscv32-yoe-linux-musl-ld.lld: error: undefined symbol: __atomic_fetch_add_8
+LDFLAGS:append:toolchain-clang:riscv32 = " -latomic"
+
 SRC_URI += " \
     file://run-ptest \
     file://fuse3.conf \

