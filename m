Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7ABCD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 22:37:13 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.4890.1711665422818791817
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 15:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout03.t-online.de (Postfix) with SMTP id 118585D9F2
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 23:37:01 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.230]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rpyMl-2eMqVV0; Thu, 28 Mar 2024 23:36:59 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-control-center: update 46.0 -> 46.0.1
Date: Thu, 28 Mar 2024 23:37:18 +0100
Message-ID: <20240328223718.2067-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711665419-7B7FD87C-D0706F26/0/0 CLEAN NORMAL
X-TOI-MSGID: a3312c66-a73b-4786-86a7-68b97f3eb56c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 22:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109678

This is an important update, because it fixes a segfault in a new
settings tab 'system' that segfaulted, if it was selected.

This was horrible in two ways. A lot of important options were unaccessab=
le
and also quite annoying ... if selected, gnome-control-center constantly
crashed on execution, unless started from shell with a working tab like
'gnome-control-center wifi'

46.0.1 confuses the gnomebase class. Workaround this by using git fetcher=
,
at least until they go back to normal xx.x scheme

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...control-center_46.0.bb =3D> gnome-control-center_46.0.1.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_46.0.bb =3D> gnome-control-center_46.0.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_46.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_46.0.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_46.0.1.bb
index fe9f1efbc..de11239ed 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.0.1.bb
@@ -37,8 +37,11 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings g=
ettext upstream-version-is
=20
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
+SRC_URI =3D "gitsm://gitlab.gnome.org/GNOME/gnome-control-center.git;pro=
tocol=3Dhttps;nobranch=3D1"
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "25f67de05897868b2e97eaa0ecc986a408af08d4=
985c8a9da44f0d7bd8fea7a4"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "005f40dcfa464f113a1c95f97673bc5505fc15ad"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups"
--=20
2.44.0


