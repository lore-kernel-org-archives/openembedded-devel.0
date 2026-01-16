Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E18D4A60E
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 08:06:54 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1661.1768550813536709594
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jan 2026 00:06:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout06.t-online.de (Postfix) with SMTP id AC91288F;
	Fri, 16 Jan 2026 09:06:51 +0100 (CET)
Received: from [192.168.178.36] ([84.163.33.158]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vger2-2NVMYq0; Fri, 16 Jan 2026 09:06:48 +0100
Date: Fri, 16 Jan 2026 09:06:43 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH] xdg-desktop-portal-wlr: update
 0.7.0 -> 0.8.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <7J6Y8T.P7ZZEYH9FWC83@t-online.de>
In-Reply-To: <188B273A6CFFB755.2721127@lists.openembedded.org>
References: <188B273A6CFFB755.2721127@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-sLmglCq8j/qyxl6WzSUa"
X-TOI-EXPURGATEID: 150726::1768550808-25C419B6-803CDA41/0/0 CLEAN NORMAL
X-TOI-MSGID: 832d818b-fe2c-4441-bee9-9a05f7f9530c
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 08:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123528

--=-sLmglCq8j/qyxl6WzSUa
Content-Type: text/plain; charset=us-ascii; format=flowed

The update uses the current master branch, which is two commits ahead 
of the actual release.
The changes are non-invasive and enable the use of fuzzel as a chooser, 
a feature I am personally
interested in.

<https://github.com/emersion/xdg-desktop-portal-wlr/commits/master/>


