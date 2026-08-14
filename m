Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4B0C5DF72
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:45:56 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24341.1786747549520960748
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hKAFZQGQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2163331a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747549; x=1787352349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2sEZ8juISdwIjBynRymcf6kw+3qj4ihBiC02SXwOyo=;
        b=hKAFZQGQNYIJfhsKDgceVruVyPRJuOoA6dT17Bczfpa1nqzloHG02fx9+KZ082E9tI
         7tQ9C9LxIL9Oq7reC1QTRjlXcKbB16HEUsFQ8PgELGwfnkW9mPnKFnA0UlBHZKB22nok
         Gf+JION6W4zr4Y791d9wEUWBD/o9SDDiET7C9Iq9m+2UllgOXbDjh173VTbH7oLkQLft
         kCyA6sKV27kNoyPetwQzSIEgzJDWJJFJYfHvLZef71UMv6e8il8N1SXEB1BuOz4TMj1N
         8/VdzsAOvVfPfQky4ff6/UNHmh1dxRTD340eW7qWaHvW6HTOX9Uq7abNbAk9iOlVJCva
         EI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747549; x=1787352349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2sEZ8juISdwIjBynRymcf6kw+3qj4ihBiC02SXwOyo=;
        b=EQrufi56yFqLLOYU8sMupBKAvLlWtUlKfMjfp83AS8SySez2F/Lrs9AOZqamnXjYnY
         Pl/DrufDFrF5NENOXlXruppr0TE5rPfQ6giegUezmurzQ4xiKkIZoEbKu7FWlFHUvUqI
         NRhyw8mCOfOj8lfgTHYrOraxz1R1JNodPfVCCcd4sC/kpG2r2pJtQXBcz4K290fJ/5vB
         3/BoTeq6OWlMVXDTrLAqfSWJXuPwMLqfGBptA+EN+0QtA/StSpwGSjb3g0B0SHMY8kpK
         OEC0aaPxZx6yaAMLGGYkb0t6mhOL92TWvO6kl0rAu9C+cDw+IonDf1zX6A9S84IcgxEN
         qHwg==
X-Gm-Message-State: AOJu0YwTThSYoCOITGi0PEDR9amhvYWT1ezJ85eOvzZTg4mmvlUi2xdg
	Au8metmOvz20CepblQcs8ZLNA0ltNT46aOmN+FX6KXi39PI09w9RDCOhqBUkO5ru
X-Gm-Gg: AR+sD11yz9+nAkmo3M1f7FJ4eO/jibiNfnthihXpN/zZRbG3nMY3Azg4vBMZdOgdOGY
	EPVdhUM06a8KgM9NCwS9mXI2eOEOKve+re00unlQnPjKoxDabFEu5jplKIDpdDYfrXUlTA4YgNr
	a7nZ8TTgSsghrRvSrpR6HmrcKAXpbSlh9dzcwLsKP2kAO/ShGhk6Fs6vQGti8wcwAnBUlVLBamG
	IEGH08tduOTurQa44pur6WaZcjV8VE7dSNgO/vN8xfWxwXAwELOs94qn+fTmf78yCM2KyJxVXZ0
	ix00RpPsrtrDKIYZjMyFPkKcJ2qcXfMxvVU36MD7cckcYc1pttPYxevg5rI+LdzwfKK9zKlsT5n
	ts0KbKQ7X+EoWkFoVCp4UXFLqkiiP5jEN9YqVDNJxs7LgrgAAiCNsuYV1+Y1AwOxhEmS/Ihj46L
	9oMVVhZcwUarOCwEr97dVRrRlFjw91ivisyT0XID+NgNrFoCVH1nxYbed/1HSUp7nEc3IxTqH6L
	cxFBA+l1cVFWQl051SwF0cnlPICoY4DJxVkK3LZudf2LpnNSRNuWLzKDYPLF3eVxce8J0t62YqA
	XdBOWaMB9NSuM1oa709F1SKkAXTiugEuZIbfJXIttGa4E4ZaTbfCHXaZat1dg2FYpNC9DkwxRvk
	8r7Ely3DhPItGbaEsmSw3znqgkmSxqigO9nFUIDkKVPtmhA==
X-Received: by 2002:a17:90b:5450:b0:38e:655c:6516 with SMTP id 98e67ed59e1d1-3933b4f3238mr10714727a91.0.1786747548892;
        Fri, 14 Aug 2026 15:45:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 005/109] source-han-sans-kr-fonts: upgrade 2.004 -> 2.005
Date: Fri, 14 Aug 2026 15:43:51 -0700
Message-ID: <20260814224539.1523174-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129069

Adobe released Source Han Sans 2.005 on 2025-06-18.  Per the upstream
ReadMe version history it bumps the copyright range to 2014-2025,
refreshes the Latin component from Source Sans v3.052, and applies a
large batch of per-language glyph and CMap fixes across the
CN/TW/HK/JP/KR subsets (added U+31BC-U+31BF, U+2BB37, U+2D25D and
various Ext-B/C glyphs; corrected strokes, contour alignment and
interpolation bugs; removed and remapped a number of region-specific
glyphs to their corresponding shared forms; fixed IVS mappings in the
KR sequence file).  Upstream also renumbered the release assets with an
ordinal prefix (SourceHanSansKR.zip is now 18_SourceHanSansKR.zip), so ZIPNAME is
updated to match.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ns-kr-fonts_2.004.bb => source-han-sans-kr-fonts_2.005.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{source-han-sans-kr-fonts_2.004.bb => source-han-sans-kr-fonts_2.005.bb} (44%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.005.bb
similarity index 44%
rename from meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
rename to meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.005.bb
index 8b32ab82d2..34a5e7115a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.005.bb
@@ -1,6 +1,6 @@
 require source-han-sans-fonts.inc
 
 SUMMARY = "Adobe OpenType Pan-CJK font family for Korean"
-ZIPNAME = "SourceHanSansKR"
+ZIPNAME = "18_SourceHanSansKR"
 
-SRC_URI[sha256sum] = "02fe28a48c6381c49d61c27a1b173c77f0e6f2b9f2b68e79f076f10a6a8f4bfe"
+SRC_URI[sha256sum] = "ada0398122ebfebcae9efc1c6bb1dc5512c03b8f54035a8f527cd82a3c0441ac"

