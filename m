Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AE2F5A8B8
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 19:44:46 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2388.1776714277359397683
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 12:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=P7ixZYoi;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd92.mgt.mul.t-online.de (fwd92.aul.t-online.de [10.223.144.118])
	by mailout02.t-online.de (Postfix) with SMTP id 2AA6BF017
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 21:44:35 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.160.240]) by fwd92.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wEqOx-43mTQH0; Mon, 20 Apr 2026 17:19:07 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] wireplumber: update 0.5.13 -> 0.5.14
Date: Mon, 20 Apr 2026 17:19:01 +0200
Message-ID: <20260420151901.162911-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1776698347-44FF6A8C-6F4A2133/0/0 CLEAN NORMAL
X-TOI-MSGID: c2424630-d234-4dc5-95f4-3d7cc732f8a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1776714275; i=f_l_k@t-online.de;
	bh=U/LlNrF6nI5MTEALr7go9CXcwvv35JCgTg0m2YP4jJ0=;
	h=From:To:Subject:Date;
	b=P7ixZYoiGKEZuIhNOtc+fQK1lAnHREZ0c3D5jdBHozXt3rSc21jPMr/nZ8SaNqSj3
	 bjpsgTMj3TMsJkrYl7/W7ci4wKpte3DPUP6FBfRE9MTbkHe0wTb0iLdkmTUc/gOxui
	 o95E7OzCm09mC2NgoZ3Nxhwyt6uJugCJ66z0LelY7WzjZWQFWYnSiH90uk+ZwaVyxg
	 2sCKo6ILD6DV2Yy306HVBwxabxRiju056pCb7tuPkPdTvLHBKvFOuHxw6m8mwAitb1
	 BiF9CBSvAycqyT/MBUYsNaSDlITYPM0uC2cq5ricu+04LiwseZjKtM7iz4YyyRT/hf
	 EarV3yr8IV3Tg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 19:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126521

WirePlumber 0.5.14
~~~~~~~~~~~~~~~~~~

Additions & Enhancements:

  - Added per-device default volume configuration via the
    ``device.routes.default-{source,sink}-volume`` property, allowing dev=
ice-specific volume
    defaults (e.g. a comfortable default for internal speakers or no atte=
nuation for HDMI) (!772)

  - Added Lua 5.5 support; the bundled Lua subproject wrap has also been =
updated to 5.5.0
    (!775, !788)

  - Enhanced libcamera monitor to load camera nodes locally within the Wi=
rePlumber
    process instead of the PipeWire daemon, eliminating race conditions t=
hat could occur
    during initial enumeration and hotplug events (!790)

  - Enhanced Bluetooth loopback nodes to always be created when a device =
supports both
    A2DP and HSP/HFP profiles, simplifying the logic and making the BT pr=
ofile autoswitch
    setting take effect immediately without requiring device reconnection=
 (!782)

  - Enhanced Bluetooth loopback nodes to use ``target.object`` property i=
nstead of smart
    filters, fixing issues that prevented users from setting them as defa=
ult nodes and
    also allowing smart filters to be used with them (#898; !792)

  - Enhanced Bluetooth profile autoswitch logic with further robustness i=
mprovements,
    including better headset profile detection using profile name pattern=
s and resolving
    race conditions by running profile switching after ``device/apply-pro=
file`` in a
    dedicated event hook (#926, #923; !776, !777, !808)

  - Enhanced wpctl ``set-default`` command to accept virtual nodes (e.g.
    ``Audio/Source/Virtual``) in addition to regular device nodes (#896; =
!787)

  - Improved stream linking to make the full graph rescan optional when l=
inkable items
    change, saving CPU on low-end systems and reducing audio startup late=
ncy when
    connecting multiple streams in quick succession (!800)

  - Allowed installation of systemd service units without libsystemd bein=
g present,
    useful for distributions like Alpine Linux that allow systemd service=
 subpackages
    (!793)

  - Allowed the ``mincore`` syscall in the WirePlumber systemd sandbox, r=
equired for
    Mesa/EGL (e.g. for the libcamera GPUISP pipeline)

  - Allowed passing ``WIREPLUMBER_CONFIG_DIR`` via the ``wp-uninstalled``=
 script,
    useful for passing additional configuration paths in an uninstalled e=
nvironment (!801)

Fixes:

  - Removed Bluetooth sink loopback node, which was causing issues with K=
DE and GNOME (!794)

  - Fixed default audio source selection to never automatically use ``Aud=
io/Sink`` nodes
    as the default source unless explicitly selected by the user (#886; !=
781)

  - Fixed crash in ``state-stream`` when the Format parameter has a Choic=
e for the
    number of channels (#903; !795)

  - Fixed BAP Bluetooth device set channel properties, where ``audio.posi=
tion`` was
    incorrectly serialized as a pointer address instead of the channel ar=
ray (!786)

  - Fixed memory leaks in ``wp_interest_event_hook_get_matching_event_typ=
es`` and in
    the Lua ``LocalModule()`` implementation (!784, !810)

  - Fixed HFP HF stream media class being incorrectly assigned due to
    ``api.bluez5.internal=3Dtrue`` being set on HFP HF streams (!809)

  - Fixed Lua 5.4 compatibility in ``state-stream`` script

  - Updated translations: Bulgarian, Georgian, Kazakh, Swedish

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wireplumber_0.5.13.bb =3D> wireplumber_0.5.14.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.1=
3.bb =3D> wireplumber_0.5.14.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.5.13.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5=
.14.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
5.13.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
14.bb
index abd54515ca..ad05a8bc87 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.13.b=
b
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.14.b=
b
@@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "84429b47943d789389fbde17c06b82efb197d04e"
+SRCREV =3D "07e730b279ac7a520699ae9f6b0797848a731b30"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps;tag=3D${PV} \
     file://run-ptest \
--=20
2.53.0


