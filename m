Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCBEC5DF6E
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:45:56 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24340.1786747548629281008
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WBpx7vHg;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2328118a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747548; x=1787352348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMVRQR3LTSbP7Q/ni1PhHWfip6PdmVhCxSmHWd/afCE=;
        b=WBpx7vHgjVs17YU/hV13h0Xmsq44hX6ExB6KLIIDcUhXE1kzdDcxo7IbGMvecc949r
         t73vwyUN2i81/7kDZ7cY+gxtPFj1ns6Hdcvsqum1MUpgbGcpZnW+VMzC/frP2W7lPvb6
         DWKWhY6ZuIUVY8rMhNeKk6PGRkTjQNe2kTslKbYVGGVJrei8EKPrb7o0OBvAdAg2P4Gw
         x4sfbEuqn+K/WE10ijy6xP8Si7b9awnTDQUvb/EIVnE023F6arB4xjYz47Iv/GHq5kV6
         1lr3Jf11LS1FIIO5nlDE5i9yo+tDRD/bMD4WuuwIc/2DUEnfEIEo6tOaGbPpbtbhw4+5
         Kwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747548; x=1787352348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMVRQR3LTSbP7Q/ni1PhHWfip6PdmVhCxSmHWd/afCE=;
        b=OxN7UOoh0MUY52L3rqEv6ytMgXyRZTT16frrN1nlNSAh1GKD7DgN+vLAhDf8G8iv8u
         yyI3WJN60E9wDQe/4py7Umpybhejnt77VqpUI8CD+t5G6AIvi4hPhnIUvww8fUBVo0Xt
         vXQLViLlOqeUv0Ik7nKNVeMeTa7lbyqEVHf8gfUvRSDSnx7vUzYCWCyo2fXqV5n0aJG6
         2d/2vaNIiWhokJCa8+bnDJYz7Rpf5/NtPDYq+5uXdg/fLPXNf8iPx2QlfXsQRwIbSNae
         MxoKW9JGm5r7UVawYzsvypqBnBES4OdkIBDowybw/P0LwhfpHQefopNBZtRXSk8x8dRi
         e8WA==
X-Gm-Message-State: AOJu0Yx1MPxseOd7TJ9hZTucO+dQgR/FngJuL1P3gmHLrmLqDj+zqZr8
	2HsSMEzeoBAQqQh7pIfNbZm+p3ijjd8HoZifoMWshNydo7LsMoPYf1w2cSR/Dj4m
X-Gm-Gg: AR+sD12YqEvL55Ft3qLt/j8PaMvTgewBwtvdR2gcvp4FYdxb92g167NmlCew/cn/iBA
	eo7/jH3mXxbreTsVE8TR8Fji9vaO9v350fvP/JOuF9+4LbMtqD8Gy9s8u5lTLndE2Poy5kQn7Ya
	p0EE78HKnUUwqCq3Ad7hfR688UsZkDDzGS4hYHi2a+7i0UsNh3S4xz0IAgKnhxSNh5JTXZETw4X
	H7U+2jI3IA3entszy5CJxvLFZuAPBP/zp9T9AhHuAdDPAWpCJayUHYBBXFvl3b+6DJmABNPaTyV
	NUM0WMYVClAP8d9e35M86WGoqCDAa5qSpHkXnn6s4ltyyjdKMDw4NXjTLD3g83iqtIbLnZ1tiKn
	KJnm+68+byry4XYPJ0sRsbqmBn+Srs+2z3+/dA2xCbFsICIJ8Z/jxfU0xGjLlTYdc6OTJO1UV53
	r2AnfkoUVsagBWOUPntjF6693c8yeV7mY7/F6WVsbffVU6zBBIVVmgAjkR0jxLOmWZthJPvwDr1
	sKZZaAMu7mCE1L3axQmlDdT06zFTM8IBy3hmBLxu/t61ktsEakGHnyunUjbm37Og6kTAadVwQGN
	oOf1Gm9doLf2IEGQ1h/6uChlBX1CykKmqy2arnqGA0TpkXP7wH6GJ4BdHatmYXRRXIN2MaUrZ8d
	hl5HhupgxUkIwa3RykPlbmhAvJhdamIhlPun1ulxfW81GOtjFmmMnwnWn
X-Received: by 2002:a17:90b:3910:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-3933b872257mr10350305a91.11.1786747548005;
        Fri, 14 Aug 2026 15:45:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 004/109] source-han-sans-jp-fonts: upgrade 2.004 -> 2.005
Date: Fri, 14 Aug 2026 15:43:50 -0700
Message-ID: <20260814224539.1523174-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129068

Adobe released Source Han Sans 2.005 on 2025-06-18.  Per the upstream
ReadMe version history it bumps the copyright range to 2014-2025,
refreshes the Latin component from Source Sans v3.052, and applies a
large batch of per-language glyph and CMap fixes across the
CN/TW/HK/JP/KR subsets (added U+31BC-U+31BF, U+2BB37, U+2D25D and
various Ext-B/C glyphs; corrected strokes, contour alignment and
interpolation bugs; removed and remapped a number of region-specific
glyphs to their corresponding shared forms; fixed IVS mappings in the
KR sequence file).  Upstream also renumbered the release assets with an
ordinal prefix (SourceHanSansJP.zip is now 17_SourceHanSansJP.zip), so ZIPNAME is
updated to match.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ns-jp-fonts_2.004.bb => source-han-sans-jp-fonts_2.005.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{source-han-sans-jp-fonts_2.004.bb => source-han-sans-jp-fonts_2.005.bb} (44%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.005.bb
similarity index 44%
rename from meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
rename to meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.005.bb
index 40128f97d3..51f8035264 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.005.bb
@@ -1,6 +1,6 @@
 require source-han-sans-fonts.inc
 
 SUMMARY = "Adobe OpenType Pan-CJK font family for Japanese"
-ZIPNAME = "SourceHanSansJP"
+ZIPNAME = "17_SourceHanSansJP"
 
-SRC_URI[sha256sum] = "1ae9f62ad620d686c4a049ce25cf54e3afd8fefc954a678c644cf9802750c17e"
+SRC_URI[sha256sum] = "076a167394a2bf125a7ab13164a5ea1ce529b988d867c11052e83473b2a704f1"

