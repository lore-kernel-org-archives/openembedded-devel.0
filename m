Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67746CC6B03
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:54 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5095.1791839509791227207
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C2yAqqwp;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1658000a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839509; x=1792444309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b29O3v2MCwPX7xDUGtfueqBR7XokGZnunF/3xTBS0js=;
        b=C2yAqqwpwBx4JG4VmrFA8//HCyHyap3UQIZETqUp0GBK/69HgBSmBXbI6WP0FCEsqn
         cLSaFCIsBjwnmSqCL//Nq8A/85bbSIEmb8frs4PAUrLI7RC+5xxKqQLmhmZFykyYWI1t
         2jWr/gbJKdZ4fhBEdvHM2/zpcxpsPXkjnAZ2QlwOrEBmiY1/ChNnAuji32+URYYdYuff
         B0DP0FdkKEjbm+vVlATk2gPolqS0q4xdBUIBIgO+vfaLExkMgr7PvzNQczCw9hSx8/z8
         bVnvQSL/pJ/5Pn2YC1VQwZg0Ic6o5MazBR6j4nuc1oonvT7F72F/rIC40wddito4x6mN
         qXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839509; x=1792444309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b29O3v2MCwPX7xDUGtfueqBR7XokGZnunF/3xTBS0js=;
        b=XXarP+QfUCFFX73S8HIA4e+wxAf8f9POx2u2v2CpOgpbKjVImsUROolajs5n6q620X
         CFtJ5aMihR4nd6IW3imUajknSZC+FNDijVjyzEUCGu06ZYUJrUbuJjYLBxDaxFSX6MjW
         1ZlwfSMdaiDVg0l0XdNCRctVv3qbDuzH3j1ePniiQVrTd9GF7YqEBpsGQV79/cEHn925
         9vpqBYkktfW94KD7OAngc9RcR+vjYDB14XUzjtk2yr53hAPCal0RKSOmM4mDJz05MPFc
         d5sfE7jWRHEJDQ/nyKI/aN5FcZghMMiPShhcmsaz6E/90TzhZigmFVe1I0D3LWoE4KA/
         eqLg==
X-Gm-Message-State: AFq9FYKzFj02g3dE4Xh4MEMZsTNvP8JTFjc/aeisgtiVkGdcTjxVVWD3
	p2KchJLVS61eREbB9olofmqCchKFO8Fc19ubW6btS7Vyr6STsxFsui0jXk/2fOgT
X-Gm-Gg: AYBFou3+wvkJjBQjPUJTwdy2nEHKtGlGj+3IUdP3ztrww11tDsd7bsJXhZjUD8Gfeil
	JX1SUPFSp9xHy0rrU7loy1hRmN1wZP1GOFenF3nJugctsunYnJN0Ku0pp9i0WK5joBRoty8wztQ
	5X3ovbiH4f0dr4HARJ2kJJ98pWp+N87TXH58Rr51sk20/lOo/1sQYeCHwv4SVpxx5ivDhmNRde5
	e0ZWR+WOlgsqSQxhf7k7urJrPOns3aI50lLmTX5AasNYx3uyHm/ZBUye9EKxoQWvb9OTeb+adLR
	GSrRYFkXmtl/NHSdPcZV/OYHqLElMm904JQVoNwsnd0XwEkZn0BNwTZCfZ+76kt+937zdIHHCkU
	JUy/dw7jE2ZHLCPUeZUg5i4mumi9tXJpINJIBWs1EKVA6FC1GvuHnV60Cb33rh2YrLo1AMa7AFu
	3XkVT1WRK43eLvyQSOTxi6s5xBd8sBmYFtq0HKC3GU7hOEBiJZh5e4i4Fq9J9NKwPmmsmDRe/Mq
	sB972KrvNYjp8Qsd30KYIVQlLxJT47pDr03nZNUSgxA+klmNPz0
X-Received: by 2002:a17:90a:d2c7:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-3ab3a33da74mr9059235a91.1.1791839509150;
        Mon, 12 Oct 2026 14:11:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 36/43] smarty: upgrade 5.8.4 -> 5.8.5
Date: Tue, 13 Oct 2026 10:10:00 +1300
Message-ID: <20261012211009.3352822-36-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130806

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/smarty-php/smarty/releases/tag/v5.8.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 3fe4c2247419cbe376ad010e2e56536bec3faab0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/smarty/{smarty_5.8.4.bb => smarty_5.8.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.8.4.bb => smarty_5.8.5.bb} (95%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb b/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
similarity index 95%
rename from meta-oe/recipes-support/smarty/smarty_5.8.4.bb
rename to meta-oe/recipes-support/smarty/smarty_5.8.5.bb
index dcb7c85a807..83f428d388d 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "94a27cbbc7820198d7adc17a2be8d457fb267753"
+SRCREV = "0ae663525dcbc9e996feb2a867e43bc85f960938"
 
 
 INHIBIT_DEFAULT_DEPS = "1"

