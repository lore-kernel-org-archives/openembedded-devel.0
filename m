Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74C6C28B2E
	for <webhook@archiver.kernel.org>; Sun,  9 Mar 2025 07:57:48 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.11774.1741507063949021190
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Mar 2025 23:57:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout07.t-online.de (Postfix) with SMTP id E8F30418
	for <openembedded-devel@lists.openembedded.org>; Sun,  9 Mar 2025 08:57:41 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.73]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1trBXU-2PgNZi0; Sun, 9 Mar 2025 08:57:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] wireplumber: update 0.5.7 -> 0.5.8
Date: Sun,  9 Mar 2025 08:58:10 +0100
Message-ID: <20250309075810.552098-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309075810.552098-1-f_l_k@t-online.de>
References: <20250309075810.552098-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741507056-10FF6970-9788048B/0/0 CLEAN NORMAL
X-TOI-MSGID: 4973f834-4839-4ea8-bd64-c526bf84ab43
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Mar 2025 07:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115813

WirePlumber 0.5.8
~~~~~~~~~~~~~~~~~

Additions & Enhancements:

  - Added support for handling UCM SplitPCM nodes in the ALSA monitor, wh=
ich
    allows native PipeWire channel remapping using loopbacks for devices =
that
    use this feature (!685)

  - Introduced new functions to mark WpSpaDevice child objects as pending=
.
    This allows properly associating asynchronously created loopback node=
s with
    their parent WpSpaDevice without losing ObjectConfig events (!687, !6=
89)

  - Improved the node name deduplication logic in the ALSA monitor to pre=
vent
    node names with .2, .3, etc appended to them in some more cases (!688=
)

  - Added a new script to populate ``session.services``. This is a step t=
owards
    implementing detection of features that PipeWire can service (!686)

Fixes:

  - Fixed an issue that was causing duplicate Bluetooth SCO (HSP/HFP) sou=
rce
    nodes to be shown in UIs (#701, !683)

  - In the BlueZ monitor, marked the source loopback node as non-virtual,
    addressing how it appears on UIs (#729)

  - Disabled stream-restore for device loopback nodes to prevent unwanted
    property changes (!691)

  - Fixed ``wp_lua_log_topic_copy()`` to correctly copy topic names (#757=
)

  - Updated script tests to handle differences in object identifiers
    (``object.serial`` vs ``node.id``), ensuring proper test behavior (#7=
61)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../wireplumber/{wireplumber_0.5.7.bb =3D> wireplumber_0.5.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.7=
.bb =3D> wireplumber_0.5.8.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.5.7.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
8.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
5.7.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
8.bb
index 34a7ec0d82..33efea2e40 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.7.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.8.bb
@@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "3e7c87a84c30125717eaf8adb1aca3d4dedbb70e"
+SRCREV =3D "ac69acb3c2b7dc6d91776d5582dd0b2703bb71eb"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps \
     file://90-OE-disable-session-dbus-dependent-features.lua \
--=20
2.48.1


