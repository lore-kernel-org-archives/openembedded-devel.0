Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E9DC54F5C
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:38 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3032.1785293075082203044
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H/Rqn6bd;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e08baf860so496112a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293074; x=1785897874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWMRaEcnrEy+wQRdj7vmhWab/e2bZCuOK+MMxZ+9ajs=;
        b=H/Rqn6bdfkqziQslRsbBWmvMl8sxjLTaVvpGiY0RDehbIvBCgkpAiPMShLA/pYCzFo
         hlt2kOlOqYuLAu2hD97XKqfPuvIj9VjLnDSHTl7L7+bHN8IQ07UF0mobMSKDXoLuVIML
         qNqDjU+1gbBBFeMMBNw33M1tbCje9xfJlqMY5052/xd/8DZeZXWP/4y4XpKWs1CL0mAx
         scCiwt01ieDl6mgHoogo4m9k0E9ssL5Ieqyf7xgbsmS0XUbbhPhE2COyefmJLtTL+7an
         TGaYxiaI5xHU/ulAPA55TAfbHgrlHL5Q5ofi97EQG/5bQm3VsvGLneF9WjR8nseJBoPH
         gS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293074; x=1785897874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RWMRaEcnrEy+wQRdj7vmhWab/e2bZCuOK+MMxZ+9ajs=;
        b=YXM6Gloqv9LHHE7cfgGRrysdrKKKnrUyjSpcnYnfRJaDOsPa1bXU7h0KyopeiRK+h5
         HDuTb1ygwUvFiGUFuny/9V9Lb8Vc0ln1H2iY3x7M+vOjUJ77o2okhbu5upbge6tRHX50
         MhQjUe5QBaktDUL39sBvAi3NWdrl25wip41mDmr36fePqFAATfASC5B7HXfzjGOjsfay
         +7xNYZBZuZnHTlUAjmn0kPH+moW4IxtSSEfjBYcpIwKAXriv6ALVJFBck8rRRRBuf82E
         jfFTL3HiqabBbfLLdaKy7MvYCh1Nz8fkKvoQZG2ppe2QEQp7O563cXNV7LkPSJCyTZIf
         3yLw==
X-Gm-Message-State: AOJu0YydmavZ26N+JWs3hd4B/QO6qbQg/bXH1X7+35/8o1bJpsQr8vy4
	3kiqwfvM4xYz0GRwr61mz/EKtLSbCBgvm8F7qGwC89PKFGN6NIY7WNiMHLZhEssW
X-Gm-Gg: AR+sD10gc8i8h4y4g8w/NNv2ouO9Fn+R551yUq0hA/6ZeGOrko9kLzHjLptt6RT/woQ
	DLhOHAUpHjoS2q+hcFT0l/STh80IAyF7luC8W7MMtbWIUXcHwEy6D1xnPe7bclTtMEBcAHT07Us
	bMmBetMizuYhzXSXQPI3iM0DmnHXqVyOa2IZWx39lhjtxlv3ihqXPXRv9RTldV8cnbqo3zCFVqv
	G20BVN1U2WKbO/SWsvsmJCqOm6JArFppZ1WXXXlM+9lnapYbHB7mPEGd6Bt5SLuxOVSOgXDnKmP
	Jhi1pkM42wtShTpKu75p0UTjBWhIv/2XhrMXFc3sXItDP2ROu12icfyB5ldIWDtnPZ7+Yi7K6oQ
	kM/8M6kFrDPxzfHhQmLUoD/xe80u6HYJfJFM1mWhNz5db39d3dwXMgF9j4hvnCGjrr/bP3zNast
	6L9iGocMPlK4MZV3c8bPQdn5bL7EgLugVmygLXenhtMwPowQzcftM2KZ3f8RCCunBZeo8LvrdLn
	Jy340Xh6PN6IdXP2ABSnAgTi2Qug3nA39AznEPRkT/4hrS29h1uuSWLBBJugITe0Kl8582BOaA2
	2KBLhLhMvBBXZw+MHnbLvIQi4OSgHRUE5lH7cGAEPuLhSIFzvzBh/NMlin9ZaGWnpEmnruJs9Bo
	xm+hkuSbRkXIo
X-Received: by 2002:a17:90b:3c12:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38f6a44b7a8mr5360290a91.14.1785293074429;
        Tue, 28 Jul 2026 19:44:34 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 10/18] ttf-tlwg: upgrade 0.6.1 -> 0.7.4
