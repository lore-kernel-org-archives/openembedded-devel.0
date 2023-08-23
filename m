Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC502EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 12:47:06 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.10561.1692794825745692951
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 05:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout01.t-online.de (Postfix) with SMTP id 98B26F2D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 14:47:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.236]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qYnGA-2W3Wr30; Wed, 23 Aug 2023 14:46:54 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-remote-desktop: add recipe
Date: Wed, 23 Aug 2023 14:46:44 +0200
Message-ID: <20230823124645.6878-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692794814-EEFFB2E6-DCD6DBA2/0/0 CLEAN NORMAL
X-TOI-MSGID: 849a1e94-a204-4e2b-85a9-8f75dd6c5fac
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 12:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104546

- use dynamic-layers directory because this recipe depends on meta-virtua=
lization

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/conf/layer.conf                    |  4 ++
 .../gnome-remote-desktop_44.2.bb              | 38 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-gnome/dynamic-layers/meta-virtualization/recipes=
-gnome/gnome-remote-desktop/gnome-remote-desktop_44.2.bb

diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index d7286edab5..324d8b8c6e 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -24,3 +24,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D "\
   faenza-icon-theme->gtk+3 \
 "
=20
+BBFILES_DYNAMIC +=3D " \
+    virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/=
*/*/*.bb \
+    virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/=
*/*/*.bbappend \
+"
diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-remote-desktop/gnome-remote-desktop_44.2.bb b/meta-gnome/dynamic-la=
yers/meta-virtualization/recipes-gnome/gnome-remote-desktop/gnome-remote-=
desktop_44.2.bb
new file mode 100644
index 0000000000..48e4d9f32f
--- /dev/null
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_44.2.bb
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
+SRC_URI[archive.sha256sum] =3D "7a9ffd341b5fcb636d26675e9f6269650952163f=
ff5295327618cc2d5cc87b8e"
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
2.41.0


