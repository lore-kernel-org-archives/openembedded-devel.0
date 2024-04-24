Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B40C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 18:04:03 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.3609.1713981840002310373
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 11:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout09.t-online.de (Postfix) with SMTP id A9E1047F71
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 20:02:14 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.39.163]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rzgwg-1UCKgb0; Wed, 24 Apr 2024 20:02:14 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] rygel: update 0.42.4 -> 0.42.5
Date: Wed, 24 Apr 2024 20:02:33 +0200
Message-ID: <20240424180233.64478-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713981734-73FFCED6-689A8121/0/0 CLEAN NORMAL
X-TOI-MSGID: b126b234-99f9-4afe-894c-b52cecf48386
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 18:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110139

- dont convert to systemd system service. rygel should be started as
  a user service. This is also a requirement  to get it working in
  gnome-control-center

- build with PACKAGECONFIG media-export to make rygel work out of the box

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../rygel/{rygel_0.42.4.bb =3D> rygel_0.42.5.bb}    | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.42.4.bb =3D> =
rygel_0.42.5.bb} (83%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb b=
/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.5.bb
similarity index 83%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_0.42.5.bb
index 4fbdce086..e79bd77a5 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.4.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.42.5.bb
@@ -20,7 +20,7 @@ inherit gnomebase features_check vala gobject-introspec=
tion gettext systemd
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be c=
onfigured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data x11"
=20
-SRC_URI[archive.sha256sum] =3D "6310dfaa2d332b66119b9b020fad6a4bd27d9bc6=
1faf780ca5ca0b62813303f7"
+SRC_URI[archive.sha256sum] =3D "1133602d2e6710aade6b22aa98d93384c8d56396=
f344763413e96e0110b7d89f"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
@@ -28,7 +28,7 @@ GIR_MESON_DISABLE_FLAG =3D 'disabled'
 EXTRA_OEMESON =3D "-Dengines=3Dgstreamer -Dplugins=3D${@strip_comma('${R=
YGEL_PLUGINS}')}"
 PACKAGECONFIG:append =3D "${@bb.utils.contains("DISTRO_FEATURES", "x11",=
 " gtk+3", "", d)}"
=20
-PACKAGECONFIG ?=3D "external mpris ruih gst-launch"
+PACKAGECONFIG ?=3D "external mpris ruih gst-launch media-export"
=20
 PACKAGECONFIG[external] =3D ""
 PACKAGECONFIG[mpris] =3D ""
@@ -60,16 +60,9 @@ do_install:append() {
        # Remove .la files for loadable modules
        rm -f ${D}/${libdir}/rygel-${LIBV}/engines/*.la
        rm -f ${D}/${libdir}/rygel-${LIBV}/plugins/*.la
-       if [ -e ${D}${nonarch_libdir}/systemd/user/rygel.service ]; then
-               mkdir -p ${D}${systemd_unitdir}/system
-               mv ${D}${nonarch_libdir}/systemd/user/rygel.service ${D}$=
{systemd_unitdir}/system
-               rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}/sy=
stemd/user \
-               ${D}${nonarch_libdir}/systemd \
-               ${D}${nonarch_libdir}
-       fi
 }
=20
-FILES:${PN} +=3D "${libdir}/rygel-${LIBV}/engines ${datadir}/dbus-1 ${da=
tadir}/icons"
+FILES:${PN} +=3D "${libdir}/rygel-${LIBV}/engines ${systemd_user_unitdir=
} ${datadir}/dbus-1 ${datadir}/icons"
 FILES:${PN}-dbg +=3D "${libdir}/rygel-${LIBV}/engines/.debug ${libdir}/r=
ygel-${LIBV}/plugins/.debug"
=20
 PACKAGES +=3D "${PN}-meta"
@@ -77,8 +70,6 @@ ALLOW_EMPTY:${PN}-meta =3D "1"
=20
 PACKAGES_DYNAMIC =3D "${PN}-plugin-*"
=20
-SYSTEMD_SERVICE:${PN} =3D "rygel.service"
-
 python populate_packages:prepend () {
     rygel_libdir =3D d.expand('${libdir}/rygel-${LIBV}')
     postinst =3D d.getVar('plugin_postinst')
--=20
2.44.0


