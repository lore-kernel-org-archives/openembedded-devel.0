Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F924C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:45:56 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24338.1786747547743120151
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UtkVyjE7;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38101f85591so2504944a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747547; x=1787352347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1lV4BhZBFAGJY3FKQC6hwqJT0GadU+BzTCEf39+/lvI=;
        b=UtkVyjE7V7gmFPC76rp/2N4oS5CqvkxXIYlkLhF54akCjCyKCaXWCkV9uz0K6ln0B0
         +WgROHWceo6r1nLrwCg8uc7rYINY6zXuS/9RoFLEdkKQ3/eHLxGdvhZRDDL6yAAVaGGR
         CChewzisp2BmmhCXQ6wgYQjhLEbLiBv8gM3uivy4c5gKQbjnGs5toXpp2U9W+tSRRFUg
         95H6vBCwhwibid6gBA45v5D8dDCtBvDwPnw17F7FZe0O9cpKnx1tomUwU5+EVD+JgQZH
         aNVU8kW0c8fn38zdhF9hzz1EZraThVdqoJPJ0CttHXbKgJRWkWSz1iLRZ9+5OnALsOKL
         j/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747547; x=1787352347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1lV4BhZBFAGJY3FKQC6hwqJT0GadU+BzTCEf39+/lvI=;
        b=SkUojHBcmoKsZ5CPfQEZc6/cLlPF54EkGthRwgiMqkoPZGAczaSrwAysm7mEyEpN6Z
         SLXvu0Pf/TCmBCMZcSkExahoa0jqumzasfqIHu7bye2Z5tDxLlRyxPEBJ2gEmkr0oGLe
         Mb3C4kI21qCVZfABWnzorQ1J/PLL92TrOu7llpkyZsTZILWwTeb3a2VzBdOb/A3aMMYl
         uGNGZuOCURjE+BpOIB+htrmQ/0vckTntpEjEgwyGnkzIM0DzxhUC4dwL7/C08Vvi2oTK
         sZ7H9n3XmLvL3OGBbheVXKHYrp3MH3335zpKdzz5dX+IOeKVo8WN6KgPfxG+3VsIPVUc
         czsA==
X-Gm-Message-State: AOJu0YzU4+dw2qNeQ1sbIOgn2jBQFP3GoDOWDFL3PTKRotbRsN+bvAsB
	G/s7vl5Al71LPu1AkuWOw1zfqtOEzf/pOXIMLTl/JCMyisn8crplb79ozaTcUFNz
X-Gm-Gg: AR+sD10/VcHDZ2B8+Cz8lEBUb+RXxJOgWlvM+Z1q4j/VuHGXWHnI8JQppOWTPD3uVLN
	hCDMt9Qx0Y95zG5qoWD3Q0B8PE9Rxq7exTaVsdT0urj6KTZL4Cle5tOo7fc3WdOzDZgWJUSn/cF
	A1eLCgevTTXK6uRDl7uFVP+afHEnQDjJC7TpuE1QDLqSeBKf2wKZagOL75haEym8OM+8WXLEuqv
	9yV95gRjiZ5DA8zyFDCBFZscoOymJGz7rY39Pw1LxXitzoGqCjMGM3trFO+Kwdknq8h8q3gZuNW
	6pQdLVeCjRT8NEcPjAaOTKQpOub6dVvltQK/hVEBLIO0n5q7va+7sNBzEc3K7LjiEVMgx5+l5kI
	G/MWf6CK3R55VGWO8HrKerLzOh1f11l/mKC6Hb66IvKrYeoWGw16SW09K8IbgIhnI18wg2Wj8aY
	h2UA1uo57GKkTFvJyQ380HQPsiHLlep5Dfzmq1XQt5XtwNHl76GCgajH3tEQhMSxdRZt6bgZL/5
	Nb8PXygKYiVbi2IjF3/3UGIKySKgPj2F8fpXmqKrfT6BZeHkdr0c5YC1vXBEUjyhZ5Dx1HBIPhN
	Oyc3Oj3BBhLxvN/0iAjakxZ8vdIx9B4Y/JU7QDEl3Jf4fGYUr+NxPiwIkIt18GLwRkAfEFPlx2o
	6FIGh+rBlXCRdeIvrJb2f1GPkJ5zKQI0PUyj7jWrzGKBSew==
X-Received: by 2002:a17:90b:2d4d:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-3931f4486d3mr13957474a91.1.1786747547011;
        Fri, 14 Aug 2026 15:45:47 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 003/109] source-han-sans-cn-fonts: upgrade 2.004 -> 2.005
Date: Fri, 14 Aug 2026 15:43:49 -0700
Message-ID: <20260814224539.1523174-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129067

Adobe released Source Han Sans 2.005 on 2025-06-18.  Per the upstream
ReadMe version history it bumps the copyright range to 2014-2025,
refreshes the Latin component from Source Sans v3.052, and applies a
large batch of per-language glyph and CMap fixes across the
CN/TW/HK/JP/KR subsets (added U+31BC-U+31BF, U+2BB37, U+2D25D and
various Ext-B/C glyphs; corrected strokes, contour alignment and
interpolation bugs; removed and remapped a number of region-specific
glyphs to their corresponding shared forms; fixed IVS mappings in the
KR sequence file).  Upstream also renumbered the release assets with an
ordinal prefix (SourceHanSansCN.zip is now 19_SourceHanSansCN.zip), so ZIPNAME is
updated to match.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ns-cn-fonts_2.004.bb => source-han-sans-cn-fonts_2.005.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{source-han-sans-cn-fonts_2.004.bb => source-han-sans-cn-fonts_2.005.bb} (47%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.005.bb
similarity index 47%
rename from meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
rename to meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.005.bb
index c46952cce0..d8a6310741 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.005.bb
@@ -1,6 +1,6 @@
 require source-han-sans-fonts.inc
 
 SUMMARY = "Adobe OpenType Pan-CJK font family for Simplified Chinese"
-ZIPNAME = "SourceHanSansCN"
+ZIPNAME = "19_SourceHanSansCN"
 
-SRC_URI[sha256sum] = "6841fc13f1c0d255cfeb33d2a2c68d24bbebd94ae2c070347a2b2b200a1db4d6"
+SRC_URI[sha256sum] = "3a769d1b082ebd813cdb4c06ea57d29b340bce548edcc8e61976b78ca28e6236"

