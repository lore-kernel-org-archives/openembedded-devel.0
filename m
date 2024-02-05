Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5775C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 21:19:00 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.6057.1707167939630021545
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 13:19:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout04.t-online.de (Postfix) with SMTP id E1E465455
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Feb 2024 22:18:57 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.45.88]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rX6Mg-01p16H0; Mon, 5 Feb 2024 22:18:54 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.0.1 -> 1.0.3
Date: Mon,  5 Feb 2024 22:19:01 +0100
Message-ID: <20240205211901.114295-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1707167934-49A21820-55339194/0/0 CLEAN NORMAL
X-TOI-MSGID: 98a5465a-0015-4606-bbce-230e9fde6ca2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 21:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108580

- remove fd33d2d3bb6333c7d6e74cbaa806bff2d908f589.patch

PipeWire 1.0.3 (2024-02-02)

This is a quick bugfix release that is API and ABI compatible with previo=
us
1.0.x releases.

Highlights
  - Fix ALSA version check. This should allow the alsa plugin to work aga=
in.
  - Some small fixes and improvements.

PipeWire
  - Escape @DEFAULT_SINK@ in the conf files.

Modules
  - Improve logging in module-pipe-tunnel.

SPA
  - Always recheck rate matching in ALSA when moving drivers. This fixes =
a
    potential issue where the adaptive resampler would not be activated i=
n
    some cases.

ALSA
  - Fix version check. This should allow the alsa plugin to work again
    with version 1.0.2.

Older versions:

PipeWire 1.0.2 (2024-01-31)

This is a bugfix release that is API and ABI compatible with previous
1.0.x releases.

Highlights
  - Fix v4l2 enumeration with filter. This should fix negotiation in some
    GStreamer pipelines with capsfilter. Also probe for EXPBUF support
    before using it.
  - Fix max-latency property and Buffer param when dealing with small
    ALSA device buffers. This should fix stuttering with some AMD
    based soundcards.
  - More small cleanups an improvements.

