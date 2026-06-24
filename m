Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FD8CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 14:49:49 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9093.1782312580043081084
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 07:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=sy08sjzA;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd92.aul.t-online.de (fwd92.aul.t-online.de [10.223.144.118])
	by mailout03.t-online.de (Postfix) with SMTP id A8EDBE039
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 16:49:29 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.171.242]) by fwd92.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wcOuu-2PqYNt0; Wed, 24 Jun 2026 16:49:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] wireplumber: update 0.5.14 -> 0.5.15
Date: Wed, 24 Jun 2026 16:49:21 +0200
Message-ID: <20260624144922.2404303-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782312568-0EFFB46A-B3A0AEEA/0/0 CLEAN NORMAL
X-TOI-MSGID: aec584c2-3dfc-4512-81ce-50cdb820eda7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782312569; i=f_l_k@t-online.de;
	bh=LDoVIC1KvzHMF2L45bMk/K8vu73o36OYZn+3lFcpQco=;
	h=From:To:Subject:Date;
	b=sy08sjzAbTKL0ARfEeIzpIrxMY81m05BhjTCPdo49WcxCeBbUBtonqFmDLydP2JW0
	 UKNpzNv+ZTpmQi+4E3fZ4ulqSZPn5TxmHVD9WSdeBwZwOa9upbaAcgU3g9Cw8dp6Xa
	 PnNlGuwQrHuBrT0Ad551PdeVx/yL4tp11djw1YWp7nKQ7wuXK9QgjUdB7lUTXHObLG
	 kGFySkMp4oIJ4xOGdhmOLsvSfxUNrKNRotimOHUKDrQoW84aPkFtFGZgvZ4bmUMwQz
	 SxDKUQRZPbkLRTqlpuyqc7lNmHOlrfqFKzhFmqwIw+Z7zXKqG+Q20q7w4WauWrE7Yo
	 T+IFoPcqp644g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 14:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127719

WirePlumber 0.5.15
Additions & Enhancements:

Added new WpPermissionManager API that centralizes access control for cli=
ents, with support for attaching permission managers to clients from Lua =
scripts; the client access scripts have been completely refactored to use=
 the new API with a select-access event and a priority fallback mechanism=
: configuration, flatpak, snap, portal, and default (!797, !822, !825)
Added new WpStateMetadata class that mirrors the persistent state into a =
PipeWire metadata object, allowing users to clear or change saved device =
profiles at runtime using pw-metadata (!818)
Added set_param(), enum_params_sync() and params-changed signal to WpSpaD=
evice, and an event signal for SPA device events, allowing monitors to di=
rectly interact with SPA devices and react to profile changes without goi=
ng through the global WpDevice object (!835, !842)
Added list subcommand to wpctl for displaying PipeWire objects in a scrip=
t-friendly format, with bash completions (!805, !823)
Added reset command to wpctl to reset the state of WirePlumber and PipeWi=
re to installation defaults (!848, !849)
Enhanced wpctl to connect to the manager socket when available, giving th=
e tool unrestricted access to the PipeWire graph (!814)
Added new bluetooth.profile-preference setting to find-preferred-profile =
for selecting quality or latency A2DP profiles (!819)
Added a cache for camera permission checks in the portal access module to=
 avoid frequent D-Bus calls; also added a 3-second timeout and fixed the =
Set create parameter in portal-permissionstore (!820, !821)
Fixes:

Fixed wpctl set-volume by PID to apply the same volume level to all match=
ing nodes (#944; !829)
Fixed portal clients to be un-gated immediately after permission setup, p=
reventing them from remaining blocked (#941; !826)
Fixed ALSA monitor to set the device profile to Off and restore it when a=
 node enters an error state, forcing a close/reopen of the device to reco=
ver from broken ALSA device states (!837)
Fixed voice call profile selection to not skip profiles with unknown avai=
lability (!834)
Fixed memory leak in Lua scripting by only holding a strong reference of =
the Lua state when a script is activated, preventing leaked proxy warning=
 messages on core disconnect (!844)
Fixed state-stream to only use the media.role key when its value is Notif=
ication when forming the stream state lookup key (!845)
Fixed pw-obj-mixin to apply the active filter when enumerating cached par=
ams and to deduplicate subscribed param IDs (!839, !840)
Fixed m-lua-scripting to validate Bool values in Pod.Choice.Enum (!841)
Fixed shutdown sequence to properly deactivate all objects and plugins be=
fore teardown (#881; !833)
Fixed Bluetooth to not set bluez5.autoswitch-routes on BT devices (!811)
Fixed null pointer dereference in permission-manager (!812)
Fixed module destructor ordering to call the parent destructor before fin=
alizing internal state (!813)
Fixed nil value when logging in state-profile (!815)
Fixed gobject-introspection issue on spa-pod to correctly generate Python=
 bindings (!828)
Updated translations: Chinese, Serbian, Serbian Latin

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wireplumber_0.5.14.bb =3D> wireplumber_0.5.15.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.1=
4.bb =3D> wireplumber_0.5.15.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.5.14.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5=
.15.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
5.14.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
15.bb
index ad05a8bc87..9f7092dfa9 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.14.b=
b
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.15.b=
b
@@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "07e730b279ac7a520699ae9f6b0797848a731b30"
+SRCREV =3D "bc4fa8f5e84806f86530c97cb35283eecc3ec081"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps;tag=3D${PV} \
     file://run-ptest \
--=20
2.54.0


