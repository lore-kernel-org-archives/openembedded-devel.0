Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956C8C5B542
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:48:40 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.24224.1748245715926542540
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 May 2025 00:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout03.t-online.de (Postfix) with SMTP id 7C28648E
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 09:48:29 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.109]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uJSZN-0cP4UM0; Mon, 26 May 2025 09:48:25 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] wireplumber: update 0.5.8 -> 0.5.10
Date: Mon, 26 May 2025 09:48:18 +0200
Message-ID: <20250526074818.43887-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526074818.43887-1-f_l_k@t-online.de>
References: <20250526074818.43887-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1748245705-B17F8541-BF1BF786/0/0 CLEAN NORMAL
X-TOI-MSGID: 35bf2856-485c-4075-9992-c22a7bb73c42
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 07:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117623

WirePlumber 0.5.10

Fixed a critical crash in linking-utils.haveAvailableRoutes that was
introduced accidentally in 0.5.9 and caused loss of audio output on affec=
ted
systems (#797, #799, #800, !713)

WirePlumber 0.5.9

Added a new audio node grouping functionality using an external command l=
ine
tool (!646)
The libcamera monitor now supports devices that are not associated with
device ids (!701)
The wireplumber user systemd service is now associated with dbus.service =
to
avoid strange warnings when dbus exits (!702)
Added "SYSLOG_IDENTIFIER", "SYSLOG_FACILITY", "SYSLOG_PID" and "TID" to l=
og
messages that are sent to the journal (!709)

Fixes:

Fixed a crash of wpctl set-default on 32-bit architectures (#773)
Fixed a crash when a configuration component had no 'provides' field (#77=
1)
Reduced the log level of some messages that didn't need to be as high (!6=
95)
Fixed another nil reference issue in the alsa.lua monitor script (!704)
Fixed name deduplication of v4l2 and libcamera devices (!705)
Fixed an issue with wpctl not being able to save settings sometimes (!708=
, #749)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../wireplumber/{wireplumber_0.5.8.bb =3D> wireplumber_0.5.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.8=
.bb =3D> wireplumber_0.5.10.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.5.8.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
10.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
5.8.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
10.bb
index 33efea2e40..9140b724d1 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.8.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.10.b=
b
@@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "ac69acb3c2b7dc6d91776d5582dd0b2703bb71eb"
+SRCREV =3D "7a4d3177550b6b53fe0a49396da5b07f5353daff"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps \
     file://90-OE-disable-session-dbus-dependent-features.lua \
--=20
2.49.0


