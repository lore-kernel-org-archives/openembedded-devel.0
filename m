Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D161D10BE7
	for <webhook@archiver.kernel.org>; Sat, 26 Oct 2024 06:58:24 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.6212.1729925897886367487
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Oct 2024 23:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout09.t-online.de (Postfix) with SMTP id D47CA2D346
	for <openembedded-devel@lists.openembedded.org>; Sat, 26 Oct 2024 08:56:46 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.34.187]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t4aj4-3lcyFF0; Sat, 26 Oct 2024 08:56:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.2.5 -> 1.2.6
Date: Sat, 26 Oct 2024 08:58:38 +0200
Message-ID: <20241026065838.308889-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1729925802-35FF9467-FAA9E051/0/0 CLEAN NORMAL
X-TOI-MSGID: 7494ca5e-89f5-4387-b41d-777bc742cbf9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Oct 2024 06:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113235

- replace patch by the one that was implemented upstream

PipeWire 1.2.6 (2024-10-23)

This is a bugfix release that is API and ABI compatible with the previous
1.2.x and 1.0.x releases.

Highlights
  - The filter-chain param changes were not aggregated correctly, causing=
 some
    param changes to be ignored. (#4331)
  - Clear the JACK io ports correctly when stopping to avoid crashes. (#4=
337)
  - Some more small fixes and improvements.

PipeWire
  - Stream states are now updated based on the underlying node state.
  - Exported nodes now have their state change done synchronously so that=
 the
    server can immediately start the driver and avoid some initial xruns.
  - Improve stream flush handling and improve the docs.
  - Don't send mix_info to destroyed ports to avoid some errors in the
    JACK clients.

Modules
  - The filter-chain param changes were not aggregated correctly, causing=
 some
    param changes to be ignored. (#4331)
  - The filter-chain now correctly optimizes unlinked nodes in all cases.

SPA
  - ALSA PCM node properties are now no longer overwritten with card prop=
erties.
    (#4135)
  - Increase the adapter retry count to avoid xruns in some cases. (#4334=
)
  - Fix potential crash in cleanup of ALSA nodes.

Bluetooth
  - Fix a crash with broadcast sinks.
  - Improve compatibility with Phonak hearing aids.
  - Don't exit when DBus goes down.

JACK
  - Clear the io ports correctly when stopping to avoid crashes. (#4337)

Docs
  - Backport docs from master.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...277b317b4836beccaa3248ab9055526811c.patch} | 25 +++++++++++--------
 .../{pipewire_1.2.5.bb =3D> pipewire_1.2.6.bb}  |  4 +--
 2 files changed, 17 insertions(+), 12 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/files/{0001-parser.h-=
avoid-missing-field-intializers.patch =3D> 0ca64277b317b4836beccaa3248ab9=
055526811c.patch} (69%)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.2.5.bb =3D=
> pipewire_1.2.6.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/files/0001-parse=
r.h-avoid-missing-field-intializers.patch b/meta-multimedia/recipes-multi=
media/pipewire/files/0ca64277b317b4836beccaa3248ab9055526811c.patch
similarity index 69%
rename from meta-multimedia/recipes-multimedia/pipewire/files/0001-parser=
.h-avoid-missing-field-intializers.patch
rename to meta-multimedia/recipes-multimedia/pipewire/files/0ca64277b317b=
4836beccaa3248ab9055526811c.patch
index daeff7e13..9b05e9e4c 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/files/0001-parser.h-avo=
id-missing-field-intializers.patch
+++ b/meta-multimedia/recipes-multimedia/pipewire/files/0ca64277b317b4836=
beccaa3248ab9055526811c.patch
@@ -1,17 +1,22 @@
-From a6d8d98845754b015e2e155c396091b0791a23c9 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Sat, 28 Sep 2024 18:39:43 +0200
-Subject: [PATCH] fix zero initialization
+From 0ca64277b317b4836beccaa3248ab9055526811c Mon Sep 17 00:00:00 2001
+From: Wim Taymans <wtaymans@redhat.com>
+Date: Mon, 30 Sep 2024 10:06:30 +0200
+Subject: [PATCH] spa: initialize all fields explicitly
+
+Patch by Petar Popovic
+
+Fixes #4325
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/pipewire/pipew=
ire/-/commit/0ca64277b317b4836beccaa3248ab9055526811c]
=20
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/pipewire/pipe=
wire/-/issues/4325]
 ---
  spa/include/spa/pod/builder.h | 2 +-
  spa/include/spa/pod/parser.h  | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/spa/include/spa/pod/builder.h b/spa/include/spa/pod/builder=
.h
-index 0564d94ea..b0487bf48 100644
+index 0564d94ea2..6d3e9d54af 100644
 --- a/spa/include/spa/pod/builder.h
 +++ b/spa/include/spa/pod/builder.h
 @@ -49,7 +49,7 @@ struct spa_pod_builder {
@@ -19,12 +24,12 @@ index 0564d94ea..b0487bf48 100644
  };
 =20
 -#define SPA_POD_BUILDER_INIT(buffer,size)  ((struct spa_pod_builder){ (=
buffer), (size), 0, {0}, {0} })
-+#define SPA_POD_BUILDER_INIT(buffer,size)  ((struct spa_pod_builder){ (=
buffer), (size), 0, {}, {} })
++#define SPA_POD_BUILDER_INIT(buffer,size)  ((struct spa_pod_builder){ (=
buffer), (size), 0, {0,0,NULL},{NULL,NULL}})
 =20
  static inline void
  spa_pod_builder_get_state(struct spa_pod_builder *builder, struct spa_p=
od_builder_state *state)
 diff --git a/spa/include/spa/pod/parser.h b/spa/include/spa/pod/parser.h
-index 083f91171..387298927 100644
+index 083f911713..4c1e72acce 100644
 --- a/spa/include/spa/pod/parser.h
 +++ b/spa/include/spa/pod/parser.h
 @@ -33,7 +33,7 @@ struct spa_pod_parser {
@@ -32,10 +37,10 @@ index 083f91171..387298927 100644
  };
 =20
 -#define SPA_POD_PARSER_INIT(buffer,size)  ((struct spa_pod_parser){ (bu=
ffer), (size), 0, {0} })
-+#define SPA_POD_PARSER_INIT(buffer,size)  ((struct spa_pod_parser){ (bu=
ffer), (size), 0, {} })
++#define SPA_POD_PARSER_INIT(buffer,size)  ((struct spa_pod_parser){ (bu=
ffer), (size), 0, {0,0,NULL}})
 =20
  static inline void spa_pod_parser_init(struct spa_pod_parser *parser,
  				       const void *data, uint32_t size)
 --=20
-2.46.0
+GitLab
=20
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.5.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.6.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.5.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.6.bb
index a02c5de8c..4ce047a2a 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.5.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.6.bb
@@ -12,9 +12,9 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "71fac7fa818f21234da4c356de0b44e47e1a2ef2"
+SRCREV =3D "79eebcb72490484e25208971ca15b9e0ea25bd95"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.2;protocol=3Dhttps"
-SRC_URI +=3D "file://0001-parser.h-avoid-missing-field-intializers.patch=
"
+SRC_URI +=3D "file://0ca64277b317b4836beccaa3248ab9055526811c.patch"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.47.0


