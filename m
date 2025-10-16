Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD97CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:10:32 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.4592.1760609429964241260
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 03:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VSmw4j+/;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-290ac2ef203so4462415ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760609429; x=1761214229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ftnUUMfm/4UipFQidhDWW5MBel6fThZWECZkzEQB9I8=;
        b=VSmw4j+/9z6bMB50XNt6djZ3JqLzSmuhAVq4vwFqFI5aj7cwNrYo4Df64FqwjeNb4h
         UfwjRhFRkN+PO9FlvlR2gARdEf9iFMJ43SjXpFpeSTm/i5UNguTOPhqXFI4iZ+J14jXA
         Z5CK+z1bd2TwK3sCUHoQwjNNdlFuxyIbPq0X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609429; x=1761214229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ftnUUMfm/4UipFQidhDWW5MBel6fThZWECZkzEQB9I8=;
        b=HcFK7eEx8eP4QwbKVx9WRxjcDYje65vfj5JO7BoSpckYeV3cxRPqVCz5IqtNZh/vPy
         XXcoRtlpBeY4xn/RXTynjEqUAnRhDX5msm60vd+Emzs46oNoQ/CBCqizmZjU8GRZKvfw
         oFO4Bd4YThdS+KjCdw9zVS1kzm5h2oyNk7Eg7MpOCrNm06rw2pEa72KanUG6t3PisDcR
         1iXZZzh5jRITT+vT205L8FqIL3xOlFNfqv0nqbd0qBXqoqEP0AvoVJT+bcpzCpeax6ju
         mFBhTtXsamxonmn+KEMyOLOFevjjmBRiU1SrhIB/hz4kdsmxTAOCxkbpCxVggx4n3S4p
         AtNg==
X-Gm-Message-State: AOJu0Ywf/9mbZo4/IrUOLdVDmFR7GJ+jnCOwGbbbXp8IZloux1s2FshX
	3Xp4zEpbUHFtpwd7YznbzJ4hJ6m2ZKt81izUYm0m78cL9pnO4mCP2zVNn/P5SCMdO25B6TN7wTn
	G0MSiyE8=
X-Gm-Gg: ASbGncusJ/20Z2B2sj2uKy+AjajPy7s0B4F178hBzizi2tl2LTcc7DeQgqV5S1tRq+K
	0KPBz7X4d/z2Cd7zAZIO5gbTBBjFbnSQEuxAPslahYM2jeqyVvih+ZI2FPuYejgRBNeMdpwD/RT
	rGVJKg1hdMelrWjsuOy0VxdpibD6i/G/I5qbM886hDssXLxUTplzuVOphj35vUMfippr79g9NKM
	WFkf7SAIbxb+KBZb+XWMkbJJ5THsYe50o9CMJAeV8GwcGYL7KV/Brj0PCCMZFyxl+ySII3te5Cz
	VBKXPb1pQCJv43KS5J+ELlbFSxnPAQ4evH72xGi4knGaDxGHhEDQt5vUmJP2tC4Hjn0xn3fcAUn
	8InFYmnTqIZLvalPsdiFgGdfgG8TtENgza6j6fiMDSIlHVuRBU1m/xyNxeCF7HGvbUNXi+O1SiH
	Eu9cQ2NDczNvzXlUxCiiQkDSTh1w==
X-Google-Smtp-Source: AGHT+IE+esun5Fe5RW/vKbm6kyY9/WFOqA/E7ulpycrK4lL0oCBet72rHZYdG/9Nu8LRZY0r4huBWA==
X-Received: by 2002:a17:903:1a8e:b0:24b:1625:5fa5 with SMTP id d9443c01a7336-29027356c0emr376028385ad.11.1760609428929;
        Thu, 16 Oct 2025 03:10:28 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fcc:1614:2a1b:7928:3155:7a64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7cebbsm24617685ad.64.2025.10.16.03.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:10:28 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/7] redis: Fix CVE-2025-27151
Date: Thu, 16 Oct 2025 15:40:14 +0530
Message-Id: <20251016101020.279084-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 10:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120729

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/redis/redis/commit/d0eeee6e31f0fefb510007a8cfdf5dce729a8be9

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../redis/redis-7.0.13/CVE-2025-27151.patch   | 32 +++++++++++++++++++
 .../recipes-extended/redis/redis_7.0.13.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-27151.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-27151.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-27151.patch
new file mode 100644
index 0000000000..c07243a05c
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-27151.patch
@@ -0,0 +1,32 @@
+From d0eeee6e31f0fefb510007a8cfdf5dce729a8be9 Mon Sep 17 00:00:00 2001
+From: YaacovHazan <yaacov.hazan@redis.com>
+Date: Tue, 27 May 2025 10:23:27 +0300
+Subject: [PATCH] Check length of AOF file name in redis-check-aof
+ (CVE-2025-27151)
+
+Ensure that the length of the input file name does not exceed PATH_MAX
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/d0eeee6e31f0fefb510007a8cfdf5dce729a8be9]
+CVE: CVE-2025-27151
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/redis-check-aof.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/redis-check-aof.c b/src/redis-check-aof.c
+index e28126df603..5b3ee2a48c5 100644
+--- a/src/redis-check-aof.c
++++ b/src/redis-check-aof.c
+@@ -547,6 +547,12 @@ int redis_check_aof_main(int argc, char **argv) {
+         goto invalid_args;
+     }
+ 
++    /* Check if filepath is longer than PATH_MAX */
++    if (strlen(filepath) > PATH_MAX) {
++        printf("Error: filepath is too long (exceeds PATH_MAX)\n");
++        goto invalid_args;
++    }
++
+     /* In the glibc implementation dirname may modify their argument. */
+     memcpy(temp_filepath, filepath, strlen(filepath) + 1);
+     dirpath = dirname(temp_filepath);
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
index f22d65462a..22163d9e74 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2024-46981.patch \
            file://CVE-2024-51741.patch \
            file://CVE-2025-21605.patch \
+           file://CVE-2025-27151.patch \
            "
 SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
-- 
2.25.1


