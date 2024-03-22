Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C25C47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 17:45:24 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.1680.1711129520362394939
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 10:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id 8DDE011FEF
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 18:45:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.243]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnix7-0v7DpR0; Fri, 22 Mar 2024 18:45:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] tracker-miners: drop buildpath from tracker-miner-fs-3
Date: Fri, 22 Mar 2024 18:45:40 +0100
Message-ID: <20240322174540.1624-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711129513-3F7FD877-F9813897/0/0 CLEAN NORMAL
X-TOI-MSGID: 91f6fd2f-1a0f-458f-b84d-ead6a5b7b6be
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 17:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109523

Remove the buildpath from /usr/libexec/tracker-miner-fs-3 without breakin=
g the binary

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-fix-reproducibility.patch               | 16 ++++++++++++++++
 .../tracker/tracker-miners_3.7.0.bb              |  5 -----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-rep=
roducibility.patch b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001=
-fix-reproducibility.patch
index c6b07dc6c..68ff95e79 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducib=
ility.patch
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducib=
ility.patch
@@ -76,6 +76,22 @@ index e131b85ad..59e509fa6 100644
 =20
  libtracker_miner_test_deps =3D [tracker_miners_common_dep, tracker_mine=
r_dep, tracker_sparql]
 =20
+=20
+diff --git a/src/miners/fs/meson.build b/src/miners/fs/meson.build
+index 6e5883288..04750f82b 100644
+--- a/src/miners/fs/meson.build
++++ b/src/miners/fs/meson.build
+@@ -67,8 +67,8 @@ executable('tracker-miner-fs-@0@'.format(tracker_api_m=
ajor),
+     dependencies: tracker_miner_fs_deps,
+     c_args: [
+         tracker_c_args,
+-        '-DBUILDROOT=3D"@0@"'.format(meson.global_build_root()),
+-        '-DBUILD_EXTRACTDIR=3D"@0@"'.format(meson.build_root() / 'src' =
/ 'tracker-extract'),
++        '-DBUILDROOT=3D"@0@"'.format(get_option('prefix') / 'src'),
++        '-DBUILD_EXTRACTDIR=3D"@0@"'.format(get_option('prefix') / 'src=
' / 'tracker-extract'),
+         '-DLIBEXECDIR=3D"@0@"'.format(get_option('prefix') / get_option=
('libexecdir')),
+     ],
+     install: true,
 --=20
 2.41.0
=20
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb b/m=
eta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb
index dfebd0d2e..333bb6267 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb
@@ -76,14 +76,9 @@ EXTRA_OEMESON +=3D " \
     -Dsystemd_user_services_dir=3D${systemd_user_unitdir} \
 "
=20
-do_install:append() {
-    sed -i -e 's|${B}||g' ${D}${libexecdir}/tracker-miner-fs-3
-}
=20
 FILES:${PN} +=3D " \
     ${datadir} \
     ${libdir}/tracker-miners-3.0 \
     ${systemd_user_unitdir} \
 "
-
-INSANE_SKIP:${PN} =3D "already-stripped"
--=20
2.44.0


