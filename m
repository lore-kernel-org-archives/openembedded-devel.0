Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1089C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 07:25:28 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.4250.1668065122792039878
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 23:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout06.t-online.de (Postfix) with SMTP id 5B04F1FFD2
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:25:20 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.45.241]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ot1w6-2OX9uL0; Thu, 10 Nov 2022 08:25:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] hwdata: add patch to use sysroot prefix for pkgdatadir
Date: Thu, 10 Nov 2022 08:25:09 +0100
Message-Id: <20221110072509.13944-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1668065118-01449CE0-7325F5B6/0/0 CLEAN NORMAL
X-TOI-MSGID: 111e4139-07c0-4fd7-8c0f-8c9fa93d1ebe
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 07:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99517

This patch has been submitted upstream here:
https://github.com/vcrhonek/hwdata/pull/19/commits/d3325fd72bd45ba74e709b=
4083521104193b224e

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-sysroot-prefix-for-pkgdatadir-varia.patch | 31 +++++++++++++++++++
 .../recipes-support/hwdata/hwdata_0.364.bb    |  6 +++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/hwdata/hwdata/0001-hwdata.pc.=
in-use-sysroot-prefix-for-pkgdatadir-varia.patch

diff --git a/meta-oe/recipes-support/hwdata/hwdata/0001-hwdata.pc.in-use-=
sysroot-prefix-for-pkgdatadir-varia.patch b/meta-oe/recipes-support/hwdat=
a/hwdata/0001-hwdata.pc.in-use-sysroot-prefix-for-pkgdatadir-varia.patch
new file mode 100644
index 000000000..2ee63bc32
--- /dev/null
+++ b/meta-oe/recipes-support/hwdata/hwdata/0001-hwdata.pc.in-use-sysroot=
-prefix-for-pkgdatadir-varia.patch
@@ -0,0 +1,31 @@
+From f5311fb8519c6360333934537abeb64198e2c212 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Wed, 9 Nov 2022 18:37:41 +0100
+Subject: [PATCH] hwdata.pc.in: use sysroot prefix for pkgdatadir variabl=
e
+
+The pc_sysroot is automatically added to cflags and libs but not
+to 'pkg-config --variable'. This matches what wayland-protocols does.
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Patch-Status: Submitted
+https://github.com/vcrhonek/hwdata/pull/19/commits/d3325fd72bd45ba74e709=
b4083521104193b224e
+---
+ hwdata.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hwdata.pc.in b/hwdata.pc.in
+index 8dd73b6..c5791d3 100644
+--- a/hwdata.pc.in
++++ b/hwdata.pc.in
+@@ -1,6 +1,6 @@
+ prefix=3D@prefix@
+ datadir=3D@datadir@
+-pkgdatadir=3D@pkgdatadir@
++pkgdatadir=3D${pc_sysrootdir}@pkgdatadir@
+=20
+ Name: @NAME@
+ Description: Hardware identification and configuration data
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.364.bb b/meta-oe/rec=
ipes-support/hwdata/hwdata_0.364.bb
index 4abfb4346..4161a2bfe 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.364.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.364.bb
@@ -6,7 +6,11 @@ LICENSE =3D "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1556547711e8246992b999edd9445=
a57"
=20
 SRCREV =3D "3ac83cecf56f299e7390e5afeab2808632719243"
-SRC_URI =3D "git://github.com/vcrhonek/${BPN}.git;branch=3Dmaster;protoc=
ol=3Dhttps"
+SRC_URI =3D " \
+    git://github.com/vcrhonek/${BPN}.git;branch=3Dmaster;protocol=3Dhttp=
s \
+    file://0001-hwdata.pc.in-use-sysroot-prefix-for-pkgdatadir-varia.pat=
ch \
+"
+
 S =3D "${WORKDIR}/git"
=20
 inherit allarch
--=20
2.34.1


