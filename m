Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8ACE9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 14:02:52 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12384.1771423368195005755
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 06:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout12.t-online.de (Postfix) with SMTP id 38EC4EC47
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:02:46 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.86]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vsi8Y-2H140f0; Wed, 18 Feb 2026 15:02:43 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] snapper: update 0.12.2 -> 0.13.0
Date: Wed, 18 Feb 2026 15:02:34 +0100
Message-ID: <20260218140234.388441-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1771423363-78FFB49A-81FD7B6F/0/0 CLEAN NORMAL
X-TOI-MSGID: 76ccdc8b-5f07-46da-a2fb-cb54d54546ca
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 14:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124482

- Remove 0001-Fix-build-with-boost-1.89.patch. Seems to be fixed
  upstream
- Use VIRTUAL-RUNTIME_dbus
- Use manpages class

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-Fix-build-with-boost-1.89.patch      | 89 -------------------
 .../{snapper_0.12.2.bb =3D> snapper_0.13.0.bb}  | 14 ++-
 2 files changed, 6 insertions(+), 97 deletions(-)
 delete mode 100644 meta-oe/recipes-support/snapper/snapper/0001-Fix-buil=
d-with-boost-1.89.patch
 rename meta-oe/recipes-support/snapper/{snapper_0.12.2.bb =3D> snapper_0=
.13.0.bb} (70%)

diff --git a/meta-oe/recipes-support/snapper/snapper/0001-Fix-build-with-=
boost-1.89.patch b/meta-oe/recipes-support/snapper/snapper/0001-Fix-build=
-with-boost-1.89.patch
deleted file mode 100644
index a6598b5635..0000000000
--- a/meta-oe/recipes-support/snapper/snapper/0001-Fix-build-with-boost-1=
.89.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From c33e7707da86a23c4ad7e2451ddb04df419d6412 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 31 Aug 2025 00:13:07 -0700
-Subject: [PATCH] Fix build with boost 1.89
-
-boost 1.89+ does not have boost system lib anymore all needed functions
-are now in header
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- dbus/Makefile.am             | 2 +-
- examples/c++-lib/Makefile.am | 1 -
- server/Makefile.am           | 2 +-
- snapper/Makefile.am          | 2 +-
- testsuite-cmp/Makefile.am    | 1 -
- zypp-plugin/Makefile.am      | 1 -
- 6 files changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/dbus/Makefile.am b/dbus/Makefile.am
-index 9c0456a..2078d7d 100644
---- a/dbus/Makefile.am
-+++ b/dbus/Makefile.am
-@@ -15,4 +15,4 @@ libdbus_la_SOURCES =3D					\
- 	DBusMainLoop.cc		DBusMainLoop.h
-=20
- libdbus_la_LIBADD =3D $(DBUS_LIBS)
--libdbus_la_LDFLAGS =3D -lboost_system -lboost_thread
-+libdbus_la_LDFLAGS =3D -lboost_thread
-diff --git a/examples/c++-lib/Makefile.am b/examples/c++-lib/Makefile.am
-index 52c81e5..f55da6f 100644
---- a/examples/c++-lib/Makefile.am
-+++ b/examples/c++-lib/Makefile.am
-@@ -5,7 +5,6 @@
- AM_CPPFLAGS =3D -I$(top_srcdir)
-=20
- LDADD =3D ../../snapper/libsnapper.la
--AM_LDFLAGS =3D -lboost_system
-=20
- noinst_PROGRAMS =3D List ListAll Create CmpDirs CreateNumber CreateTime=
line
-=20
-diff --git a/server/Makefile.am b/server/Makefile.am
-index c03f373..1aef916 100644
---- a/server/Makefile.am
-+++ b/server/Makefile.am
-@@ -16,4 +16,4 @@ snapperd_SOURCES =3D					\
- 	FilesTransferTask.cc	FilesTransferTask.h
-=20
- snapperd_LDADD =3D ../snapper/libsnapper.la ../dbus/libdbus.la -lrt
--snapperd_LDFLAGS =3D -lboost_system -lboost_thread -lpthread
-+snapperd_LDFLAGS =3D -lboost_thread -lpthread
-diff --git a/snapper/Makefile.am b/snapper/Makefile.am
-index b0fe55c..d75599f 100644
---- a/snapper/Makefile.am
-+++ b/snapper/Makefile.am
-@@ -71,7 +71,7 @@ endif
-=20
- libsnapper_la_CPPFLAGS =3D $(XML2_CFLAGS) $(ZLIB_CFLAGS)
- libsnapper_la_LDFLAGS =3D -version-info @LIBVERSION_INFO@
--libsnapper_la_LIBADD =3D -lboost_thread -lboost_system $(XML2_LIBS) -la=
cl $(ZLIB_LIBS)
-+libsnapper_la_LIBADD =3D -lboost_thread $(XML2_LIBS) -lacl $(ZLIB_LIBS)
- if ENABLE_ROLLBACK
- libsnapper_la_LIBADD +=3D -lmount
- endif
-diff --git a/testsuite-cmp/Makefile.am b/testsuite-cmp/Makefile.am
-index 81104bf..555bc3b 100644
---- a/testsuite-cmp/Makefile.am
-+++ b/testsuite-cmp/Makefile.am
-@@ -3,7 +3,6 @@
- #
-=20
- AM_CPPFLAGS =3D -I$(top_srcdir)
--AM_LDFLAGS =3D -lboost_system
-=20
- LDADD =3D ../snapper/libsnapper.la
-=20
-diff --git a/zypp-plugin/Makefile.am b/zypp-plugin/Makefile.am
-index 9d102e0..e395f59 100644
---- a/zypp-plugin/Makefile.am
-+++ b/zypp-plugin/Makefile.am
-@@ -33,7 +33,6 @@ forwarding_zypp_plugin_SOURCES =3D \
- forwarding_zypp_plugin_LDADD =3D \
- 	../snapper/libsnapper.la \
- 	../stomp/libstomp.la \
--	-lboost_system \
- 	-lpthread
-=20
- TESTS =3D solvable-matcher.test
diff --git a/meta-oe/recipes-support/snapper/snapper_0.12.2.bb b/meta-oe/=
recipes-support/snapper/snapper_0.13.0.bb
similarity index 70%
rename from meta-oe/recipes-support/snapper/snapper_0.12.2.bb
rename to meta-oe/recipes-support/snapper/snapper_0.13.0.bb
index 981ca84c13..8b899abfda 100644
--- a/meta-oe/recipes-support/snapper/snapper_0.12.2.bb
+++ b/meta-oe/recipes-support/snapper/snapper_0.13.0.bb
@@ -3,22 +3,20 @@ HOMEPAGE =3D "https://github.com/openSUSE/snapper"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
=20
-DEPENDS =3D "acl boost btrfs-tools dbus e2fsprogs json-c libxml2 lvm2 nc=
urses zlib"
+DEPENDS =3D "acl boost btrfs-tools ${VIRTUAL-RUNTIME_dbus} e2fsprogs jso=
n-c libxml2 lvm2 ncurses zlib"
=20
 # Build separation is slightly broken
