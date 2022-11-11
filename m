Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9F5C4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 17:50:10 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.331.1668189009961740449
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Nov 2022 09:50:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout11.t-online.de (Postfix) with SMTP id 4A73A41DF
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Nov 2022 18:50:07 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.57]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1otYAJ-4Yuqkj0; Fri, 11 Nov 2022 18:50:07 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv4] hwdata: add patch to use sysroot prefix for pkgdatadir
Date: Fri, 11 Nov 2022 18:49:49 +0100
Message-Id: <20221111174949.3329742-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1668189007-CA4B6B6F-4777A095/0/0 CLEAN NORMAL
X-TOI-MSGID: c0e3ec1f-221e-4f5c-ac41-4ee53e377aea
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Nov 2022 17:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99558

Add backport patch
https://github.com/vcrhonek/hwdata/pull/19/commits/d3325fd72bd45ba74e709b=
4083521104193b224e

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-sysroot-prefix-for-pkgdatadir-varia.patch | 30 +++++++++++++++++++
 .../recipes-support/hwdata/hwdata_0.364.bb    |  6 +++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/hwdata/hwdata/0001-hwdata.pc.=
in-use-sysroot-prefix-for-pkgdatadir-varia.patch

diff --git a/meta-oe/recipes-support/hwdata/hwdata/0001-hwdata.pc.in-use-=
sysroot-prefix-for-pkgdatadir-varia.patch b/meta-oe/recipes-support/hwdat=
a/hwdata/0001-hwdata.pc.in-use-sysroot-prefix-for-pkgdatadir-varia.patch
new file mode 100644
index 000000000..d51d8d00a
--- /dev/null
+++ b/meta-oe/recipes-support/hwdata/hwdata/0001-hwdata.pc.in-use-sysroot=
-prefix-for-pkgdatadir-varia.patch
@@ -0,0 +1,30 @@
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
+Upstream-Status: Backport [https://github.com/vcrhonek/hwdata/pull/19/co=
mmits/d3325fd72bd45ba74e709b4083521104193b224e]
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