Date: Tue, 28 Jul 2026 19:44:12 -0700
Message-ID: <20260729024420.2328180-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128526

Changes across the 0.7.x series:
- 0.7.0: build fonts reproducibly (source restructuring, hence the major
  version bump); generate OTF by default instead of TTF; provide LaTeX
  OpenType fonts for XeTeX.
- 0.7.1 - 0.7.3: further reproducibility fixes; make Purisa/Sawasdee
  embeddable-as-installable in PDF; glyph-width and PANOSE fixes; normalize
  OS/2 Typo metrics for consistent line spacing.
- 0.7.4: fix parallel-build failure and a Type1 reproducibility issue; add a
  Stylistic Set 1 (ss01) lookup for descenderless YO YING and THO THAN;
  balance Kinnari/Norasi cubic splines.
- The 'ttf' tarball moved upstream from .../software/ttf-tlwg/ to
  .../software/fonts-tlwg/fonts/ (old path 404s for this version); SRC_URI
  updated accordingly.
- 0.7.4 relocated the fontconfig .conf files into the source tarball at
  fonts-tlwg-${PV}/fontconfig/, so do_install:append now iterates that path
  (58 ttf + 14 conf files installed).
- Updated LIC_FILES_CHKSUM md5 for COPYING: upstream additively added a
  "LaTeX Supports" LPPL section (merged fonts-tlwg LaTeX package); no existing
  license text removed, declared LICENSE unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{ttf-tlwg_0.6.1.bb => ttf-tlwg_0.7.4.bb}       | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-tlwg_0.6.1.bb => ttf-tlwg_0.7.4.bb} (52%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.7.4.bb
similarity index 52%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.7.4.bb
index c55a810af1..403231a483 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.6.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-tlwg_0.7.4.bb
@@ -3,19 +3,19 @@ require ttf.inc
 SUMMARY = "Thai Linux Working Group Fonts"
 HOMEPAGE = "http://linux.thai.net/projects/fonts-tlwg"
 LICENSE = "GPL-2.0-only AND LicenseRef-TLWG"
-LIC_FILES_CHKSUM = "file://${UNPACKDIR}/fonts-tlwg-${PV}/COPYING;md5=3d20cd7eadf4afd5460c0adb32e387fd"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/fonts-tlwg-${PV}/COPYING;md5=166297e03f25f65003b290136b7287f7"
 
 SRC_URI = "http://linux.thai.net/pub/ThaiLinux/software/fonts-tlwg/fonts-tlwg-${PV}.tar.xz;name=source \
-           http://linux.thai.net/pub/ThaiLinux/software/ttf-tlwg/ttf-tlwg-${PV}.tar.xz;name=ttf"
-SRC_URI[source.md5sum] = "5ea5bc964d992df0428f2e0b85f48400"
-SRC_URI[source.sha256sum] = "77fb9832221fde60c9f683ac3fdce7d45ab6e9c0d83df83da969a3fe9faba537"
-SRC_URI[ttf.md5sum] = "1bc51f45a7b661404a944fab6911261c"
-SRC_URI[ttf.sha256sum] = "aa9cd68969b6f704df3e5b1a2e11204c47f118c8ab052f04c111bd5f299f77c8"
+           http://linux.thai.net/pub/ThaiLinux/software/fonts-tlwg/fonts/ttf-tlwg-${PV}.tar.xz;name=ttf"
+SRC_URI[source.md5sum] = "dc05ef81ce6b9dd5edc87f83065dbbf4"
+SRC_URI[source.sha256sum] = "2531d3e02de1d293e4a9f8527ac4d3d044a845f49dc2d314c5766b4f68730735"
+SRC_URI[ttf.md5sum] = "621c0ecf4f7338e2390d3cd0deb00c00"
+SRC_URI[ttf.sha256sum] = "e1afa592660a48234051a8c6b54aff36b85db8da0299878ed4d1668a2bda3c57"
 
 do_install:append () {
     install -d ${D}${sysconfdir}/fonts/conf.d
 
-    for x in ${S}/etc/fonts/conf.avail/*.conf; do
+    for x in ${UNPACKDIR}/fonts-tlwg-${PV}/fontconfig/*.conf; do
         install -m 0644 $x ${D}${sysconfdir}/fonts/conf.d/
     done
 }

