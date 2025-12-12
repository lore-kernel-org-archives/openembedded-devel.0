Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB6BD4415C
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 09:22:03 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9136.1765531321725744515
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 01:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cRcODu0g;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-349195f1a52so683765a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 01:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765531321; x=1766136121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mF+biW8YELZTsRYPJL+i/6dPFa5Dhuqu06BzkHXdlpQ=;
        b=cRcODu0gamjmvO5A+l5uvhkIXHl0jiHTEVFl3MIw+xy3/fSIiLi1bT7RKDFvv/q3iQ
         FrHD3h1+UtrP2S8/9FIx498pnPdrLY4B2zf1JQRurizvJdUJtmDigCfWXIjr1zfW00zN
         /hH1dNOO2E074KNOJVFpqnWdNp2O1QK7LOYK+0498K13OT6I3yUn1jAh4kccNHBYH9GT
         QLppp7fsB+sxc0OnJ+TO7WJTA1l5DzO8VOXK6dLlInCjD2rCJSgrlnQZofXHlbJJj43K
         oSEyub36V9PP3ltx3PUu4pfRe+f25b+NyJqYHntdf0i/vEwU7jFD2dxIC4hJatwk2w80
         otuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765531321; x=1766136121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mF+biW8YELZTsRYPJL+i/6dPFa5Dhuqu06BzkHXdlpQ=;
        b=X6b1zbQZUGB3MukIsoPARnCUOTlaYQAu+/q8GOFFFoZvexrM71bbnF2It7uiM1VivH
         jVPnh74S1JuE2oTblqLzfGGZgWFSiBTkL15bpnIoA+Q1vwl4GrkeHDffYlN9Ak18b4in
         vRhn7ZHv244xr5XnbN4K82x9uaBumTVac1SCfU01/OGauIR/q3Z5vKJU0x2wIfqXmCco
         pjSy1e4Yt2sVniTEcTlQzHv4YIfVNYEkrnauCIW7p+im6GeYob6ro3CYfEKgAitTszbx
         3dEVqkr/zdgXjy6zYKSZ1Jd0k3kwEXDRocL65buEQVegzKMWM8kR0zDqFv4sf2W6mk1b
         rM8g==
X-Gm-Message-State: AOJu0Yzqx1t3kNaStC6zsLs/jmL9T1ixJe8i4yjmLmsAcjQGfZzJeTrR
	tVtlA7fZ0L9fOtKW2guGFMzQuYhzQbW4HafPvvenHolcnuoyjqcwz2MMZviMuQ==
X-Gm-Gg: AY/fxX6RE9vzjnYNvvwEst3aU6pRyFA1zXP2y/mHBr49KZXfh9AbUqlufCDwrDyGoYZ
	SdcMOThJA5Mmrnq3QOB/evAK/IVPihr7mjRDPjppse5P2Lcst8EhpEZCGfAvxAn5wpAf24BC9sd
	Eofoj0d8tkvATe9NhhG4+0yccVNw5nS/nFRM7n3hfs+LJJRDx6LFCxivhYUgCnpMMxJOia97LCy
	1slKkRk2BOIpNNdaWmCQOmRqYMKzQ66gVafFWlseS2Z+Er/0LS91I8T4/XMjYJ+pBFeJHpf5lGk
	G7h3jEKQFK7Sny40IJKcn1tU6vZG4RAjGIur0BpI0vqW3gkS15njQXbRALIMDGY9HHxLwFTlvjp
	XmgGzSmrTySyZzt1e5wA5oc9cxh0CD48k5qUMBSmKnMDvHcqqWJ8xwkKKNlRJmuQn/+CW8wwcSK
	S3cwgM5qTAUvg6ztawSRbr0Ac=
X-Google-Smtp-Source: AGHT+IFXu+uapGYzvq/vuwOSzipn2eJV/i31P8C1mC9Utk4h/w0e8kJFLhF2HHJe0m86xNCeaTdXXw==
X-Received: by 2002:a17:90b:2692:b0:343:6a63:85d5 with SMTP id 98e67ed59e1d1-34abe05e89dmr1318427a91.16.1765531320825;
        Fri, 12 Dec 2025 01:22:00 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe2cf869sm546188a91.3.2025.12.12.01.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 01:22:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][whinlatter][PATCH] nautilus: upgrade 49.1 -> 49.2
Date: Fri, 12 Dec 2025 14:51:53 +0530
Message-ID: <20251212092153.187440-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 09:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122598

From: Wang Mingyu <wangmy@fujitsu.com>

* Bugfixes:
- Fix handling of unset XDG directories
- Reduce memory usage of thumbnails by correct scaling
- Fix potential rescaling of item when switching to cut icon
- Fix crash on empty file lists in drops
- Correct sorting of loopback devices
- Don't skip the first file from operation progress monitoring

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 90343e19902d5bb341461d1e7255b5829c894a85)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nautilus/{nautilus_49.1.bb => nautilus_49.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.1.bb => nautilus_49.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_49.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_49.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_49.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_49.2.bb
index b71182e3bf..1229fa4a80 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_49.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_49.2.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "add2a0e410fd22da2851ddd0c5b3d22c9e9d8c33111511f336961e3b461b535e"
+SRC_URI[archive.sha256sum] = "2576b34bed2781a89f09051ec9fcae3ae17eb7172cd7be678f592aa14e4c26b1"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 

