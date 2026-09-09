Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7332C79F8C
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:15 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7112.1788942728987085705
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PC9JUQoo;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d032846c95so65054415ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942728; x=1789547528; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2e3uYQzerlruaGH8fBw6v4MmgJsqXi3+y9BSJRqaFpc=;
        b=PC9JUQoomse06rb/vBsLJGCd4l13fL/Pi522iFGApRJEWtb+Y8OAImJE1bxnfJdn2K
         SoXg8WASEoHEFmJqCFmhYvIoFRjynp+9Us7VcCNrA841wugtVvKuG7oBRMBIxtuwDmQC
         3wWpyiT7RWtQ7nU9R8CyXr9XPrLfWHPJHVzPYojhK3M6nfT7YlWqxapo63lw3vJW6qmR
         C7XZoKFTi+H8H/Phldv5UzODFYwLyIQ9Zqbcx7RdH9oT5K1RLofUmcJbsxKT2PfMhmhf
         r7E85Z3D4X4Tbi31AonALfPJr2PadbGUyTUp/1d2o0fCxdB8+/LqAtiQ31wMMVrCsJyu
         2xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942728; x=1789547528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2e3uYQzerlruaGH8fBw6v4MmgJsqXi3+y9BSJRqaFpc=;
        b=d5pOwmhDLNyOypmhSRvNliyEFFRv91OvDiGYgqPHg996w8Fp9muGday05wMdjmv+Pn
         K21hM7sKyVpa/rNu7cyt7+3VzxXptUEWKb7tLN7/a7kjXvlnx5toyxh2HCZcGueSysA7
         E9glC/9+o9xrUeBsrCSOB5uTwEYjKSm6xj+bMNztl2KspC1D2ffVd0oKIIkzpXaGEIHQ
         ohrDJDSl7Rdsc/RccqDwXtwTgkrgtjfv85TP59OwdR7NHRa+EN7yvRWi8Ic/UabNuIAx
         XKevAF1wnyZL2OqUITwQ7c3aykOTubUVMjgblKCOMwAHu/xmBDC5NJy5wxZS+gPfwJ+a
         XmKg==
X-Gm-Message-State: AFuF++k1dHOu36OUvvhzHKS99tKi0X7CUTtjZD7wA5Yv/6UWFJDq7yj9
	Slxsku9p/gURpbFniHYtfew9WzBq+fxfczkhd7FNnEHL/Bd+FrIDeZZCyrgORg==
X-Gm-Gg: AYBFou2EPQtvlwFMLGKzJCG7OGYYptxA9ClkLAwlxbgvNZeCUunolITi5pkBM5EIUIR
	ZJHaHXZwqN2+vslEYyTbFzh/ZLbMGNjr1Kxxy/KUZpQKnF56tdHb8nmP6HOGAwPGsf87rE9DLLN
	cH4Af+OVLx70GIhaXtXByBkBgcHRo2BDB6wKM2rQHHiuIhfXCLALSpA5zhMhGVoedfJUcghgFJP
	6cHKOkgIEwQcFTKmEJuyVHH1+Qp9RqY7meUAu2TieMIm+hDpi+L/7n7G+p5FuhomxMrDbYFVoI8
	6M9pPVvwC2edJldKUYmpLiBnb74kESVURUQ0n67LG0JxEWcKKleANiI5lJt+94G65yupd6WffXR
	+CAvvgGk/jYepvnjUSu3ELbthmNxcKfS9j8eP8EiRQxq7HwEQnCyzBMQUP2EfxLYruLhoieXfgl
	HlqNoJjkF9F+xMXORrolN223VJfEu8s5wTA1VyoNBulZ7dYCXA2h5bY4PlNlPe1xEv4kNP2s/ud
	Rp7uZUieI7lGsyIcEXUrU4=
X-Received: by 2002:a17:90b:3b8c:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39b26242a75mr46848253a91.18.1788942728172;
        Wed, 09 Sep 2026 01:32:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:32:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 6/15] freerdp3: patch CVE-2026-55564
Date: Wed,  9 Sep 2026 20:31:31 +1200
Message-ID: <20260909083140.2494932-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
References: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129877

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-55564

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-55564.patch     | 28 +++++++++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55564.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55564.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55564.patch
new file mode 100644
index 0000000000..de3674b2c4
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55564.patch
@@ -0,0 +1,28 @@
+From 8e1a14795ee8c3aec32c2a9d5b2c6bf00793c92f Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Sat, 13 Jun 2026 21:52:18 +0200
+Subject: [PATCH] [cache,glyph] tighten bounds checks
+
+(cherry picked from commit c29324750e3cbcba8761f147b7a5235cc686930f)
+
+CVE: CVE-2026-55564
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/c29324750e3cbcba8761f147b7a5235cc686930f]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/cache/glyph.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libfreerdp/cache/glyph.c b/libfreerdp/cache/glyph.c
+index 374c6151f..8a0d7f64c 100644
+--- a/libfreerdp/cache/glyph.c
++++ b/libfreerdp/cache/glyph.c
+@@ -565,7 +565,7 @@ rdpGlyph* glyph_cache_get(rdpGlyphCache* glyphCache, UINT32 id, UINT32 index)
+ 	}
+ 
+ 	GLYPH_CACHE* cache = &glyphCache->glyphCache[id];
+-	if (index > cache->number)
++	if (index >= cache->number)
+ 	{
+ 		WLog_ERR(TAG, "index %" PRIu32 " out of range for cache id: %" PRIu32 "", index, id);
+ 		return nullptr;
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index eefc9ab5d3..3e891f40d6 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${
            file://CVE-2026-55192.patch \
            file://CVE-2026-55193.patch \
            file://CVE-2026-55194.patch \
+           file://CVE-2026-55564.patch \
 "
 
 

