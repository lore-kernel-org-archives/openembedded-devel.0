Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D344C54E64
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 12:13:18 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.14225.1711627997561049267
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 05:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout08.t-online.de (Postfix) with SMTP id 9A8DB154EA
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 13:13:15 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.230]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rpod8-2G7W890; Thu, 28 Mar 2024 13:13:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv5] gnome-user-share: add recipe
Date: Thu, 28 Mar 2024 13:13:37 +0100
Message-ID: <20240328121337.29507-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711627994-867FB9CB-62B64247/0/0 CLEAN NORMAL
X-TOI-MSGID: cfdf35b1-5765-4cd4-96c3-262c4e4979ef
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 12:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109662

- add it as runtime dependency to gnome-control-center because without it=
,
  the file sharing options are hidden.
- configure the paths to fit to openembedded env
- add mod_dnssd runtime dependency for apache2 as this is a requirement

To enable the feature, PACKAGECONFIG httpd needs to be added.
This is not done by default to avoid apache2 runtime dependency just by
including this recipe.
NOTE: Apache2 httpd doesn't need to be running on boot time. It'll get
      started and stopped on demand by systemd.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-control-center_46.0.bb              |  2 +-
 .../gnome-user-share/gnome-user-share_43.0.bb | 24 +++++++++++++++++++
 .../mod-dnssd/mod-dnssd_git.bb                | 21 ++++++++++++++++
 3 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-user-share/gnome-user-=
share_43.0.bb
 create mode 100644 meta-webserver/recipes-support/mod-dnssd/mod-dnssd_gi=
t.bb

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
index 000000000..3ff8f938a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
@@ -0,0 +1,24 @@
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
+PACKAGECONFIG ??=3D "modules"
+PACKAGECONFIG[httpd] =3D "-Dhttpd=3D/usr/sbin/httpd,,,apache2 mod-dnssd"
+PACKAGECONFIG[modules] =3D "-Dmodules_path=3D/usr/libexec/apache2/module=
s"
+
+FILES:${PN} +=3D "${systemd_user_unitdir}"
diff --git a/meta-webserver/recipes-support/mod-dnssd/mod-dnssd_git.bb b/=
meta-webserver/recipes-support/mod-dnssd/mod-dnssd_git.bb
new file mode 100644
index 000000000..25bd5f201
--- /dev/null
+++ b/meta-webserver/recipes-support/mod-dnssd/mod-dnssd_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION =3D "Avahi Module for Apache2."
+HOMEPAGE =3D "https://0pointer.de/lennart/projects/mod_dnssd/"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
+
+DEPENDS =3D "apache2 avahi"
+
+SRC_URI =3D "git://git.0pointer.de/mod_dnssd;protocol=3Dgit;branch=3Dmas=
ter"
+SRCREV =3D "be2fb9f6158f800685de7a1bc01c39b6cf1fa12c"
+PV =3D "0.6"
+
+S =3D "${WORKDIR}/git"
+
+EXTRA_OECONF =3D "--disable-lynx"
+
+inherit autotools pkgconfig
+
+do_install() {
+	install -Dm755 ${S}/src/.libs/mod_dnssd.so ${D}${libexecdir}/apache2/mo=
dules/mod_dnssd.so
+}
+
--=20
2.44.0


