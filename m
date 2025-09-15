Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42730CAC593
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 04:26:34 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.24924.1757910384572059506
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Sep 2025 21:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id D85AE3846D
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 06:26:10 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.165.158]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uy0n2-0iOIVu0; Mon, 15 Sep 2025 06:26:08 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] wireplumber: update 0.5.10 -> 0.5.11
Date: Mon, 15 Sep 2025 06:26:01 +0200
Message-ID: <20250915042601.167754-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250915042601.167754-1-f_l_k@t-online.de>
References: <20250915042601.167754-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1757910368-2B7FD901-3ACC95E3/0/0 CLEAN NORMAL
X-TOI-MSGID: 33803da0-a6d4-4ec7-895b-812dab3d9627
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 04:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119400

WirePlumber 0.5.11
~~~~~~~~~~~~~~~~~~
Additions & Enhancements:

  - Added modem manager module for tracking voice call status and voice c=
all
    device profile selection hooks to improve phone call audio routing on
    mobile devices (!722, !729, #819)
  - Added MPRIS media player pause functionality that automatically pause=
s
    media playback when the audio target (e.g. headphones) is removed (!6=
99, #764)
  - Added support for human-readable names and localization of settings i=
n
    ``wireplumber.conf`` with ``wpctl`` displaying localized setting desc=
riptions (!712)
  - Improved default node selection logic to use both session and route
    priorities when nodes have equal session priorities (!720)
  - Increased USB device priority in the ALSA monitor (!719)

Fixes:

  - Fixed multiple Lua runtime issues including type confusion bugs, stac=
k
    overflow prevention, and SPA POD array/choice builders (!723, !728)
  - Fixed proxy object lifecycle management by properly clearing the
    OWNED_BY_PROXY flag when proxies are destroyed to prevent dangling
    pointers (!732)
  - Fixed state-routes handling to prevent saving unavailable routes and
    eliminate race conditions during profile switching (!730, #762)
  - Fixed some memory leaks in the script tester and the settings iterato=
r (!727, !726)
  - Fixed a potential crash caused by module-loopback destroying itself w=
hen the
    pipewire connection is closed (#812)
  - Fixed profile saving behavior in ``wpctl set-profile`` command (#808)
  - Fixed GObject introspection closure annotation

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wireplumber_0.5.10.bb =3D> wireplumber_0.5.11.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.1=
0.bb =3D> wireplumber_0.5.11.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.5.10.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5=
.11.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
5.10.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
11.bb
index 8e50378bfd..665efd95af 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.10.b=
b
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.11.b=
b
@@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "7a4d3177550b6b53fe0a49396da5b07f5353daff"
+SRCREV =3D "3a785e502642ddb1e91d953e587c7b06444e0b51"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps \
     file://90-OE-disable-session-dbus-dependent-features.lua \
--=20
2.50.1


