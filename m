Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6F6E9D3ED
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:49:48 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22046.1770216586714008468
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:49:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=ERDD3UK/;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.41, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b872cfd35cfso80933566b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 06:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1770216585; x=1770821385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcJ21nR/zBl41i+yvOMRCgbfABp/PTvDqBkg8ihnMeE=;
        b=ERDD3UK/DQp8Gkv56lszE6idA017OJeH6JdythTK+8vA2DemT7w2f3VPgsog5Il/0K
         iSk93mcdSTgN5gmsJ8oqSbW1pWZiYl8tkhgsQTSMRufHbj7GhY5dQUjLvr+7Bgx4tIpe
         mG5ZDkbobXKzplK2xJ0E6ABtCOFPRjQjC/ReE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770216585; x=1770821385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XcJ21nR/zBl41i+yvOMRCgbfABp/PTvDqBkg8ihnMeE=;
        b=Aee3+zoVNOahezQJ8r5qxnrb6H32LFZS9vbPhBjbeaOr1j515Sdx0P/7G5hRL69vZM
         eCHTmmbLDoMzmgt0Kd4YbM56zBVRuaFSJYCxjOEwt9N+AgpJ62eagKkD15L6Hv8Ev4I2
         hhw41KZWJGqPs/Q1D3ACZ24GVlNqCqXLHSq8j2gEA9AZtvSBsuXiLbZ0Vo2Uw7VQVq+B
         I/qmDF9n3mt3bVCXOdIyweihSzRJm9yLpilUGVDGyzosdUQBAr3t9SSgAOSvZ+dsLnvI
         EMU6H5QRKVSvue5emU8NGCXypkk8FuPhAzIglqGU4QG7pZsTYFTzE3fN9e8j7GSGXBJ/
         IGxQ==
X-Gm-Message-State: AOJu0Yw2iDdEtZ0nqmUTZPglgl72dd1JX3EQDvGF/JQwjIyO269AdOJp
	LxVJxOwaHle8KDgwFxaKdN8Ghr0PO2gdhLu4AYTyt72BcM1TcKEz/yeUypkJTrvkr7ROSidr05H
	uSgtO
X-Gm-Gg: AZuq6aKD50YMI+ewmexFIPQiNIetufDPZo7Hx6JupxHB2hFLzpQttORQd405C6kWGOe
	dYJSAVjwUBjPtgvepO3Sxh3cRlwgzq3rv6B191axmvuXgGQXKyT6FDwAU4454jnN9QwONawsWmI
	PAX+TIMX6orZnkwOa/W4QrWDJJ2vZxgk2pqY7AwUpdrv7B8oh84Fw1eGZDgT1taFLtQfn2PeleZ
	qOj0rFEBfgudRpUun4Tbv3e228TTlB9cMPguXD9ukSAIDOf9v0bVPGOsRbJUAtZaw2bVK24y/Ju
	LrXPJ4+Wb85AbqMmbLEI//+wnTjNFpNTmLUoldoDWKHd1M5nTx9ussI9tz52cLTgp1ibts6YW2n
	HPUES7+7n1EAgvUjiXxRfQkxM4MqdaOYoLAdkJrCEGefaRZLAoM+Onjkp6cpXSQWif5NSASzcEO
	NpMHpdgDBAUT5zxa6CNdft0wwypj/LekoGfDL6FwtHTUmXomGIYmtbV8ORZzDGelDSYZVZvtShg
	2GNcpfCuUoKBwIOKJ9OS/UA9nUbPpD58ElfIptOKcNwXk9r/Jxv
X-Received: by 2002:a17:907:9451:b0:b8a:f365:f2f4 with SMTP id a640c23a62f3a-b8e9ec79a7cmr140881566b.0.1770216585021;
        Wed, 04 Feb 2026 06:49:45 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9feeff2bsm132889666b.42.2026.02.04.06.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:49:44 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 2/2] kmscon: bump version to 9.3.1
Date: Wed,  4 Feb 2026 15:49:42 +0100
Message-ID: <20260204144942.2166411-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204144942.2166411-1-adam.duskett@amarulasolutions.com>
References: <20260204144942.2166411-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 14:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124131

  - Remove upstreamed patch (commit ID: a1fc510a)

  - The kmscon.conf file in the source is renamed to kms.conf.example
    To keep the same behavior as the previous versions, kms.conf.example
    is moved to ${sysconfdir}/kmscon/kmscon.conf before running sed.

  - The render-engine config option has been removed as of commit
    59eef2a154f78101195ad8ff08376e2418e773f0.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2:
  - Add a line about the removed patch
  - Fix the removal of an else statement

 .../kmscon/{kmscon_9.2.1.bb => kmscon_9.3.1.bb}        | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-graphics/kmscon/{kmscon_9.2.1.bb => kmscon_9.3.1.bb} (85%)

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.1.bb
similarity index 85%
rename from meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
rename to meta-oe/recipes-graphics/kmscon/kmscon_9.3.1.bb
index 508f24c58e..4e27ba218a 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.1.bb
@@ -19,17 +19,13 @@ DEPENDS = "\
     udev \
 "
 
-SRC_URI = "\
-    git://github.com/kmscon/kmscon;branch=main;protocol=https \
-    file://0001-kmscon_conf.c-Fix-llvm-compilation-failure.patch \
-"
-SRCREV = "7d46650dbb0826f9b89de42f879be879391c14fd"
+SRC_URI = "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "e44ff728e51c5a38b56392abe9bc3e8306db86cc"
 
 inherit meson pkgconfig systemd
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
-PACKAGECONFIG[backspace_sends_delete] = "-Dbackspace_sends_delete=true, -Dbackspace_sends_delete=false"
 PACKAGECONFIG[font_pango] = "-Dfont_pango=enabled, -Dfont_pango=disabled, pango"
 PACKAGECONFIG[multi_seat] = "-Dmulti_seat=enabled, -Dmulti_seat=disabled, systemd"
 PACKAGECONFIG[opengl] = "-Drenderer_gltex=enabled -Dvideo_drm3d=enabled, -Drenderer_gltex=disabled -Dvideo_drm3d=disabled, libdrm virtual/egl virtual/libgles2 virtual/libgbm"
@@ -61,9 +57,9 @@ do_install:append() {
     fi
 
     if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'true', 'false', d)}; then
+        mv ${D}${sysconfdir}/kmscon/kmscon.conf.example ${D}${sysconfdir}/kmscon/kmscon.conf
         sed -e "s@#drm@drm@g" \
             -e "s@#hwaccel@hwaccel@g" \
-            -e "s@#render-engine=gltex@render-engine=gltex@g" \
             -i ${D}${sysconfdir}/kmscon/kmscon.conf
     fi
 }
-- 
2.52.0


