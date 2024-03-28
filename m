Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BE1C54E64
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 08:42:57 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.10898.1711615371381644927
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 01:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout12.t-online.de (Postfix) with SMTP id 84EED1714F
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 09:42:49 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.230]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rplLS-3QtheT0; Thu, 28 Mar 2024 09:42:46 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv4] gnome-user-share: add recipe
Date: Thu, 28 Mar 2024 09:43:11 +0100
Message-ID: <20240328084311.31165-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711615366-E7FFC9C0-F48FDF71/0/0 CLEAN NORMAL
X-TOI-MSGID: 42891dd9-b7a6-4a92-99b8-7c2dfdcf222a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 08:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109657

- add it as runtime dependency to gnome-control-center because without it=
,
  the file sharing options are hidden.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-control-center_46.0.bb              |  2 +-
 .../gnome-user-share/gnome-user-share_43.0.bb | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-user-share/gnome-user-=
share_43.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_46.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_46.0.bb
index a691b8d3f..fe9f1efbc 100644
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
er cups-pk-helper ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'gno=
me-user-share', '' , d)}"
diff --git a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_4=
3.0.bb b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.=
bb
new file mode 100644
index 000000000..7c4e85dae
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
@@ -0,0 +1,25 @@
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
+inherit gnomebase gsettings features_check
+
+REQUIRED_DISTRO_FEATURES =3D "systemd"
+
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/gnome-user-share.git;protocol=3D=
https;branch=3Dmaster"
+SRCREV =3D "a0e790aa9494db9d1b1f48b4fc0d2f78e112044d"
+S =3D "${WORKDIR}/git"
+
+PACKAGECONFIG ??=3D ""
+# default path is /usr/sbin/httpd
+PACKAGECONFIG[httpd2] =3D "-Dhttpd=3Dhttpd2,,,apache2"
+PACKAGECONFIG[apache2] =3D "-Dhttpd=3Dapache2,,,apache2"
+
+FILES:${PN} +=3D "${systemd_user_unitdir}"
--=20
2.44.0