-inherit autotools-brokensep pkgconfig gettext
+inherit autotools-brokensep pkgconfig gettext manpages
=20
-SRC_URI =3D "git://github.com/openSUSE/snapper.git;protocol=3Dhttps;bran=
ch=3Dmaster \
-           file://0001-Fix-build-with-boost-1.89.patch \
-          "
-SRCREV =3D "4f3d2b2fc58aefa976668cd25b8eac02ba0f85e7"
+SRC_URI =3D "git://github.com/openSUSE/snapper.git;protocol=3Dhttps;bran=
ch=3Dmaster"
+SRCREV =3D "3a3bd97083976d28538d402284ff947b4aab5b8f"
=20
 EXTRA_OECONF +=3D "--disable-zypp"
=20
-PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'api-documenta=
tion systemd pam', d)}"
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd pam',=
 d)}"
 PACKAGECONFIG[pam] =3D "--enable-pam --with-pam-security=3D${base_libdir=
}/security, --disable-pam,libpam"
 PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd"
-PACKAGECONFIG[api-documentation] =3D "--enable-doc,--disable-doc,libxslt=
-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[manpages] =3D "--enable-doc,--disable-doc,libxslt-native d=
ocbook-xsl-stylesheets-native"
=20
 # Avoid HOSTTOOLS path in binaries
 export DIFF_BIN =3D "${bindir}/diff"
--=20
2.52.0


