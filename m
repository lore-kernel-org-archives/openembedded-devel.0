Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEED8C98309
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:14 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4269.1790160072543930406
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e4ZEWNhK;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so486952b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160072; x=1790764872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y7OH3N97cuSGJS7QQOhStfEz4BBpeRTGHIEiPXRXI0k=;
        b=e4ZEWNhKBrHp63Og1r34LqPMepVVu+POFGn3L87AdZh1KeoyKiEUSyigcfY6tp/WG6
         jTN6JQ3Z4/wQzYBs4Mosk0xG+tUy55hYN0eTpppQ9Il/zFLEg7IQBiusBq4Xzj0YqpUm
         m98MuX+fcXA8jnLhsQB4doHzL2bPmMC+388+m+xOqZr9MbtSa0ZrDhOqsCf981AEWl4d
         UIRnLcKc7HQjlDPd+YFWTsOYH37+cePEMP0UvqcsnUMr/DdMoknsT8eANZ96wv9xrn+K
         lAhZQ644GGgZhTn7nzjpDrOAaGGFJf0GflqgUnJGv86xM0U7mHW/ng0T1iCuS5qXc2P9
         /6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160072; x=1790764872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y7OH3N97cuSGJS7QQOhStfEz4BBpeRTGHIEiPXRXI0k=;
        b=fZlaCFyJYGjHk3b45VKeb7pjfH/j3hM0eiBqxnpRldO/Oo5DJ4cM4IdAU6o7kga8cV
         QTqGBXLwzXO/llMY6sjm4Ch2srHgWOw06mPUl6x+BoltSIPojFeEOAZQBP/jZ4xR7qWI
         SHp7TPNAwDWVzXZxlV3KQKZzJdrjyeyLYlAbr0RhaUg7I8o3qb7RtgTgGqMNroPTSc7w
         oF+O7kjCdgrDxZkLeJrTnDh6YWdFksQl5nBJKWRcZ2Npwc8vcICOR8Y92jKc1ZJmHAjT
         Ecff5feEEGTnk4j363cxITRmnxNNfrlZzvY+eA8US2Ynv0JX4Ph2hIu26a107D45/gsu
         5Svw==
X-Gm-Message-State: AFuF++nz4O8RvTTiT2h5hTrJNyWnu95Gzbqt+/SPraF3O9BN536sOJYH
	3f0LfK86dAbVnKT9Im9RaHCds8zj++5y+0Mzl2TcYlNR1fRW2CvI2Gu3GFNjig==
X-Gm-Gg: AYBFou14rzsWKzV9VrEQp+KqMYDSU69XsWePZbjDk66feHyNMpqZpPFECZDWaxQ3nwP
	E9KtV4p8sRXW3NEdwTDdAH7KUScT4YRcZcC83CUJxSdWxvrIz6+MP53QaDq98m+7Tlf/nfn2lXn
	rCNKNagczIUeXfQRNFq9tj8quxYU3p6DpETP97v5OAQv6na3r/PfYPXc4aYBJ4nRKuerboRVvGK
	prTanziwjewrYjEwIxCPJGdrC5oj42OjwMAtSGsNgyxY0smVpviRUNPWJBITswQjRlp6b5/mp0A
	FYSfgLdwmfxGLspPV+3F9cKeENGBh0WDwu9vNwUTwfhCHtBkfRd7AuC1xj2r3h6ISkKGoczo2q/
	FbarNipG+JRVPFMHWjBKEwH6bXiqMtSJXxD+tEIfp0nb82+ZP91jxldLAdNtI2QxYlZPCdkh5l8
	MzOlcntGCBobbpq3o/Q/q1X5DNOiFsR+L3T1m0Xho4N7o3x45RUtEYZOKcldCDWC7rUc/kYB79j
	fB3+fQtGwBveAWQJprJMvA=
X-Received: by 2002:a05:6a21:3949:b0:3dd:85a8:4c61 with SMTP id adf61e73a8af0-3ddf7ec2abcmr2019559637.40.1790160071842;
        Wed, 23 Sep 2026 03:41:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 6/42] flatcc: patch CVE-2026-90785
Date: Wed, 23 Sep 2026 22:40:20 +1200
Message-ID: <20260923104056.457360-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130193

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-90785

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../flatcc/flatcc/CVE-2026-90785.patch        | 29 +++++++++++++++++++
 meta-oe/recipes-devtools/flatcc/flatcc_git.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-90785.patch

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-90785.patch b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-90785.patch
new file mode 100644
index 0000000000..82f4f9e02f
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-90785.patch
@@ -0,0 +1,29 @@
+From d44946b10f4da3c2c7b46e0a58bb86f9b5e9f342 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mikkel=20Fahn=C3=B8e=20J=C3=B8rgensen?= <mikkel@dvide.com>
+Date: Tue, 4 Aug 2026 20:01:22 +0200
+Subject: [PATCH] Avoid processing structs recursively if recursion already
+ detected (closes #388)
+
+(cherry picked from commit f705032346ee39efd7d3848c50b73d455d28d06d)
+
+CVE: CVE-2026-90785
+Upstream-Status: Backport [https://github.com/dvidelabs/flatcc/commit/f705032346ee39efd7d3848c50b73d455d28d06d]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/compiler/semantics.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/compiler/semantics.c b/src/compiler/semantics.c
+index 21ff948..2b49eee 100644
+--- a/src/compiler/semantics.c
++++ b/src/compiler/semantics.c
+@@ -505,6 +505,9 @@ static int analyze_struct(fb_parser_t *P, fb_compound_type_t *ct)
+     uint16_t align;
+     fb_token_t *t;
+ 
++    /* Avoid triggering assertions on already detected circular references. */
++    if (P->failed) return P->failed;
++
+     assert(ct->symbol.kind == fb_is_struct);
+ 
+     assert(!(ct->symbol.flags & fb_circular_open));
diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
index a6bf3c1cf4..b3cf7bed04 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
            file://0001-Check-for-C-standard-version-23-for-__fallthrough__.patch \
            file://0002-allow-build-with-cmake-4.patch \
            file://CVE-2026-90786.patch \
+           file://CVE-2026-90785.patch \
 "
 SRCREV = "1653ec964730ec7d9892a08a1695ada6d20f5196"
 

