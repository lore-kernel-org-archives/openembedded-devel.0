Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D02C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 09:38:00 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.12115.1706261875103030490
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 01:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout07.t-online.de (Postfix) with SMTP id 4FF9A231F2
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 10:37:53 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.175.38]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rTIei-1pBH4D0; Fri, 26 Jan 2024 10:37:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: fix build with libcamera-0.2
Date: Fri, 26 Jan 2024 10:37:52 +0100
Message-ID: <20240126093752.259853-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1706261868-467FB979-4E741D63/0/0 CLEAN NORMAL
X-TOI-MSGID: 6a88aa07-bfdb-4e52-86d0-93501387b62e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 09:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108458

Add a backport patch to fix this issue with libcamera-0.2:
| In file included from ../git/spa/plugins/libcamera/libcamera-source.cpp=
:188:
| ../git/spa/plugins/libcamera/libcamera-utils.cpp:719:9: error: 'Transfo=
rm' does not name a type

https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3782

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...d2d3bb6333c7d6e74cbaa806bff2d908f589.patch | 82 +++++++++++++++++++
 .../pipewire/pipewire_1.0.1.bb                |  5 +-
 2 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/=
fd33d2d3bb6333c7d6e74cbaa806bff2d908f589.patch

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/fd33d2d=
3bb6333c7d6e74cbaa806bff2d908f589.patch b/meta-multimedia/recipes-multime=
dia/pipewire/pipewire/fd33d2d3bb6333c7d6e74cbaa806bff2d908f589.patch
new file mode 100644
index 000000000..9c62df19e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/fd33d2d3bb6333=
c7d6e74cbaa806bff2d908f589.patch
@@ -0,0 +1,82 @@
+From fd33d2d3bb6333c7d6e74cbaa806bff2d908f589 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Barnab=3DC3=3DA1s=3D20P=3DC5=3D91cze?=3D <pobrn@proton=
mail.com>
+Date: Sat, 28 Oct 2023 02:09:06 +0200
+Subject: [PATCH] spa: libcamera: use `CameraConfiguration::orientation`
+
+libcamera commit cc65629b68d49d ("libcamera: camera: Introduce Orientati=
on") [0]
+introduced to the `CameraConfiguration::orientation` member to describe =
the
+orientation of the image in the received memory buffers.
+
+Then c65e40b8480ffb ("libcamera: Use CameraConfiguration::orientation") =
[1]
+removed `CameraConfiguration::transform`, which broke the libcamera plug=
in.
+
+Fix that by using the new `orientation` member.
+
+[0]: https://git.linuxtv.org/libcamera.git/commit/?id=3Dcc65629b68d49d5f=
2a4d61537584c56ba510a335
+[1]: https://git.linuxtv.org/libcamera.git/commit/?id=3Dc65e40b8480ffb5f=
50e01a4e6713164c7194a937
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/pipewire/pipew=
ire/-/commit/fd33d2d3bb6333c7d6e74cbaa806bff2d908f589]
+---
+ spa/plugins/libcamera/libcamera-utils.cpp | 36 +++++++++++------------
+ 1 file changed, 17 insertions(+), 19 deletions(-)
+
+diff --git a/spa/plugins/libcamera/libcamera-utils.cpp b/spa/plugins/lib=
camera/libcamera-utils.cpp
+index 2b1aea5a76..c197248d30 100644
+--- a/spa/plugins/libcamera/libcamera-utils.cpp
++++ b/spa/plugins/libcamera/libcamera-utils.cpp
+@@ -716,25 +716,23 @@ static int spa_libcamera_use_buffers(struct impl *=
impl, struct port *port,
+ }
+=20
+ static const struct {
+-	Transform libcamera_transform;
+-	uint32_t spa_transform_value;
+-} transform_map[] =3D {
+-	{ Transform::Identity, SPA_META_TRANSFORMATION_None },
+-	{ Transform::Rot0, SPA_META_TRANSFORMATION_None },
+-	{ Transform::HFlip, SPA_META_TRANSFORMATION_Flipped },
+-	{ Transform::VFlip, SPA_META_TRANSFORMATION_Flipped180 },
+-	{ Transform::HVFlip, SPA_META_TRANSFORMATION_180 },
+-	{ Transform::Rot180, SPA_META_TRANSFORMATION_180 },
+-	{ Transform::Transpose, SPA_META_TRANSFORMATION_Flipped90 },
+-	{ Transform::Rot90, SPA_META_TRANSFORMATION_90 },
+-	{ Transform::Rot270, SPA_META_TRANSFORMATION_270 },
+-	{ Transform::Rot180Transpose, SPA_META_TRANSFORMATION_Flipped270 },
++	Orientation libcamera_orientation; /* clockwise rotation then horizont=
al mirroring */
++	uint32_t spa_transform_value; /* horizontal mirroring then counter-clo=
ckwise rotation */
++} orientation_map[] =3D {
++	{ Orientation::Rotate0, SPA_META_TRANSFORMATION_None },
++	{ Orientation::Rotate0Mirror, SPA_META_TRANSFORMATION_Flipped },
++	{ Orientation::Rotate90, SPA_META_TRANSFORMATION_270 },
++	{ Orientation::Rotate90Mirror, SPA_META_TRANSFORMATION_Flipped90 },
++	{ Orientation::Rotate180, SPA_META_TRANSFORMATION_180 },
++	{ Orientation::Rotate180Mirror, SPA_META_TRANSFORMATION_Flipped180 },
++	{ Orientation::Rotate270, SPA_META_TRANSFORMATION_90 },
++	{ Orientation::Rotate270Mirror, SPA_META_TRANSFORMATION_Flipped270 },
+ };
+=20
+-static uint32_t libcamera_transform_to_spa_transform_value(Transform tr=
ansform)
++static uint32_t libcamera_orientation_to_spa_transform_value(Orientatio=
n orientation)
+ {
+-	for (const auto& t : transform_map) {
+-		if (t.libcamera_transform =3D=3D transform)
++	for (const auto& t : orientation_map) {
++		if (t.libcamera_orientation =3D=3D orientation)
+ 			return t.spa_transform_value;
+ 	}
+ 	return SPA_META_TRANSFORMATION_None;
+@@ -788,9 +786,9 @@ mmap_init(struct impl *impl, struct port *port,
+ 			buffers[i], SPA_META_VideoTransform, sizeof(*b->videotransform));
+ 		if (b->videotransform) {
+ 			b->videotransform->transform =3D
+-				libcamera_transform_to_spa_transform_value(impl->config->transform)=
;
+-			spa_log_debug(impl->log, "Setting videotransform for buffer %d to %u=
 (from %s)",
+-				i, b->videotransform->transform, transformToString(impl->config->tr=
ansform));
++				libcamera_orientation_to_spa_transform_value(impl->config->orientat=
ion);
++			spa_log_debug(impl->log, "Setting videotransform for buffer %u to %u=
",
++				i, b->videotransform->transform);
+=20
+ 		}
+=20
+--=20
+GitLab
+
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.1.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.1.bb
index a312594ad..f1b1ce586 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.1.bb
@@ -13,7 +13,10 @@ LIC_FILES_CHKSUM =3D " \
 DEPENDS =3D "dbus ncurses"
=20
 SRCREV =3D "79b98884af80329f59596906231da5597bcdb7b6"
-SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.0;protocol=3Dhttps"
+SRC_URI =3D " \
+	git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D1.0;protoco=
l=3Dhttps \
+	file://fd33d2d3bb6333c7d6e74cbaa806bff2d908f589.patch \
+"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.43.0


