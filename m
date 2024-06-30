Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DD8C27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 12:46:26 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.24483.1719751585641829548
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 05:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id E30E02C8B3
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Jun 2024 14:46:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.39.138]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sNtwk-0hjsKA0; Sun, 30 Jun 2024 14:46:22 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] wireplumber: update 0.5.3 -> 0.5.5
Date: Sun, 30 Jun 2024 14:47:21 +0200
Message-ID: <20240630124721.64234-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240630124721.64234-1-f_l_k@t-online.de>
References: <20240630124721.64234-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1719751582-45395322-52D62A50/0/0 CLEAN NORMAL
X-TOI-MSGID: e51c7112-3d3d-42cf-a757-4bff73ef6422
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Jun 2024 12:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111165

WirePlumber 0.5.5
Highlights:

Hotfix release to address crashes in the Bluetooth HSP/HFP autoswitch
functionality that were side-effects of some changes that were part
of the role-based linking policy (#682)

Improvements:

wpctl will now properly show a '*' in front of sink filters when they are
selected as the default sink (!660)

Past releases

WirePlumber 0.5.4
Highlights:

Refactored the role-based linking policy (previously known also as
"endpoints" or "virtual items" policy) to blend in with the standard desk=
top
policy. It is now possible use role-based sinks alongside standard deskto=
p
audio operations and they will only be used for streams that have a
"media.role" defined. It is also possible to force streams to have a
media.role, using a setting. Other features include: blending with smart
filters in the graph and allowing hardware DSP nodes to be also used easi=
ly
instead of requiring software loopbacks for all roles. (#610, !649)

Improvements:

Filters that are not declared as smart will now behave again as normal
application streams, instead of being treated sometimes differently (!657=
)

Fixes:

Fixed an issue that would cause WirePlumber to crash at startup if an
empty configuration file was present in one of the search paths (#671)
Fixed Bluetooth profile auto-switching when a filter is permanently linke=
d
to the Bluetooth source (!650)
Fixed an issue in the software-dsp script that would cause DSP filters to
stay around and cause issues after their device node was destroyed (!651)
Fixed an issue in the autoswitch-bluetooth-profile script that could caus=
e
an infinite loop of switching between profiles (!652, #617)
Fixed a rare issue that could cause WirePlumber to crash when dealing wit=
h
a device object that didn't have the "device.name" property set (#674)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../wireplumber/{wireplumber_0.5.3.bb =3D> wireplumber_0.5.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.3=
.bb =3D> wireplumber_0.5.5.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.5.3.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
5.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
5.3.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
5.bb
index c52f22aad..437a71c23 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.3.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.5.bb
@@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "65e4ae83b994616401fc5859e00d5051b72518ba"
+SRCREV =3D "43e939c0e3c71ff0e6cc384cef901a50237f8144"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps \
     file://90-OE-disable-session-dbus-dependent-features.lua \
--=20
2.45.1


