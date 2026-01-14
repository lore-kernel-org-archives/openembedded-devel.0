Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263E4D39006
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 18:16:47 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15803.1768411558364876477
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 09:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=hg6hxC7b;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.41, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b845e8326acso1241666b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 09:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768411557; x=1769016357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWZL1tbNs2PGhS8s4/Rbxs7hscfFEejGVPtWuGzGsbY=;
        b=hg6hxC7bIWyQmS0JrCzAhxQoi/gwLWcaEloF2ruT6/QFAmMbBJfproGaQVWE+SJzir
         Vj/H+8mbSOwux+eD3xTcuYT+Vzz7TW+RuMeyjwMVQxszAvWyQjpX6/a/7WicsnqL8NBa
         etJmepzbukCaKvdSqKOLfbaurREx8VCiEqckI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768411557; x=1769016357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dWZL1tbNs2PGhS8s4/Rbxs7hscfFEejGVPtWuGzGsbY=;
        b=gqBIY1axG+qoVMH8Eg4j/pQsmsK0a3WwjEwmeq+S+G7QrtowOADSdR/QdFe3v6yWlz
         qNEaM4vouEGHGD4IvFneJ1iOauFnLNqL4/TInpjHpkLXj0RkcG077NSAa1cIbsuRgKcC
         40kYXBy0/QIwe3/mllljKDiIGv2q5l/rLJW9FobDCpk8sBVi5erXhLcrZjcy0fkQB5Yn
         3Z3iQ+bgkKTyAbQ0YAesn4WVUo5o5T2MIPnoO7EtJGA77cRPmECrq7bqxpF423MMe/TJ
         RR+Ts60SIK60lagydFq+1PEA2uf93JCF1wONrLAG4r3xNdUnok1PVrIe0QePzNSN1Kyq
         9rkQ==
X-Gm-Message-State: AOJu0YwZZJiT1Iq/nNMzCtrmr67y4IFwYuzgBAxrobfTKKj6/5BaqBIS
	Pb3mF70fJVnSl3WQRSeuqukpgA4Cq/kxWuBoCz92iDeWP3Ces9sIm8wOwMnRWRz/wzvrSi8DIYY
	4nTDX
X-Gm-Gg: AY/fxX7hDPc4beFp9oymOERTdo/ardIXAK1SeW30neUEkgyP41ReWE1hxbkUqwEab4E
	rayad/yvSctp9XesLGt5l+NxDuC+/9y2AvQmuN+tAgtrNCs5ZaQfXL5UMr37uutfhgy41wyZjGb
	ErH3GIy1HK0eR9LpxYIKo97kZeo26eZ52NLo9nto2B9xIqitPU1p8JZ6RSBuq2RAZDe65xUzgsZ
	Q4kDmjprLBx4/HRT6NMZ/kEeinaLX/V2vyBMt4v+QL2z+SZe3TXL+JhakEj1Bn2ksfJWdr+a6qK
	zfxwvHv/rA9PJ9NrwdLxrcuXcHJdezYmehnvAdMjtCn0HeteIqxqAsd31o30K4Ly6V1ks+8I1Wi
	EcKoHcE90KJ+pvmTGEGkw1fjtdm6kY3udo0n+eG7gYgz41KvgmXVsHOxFW15XcffqF98w5YIAlx
	Nwbc/1jDeJLi+JI2I8E+DG1au1Ue9Ujcc2BhgNY3/6HXB6ejxvgGQvlOIvLYYYst79uz4+dEjiR
	5Q598VLyfwWYAu6Z2y9g6dAfbJOeEixew6maPP35a99Tvh61Nfd
X-Received: by 2002:a17:907:d23:b0:b86:feb2:543 with SMTP id a640c23a62f3a-b87615b3eacmr140291766b.8.1768411556660;
        Wed, 14 Jan 2026 09:25:56 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871f50cdc4sm860854266b.20.2026.01.14.09.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:25:55 -0800 (PST)
From: "Adam Duskett" <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 2/2] [meta-oe] kmscon: Add recipe
Date: Wed, 14 Jan 2026 18:25:53 +0100
Message-ID: <20260114172553.1241309-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114172553.1241309-1-adam.duskett@amarulasolutions.com>
References: <20260114172553.1241309-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 18:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123483

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
 .../recipes-graphics/kmscon/kmscon_9.2.1.bb   | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb b/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
new file mode 100644
index 0000000000..9f19bd18e6
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
+SRC_URI = "git://github.com/kmscon/kmscon;branch=main;protocol=https"
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


