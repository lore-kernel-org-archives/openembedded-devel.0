Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C895C4332F
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 06:14:48 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.131302.1672035286311452521
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 22:14:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 867CA25BB5
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 07:14:43 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.166]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p9gkt-15YWxN0; Mon, 26 Dec 2022 07:14:35 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] wireplumber: update 0.4.12 -> 0.4.13
Date: Mon, 26 Dec 2022 07:14:24 +0100
Message-Id: <20221226061424.206203-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672035275-3C882535-A8436CC8/0/0 CLEAN NORMAL
X-TOI-MSGID: 7d76124a-4d94-4d81-9add-e1cb95167b42
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 06:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100240

- add PACKAGECONFIG option to enable dbus support

Release 0.4.13

Additions:

    Added bluetooth SCO (HSP/HFP) hardware offload support, together with=
 an example script that enables this functionality on the PinePhone
    Encoded audio (mp3, aac, etc...) can now be passed through, if this m=
ode is supported by both the application and the device
    The v4l2 monitor now also respects the node.disabled and device.disab=
led properties inside rules
    Added "Firefox Developer Edition" to the list of apps that are allowe=
d to trigger a bluetooth profile auto-switch (#381)
    Added support in the portal access script to allow newly plugged came=
ras to be immediately visible to the portal apps

Fixes:

    Worked around an issue that would prevent streams from properly linki=
ng when using effects software like EasyEffects and JamesDSP (!450)
    Fixed destroying pavucontrol-qt monitor streams after the node that w=
as being monitored is destroyed (#388)
    Fixed a crash in the alsa.lua monitor that could happen when a disabl=
ed device was removed and re-added (#361)
    Fixed a rare crash in the metadata object (#382)
    Fixed a bug where a restored node target would override the node targ=
et set by the application on the node's properties (#335)

Packaging:

    Added build options to compile wireplumber's library, daemon and tool=
s independently
    Added a build option to disable unit tests that require the dbus daem=
on
    Stopped using fakesink/fakesrc in the unit tests to be able to run th=
em on default pipewire installations. Compiling the spa test plugin is no=
 longer necessary
    Added pkg-config and header information in the gir file

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...plumber_0.4.12.bb =3D> wireplumber_0.4.13.bb} | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.4.1=
2.bb =3D> wireplumber_0.4.13.bb} (90%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.4.12.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4=
.13.bb
similarity index 90%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
4.12.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.=
13.bb
index d80d9348a..5277626fa 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.12.b=
b
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.13.b=
b
@@ -11,10 +11,11 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "6f6e5df9c1b223907efa8dcbfcd538821d0dabc4"
-SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/wireplumber.git;branc=
h=3Dmaster;protocol=3Dhttps \
-           file://90-OE-disable-session-dbus-dependent-features.lua \
-           "
+SRCREV =3D "7cb1b8b92e96ebd1b7e632cda32715fed713d333"
+SRC_URI =3D " \
+    git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps \
+    file://90-OE-disable-session-dbus-dependent-features.lua \
+"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -45,18 +46,19 @@ PACKAGECONFIG[systemd-system-service] =3D "-Dsystemd-=
system-service=3Dtrue,-Dsystemd
 # files to rootfs but not enable them as systemd.bbclass
 # currently lacks the feature of enabling user services.
 PACKAGECONFIG[systemd-user-service] =3D "-Dsystemd-user-service=3Dtrue,-=
Dsystemd-user-service=3Dfalse,systemd"
+PACKAGECONFIG[dbus] =3D ""
=20
 PACKAGESPLITFUNCS:prepend =3D " split_dynamic_packages "
 PACKAGESPLITFUNCS:append =3D " set_dynamic_metapkg_rdepends "
=20
 WP_MODULE_SUBDIR =3D "wireplumber-0.4"
=20
-add_custom_lua_config_scripts() {
-    install -m 0644 ${WORKDIR}/90-OE-disable-session-dbus-dependent-feat=
ures.lua ${D}${datadir}/wireplumber/main.lua.d
+do_install:append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'false', 'true', d)=
}; then
+        install -m 0644 ${WORKDIR}/90-OE-disable-session-dbus-dependent-=
features.lua ${D}${datadir}/wireplumber/main.lua.d
+    fi
 }
=20
-do_install[postfuncs] +=3D "add_custom_lua_config_scripts"
-
 python split_dynamic_packages () {
     # Create packages for each WirePlumber module.
     wp_module_libdir =3D d.expand('${libdir}/${WP_MODULE_SUBDIR}')
--=20
2.34.1


