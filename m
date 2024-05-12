Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC0DC10F1A
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 11:52:02 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.33649.1715514717283982581
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 04:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout07.t-online.de (Postfix) with SMTP id 87C7010CD9
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 13:51:55 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.90]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s67kA-0O3VGz0; Sun, 12 May 2024 13:51:54 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv4] malcontent: add recipe
Date: Sun, 12 May 2024 13:52:26 +0200
Message-ID: <20240512115226.49036-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1715514714-4EFFAD04-36F80587/0/0 CLEAN NORMAL
X-TOI-MSGID: a4b6e624-3abb-4f80-810a-d9f5e9945c6a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 11:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110320

malcontent is an optional dependency for flatpak and gnome-software

- Building the malcontent gtk4-ui leads to circular dependency malcontent=
 <-> flatpak
  Add a separate package for malcontent-ui to avoid this and to make malc=
ontent-control
  buildable.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../malcontent/malcontent-ui_0.12.0.bb        | 49 +++++++++++++++++++
 .../malcontent/malcontent_0.12.0.bb           | 41 ++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0=
.bb
 create mode 100644 meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb b/m=
eta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
new file mode 100644
index 000000000..effd181b1
--- /dev/null
+++ b/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
@@ -0,0 +1,49 @@
+SUMMARY =3D "User-Interface for malcontent."
+HOMEPAGE =3D "https://gitlab.freedesktop.org/pwithnall/malcontent"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/pwithnall/malcontent.git;proto=
col=3Dhttps;branch=3Dmain"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "3ba80995bb25b7aeda7e21d547f9e39ff9a81736"
+
+DEPENDS =3D " \
+	accountsservice \
+	glib-2.0 \
+	glib-testing \
+	dbus \
+	desktop-file-utils-native \
+	itstool-native \
+	libpam \
+	malcontent \
+	polkit \
+	appstream \
+	flatpak \
+	libadwaita \
+	gtk4 \
+"
+
+GIR_MESON_OPTION =3D ""GTKIC_VERSION =3D "4"
+inherit  meson pkgconfig gtk-icon-cache gobject-introspection gettext fe=
atures_check
+
+REQUIRED_DISTRO_FEATURES =3D "pam polkit gobject-introspection"
+
+EXTRA_OEMESON =3D "-Dui=3Denabled"
+
+do_install() {
+	install -d ${D}${datadir}/gir-1.0 ${D}${libdir}/girepository-1.0 ${D}${=
bindir}
+	install -d ${D}${datadir}/polkit-1/actions ${D}${datadir}/metainfo ${D}=
${datadir}/applications
+	install -m 0644 ${B}/libmalcontent-ui/MalcontentUi-1.gir ${D}${datadir}=
/gir-1.0
+	install -m 0644 ${B}/libmalcontent-ui/MalcontentUi-1.typelib ${D}${libd=
ir}/girepository-1.0
+	ln -sf libmalcontent-ui-1.so.1 ${D}${libdir}/libmalcontent-ui-1.so
+	install -m 0644 ${B}/libmalcontent-ui/libmalcontent-ui-1.so.1 ${D}${lib=
dir}
+	install -m 0644 ${B}/libmalcontent-ui/libmalcontent-ui-1.so.0.12.0 ${D}=
${libdir}
+	install -m 0755 ${B}/malcontent-control/malcontent-control ${D}${bindir=
}
+	install -m 0644 ${B}/malcontent-control/org.freedesktop.MalcontentContr=
ol.policy ${D}${datadir}/polkit-1/actions
+	install -m 0644 ${B}/malcontent-control/org.freedesktop.MalcontentContr=
ol.appdata.xml ${D}${datadir}/metainfo
+	install -m 0644 ${B}/malcontent-control/org.freedesktop.MalcontentContr=
ol.desktop ${D}${datadir}/applications
+}
+
+FILES:${PN} =3D "${bindir} ${libdir} ${datadir}"
+
diff --git a/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb b/meta=
-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
new file mode 100644
index 000000000..416751423
--- /dev/null
+++ b/meta-oe/recipes-gnome/malcontent/malcontent_0.12.0.bb
@@ -0,0 +1,41 @@
+SUMMARY =3D "malcontent implements support for restricting the type of c=
ontent."
+HOMEPAGE =3D "https://gitlab.freedesktop.org/pwithnall/malcontent"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/pwithnall/malcontent.git;proto=
col=3Dhttps;branch=3Dmain"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "3ba80995bb25b7aeda7e21d547f9e39ff9a81736"
+
+DEPENDS =3D " \
+	accountsservice \
+	glib-2.0 \
+	glib-testing \
+	dbus \
+	itstool-native \
+	libpam \
+	polkit \
+"
+
+GIR_MESON_OPTION =3D ""
+
+inherit  meson pkgconfig gobject-introspection gettext features_check us=
eradd
+
+REQUIRED_DISTRO_FEATURES =3D "pam polkit gobject-introspection"
+
+PACKAGECONFIG ?=3D "ui"
+PACKAGECONFIG[ui] =3D ",,,malcontent-ui"
+
+EXTRA_OEMESON =3D "-Dui=3Ddisabled"
+
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
+
+do_install:append() {
+        # Fix up permissions on polkit rules.d to work with rpm4 constra=
ints
+        chmod 700 ${D}/${datadir}/polkit-1/rules.d
+        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+}
+
+FILES:${PN} +=3D "${libdir} ${datadir}"
--=20
2.44.0


