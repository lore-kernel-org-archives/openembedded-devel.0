Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C44C19F32
	for <webhook@archiver.kernel.org>; Sun,  2 Mar 2025 05:21:45 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.25606.1740892898095941341
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Mar 2025 21:21:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X9LRgaQX;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2feaca4e99cso4638991a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Mar 2025 21:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740892897; x=1741497697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMjMklGPNz0xr0lla+tKwzS8qTuA2zQENUUAYhb8TFA=;
        b=X9LRgaQXc3JRBj5EATIXhz5wBBpA4Gd3KeJ6K6g2b40CfEeaPoUoWKRgTFgBNoErJw
         h7jED6T2Mu2RR9JVHMvXUSQF6fgzI0O7pcxkNHtpthL8E0bKq4ZKUWaYpV/aw0vr/dCt
         9UZRqMf/R0xjJxqLdi5NkSNlxj45Hga2fI97srpBY2gFREN2TEwwpUzi0SlYwOt8RhWy
         a4r45IojSQnwdVnLGJvvhl3n2wQ7GeyrR0GilnvfbNGlpZeam6SFzXQkSDaadq9XjX3t
         7W7lojiPMt1Zamre8cOBEzuoGwMPKsfSwNaS/iSei538P+biz+mqM9KE29PD/d6DtMSx
         vXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740892897; x=1741497697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMjMklGPNz0xr0lla+tKwzS8qTuA2zQENUUAYhb8TFA=;
        b=T8HJ5aMJJlUbPVd7UKr4FN9EF4UYI6KNS20iNta+rsMWloTMWhkILj44/jpFn8jSAK
         cR5sqsQ2FhmNgfoap05ofnHdUftSO4HPtIit44BCvwW9kse57E2sU9pke2I5t1WhJyD8
         2g2ikQyXxCM3mlRB9XKqy2DQyl5jOYlk+bnY5gzyagFkb/Pc4LgbZyLyi0AEl/BsAI0m
         Tc3G34vTno4V31xucLJvgivt0ymBbfkSH8TCfFAfDsGx+NJjXVMLPf4VOAiqDdNrsjf3
         cMRKwGBPvsmi7yPWI8V2i6QwMnu9iUam8CZaAI8Zh+K5m5KiVE2hAGcWMs3GCOJYG/2L
         rayg==
X-Gm-Message-State: AOJu0Ywzxn5DKKWKk6PryTI+FOTqakFg69hPGBjKVdUSQYRa+QZsMkNe
	F3HF2TAhP2JU3IJo86X9OX7cwY9Qk/LAusnblSBOrs07zizXNOzSf42yQc0m
X-Gm-Gg: ASbGncuq/tRRyzVFrc7J5Pttl5qUZLtSM8hFY3S1omM8Gc9w0+Ycxr2tR+xQr8Tmv/W
	UgCDyUSBeFS/a3DhRlhC6g8jC44LfgXM8gX69FNoE565c7deJSWUIzXLMmMamJSGP5r4+dDRiRW
	DWFemVkFiz446y9undN4ROMNSyX83tSWUNXCS38nflsVKTosd1hezWUHG1QFPTVi/4x3Ty6iNiF
	kaaMJnA4Vudn2wN9hjuA5NIz35hWZW7fHNR7NVDZzNM4YufUu8s7lnwvCr+ktlKlYmHFBQiIL6K
	8kObauvKO4hH4VO0AemqcdQVaqoIO6hdQVbV
X-Google-Smtp-Source: AGHT+IG3G06Svcyw7WPF+kCZgGNrAQcQttSUWhFc9AM5iigfsH7ddoKhP1Lw4kbQdl70/jwHhvvh7g==
X-Received: by 2002:a17:90b:1845:b0:2fe:6942:370e with SMTP id 98e67ed59e1d1-2febab2ff84mr14421966a91.7.1740892897093;
        Sat, 01 Mar 2025 21:21:37 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::c3fe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea698ffb4sm6360069a91.47.2025.03.01.21.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 21:21:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] clutter: Add m4 dir to autoconf macro search paths
Date: Sat,  1 Mar 2025 21:21:34 -0800
Message-ID: <20250302052134.4053799-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Mar 2025 05:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115721

autotools bblass do not search for the .m4 files in srctree anymore [1]

[1] https://git.yoctoproject.org/poky/commit/?id=a4b1fa2b22794d59fee716afe6e269dae7f87ace

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-graphics/clutter/clutter-1.0.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-graphics/clutter/clutter-1.0.inc b/meta-gnome/recipes-graphics/clutter/clutter-1.0.inc
index ce6b8a0f49..48e9d134ae 100644
--- a/meta-gnome/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta-gnome/recipes-graphics/clutter/clutter-1.0.inc
@@ -21,6 +21,9 @@ EDEPENDS_WAYLAND = "wayland libxkbcommon gdk-pixbuf"
 EDEPENDS_EVDEV = "libxkbcommon"
 ERDEPENDS_EVDEV = "xkeyboard-config"
 
+# Needed for finding introspection.m4
+EXTRA_AUTORECONF += "-I m4"
+
 # Disable pretty much everything, override in platform specific set up
 EXTRA_OECONF += "--disable-quartz-backend	\
 	     	 --disable-win32-backend	\

