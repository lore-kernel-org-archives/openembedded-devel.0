Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7171CD4F28
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:55 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17895.1763014851317514456
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GdUVHofw;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7afc154e411so254175b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014850; x=1763619650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twQCPofyt2vlS5vzJdtLZEZ0Rxl7eXX/ztNm6f98jFA=;
        b=GdUVHofw26AXSuO8Rk5M8TnJNleWNG0sjUuVBea+hdzYYoDlHQO2fJbybuq0fS9a21
         Xil1yvBOhocPuwL9Aij6YOCHB4Id7E3bajvp68TvuukcWfnlG7cKKV9spFNzJ4lvzXRq
         wG42ypAHy4BZ7f3y2vgA45qGHFw2vS+kQinhGBz35amsI8kNw6vwxIUzM52N0wCxHnrL
         8iJQQqjrHEDKfedHELLrHTUl+e7oZPxT1hrqcR3dwTT/SGNvAiXsY9pecECadH+lmEhZ
         zl+fLkIiY1QwTdSI6Hefdjxik7ijf4PBhiwPt4hNSI529yCHXlvAjnY3G8Q9nZyGw6cd
         OGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014850; x=1763619650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=twQCPofyt2vlS5vzJdtLZEZ0Rxl7eXX/ztNm6f98jFA=;
        b=Tx1mka3ABbuyp408kxv0y3sl8N4HvQ2DBcqyiCEa3JCy6P4r/QT6q5ndGaxMkAIzqx
         dMsi+cEgo/vXIABIW1ri49v3nE/+O91huIPvx6pHLeg/sbqfxkjARVZPJFhaREgnvVXC
         8YPLcSdykpm97mnxlGrJVCUjceCFSsTYmarVc9f0NC9hpIJmqF2iF4gC2/J+2q0rXXcy
         6Fxspu1+Ca7PK4sqH1qChmdSswYaDB6bMl9Rd0INDSwKXk5hojeHd2lcRbn+uZ8ta1aP
         3tqnfTv5xFGrQH5dzSBIokmmRcZ9bCsW4hjPyXr/KCmGoIAfDd5xOtz7iP+usHQemgEF
         abQg==
X-Gm-Message-State: AOJu0YygQOp8NV6SHCorMXIAIi6VzdhjEZQM7tWed4onYeRnGiI46Jig
	LbZtLeVUa7xASQMpKHVrHiZFm51+otV+SWcneznzXT7Q0ZIikq5KYLsrWH9/Jg==
X-Gm-Gg: ASbGncu0UZbdmKVLHHtddeXqC5N95gV/sTJsP/el4+kTilM6jcO2uo3yIYt5mKnrhyf
	ZHUW9yEqUBNQ4yxZ9hqzshiWFi9UuY2eYRG5l4G+ZBLtz7Kqs2xa6rIuMu8RWgGUSI2YMkyfHyp
	3nT7BbzidWhFZVQ0RELOK8ZhtfnvPZc80Ingjxpm47qn3XMNVZx4ptoFa2+R6wHnUC9GNSkFxg3
	lOU92OykygtVWFkOdw2Kgu37Up6EGpSAeTnEV2h0OxboBbpCllrlFdrhfaowMelNCfj6AU6xQ1U
	az8cXWN4IL+o6qQw1Auh6V5FaHv33d+PbPNXXSMM4sgACA3HsCRhONtSMFEClPTqqzwO3nijUh9
	pqsLaNY/8Q4JJ/spblLx/hI70/Avld4bLAJRZSNZBrm/fXkZ7edxynlNlCZ2YTRm6nSPQfyQAMV
	eE1EnDj4mowL9ynw==
X-Google-Smtp-Source: AGHT+IGtYlXpTHQUctiUgjm8aokfFpvIgOwiT/oZZvZYkDY1kJywPu0DXDXNJQkUImDLRz2i+3thnA==
X-Received: by 2002:a05:6a00:2e98:b0:7aa:4b8:179 with SMTP id d2e1a72fcca58-7b7a299abacmr6443032b3a.1.1763014850520;
        Wed, 12 Nov 2025 22:20:50 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:50 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 27/38] openjpeg: upgrade 2.5.3 -> 2.5.4
Date: Thu, 13 Nov 2025 19:19:02 +1300
Message-ID: <20251113061914.3756301-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121625

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2025-54874.patch
removed since it's included in 2.5.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2cc81690424b6134a05bd6f6fb612501bd3534ca)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openjpeg/openjpeg/CVE-2025-54874.patch    | 44 -------------------
 .../{openjpeg_2.5.3.bb => openjpeg_2.5.4.bb}  |  3 +-
 2 files changed, 1 insertion(+), 46 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.5.3.bb => openjpeg_2.5.4.bb} (86%)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
deleted file mode 100644
index 187557a35c..0000000000
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f809b80c67717c152a5ad30bf06774f00da4fd2d Mon Sep 17 00:00:00 2001
-From: Sebastian Rasmussen <sebras@gmail.com>
-Date: Thu, 16 Jan 2025 02:13:43 +0100
-Subject: [PATCH] opj_jp2_read_header: Check for error after parsing header.
-
-Consider the case where the caller has not set the p_image
-pointer to NULL before calling opj_read_header().
-
-If opj_j2k_read_header_procedure() fails while obtaining the rest
-of the marker segment when calling opj_stream_read_data() because
-the data stream is too short, then opj_j2k_read_header() will
-never have the chance to initialize p_image, leaving it
-uninitialized.
-
-opj_jp2_read_header() will check the p_image value whether
-opj_j2k_read_header() suceeded or failed. This may be detected as
-an error in valgrind or ASAN.
-
-The fix is to check whether opj_j2k_read_header() suceeded before
-using the output argument p_image.
-
-CVE: CVE-2025-54874
-Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d]
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- src/lib/openjp2/jp2.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/lib/openjp2/jp2.c b/src/lib/openjp2/jp2.c
-index 4df055a5..da506318 100644
---- a/src/lib/openjp2/jp2.c
-+++ b/src/lib/openjp2/jp2.c
-@@ -2873,7 +2873,7 @@ OPJ_BOOL opj_jp2_read_header(opj_stream_private_t *p_stream,
-                               p_image,
-                               p_manager);
- 
--    if (p_image && *p_image) {
-+    if (ret && p_image && *p_image) {
-         /* Set Image Color Space */
-         if (jp2->enumcs == 16) {
-             (*p_image)->color_space = OPJ_CLRSPC_SRGB;
--- 
-2.50.1
-
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
similarity index 86%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
index 586bfeaf1f..945abbcc35 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
@@ -7,9 +7,8 @@ DEPENDS = "libpng tiff lcms zlib"
 
 SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
-           file://CVE-2025-54874.patch \
            "
-SRCREV = "210a8a5690d0da66f02d49420d7176a21ef409dc"
+SRCREV = "6c4a29b00211eb0430fa0e5e890f1ce5c80f409f"
 S = "${WORKDIR}/git"
 
 inherit cmake

