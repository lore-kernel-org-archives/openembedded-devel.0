Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE7BC5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 11:16:55 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27338.1786360610933998652
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 04:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=h32nYtWG;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954aff6088so15801275e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 04:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786360609; x=1786965409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQFlCtYmYMeDP8JBZNeag1Y1wjou4XJiX0VJ8SvuBrI=;
        b=h32nYtWGV5kRwXJCV5Zu0DLexv9ijWqTqnQVqKY0C0bPqhJsJ4qAZ4VDCZk53kW25z
         hHeemj4uhtQn/qCLL18PUA+yxmtxQkb3+vCJV4b0Fh36cHxLQbNu0hzFV4Ml5ZUFl1Fo
         wXJgTWWpv+Avm7C07UuasXV5S7qA086DtYwdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786360609; x=1786965409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQFlCtYmYMeDP8JBZNeag1Y1wjou4XJiX0VJ8SvuBrI=;
        b=Rydae29gWmVtVGJfrEYH92A8sBlUuElV4KmllA8hwR/8ZaNdKJl1sl2SEO3sOEk6Ba
         9FhYYYwQKDpztc/j4RcGpPjBN2Fh0LycwR6GpGXfFeyWGxTS33nT2kW4svEeClyDRERS
         iYzREy5wN62YbjUkB2xSL6ugNYDzLHYNw24YP7cHhnC8dK7Fc/bLeZWjCB9YGeAkrA8H
         5lGabkN8s1iMNXpuVBKR3ArxWwax+wT+kiHm4OH/VbNTr1s8B14tz6H2wB/4QcRMMh67
         pvXsFYbxyIkTAOKjIF5nIYHQFUbzfxH5++MrosXRJ25hkN7yaG7B2NvmWz6vrkL3VX2Q
         gXuA==
X-Gm-Message-State: AOJu0YyX2rpIVKFADSaepsoDnU1POLkXDkGrBZvPToCsMSaPTUtaCw3P
	KHr0RS9QwU4/mYvjoCxmd441UAxZgNDqOt/IeEkCdmuW5oHneDenjf3vYoT0sm77i1yQhzNyJKV
	n9ouS
X-Gm-Gg: AR+sD120RId1fQkd8pNE5QlfyAgeBV4SDUBvGfK983hOjNc5FilJOy5X+znqrL9layg
	vztAiW5x9VqTHSs5mHSU2DkqQ2GC0K6Gd30Dgg6WXTnFCCKGjTm6xm05fE6cJyW3prS3NO1whD7
	RU01uEYYmedV6UC5HRjHDVdHOm8azWZiqcAj2w/918ndm3HKSCRZ5TDFVchMTPldau/7hgMhO+G
	J2HbeQabW4rCBxzem4eKsw9q+sz5P91UV1Un5y2abwP/06Gcl9WJYL9E8W2gRX975LSsCgLN22a
	aIRLC+5xWvWZFk8b6xbCy5pygMWNZ++xXGpomeOiJSygy2tmoJ5ks/emSgB628XwEFBf6Z+XVuL
	y744Xw/MN2RQg3xcEhUfIOdPY4MV009Qgrbuc2LYg4TbaHWBhiaR2og2jQy+ZmVo5KFGWwq60D4
	omb2TBQ4QsQT/Xuc3h5Vza7SVz+aW55KmTYxEMcB3kCyGTZr+965n0Inqawqx8FCT4erqDGA5s9
	eMChlneFFXJAque4UMyKkL3xPaWHcAE8eFI/++OnA//QEJSfDbPJc/IzvJr8NNBBsGaFiRX5XhI
	GYfMPAVXEB6RSg==
X-Received: by 2002:a5d:5e8d:0:b0:47f:7786:b00d with SMTP id ffacd0b85a97d-4814564232bmr1789783f8f.24.1786360609006;
        Mon, 10 Aug 2026 04:16:49 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220727bsm35271853f8f.33.2026.08.10.04.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:16:48 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 1/3] coremark-pro: Upgrade the LICENSE format
Date: Mon, 10 Aug 2026 14:16:43 +0300
Message-ID: <20260810111645.1136923-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 11:16:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128878

Upgrade the LICENSE format and don't use the old syntax. Fixes:

WARNING: coremark-pro: LICENSE is using an old syntax and should be
upgraded to: "Apache-2.0 AND LicenseRef-EEMBC-AUA"

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-benchmark/coremark-pro/coremark-pro_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/coremark-pro/coremark-pro_git.bb b/meta-oe/recipes-benchmark/coremark-pro/coremark-pro_git.bb
index 8715da8904..e917d064f9 100644
--- a/meta-oe/recipes-benchmark/coremark-pro/coremark-pro_git.bb
+++ b/meta-oe/recipes-benchmark/coremark-pro/coremark-pro_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "EEMBC CoreMark-Pro CPU benchmark"
 DESCRIPTION = "CoreMark-Pro is a comprehensive CPU benchmark suite from EEMBC that evaluates processor performance using integer, floating-point, and real-world workloads."
 HOMEPAGE = "https://www.eembc.org/coremark-pro/"
-LICENSE = "Apache-2.0 & LicenseRef-EEMBC-AUA"
+LICENSE = "Apache-2.0 AND LicenseRef-EEMBC-AUA"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c84d8f508b20d579641ad151a79a8bf3"
 
 SRC_URI = "git://github.com/eembc/coremark-pro.git;branch=main;protocol=https"
-- 
2.47.3