On Fri, Jan 16 2026 at 08:59:59 +01:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Remove patch that downgraded gbm_bo_create_with_modifiers.
> Meanwhile gbm_bo_create_with_modifiers2 should be save to use?
> 
> Fix to work with manpages class
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...screencast-Fix-build-with-older-mesa.patch | 53 
> -------------------
>  ...7.0.bb => xdg-desktop-portal-wlr_0.8.1.bb} |  9 ++--
>  2 files changed, 4 insertions(+), 58 deletions(-)
>  delete mode 100644 
> meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch
>  rename 
> meta-multimedia/recipes-support/xdg-desktop-portal-wlr/{xdg-desktop-portal-wlr_0.7.0.bb 
> => xdg-desktop-portal-wlr_0.8.1.bb} (74%)
> 
> diff --git 
> a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch 
> b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch
> deleted file mode 100644
> index ff4fcc292a..0000000000
> --- 
> a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From ef60a76e2a21b7649632dcf71d125039604a56b5 Mon Sep 17 00:00:00 
> 2001
> -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> -Date: Sun, 18 Jun 2023 10:42:19 -0700
> -Subject: [PATCH] screencast: Fix build with older mesa
> -
> -gbm_bo_create_with_modifiers2() is quite new and there are still 
> distros
> -that ship 21.2 and older. e.g. powerVR mesa implementation
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> ----
> - src/screencast/pipewire_screencast.c | 8 ++++++--
> - src/screencast/screencast_common.c   | 4 ++--
> - 2 files changed, 8 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/screencast/pipewire_screencast.c 
> b/src/screencast/pipewire_screencast.c
> -index 0611fd5..7d66810 100644
> ---- a/src/screencast/pipewire_screencast.c
> -+++ b/src/screencast/pipewire_screencast.c
> -@@ -234,9 +234,13 @@ static void 
> pwr_handle_stream_param_changed(void *data, uint32_t id,
> - 			uint32_t n_params;
> - 			struct spa_pod_builder *builder[2] = {&b[0].b, &b[1].b};
> -
> --			struct gbm_bo *bo = gbm_bo_create_with_modifiers2(cast->ctx->gbm,
> -+			struct gbm_bo *bo = gbm_bo_create_with_modifiers(cast->ctx->gbm,
> - 				cast->screencopy_frame_info[cast->buffer_type].width, 
> cast->screencopy_frame_info[cast->buffer_type].height,
> --				cast->screencopy_frame_info[cast->buffer_type].format, 
> modifiers, n_modifiers, flags);
> -+				cast->screencopy_frame_info[cast->buffer_type].format, 
> modifiers, n_modifiers);
> -+			if(!bo)
> -+				bo = gbm_bo_create(cast->ctx->gbm,
> -+				cast->screencopy_frame_info[cast->buffer_type].width, 
> cast->screencopy_frame_info[cast->buffer_type].height,
> -+				cast->screencopy_frame_info[cast->buffer_type].format, 
> GBM_BO_USE_RENDERING);
> - 			if (bo) {
> - 				modifier = gbm_bo_get_modifier(bo);
> - 				gbm_bo_destroy(bo);
> -diff --git a/src/screencast/screencast_common.c 
> b/src/screencast/screencast_common.c
> -index d6d13db..2e4fc18 100644
> ---- a/src/screencast/screencast_common.c
> -+++ b/src/screencast/screencast_common.c
> -@@ -143,8 +143,8 @@ struct xdpw_buffer *xdpw_buffer_create(struct 
> xdpw_screencast_instance *cast,
> - 		uint32_t flags = GBM_BO_USE_RENDERING;
> - 		if (cast->pwr_format.modifier != DRM_FORMAT_MOD_INVALID) {
> - 			uint64_t *modifiers = (uint64_t*)&cast->pwr_format.modifier;
> --			buffer->bo = gbm_bo_create_with_modifiers2(cast->ctx->gbm, 
> frame_info->width, frame_info->height,
> --				frame_info->format, modifiers, 1, flags);
> -+			buffer->bo = gbm_bo_create_with_modifiers(cast->ctx->gbm, 
> frame_info->width, frame_info->height,
> -+				frame_info->format, modifiers, 1);
> - 		} else {
> - 			if (cast->ctx->state->config->screencast_conf.force_mod_linear) {
> - 				flags |= GBM_BO_USE_LINEAR;
> ---
> -2.41.0
> -
> diff --git 
> a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb 
> b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.1.bb
> similarity index 74%
> rename from 
> meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
> rename to 
> meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.1.bb
> index c3056c9e86..3deeb1078d 100644
> --- 
> a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
> +++ 
> b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.1.bb
> @@ -13,18 +13,17 @@ DEPENDS = " \
>      virtual/libgbm \
>  "
> 
> -inherit meson pkgconfig features_check
> +inherit meson pkgconfig features_check manpages
>  REQUIRED_DISTRO_FEATURES = "opengl wayland"
> 
> -SRC_URI = 
> "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;branch=master 
> \
> -           file://0001-screencast-Fix-build-with-older-mesa.patch" 
> <file://0001-screencast-fix-build-with-older-mesa.patch/>
> +SRC_URI = 
> "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;branch=master"
> 
>  PV .= "+git"
> -SRCREV = "d9ada849aeca6137915de2df69beaef4e272cc1d"
> +SRCREV = "256eb4a9f6ecffd64289d6501d036c2094b47db6"
> 
>  PACKAGECONFIG ?= "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd', 
> 'systemd', 'basu', d)}"
> 
> -PACKAGECONFIG[man-pages] = 
> "-Dman-pages=enabled,-Dman-pages=disabled,scdoc-native"
> +PACKAGECONFIG[manpages] = 
> "-Dman-pages=enabled,-Dman-pages=disabled,scdoc-native"
>  PACKAGECONFIG[systemd] = "-Dsystemd=enabled 
> -Dsd-bus-provider=libsystemd,-Dsystemd=disabled"
>  PACKAGECONFIG[basu] = "-Dsd-bus-provider=basu,,basu"
> 
> --
> 2.52.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123527): 
> <https://lists.openembedded.org/g/openembedded-devel/message/123527>
> Mute This Topic: <https://lists.openembedded.org/mt/117294478/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-sLmglCq8j/qyxl6WzSUa
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><div>The update uses the current master branch, which is two commits ahead of the actual release.</div><div>The changes are non-invasive and enable the use of fuzzel as a chooser, a feature I am personally</div><div>interested in.</div><div><br></div><div><a href="https://github.com/emersion/xdg-desktop-portal-wlr/commits/master/">https://github.com/emersion/xdg-desktop-portal-wlr/commits/master/</a></div></div><div><br></div></div><div id="geary-quote" dir="auto"><br>On Fri, Jan 16 2026 at 08:59:59 +01:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Remove patch that downgraded gbm_bo_create_with_modifiers.
Meanwhile gbm_bo_create_with_modifiers2 should be save to use?

Fix to work with manpages class

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...screencast-Fix-build-with-older-mesa.patch | 53 -------------------
 ...7.0.bb =&gt; xdg-desktop-portal-wlr_0.8.1.bb} |  9 ++--
 2 files changed, 4 insertions(+), 58 deletions(-)
 delete mode 100644 meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch
 rename meta-multimedia/recipes-support/xdg-desktop-portal-wlr/{xdg-desktop-portal-wlr_0.7.0.bb =&gt; xdg-desktop-portal-wlr_0.8.1.bb} (74%)

diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch
deleted file mode 100644
index ff4fcc292a..0000000000
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From ef60a76e2a21b7649632dcf71d125039604a56b5 Mon Sep 17 00:00:00 2001
-From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
-Date: Sun, 18 Jun 2023 10:42:19 -0700
-Subject: [PATCH] screencast: Fix build with older mesa
-
-gbm_bo_create_with_modifiers2() is quite new and there are still distros
-that ship 21.2 and older. e.g. powerVR mesa implementation
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
----
- src/screencast/pipewire_screencast.c | 8 ++++++--
- src/screencast/screencast_common.c   | 4 ++--
- 2 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/src/screencast/pipewire_screencast.c b/src/screencast/pipewire_screencast.c
-index 0611fd5..7d66810 100644
---- a/src/screencast/pipewire_screencast.c
-+++ b/src/screencast/pipewire_screencast.c
-@@ -234,9 +234,13 @@ static void pwr_handle_stream_param_changed(void *data, uint32_t id,
- 			uint32_t n_params;
- 			struct spa_pod_builder *builder[2] = {&amp;b[0].b, &amp;b[1].b};
- 
--			struct gbm_bo *bo = gbm_bo_create_with_modifiers2(cast-&gt;ctx-&gt;gbm,
-+			struct gbm_bo *bo = gbm_bo_create_with_modifiers(cast-&gt;ctx-&gt;gbm,
- 				cast-&gt;screencopy_frame_info[cast-&gt;buffer_type].width, cast-&gt;screencopy_frame_info[cast-&gt;buffer_type].height,
--				cast-&gt;screencopy_frame_info[cast-&gt;buffer_type].format, modifiers, n_modifiers, flags);
-+				cast-&gt;screencopy_frame_info[cast-&gt;buffer_type].format, modifiers, n_modifiers);
-+			if(!bo)
-+				bo = gbm_bo_create(cast-&gt;ctx-&gt;gbm,
-+				cast-&gt;screencopy_frame_info[cast-&gt;buffer_type].width, cast-&gt;screencopy_frame_info[cast-&gt;buffer_type].height,
-+				cast-&gt;screencopy_frame_info[cast-&gt;buffer_type].format, GBM_BO_USE_RENDERING);
- 			if (bo) {
- 				modifier = gbm_bo_get_modifier(bo);
- 				gbm_bo_destroy(bo);
-diff --git a/src/screencast/screencast_common.c b/src/screencast/screencast_common.c
-index d6d13db..2e4fc18 100644
---- a/src/screencast/screencast_common.c
-+++ b/src/screencast/screencast_common.c
-@@ -143,8 +143,8 @@ struct xdpw_buffer *xdpw_buffer_create(struct xdpw_screencast_instance *cast,
- 		uint32_t flags = GBM_BO_USE_RENDERING;
- 		if (cast-&gt;pwr_format.modifier != DRM_FORMAT_MOD_INVALID) {
- 			uint64_t *modifiers = (uint64_t*)&amp;cast-&gt;pwr_format.modifier;
--			buffer-&gt;bo = gbm_bo_create_with_modifiers2(cast-&gt;ctx-&gt;gbm, frame_info-&gt;width, frame_info-&gt;height,
--				frame_info-&gt;format, modifiers, 1, flags);
-+			buffer-&gt;bo = gbm_bo_create_with_modifiers(cast-&gt;ctx-&gt;gbm, frame_info-&gt;width, frame_info-&gt;height,
-+				frame_info-&gt;format, modifiers, 1);
- 		} else {
- 			if (cast-&gt;ctx-&gt;state-&gt;config-&gt;screencast_conf.force_mod_linear) {
- 				flags |= GBM_BO_USE_LINEAR;
--- 
-2.41.0
-
diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.1.bb
similarity index 74%
rename from meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
rename to meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.1.bb
index c3056c9e86..3deeb1078d 100644
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.7.0.bb
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.8.1.bb
@@ -13,18 +13,17 @@ DEPENDS = " \
     virtual/libgbm \
 "
 
-inherit meson pkgconfig features_check
+inherit meson pkgconfig features_check manpages
 REQUIRED_DISTRO_FEATURES = "opengl wayland"
 
-SRC_URI = "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;branch=master \
-           <a href="file://0001-screencast-Fix-build-with-older-mesa.patch" "="">file://0001-screencast-Fix-build-with-older-mesa.patch"</a>
+SRC_URI = "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;branch=master"
 
 PV .= "+git"
-SRCREV = "d9ada849aeca6137915de2df69beaef4e272cc1d"
+SRCREV = "256eb4a9f6ecffd64289d6501d036c2094b47db6"
 
 PACKAGECONFIG ?= "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'systemd', 'systemd', 'basu', d)}"
 
-PACKAGECONFIG[man-pages] = "-Dman-pages=enabled,-Dman-pages=disabled,scdoc-native"
+PACKAGECONFIG[manpages] = "-Dman-pages=enabled,-Dman-pages=disabled,scdoc-native"
 PACKAGECONFIG[systemd] = "-Dsystemd=enabled -Dsd-bus-provider=libsystemd,-Dsystemd=disabled"
 PACKAGECONFIG[basu] = "-Dsd-bus-provider=basu,,basu"
 
<div>-- 
</div>2.52.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#123527): <a href="https://lists.openembedded.org/g/openembedded-devel/message/123527">https://lists.openembedded.org/g/openembedded-devel/message/123527</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/117294478/3618223">https://lists.openembedded.org/mt/117294478/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-sLmglCq8j/qyxl6WzSUa--


