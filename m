Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A67FC77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 11:23:29 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.46808.1684322599673154483
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 May 2023 04:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout03.t-online.de (Postfix) with SMTP id BC16135A9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 13:23:17 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.40.181]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pzFFT-1i7mFt0; Wed, 17 May 2023 13:23:15 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2] evince: update 44.0 -> 44.1
Date: Wed, 17 May 2023 13:23:03 +0200
Message-Id: <20230517112303.1127846-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684322595-18DBAE62-F945D789/0/0 CLEAN NORMAL
X-TOI-MSGID: 5b0f43e2-f84e-4c0f-920a-e90145b98a69
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 11:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102645

- remove buildpath from enum-types

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evince/{evince_44.0.bb =3D> evince_44.1.bb}              | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_44.0.bb =3D> evince_44.1.=
bb} (79%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_44.0.bb b/meta-gnome/=
recipes-gnome/evince/evince_44.1.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/evince/evince_44.0.bb
rename to meta-gnome/recipes-gnome/evince/evince_44.1.bb
index 1c7103c900..a844324ade 100644
--- a/meta-gnome/recipes-gnome/evince/evince_44.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_44.1.bb
@@ -34,7 +34,7 @@ REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DIS=
TRO_FEATURES', 'x11', 'open
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "339ee9e005dd7823a13fe21c71c2ec6d2c4cb745=
48026e4741eee7b2703e09da"
+SRC_URI[archive.sha256sum] =3D "15afd3bb15ffb38fecab34c23350950ad270ab03=
a85b94e333d9dd7ee6a74314"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
@@ -46,6 +46,11 @@ RRECOMMENDS:${PN} =3D "adwaita-icon-theme"
=20
 PACKAGES =3D+ "${PN}-nautilus-extension"
=20
+do_install:prepend() {
+    sed -i -e 's|${B}/../${PN}-${PV}|/usr/src/debug/${PN}/${PV}-${PR}|g'=
 ${B}/libview/ev-view-type-builtins.c
+    sed -i -e 's|${B}/../${PN}-${PV}|/usr/src/debug/${PN}/${PV}-${PR}|g'=
 ${B}/libdocument/ev-document-type-builtins.c
+}
+
 FILES:${PN} +=3D "${datadir}/dbus-1 \
                 ${datadir}/metainfo \
                 ${datadir}/thumbnailers \
--=20
2.34.1


