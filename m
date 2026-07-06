Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6380BC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:46:36 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147536.1783331191671522071
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ECULisL/;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1407288f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 02:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783331190; x=1783935990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2BNpgAf/gTZ5MtUsRzeU71b20TdgnalTpfY4kZVYCq0=;
        b=ECULisL/qUWw75jBCUbz1B1sMFE3C2iPF3b2OLh2N2r054VP3L8hvMW/YaXSKmkrRl
         LKHbLBxAVSXyiva5oVg3hxNW9jLfy214cKKqYcj5YwqXAKpamEIJruguYA0Kwrsy+uSX
         D07niP/HQkvisImV/AOf7mHU2XLlM9STZFnWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331190; x=1783935990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BNpgAf/gTZ5MtUsRzeU71b20TdgnalTpfY4kZVYCq0=;
        b=YHFbbaykBZL8OiknICgenjQsXVfdcEmg409nO4t/l8NsFJt9Tuy3HLxAsshczNz0rC
         Px1pM/0JwLJym6aLCJCOsk21+Ze6U2ZmvBBAT2Ze0yDg+77vYQJLyd3N1XW5ikEq+H7+
         YDXGTxuS2qlb9+UeT9u+XVlWCBSVqKYbfftQ+J8RgPkZe09FMYYmSFJ67OHjM7dignha
         X9/8dbvUsYFuafekeSByscoecmxlKcnHEG1cB+7yYuqh6xJW9FXNoWsoj1cF5SIFzMiv
         wy9booUmkhLSUslB6/2zR6MKOucCGFzh7ZLlOzbJieSpVwy6Juz8EDnXCRuSWGLVsPoE
         7zOQ==
X-Gm-Message-State: AOJu0Yx+g4FsXlx1IBHrCQrZdTjhQmeqwkCaAilQoSfY96gyVWD9A5F+
	0tH7M13T8tDv8nDyQ2joChCSRvQCjMRFnff+1XlEE1gMJAH2Mb/2zHBR45MA3txtaz/Z28Y1lyl
	dY3+f
X-Gm-Gg: AfdE7ckGuTWUXa561wKTvPFZDNI6Y4zJFjHXlmdMMrWCCF45NeW8QAQcXTFEbAePuVo
	UBF3zjnz4AkJJOp/bHYgVv6wm7z6PVRC6DU0xbVJ0MwXX2+jjDtUvNaAIMZafTY4f+Do+ESz9fA
	gg+kZKQFezu4X7sVGFpsAAvEKp1RAGwZkLOd+QSCVNCmLwkVz6aJMn2OPv7yxXse2/TYVW/5hUd
	v4slg6RAzqtu8frb1p80xbvLHUIxFzY0MIkjJg80kEuHqhNMI6iwxtNdo1Zzv6G23ieO45v4S73
	NK5CRgGbfHGXNtjqbuV9271vuvaIqt6GPD+poRwQwsjD1kshB7bGp90lS0gwesLpYpE57lmz0au
	VlfKiQAZFdo7DUpSqUnD118u93QDzGzWuX5ECSWbFnABT+NvgO156UBTLbX05XZr1iIJJOXgdas
	bbmTvjBtDi3QB1hvX5BVYtnY5Rd9t+0HQq/grYYB4pM4IQorJMRln3apc/XA==
X-Received: by 2002:a5d:6f0c:0:b0:46f:f12b:e456 with SMTP id ffacd0b85a97d-47aaaade280mr10971928f8f.25.1783331189849;
        Mon, 06 Jul 2026 02:46:29 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm22638978f8f.14.2026.07.06.02.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:46:29 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-croniter: Upgrade 6.2.2 -> 6.2.3
Date: Mon,  6 Jul 2026 12:46:23 +0300
Message-ID: <20260706094627.1254799-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 09:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128037

Upgrade to release 6.2.3:

- Fix quadratic expansion of comma-separated range lists for a large
  speed-up on expressions with many ranges.
- Reject a zero step (e.g. 5-5/0) in equal and reversed cron ranges
  instead of silently accepting it.
- Fix expand_from_start_time month low-bound off-by-one so stepped
  month ranges start on the correct month.
- Fix zizmor-reported security findings in GitHub Actions workflows.
- Bump pinned build and CI dependencies via dependabot.
- Upgrade locked development and build dependencies (uv lock --upgrade).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...wer-versions-of-trove-classifiers-and-.patch | 17 +++++++++--------
 ...niter_6.2.2.bb => python3-croniter_6.2.3.bb} |  4 +---
 2 files changed, 10 insertions(+), 11 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_6.2.2.bb => python3-croniter_6.2.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch b/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch
index 4ce2404683..9d8e400b3a 100644
--- a/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch
+++ b/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch
@@ -18,6 +18,7 @@ satisfy the requirements.
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  pyproject.toml | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
@@ -29,15 +30,15 @@ index 657cc21..d1b9ce3 100644
 @@ -1,10 +1,10 @@
  [build-system]
  requires = [
--    "hatchling==1.29.0",
--    "packaging==26.0",
--    "pathspec==1.0.4",
+-    "hatchling==1.30.1",
+-    "packaging==26.2",
+-    "pathspec==1.1.1",
 -    "pluggy==1.6.0",
--    "trove-classifiers==2026.1.14.14",
-+    "hatchling>=1.29.0",
-+    "packaging>=26.0",
-+    "pathspec>=1.0.4",
+-    "trove-classifiers==2026.6.1.19",
++    "hatchling>=1.30.1",
++    "packaging>=26.2",
++    "pathspec>=1.1.1",
 +    "pluggy>=1.6.0",
-+    "trove-classifiers>=2026.1.14.14",
++    "trove-classifiers>=2026.6.1.19",
  ]
  build-backend = "hatchling.build"
diff --git a/meta-python/recipes-devtools/python/python3-croniter_6.2.2.bb b/meta-python/recipes-devtools/python/python3-croniter_6.2.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-croniter_6.2.2.bb
rename to meta-python/recipes-devtools/python/python3-croniter_6.2.3.bb
index a52dc5cbbb..7da022f58f 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_6.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_6.2.3.bb
@@ -3,10 +3,8 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
-PYPI_PACKAGE = "croniter"
-
 SRC_URI += "file://0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch"
-SRC_URI[sha256sum] = "ba60832a5ec8e12e51b8691c3309a113d1cf6526bdf1a48150ce8ec7a532d0ab"
+SRC_URI[sha256sum] = "fb129986ef7e2c44e3f4c9f503da83ad914d2afa48f40a43ee3dca4b5c41d476"
 
 inherit pypi python_hatchling
 
-- 
2.47.3


