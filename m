Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBE8CA101F
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 04:31:44 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.25107.1757910702574505612
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Sep 2025 21:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout04.t-online.de (Postfix) with SMTP id 23413E3E6
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 06:31:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.165.158]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uy0sN-0vmTAH0; Mon, 15 Sep 2025 06:31:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire-media-session: update 0.4.2 -> 0.4.3
Date: Mon, 15 Sep 2025 06:31:30 +0200
Message-ID: <20250915043130.175050-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1757910699-6D7F990B-4D2509BF/0/0 CLEAN NORMAL
X-TOI-MSGID: ca5fb68a-5eba-4fea-9d35-53fbbf648c0e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 04:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119401

fix includes and compilation

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-pass-right-types-to-methods.patch    | 53 -------------------
 ...4.2.bb =3D> pipewire-media-session_0.4.3.bb} |  6 +--
 2 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire-=
media-session/0001-pass-right-types-to-methods.patch
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire-media-sessi=
on_0.4.2.bb =3D> pipewire-media-session_0.4.3.bb} (79%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-s=
ession/0001-pass-right-types-to-methods.patch b/meta-multimedia/recipes-m=
ultimedia/pipewire/pipewire-media-session/0001-pass-right-types-to-method=
s.patch
deleted file mode 100644
index e7a3e52617..0000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session/=
0001-pass-right-types-to-methods.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 97e0d7646c873ea3badfa604b3f084ed6208af97 Mon Sep 17 00:00:00 2001
-From: Wim Taymans <wtaymans@redhat.com>
-Date: Tue, 26 Nov 2024 13:37:06 +0100
-Subject: [PATCH] pass right types to methods
-
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/pipewire/media=
-session/-/commit/e6243381cf2b7d0d33707627b4186f5580908752]
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
----
- src/access-flatpak.c | 2 +-
- src/access-portal.c  | 2 +-
- src/default-routes.c | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/access-flatpak.c b/src/access-flatpak.c
-index afe780b2d..dd802d6eb 100644
---- a/src/access-flatpak.c
-+++ b/src/access-flatpak.c
-@@ -114,7 +114,7 @@ static void object_update(void *data)
- 		pw_log_info("%p: flatpak client %d granted 0x%08x permissions"
- 				, impl, client->id, perms);
- 		permissions[0] =3D PW_PERMISSION_INIT(PW_ID_ANY, perms);
--		pw_client_update_permissions(client->obj->obj.proxy,
-+		pw_client_update_permissions((struct pw_client*)client->obj->obj.prox=
y,
- 				1, permissions);
- 		client->active =3D true;
- 	}
-diff --git a/src/access-portal.c b/src/access-portal.c
-index 92d95a26b..4e3a9f52a 100644
---- a/src/access-portal.c
-+++ b/src/access-portal.c
-@@ -265,7 +265,7 @@ set_global_permissions(void *data, struct sm_object =
*object)
- 		permissions[n_permissions++] =3D
- 			PW_PERMISSION_INIT(object->id, allowed ? PW_PERM_ALL : 0);
- 		pw_log_info("%p: object %d allowed:%d", impl, object->id, allowed);
--		pw_client_update_permissions(client->obj->obj.proxy,
-+		pw_client_update_permissions((struct pw_client*)client->obj->obj.prox=
y,
- 				n_permissions, permissions);
- 	}
- 	return 0;
-diff --git a/src/default-routes.c b/src/default-routes.c
-index 5a842faf7..86f9e217b 100644
---- a/src/default-routes.c
-+++ b/src/default-routes.c
-@@ -479,7 +479,7 @@ static int restore_route_params(struct device *dev, =
const char *val, const struc
- 	if (pw_log_level_enabled(SPA_LOG_LEVEL_DEBUG))
- 		spa_debug_pod(2, NULL, param);
-=20
--	pw_device_set_param((struct pw_node*)dev->obj->obj.proxy,
-+	pw_device_set_param((struct pw_device*)dev->obj->obj.proxy,
- 			SPA_PARAM_Route, 0, param);
-=20
- 	sm_media_session_schedule_rescan(dev->impl->session);
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-s=
ession_0.4.2.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-me=
dia-session_0.4.3.bb
similarity index 79%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire-media-se=
ssion_0.4.2.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire-media-sess=
ion_0.4.3.bb
index dde0039584..7616626a6d 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_=
0.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_=
0.4.3.bb
@@ -10,11 +10,9 @@ DEPENDS =3D " \
 	dbus \
 "
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/media-session.git;pro=
tocol=3Dhttps;branch=3Dmaster \
-           file://0001-pass-right-types-to-methods.patch \
-           "
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/media-session.git;pro=
tocol=3Dhttps;branch=3Dmaster"
=20
-SRCREV =3D "80dae7e24bec02b2befe09a72fbac6e2b38ccb5c"
+SRCREV =3D "4ac1d82d26bbf9c6f37c56546d26be5a03f886fa"
=20
 inherit meson pkgconfig
 # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2952
--=20
2.50.1


