Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90807CEBF96
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 02:24:06 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2457.1763432644666412476
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 18:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ijDXMilZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-298287a26c3so60638625ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 18:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763432644; x=1764037444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcjP63Lc4oYBdo1pTtU9ukjI7vSGM6KNk8rt2UF6Dz4=;
        b=ijDXMilZDtMrvoCXaQYTgpgUbmdDHNo9MaD4K4U3Ur/swiNTYsRDzCbsoOOme2Gz2y
         NpeaMJu+YqZ0oxF+xZuk0BqOxvMESWsR3Xg5QZIhN6tcLpJEB/Mnit6V9K5j5WE8wXBP
         9nWcAOoFEfZwnpXTj/IU0pEFVxroQKOTkEu4HEj1BLq+RL3/8eZwH+PMdaWSR0lbW/s8
         B1j60CVftVR5CN+rEM0k0A8Nv9U3u1npQ16jmHpE0T0eDQNBIIPSeM1cxVpnmQ5gq+o4
         T388zJXSMytgN5yFmraY9y1Cbt+ObCFptoTQETd9qOCuAk8+oIg4OSF0jNzrVL1DFJJv
         xQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763432644; x=1764037444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PcjP63Lc4oYBdo1pTtU9ukjI7vSGM6KNk8rt2UF6Dz4=;
        b=laa3sIyOaMjpMmcE4i2RJz5WkaT6JrrumnmLVyQq2AKrkwFkWBJevFnOmHdtQt22Do
         mjDdLFDqvYyyjMXn8aBqN936XwrSsNzOFoNiFI5loGE0wbLNFzWaWK87Q+SVub7NzAhr
         KXP1Gne64pnMPhlRSxxqshdpdbhi3WVjZ4QNlsfxgQNnANcWjkJ138t81HAmuSDl2GJU
         zX0L/5OV6iC12l0bCEvBbKImuLYBBvNmVtsjT1s6TvAJuqtZP52miEMiuQhHLYJwUb7g
         ruSmdONptFhIVvQ+t/uvQ7F5gYN2QriJRm8+GfwuCngdFQqFcSNPjPKuNXhPtS03t2Eh
         j8qQ==
X-Gm-Message-State: AOJu0YxZFfQ2DnClQ91BLfUPYFVAlsCIsCYrDom9Hcn50E/vq7Dt1xBi
	oX0R/FifnvxfTIXgnME8SgFLka4nZkKdRVvIvktvmYQzgVorWAVw+bzt256qB62Z
X-Gm-Gg: ASbGncs8PH/SelKECWj15GozHBWTrgTKVQcTAZON0sZTexVPwA9Jd7Otl3ZwYiYhCQY
	0Box+i68ccC87aoMSjjpJL+X6PDtv17dBLfeTuFX+X9SWYweBbl7lgdc9v5oxtXhk9KtgFLinIB
	mw8BvNTI407mRL4siXtcq8ucqBWWXyXjvA6oHFnCKXa201vfLyb4rSARpnK31FHy0IXZo0kCdgk
	RSGdKVGQ6rrKvFPx2XEVsqeuHz9m5/T5zS3A79kLoPi/O/9x928PiCJe6lg0vgJiFMRGeechPl3
	J5t7yk0wsBxJNnGvCXG8qgWXXG98aJFPVWGCXsDEepoXzFR355be55VHCqpTOiYt3bCsI/Ivpvs
	6bFwKw0CbN7jhFa+bBz2mPDjB5w6hIgGPwHNR5hR8e0BEPAHeFHlTqiNYdIHCaYKdp6Jr8vSbxt
	GxTx0+A24bKPFYwqulIMehysJgRXahIBSsZbsDMi0TyDedHKvI9fMv4HJe7/jYAtzrpR3/gUNS3
	piBCQpQJGbrd9uPhxwlLMo12PctfaFP
X-Google-Smtp-Source: AGHT+IGss23ww3Rs+cWmBHMkKtP4DkcfJe0fcU2vjdeWZ/JbrjNy518bKJBWalIYAI9i8dW/2E4cJQ==
X-Received: by 2002:a05:7022:ed0b:b0:11a:6424:f40f with SMTP id a92af1059eb24-11b41717eb6mr5206243c88.36.1763432643643;
        Mon, 17 Nov 2025 18:24:03 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b0608861asm36829873c88.9.2025.11.17.18.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 18:24:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 2/2] xfce4-screenshooter: Add gtk-layer-shell to depends with wayland
Date: Mon, 17 Nov 2025 18:24:00 -0800
Message-ID: <20251118022400.3733149-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251118022400.3733149-1-raj.khem@gmail.com>
References: <20251118022400.3733149-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121799

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xfce4-screenshooter/xfce4-screenshooter_1.11.3.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.11.3.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.11.3.bb
index 1dff925a0b..144848a6c8 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.11.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.11.3.bb
@@ -13,7 +13,7 @@ XFCE_COMPRESS_TYPE = "xz"
 SRC_URI[sha256sum] = "1f6a14f7d1b0c440f31e24a8cc4fe2996185357fa786f0c2cdfe564ef673a710"

 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
-PACKAGECONFIG[wayland] = "-Dwayland=enabled, -Dwayland=disabled, wayland-native wayland"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled, -Dwayland=disabled, gtk-layer-shell wayland-native wayland"

 EXTRA_OECONF += "WAYLAND_SCANNER=${STAGING_BINDIR_NATIVE}/wayland-scanner"


