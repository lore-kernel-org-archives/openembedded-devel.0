Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1529C10DCE
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 19:01:19 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.41748.1701889276808244532
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 11:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout12.t-online.de (Postfix) with SMTP id 958F719366
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Dec 2023 20:00:30 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.172.74]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rAx8I-057sXJ0; Wed, 6 Dec 2023 20:00:30 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] wireplumber: update 0.4.15 -> 0.4.17
Date: Wed,  6 Dec 2023 20:01:08 +0100
Message-ID: <20231206190108.60409-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1701889230-FE303990-671A2B99/0/0 CLEAN NORMAL
X-TOI-MSGID: 79d79772-ac0e-47c4-bba8-c1518edd4f07
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 19:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107264

WirePlumber 0.4.17

Fixes:
Fixed a reference counting issue in the object managers that could cause
crashes due to memory corruption (#534)
Fixed an issue with filters linking to wrong targets, often with two sets
of links (#536)
Fixed a crash in the endpoints policy that would show up when log message=
s
were enabled at level 3 or higher

WirePlumber 0.4.16

Additions:
Added a new "sm-objects" script that allows loading objects on demand
via metadata entries that describe the object to load; this can be used t=
o
load pipewire modules, such as filters or network sources/sinks, on deman=
d
Added a mechanism to override device profile priorities in the configurat=
ion,
mainly as a way to re-prioritize Bluetooth codecs, but this also can be u=
sed
for other devices
Added a mechanism in the endpoints policy to allow connecting filters
between a certain endpoint's virtual sink and the device sink; this is
specifically intended to allow plugging a filter-chain to act as equalize=
r
on the Multimedia endpoint
Added wp_core_get_own_bound_id() method in WpCore

Changes:
PipeWire 0.3.68 is now required
policy-dsp now has the ability to hide hardware nodes behind the DSP sink
to prevent hardware misuse or damage
JSON parsing in Lua now allows keys inside objects to be without quotes
Added optional argument in the Lua JSON parse() method to limit recursion=
s,
making it possible to partially parse a JSON object
It is now possible to pass nil in Lua object constructors that expect an
optional properties object; previously, omitting the argument was the onl=
y
way to skip the properties
The endpoints policy now marks the endpoint nodes as "passive" instead of
marking their links, adjusting for the behavior change in PipeWire 0.3.68
Removed the "passive" property from si-standard-link, since only nodes ar=
e
marked as passive now

Fixes:
Fixed the wpctl clear-default command to completely clear all the
default nodes state instead of only the last set default
Reduced the amount of globals that initially match the interest in the
object manager
Used an idle callback instead of pw_core_sync() in the object manager to
expose tmp globals

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wireplumber_0.4.15.bb =3D> wireplumber_0.4.17.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.4.1=
5.bb =3D> wireplumber_0.4.17.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.4.15.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4=
.17.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
4.15.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.=
17.bb
index 5a180d1e0..3959cd7f8 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.15.b=
b
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.17.b=
b
@@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "d67b48e595cb4612fd7fd47f97df6b8883ef7f60"
+SRCREV =3D "d3eb77b292655cef333a8f4cab4e861415bc37c2"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps \
     file://90-OE-disable-session-dbus-dependent-features.lua \
--=20
2.42.1


