Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4467C4708B
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 23:04:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.81070.1669503870793731778
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Nov 2022 15:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout10.t-online.de (Postfix) with SMTP id 47048188E8
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 00:04:29 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.10]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oz4De-1zml0U0; Sun, 27 Nov 2022 00:04:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2 10/14] polkit: add recipe for v122
Date: Sun, 27 Nov 2022 00:03:47 +0100
Message-Id: <20221126230351.1431843-10-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126230351.1431843-1-f_l_k@t-online.de>
References: <20221126230351.1431843-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669503862-177E998D-E0C79484/0/0 CLEAN NORMAL
X-TOI-MSGID: 47b14da6-bc39-4b67-b57f-ef9ea87b11ca
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 23:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99761

autotools buildsystem has been dropped

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/polkit/polkit_122.bb | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit_122.bb

diff --git a/meta-oe/recipes-extended/polkit/polkit_122.bb b/meta-oe/reci=
pes-extended/polkit/polkit_122.bb
new file mode 100644
index 000000000..36977fb49
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit_122.bb
@@ -0,0 +1,49 @@
+SUMMARY =3D "PolicyKit Authorization Framework"
+DESCRIPTION =3D "The polkit package is an application-level toolkit for =
defining and handling the policy that allows unprivileged processes to sp=
eak to privileged processes."
+HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/polkit"
+LICENSE =3D "LGPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86cdbafa7532b41f39040928=
3eb"
+
+SRC_URI =3D "git://github.com/freedesktop/polkit.git;protocol=3Dhttps;br=
anch=3Dmaster"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "da87c5698019897dd731bb2cbb54ebd9c9481f52"
+
+DEPENDS =3D "expat glib-2.0"
+
+inherit meson pkgconfig useradd systemd gettext gobject-introspection fe=
atures_check
+
+REQUIRED_DISTRO_FEATURES =3D "polkit"
+
+PACKAGECONFIG =3D " \
+	${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolek=
it', d)} \
+	dbus \
+	mozjs \
+"
+PACKAGECONFIG[dbus] =3D ",,dbus"
+PACKAGECONFIG[gtk-doc] =3D "-Dgtk_doc=3Dtrue,-Dgtk_doc=3Dfalse,gtk-doc-n=
ative"
+PACKAGECONFIG[pam] =3D "-Dauthfw=3Dpam,-Dauthfw=3Dshadow,libpam,libpam"
+PACKAGECONFIG[systemd] =3D "-Dsession_tracking=3Dlibsystemd-login,-sessi=
on_tracking=3DConsoleKit,systemd"
+PACKAGECONFIG[consolekit] =3D ",,,consolekit"
+
+# Default to mozjs javascript library
+PACKAGECONFIG[mozjs] =3D "-Djs_engine=3Dmozjs,,mozjs-102,,,duktape"
+# duktape javascript engine is much smaller and faster but is not compat=
ible with
+# same javascript standards as mozjs. For example array.includes() funct=
ion is not
+# supported. Test rule compatibility when switching to duktape.
+PACKAGECONFIG[duktape] =3D "-Djs_engine=3Dduktape,,duktape,,,mozjs"
+
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/${BPN}-1 --shell /bin/nologin polkitd"
+
+SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
+SYSTEMD_AUTO_ENABLE =3D "disable"
+
+do_install:append() {
+	#Fix up permissions on polkit rules.d to work with rpm4 constraints
+	chmod 700 ${D}/${datadir}/polkit-1/rules.d
+	chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+}
+
+FILES:${PN} +=3D "${libdir}/polkit-1 ${datadir}"
--=20
2.34.1


