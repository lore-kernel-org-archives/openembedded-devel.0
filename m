Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F7BC41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 14:28:25 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.21079.1716301698594580115
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 07:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout08.t-online.de (Postfix) with SMTP id DDFC1157F9
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 16:28:16 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.175.137]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s9QTO-1WPY5i0; Tue, 21 May 2024 16:28:14 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] wireplumber: update 0.5.1 -> 0.5.2
Date: Tue, 21 May 2024 16:28:44 +0200
Message-ID: <20240521142844.3101250-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521142844.3101250-1-f_l_k@t-online.de>
References: <20240521142844.3101250-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716301694-977FDED6-03F8B250/0/0 CLEAN NORMAL
X-TOI-MSGID: edf4723f-10c4-47de-b613-ad7b51d34632
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 14:28:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110445

WirePlumber 0.5.2
~~~~~~~~~~~~~~~~~

Highlights:

  - Added support for loading configuration files other than the default
    wireplumber.conf within Lua scripts (!629)

  - Added support for loading single-section configuration files, without
    fragments (!629)

  - Updated the node.software-dsp script to be able to load filter-chain =
graphs
    from external configuration files, which is needed for Asahi Linux au=
dio
    DSP configuration (!629)

Fixes:

  - Fixed destroying camera nodes when the camera device is removed (#627=
, !631)

  - Fixed an issue with Bluetooth BAP device set naming (!632)

  - Fixed an issue caused by the pipewire event loop not being "entered" =
as
    expected (!634, #638)

  - A false positive warning about no modules being loaded is now suppres=
sed
    when using libpipewire >=3D 1.0.5 (#620)

  - Default nodes can now be selected using priority.driver when
    priority.session is not set (#642)

Changes:

  - The library version is now generated following pipewire's versioning =
scheme:
    libwireplumber-0.5.so.0.5.2 becomes libwireplumber-0.5.so.0.0502.0 (!=
633)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../wireplumber/{wireplumber_0.5.1.bb =3D> wireplumber_0.5.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.1=
.bb =3D> wireplumber_0.5.2.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.5.1.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
2.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
5.1.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
2.bb
index 9115076a2..c6f46eb55 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.1.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.2.bb
@@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "961450b2ac700e8c9c85a0beb2426b875fa08bff"
+SRCREV =3D "b302ebd6ab66fd538191d22db4ebe02bcef87a91"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps \
     file://90-OE-disable-session-dbus-dependent-features.lua \
--=20
2.44.0


