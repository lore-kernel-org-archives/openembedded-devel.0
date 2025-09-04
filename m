Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988B8CA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 04:45:27 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.31876.1756961125278045266
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 21:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jvEwbsyy;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-248ff4403b9so5959725ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 21:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1756961124; x=1757565924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=13N00zkqbqLUMe4EDGK3AcznHr3LrdDJTuujHC4cGx0=;
        b=jvEwbsyy/3V2BEzzAezB3aE1MEQbJCEjuoRzXPtfoMg487YG3azW5/R4M9udP6SQ0f
         C+3Roc3eCcLNQeA0GaKv/zF7woP/PKhwx6kOybupcxDPnMdH3Ifqd3mmkVlfyGNABIoM
         CBPYPSTfWhM6BlNDBIxeHdnwR/5PiiHDtV9C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756961124; x=1757565924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13N00zkqbqLUMe4EDGK3AcznHr3LrdDJTuujHC4cGx0=;
        b=ItJ8hCmxqwI8OCYxm+W0iEFTXASz1kOvVGnuFCZqbTXdRxXrybu0wFC84A1gw6QJ3p
         irs8w4hZHhpOScaGb1PPMhFXU+9m045y+A6FtZJcVYv9Z8ae+OXLNDX80gJ+XV1j/E9u
         t7dbAotDC+/uJVUTW9s76MngwKkyjzkt9Fw/ZF4W+u2TMv1jxPyLPYnf1wlgKpmxpyzu
         UtECdFnzYTyRF0WNUbHcrJ2XDhDS2dJc/NHgh9G3GKnvOSel1zxvG45KH9BT994SlWTD
         KTBuK6o9OzRIdtvTwTS/e8bdTzo15QMEudRFoRR9dIrJiEzGPumSQ1gZoQ0HmXlEJw5m
         8dqA==
X-Gm-Message-State: AOJu0Yyi8kVFxO27MwcTWOJ7mTswwFt7UMlfya30MHzjOtLzCNH6f0RW
	9g+20aPlgQkvYjYSIhAqJfd7AEQhHw2om4gjzyh3gnL80xV4EfHZyq7FJzekHn69IhanFf7pDDk
	hrZXY
X-Gm-Gg: ASbGnctDLGVg0voB0lXZFkJn1BvFmO0AKAILNU6bdrPkohidzKiZniW7/ia5jOY5qFG
	3ZSGYrwK8iiaW0G9W8p/2YBg69Ym8249nvy+eH2cbxz3+PkEMGa53qUiIkRo8rqj1ZHmOSNi/3j
	tFb7MqDb8ROaEe1zvo+dJsZW01Ya1eS9iSs6OkpWh6ukuapPhojQNEwaGN0zVJgMtARdl4zRx8c
	8w5miAUdQ5Xq6n1jA9P7SX5RFouZO3LhW81rPQF/bJmVuIN62Rk9mC7hDnZuVKEUcOuas1Bff6w
	E6YW2lR3CFFaksOCG4tMEZc7o8lYDrb7QMibuDutv9lW5qh0RcW8aKlcO+MNQt5CT2woLc5AqHk
	mlcj5/LAko/yWwBwkWJh9dqFv5hVthzKBOwU=
X-Google-Smtp-Source: AGHT+IF+o+55t8ngXgbmD5kdOC1JU1naVeP0AkEFLC1KB7rYND1J4SCgT5gRTOpmflDFeq4cYS3bBg==
X-Received: by 2002:a17:902:f68f:b0:246:2e9:da9e with SMTP id d9443c01a7336-2494485bb9bmr255007175ad.6.1756961124398;
        Wed, 03 Sep 2025 21:45:24 -0700 (PDT)
Received: from MVIN00016.mvista.com ([27.121.101.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cb28c3126sm17648505ad.65.2025.09.03.21.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 21:45:24 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][master][PATCH] openjpeg: fix for CVE-2025-54874
Date: Thu,  4 Sep 2025 10:15:15 +0530
Message-ID: <20250904044515.9604-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 04:45:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119269

Upstream-Status: Backport https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../openjpeg/openjpeg/CVE-2025-54874.patch    | 44 +++++++++++++++++++
 .../openjpeg/openjpeg_2.5.3.bb                |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
new file mode 100644
index 0000000000..187557a35c
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
@@ -0,0 +1,44 @@
+From f809b80c67717c152a5ad30bf06774f00da4fd2d Mon Sep 17 00:00:00 2001
+From: Sebastian Rasmussen <sebras@gmail.com>
+Date: Thu, 16 Jan 2025 02:13:43 +0100
+Subject: [PATCH] opj_jp2_read_header: Check for error after parsing header.
+
+Consider the case where the caller has not set the p_image
+pointer to NULL before calling opj_read_header().
+
+If opj_j2k_read_header_procedure() fails while obtaining the rest
+of the marker segment when calling opj_stream_read_data() because
+the data stream is too short, then opj_j2k_read_header() will
+never have the chance to initialize p_image, leaving it
+uninitialized.
+
+opj_jp2_read_header() will check the p_image value whether
+opj_j2k_read_header() suceeded or failed. This may be detected as
+an error in valgrind or ASAN.
+
+The fix is to check whether opj_j2k_read_header() suceeded before
+using the output argument p_image.
+
+CVE: CVE-2025-54874
+Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/lib/openjp2/jp2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/openjp2/jp2.c b/src/lib/openjp2/jp2.c
+index 4df055a5..da506318 100644
+--- a/src/lib/openjp2/jp2.c
++++ b/src/lib/openjp2/jp2.c
+@@ -2873,7 +2873,7 @@ OPJ_BOOL opj_jp2_read_header(opj_stream_private_t *p_stream,
+                               p_image,
+                               p_manager);
+ 
+-    if (p_image && *p_image) {
++    if (ret && p_image && *p_image) {
+         /* Set Image Color Space */
+         if (jp2->enumcs == 16) {
+             (*p_image)->color_space = OPJ_CLRSPC_SRGB;
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
index 6c383e3423..fff73ee46a 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
@@ -7,6 +7,7 @@ DEPENDS = "libpng tiff lcms zlib"
 
 SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
+           file://CVE-2025-54874.patch \
            "
 SRCREV = "210a8a5690d0da66f02d49420d7176a21ef409dc"
 
-- 
2.50.1


