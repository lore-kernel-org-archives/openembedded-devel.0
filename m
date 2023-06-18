Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1CEEB64D7
	for <webhook@archiver.kernel.org>; Sun, 18 Jun 2023 17:47:31 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.10198.1687110442848225317
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 10:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=b0sW0AGY;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso1029013a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jun 2023 10:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687110442; x=1689702442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CJrQPKLJKuAOrkPhG9GQOABoGdU28CqhvKsocLoECOs=;
        b=b0sW0AGYV8Uz1SbQbw2iuW0klTbYpkxWg6qSuSkMXDVOqQz3dBMjJoth3Sq/d/FD2v
         uQ+cZFQk/yCmuIt7aTZ0znlZDq+uFOcwrHdlCs1grot8IDDJCBkkhgF/lO+60JZpn63a
         ey8ymeDBNNa/aXqkihZJoKqx1N/2rOQOqtzn6UaYTlVXM/NxaXX+vJF5v6G/C9sCM+Sq
         qfn04mPVYS+OcTB5QkufFNV5zBtnNeuaUGfgQsQhE6BKZyAufEql6Q7EAsyvZwz/iMuR
         yeNEwPy+1o7gIW3dLRyKxijPrefYn0eJX2SWlsysxr50dZKRctOJcxj6InUdV7F+bCZx
         q0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687110442; x=1689702442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJrQPKLJKuAOrkPhG9GQOABoGdU28CqhvKsocLoECOs=;
        b=FuCUTgjiQl6HlRtqUExba3dQG16Glb1mAnbd87AuEb6t1qngsFQ7rqU8x55Gp4ljk1
         uLEjmQkFJkomuKiK5fZzXQM21MFmKS6xAy4StgLytb5uUWucTWIX3wkCGsQJvqDcpkx2
         uYqwfRw1RltLZH60Co2F/sAUK4sCEbx/oWGNJEdZu9YitCtRpmIrgemUPSO1PqjztyRl
         thBD3WTGxUUlx3j0HlzFBioa/K4Yg/y1pfVYrwoHf0cXNGzqLRabrkQgPa2V1W7O49kx
         fJIOReVZahNehLowXUZ5qDVcW0RPGfi6eKcZg2SUrC2Qa9G1C9AKNcBeXDXOGuT6bKUy
         KoYQ==
X-Gm-Message-State: AC+VfDxBDRNtjuPpTJcXm5f5bUQ6XmPxoYOALDOSlUlwX61HJ9/w5tYL
	ytwplhoF6FtaAP5Mp9DiBTU7isIGG68=
X-Google-Smtp-Source: ACHHUZ7H3ruZRD7xz6qSd9ZPNKwAlQ7ZRpjUmlAvB2LOt2h4iT+dABUC3kfTC3tqy1lPcT88f2d+TA==
X-Received: by 2002:a05:6a20:3d0a:b0:105:53:991 with SMTP id y10-20020a056a203d0a00b0010500530991mr8826523pzi.0.1687110441831;
        Sun, 18 Jun 2023 10:47:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id h21-20020a631215000000b0052858b41008sm17345692pgl.87.2023.06.18.10.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 10:47:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] xdg-desktop-portal-wlr: Fix build with older mesa
Date: Sun, 18 Jun 2023 10:47:19 -0700
Message-ID: <20230618174719.2896278-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Jun 2023 17:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103354

Some ports e.g. visionfive2 does not yet supported 21.1+ mesa
where gbm_bo_create_with_modifiers2 API is available, therefore
use gbm_bo_create_with_modifiers API for compatibility

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...screencast-Fix-build-with-older-mesa.patch | 53 +++++++++++++++++++
 .../xdg-desktop-portal-wlr_0.7.0.bb           |  3 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch

diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch
new file mode 100644
index 0000000000..ff4fcc292a
--- /dev/null
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch
@@ -0,0 +1,53 @@
+From ef60a76e2a21b7649632dcf71d125039604a56b5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 18 Jun 2023 10:42:19 -0700
+Subject: [PATCH] screencast: Fix build with older mesa
+
+gbm_bo_create_with_modifiers2() is quite new and there are still distros
+that ship 21.2 and older. e.g. powerVR mesa implementation
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/screencast/pipewire_screencast.c | 8 ++++++--
+ src/screencast/screencast_common.c   | 4 ++--
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/src/screencast/pipewire_screencast.c b/src/screencast/pipewire_screencast.c
+index 0611fd5..7d66810 100644
+--- a/src/screencast/pipewire_screencast.c
++++ b/src/screencast/pipewire_screencast.c
+@@ -234,9 +234,13 @@ static void pwr_handle_stream_param_changed(void *data, uint32_t id,
+ 			uint32_t n_params;
+ 			struct spa_pod_builder *builder[2] = {&b[0].b, &b[1].b};
+ 
+-			struct gbm_bo *bo = gbm_bo_create_with_modifiers2(cast->ctx->gbm,
++			struct gbm_bo *bo = gbm_bo_create_with_modifiers(cast->ctx->gbm,
+ 				cast->screencopy_frame_info[cast->buffer_type].width, cast->screencopy_frame_info[cast->buffer_type].height,
+-				cast->screencopy_frame_info[cast->buffer_type].format, modifiers, n_modifiers, flags);
++				cast->screencopy_frame_info[cast->buffer_type].format, modifiers, n_modifiers);
++			if(!bo)
++				bo = gbm_bo_create(cast->ctx->gbm,
++				cast->screencopy_frame_info[cast->buffer_type].width, cast->screencopy_frame_info[cast->buffer_type].height,
++				cast->screencopy_frame_info[cast->buffer_type].format, GBM_BO_USE_RENDERING);
+ 			if (bo) {
+ 				modifier = gbm_bo_get_modifier(bo);
+ 				gbm_bo_destroy(bo);
+diff --git a/src/screencast/screencast_common.c b/src/screencast/screencast_common.c
+index d6d13db..2e4fc18 100644
+--- a/src/screencast/screencast_common.c
++++ b/src/screencast/screencast_common.c
+@@ -143,8 +143,8 @@ struct xdpw_buffer *xdpw_buffer_create(struct xdpw_screencast_instance *cast,
+ 		uint32_t flags = GBM_BO_USE_RENDERING;
+ 		if (cast->pwr_format.modifier != DRM_FORMAT_MOD_INVALID) {
+ 			uint64_t *modifiers = (uint64_t*)&cast->pwr_format.modifier;
+-			buffer->bo = gbm_bo_create_with_modifiers2(cast->ctx->gbm, frame_info->width, frame_info->height,
+-				frame_info->format, modifiers, 1, flags);
++			buffer->bo = gbm_bo_create_with_modifiers(cast->ctx->gbm, frame_info->width, frame_info->height,
++				frame_info->format, modifiers, 1);
+ 		} else {
+ 			if (cast->ctx->state->config->screencast_conf.force_mod_linear) {
+ 				flags |= GBM_BO_USE_LINEAR;
+-- 
+2.41.0
+
diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
index cfc7109c0c..b845c5f792 100644
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
@@ -16,7 +16,8 @@ DEPENDS = " \
 inherit meson pkgconfig features_check
 REQUIRED_DISTRO_FEATURES = "opengl wayland"
 
-SRC_URI = "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;nobranch=1"
+SRC_URI = "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;nobranch=1 \
+           file://0001-screencast-Fix-build-with-older-mesa.patch"
 
 S = "${WORKDIR}/git"
 SRCREV = "776113a4f014639c29d8de8fcb513493ef7b491f"
-- 
2.41.0


