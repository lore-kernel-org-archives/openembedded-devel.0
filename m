Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D45C5DF6D
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:45:56 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24475.1786747546624519493
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KkEEy6Vd;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e88b60121so1269191a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747546; x=1787352346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+O/0P2J5XSI8JvmxrlXezdCyWyzpUTunWAbwhg3nfA=;
        b=KkEEy6Vd7LEcH9sOeWJWcwbNpe7SkZU1qAVNtpWrgsLsa21tXIjRV4V3V7u8D/jxbX
         oq5fYO7a7GOEwkMRH+kppZWA8oljDtXDRJRAHGRGNxyzo69vCG+4R4Cyg7+BOk6fXQ6O
         z4De9OpVnaWz+rnQ40N6pnX2yDIy2d04XnouPHk71i0vDiXNVi1UO4DcpAUMzolmUWgo
         AarKssvrvCgcDCORCtofRKxJPtfiEzCiXRmrVSDfwEMP3YB8+UPAAEQa9WI1Sg70kFtW
         Bk7nVUi/gbpDOUu0vq/07QHDCJ4D2nTmBUl1ZuZjuu0BcIEhAPK72t5DGxLFdZe6+Dq5
         EnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747546; x=1787352346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+O/0P2J5XSI8JvmxrlXezdCyWyzpUTunWAbwhg3nfA=;
        b=Ctw9clGgYgS0Ay8BYtZZrEfdFnvSsJqhbSpbpaAkrM8UR9BmES8W6xef09b3Ngjcv4
         2miAG/lExoNsAZdxPkpvPCMCcRMidsmgoBYTcQg4yhmmHGChf4PxSTIjRb3u06ZhyIVc
         93GZFTahTBVzJFzfCbIJXoq84cfnRnEiTKQGYVrDNebbc5phOFSqcC+03VOWdnChoFMN
         Lo8OFkmjqOKQ2nr7B3EworTNwUYV2eCAbI7EroxMB8ecJ5xGqxb3TW7VepL73iAWN7ly
         HskSUJoGlZN8Ar6g4ejfBizANkk3ydgaINQUgbgjOMzHb2apTGRwOCgWOI1mQ3gS20nq
         nxAg==
X-Gm-Message-State: AOJu0YykufxjyvA1KXWNsft8RYSfQRmVMgDXgRtxODjyUBVv70pNyOaz
	qGTbRz8Zdjw4crXYJ1QrCKlHmGJITi2nv9+0sAf/Qjxnt7vz+6/PRtGgjJPDjteD
X-Gm-Gg: AR+sD12M+Ir0p8Q6cWP6bTeadbykRnBoXzXRoyMHwd04fVxUypoFkLp5+42GMFjHx8c
	aV00zXv64uf3sU5T11nmrucwLXYSZSzLb6P5153yxhMtzuCkXP2bgNtrdZXRIB1EmfdbJSyr6Hk
	P8W9m6UUaE7E099Cpq59V022bsE1DSsvs3FSAWmAFQjWR8ZpE5UzPD5K3a47ybZQkDWVKwRh3dQ
	uAF3TuYxRCk/0Hq3t5oLLYYL97SZOZezwmYO5rRtBh7mUKXdhkzDIoNhvc6UYdQ6YIwbPDYZYxu
	O+OhllkDpAofopw77SK3lD54QDZmTkcahYRHAMcp/8EDza6zB11YnI+zROVm70FvGOEIdzBKlLI
	EW3Mr3HOUDjYKfDwYV3FawuMdd2BvpgPUh4sSQQT4aUMPx0e6FOtZEsbBRTyYJeNoSkwqoh067w
	qLvPGtvFGeZILOJ9nSnf8JEOyvQYus2O67I4v4KSidd2PKGvXljJ1uRLNvQ77dAXK38bSm7Rdwc
	OfcUh/N/fTV9+h6Kr/o20apqEpqmLrvx6IY/RKZlpIuSFD7Y6b65VCtddvceVppj3DkfIk5rJO9
	fmAMrvgPVn9yLnDWukhllfaXkmAyr+wfdUizU/ZbCAqD7KWPAg8j/16CRwKEN3OL6OpCTOGY3yC
	1pNpzVZPFeRTXwiA5xv8c0shmU2XPOfcbNRqPdBWs2wdzxQ==
X-Received: by 2002:a17:90b:5805:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-3933b90d562mr10373794a91.16.1786747545883;
        Fri, 14 Aug 2026 15:45:45 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 002/109] xorg-sgml-doctools: upgrade 1.12 -> 1.12.1
Date: Fri, 14 Aug 2026 15:43:48 -0700
Message-ID: <20260814224539.1523174-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129066

Upstream 1.12.1 adds a meson build system alongside autotools (with CI
checks comparing the installed file list against xorgproto), aligns the
meson settables with the autotools ones, refreshes the gitlab CI
templates, and drops the "All rights reserved" phrasing from the Oracle
copyright notices.  That copyright change alters COPYING, so
LIC_FILES_CHKSUM is updated accordingly (license terms themselves, MIT,
are unchanged).  Upstream also switched the release tarball compression
from bzip2 to xz, so SRC_URI_EXT is set to "xz".  The recipe continues
to build with autotools.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...g-sgml-doctools_1.12.bb => xorg-sgml-doctools_1.12.1.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-doc/{xorg-sgml-doctools_1.12.bb => xorg-sgml-doctools_1.12.1.bb} (44%)

diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.1.bb
similarity index 44%
rename from meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb
rename to meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.1.bb
index 21a0ed74fa..bb8feba64b 100644
--- a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb
+++ b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.1.bb
@@ -4,8 +4,10 @@ PE = "1"
 
 SUMMARY = "SGML entities and XML/CSS stylesheets used in X.Org docs"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=c8c6c808cd3c797a07b24e443af1c449"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4cd7c44828c87cd91077a7d85098f117"
 
-SRC_URI[sha256sum] = "65a9fdddedc17bd5e9c0b00d904960f03f047c3a62de5458989d493c29fec806"
+SRC_URI_EXT = "xz"
+
+SRC_URI[sha256sum] = "0a5d54c0706b4e89d5acd4d455db3745ab4ad26be627cce015b90ad403b56d6f"
 
 FILES:${PN} += "${datadir}/sgml/X11"

