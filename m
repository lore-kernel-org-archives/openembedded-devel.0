Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42258C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 16:07:58 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.41999.1711555668089079782
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Mar 2024 09:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout05.t-online.de (Postfix) with SMTP id D4A241461E
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 17:07:45 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.72]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rpVoW-2xNyDp0; Wed, 27 Mar 2024 17:07:44 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-user-share: add recipe
Date: Wed, 27 Mar 2024 17:08:08 +0100
Message-ID: <20240327160808.22384-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711555664-FF7FD9C0-693CD383/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b601952-c369-48b4-8001-68e2449e044a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 16:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109646

- add it as runtime dependency to gnome-control-center because without it=
,
  the file sharing options are hidden.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-control-center_46.0.bb              |  2 +-
 .../gnome-user-share/gnome-user-share_43.0.bb | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-user-share/gnome-user-=
share_43.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_46.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_46.0.bb
index a691b8d3f..4acb96967 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.0.bb
@@ -69,4 +69,4 @@ FILES:${PN} +=3D " \
=20
 FILES:${PN}-dev +=3D "${datadir}/gettext"
=20
-RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla system-config-print=
er cups-pk-helper"
+RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla system-config-print=
er cups-pk-helper gnome-user-share"
diff --git a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_4=
3.0.bb b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.=
bb
new file mode 100644
index 000000000..450ea6cfa
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "This is gnome-user-share 43.0, a system for easy sharing of=
 user files."
+LICENSE=3D"GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
+
+
+DEPENDS =3D " \
+    glib-2.0-native \
+    glib-2.0 \
+    systemd \
+"
+
+inherit gnomebase gsettings
+
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/gnome-user-share.git;protocol=3D=
https;branch=3Dmaster"
+SRCREV =3D "a0e790aa9494db9d1b1f48b4fc0d2f78e112044d"
+S =3D "${WORKDIR}/git"
+
+PACKAGECONFIG ??=3D ""
+# default path is /usr/sbin/httpd
+PACKAGECONFIG[httpd2] =3D "-Dhttps=3Dhttpd,,,apache2"
+PACKAGECONFIG[apache2] =3D "-Dhttps=3Dapache2,,,apache2"
+
+FILES:${PN} +=3D "${systemd_user_unitdir}"
--=20
2.44.0


