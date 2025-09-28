Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF80CAC5BB
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 16:52:08 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.web10.35651.1759078320361901075
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Sep 2025 09:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nUnm7EP6;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-635401a8f5aso2437213d50.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 09:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759078319; x=1759683119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qmxa2PYNEIwZkqoOeodssHUgGXV3R75ZZOJ13Pm4XpQ=;
        b=nUnm7EP64Tgodc9tjQry1WYDakoBC6/lw6f/zO3U/x2Gytw6ZFUKFfB98JIqgSXs+1
         hmLQDH3DrLBdbK37JJcXgFmhCzsAwS57Jqkxplpx9YCtSONMx1mr9UM7RBEnUGV57eeJ
         9XYmckVcM6Osxo+OQPoVdCiinnKKil5P8FH4ciji9gYQsdlOezJbtMDdg0WTAtF8nEbQ
         gVLKpPGXOWR2tt/SVsTya2Apq7k7wnKz7Kazwz9rpX4j2ILK8lr6HnNeP0o0UQ1/JR4L
         AnLPzlXO/Fm5AQtexcxBVFcxwrYt/+x+luRmecQQ+Wt+MO8TwndR/rCXEuMqIxwgdSxc
         zPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759078319; x=1759683119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmxa2PYNEIwZkqoOeodssHUgGXV3R75ZZOJ13Pm4XpQ=;
        b=DwS90Dp3iTGWfWk4iAGNdqZCFEio9s714FiYMXwKcAM0iXylbZm8GyS/rMzfOGgeDf
         dHXgAlKJD3iaZ7otUK3fqe/lZz0B8aJ9Wnkd6c1MU3NAn/0W5lbyNyJ+XS4+e1AQ/lmq
         qkmu2CA6WsOBGr1D5FnLplS0Ifm+xBBs2ROy7z5uAwydb/CbJI2dnPmmA/9UY0Hoku/F
         prUlpZ5kV4HZDQc7wSg/HqW/ZDoAETlqCe4zI1VyOdOZkAcMeWVvdK+1wj/632ja4A9W
         TPYxJfOUCqO6aH6Lo4dfSOJojjrvUO46ytVxNJPielBGbWAXfVGCke+9mfP061PzpH+s
         mg8Q==
X-Gm-Message-State: AOJu0YxXK9LQxw/F9Fc+hY6oJqyFfbTi333ysjfByx9ZozEjp51soEy5
	VstvarRq7abHT8fcE7i8q0PjWDxhM1ZV43Oehhk6hJl4uPZpi1LJDVNQS5kngsgO
X-Gm-Gg: ASbGncsBTWZ0OBSIf1dp7tVgy6LAZnzFb9TQtYtSLPdgwSj6Dn+eza51sPlS6QBYUzo
	XJDDEw4g4SNjLowJ5RLbd7JciCOMwpeCw8buPUQrUaj9/a5jTw9sIAx4iKrgvjUo7ILOSyvqHPC
	HwR8uxDCFd0fdqySVmi3xl3aQUhVBdh46ku4obZFv+jdEZgErly3Wa5Dy7yyFEGy3p0ZiHdmzqg
	+sOOsRV6TWEOSu0AomtfioaQH0gkzc10cfY4jqdt+izqkTQh2zA0SiDF9W6wZd6DQB2mb5uq45S
	klQF0DtHOS85fk5TgYiJ5/VHTaWZd++GlCiOCRwVZriZUKSf1snlULF5/eQ87ayhF9I/aOGY6rf
	Fse52o8tplZRrdJn9KfQg28410TI7
X-Google-Smtp-Source: AGHT+IEKiELeP7/ygKb9YSOH1oTliZ0a9wb03EUjViMZXyZRbDcGMb7N7UjsefN4XWr8VbimcimCOQ==
X-Received: by 2002:a53:d885:0:b0:635:4ecc:fc24 with SMTP id 956f58d0204a3-6361a83d8demr14608970d50.44.1759078318824;
        Sun, 28 Sep 2025 09:51:58 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-eb51f3dc320sm957585276.9.2025.09.28.09.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 09:51:58 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] webkitgtk3: upgrade 2.48.3 -> 2.48.7
Date: Sun, 28 Sep 2025 12:51:43 -0400
Message-ID: <20250928165143.16664-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 16:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119999

WebKitGTK 2.48.7 release:

    Fix a number of GStreamer memory leaks.
    Fix several crashes and rendering issues.

WebKitGTK 2.48.6 release:

    Fix emojis incorrectly rendered in their text variant.
    Add support for font collection / fragment identifiers.
    Fix web process deadlock on exit.
    Fix stuttering when playing WebP animations.
    Fix CSS animations with cubic-bezier timing function.
    Do not start the MemoryPressureMonitor if it’s disabled.
    Fix several crashes and rendering issues.

WebKitGTK 2.48.5 release:

    Fix several crashes.

WebKitGTK 2.48.4 release:

    Improve emoji font selection with USE_SKIA=ON.
    Improve playback of multimedia streams from blob URLs.
    Fix the build with USE_SKIA_OPENTYPE_SVG=ON and USE_SYSPROF_CAPTURE=ON.
    Fix the build on LoongArch with USE_SKIA=ON.
    Fix crash when using a WebKitWebView widget in an offscreen window.
    Fix several crashes and rendering issues.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../webkitgtk/{webkitgtk3_2.48.3.bb => webkitgtk3_2.48.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.48.3.bb => webkitgtk3_2.48.7.bb} (98%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
similarity index 98%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
index b848008910..6c105e7bb1 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://fix-ftbfs-riscv64.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            "
-SRC_URI[sha256sum] = "d4dc5970f0fc6a529ff7fd67bcbfab2bbb5e91be789b2e9279640b3217a782c3"
+SRC_URI[sha256sum] = "2c62aebb608e09f930a539f3623a5cc8023b5068029f42a208f45f9124da6e30"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.43.0


