Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A67C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 18:43:06 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.25695.1705430578831990583
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 10:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id 3EE73A90E
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 19:42:56 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.153]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rPoOm-1kjk3t0; Tue, 16 Jan 2024 19:42:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: update 1.0.0 -> 1.0.1
Date: Tue, 16 Jan 2024 19:42:50 +0100
Message-ID: <20240116184250.606557-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1705430576-577A9986-A8301A50/0/0 CLEAN NORMAL
X-TOI-MSGID: fa88ab0e-f0f3-44e4-843f-f56e0c7cb05d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 18:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108308

This is a bugfix release that is API and ABI compatible with previous
1.0.x releases.

  - Work around the buggy ALSA backend in libcanberra by forcing the puls=
e
    backend in module-x11-bell.
  - Fix a race in the device info updates in pulse-server.
  - Fix timing and rate matching in ALSA sequencer.
  - Improve timing information in JACK and from the ALSA driver.
  - More small fixes and improvements.

  - Fix a build issue when examples where disabled.
  - Avoid some compiler warnings.
  - Avoid some bitfield data races. (#3706)

  - Bump the PTP driver priority. (#3217)
  - Support the previous "allowed" permission in the access module.
  - Fix filename leak in module-filter-chain.
  - Work around the buggy ALSA backend in libcanberra by forcing the puls=
e
    backend in module-x11-bell. (#3688)
  - Fix a race in the device info updates in pulse-server.
  - Fix compatibility in RAOP. (#3698)

  - Handle ALSA picth control errors correctly
  - Clamp buffer-frames correctly. (#3000)
  - Fix timing and rate matching in ALSA sequencer. (#3657)
  - Revert a commit that could result in current time in the future in th=
e
    timing updates.
  - Improve adapter state checks.
  - Remove the timer from the ALSA pcm.
  - Fix timeout in freewheel driver.

  - Also handle active ports for monitor sources.
  - Fix zeroconf-publish format properties.

  - Improve timing and transport calculations.
  - Handle -ENOENT from the core and don't error out.

  - Handle node port removal in the device provider. (#3708)
  - Improve error handling while connecting.
  - Fix dts_offset.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.0.0.bb =3D> pipewire_1.0.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.0.0.bb =3D=
> pipewire_1.0.1.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.1.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.1.bb
index b4da781f0..a312594ad 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.1.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "4debdcd40b055b3eaa83a8f4443aa990ea566bfe"
-SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
+SRCREV =3D "79b98884af80329f59596906231da5597bcdb7b6"
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.0;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.43.0


