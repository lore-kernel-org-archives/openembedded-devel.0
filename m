Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5260DC6FD1F
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 09:26:51 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.18300.1679736408699777105
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 02:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout02.t-online.de (Postfix) with SMTP id C9C3E1CE81
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 10:26:46 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pg0Ag-1sQYrp0; Sat, 25 Mar 2023 10:26:46 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] xdg-desktop-portal: fix bwrap path
Date: Sat, 25 Mar 2023 10:26:39 +0100
Message-Id: <20230325092639.2725097-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679736406-09FF8C11-D31CD30B/0/0 CLEAN NORMAL
X-TOI-MSGID: 6ecf1e05-605e-4302-8cf8-611a29f1313d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101746

bwrap path is read from STAGING_BINDIR_NATIVE. This commit fixes reproduc=
ibility and runtime

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb    | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l_1.16.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-port=
al_1.16.0.bb
index e16f9f372..0b3a93ab3 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.=
0.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.=
0.bb
@@ -13,7 +13,6 @@ DEPENDS =3D " \
     pipewire \
     dbus-native \
     fuse3 \
-    bubblewrap-native \
     xmlto-native \
     flatpak \
     python3-dbus-native \
@@ -37,3 +36,12 @@ S =3D "${WORKDIR}/git"
 SRCREV =3D "88af6c8ca4106fcf70925355350a669848e9fd5a"
=20
 FILES:${PN} +=3D "${libdir}/systemd ${datadir}/dbus-1"
+
+EXTRA_OEMESON +=3D "--cross-file=3D${WORKDIR}/meson-${PN}.cross"
+
+do_write_config:append() {
+    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+[binaries]
+bwrap =3D '${bindir}/bwrap'
+EOF
+}
--=20
2.34.1


