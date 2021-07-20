Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.4290.1626761656533398545
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jul 2021 23:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PixlDDIF;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id i94so24695738wri.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jul 2021 23:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5vr5ofi3HuGEdjSPGMmLvIXO1elV6dyx6+ZaIUuSIe0=;
        b=PixlDDIFYacUFsaLVGA65FoRhd8vcej24asmqu6bSFonvgca0mPGvEFYCaY14fcO75
         bOIn0Ls6EvEfcmJk6/MGNBUKlusO1zlsc398e/tidWr+2BRl6W0sH21qkNlDV9PaSFkJ
         7eizDZDX1+VNdtYajEsTP22RXTCx/O84VJAhEJWtJx1I7LWS8gVRlXz3L++MD/peAN6g
         kl3+OhJNGTkt+Ab+y0BLBc+s0BWHLMezStHM4CRdVW0cS7lMSluDJYYN5S8qIex7TmyG
         PPNfszXvd5hwWkaKr05kGVnqFE+0OVY2UzHukE3d+fx5nqdiVKM2bO6H+2XWiiJtoR/7
         67Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5vr5ofi3HuGEdjSPGMmLvIXO1elV6dyx6+ZaIUuSIe0=;
        b=Rs7tPeUh+SzxjjAFAfTZqPuXn92sZM6XLdurvUGZpKeJft96uzy8H3D6wCOL+51Pd+
         CRYfma/qSkRn2V4l+HyY5H2khsWGzqZt10vJLCL5uc6vfLLRFKjwnIz6MUDxzFmt/x26
         iMvQwrTI5R9xgd5SOtJR1LivrSNvmIEcWmSXE+MuBTLUOr/ErfcWRCyF0x6Zp8GxuDoM
         tGjc3WpFSUsxeVM5XtCxMMuepmIwL1KihVhLb4MbYLdy2mM8kRq3z2owN7pwcMUMHDGe
         Gqiaivp2wJYGITvdpYhSD/sAJyt8TZmyRMOtpN1qKMvo3HYicfC3La6P4xNmfwRmINtN
         yswg==
X-Gm-Message-State: AOAM530IU5olK5ohgRSnPRM1fJMs1mnWO19+zMPM3MzEdAeiE6E64nlW
	qWTSjjBN7Nd7DYPztm3g+PKTABevlpg=
X-Google-Smtp-Source: ABdhPJyORKxbuYML5QACB88ZpEyXBL7td2tOavKDyR9gxlqjNkrZ6uoZ095IA+lVl3MU6MATR8tQog==
X-Received: by 2002:a5d:46cc:: with SMTP id g12mr32576516wrs.136.1626761655165;
        Mon, 19 Jul 2021 23:14:15 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f02a430b7203cd4bde6d1df.dip0.t-ipconnect.de. [2003:f0:7f02:a430:b720:3cd4:bde6:d1df])
        by smtp.gmail.com with ESMTPSA id u2sm18205922wmc.42.2021.07.19.23.14.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 23:14:14 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] fluidsynth: upgrade 2.2.1 -> 2.2.2
Date: Tue, 20 Jul 2021 08:14:05 +0200
Message-Id: <20210720061405.2255027-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720061405.2255027-1-schnitzeltony@gmail.com>
References: <20210720061405.2255027-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes:
* The MIDI router now handles out-of-range parameters in a smarter manner (#891, thanks to @jjceresa)
* Keep pedaling effective when the same note is played more than once (#905, thanks to @jjceresa)
* Select soundfont samples by frequency instead of midi note numbers (#926, thanks to @Naturseptime)
* Fix the sequencer's event ordering for NoteOn vel=0 events (#907)
* libfluidsynth's import library was broken for MinGW builds (#874)
* fluidsynth.exe short option -Q not working (#915, thanks to @pedrolcl)
* Precompiled Android binaries didn't work (#894, #897)
* Fix openMP detection for XCode 12.5 (#917)
* Make audio.jack.autoconnect connect all available ports (#920)
* Prevent MIDI Player from continuously suppressing notes (#935, thanks to @albedozero)
* fluidsynth.pc now includes private libraries for static linking (#904)
* Fix typos in code and documentation (#939, thanks to @luzpaz)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index a8c8b4cd3..51101e8e6 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -5,8 +5,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
-SRCREV = "90a6c52e1c347d1c4283b0de9f860ed2fbc413bc"
+SRCREV = "fc21d284dc7fcacdbc456f30228110a55e6e79f6"
 S = "${WORKDIR}/git"
-PV = "2.2.1"
+PV = "2.2.2"
 
 inherit cmake pkgconfig lib_package
-- 
2.31.1

