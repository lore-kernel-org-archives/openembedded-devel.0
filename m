Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F5AC6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:27:32 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.191124.1673940450803616923
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout01.t-online.de (Postfix) with SMTP id 233C1168E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 08:27:27 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.203]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pHgNS-0F4OBd0; Tue, 17 Jan 2023 08:27:26 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gnome-control-center: add recipe
Date: Tue, 17 Jan 2023 08:27:16 +0100
Message-Id: <20230117072716.63391-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673940446-10F95992-6280F822/0/0 CLEAN NORMAL
X-TOI-MSGID: bcc6fa9c-8349-43a5-91c8-0f9192235399
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100630

Add a recipe for gnome-remote-desktop and a corresponding PACKAGECONFIG f=
or
gnome-control-center from where it can be enabled/disabled, if available.

It is not enabled by default because it has a dependency on tpm2-tss and =
thus
adds a layer dependency on meta-security/meta-tpm.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-control-center_43.2.bb              |  1 +
 .../gnome-remote-desktop_43.3.bb              | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-r=
emote-desktop_43.3.bb

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_43.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_43.2.bb
index 830f3ec68..16a400c5c 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
43.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
43.2.bb
@@ -42,6 +42,7 @@ SRC_URI[archive.sha256sum] =3D "d7f256aba80a92c727b329f=
d01c8602da4b78f0fddaec93fcd
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland=
"
+PACKAGECONFIG[remote-desktop] =3D ",,,gnome-remote-desktop"
=20
 EXTRA_OEMESON =3D " \
     -Doe_sysroot=3D${STAGING_DIR_HOST} \
diff --git a/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-d=
esktop_43.3.bb b/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remo=
te-desktop_43.3.bb
new file mode 100644
index 000000000..5d1a85d5f
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_=
43.3.bb
@@ -0,0 +1,38 @@
+SUMMARY =3D "Remote desktop daemon for GNOME using pipewire."
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+inherit gnomebase gettext gsettings features_check
+
+REQUIRED_DISTRO_FEATURES =3D "opengl"
+
+SRC_URI[archive.sha256sum] =3D "11d451d1fde44f1809ebf61aff4bea5f9ef4fdc0=
2359a89647f6e9e7d45429ac"
+
+DEPENDS =3D " \
+    asciidoc-native \
+    libdrm \
+    libepoxy \
+    cairo \
+    glib-2.0 \
+    pipewire \
+    libnotify \
+    libsecret \
+    nv-codec-headers \
+    tpm2-tss \
+"
+
+PACKAGECONFIG ??=3D " \
+    vnc \
+    rdp \
+    ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'fdk_aa=
c', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+"
+
+PACKAGECONFIG[vnc] =3D "-Dvnc=3Dtrue,-Dvnc=3Dfalse,libvncserver"
+PACKAGECONFIG[rdp] =3D "-Drdp=3Dtrue,-Drdp=3Dfalse,freerdp fuse3 libxkbc=
ommon"
+PACKAGECONFIG[fdk_aac] =3D "-Dfdk_aac=3Dtrue,-Dfdk_aac=3Dfalse,fdk-aac"
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
+
+FILES:${PN} +=3D "${systemd_user_unitdir}"
--=20
2.34.1


