Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29F3CCFA18
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:19:55 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17875.1763014787438159313
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DabnQM6B;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a9fb6fccabso337398b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014787; x=1763619587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wl1NXV1Kasxa+kHHSco9Z+cOMPEXyb4ZFpG3KjtH5dU=;
        b=DabnQM6B7KLElwE2+ZnKyfuy2/34mzKbRldDyg4tj+U8GrHkZXq0BcimHh6EZ2mQTs
         o4uHzmUWzMV1PDVM5LVb9v8JIUiJPx/7zMOb1faq7LQiv1krbUPCvKSj8exCpiR6ZD/H
         HzEl/rEC5G4kjaV9WntR3oJhtsCikQ/SB2FOSt4iHTJHPojRzTMKoOqbXXmLr27IT1Kz
         OGHXOZVjeEQyP0q3hSjrl5sRM9Vn4aDAdPUFkfq445O3ciCy66YbpEnUhKZrbNjtlh8z
         L7jyccUBkSZMZB+y63wbzK+zlsRIY5/+/5+FIzvNgCB8OSAKqME6t0MtvAAxavnVb7dU
         fLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014787; x=1763619587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wl1NXV1Kasxa+kHHSco9Z+cOMPEXyb4ZFpG3KjtH5dU=;
        b=pUy+9FW5R1dstXDjmz5uj/13WrAzzwo3azR00aukIaMNNrwzHwskv+PpyQfwdKCgrO
         SOBQKtXT6xdhQ4u/XHD93Bob6zBEVW4+0JPf8LJsn7oP0XoLZcID1yn/ttpt1SN+qMnh
         +l8sr4SQNt+BzFiRB0B8c9wFqudhdpRTWQd0mq/jy8MrCwl4K7nqTjGuQzWspqIHoXdQ
         9ZQesSD3VLMbVuKRTgM4023fhFSXbcZQZenC1atwGvtXukcy5rpVEsqxI9wDJV47ZsAB
         TcqMDdISq8LGLmxKMrP+PyqFrmhL3NY4Hv3DrAe6TCthKN/rofECx1nn6zdwCcxAlwkI
         RjVA==
X-Gm-Message-State: AOJu0YykYERI2cehOeRBJIYWIZX1fgB8bI4Ts2++K/yqwbDcGgK1OKPw
	PBjW1nw8ZO2P0ITFmmcuusJ132SMCfOQnaCrBWlTiHjPJaCdMPquMDksKaJfEQ==
X-Gm-Gg: ASbGncvIrQz2Uz0f3AGzNoj1nNhHFy4dIcG7RQPc1sI41//XY1iH9nNl0Nkb8Oee1Tv
	tVmswdB8BeQlpDBXQ5d4T8rGXk8RutMaHyw9Kn4V//o1bKNGK/RGFTp+CBIFwM0iMTu/ZzlacgR
	LWn1qRFLCiUhtZDgm6DNiV+8oJQyrgKgoNIzd1UlEYa7eCg6Oz6bJ2pOXcG34ssIX1TN9CsqbvA
	bB+Qt++AtphWGchZqbt2lSVBDx+3lNqJj5QHArzcgXU0YgSaPOYjVZF7aLCa/sxIlIHtXiZoYpa
	i7TTZTvLUjSWeTBAmQJ0YzmrinOmXLF6oYtKMOhxy9vx6zuVdM2TJYpmNgZ0088bKeBgCMTiWQ/
	6lFMIn8mtCoKJAMfzhLcrDgRKHq995tij0ZraXmsqAYdAKR2dMBu1/hHx6ap1Q8VhXsfFypHP/q
	cQKCUmuJlv2iIakg==
X-Google-Smtp-Source: AGHT+IH+C8Zff5qOKB9alVazVzjHSgRPAiBEOOTnBeJPlewJSKdjNAfZU6Cizbiqt8BncpfCio5g0w==
X-Received: by 2002:a05:6a20:1584:b0:32d:a91a:7713 with SMTP id adf61e73a8af0-3590b513a4amr7549189637.40.1763014786636;
        Wed, 12 Nov 2025 22:19:46 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:19:46 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 05/38] flatpak;xdg-desktop-portal: add missing runtime dependency on fuse3-utils
Date: Thu, 13 Nov 2025 19:18:40 +1300
Message-ID: <20251113061914.3756301-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121603

From: Markus Volk <f_l_k@t-online.de>

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bf80941c3f12a94205f1ee5b7e9366e6e7e7b70c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb              | 1 +
 .../xdg-desktop-portal/xdg-desktop-portal_1.18.4.bb             | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
index 8719d3ef03..fba7bc49a4 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
@@ -38,6 +38,7 @@ RDEPENDS:${PN} = " \
     ca-certificates \
     dconf \
     flatpak-xdg-utils \
+    fuse3-utils \
 "
 
 GIR_MESON_OPTION = "gir"
diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.4.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.4.bb
index 8161ed160d..87e8f1f5e9 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.4.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.4.bb
@@ -22,7 +22,7 @@ PORTAL_BACKENDS ?= " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'gtk4', 'xdg-desktop-portal-gtk', '', d)} \
 "
 
-RDEPENDS:${PN} = "bubblewrap rtkit ${PORTAL_BACKENDS}"
+RDEPENDS:${PN} = "bubblewrap rtkit ${PORTAL_BACKENDS} fuse3-utils"
 
 inherit meson pkgconfig python3native features_check
 

