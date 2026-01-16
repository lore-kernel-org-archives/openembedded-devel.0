Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1523D4A60D
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 08:00:14 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1501.1768550409984469013
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jan 2026 00:00:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout01.t-online.de (Postfix) with SMTP id DF83F1CD46
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 09:00:07 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.158]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vgekZ-18Yy7F0; Fri, 16 Jan 2026 09:00:07 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] xdg-desktop-portal-wlr: update 0.7.0 -> 0.8.1
Date: Fri, 16 Jan 2026 08:59:59 +0100
Message-ID: <20260116075959.111147-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1768550407-6F7FD973-9E31D5B4/0/0 CLEAN NORMAL
X-TOI-MSGID: de67641f-0462-4215-9640-2474bbbad0d3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 08:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123527

Remove patch that downgraded gbm_bo_create_with_modifiers.
Meanwhile gbm_bo_create_with_modifiers2 should be save to use?

Fix to work with manpages class

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...screencast-Fix-build-with-older-mesa.patch | 53 -------------------
 ...7.0.bb =3D> xdg-desktop-portal-wlr_0.8.1.bb} |  9 ++--
 2 files changed, 4 insertions(+), 58 deletions(-)
 delete mode 100644 meta-multimedia/recipes-support/xdg-desktop-portal-wl=
r/xdg-desktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch
 rename meta-multimedia/recipes-support/xdg-desktop-portal-wlr/{xdg-deskt=
op-portal-wlr_0.7.0.bb =3D> xdg-desktop-portal-wlr_0.8.1.bb} (74%)

diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-d=
esktop-portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch b/meta-=
multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-portal-wlr/=
0001-screencast-Fix-build-with-older-mesa.patch
deleted file mode 100644
index ff4fcc292a..0000000000
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr/0001-screencast-Fix-build-with-older-mesa.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From ef60a76e2a21b7649632dcf71d125039604a56b5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 18 Jun 2023 10:42:19 -0700
-Subject: [PATCH] screencast: Fix build with older mesa
-
-gbm_bo_create_with_modifiers2() is quite new and there are still distros
-that ship 21.2 and older. e.g. powerVR mesa implementation
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/screencast/pipewire_screencast.c | 8 ++++++--
- src/screencast/screencast_common.c   | 4 ++--
- 2 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/src/screencast/pipewire_screencast.c b/src/screencast/pipew=
ire_screencast.c
-index 0611fd5..7d66810 100644
---- a/src/screencast/pipewire_screencast.c
-+++ b/src/screencast/pipewire_screencast.c
-@@ -234,9 +234,13 @@ static void pwr_handle_stream_param_changed(void *d=
ata, uint32_t id,
- 			uint32_t n_params;
- 			struct spa_pod_builder *builder[2] =3D {&b[0].b, &b[1].b};
-=20
--			struct gbm_bo *bo =3D gbm_bo_create_with_modifiers2(cast->ctx->gbm,
-+			struct gbm_bo *bo =3D gbm_bo_create_with_modifiers(cast->ctx->gbm,
- 				cast->screencopy_frame_info[cast->buffer_type].width, cast->screenc=
opy_frame_info[cast->buffer_type].height,
--				cast->screencopy_frame_info[cast->buffer_type].format, modifiers, n=
_modifiers, flags);
-+				cast->screencopy_frame_info[cast->buffer_type].format, modifiers, n=
_modifiers);
-+			if(!bo)
-+				bo =3D gbm_bo_create(cast->ctx->gbm,
-+				cast->screencopy_frame_info[cast->buffer_type].width, cast->screenc=
opy_frame_info[cast->buffer_type].height,
-+				cast->screencopy_frame_info[cast->buffer_type].format, GBM_BO_USE_R=
ENDERING);
- 			if (bo) {
- 				modifier =3D gbm_bo_get_modifier(bo);
- 				gbm_bo_destroy(bo);
-diff --git a/src/screencast/screencast_common.c b/src/screencast/screenc=
ast_common.c
-index d6d13db..2e4fc18 100644
---- a/src/screencast/screencast_common.c
-+++ b/src/screencast/screencast_common.c
-@@ -143,8 +143,8 @@ struct xdpw_buffer *xdpw_buffer_create(struct xdpw_s=
creencast_instance *cast,
- 		uint32_t flags =3D GBM_BO_USE_RENDERING;
- 		if (cast->pwr_format.modifier !=3D DRM_FORMAT_MOD_INVALID) {
- 			uint64_t *modifiers =3D (uint64_t*)&cast->pwr_format.modifier;
--			buffer->bo =3D gbm_bo_create_with_modifiers2(cast->ctx->gbm, frame_i=
nfo->width, frame_info->height,
--				frame_info->format, modifiers, 1, flags);
-+			buffer->bo =3D gbm_bo_create_with_modifiers(cast->ctx->gbm, frame_in=
fo->width, frame_info->height,
-+				frame_info->format, modifiers, 1);
- 		} else {
- 			if (cast->ctx->state->config->screencast_conf.force_mod_linear) {
- 				flags |=3D GBM_BO_USE_LINEAR;
---=20
-2.41.0
-
diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-d=
esktop-portal-wlr_0.7.0.bb b/meta-multimedia/recipes-support/xdg-desktop-=
portal-wlr/xdg-desktop-portal-wlr_0.8.1.bb
similarity index 74%
rename from meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-de=
sktop-portal-wlr_0.7.0.bb
rename to meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desk=
top-portal-wlr_0.8.1.bb
index c3056c9e86..3deeb1078d 100644
--- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.7.0.bb
+++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.8.1.bb
@@ -13,18 +13,17 @@ DEPENDS =3D " \
     virtual/libgbm \
 "
=20
-inherit meson pkgconfig features_check
+inherit meson pkgconfig features_check manpages
 REQUIRED_DISTRO_FEATURES =3D "opengl wayland"
=20
-SRC_URI =3D "git://github.com/emersion/xdg-desktop-portal-wlr.git;protoc=
ol=3Dhttps;branch=3Dmaster \
-           file://0001-screencast-Fix-build-with-older-mesa.patch"
+SRC_URI =3D "git://github.com/emersion/xdg-desktop-portal-wlr.git;protoc=
ol=3Dhttps;branch=3Dmaster"
=20
 PV .=3D "+git"
-SRCREV =3D "d9ada849aeca6137915de2df69beaef4e272cc1d"
+SRCREV =3D "256eb4a9f6ecffd64289d6501d036c2094b47db6"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
systemd', 'basu', d)}"
=20
-PACKAGECONFIG[man-pages] =3D "-Dman-pages=3Denabled,-Dman-pages=3Ddisabl=
ed,scdoc-native"
+PACKAGECONFIG[manpages] =3D "-Dman-pages=3Denabled,-Dman-pages=3Ddisable=
d,scdoc-native"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled -Dsd-bus-provider=3Dlibs=
ystemd,-Dsystemd=3Ddisabled"
 PACKAGECONFIG[basu] =3D "-Dsd-bus-provider=3Dbasu,,basu"
=20
--=20
2.52.0


