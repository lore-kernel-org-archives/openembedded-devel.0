Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A78EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 07:25:08 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.34500.1688973900904947145
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jul 2023 00:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id C6F351FAB4
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jul 2023 09:24:49 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.169.146]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qIlGL-31M4zh0; Mon, 10 Jul 2023 09:24:49 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] flatpak: update dependencies
Date: Mon, 10 Jul 2023 09:24:22 +0200
Message-Id: <20230710072422.1147397-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1688973889-3A3CE7D8-26A2A532/0/0 CLEAN NORMAL
X-TOI-MSGID: 43fab5c7-be4d-40c6-8820-7cf4e97c092f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jul 2023 07:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103723

- use system bubblewrap and xdg-dbus-proxy instead of building subproject=
s
- fix seccomp PACKAGECONFIG

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.4.bb
index fcf80fc854..163d732a86 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
@@ -28,11 +28,13 @@ DEPENDS =3D " \
     json-glib \
     libarchive \
     libcap \
+    libxml2 \
     libxslt-native \
     ostree \
     polkit \
     python3-pyparsing-native \
     xmlto-native \
+    zstd \
 "
=20
 RDEPENDS:${PN} =3D " \
@@ -40,17 +42,20 @@ RDEPENDS:${PN} =3D " \
     ca-certificates \
     dconf \
     flatpak-xdg-utils \
+    xdg-dbus-proxy \
 "
=20
+EXTRA_OEMESON +=3D "-Dsystem_dbus_proxy=3D${bindir}/xdg-dbus-proxy -Dsys=
tem_bubblewrap=3D${bindir}/bwrap"
+
 GIR_MESON_OPTION =3D ""
=20
-PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,xauth"
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,xauth socat-nat=
ive"
 PACKAGECONFIG[xauth] =3D "-Dxauth=3Denabled,-Dxauth=3Ddisabled,xauth"
 PACKAGECONFIG[seccomp] =3D "-Dseccomp=3Denabled,-Dseccomp=3Ddisabled,lib=
seccomp"
=20
 PACKAGECONFIG ?=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xauth', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'security', 'seccomp', '', d=
)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)=
} \
 "
=20
 FILES:${PN} +=3D "${libdir} ${datadir}"
--=20
2.39.3


