Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70AACAC5B2
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 07:57:14 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.7183.1758700630484215542
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 00:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GNGZPYwR;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-42486ed0706so28144155ab.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 00:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758700629; x=1759305429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oxYO/5My4zODQyPasxBS/KTaHh+jipchy5LnEYIl1M=;
        b=GNGZPYwRj/l2IM/ZQRPNxEVpbRT7dg/w30awOFuDMescN/4Aj3Gh1wbvWrCoK08IOr
         8A5aqj4uyHXw24npHxr/iCwTVAryWIMh09qWJbijkaK6ZcEbg5D0opM6mInXix2t8U0D
         LgCnseVIIhrnno2InUQqA3kf69mmhqJPtarcHEltrOyGIQmizgrtLvismUl4F2FXLVjI
         kqbAVfHkJRGpSbJzOlw9B9S0OP3ForGQXVy4jcE4CNd50i7jxoaF7vZ/BF0MvVyt+f2m
         Ky4HjvdCo5o78eOnPbmmBh3dcXgIHX37kQGSNZfDxV90hAr0tQtcO8vZxx9wWZF9AHxk
         3B8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758700629; x=1759305429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oxYO/5My4zODQyPasxBS/KTaHh+jipchy5LnEYIl1M=;
        b=IMmq+jRIc/Ye3p21ynQIAGbcU7asXzICdVFMtLuKJ5EHyY3UzWjX7W69UPv2OpMXlx
         gMEJcwsTwSem2DH38/Fo8+bRVWTPuiQRwec/eeBR3OC7KOg5OYo833JTFRRmHx63sNzY
         IiBDSXmiknChqRrokEDlnaqhN1lZpd37CowVEIfF7JJzwY8H2EyHQMTos9+ip6tcbvxj
         A+rjj6EnPAAC7NvNzIMrft3DooFRiTOx866EWp5Yf9BFWoQPcDjqnVk5UtAGa+E2I5Gy
         0F5j56i4VR3QV8O7/0PeWJT8GsbaXs5HrhhXTthq0LnnyPhTnjkUU3g68OygV7CZcsXh
         A9xQ==
X-Gm-Message-State: AOJu0Ywy804yNNKgNy7YZuhrbrZI1QG7LQf4UtC0OrLt8Rj/ogHO8lxr
	MRtagfpzhQAtrDW/BmlMDFURu1DifGv1kGwcWYVTsmwPpXifi94+v6XRWvrlSw==
X-Gm-Gg: ASbGncsZFToDXy/z1i9citfwHwFavdTYpc/W1dtPJW4yCa542aDd9Val430pLBgXOc8
	eFMeOLVBHz/vHTcZ9r2HetNgRvmxPLFazkp6kmLsZRVClbLC0CfzGgpzI3I4gm0u9+hmE80a46d
	T5Nsf3aLctxB9b7npBgjK2VBdQY3Bf7LtjXuA4PMCNxMtTUEVeMp5eKx24012dF52jQR1lAMVVT
	FpC/96bc/lAjR6agk76ORSvqKeKdBp0Y3Z2ofu3pgUsT/5Zz3LnE1a4M1hQBgucC9rPmh/NqQ3a
	6exLk0o2fL8kyn3CCoPQGyRppE8QsorDRnXPFzrkKVKr5I9/jqkjxch2xlLUUoBcosQX5nmvWDs
	MiQ+dCEYMPrmHQrxNKWtRQfz6QD+/JX3MNjvh1aRXV7lda3kk8J+N
X-Google-Smtp-Source: AGHT+IGzXmvOazEZ35YfduNwh+K/1XV9rERbZwPNzYIEAc6cGcTPsFb6LZaZI0ROcWY7jhE2GUAQjg==
X-Received: by 2002:a05:6e02:1d93:b0:424:cf7:7d04 with SMTP id e9e14a558f8ab-42581e10ec9mr84438595ab.4.1758700629136;
        Wed, 24 Sep 2025 00:57:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.253])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-55dba4465f4sm3203576173.37.2025.09.24.00.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 00:57:08 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 4/6] fwupd-efi: update from 1.6 to 1.7
Date: Wed, 24 Sep 2025 19:56:41 +1200
Message-ID: <20250924075643.2047506-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 07:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119759

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Remove upstreamed patch.

https://github.com/fwupd/fwupd-efi/releases/tag/1.7

This release fixes the following bugs:

    Fix compilation with GNU-EFI 4.0

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b572fdf8e12c18ad4d349eba692cace4ce584039)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ..._binary.py-Use-env-to-detect-python3.patch | 23 -------------------
 .../{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
 rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb} (90%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch b/meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
deleted file mode 100644
index c362681421..0000000000
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 4c8f95fedecbc590eb7cd98aaf97912fa36b8f2e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Jun 2024 23:58:36 -0700
-Subject: [PATCH] efi/generate_binary.py: Use env to detect python3
-
-This enables python3 from native sysroot correctly
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- efi/generate_binary.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/efi/generate_binary.py b/efi/generate_binary.py
-index 443472a..a4611bb 100755
---- a/efi/generate_binary.py
-+++ b/efi/generate_binary.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- #
- # Copyright (C) 2021 Javier Martinez Canillas <javierm@redhat.com>
- # Copyright (C) 2021 Richard Hughes <richard@hughsie.com>
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.7.bb
similarity index 90%
rename from meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd-efi_1.7.bb
index d72f2d9c53..1052437669 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.7.bb
@@ -2,10 +2,9 @@ SUMMARY = "EFI executable for fwupd"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/fwupd/fwupd-efi;protocol=https;branch=main \
-           file://0001-efi-generate_binary.py-Use-env-to-detect-python3.patch"
+SRC_URI = "git://github.com/fwupd/fwupd-efi;protocol=https;branch=main"
 
-SRCREV = "58a2928f778278ab1f7f8fcddbab81ba587a8962"
+SRCREV = "cfd0be286a9b050c1aa4bfa3f0820256903a264a"
 S = "${WORKDIR}/git"
 
 DEPENDS = "gnu-efi python3-pefile-native"

