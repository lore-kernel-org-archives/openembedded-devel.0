Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C5D1061B34
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 11:26:10 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18188.1774956368432641971
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 04:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Z559lrLD;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.65, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-66bd3fe1728so382331a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 04:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774956367; x=1775561167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kyDUcKGnR7fT64YcY7pa8Dt6EF17PC+9dGk4f1FA14s=;
        b=Z559lrLDBhWnULqWLWcpiEjtcEpe7a7kEQYiG1NnX7gFiwW2Z791/KhFB4ye4voNiF
         lE6m5KEM7G8AiaTfRoyvpCa0t+GsVqoBmlfuyzw7sDPJsVvvM+K0hUmHUEVxbIA5atX1
         sUtYgsm6gw5MVaMLNiQysbxtHuSLSQrvEwE2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956367; x=1775561167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyDUcKGnR7fT64YcY7pa8Dt6EF17PC+9dGk4f1FA14s=;
        b=BJwZOyYBtvIa1+TXT89yRvUruftLrLAOib2rrvrK6E3AowMFZ99Qk+jxwv56RnE7g3
         rk07RsiAg+J83VFKts1xQu4JHQNeeh14GxzTDp4PI731e2/Vs4vK3jt+QQsz/MyoAb6Q
         DBlf/6KH1jCUVw/9LkblgQ5UEN7cK0a7Do4/xN9a99sw2XvyZkVZAvEJQ7aXKgOIXFnU
         1lOo4flo9SW7BLIeO7692cqJ6/vPOubdjviwgsLoYXXl1ancO2q7G8WfGZInlVpHAbb6
         9d8FPsv4lSlp8hAakT8YFO1VxpyuNl3vjdEnJ3G/1dsuSSvV+5xXOJMQir6lhPyMNpT6
         bI/w==
X-Gm-Message-State: AOJu0Yx0Usef0KhDQ/Iy5H+td6ujjBEv1AbAulKAl7Mov0acJCjkkMAR
	off9BSmmxkbW0PC4dNFAui9yfHbBq/Bp3ommPGu41HW69MBhZah2d3GZfMMp3yQslQ8st7UPnG+
	q9S6olSSUew==
X-Gm-Gg: ATEYQzwgMz1YhPhIEmuzbPMfZ8AEMCydbriulm1WTX7FCrwAB7L3ccRAvR42wU1gmCT
	N+VYHz1N70MjlK9iehprQSpVTNuulUGvM/2/efyys3T41RZjoCGRuNVlQKHWjPOSdfqXqIhqET3
	AUAZn0U0/bC2hRoRDPU8i2TwSBAkvhMK4GvEVb2IjVf7/cTl8as9ZuwJrVpGJQG7CtcAvXPQEKz
	Wx9lr8xlBF3/kOJ7YfFLCGwoxipXLAn74kGwAsAhgkc5K3OXSyKXkcnDf3fK9WoZkRZzVLB+lIX
	MEmd2NVMOTyd6Gpdnel4JDAesegfSsb1vJoGJDdzFHWUs7WWYMj8Fo/bNbPaNu1Znhu4PQcesTu
	bBL8A9aGAoygVk6QnvgyMxMHxogfDJmxlO9E5p6voNoY5ID6Bik6dWSNWgN/al1FBVf+8wVAhf6
	mGKad5qml45hIi4AY23mD8jSR1KppCAh0cNufo8b3ool3jcg2iPVJOv/sCi7vxnlr2b+W0S2oFA
	C5XRWGRVaJC04k50vkq7w==
X-Received: by 2002:a05:6402:354f:b0:66b:eb42:79fa with SMTP id 4fb4d7f45d1cf-66beb427adfmr1816262a12.4.1774956366604;
        Tue, 31 Mar 2026 04:26:06 -0700 (PDT)
Received: from adam.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl. [212.57.59.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72963f48sm3533868a12.7.2026.03.31.04.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:26:06 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/1] kmscon: bump version to 9.3.3
Date: Tue, 31 Mar 2026 13:26:03 +0200
Message-ID: <20260331112603.2345146-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 11:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125886

Changes:
  - zlib is now a mandatory dependency
  - freetype support added
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../kmscon/{kmscon_9.3.2.bb => kmscon_9.3.3.bb}               | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/kmscon/{kmscon_9.3.2.bb => kmscon_9.3.3.bb} (93%)

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.3.2.bb b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.3.bb
similarity index 93%
rename from meta-oe/recipes-graphics/kmscon/kmscon_9.3.2.bb
rename to meta-oe/recipes-graphics/kmscon/kmscon_9.3.3.bb
index 2db5162857..46550bb6d1 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_9.3.2.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.3.bb
@@ -17,15 +17,17 @@ DEPENDS = "\
     libtsm \
     libxkbcommon \
     udev \
+    zlib \
 "
 
 SRC_URI = "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "9ce1dc0dc639e54e243a21d93e13f502a746f0a8"
+SRCREV = "03e50c7db0489daaa41b5f62946fd6aaeab63a6e"
 
 inherit meson pkgconfig systemd
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
+PACKAGECONFIG[font_freetype] = "-Dfont_freetype=enabled, -Dfont_freetype=disabled, fontconfig freetype"
 PACKAGECONFIG[font_pango] = "-Dfont_pango=enabled, -Dfont_pango=disabled, pango"
 PACKAGECONFIG[multi_seat] = "-Dmulti_seat=enabled, -Dmulti_seat=disabled, systemd"
 PACKAGECONFIG[opengl] = "-Drenderer_gltex=enabled -Dvideo_drm3d=enabled, -Drenderer_gltex=disabled -Dvideo_drm3d=disabled, libdrm virtual/egl virtual/libgles2 virtual/libgbm"
-- 
2.53.0


