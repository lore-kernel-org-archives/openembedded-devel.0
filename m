Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7793C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 11:40:40 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.35229.1733485233121017448
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Dec 2024 03:40:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout08.t-online.de (Postfix) with SMTP id 993BD65D
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Dec 2024 12:40:30 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.241]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tJWh9-166LyM0; Fri, 6 Dec 2024 12:40:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/3] wireplumber: update 0.5.6 -> 0.5.7
Date: Fri,  6 Dec 2024 12:40:25 +0100
Message-ID: <20241206114026.2441-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241206114026.2441-1-f_l_k@t-online.de>
References: <20241206114026.2441-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1733485227-44FF69EF-C6961BD0/0/0 CLEAN NORMAL
X-TOI-MSGID: d373cff1-5ec7-40f3-abdc-8a1fdeb62b3a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 11:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114220

WirePlumber 0.5.7
~~~~~~~~~~~~~~~~~

Highlights:

  - Fixed an issue that would cause random profile switching when an appl=
ication
    was trying to capture from non-Bluetooth devices (#715, #634, !669)

  - Fixed an issue that would cause strange profile selection issues [cho=
ices
    not being remembered or unavailable routes being selected] (#734)

  - Added a timer that delays switching Bluetooth headsets to the HSP/HFP
    profile, avoiding needless rapid switching when an application is try=
ing to
    probe device capabilities instead of actually capturing audio (!664)

  - Improved libcamera/v4l2 device deduplication logic to work with more =
complex
    devices (!674, !675, #689, #708)

Fixes:

  - Fixed two memory leaks in module-mixer-api and module-dbus-connection
    (!672, !673)

  - Fixed a crash that could occur in module-reserve-device (!680, #742)

  - Fixed an issue that would cause the warning "[string "alsa.lua"]:182:
    attempt to concatenate a nil value (local 'node_name')" to appear in =
the
    logs when an ALSA device was busy, breaking node name deduplication (=
!681)

  - Fixed an issue that could make find-preferred-profile.lua crash inste=
ad of
    properly applying profile priority rules (#751)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../wireplumber/{wireplumber_0.5.6.bb =3D> wireplumber_0.5.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.6=
.bb =3D> wireplumber_0.5.7.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.5.6.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
7.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
5.6.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
7.bb
index 7c308bd48..34a7ec0d8 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.6.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.7.bb
@@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "141b2d5d3f793e20f94421c554d8d9c51143ce0d"
+SRCREV =3D "3e7c87a84c30125717eaf8adb1aca3d4dedbb70e"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps \
     file://90-OE-disable-session-dbus-dependent-features.lua \
--=20
2.47.0


