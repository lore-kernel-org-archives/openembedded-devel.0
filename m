Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48918C433F5
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 16:02:29 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web08.34017.1643644948346175477
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Jan 2022 08:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout02.t-online.de (Postfix) with SMTP id BB33D1985
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Jan 2022 17:02:25 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.7]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nEZ8K-3sAqQr0; Mon, 31 Jan 2022 17:02:24 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gvfs: upgrade 1.48.1 -> 1.49.1
Date: Mon, 31 Jan 2022 17:02:17 +0100
Message-Id: <20220131160217.470385-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1643644944-0000C4DD-CA074840/0/0 CLEAN NORMAL
X-TOI-MSGID: 3dc2b0fe-89af-4f34-a155-7e878fe558ad
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jan 2022 16:02:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95183

backport upstream patch to fix issue with meson 0.60.0:

| Configuring org.gtk.vfs.file-operations.policy.in using configuration
|
| ../gvfs-1.49.1/daemon/meson.build:362:7: ERROR: Function does not take =
positional arguments.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...e-incorrect-i18n.merge_file-argument.patch | 34 +++++++++++++++++++
 .../gvfs/{gvfs_1.48.1.bb =3D> gvfs_1.49.1.bb}   |  8 +++--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs/Remove-incorrect-i=
18n.merge_file-argument.patch
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.48.1.bb =3D> gvfs_1.49.1.bb=
} (92%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs/Remove-incorrect-i18n.mer=
ge_file-argument.patch b/meta-gnome/recipes-gnome/gvfs/gvfs/Remove-incorr=
ect-i18n.merge_file-argument.patch
new file mode 100644
index 000000000..a6e352374
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs/Remove-incorrect-i18n.merge_file=
-argument.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Backport
+
+Fixes "../gvfs-1.49.1/daemon/meson.build:362:7: ERROR: Function does not=
 take positional arguments.
+
+Signed-off-by: Markus Volk f_l_k@t-online.de
+
+From 17a067b9b823a0d54e061eae45ff8e2c7e4a88d0 Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Fri, 21 Jan 2022 08:32:31 +0100
+Subject: [PATCH] build: Remove incorrect i18n.merge_file argument
+
+The positional argument was being silently ignored until meson 0.60.0 wh=
ere
+it fails with "ERROR: Function does not take positional arguments".
+
+Related: https://github.com/mesonbuild/meson/issues/9441
+Fixes: https://gitlab.gnome.org/GNOME/gvfs/-/issues/599
+---
+ daemon/meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/daemon/meson.build b/daemon/meson.build
+index 5f9559aa..e20ada29 100644
+--- a/daemon/meson.build
++++ b/daemon/meson.build
+@@ -360,7 +360,6 @@ if enable_admin
+   policy =3D gvfs_namespace + '.file-operations.policy'
+=20
+   i18n.merge_file(
+-    policy,
+     input: configure_file(
+       input: policy + '.in.in',
+       output: '@BASENAME@',
+--=20
+
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.48.1.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.49.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.48.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.49.1.bb
index 18abac29c..c73716d74 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.48.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.49.1.bb
@@ -10,8 +10,12 @@ DEPENDS +=3D "libsecret glib-2.0 glib-2.0-native libgu=
dev shadow-native \
=20
 RDEPENDS:${PN} +=3D "gsettings-desktop-schemas"
=20
-SRC_URI =3D "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("=
${PV}")}/${BPN}-${PV}.tar.xz;name=3Darchive"
-SRC_URI[archive.sha256sum] =3D "b2ea4f271aad2711f16b43c03151e2ec5a9874ff=
1a21142ef6d6406486a19dc2"
+SRC_URI =3D " \
+    https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/=
${BPN}-${PV}.tar.xz;name=3Darchive \
+    file://Remove-incorrect-i18n.merge_file-argument.patch \
+"
+
+SRC_URI[archive.sha256sum] =3D "b0d1dda4e475066207305b0776b0daefeae790f6=
c0107ffd2687994c8e71915a"
=20
 # depends on gsettings-desktop-schemas->gcr->gtk+3-> x11
 REQUIRED_DISTRO_FEATURES =3D "x11"
--=20
2.25.1


