Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66432C54EBC
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 13:08:11 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.44221.1673183282050763969
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 05:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout03.t-online.de (Postfix) with SMTP id BCA1725C36
	for <openembedded-devel@lists.openembedded.org>; Sun,  8 Jan 2023 14:07:57 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.124]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pEVP3-43c1Z60; Sun, 8 Jan 2023 14:07:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 4/5] seahorse: import recipe
Date: Sun,  8 Jan 2023 14:07:42 +0100
Message-Id: <20230108130743.983639-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108130743.983639-1-f_l_k@t-online.de>
References: <20230108130743.983639-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673183277-F2FF5ECF-4CDC8457/0/0 CLEAN NORMAL
X-TOI-MSGID: 7a77c9fa-c80d-4b40-91b4-2d917dbc0d82
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 13:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100442

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/seahorse/seahorse_43.0.bb   | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/seahorse/seahorse_43.0.bb

diff --git a/meta-gnome/recipes-gnome/seahorse/seahorse_43.0.bb b/meta-gn=
ome/recipes-gnome/seahorse/seahorse_43.0.bb
new file mode 100644
index 000000000..a43d045ae
--- /dev/null
+++ b/meta-gnome/recipes-gnome/seahorse/seahorse_43.0.bb
@@ -0,0 +1,42 @@
+SUMMARY =3D "Seahorse is a graphical interface for managing and using en=
cryption keys."
+LICENSE=3D"GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+DEPENDS =3D " \
+    avahi \
+    appstream-glib-native \
+    desktop-file-utils-native \
+    gcr3 \
+    glib-2.0 \
+    gnupg \
+    gpgme \
+    gtk+3 \
+    libhandy \
+    libpwquality \
+    libsecret \
+    libsoup-3.0 \
+    openssh \
+"
+
+inherit gnomebase itstool vala mime-xdg
+
+SRC_URI[archive.sha256sum] =3D "5b1d1bfba74f3658227f3c82e296f330dd0fcd1e=
f4636b6a218228fee5ea832d"
+
+PACKAGECONFIG[key-sharing] =3D "-Dkey-sharing=3Dtrue,-Dkey-sharing=3Dfal=
se,avahi"
+PACKAGECONFIG[ldap-support] =3D "-Dldap-support=3Dtrue,-Dldap-support=3D=
false,openldap"
+PACKAGECONFIG[pkcs11-support] =3D "-Dpkcs11-support=3Dtrue,-Dpkcs11-supp=
ort=3Dfalse,p11-kit"
+
+PACKAGECONFIG ??=3D "pkcs11-support"
+
+EXTRA_OEMESON +=3D "--cross-file=3D${WORKDIR}/meson-${PN}.cross"
+
+do_write_config:append() {
+    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+[binaries]
+ssh-keygen =3D '${bindir}/ssh-keygen'
+EOF
+}
+
+FILES:${PN} +=3D "${datadir}"
--=20
2.34.1


