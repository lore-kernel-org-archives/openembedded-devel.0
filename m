Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6785DC87FC9
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 11:43:34 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.5096.1754135010497530598
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Aug 2025 04:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout05.t-online.de (Postfix) with SMTP id 6F4593BB
	for <openembedded-devel@lists.openembedded.org>; Sat,  2 Aug 2025 13:43:28 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.51]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uiAe5-1hbsa90; Sat, 2 Aug 2025 13:43:25 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.4.6 -> 1.4.7
Date: Sat,  2 Aug 2025 13:43:19 +0200
Message-ID: <20250802114319.37532-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1754135005-677FC48C-A98477CD/0/0 CLEAN NORMAL
X-TOI-MSGID: 9db27110-b392-44f7-bf0d-036c02cf5b27
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Aug 2025 11:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118830

PipeWire 1.4.7 (2025-07-23)

This is a bugfix release that is API and ABI compatible with
previous 1.x releases.

Highlights
  - Improve latency handling in echo-cancel.
  - Don't leak SyncObj fds in client-node.
  - Improve the adaptive resampler performance.
  - Some more fixes and improvements.

modules
  - Set module-echo-cancel latency correctly.
  - Avoid extra latency in echo-cancel by dropping samples when
    one end is paused.
  - Don't leak SyncObj fds in client-node. (#4807)

SPA
  - Actually enable echo cancellation when using webrtc 2.0
  - Improve ALSA driver resampling setup and follower adaptive
    resampling.
  - Fix an off-by-one in the delay filter.
  - Improve the adaptive resampler performance.

bluetooth
  - Improve compatibility with some JBL flip and change models.

GStreamer
  - Add some format validations.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.4.6.bb =3D> pipewire_1.4.7.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.6.bb =3D=
> pipewire_1.4.7.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.6.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.7.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.6.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.7.bb
index 34415c4444..31b6af503f 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.6.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.7.bb
@@ -12,9 +12,9 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "83a155d0c09d703bdc95ed4558277784e9751bd3"
+SRCREV =3D "1c542e9a0ca4226c9befb08fe9c19170aca3ce95"
 BRANCH =3D "${@oe.utils.trim_version('${PV}', 2)}"
-SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps"
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
${BRANCH};protocol=3Dhttps;tag=3D${PV}"
=20
=20
 inherit meson pkgconfig systemd gettext useradd
--=20
2.50.1


