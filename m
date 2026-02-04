Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19691E9D3F7
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:59:38 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22275.1770217176212858377
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:59:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Het3i82+;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.53, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8715908e58so71542266b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 06:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1770217174; x=1770821974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpNTcma4Nj91baafWv9FTB5wMVEaFE82Yq73cAVeh3E=;
        b=Het3i82+94g0CD+f+eog8HKsoCyuS+HcmhutC+ZOU06YzdhLW+NZJBXiIK0v0R1rBv
         Fy6fflRSTJoDrZ442TM9aXUPdM/JxaYMZ06vZjoi0Ep7PUbABXY4cA7XapZ0zw1xy4Ur
         3BKx8LPVaMHS1osx3jk1bPt/ULRJv917ja5ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770217174; x=1770821974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TpNTcma4Nj91baafWv9FTB5wMVEaFE82Yq73cAVeh3E=;
        b=pbtvw3xq7eJLzbSYEyR7MgHdxOerIYdtlr2SaAQBk4IMtvCjxuM+uFqy609WSXEwYf
         Xg8VXw/ABqQd+Nj6RlPmc32lLctf3Ym1M2FIive4DBh/353tIprL493BHqEmgismYOPd
         OC9n7uq4FyB8LCnvNa5xY5+f2ilCmMR6mWpvfqS9aZtVpmERBdAb22sTdWObXNsJZMJC
         /n7F1S8XyyK3+lEtZUk6BBqUwOJRbOyqy0BGzidCucNDTtydLoMKcat4GGrROnLReyg/
         4AdAecgY4QRkNzgSt44sqvp8VJXn6Rl+hdVz1cTD9bP9bL4fvq05yxV+csmWxEWkTPiH
         uVkg==
X-Gm-Message-State: AOJu0YzqWl2zdYCbrJrPio+137H7qLvhj8SZ27CaJ4mVHMDMkA06QwpO
	+0/3QpnYxsGPnCsn6pIXlaWjP/y3eXy6oYhxlSjc9DmuRbXnFF1rXLMtLVoZcTgdQsE9AAKtQ+m
	QFFkX
X-Gm-Gg: AZuq6aLA8Y6MS6VSMXgXc0j4Xq5YDQN2l5Wbwr6diGJqmFdoSinARS8MLt8Giy06eo7
	3yEZx59zK8y6CiV4C58O5nLxvxp4QLXdFN8NmdpTgcVyMvOwibdOMrs+ORDAGVj6zRMMzmlrE4A
	OOz951WefTejNPPLbzoZtK1aZJcMNgPS1IPFa14PKMDZaFjLLpzvriAzxhpM/tMSKf2wt5M51z9
	Y/b6RVKuE4MOCMw3pvUtpeRA3dWtg3q5pGkeeSc9+q0zhKjKsFIp9hfya5GwKI9InxSLypWyZco
	U/C8iMp1fElHq9dc9UyNZwKdZZhd0cbE8vn+V5A7Qbpw7CHDrRdUVZE1ktAMGzp7XcBQZkZNduj
	i96k6CxOTv0UFax8ZcDpZP8s431GypMVGnxwYg8SY65+F5VqVd75UUBmszxterEOWid7ZcIj8TF
	OhHbSfFu2ZjQY4qcoilX5myr/2uwZHgt9JxlYIgD1prnTLpbX04f3/w53uA4U4NVkp5EBOWjuVI
	i7CfqRO+CfOHj0YGqKttpWiK5ji2VJdKOaNWBHIY78Bzijoa9al
X-Received: by 2002:a17:907:728f:b0:b87:73c9:36b5 with SMTP id a640c23a62f3a-b8e9f6bf9e1mr130656266b.7.1770217174346;
        Wed, 04 Feb 2026 06:59:34 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fef0ef9sm132109866b.40.2026.02.04.06.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:59:34 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v3 2/2] kmscon: bump version to 9.3.1
Date: Wed,  4 Feb 2026 15:59:30 +0100
Message-ID: <20260204145930.2170462-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204145930.2170462-1-adam.duskett@amarulasolutions.com>
References: <20260204145930.2170462-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 14:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124135

  - Remove upstreamed patch (commit ID: a1fc510a)

  - backspace_sends_delete is now a runtime option as
    of commit 0d6d85a8b865cac17529d049ae9a561db782ac59

  - The kmscon.conf file in the source is renamed to kms.conf.example
    To keep the same behavior as the previous versions, kms.conf.example
    is moved to ${sysconfdir}/kmscon/kmscon.conf before running sed.

  - The render-engine config option has been removed as of commit
    59eef2a154f78101195ad8ff08376e2418e773f0.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
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


