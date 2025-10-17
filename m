Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D93ACCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:26:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.2881.1760732758896447428
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RljUU2+3;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-471076f819bso19391155e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 13:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760732757; x=1761337557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ak9NzhP1kJjrE86we6rOvEBf7tQQ4IuXq6Ri2/Bs8oI=;
        b=RljUU2+3s7fT7KfGo2QZGULTiY+xMon1k3+/9jVN2PkKRL7D8lxVfb9q5PzWQvMoFN
         lpjFHBkB4RBLkwMl+kBVG7TEckXHn7taw01x7JZQ12RhQSOFvETJ1I4R9O4fv0OO5mE/
         a4egLghyN5o4yfzOdOSFVqA4yXV0F9oz2UQ0nF9OED5u2J3c0je8HtFNTI8zsPzxrDOk
         1B/sNIcGN9A5JOenHOSjFTx6/jgRJOnO3f7eOnhaBdx+rj4Vm59j0KimxuDYYEI0RLlR
         2iqatPFV3uAjIGfLCBTh6AfA8DB4GGdAyAiJpsnQkNrT3rfov+CazEnKygHYEYI+nFNU
         Ob0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760732757; x=1761337557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ak9NzhP1kJjrE86we6rOvEBf7tQQ4IuXq6Ri2/Bs8oI=;
        b=ITWbVMcvxfRi/uqnUWgxS0RVjylSt/4os+JEvoXBpNohvmp/WVAaNmWQyKx2R41voT
         pGz7Llnu2A9Ba8l8FYeclb8DekupoJOesCR4yF5CHPblEWr4/f4vTC5B8ho1IBLb6mXv
         +Kdv9EKJuQBcIOqbdRQJte2EbaRXb7GKfoXtq/ubRkN8+P3k8Ch0R4lzU97AYA5CC+Z/
         9WpVkw6wPmdqMF+THkNFAmR1kBydW4EfyFjFceBRlqZEIcBXu5lMIMFipE5NPBbM+vG2
         hgMepxsQQqimskqKUH/Nd1AYspNKrjC0gaIueD8Sq7peExFWz5SWZ7u3cQRqPIiNsM05
         zTag==
X-Gm-Message-State: AOJu0Yyw1fVlBjsJNuaeW8IZZEko6d8LM5WkQUwmQ1M3P7QWpWGEaYij
	4H84g8BGOxRv2AxwaO7Pcuzb0sbYcf5M20guMRLkoHfACAy/y36T72ZJlGZ5Ng==
X-Gm-Gg: ASbGncvpNuOoH+2BcbxG2JHAYBzn6Zdkesvvsk67vEhb3NCsN9Uq7+MttVU/hCs7XEc
	muC3GmCYlwhg6tiuFRrzGSLLWydNPQVlsGZOkNilLIYa4el4er6dxSKd5T6oRJP3IsgTXfxTdTL
	3Psqv2ADDAF2OJ+1OPe/9fkw7XBBt16ONJv2PFVWkbBZqFgQH6C1GxX3GpS24YMr6uvXoHwP2bF
	hQAlwgVb6Ron86tyo+DwvfWeyCW86UezMKWIw11cvKjKWyoxOfcHbBMV4cRrdBQOgdpPb6wGnWb
	V92AwCid2W9h7iW50vmI98asRcJvkorah08HZaP+HzePrknUF/BTbhk7WNjuWzuxXvbVSU0q9Gp
	ftysyKxzL8PMiOJ/DA1nftfGM5uh5FGk2f+cWsTt06wUvIs3HHWUk8OtsBNkq0AQrS5IGAwxVCg
	==
X-Google-Smtp-Source: AGHT+IG8HB+zCUxDJ75T9XKcVFovUxho3fh9U23CCfq8msm/H7IwTEgYnRlPSqQ1m9fy1ax2x4sRgA==
X-Received: by 2002:a05:600d:416b:b0:46e:45f7:34f3 with SMTP id 5b1f17b1804b1-47117874b06mr39793805e9.8.1760732757020;
        Fri, 17 Oct 2025 13:25:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce586sm1152906f8f.49.2025.10.17.13.25.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:25:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] libmanette: upgrade 0.2.9 -> 0.2.13
Date: Fri, 17 Oct 2025 22:25:54 +0200
Message-ID: <20251017202555.3027445-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 20:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120776

Changelog:
0.2.13:
- Update controller mappings

0.2.12:
- Add a deadzone for Steam Deck analog sticks
- Fix build with older gobject-introspection

0.2.11:
- Port documentation to gi-docgen
- Add support for Steam Deck gamepad
  - Add ManetteDeviceType and manette_device_get_device_type()
  - Add manette_device_supports_mapping()
- Deprecate LIBMANETTE_* version check symbols, add MANETTE_* instead
- Add runtime version check functions
- Make hat to buttons mapping always emit button release
  (fixes d-pad getting stuck when quickly flipping right->left etc)
- Fix paddle keycodes
- Fix DualSense motion sensor and touchpad being recognized as gamepads
- Fix half-range axis mappings
- Build
  - Depend on hidapi-hidraw
  - Specify --doc-format for GIR data
  - Fix build warnings

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libmanette/{libmanette_0.2.9.bb => libmanette_0.2.13.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libmanette/{libmanette_0.2.9.bb => libmanette_0.2.13.bb} (82%)

diff --git a/meta-oe/recipes-support/libmanette/libmanette_0.2.9.bb b/meta-oe/recipes-support/libmanette/libmanette_0.2.13.bb
similarity index 82%
rename from meta-oe/recipes-support/libmanette/libmanette_0.2.9.bb
rename to meta-oe/recipes-support/libmanette/libmanette_0.2.13.bb
index 2e59401892..2825b8af98 100644
--- a/meta-oe/recipes-support/libmanette/libmanette_0.2.9.bb
+++ b/meta-oe/recipes-support/libmanette/libmanette_0.2.13.bb
@@ -5,10 +5,10 @@ HOMEPAGE = "https://gnome.pages.gitlab.gnome.org/libmanette/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "libevdev libgudev"
+DEPENDS = "libevdev libgudev hidapi"
 
 SRC_URI = "https://download.gnome.org/sources/libmanette/0.2/libmanette-${PV}.tar.xz"
-SRC_URI[sha256sum] = "29366be5452f60a74c65fc64ffe2d74eddd4e6e6824c2cefa567a43bd92b688f"
+SRC_URI[sha256sum] = "287cc2fde0de092919366af757d85e7b3a0248eb1b395344726e97955a77d8ae"
 
 inherit meson pkgconfig gobject-introspection ptest vala
 

