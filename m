Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11325E9DE50
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:10:23 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127056.1775718618293867308
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LUwqOYgn;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c742b9b7727so187435a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718617; x=1776323417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00RQOokKaC5am9I7qdgcPBi5+qnJv+71xl1/N9uduTg=;
        b=LUwqOYgnSmq1Y66iN+/Pz/3UJKu/88W+8Q1ajwAZBX29xoYk0mrNO5W0KNSCEDlan1
         xtsaKM+1SXOmkn6JtEzDrJWoG/i9Qkwxa6CydgeDjCSRVavWHuatCYwe3ucyMFC38LET
         1eqvOM54h95uOXBVefpBIT5izo5KgPziZI/9/zTs/OfRk6vuNpMoUxp+N2VYEnGOdfQb
         1MYkoAPX7ZVMPIxnVDlZcGT3cATfFMv+kJUfZU5ww+ajrRbw14yuInfcSO+tnsga0MPX
         vseaN5XDkM2jdsVuNrVEVUosm65wSoRdMuSJj5vbeayGKFN7sdvmcnxcB6SMyrCH57Uj
         SD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718617; x=1776323417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=00RQOokKaC5am9I7qdgcPBi5+qnJv+71xl1/N9uduTg=;
        b=IWvkmOSzdn7YfjrlqdM2ecK2YRCDXzUgkhVMnqLTjwFI5Ko7kShBv1qDfwYL+ZmpvO
         EgRg77aL90jysTR63GcNo9uNinG2GZsuQIUI7plc3jtTl40M1AahTUc5oGjjm46xThq+
         +9p/Wzf+ajuwFpLBfYigN6qYJPV9/3lPT89AKkxsOA5asLHj/3IC6b0KMkKu7LySGdaN
         hpSw04AWMJbteC031NhBCihj/kE8xmW44K/XgZKiIeKK/9DS0S1An9E6q3ZkjWgS/aWt
         q9f/s00g4tt6jVasG3i59GNfjuOXSLSG4iIDVqOQIT8RpViTDFAm9bgKRlKuYLIRJFVX
         x73Q==
X-Gm-Message-State: AOJu0YyYSXvybzLLfOMS5bP3E3n+yz3zIRrPOAqJAI3mt+Ka14Lb4/UP
	95lO3OaOGW0eMCpJ5zZuBZhO/Bh5kFNFYKKcwUoMxt27M5z+q8Dc37eTE5F0YA==
X-Gm-Gg: AeBDiev02Q2Wl5CKnDZAviCqAiql3MH5UrRtYoQxnVYcSJZKJAxPPquXJ+CROFt9FR2
	ATCBPbYbcir+RlLI1p+YE+FU8uGzNcqSK2qTQrzYNgG2ixPG9NUDzAP9k/te8u5eF8Deg3ecprS
	ZIeO1wqaxo/7M44hg+iTkqXVj7jwXQ7Dzlw9oyiBOTKoFqxz2+0cs6J25IPE7TsCo6Nk2KqXWUd
	veP1hu8GIOP5Zesdxt9OU0u8dXh4C4uPLZLIbRwn4KjHkZOWcmH7RXhrqVuf2w2ikwGkEdLovds
	9TvwT7N5BXSty7ae1TO1YyCizNvem0avobkrZX3mTaEtYf8jNwICuF9CU9d9ysWmg0AdjPJcjmx
	TIa1dMDdksSwLVPnwTbZ7alE8Dmf+xgsRh332XfFiQQ74PdYF3mvEAIlL45cUagXIjexdc2Mmzn
	A1eQwOxFsiybzBDon7//9D62Tf9dxvnL8x4v0=
X-Received: by 2002:a05:6a00:10c9:b0:822:69b2:7ed0 with SMTP id d2e1a72fcca58-82dd8a5beffmr2055321b3a.6.1775718617499;
        Thu, 09 Apr 2026 00:10:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:10:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 20/22] giflib: patch CVE-2025-31344
Date: Thu,  9 Apr 2026 19:09:17 +1200
Message-ID: <20260409070919.3968586-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126142

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-31344

Backport the commit that mentions this CVE ID explicitly
in its message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../giflib/giflib/CVE-2025-31344.patch        | 28 +++++++++++++++++++
 .../recipes-devtools/giflib/giflib_5.2.2.bb   |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch

diff --git a/meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch b/meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch
new file mode 100644
index 0000000000..8f52154955
--- /dev/null
+++ b/meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch
@@ -0,0 +1,28 @@
+From 949bf7ded2c23449439e2c3e1f63368cf7985800 Mon Sep 17 00:00:00 2001
+From: "Eric S. Raymond" <esr@thyrsus.com>
+Date: Wed, 18 Feb 2026 18:06:50 -0500
+Subject: [PATCH] Resolve SourceForge bug #187: CVE-2025-31344
+
+CVE: CVE-2025-31344
+Upstream-Status: Backport [https://sourceforge.net/p/giflib/code/ci/7bbe8ea1a595bb7509ffa0a86b076e9b720e85af]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ gif2rgb.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gif2rgb.c b/gif2rgb.c
+index d51226d..4ce2104 100644
+--- a/gif2rgb.c
++++ b/gif2rgb.c
+@@ -329,6 +329,11 @@ static void DumpScreen2RGB(char *FileName, int OneFileFlag,
+ 			GifRow = ScreenBuffer[i];
+ 			GifQprintf("\b\b\b\b%-4d", ScreenHeight - i);
+ 			for (j = 0; j < ScreenWidth; j++) {
++				/* Check if color is within color palete */
++				if (GifRow[j] >= ColorMap->ColorCount) {
++					GIF_EXIT(GifErrorString(
++					    D_GIF_ERR_IMAGE_DEFECT));
++				}
+ 				ColorMapEntry = &ColorMap->Colors[GifRow[j]];
+ 				Buffers[0][j] = ColorMapEntry->Red;
+ 				Buffers[1][j] = ColorMapEntry->Green;
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
index 8226e9b6c7..c26f3cf160 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
@@ -11,7 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
            https://sourceforge.net/p/giflib/code/ci/d54b45b0240d455bbaedee4be5203d2703e59967/tree/doc/giflib-logo.gif?format=raw;subdir=${BP}/doc;name=logo;downloadfilename=giflib-logo.gif \
            file://0001-Makefile-fix-typo-in-soname-argument.patch \
            file://CVE-2026-23868.patch \
-"
+           file://CVE-2025-31344.patch \
+           "
 
 SRC_URI[logo.sha256sum] = "1a54383986adad1521d00e003b4c482c27e8bc60690be944a1f3319c75abc2c9"
 SRC_URI[sha256sum] = "be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9048b8ee3b66b29d5fb"

