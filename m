Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24EDC83F10
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 00:48:02 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.677.1693010880986348745
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 17:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout09.t-online.de (Postfix) with SMTP id 5D0112040B
	for <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 02:47:59 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.109]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZhT4-0ys8Fl0; Sat, 26 Aug 2023 02:47:58 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC2[meta-oe][PATCH 1/2] flatpak: avoid to patch the pkgconfig file
Date: Sat, 26 Aug 2023 02:47:47 +0200
Message-ID: <20230826004748.578231-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1693010878-9A8249C6-9EAD4C3B/0/0 CLEAN NORMAL
X-TOI-MSGID: 815f464d-6975-4499-b1dd-1f46ff6ab67f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 00:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104620

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-flatpak-pc-add-pc_sysrootdir.patch   | 28 -------------------
 .../flatpak/flatpak_1.15.4.bb                 |  1 -
 2 files changed, 29 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak=
-pc-add-pc_sysrootdir.patch

diff --git a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add=
-pc_sysrootdir.patch b/meta-oe/recipes-extended/flatpak/flatpak/0001-flat=
pak-pc-add-pc_sysrootdir.patch
deleted file mode 100644
index c1f2cca5c..000000000
--- a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sys=
rootdir.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3a1ab02d821cd4b0af44c0dad87e290ebaabef83 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Wed, 14 Dec 2022 06:50:40 +0100
-Subject: [PATCH] flatpak.pc: add pc_sysrootdir
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
-Upstream-Status: Pending
-
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 4a0b865e..5f69b1d9 100644
---- a/meson.build
-+++ b/meson.build
-@@ -509,7 +509,7 @@ pkgconfig_variables +=3D 'exec_prefix=3D${prefix}'
- pkgconfig_variables +=3D 'datadir=3D' + ('${prefix}' / get_option('data=
dir'))
-=20
- pkgconfig_variables +=3D 'datarootdir=3D' + ('${prefix}' / get_option('=
datadir'))
--pkgconfig_variables +=3D 'interfaces_dir=3D${datadir}/dbus-1/interfaces=
/'
-+pkgconfig_variables +=3D 'interfaces_dir=3D${pc_sysrootdir}${datadir}/d=
bus-1/interfaces/'
- pkgconfig_variables +=3D 'httpbackend=3D' + get_option('http_backend')
-=20
- pkgconfig.generate(
---=20
-2.34.1
-
diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.4.bb
index f5a726a83..ed888ded0 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
=20
 SRC_URI =3D " \
     gitsm://github.com/flatpak/flatpak;protocol=3Dhttps;nobranch=3D1 \
-    file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
=20
 SRCREV =3D "e936e3100d406c50ba49f3ad6a0ecae455345ec0"
--=20
2.41.0


