Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219D1D3C55A
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:27:03 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15656.1765373222130656932
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mQRn/wwH;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29853ec5b8cso87723265ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373221; x=1765978021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAbJ2RwJTIOaWZgXPE/NKuzykG05q90SsHc8LuSw2WY=;
        b=mQRn/wwH3G3QEEEgcQBafB3KT+9SnFx0geCH8R6xnEWV/wHJE+NgNUyC25nZAyj+yr
         vBRDo2LFCTvShs1+IY5vQ8mUArDsJzSJ47xc5igecnyJGln3xwE0FWE3BMv6L/VOXEoy
         w04Fw5QYqvR267eKkJeBES1sCcLrk3B+jT+tUPaftTZctfSXoPcSEukUsixHacrwaTFV
         Pg5ennjyZ1t1MZ4JkCK9SfGh4PP3ZjdPfzm3QMDYYUzVP1XoMtThuvu6UXohDxerQtX1
         oqsJxT/Bj8f3f6FbT/eeG9bNsiLgxsFa1aLpG37IwijQuUS+nRmHVgBAyjhNdsKlmfRI
         9hcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373221; x=1765978021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qAbJ2RwJTIOaWZgXPE/NKuzykG05q90SsHc8LuSw2WY=;
        b=DQ0RCAE1FeqgnBOFXrl/gFoeJ8OAtftD7+TEV2RvBWsqDOtFQZlLF4fk8AgC1ECDBy
         f9m9lcY+ExeJIqku9LyGMsvklaBorg/Ercji2vp+sXW3pmuqOH6RJsEzmADkJqIFr3ee
         tU2pmKCP0FzYDpRkeBHVwv1FIyzFqrj4t+wJFMKAzge6S06oQNkx1vJep4pbhTcwUt5Y
         FuQD8i/uEJUuQt20JS0x/6LgZlpDPQPu+MNJsLbw3LrzSrSR1uSNp1E+awqbbGjZ5u68
         brP+Gda66WHXIvzUnQw3bDrwNsMpj5fHSYKid1v1FGHaFfva/7EPaQEarkB/3gQk7tdY
         cEPQ==
X-Gm-Message-State: AOJu0YyQtWDzkZdwZx7ge9b261Au8PePE4NaxXKCqv3nqHW5UyOrR/w1
	dAf/45Jee0LAuvnvuotKYAHRsAf6vHYNx1qwBkKE0X7ozH30TfTRiZYlkhXmXQ==
X-Gm-Gg: AY/fxX7cHU6Mkn/USXseok04xFCPsfK3qiAgqkgHSCWNjX9bIswLK7qQYcWGtrtsB3V
	in+it8AUROhVHFOJx/h8He7SqQn6ub9R0+Ksq2EHDj1BFz6gbNqVAkfcNmWd5HdmzoZ5PKZ8bWc
	KkTDpW+KkFqiKCWZLOPYRI9xBWSUCk1Mr4lLiVUYSGwAGPNMDlA28GMOhiYZRPo9LuLx3NiIJE4
	Zy7JVO085ULGdk1nWBnDuz8CeqTYvvhBlQbdLclnOss4ngluboR5IngFr3UfZqyfYGxoLgnLspS
	THIXo4yywpagy+bNq3cLZUV87dYJJdEc+YLeFdxo/5lUpauAx3UMTs6asgoc0rGQs51KZfPQDPE
	zD1AQ4NMvBO8+ajkIxOB54zXhsDSEArholU8YIVOaD53U19hMcJ7LbhbStUExq4PyoyWrKnc1rP
	PcO+FZ1A8fEdCXdg9spJH6lOFxeDqGaX+85A==
X-Google-Smtp-Source: AGHT+IEfhEQdeHij+BzgBqjARxwaLFM9q4EkEPbIP3u/toWz43gaK/1eMGTVmloBzxYO6+tCA54XIQ==
X-Received: by 2002:a17:903:244a:b0:258:f033:3ff9 with SMTP id d9443c01a7336-29ec27d24dbmr23586935ad.48.1765373221101;
        Wed, 10 Dec 2025 05:27:01 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f20bsm182972465ad.46.2025.12.10.05.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:27:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 31/43] hdf5: inherit pkgconfig
Date: Wed, 10 Dec 2025 18:56:37 +0530
Message-ID: <20251210132641.323679-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
References: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122535

From: Changqing Li <changqing.li@windriver.com>

inherit pkgconfig, and fix install conflict when enable multilib, this
can also improve reproducibility

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a2f2c06ec813bfc93718b1851a207343aaa7c663)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 798ca1b83f..93fe352b99 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71a191398102f76050a4e56e78cb4891"
 
-inherit cmake siteinfo qemu multilib_header
+inherit cmake pkgconfig siteinfo qemu multilib_header multilib_script
 
 DEPENDS += "qemu-native zlib"
 
@@ -48,8 +48,11 @@ do_configure:append() {
 do_install:append() {
     # Used for generating config files on target
     oe_multilib_header H5pubconf.h
+    sed -i -e 's|${RECIPE_SYSROOT_NATIVE}||g' ${D}${bindir}/h5cc
 }
 
+MULTILIB_SCRIPTS += "${PN}:${bindir}/h5cc"
+
 BBCLASSEXTEND = "native"
 
 # h5fuse.sh script needs bash

