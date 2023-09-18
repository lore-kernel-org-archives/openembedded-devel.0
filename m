Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9EDCD3424
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 23:04:49 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.5737.1695078281117541239
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 16:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout03.t-online.de (Postfix) with SMTP id 619073B3CB
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 01:04:39 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiNIC-1BpuD30; Tue, 19 Sep 2023 01:04:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] libxmlb: remove recipe
Date: Tue, 19 Sep 2023 01:04:40 +0200
Message-ID: <20230918230440.13697-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695078276-1381E931-B3FDA65D/0/0 CLEAN NORMAL
X-TOI-MSGID: 37b71e0a-09c0-4316-a289-37b31d159a4e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104951

It was moved to oe-core

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 -
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 ...xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 35 -------------------
 .../recipes-gnome/libxmlb/libxmlb/run-ptest   |  3 --
 .../recipes-gnome/libxmlb/libxmlb_0.3.14.bb   | 25 -------------
 5 files changed, 65 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/libxmlb/libxmlb/0001-xb-selftes=
t.c-hardcode-G_TEST_SRCDIR.patch
 delete mode 100644 meta-oe/recipes-gnome/libxmlb/libxmlb/run-ptest
 delete mode 100644 meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.14.bb

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-o=
e/conf/include/ptest-packagelists-meta-oe.inc
index cafc43e01..81094bf9a 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -24,7 +24,6 @@ PTESTS_FAST_META_OE =3D "\
     libssh \
     libtinyxml2 \
     libxml++-5.0 \
-    libxmlb \
     libyang \
     lmdb \
     minicoredumper \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index c58047977..639388dec 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -468,7 +468,6 @@ RDEPENDS:packagegroup-meta-oe-gnome =3D"\
     pyxdg \
     vte9 \
     gnome-theme-adwaita \
-    libxmlb \
 "
=20
 RDEPENDS:packagegroup-meta-oe-graphics =3D"\
diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-har=
dcode-G_TEST_SRCDIR.patch b/meta-oe/recipes-gnome/libxmlb/libxmlb/0001-xb=
-selftest.c-hardcode-G_TEST_SRCDIR.patch
deleted file mode 100644
index da8ce68df..000000000
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G=
_TEST_SRCDIR.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From dc208bafc57c1ccaa0ca260f99c8b4c976271ebc Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Sat, 16 Sep 2023 14:02:57 +0200
-Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
-
-This avoids:
- libxmlb-0.3.14-r0 do_package_qa: QA Issue: File
- /usr/libexec/installed-tests/libxmlb/xb-self-test in package libxmlb-pt=
est
- contains reference to TMPDIR [buildpaths]
-
-and also fixes the runtime for the ptest.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- src/xb-self-test.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index 47d9728..8b3dd0e 100644
---- a/src/xb-self-test.c
-+++ b/src/xb-self-test.c
-@@ -2870,7 +2870,7 @@ xb_speed_func(void)
- int
- main(int argc, char **argv)
- {
--	g_setenv("G_TEST_SRCDIR", SRCDIR, FALSE);
-+	g_setenv("G_TEST_SRCDIR", "/usr/libexec/installed-tests/libxmlb", FALS=
E);
-=20
- 	g_test_init(&argc, &argv, NULL);
-=20
---=20
-2.41.0
-
diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb/run-ptest b/meta-oe/re=
cipes-gnome/libxmlb/libxmlb/run-ptest
deleted file mode 100644
index 6d0bb95d3..000000000
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#! /bin/sh
-
-gnome-desktop-testing-runner libxmlb
diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.14.bb b/meta-oe/re=
cipes-gnome/libxmlb/libxmlb_0.3.14.bb
deleted file mode 100644
index 1d3b0de29..000000000
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.14.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY =3D "A library to help create and query binary XML blobs"
-HOMEPAGE =3D "https://github.com/hughsie/libxmlb"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75310=
742"
-
-SRC_URI =3D " \
-	git://github.com/hughsie/libxmlb.git;branch=3Dmain;protocol=3Dhttps \
-	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
-	file://run-ptest \
-"
-SRCREV =3D "aa577b276adc66564f5777f9a522ca3bf0bfa65e"
-S =3D "${WORKDIR}/git"
-
-DEPENDS =3D "glib-2.0 xz zstd"
-
-inherit gobject-introspection gtk-doc meson ptest-gnome lib_package pkgc=
onfig
-
-PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',=
 '', d)}"
-PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
-
-GTKDOC_MESON_OPTION =3D "gtkdoc"
-
-FILES:${PN} +=3D "${datadir}"
-
-BBCLASSEXTEND =3D "native"
--=20
2.42.0


