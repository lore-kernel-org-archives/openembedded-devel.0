Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F4CCDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:51:23 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.19288.1697133075175553203
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 10:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout10.t-online.de (Postfix) with SMTP id 6FD854AAC4
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 19:50:56 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.39.41]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qqzpn-3LLyW90; Thu, 12 Oct 2023 19:50:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] wireplumber: Upgrade 0.4.14 -> 0.4.15
Date: Thu, 12 Oct 2023 19:51:01 +0200
Message-ID: <20231012175101.23379-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1697133055-DEFFADE8-B64C26E4/0/0 CLEAN NORMAL
X-TOI-MSGID: 0b8d3273-86d8-4285-9f2f-03e8d722109e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 17:51:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105458

Additions:

  - A new "DSP policy" module has been added; its purpose is to automatic=
ally
    load a filter-chain when a certain hardware device is present, so tha=
t
    audio always goes through this software DSP before reaching the devic=
e.
    This is mainly to support Apple M1/M2 devices, which require a softwa=
re
    DSP to be always present

  - WpImplModule now supports loading module arguments directly from a SP=
A-JSON
    config file; this is mainly to support DSP configuration for Apple M1=
/M2
    and will likely be reworked for 0.5

  - Added support for automatically combining Bluetooth LE Audio device s=
ets
    (e.g. pairs of earbuds) (!500)

  - Added command line options in ``wpctl`` to display device/node names =
and
    nicknames instead of descriptions

  - Added zsh completions file for ``wpctl``

  - The device profile selection policy now respects the ``device.profile=
``
    property if it is set on the device; this is useful to hand-pick a pr=
ofile
    based on static configuration rules (alsa_monitor.rules)

Changes/Fixes:

  - Linking policy now sends an error to the client before destroying the=
 node,
    if it determines that the node cannot be linked to any target; this f=
ixes
    error reporting on the client side

  - Fixed a crash in suspend-node that could happen when destroying virtu=
al
    sinks that were loaded from another process such as pw-loopback (#467=
)

  - Virtual machine default period size has been bumped to 1024 (#507)

  - Updated bluez5 default configuration, using ``bluez5.roles`` instead =
of
    ``bluez5.headset-roles`` now (!498)

  - Disabled Bluetooth autoconnect by default (!514)

  - Removed ``RestrictNamespaces`` option from the systemd services in or=
der to
    allow libcamera to load sandboxed IPA modules (#466)

  - Fixed a JSON encoding bug with empty strings (#471)

  - Lua code can now parse strings without quotes from SPA-JSON

  - Added some missing `\since` annotations and made them show up in the
    generated gobject-introspection file, to help bindings generators

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wireplumber_0.4.14.bb =3D> wireplumber_0.4.15.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.4.1=
4.bb =3D> wireplumber_0.4.15.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.4.14.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4=
.15.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
4.14.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.=
15.bb
index 6f93b443d..679921922 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.14.b=
b
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.15.b=
b
@@ -11,7 +11,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "6d0c7f7b7f484b3cd2aaf2e2b3cc902c095b4946"
+SRCREV =3D "d67b48e595cb4612fd7fd47f97df6b8883ef7f60"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps \
     file://90-OE-disable-session-dbus-dependent-features.lua \
@@ -133,7 +133,7 @@ CONFFILES:${PN} +=3D " \
 # itself to become a daemon, in practice, the PipeWire daemon is used.
 RRECOMMENDS:${PN} +=3D "pipewire ${PN}-scripts ${PN}-modules-meta"
=20
-FILES:${PN} +=3D "${systemd_user_unitdir} ${systemd_system_unitdir}"
+FILES:${PN} +=3D "${systemd_user_unitdir} ${systemd_system_unitdir} ${da=
tadir}/zsh"
=20
 FILES:libwireplumber =3D " \
     ${libdir}/libwireplumber-*.so.* \
--=20
2.42.0


