Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4841EE69181
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:31:37 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.28518.1732293087589861929
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout02.t-online.de (Postfix) with SMTP id AC0DA5DD
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 17:31:24 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.36.225]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tEWYy-1Lgdph0; Fri, 22 Nov 2024 17:31:20 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gdm: update useradd settings
Date: Fri, 22 Nov 2024 17:31:12 +0100
Message-ID: <20241122163112.3396-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1732293080-36FEDDD7-E6BB6004/0/0 CLEAN NORMAL
X-TOI-MSGID: 131a6b78-7eb6-4c8c-88ff-caa744c72ec5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 16:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114003

Set HOME_DIR back to /var/lib/gdm. If this is not specified, gdm will sto=
re its
files in $HOME/.cache. This is pretty ugly because I think this directory=
 should
only be used by real users? Maybe /var/cache would be a better place, bec=
ause it
would be the system equivalent of $HOME/.cache?

Use tmpfiles.d to ensure /var/lib/gdm is created with the right permissio=
ns
even in case /var would be tmpfs

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gdm/gdm_47.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_47.0.bb
index 45f23b49b..9aefeed7d 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
@@ -42,10 +42,12 @@ do_install:append() {
     rm -rf ${D}/run ${D}${localstatedir}/run
     echo "auth       optional     pam_gnome_keyring.so" >> ${D}${sysconf=
dir}/pam.d/gdm-password
     echo "session    optional     pam_gnome_keyring.so auto_start" >> ${=
D}${sysconfdir}/pam.d/gdm-password
+    install -d ${D}${sysconfdir}/tmpfiles.d
+    echo "d ${localstatedir}/lib/gdm 700 gdm gdm - -" > ${D}${sysconfdir=
}/tmpfiles.d/gdm.conf
 }
=20
 USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --groups video gdm"
+USERADD_PARAM:${PN} =3D "--system --groups video --home ${localstatedir}=
/lib/gdm  gdm"
=20
 SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
=20
@@ -64,7 +66,6 @@ CONFFILES:${PN} +=3D "${sysconfdir}/gdm/custom.conf"
 FILES:${PN} +=3D " \
     ${datadir}/dconf \
     ${base_libdir}/security/pam_gdm.so \
-    ${localstatedir} \
     ${systemd_unitdir} ${systemd_user_unitdir} \
 "
=20
--=20
2.47.0


