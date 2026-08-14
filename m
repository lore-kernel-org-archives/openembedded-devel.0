Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECE1C5DF6D
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:39 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24506.1786747591013684887
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lkfYcFKc;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so398766a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747590; x=1787352390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ctoaDeRL8OQax1QdvK1sn5fL0pLEITzVSDCcefpEmME=;
        b=lkfYcFKcvd48Ry5tOVdUgcUq7T77MqFu1JifxhHni/HXLEC2NCioCZUjyWZe7G05d8
         n8996/NgsENHG+g2KgXLDyEVxFUsEHhR3x+XOycaQ8MTpBIWgYAb7Xk4pDfvrZkFP6Tz
         R5p+ltPxYZHsCd0BWFadHM4vKEDaqDM6zek1+00SRLtRXz0KBg5/d3Wxoc5nw41XlXbq
         krji0Yhm2lGA71Q8byekidmMAHzV0PZvZPQ607GaBf75xp+K1m7hBSiUiR3vXX1tu3KP
         DcWIazem1BWRhpBGrLG3cHCXYAV6kDS6E4uj41NKGBLIm35zGBBOvOs0rB/UJxjdTm8Y
         SKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747590; x=1787352390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ctoaDeRL8OQax1QdvK1sn5fL0pLEITzVSDCcefpEmME=;
        b=NXvO95oQLC+magvngutJT/Orp2Tvsaz2u+4ySx/tyrA0noYAWCHuk9OtpYq5pAmF4Z
         rce/xvWbqMKoQ+x2cTCv4y0rhSg7SyWjxRZgWgYeY+CQFR6q8luI2tSxjPtO+ftXa4Ck
         z0Lrfr3iYbypHJr7ZBOVYroDGf93Xt1jMhOEmfAybp6X2cf+VpYJQfPTREExn6edWJFW
         YNtR1bUAvkW39Zf5uNcUG0oGFLDYQhwa/dLGw01+8lE4oCNvx6mKaUJUV7ef5KypWWl+
         3mNwL4p7TSsphzz0DhH380xBUZbnb/cyGaXXAktEksRDTiBPJfVqJy7MtUSEYhxDyZa4
         SCyA==
X-Gm-Message-State: AOJu0YxhpyMh8oOofHrdS2doFHBz7+ByD1k+OiI8n/G3SY4pb7CMWzgt
	YWH7EOn7J5lABwHhQe+PzBG3Oc1KIjF5p9SeVvcDKk2sN3T9nt3apnapOXBo6vhM
X-Gm-Gg: AR+sD10QkPGuLCDFupIXWqR7XeJlM3kcVd8ZWPUe5MGbLP0wC6c9lY9LzwLn6Kvg+/o
	baFAFjvEQqVQjKO6a7ZBTtF/giq4RhC2idqrCmW/3kYAUzQmCHdi1t3AAYTBGeYrk3nAkle1MWe
	dxXdCUj8S/xBSD5bGtAPlchbbgjvjJc96lgoryuvKvMviEJd4/sZcGGQP7ZIWh81ZOXlup8wgQw
	MvgdWaDwb/+xihQs0TkoY1Bmp+xaSyBjCElUZeB2M753NUt1wY7gPfOVAKMhkV+pv6qCKbMGn6x
	nAOERs7LO4dZ+oRFs1PCC3fX49tTaTKGLi06u1SJF4k4R7cTFuyiCHyRtFCkIhFBTf639g9rrFe
	YRgxJrVyUtsXmd8YpgsWyQKIEbbR6bo3n8BA6SYDpdmraVzFayzDh3Cq9BnrxccgAnggZWPLFpm
	UrFlF0X/wcmIpXoQV8n1t6wA01ZXYfxz9BschCYGAJs41Ig8INtH56NRr1VKFS1Cmucz4uHNZrE
	VLA1UmxxDPcAXc1bzAqrHtyDP1ipHbBcHC9OdDWS3oCfxxFj4u1n4bNYO8RtZ62qRFzEqyMvDy0
	m+bn6iWBDAn6mxAS46gC0Yoc9OHeeFX2QsZK+YU5JU00cI6Iu//5/FtrnFVcoBxRmy1taT8c8XW
	VfJi4Dp8eG9HikNA5R/xc3G33LNQQ76IT9GgR4oNo3Z7ACg==
X-Received: by 2002:a05:6a20:3ca1:b0:3c8:e313:8d42 with SMTP id adf61e73a8af0-3cc71d3eae1mr10942630637.31.1786747590279;
        Fri, 14 Aug 2026 15:46:30 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 043/109] libtorrent: upgrade 0.16.12 -> 0.16.19
Date: Fri, 14 Aug 2026 15:44:29 -0700
Message-ID: <20260814224539.1523174-43-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129107

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{libtorrent_0.16.12.bb => libtorrent_0.16.19.bb}       | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.12.bb => libtorrent_0.16.19.bb} (79%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.12.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.19.bb
similarity index 79%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.12.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.19.bb
index c9b5275a69..892adb902c 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.12.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.19.bb
@@ -7,21 +7,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "27463ee72d83295444262d503130fb0f8cc227e0"
+SRCREV = "74b88c154d634c4fc6ee32a6a9e49f1da75725f8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = ""
 
-PACKAGECONFIG ??= "instrumentation aligned"
+PACKAGECONFIG ??= "instrumentation"
 
 PACKAGECONFIG:remove:mipsarch = "instrumentation"
 PACKAGECONFIG:remove:powerpc = "instrumentation"
 PACKAGECONFIG:remove:riscv32 = "instrumentation"
 
 PACKAGECONFIG[instrumentation] = "--enable-instrumentation,--disable-instrumentation,"
-PACKAGECONFIG[aligned] = "--enable-aligned,--disable-aligned,"
 
 inherit autotools pkgconfig
-
-EXTRA_OECONF = "--with-posix-fallocate"

