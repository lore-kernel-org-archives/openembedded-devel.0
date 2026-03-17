Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FCDF33827
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 14:33:30 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77354.1773758003692429759
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 07:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TAD3O6Wn;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so4571293f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 07:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773758002; x=1774362802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=boPeWScPjxBmeKCLfq0nHcj4CNHiGvzasNwSeOKJrxI=;
        b=TAD3O6WnSFMYKg50H+btUWpSRPBd4QAmVyd4DzFD5mF1OipUE7w+r/sa3QH7jJxD4s
         EG4KOgDsSSGMsHun/tLgAIAHY4X737GFUP3FfDglYDF3jLS0RNVGMViqYIC/o7BkVrq1
         5NkHdO/tkT2ykm136y3rpqZZaviU1FVQHT1deCaZKS0F1A+h37zX3x1+2n75sb8FLNBN
         h9W3jUJ11awpy850tZiLs9J64E/gz4NpNaNZC1ct3U5X1uZnxWPu0j4BeQbb0xsH5bQe
         gwjC4UY+tOirozt3UiGmy4NEhvStoNfTa2pWSNX1HfUdmDMOCgDi1ANCOUDcFKq2h2N/
         QeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758002; x=1774362802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=boPeWScPjxBmeKCLfq0nHcj4CNHiGvzasNwSeOKJrxI=;
        b=Z4zqXWLL51Ne2+2qYYY5g6joBuMVj7gl2Ly9BN5fjjQ30ZEGp7APQDqjmAnGU0ciT3
         oLwnejPCaAlJV51SZ31LC6RRfaQ95d5TwUe8nin4LYF1l6j1wUPuRwqcFYFaqEmK2Fbk
         Gh/94GFObrJWHUzDAXFjmL3f8wAE+hUQW6iDlfXQ2KdagG7Q8IZbgk2DfXOfsavkcsML
         N1ikXD53zTm/wYinTOzLZUm81Rvcj7TtPJV3mMmKyGkDPrLCju+eoc0KCuZTl58FLxiv
         h6KVPd2SoF7G9Pp+B0oSMEYFfi3AxcrQcPyPuMXuhUFaIHQQR/XzL3UZ2YPkUOFxJ6l4
         0hEw==
X-Gm-Message-State: AOJu0YwyEJAK5FdNk30Yq3tiILt6VQsdkAE0WNxlsd+aLTiIePbNmyZl
	iBmxbor4AONXPFappsdVMLJWZZIx649xhonuuZ9XBOA5ezHZB0b3Jntal+k3sA==
X-Gm-Gg: ATEYQzx0fUd8HK3SYgF+Zjr4FiNDW4Wn1ZBuygBKsBgbXAO1hzIGo2CmM401FOiW7Ye
	ktMTFdYboNx+EG/Xql8N2ffDG4hVhkEkJUwtlzOgGr4FYGcp4kLlzdy1x8szNhyPgseisfF/ym/
	Bdt0QuZ9X/T95DOLrLgMNpUHWG4oxT9HS8Zq3+2ruiMRbYnZ8LAUpojIYXrvX2RwUwL359qhxo0
	uk7Etb0+wyBD3TBLn8LSEj76SDWphIP/O/+Unmf9lhsYmpnqEWnX9J9S/Mo6VdoxlQOZdbuEPy5
	kpMuxzyZuYtYbWXuTb2v8C45W1sGGkpWcRF8UGsgsUxWQcZTEozKVA3+hQ5xGS5lDOa6qr3SHqq
	vaiqWFtCckPNZ80OPqOeZ9nAYNaXXn9UMUpPtJMDZ2/U1VGCCxklnna+l0E6QWf2JJilUNipLHK
	3kq+YrLIEqOrKshEUJtjui
X-Received: by 2002:adf:ec89:0:b0:43b:3bed:f3b with SMTP id ffacd0b85a97d-43b3bed1285mr13940824f8f.34.1773758001615;
        Tue, 17 Mar 2026 07:33:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b45e5c233sm16012288f8f.33.2026.03.17.07.33.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:33:21 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 1/2] imagemagick: upgrade 7.1.2-15 -> 7.1.2-16
Date: Tue, 17 Mar 2026 15:33:19 +0100
Message-ID: <20260317143320.2615598-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 14:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125316

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* client: Fix use-after-free when creating async proxy failed
* daemon: Fix race on subscribers list when on thread
* ftp: Validate fe_size when parsing symlink target
* ftp: Check localtime() return value before use
* CVE-2026-28295: ftp: Use control connection address for PASV data
* CVE-2026-28296: ftp: Reject paths containing CR/LF characters
* gphoto2: Use g_try_realloc() instead of g_realloc()
* cdda: Reject path traversal in mount URI host
* client: Fail when URI has invalid UTF-8 chars
* Some other fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{imagemagick_7.1.2-15.bb => imagemagick_7.1.2-16.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-15.bb => imagemagick_7.1.2-16.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-16.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-16.bb
index d48fae6bd3..beeb11f970 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-15.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-16.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "b5fdb90dac0e6d0bf1bbd95704bbd60216a5bc23"
+SRCREV = "70563ce3759b7a55801900a11e69978a9301fbeb"
 
 
 inherit autotools pkgconfig update-alternatives ptest

