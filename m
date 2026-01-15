Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0327D4116B
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:40:22 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32605.1768473310115131052
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 02:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=BNSDMvc8;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.52, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b7b08fc0eso53386a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 02:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768473308; x=1769078108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9yEQKrbSWpKB965eOQ8xk8plXO3qZl8PpC5MCGAXEg=;
        b=BNSDMvc83b4A4c29i8RPg70V3ys8RmOSw5YkKW7lklJpKjrROPc49GdIVJN1iiySyb
         BqqukPQmhW7Nk5ww2GsxD1kwarcq7dtKxkhyYQpKfEhgQmFCpQ6o4lhsfiNDSnuSGsen
         jtmcoYjNZ2BBB2r9eymU6HN67e1EXBXwc7Gs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768473308; x=1769078108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L9yEQKrbSWpKB965eOQ8xk8plXO3qZl8PpC5MCGAXEg=;
        b=F8dRItBlUNm0y8YR6DLgaF+FXn0vsKBzU20hSOqVUXY6sjagdr2OHcYUzOp2Hq+IrK
         lx7HxfvoUSDPJKZ8dmm/CTNrARvJFd0eLQcjgG8rFKNDOCzHxyzm3wol7zvQ68Wxi7fZ
         iWGhV8FBnQAa3dVw99eoKrssYy/0oBYnuii+pVgD5b87gsbNB+oScUmGoesfxM3LL2P3
         X2+XxqAkJULdXy1mADBBMAdeTJr6pY+lqDTscQdvp6gztBHLsQnPlUtfrRsOxN5EQKMH
         cfw/wIwDo1JLjbvPpMRWd2lAGCm68wwo2n+E9QG61nZD5lEBHVu0HIkxZj+nknsZFNbq
         vZyg==
X-Gm-Message-State: AOJu0Yyj5/aKQJ041s0gxdSia+0Zm5LVo37vIUc6a45XXLg48CplD4+I
	3OeC5mN4M/vGQ+Ozb8UWJTpWCzEHvzAfMdJ+aBT5zenENbVMVI9d5QsvB14roXijzjjT8J+w3mY
	bNlos
X-Gm-Gg: AY/fxX5pDTgdOI3cio/FjLsWu0zTN+exiAgTx8Qe6bjqO9+wxIqqu/AGMJBnQvIsNL+
	CBkKMd+RdEWsCXKhtaCI3MVC1FtQ3HtDhZPpinEs1GPvrTb7URkbGLbug2/XegGNCHTC3aIiSia
	5NHf5qGiEfm1hQvynCOc0NXQ2sT//5n/WKmFzktxTuSjGgexKD/2FIqW3/YfB/RFLosAFMCMU5v
	bYoxuIakDVQehLcz/FbEtSqzApaGkRTUaG1xJAtKjRW13IhADSsc4NxpU+axMXKhxsX39CCQi9C
	aEuJDsGYgIEW3J3n6niCOLS4fd8oXw6VgKf9rGSAQF6++snniWxsbWcZk5a0X6ZiSYHb3diSlsQ
	y37iDm6WHdOQbWg3ZoFrqfbC55nAgO6USj7ny1zjkX12C4u8YNldOVoht98ntpOsZc16p37NHKe
	d0kCme5jGSDM9VKvPcZ04L6M5YZf9a3gTRFmhr/EkkvZirvJ9MTV+a1iiVPQXjxt8DnKDaPDFzo
	jOZM/3Y2yaKaEFA5Xt9DHdjttL8qyy4fZcTrMPmi8Y5nAwKKwQLsptlwA==
X-Received: by 2002:a05:6402:1441:b0:640:abd5:8646 with SMTP id 4fb4d7f45d1cf-653ec459b14mr2868571a12.4.1768473308442;
        Thu, 15 Jan 2026 02:35:08 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8773b689a4sm274353866b.62.2026.01.15.02.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:35:07 -0800 (PST)
From: "Adam Duskett" <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 2/2] kmscon: Add recipe
Date: Thu, 15 Jan 2026 11:35:03 +0100
Message-ID: <20260115103503.200126-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115103503.200126-1-adam.duskett@amarulasolutions.com>
References: <20260115103503.200126-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 10:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123502

Provide sane defaults that do not have dependencies, such as
a dummy and terminal session support and basic fbdev support.

kmsconvt@.service must be added separatly or else
do_rootfs fails with the following error:

```
do_rootfs: Postinstall scriptlets of ['kmscon'] have failed. If the intention
is to defer them to first boot, then please place them into
pkg_postinst_ontarget:${PN} (). Deferring to first boot via 'exit 1' is no
longer supported.
```

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: add tag=v${PV} to the SRC_URI

 .../recipes-graphics/kmscon/kmscon_9.2.1.bb   | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb b/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
new file mode 100644
index 0000000000..6c4060763b
--- /dev/null
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
@@ -0,0 +1,63 @@
+SUMMARY = "Simple terminal emulator based on linux kernel mode setting (KMS)."
+DESCRIPTION = "\
+    Kmscon is a simple terminal emulator based on linux kernel mode setting \
+    (KMS). It is an attempt to replace the in-kernel VT implementation with \
+    a userspace console. \
+"
+HOMEPAGE = "https://github.com/kmscon/kmscon"
+BUGTRACKER = "https://github.com/kmscon/kmscon/issues"
+CVE_PRODUCT = "kmscon"
+
+SECTION = "graphics"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6d4602d249f8a3401040238e98367d9e"
+
+DEPENDS = "\
+    libtsm \
+    libxkbcommon \
+    udev \
+"
+
+SRC_URI = "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "7d46650dbb0826f9b89de42f879be879391c14fd"
+
+inherit meson pkgconfig systemd
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
+
+PACKAGECONFIG[backspace_sends_delete] = "-Dbackspace_sends_delete=true, -Dbackspace_sends_delete=false"
+PACKAGECONFIG[font_pango] = "-Dfont_pango=enabled, -Dfont_pango=disabled, pango"
+PACKAGECONFIG[multi_seat] = "-Dmulti_seat=enabled, -Dmulti_seat=disabled, systemd"
+PACKAGECONFIG[opengl] = "-Drenderer_gltex=enabled -Dvideo_drm3d=enabled, -Drenderer_gltex=disabled -Dvideo_drm3d=disabled, libdrm virtual/egl virtual/libgles2 virtual/libgbm"
+PACKAGECONFIG[video_drm2d] = "-Dvideo_drm2d=enabled, -Dvideo_drm2d=disabled, libdrm"
+
+EXTRA_OEMESON = "\
+    -Delogind=disabled \
+    -Dextra_debug=false \
+    -Dfont_unifont=enabled \
+    -Dsession_dummy=enabled \
+    -Dsession_terminal=enabled \
+    -Dtests=false \
+    -Dvideo_fbdev=enabled \
+"
+
+SYSTEMD_SERVICE:${PN} = "kmscon.service"
+FILES:${PN} += "${systemd_system_unitdir}/kmsconvt@.service"
+
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/systemd/system
+        ln -sf ${systemd_system_unitdir}/kmsconvt@.service \
+            ${D}${sysconfdir}/systemd/system/autovt@.service
+    fi
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'true', 'false', d)}; then
+        sed -e "s@#drm@drm@g" \
+            -e "s@#hwaccel@hwaccel@g" \
+            -e "s@#render-engine=gltex@render-engine=gltex@g" \
+            -i ${D}${sysconfdir}/kmscon/kmscon.conf
+    fi
+}
+
+RDEPENDS:${PN} = "xkeyboard-config"
-- 
2.52.0


