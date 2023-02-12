Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CACC05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 17:03:36 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.14902.1676221414193999997
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 09:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout01.t-online.de (Postfix) with SMTP id B3E31237C5
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 18:03:31 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.232.57]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRFlD-0uOOrB0; Sun, 12 Feb 2023 18:03:31 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 1/2] fwupd: fix polkit rules.d permissions
Date: Sun, 12 Feb 2023 18:03:19 +0100
Message-Id: <20230212170320.284295-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676221411-736BB7D8-5FBF6FE8/0/0 CLEAN NORMAL
X-TOI-MSGID: 7d171bc0-442f-478c-9664-fea48792327b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 17:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101054

This fixes:

Error: Transaction test error:
  file /usr/share/polkit-1/rules.d conflicts between attempted installs o=
f fwupd-1.8.9-r0.intel_corei7_64 and polkit-122-r0.corei7_64
  file /usr/share/polkit-1/rules.d conflicts between attempted installs o=
f flatpak-1.15.1-r0.corei7_64 and fwupd-1.8.9-r0.intel_corei7_64

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb b/meta-oe/recipes-b=
sp/fwupd/fwupd_1.8.9.bb
index 0f889ca8f..c0f695753 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb
@@ -13,7 +13,7 @@ UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN=
}/releases"
 # Machine-specific as we examine MACHINE_FEATURES to decide whether to b=
uild the UEFI plugins
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-inherit meson vala gobject-introspection systemd bash-completion pkgconf=
ig gi-docgen ptest manpages
+inherit meson vala gobject-introspection systemd bash-completion pkgconf=
ig gi-docgen ptest manpages useradd
=20
 GIDOCGEN_MESON_OPTION =3D 'docs'
 GIDOCGEN_MESON_ENABLE_FLAG =3D 'docgen'
@@ -115,6 +115,15 @@ DISABLE_NON_X86:x86 =3D ""
 DISABLE_NON_X86:x86-64 =3D ""
 PACKAGECONFIG:remove =3D "${DISABLE_NON_X86}"
=20
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
+
+do_install:append() {
+	#Fix up permissions on polkit rules.d to work with rpm4 constraints
+	chmod 700 ${D}/${datadir}/polkit-1/rules.d
+	chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+}
+
 FILES:${PN} +=3D "${libdir}/fwupd-plugins-* \
                 ${libdir}/fwupd-${PV} \
                 ${systemd_unitdir} \
--=20
2.34.1


