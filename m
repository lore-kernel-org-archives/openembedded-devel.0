Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D06C5DF75
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:45:57 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24342.1786747550851099018
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IcWjuVhD;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so2257399a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747550; x=1787352350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lKeWZyFc9PyrKBloApd9qiBGnMTIGosfTDPmH40j2I=;
        b=IcWjuVhDa9DVqdaNL9DEw1gXlWjI/qFO3VRQasF22OGTUHIKYgXwnav+8JDpuTiHnK
         2Q+VC7nsqnlOPgRp4WkUCBHi6/XRQyMU+s83r/MWscgUMrJhPUj27JKd8p9EgRPNHRhI
         k0BtI2z47Hj9KRB1jOzHawv41YiX59bv+OLUCgJbx/TUcUCaeA6vLJKHQtYdO6Mp4Ka0
         0ebv4QbS8U5NzR+tFiXt5PoG0uxFhAnUSdqwPWobNEaqA5b1eybBMRTofsEB0k0qUTKJ
         jo0tFb2tyhtpLag5YFJ80n96vscObHpu1F9+lqw+v/x4JEa/6oyxcg7VjNZMUaqalov4
         pccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747550; x=1787352350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lKeWZyFc9PyrKBloApd9qiBGnMTIGosfTDPmH40j2I=;
        b=m8BKOue9mTHd022MKilQEByEwQWuKMCkENd1l8wgOIxOOdIKav9JyPY0jE8fgTan7z
         /mcwD/NEHku8cU3MJD6VYftPQAhTDjkaTMom6KQrurLQIaPCXrh7lNyoIDZXzuVmKJma
         eE6KlSk5mOCvVZjyS28gAwLPAU4IMoboJCXd9rEvbCwfFf3RBi7yJ77DjRfnioW1LwPn
         NtWG6gRNqHLzCNVDFhqBQ8o8o8O7X9Wbl6bS0QZUDdhzHj7uSWwp6ZBRVFreZpQovUh/
         qzZzMk8YsxCWsXc2Kb58GlggJ/C1k2RIErhGOQfjxLrllWnG6C47gNp7kAls0XUqxBZT
         4HUQ==
X-Gm-Message-State: AOJu0YwtwHS4wzPuVPX4KYWjA5o+EtbWkFUQ9UuoWDeNLHgfg4F7K2ys
	Ou/IiGF2ifCHi2zHWIetrx4lSUcKtKt/lWwkc046S9U8BE+dpTJfVT2q01G+CzjP
X-Gm-Gg: AR+sD11MrnEgNQsuKl5JPzjdP6BJU7Mmwnck2IW8K3UqQ+aR179ZWQzbWCQiwwv0JoC
	KsJXpESWp/KWxUGyTSjEoW+v1e90NP2MvuiCRxTabSyRmW6SO9UQklDHMikcIxy+UuAd60kNar1
	zgPQuYtg46ztk3LSNFdYl2yGmIQli+2U3cpWlSXhYki7asvvnwBVuW3Ovuf/Be/+lid2siTrozv
	CXDV6nPHjqDQEHafN/asMj82i5g9qig8dnZHm3Y/KJKG106KfnlXic90B6cvwSVqTVaZW+1BW6t
	FCNe51endIbjNfOp6RS8rnUhJbkLLQnvfHXLvjCf7SBg5bHURNZGbeo41eQjQva2wNUzAkV2buY
	v6/yHEXfx84xJ0+TzIL/5ab+oHMlJKacQKYDMuIZXBceNgNTi7dcmaOQNpMBnDMh8BMZD9uISJL
	n+bF8nZsEYr2vmv2b+U6aWEsY7jNL61IfcxDeb1/theowlu4/3ITz34sPrz0KwKMpUiCr4mko4r
	Sb7aiGmStJQBsRo18UtcaOAhEzSrxmpRpEawIY7SGBmEjyFX4J0wdA64I2wXS2mhFoGZ2TuefE6
	fwpwlw7tyEf0rFM4DhBkJgTwGHV7kXPoBVLR9/wMRTCJWh8AaYTQD1I3+vxRLkJ5LPLovQg3PhX
	DIIL6u6WF3focmm/ycGRJalEXDPVXCiH9UvjK9t3HuiiMuRQ=
X-Received: by 2002:a17:90b:586d:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-3933ba75904mr10442831a91.16.1786747550215;
        Fri, 14 Aug 2026 15:45:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 006/109] source-han-sans-tw-fonts: upgrade 2.004 -> 2.005
Date: Fri, 14 Aug 2026 15:43:52 -0700
Message-ID: <20260814224539.1523174-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129070

Adobe released Source Han Sans 2.005 on 2025-06-18.  Per the upstream
ReadMe version history it bumps the copyright range to 2014-2025,
refreshes the Latin component from Source Sans v3.052, and applies a
large batch of per-language glyph and CMap fixes across the
CN/TW/HK/JP/KR subsets (added U+31BC-U+31BF, U+2BB37, U+2D25D and
various Ext-B/C glyphs; corrected strokes, contour alignment and
interpolation bugs; removed and remapped a number of region-specific
glyphs to their corresponding shared forms; fixed IVS mappings in the
KR sequence file).  Upstream also renumbered the release assets with an
ordinal prefix (SourceHanSansTW.zip is now 20_SourceHanSansTW.zip), so ZIPNAME is
updated to match.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ns-tw-fonts_2.004.bb => source-han-sans-tw-fonts_2.005.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{source-han-sans-tw-fonts_2.004.bb => source-han-sans-tw-fonts_2.005.bb} (47%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.005.bb
similarity index 47%
rename from meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
rename to meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.005.bb
index b841660efd..ed97d7f79a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.005.bb
@@ -1,6 +1,6 @@
 require source-han-sans-fonts.inc
 
 SUMMARY = "Adobe OpenType Pan-CJK font family for Traditional Chinese"
-ZIPNAME = "SourceHanSansTW"
+ZIPNAME = "20_SourceHanSansTW"
 
-SRC_URI[sha256sum] = "11d78c8fbc1a4bb04a453cdd65c99db8d41ec5cd6ba6d68c8638e6ba170de806"
+SRC_URI[sha256sum] = "2cbfe304a4d794725d5c1873e159b74d5f874ae4ea007a2dcaa18afbb0f00321"

