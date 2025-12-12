Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0780D4337D
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 08:02:12 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8283.1765526523161853044
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 00:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=knrE8W9K;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso1005708b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 00:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765526522; x=1766131322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86YBYVTQO7goX/4CBDJCzGpm7uK/joE3Q2L+ck/K8FU=;
        b=knrE8W9K2YMpfr8tsmBvY38aXEDILh3oEIN6BbY0Gma4Vr4Z3zumLodjam+fTzJPkc
         GS4VNZFQFpb/Jr22/pI1xJScarh1yIpXVxz/jeoC44xT1/3EENwINeDpF9bo5MQbX3Gv
         0JygQVnu30DubtdPtCklUsLhPoB0LbhJ/PlB3fjcCkpt1HNFoBTcsnPilWzQ9kS4HEoE
         d/Yegg7Xcyq/EGFZZfCc5fqzJyYQWqHGSoHnmqUqjIvGOjJJOTCD9C1KA9hxmGobipKr
         tlmIEL7GBfKUVU9Sr8l1/xGM7ZlNVxSIle8S3D/LoDtyS9S0sjKKy+LdslVVAY4a0CQa
         jLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765526522; x=1766131322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86YBYVTQO7goX/4CBDJCzGpm7uK/joE3Q2L+ck/K8FU=;
        b=Znktl25w74xBxzMPNuBWKYEwCc6E7VKxGmTjTiBmjPz/vs3GCgRU7CZeMWgkkXLKZp
         6xC+Bn7XvQmnmBtBpCtvzEfy3slpjmndFoRMm0x/XWmR/wxkHw5V1ImiunX7awtotr65
         5LaSEipGceGvPMp5simOSj0a13SXDDAUtS9y9/1zf/QW0SCpnyJneFaU6XVYDGcI44PQ
         KhClE83pSuZdxevQ9hNpLXD4LOZIDVZt+/a7y0S5y0GN9y44ZOgiKaLHdtKLUes+TM9j
         9Mkan5isY1DJ516T4dJBWny7AcwHKoDXJ3ftNJvz2kZVdajgQXAXGROLPiJLFxWOlrxu
         ZjAA==
X-Gm-Message-State: AOJu0Yxa9sAWZOfcl7TUEyPbKSZft1fYEl0+E6Dua/UYjyWZjDfRB1g1
	Z64eJngfXM7J5VIdRXio5f8FSb3DerKKphVwbvRcjY/RwQy/nZK78RS5AkAjIw==
X-Gm-Gg: AY/fxX4t++VHBuDtD0JQfyXtqlMtNG9/uV4S895IX8LjFh1jXggJUSDQla16g0zoNxA
	F+mYCaQEu/E6VBfdcMi0f9FWqwZrWyG+jZYtgiPFLaSgkWyPomhc9nKtBlfuea6yZcS0WvfQjKr
	n7QL0AbQWaQiO8e/dfrQWkDlpJXEDHsTunfm6YH7XgduAFtXvgSKnRIpL3h8qYiR/hQkDHmD1oz
	zD197LJD2mxLpcxBGz1WqM0+TCMhH3NcKT14K/1Y2zq0MFag08YNQYM0txevBZKYdVNMfy9J6JR
	mynhmDGnBt11RkhkJCiAU92KfmkZl9ieIX+F7bzpdHAI7BWa8BoAcU6bhoLSotnQ2inc/Y2vEtD
	NcdvcheBG5w0wm8JTTd22lvaVWGR7iJ+XsXdBGr0afBBWEMkS6zRQKRkQ9g4IVSetDiWzDh0g71
	II9h+FuJk/6VouXOctqZfvjekHDixwVEm1HA==
X-Google-Smtp-Source: AGHT+IFloUAEt6KzFCEVz0i1iPO9qVqXZb8M7C9n/p2zp4irfyypwB43flxPtOy1YolkNdmDtIkn2w==
X-Received: by 2002:a05:6a00:4407:b0:7f1:14a8:1cd3 with SMTP id d2e1a72fcca58-7f6691b0937mr1272373b3a.32.1765526522211;
        Fri, 12 Dec 2025 00:02:02 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093c4bsm4494882b3a.48.2025.12.12.00.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 00:02:01 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][whinlatter][PATCH 1/8] gssdp: upgrade 1.6.3 -> 1.6.4
Date: Fri, 12 Dec 2025 13:31:44 +0530
Message-ID: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 08:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122589

From: Gyorgy Sarvari <skandigraun@gmail.com>

Drop patch that was incorporated in this release.

Shortlog (without CI-changes):
client: Format Since/Deprecated versions in a way gi-docgen can parse
Fix template to use local mirror
gssdp-enums.c.template: use basename instead of filename
resource-browser: Make regex pattern static

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a78826db861060ac04a27ea5b388c48dd668c7a6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...mplate-use-basename-instead-of-filen.patch | 32 -------------------
 .../gupnp/{gssdp_1.6.3.bb => gssdp_1.6.4.bb}  |  5 +--
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp/0001-gssdp-enums.c.template-use-basename-instead-of-filen.patch
 rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.6.3.bb => gssdp_1.6.4.bb} (82%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp/0001-gssdp-enums.c.template-use-basename-instead-of-filen.patch b/meta-multimedia/recipes-connectivity/gupnp/gssdp/0001-gssdp-enums.c.template-use-basename-instead-of-filen.patch
deleted file mode 100644
index 63126520e9..0000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp/0001-gssdp-enums.c.template-use-basename-instead-of-filen.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 78270f9159a9ec7284ca39a2fbb1774347942de1 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Wed, 24 Apr 2024 19:08:43 +0200
-Subject: [PATCH] gssdp-enums.c.template: use basename instead of filename
-
-This would prevent the build path from leaking into the source code.
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gssdp/-/merge_requests/13]
----
- libgssdp/gssdp-enums.c.template | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libgssdp/gssdp-enums.c.template b/libgssdp/gssdp-enums.c.template
-index 600d426..2dfb859 100644
---- a/libgssdp/gssdp-enums.c.template
-+++ b/libgssdp/gssdp-enums.c.template
-@@ -3,8 +3,8 @@
- 
- /*** END file-header ***/
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
--#include "@filename@"
-+/* enumerations from "@basename@" */
-+#include "@basename@"
- /*** END file-production ***/
- /*** BEGIN value-header ***/
- GType
--- 
-2.44.0
-
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
similarity index 82%
rename from meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
index e6ea472709..b601037608 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
@@ -6,10 +6,7 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/gssdp/-/issues"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI:append = " file://0001-gssdp-enums.c.template-use-basename-instead-of-filen.patch"
-SRC_URI[archive.sha256sum] = "2fedb5afdb22cf14d5498a39a773ca89788a250fcf70118783df821e1f3f3446"
-
-GTKDOC_MESON_OPTION = 'gtk_doc'
+SRC_URI[archive.sha256sum] = "ff97fdfb7f561d3e6813b4f6a2145259e7c2eff43cc0e63f3fd031d0b6266032"
 
 DEPENDS = " \
     glib-2.0 \

