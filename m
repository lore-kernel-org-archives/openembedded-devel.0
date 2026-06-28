Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D8EC43602
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:59 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14765.1782634375907388993
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aGlZl4XT;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30b6dad2382so4557906eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634375; x=1783239175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuC3Cnb/3FOan1X0cyqCfEfG/Eins7FZ364mSpKuxGo=;
        b=aGlZl4XTpSbVnVu6mRCxKFXa1LvgxLGCIAmvltymWhInP94Y4+auPIrah0UD7LKyML
         vGdgkF7+Z3C5nJUn8Ee+1yb+tupkkc2aeundC4QivZr8nl+6XJBfdt6T5aGAMsoDuUuK
         4pHvm+TH5OLQLrTn1pA2YjupbeG6rJpbmQFgRN0UiF4o8KLDJO/iIIXmsnjVia92I6J3
         tplo/9CmzLnkcNMGsNAkfQqLvXLavDTL+YZl8l1cNrKZaDVC3OYkL8GSdYl8R0Ni8HWk
         RgnnUnPA5PcLZDRz/0UJ32D97SAj87zygOl5w9xPWcryWff+4FA2+n9RMbisKQB0JTsX
         7QuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634375; x=1783239175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cuC3Cnb/3FOan1X0cyqCfEfG/Eins7FZ364mSpKuxGo=;
        b=so2HV0ARcmf8HBlZWZ/d1hLOI9d7LMGvSwPzbp3dTKH7Ts0LGDzffM/u2pacMYjyrC
         Cu/mDfL8zY1KyPtFc/Q6giEyrkBrzln1jRQrXCM5QSaWpb/fEVDszaNwPyinMz3zxScK
         JCXbi631fXfzqaJ6iyw6GMmMjORlzSTA8MPEC+P4I+31jbTRadqdqV1Xq+2KUAERqh56
         /Gu1kwhX1hdqa401fTBy/8FVEdHksoT/QXkPieUfqYJYwrRiyMDIx5BfskOT+b8ckRJZ
         Dh7KCkGUoYeIr3lzteLrYPOQDQr4oRsvNxq1VxUGFye2zYWiB1Ubt5NzlXa+TMrNvNvg
         DTsw==
X-Gm-Message-State: AOJu0YwVqrDt5XHbf8/vZOoFzSDRWqXypt7AUAPn2gHbWLkxU1Worpjl
	E+AM8+Kimjsr/jsITQmCsm5xE/cBnHRNowS06jeiPNzowmpox79OA53gyuQSCGc9F77E4g==
X-Gm-Gg: AfdE7clkVwmsBMPQR0IUy4drMJiQ9mEXpGz7zDFchSyy+fw9RxQLHbLCgiO2qApwEG2
	E87sLvyClTbzIBloObIoJJT37ww9Aoc87kAJUB5PBGXlGeecGzXB6uTsHeHKUII3WbDNkD1mTlf
	TipLEmYpdn30fn1PFfkERU74Cmx0GYHBBuppxSIB4fiygrHbxWqBSLTeoDqunwqdG16/dhPtMkg
	JZIaU2qWkt+pROXVET9pA8X/asORI/SG1iIrqa2M7oJS94lUVDQ4OHxGXokz+HmYVN3B3wCWur4
	gW7OtDJcbUlt2BhPZ8MZiABG6xM768HQDVkSWfpUlKxDGSP6TNaG8gbsnJtFFqbtMwzvoE+21TF
	Di6s7eiN85z3j1hF6OiircDSjHfMH8jnQRl706KFEnn+VPZkC2VccjSylzr9sPWp4CVsNaD8lSk
	xxGdUDcWvpQMGH17OwvWU62ISjlQKASEC/TwVsUIe283hXBl2WV/HdMUhfVGHKJdns4/nLtXA0S
	zHW3zylVHfx7bzi/w9KRTtcVupUxFF2p0U6phgl4AQ/AqKKud04baAabHBu7oyVj/CxZsVkPfOI
	g4UVWNj2zn2ZlP1K3K4OeY99mhLfgg==
X-Received: by 2002:a05:7300:cc0e:b0:30c:b4c2:e46f with SMTP id 5a478bee46e88-30cb4c2e595mr4577653eec.36.1782634375134;
        Sun, 28 Jun 2026 01:12:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 098/128] libisoburn: upgrade 1.5.6 -> 1.5.8.pl02
Date: Sun, 28 Jun 2026 01:10:49 -0700
Message-ID: <20260628081122.178348-98-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127908

fix S for the .pl02 patchlevel tarball

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{libisoburn_1.5.6.bb => libisoburn_1.5.8.pl02.bb}       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/burnia/{libisoburn_1.5.6.bb => libisoburn_1.5.8.pl02.bb} (75%)

diff --git a/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb b/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.8.pl02.bb
similarity index 75%
rename from meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb
rename to meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.8.pl02.bb
index 3982eae63c..3b3b19fdee 100644
--- a/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb
+++ b/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.8.pl02.bb
@@ -6,7 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
                     file://COPYRIGHT;md5=43cfe25a7e4a65f722d6253fa0649bb1"
 
 SRC_URI = "http://files.libburnia-project.org/releases/libisoburn-${PV}.tar.gz"
-SRC_URI[sha256sum] = "2b80a6f73dd633a5d243facbe97a15e5c9a07644a5e1a242c219b9375a45f71b"
+SRC_URI[sha256sum] = "a977b03dc3686d9fdca600458b1578f9cac2b875609bd5ec21f5ada55f20ec50"
+
+# The patchlevel (.pl02) tarball unpacks into a directory without the
+# patchlevel suffix.
+S = "${UNPACKDIR}/libisoburn-${@d.getVar('PV').split('.pl')[0]}"
 
 DEPENDS = "libisofs libburn"
 # This replaces the xorriso recipe

