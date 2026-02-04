Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D427BE9D3E7
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:28:47 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21545.1770215321141980053
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:28:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=GB85OdfG;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.47, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-658b29889d6so725009a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 06:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1770215319; x=1770820119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVfT6xXA5aAozbBxKZZ5P0jt9x+bnigN0qbTo+v7RHE=;
        b=GB85OdfGglKQWN5t7l6WaWpOuu8lM0ixGQLGDjxdh9KX41gjTbeCsgL1AUa3pjzt1g
         UIJyKDN6FjTXL7t6RgrY7//JtVrWy30fv7BoWpbVfSAidfenNubpvtSqFaRCjH2wG9aN
         Oht4x8cYdiMTK64wB3rZtdZdYVxV0SHAb7+ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215319; x=1770820119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KVfT6xXA5aAozbBxKZZ5P0jt9x+bnigN0qbTo+v7RHE=;
        b=gEWddFpBPlvH7FJDnGi5z3pUL4s2gJPv9LXfHD0yducADK0lS9qM0pg0ua0Wy4suce
         2W/sHWWXeAuib5ibFJ1zSYBmGyuW5NOUFcQ8t5Ge92YePrdxxRQad60wW/rvpbOthgjY
         V/JuIcG16QeIo2mbfloOrTGuoVar/uE+s2ueBdfHQq8I06ZR4jra5SZ8OTbdlyWZRchU
         epeXSGmg0mJGDhyS+42bshfpLWkXlvNjqlfGzvNAUDsMHQ3EFMicPw8J1/EsDIWgN82t
         lPP5ESoUtxxkzVG8sftyJ/RroAyo1KIJKF5ArIhRIhGrCCGsFxRR239Hal8NL1cc69pu
         VlVg==
X-Gm-Message-State: AOJu0YzJwtV/fJd1XDaLyvY4IWQzHeJMhDglNuLQCjkwYqAJ4FXiclk+
	KIIt3C1YqsMWoF4nK7iTGeo5pg3tczfy1LlIvcy3uGo0WRrTiSvoufGCguLLJoIA+VsWwRVDLR6
	8pK9T
X-Gm-Gg: AZuq6aKFayxmvawqUtjfnP+jGiPjhQWRc9n9eCdgxYbkQTiXw+vhLA2EmXw9Ods3ojE
	ji4kDNPX6n2SgZFgObyU73ECHLrmNXFi4fe882UQGRr6R/XwFtbP4RJgIBIXou8Z5cPsse7eJav
	pwoRQCc/0oorTcziRAnZhf7FRC7nCU3j9Zqo/RYykUEI2fXOOCSGk0KtV+pNkm3yhVG2oYErcwT
	SEjQop21CaY4GKCSzsmNanFuvuUBTYg/PSgX0/iXn5fse0VRZueHsf+BrnnEzRyDEOjhG5Ly2qG
	pWJL7qz6JhbAyoO9pPVDp6Q1m4bbcnpTyKgJVfDkr3p5KKW+Ru1aF7297/i7+uYatloqeWbo1Ji
	m8Ow/CjIrN2jfn6Mvq8iz4vf8Vu0RoUf7X248pujwmRnoZy7xLr3l2UnBaknKYiQiUYgktRuDtZ
	4Lqbh1ScwLbsJQIWz5uoU1tumYXdSeHxMDphp4d7ByGUjuZq/kuNeAKA5aNlbWu7OsN49+qYb/A
	L7+Cs/lWplhDgFpkCtH2V7lnN+oVIO2PSbdDIXCCESGkh1BSnn1
X-Received: by 2002:a05:6402:13ce:b0:659:3f9d:757b with SMTP id 4fb4d7f45d1cf-659499b8e05mr1192323a12.2.1770215319383;
        Wed, 04 Feb 2026 06:28:39 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6594a23525fsm1232598a12.35.2026.02.04.06.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:28:38 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 2/2] kmscon: bump version to 9.3.1
Date: Wed,  4 Feb 2026 15:28:35 +0100
Message-ID: <20260204142835.2157554-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204142835.2157554-1-adam.duskett@amarulasolutions.com>
References: <20260204142835.2157554-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 14:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124128

  - The kmscon.conf file in the source is renamed to kms.conf.example
    To keep the same behavior as the previous versions, kms.conf.example
    is moved to ${sysconfdir}/kmscon/kmscon.conf before running sed.

  - The render-engine config option has been removed as of commit
    59eef2a154f78101195ad8ff08376e2418e773f0.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../kmscon/{kmscon_9.2.1.bb => kmscon_9.3.1.bb}   | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-graphics/kmscon/{kmscon_9.2.1.bb => kmscon_9.3.1.bb} (75%)

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.1.bb
similarity index 75%
rename from meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
rename to meta-oe/recipes-graphics/kmscon/kmscon_9.3.1.bb
index 508f24c58e..ea579d42b4 100644
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
@@ -53,17 +49,12 @@ do_install:append() {
         install -d ${D}${sysconfdir}/systemd/system
         ln -sf ${systemd_system_unitdir}/kmsconvt@.service \
             ${D}${sysconfdir}/systemd/system/autovt@.service
-    else
-        # kmscon always installs service files.
-        # If systemd and usrmerge are not in DISTRO_FEATURES, packaging errors
-        # occur because service files are installed to /usr/lib/systemd/system/kmscon.service.
-        rm -rf ${D}${libdir}/systemd
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


