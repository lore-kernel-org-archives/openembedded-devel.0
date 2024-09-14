Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1FDC0218F
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 09:55:07 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.93023.1726307703576141654
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Sep 2024 02:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout01.t-online.de (Postfix) with SMTP id B07132A6D8
	for <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 11:55:01 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.195]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1spPUb-1PjyXB0; Sat, 14 Sep 2024 11:55:01 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] wireplumber: update 0.5.5. -> 0.5.6
Date: Sat, 14 Sep 2024 11:56:39 +0200
Message-ID: <20240914095639.1772369-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726307701-4E7FB83E-2B72F869/0/0 CLEAN NORMAL
X-TOI-MSGID: 84724380-d0f2-4f1e-8fc3-23e447a147aa
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 09:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112284

WirePlumber 0.5.6
~~~~~~~~~~~~~~~~~

Additions:

  - Implemented before/after dependencies for components, to ensure corre=
ct
    load order in custom configurations (#600)

  - Implemented profile inheritance in the configuration file. This allow=
s
    profiles to inherit all the feature specifications of other profiles,=
 which
    is useful to avoid copying long lists of features just to make small =
changes

  - Added multi-instance configuration profiles, tested and documented th=
em

  - Added a ``main-systemwide`` profile, which is now the default for ins=
tances
    started via the system-wide systemd service and disables features tha=
t
    depend on the user session (#608)

  - Added a ``wp_core_connect_fd`` method, which allows making a connecti=
on to
    PipeWire via an existing open socket (useful for portal-based connect=
ions)

Fixes:

  - The Bluetooth auto-switch script now uses the common event source obj=
ect
    managers, which should improve its stability (!663)

  - Fix an issue where switching between Bluetooth profiles would tempora=
rily
    link active audio streams to the internal speakers (!655)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../wireplumber/{wireplumber_0.5.5.bb =3D> wireplumber_0.5.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.5=
.bb =3D> wireplumber_0.5.6.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.5.5.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
6.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
5.5.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
6.bb
index 437a71c23..7c308bd48 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.5.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.6.bb
@@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "43e939c0e3c71ff0e6cc384cef901a50237f8144"
+SRCREV =3D "141b2d5d3f793e20f94421c554d8d9c51143ce0d"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps \
     file://90-OE-disable-session-dbus-dependent-features.lua \
--=20
2.46.0


