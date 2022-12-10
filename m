Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70F6C4332F
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 07:12:50 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.10180.1670656362732721646
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Dec 2022 23:12:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout03.t-online.de (Postfix) with SMTP id 9C6C02526A
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 08:12:40 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.165]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3u2K-3TBrw90; Sat, 10 Dec 2022 08:12:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gvfs: fix polkit homedir
Date: Sat, 10 Dec 2022 08:12:31 +0100
Message-Id: <20221210071231.6314-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670656360-69DEC991-83E2B626/0/0 CLEAN NORMAL
X-TOI-MSGID: 22b8eaeb-7cec-40df-9eed-e2db137a2468
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 07:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100021

- remove double slashes

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.50.2.bb
index 4c251d2f4..0e7293734 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
@@ -76,13 +76,13 @@ PACKAGECONFIG[fuse] =3D "-Dfuse=3Dtrue, -Dfuse=3Dfals=
e, fuse3"
 PACKAGECONFIG[cdda] =3D "-Dcdda=3Dtrue, -Dcdda=3Dfalse, libcdio-paranoia=
"
=20
 USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/${BPN}-1 polkitd"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 polkitd"
=20
 do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'true', 'false'=
, d)}; then
         # Fix up permissions on polkit rules.d to work with rpm4 constra=
ints
-        chmod 700 ${D}/${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+        chmod 700 ${D}${datadir}/polkit-1/rules.d
+        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
     fi
=20
     # After rebuilds (not from scracth) it can happen that the executabl=
es in
--=20
2.34.1


