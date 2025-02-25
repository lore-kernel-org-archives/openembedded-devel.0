Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF0AC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 13:16:41 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.7562.1740489392927054584
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 05:16:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout12.t-online.de (Postfix) with SMTP id 95C141E64
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 14:16:30 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.232]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tmunV-0FPq090; Tue, 25 Feb 2025 14:16:29 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] accountsservice: update 22.08.8 -> 23.13.9
Date: Tue, 25 Feb 2025 14:17:04 +0100
Message-ID: <20250225131704.1792461-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1740489389-017F9983-D4083C4F/0/0 CLEAN NORMAL
X-TOI-MSGID: 794bde45-02d3-4622-8ad7-1dca9f41b2a4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 13:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115570

- add backport patch to fix:

| ../accountsservice-23.13.9/subprojects/mocklibc-1.0/src/netgroup-debug.=
c:25:3: error: implicit declaration of function 'print_indent' [-Wimplici=
t-function-declaration]
|    25 |   print_indent(stream, indent);

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../accountsservice-23.13.9-c99-fixes.patch   | 54 +++++++++++++++++++
 ..._22.08.8.bb =3D> accountsservice_23.13.9.bb} |  7 ++-
 2 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-support/accountsservice/accountsse=
rvice/accountsservice-23.13.9-c99-fixes.patch
 rename meta-gnome/recipes-support/accountsservice/{accountsservice_22.08=
.8.bb =3D> accountsservice_23.13.9.bb} (79%)

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/a=
ccountsservice-23.13.9-c99-fixes.patch b/meta-gnome/recipes-support/accou=
ntsservice/accountsservice/accountsservice-23.13.9-c99-fixes.patch
new file mode 100644
index 0000000000..596f7b7d3f
--- /dev/null
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice/accounts=
service-23.13.9-c99-fixes.patch
@@ -0,0 +1,54 @@
+https://bugs.gentoo.org/930715
+https://gitlab.freedesktop.org/accountsservice/accountsservice/-/commit/=
da65bee12d9118fe1a49c8718d428fe61d232339
+
+From da65bee12d9118fe1a49c8718d428fe61d232339 Mon Sep 17 00:00:00 2001
+From: Ray Strode <rstrode@redhat.com>
+Date: Tue, 11 Apr 2023 10:09:07 -0400
+Subject: [PATCH] mocklibc: Fix compiler warning
+
+print_indent is defined in one file and used in another without a
+forward declaration. That leads to a compiler warning/error.
+
+This commit fixes that.
+
+Upstream-Status: Backport [https://gitweb.gentoo.org/repo/gentoo.git/tre=
e/sys-apps/accountsservice/files/accountsservice-23.13.9-c99-fixes.patch]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ subprojects/mocklibc.wrap                           |  2 ++
+ subprojects/packagefiles/mocklibc-print-indent.diff | 13 +++++++++++++
+ 2 files changed, 15 insertions(+)
+ create mode 100644 subprojects/packagefiles/mocklibc-print-indent.diff
+
+diff --git a/subprojects/mocklibc.wrap b/subprojects/mocklibc.wrap
+index af82298..539ee83 100644
+--- a/subprojects/mocklibc.wrap
++++ b/subprojects/mocklibc.wrap
+@@ -8,3 +8,5 @@ source_hash =3D b2236a6af1028414783e9734a46ea051916ec226=
479d6a55a3bb823bff68f120
+ patch_url =3D https://wrapdb.mesonbuild.com/v1/projects/mocklibc/1.0/2/=
get_zip
+ patch_filename =3D mocklibc-1.0-2-wrap.zip
+ patch_hash =3D 0280f96a2eeb3c023e5acf4e00cef03d362868218d4a85347ea45137=
c0ef6c56
++
++diff_files =3D mocklibc-print-indent.diff
+diff --git a/subprojects/packagefiles/mocklibc-print-indent.diff b/subpr=
ojects/packagefiles/mocklibc-print-indent.diff
+new file mode 100644
+index 0000000..4aaed40
+--- /dev/null
++++ b/subprojects/packagefiles/mocklibc-print-indent.diff
+@@ -0,0 +1,13 @@
++diff -up mocklibc-1.0/src/netgroup-debug.c.print-indent mocklibc-1.0/sr=
c/netgroup-debug.c
++--- mocklibc-1.0/src/netgroup-debug.c.print-indent	2023-04-11 10:20:53.=
717381559 -0400
+++++ mocklibc-1.0/src/netgroup-debug.c	2023-04-11 10:21:02.296270333 -04=
00
++@@ -21,6 +21,9 @@
++ #include <stdio.h>
++ #include <stdlib.h>
++=20
+++void print_indent (FILE        *stream,
+++                   unsigned int indent);
+++
++ void netgroup_debug_print_entry(struct entry *entry, FILE *stream, uns=
igned int indent) {
++   print_indent(stream, indent);
++=20
+--=20
+GitLab
+
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_2=
2.08.8.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_23=
.13.9.bb
similarity index 79%
rename from meta-gnome/recipes-support/accountsservice/accountsservice_22=
.08.8.bb
rename to meta-gnome/recipes-support/accountsservice/accountsservice_23.1=
3.9.bb
index 439958c7d2..ba8c4f24d7 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_22.08.8.=
bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.=
bb
@@ -12,12 +12,15 @@ inherit meson gobject-introspection gtk-doc features_=
check systemd vala
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI =3D "https://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.ta=
r.xz"
+SRC_URI =3D " \
+	https://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
+	file://accountsservice-23.13.9-c99-fixes.patch \
+"
 SRC_URI:append:libc-musl =3D " \
     file://0001-musl-Hack-to-fix-build.patch \
     file://0002-musl-add-missing-fgetspent_r.patch \
 "
-SRC_URI[sha256sum] =3D "909997a76919fe7dc138a9a01cea70bd622d5a932dbc9fb1=
3010113023a7a391"
+SRC_URI[sha256sum] =3D "adda4cdeae24fa0992e7df3ffff9effa7090be3ac233a3ed=
fdf69d5a9c9b924f"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.48.1


