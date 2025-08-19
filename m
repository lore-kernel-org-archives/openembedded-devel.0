Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EE8CA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 04:51:40 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.6511.1755579100553392100
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Aug 2025 21:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=M2C7A6h8;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-24457f5835dso51720595ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Aug 2025 21:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755579100; x=1756183900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFkROUcLFgg7MZ8u1H2Gkcb/8mHEjg2XfsXotQlHreI=;
        b=M2C7A6h8nzls95GmqqiEjlmPegPJZ+PMQ+VX8Z4pR/H3xVldW3RFykaCvVTCXOPn2S
         qfd0g3zMhq7eJyK1XqzVRmrng3ifr5C6GPYlErHgSHJzX+UZnvfHeyvQpR/FqsBx5Xob
         h0xZq8ZsizrgAg5NY8sDT69ph+f0yY357CUy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755579100; x=1756183900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFkROUcLFgg7MZ8u1H2Gkcb/8mHEjg2XfsXotQlHreI=;
        b=rjNanIYeQ3aMWqzISJooku4xSYKg/5EHihZvjL/rUMc1DfPsUE6i4Zv6cXUXvkpMyc
         d3YJq7k0sXbt8Qxt+ycyecEfEyEw5AcdSHVOZb1YPaZTMkIrIQvDGZ804f+Nqfwjd4eV
         jp+6jW6y3MMbioMmPcLsdIOSl0cQgyulBwD+ICDdrOw3FUC20OAVVkCsVns2gmLwV3j4
         0l+Olw01kjjWHILIOczf/nnDvCazVlQ3IS/UCvdwiWKi2hkZ/ktQf+gxrGH1h8vq/lT5
         XusCQPJa/BqX6HUnjZzYLkJTK/MqdmAINcglJP1hsc0xgmNFYXjO4qf838IQxxf4Fw2r
         fYLQ==
X-Gm-Message-State: AOJu0YyvmWjbHJeI6JeB/H195mxrF0BiceosGbA5JuxtT4xXdrFsHCUr
	UCu+t8kfGo1bLveQ8BEqhqHb74FZW5SYTgU73BXpIkKcWw0o0atP5gXJ2UxWfI1rya8/KYAiMr8
	ibCZu
X-Gm-Gg: ASbGncu1IttmYPVS/bsGNGHQymCPU+GoYGoTdcJ1dxF4FABnd8jfaPo4isZib91DI9J
	6nD2DE6H94rO+/jVRzgki3Rx47sF9F128Utw6pb529+s8auPs+zHdc2wYTZrM7asHDx7giUMu9U
	ZC9MWsULpkS2CijEo494u0aAHdOD70CyrBtxzTzVwnOs1uix7cdrVb4GXWcsgu/nCXK6ST7xxMb
	wri/I4q5WKnk0QIYTIkd/hvp3lzf3Fy1E5Pz2I07kJZpSUoVzij0hWjjY7RS/OnspCKtIPurO77
	lVycx6DAeIE7C4oDavvWJXBfJRYNmxjJrtCsu5g1LV3dVzCd8yjg5FG0u/LnwdznBnA1ZfhGoWU
	udlOd6oW1sk2Lu3Z1w1iibzPIyWYz040ZKhih
X-Google-Smtp-Source: AGHT+IGmewZOTbxYZS0TqjxNISKHjINqc4AkuEqz2me0RDggdbAh5gnDk+w5z5p7ckJv3QQ2zXGpSg==
X-Received: by 2002:a17:902:e5d1:b0:234:ed31:fca7 with SMTP id d9443c01a7336-245e04ca7b3mr17941395ad.48.1755579099593;
        Mon, 18 Aug 2025 21:51:39 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53eec7sm95325905ad.118.2025.08.18.21.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 21:51:39 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][scarthgap][PATCH] openjpeg: fix for CVE-2025-54874
Date: Tue, 19 Aug 2025 10:21:29 +0530
Message-ID: <20250819045129.38186-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 04:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118997

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
index 231bf84573..586bfeaf1f 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
@@ -7,6 +7,7 @@ DEPENDS = "libpng tiff lcms zlib"
 
 SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
+           file://CVE-2025-54874.patch \
            "
 SRCREV = "210a8a5690d0da66f02d49420d7176a21ef409dc"
 S = "${WORKDIR}/git"
-- 
2.50.1