Modules
  - Improve netjack2 channel positions.
  - Improve RAOP module state after suspend/resume. (#3778)
  - Avoid crash in some LV2 plugins by configuring the Atom ports. (#3815=
)

SPA
  - Bump libcamera requirements to 0.2.0.
  - Try to avoid unaligned load exceptions. (#3790)
  - Fix v4l2 enumeration with filter. (#1793)
  - Fix max-latency property and Buffer param when dealing with small
    ALSA device buffers. This should fix stuttering with some AMD
    based soundcards. (#3744,#3622)
  - Add a resync.ms option to node.driver to make it possible to resync
    fast to clock jumps.
  - Probe for EXPBUF support in v4l2 before using it. (#3821)

pulse-server
  - Also emit change events when the port list change.

Bluetooth
  - Log a more verbose explanation when other soundservers seem to be
    interfering with bluetooth.
  - Add quirks for Rockbox Brick. (#3786)
  - Add quirks for SoundCore mini2. (#2927)

JACK
  - Improve check for the running state of clients. (#3794)
---
 ...d2d3bb6333c7d6e74cbaa806bff2d908f589.patch | 82 -------------------
 .../{pipewire_1.0.1.bb =3D> pipewire_1.0.3.bb}  |  7 +-
 2 files changed, 2 insertions(+), 87 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/=
fd33d2d3bb6333c7d6e74cbaa806bff2d908f589.patch
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.0.1.bb =3D=
> pipewire_1.0.3.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/fd33d2d=
3bb6333c7d6e74cbaa806bff2d908f589.patch b/meta-multimedia/recipes-multime=
dia/pipewire/pipewire/fd33d2d3bb6333c7d6e74cbaa806bff2d908f589.patch
deleted file mode 100644
index 9c62df19e..000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire/fd33d2d3bb6333=
c7d6e74cbaa806bff2d908f589.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From fd33d2d3bb6333c7d6e74cbaa806bff2d908f589 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Barnab=3DC3=3DA1s=3D20P=3DC5=3D91cze?=3D <pobrn@proton=
mail.com>
-Date: Sat, 28 Oct 2023 02:09:06 +0200
-Subject: [PATCH] spa: libcamera: use `CameraConfiguration::orientation`
-
-libcamera commit cc65629b68d49d ("libcamera: camera: Introduce Orientati=
on") [0]
-introduced to the `CameraConfiguration::orientation` member to describe =
the
-orientation of the image in the received memory buffers.
-
-Then c65e40b8480ffb ("libcamera: Use CameraConfiguration::orientation") =
[1]
-removed `CameraConfiguration::transform`, which broke the libcamera plug=
in.
-
-Fix that by using the new `orientation` member.
-
-[0]: https://git.linuxtv.org/libcamera.git/commit/?id=3Dcc65629b68d49d5f=
2a4d61537584c56ba510a335
-[1]: https://git.linuxtv.org/libcamera.git/commit/?id=3Dc65e40b8480ffb5f=
50e01a4e6713164c7194a937
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/pipewire/pipew=
ire/-/commit/fd33d2d3bb6333c7d6e74cbaa806bff2d908f589]
----
- spa/plugins/libcamera/libcamera-utils.cpp | 36 +++++++++++------------
- 1 file changed, 17 insertions(+), 19 deletions(-)
-
-diff --git a/spa/plugins/libcamera/libcamera-utils.cpp b/spa/plugins/lib=
camera/libcamera-utils.cpp
-index 2b1aea5a76..c197248d30 100644
---- a/spa/plugins/libcamera/libcamera-utils.cpp
-+++ b/spa/plugins/libcamera/libcamera-utils.cpp
-@@ -716,25 +716,23 @@ static int spa_libcamera_use_buffers(struct impl *=
impl, struct port *port,
- }
-=20
- static const struct {
--	Transform libcamera_transform;
--	uint32_t spa_transform_value;
--} transform_map[] =3D {
--	{ Transform::Identity, SPA_META_TRANSFORMATION_None },
--	{ Transform::Rot0, SPA_META_TRANSFORMATION_None },
--	{ Transform::HFlip, SPA_META_TRANSFORMATION_Flipped },
--	{ Transform::VFlip, SPA_META_TRANSFORMATION_Flipped180 },
--	{ Transform::HVFlip, SPA_META_TRANSFORMATION_180 },
--	{ Transform::Rot180, SPA_META_TRANSFORMATION_180 },
--	{ Transform::Transpose, SPA_META_TRANSFORMATION_Flipped90 },
--	{ Transform::Rot90, SPA_META_TRANSFORMATION_90 },
--	{ Transform::Rot270, SPA_META_TRANSFORMATION_270 },
--	{ Transform::Rot180Transpose, SPA_META_TRANSFORMATION_Flipped270 },
-+	Orientation libcamera_orientation; /* clockwise rotation then horizont=
al mirroring */
-+	uint32_t spa_transform_value; /* horizontal mirroring then counter-clo=
ckwise rotation */
-+} orientation_map[] =3D {
-+	{ Orientation::Rotate0, SPA_META_TRANSFORMATION_None },
-+	{ Orientation::Rotate0Mirror, SPA_META_TRANSFORMATION_Flipped },
-+	{ Orientation::Rotate90, SPA_META_TRANSFORMATION_270 },
-+	{ Orientation::Rotate90Mirror, SPA_META_TRANSFORMATION_Flipped90 },
-+	{ Orientation::Rotate180, SPA_META_TRANSFORMATION_180 },
-+	{ Orientation::Rotate180Mirror, SPA_META_TRANSFORMATION_Flipped180 },
-+	{ Orientation::Rotate270, SPA_META_TRANSFORMATION_90 },
-+	{ Orientation::Rotate270Mirror, SPA_META_TRANSFORMATION_Flipped270 },
- };
-=20
--static uint32_t libcamera_transform_to_spa_transform_value(Transform tr=
ansform)
-+static uint32_t libcamera_orientation_to_spa_transform_value(Orientatio=
n orientation)
- {
--	for (const auto& t : transform_map) {
--		if (t.libcamera_transform =3D=3D transform)
-+	for (const auto& t : orientation_map) {
-+		if (t.libcamera_orientation =3D=3D orientation)
- 			return t.spa_transform_value;
- 	}
- 	return SPA_META_TRANSFORMATION_None;
-@@ -788,9 +786,9 @@ mmap_init(struct impl *impl, struct port *port,
- 			buffers[i], SPA_META_VideoTransform, sizeof(*b->videotransform));
- 		if (b->videotransform) {
- 			b->videotransform->transform =3D
--				libcamera_transform_to_spa_transform_value(impl->config->transform)=
;
--			spa_log_debug(impl->log, "Setting videotransform for buffer %d to %u=
 (from %s)",
--				i, b->videotransform->transform, transformToString(impl->config->tr=
ansform));
-+				libcamera_orientation_to_spa_transform_value(impl->config->orientat=
ion);
-+			spa_log_debug(impl->log, "Setting videotransform for buffer %u to %u=
",
-+				i, b->videotransform->transform);
-=20
- 		}
-=20
---=20
-GitLab
-
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.1.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.3.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.1.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.3.bb
index f1b1ce586..f1c9f8556 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.3.bb
@@ -12,11 +12,8 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "79b98884af80329f59596906231da5597bcdb7b6"
-SRC_URI =3D " \
-	git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D1.0;protoco=
l=3Dhttps \
-	file://fd33d2d3bb6333c7d6e74cbaa806bff2d908f589.patch \
-"
+SRCREV =3D "6ab86209f23a841de7eac6bc0c1009aceb9ffd87"
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.0;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.43.0


