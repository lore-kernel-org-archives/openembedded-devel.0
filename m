Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D67C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 08:19:28 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2794.1788423568013758529
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 01:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=vY8guKBJ;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout02.t-online.de (Postfix) with SMTP id A8203EA88
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 10:19:25 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.36]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x22fK-44btZJ0; Thu, 3 Sep 2026 10:19:22 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/6] gjs: update
Date: Thu,  3 Sep 2026 10:19:12 +0200
Message-ID: <20260903081916.156273-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903081916.156273-1-f_l_k@t-online.de>
References: <20260903081916.156273-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788423563-A9FF89C8-2DD8C199/0/0 CLEAN NORMAL
X-TOI-MSGID: 5e8d14e5-6f05-4090-8d5f-89a4dc314597
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788423565; i=f_l_k@t-online.de;
	bh=zMiN7gZvXxx60xNFjVHieNKR5JZq2L+h+Jv45lgqMbU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=vY8guKBJiOKn0hUInnR1ufUt19G64XEhrpJ+g1WvuJ1GJ9hiPscEBqRxToFMuMZ3M
	 3RXnIFsPsw0C68a6nZPYuydBZrLwf4TDy2tgqf2Ve1GqKPd0OFk9ko8E4xPildV+IT
	 Z4AexzVmpfCua8g8QMN+CBFA3mBquqm1r7b6rFqaB3GTe025ukyB3JlD+KzlRsUd2q
	 HHy/fZnq37LTDlaLEz+UO1PYf/hqAG3w/crd/9CvhP8Ln2MBgR8Tbc6QX5WgeyHgIK
	 1BdwPW6bk4g6AtnLWTOPLQGr1o9Sw6fGo6euyqkuP6qviLOWLB0zELsQjAs9kkOSM7
	 ty48fBqkmPb2w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 08:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129703

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb | 45 ------------------
 meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb | 53 ++++++++++++++++++++++
 2 files changed, 53 insertions(+), 45 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
 create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.84.2.bb
deleted file mode 100644
index 1330342426..0000000000
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY =3D "Javascript bindings for GNOME"
-LICENSE =3D "LGPL-2.0-or-later AND MIT"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8dcea832f6acf45d856abfeb2d51e=
c48"
-
-
-DEPENDS =3D "mozjs-128 cairo"
-
-inherit gnomebase gobject-introspection gettext features_check upstream-=
version-is-even pkgconfig multilib_script
-
-SRC_URI[archive.sha256sum] =3D "35142edf345705636300291ec3a7d583f14969ff=
3fae0ff30f4a95b1e6740166"
-SRC_URI +=3D " \
-    file://0001-Support-cross-builds-a-bit-better.patch \
-    file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.pat=
ch \
-"
-
-# gobject-introspection is mandatory and cannot be configured
-REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
-GIR_MESON_OPTION =3D ""
-
-EXTRA_OEMESON =3D " \
-    -Dinstalled_tests=3Dfalse \
-    -Dskip_dbus_tests=3Dtrue \
-    -Dskip_gtk_tests=3Dtrue \
-"
-
-LDFLAGS:append:mipsarch =3D " -latomic"
-LDFLAGS:append:powerpc =3D " -latomic"
-LDFLAGS:append:powerpc64 =3D " -latomic"
-LDFLAGS:append:riscv32 =3D " -latomic"
-
-FILES:${PN} +=3D "${datadir}/gjs-1.0/lsan"
-
-PACKAGES =3D+ "${PN}-valgrind"
-FILES:${PN}-valgrind =3D "${datadir}/gjs-1.0/valgrind"
-RDEPENDS:${PN}-valgrind +=3D "valgrind"
-
-# Valgrind not yet available on rv32/rv64
-RDEPENDS:${PN}-valgrind:remove:riscv32 =3D "valgrind"
-RDEPENDS:${PN}-valgrind:remove:riscv64 =3D "valgrind"
-
-MULTILIB_SCRIPTS:append =3D "${PN}:${libexecdir}/installed-tests/gjs/GIM=
arshallingTests-1.0.typelib \
-                    ${PN}:${libexecdir}/installed-tests/gjs/Regress-1.0.=
typelib \
-                    ${PN}:${libexecdir}/installed-tests/gjs/Utility-1.0.=
typelib \
-                    ${PN}:${libexecdir}/installed-tests/gjs/WarnLib-1.0.=
typelib \
-                    "
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.88.1.bb
new file mode 100644
index 0000000000..16c8636d84
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb
@@ -0,0 +1,53 @@
+SUMMARY =3D "Javascript bindings for GNOME"
+HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/gjs"
+LICENSE =3D "LGPL-2.0-or-later AND MIT"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8dcea832f6acf45d856abfeb2d51e=
c48"
+
+DEPENDS =3D "mozjs-140 cairo glib-2.0 glib-2.0-native libffi"
+
+inherit meson pkgconfig gettext gobject-introspection features_check
+
+SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)=
}/${BP}.tar.xz;name=3Darchive"
+SRC_URI +=3D "file://0001-Support-cross-builds-a-bit-better.patch"
+SRC_URI +=3D "file://0002-meson.build-Do-not-add-dir-installed-tests-whe=
n-inst.patch"
+SRC_URI[archive.sha256sum] =3D "767bab80e665d672cb00563c25f0b392a9ec8c29=
96ed1d4454c698b4c2f0a3d9"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
+GIR_MESON_OPTION =3D ""
+
+# readline and profiler are meson features with value 'auto' and would o=
therwise
+# be picked up from whatever happens to be in the sysroot.
+PACKAGECONFIG ??=3D "readline"
+PACKAGECONFIG[readline] =3D "-Dreadline=3Denabled,-Dreadline=3Ddisabled,=
readline"
+PACKAGECONFIG[profiler] =3D "-Dprofiler=3Denabled,-Dprofiler=3Ddisabled,=
sysprof"
+
+EXTRA_OEMESON =3D " \
+    -Dinstalled_tests=3Dfalse \
+    -Dskip_dbus_tests=3Dtrue \
+    -Dskip_gtk_tests=3Dtrue \
+    -Ddtrace=3Dfalse \
+    -Dsystemtap=3Dfalse \
+    -Dverbose_logs=3Dfalse \
+    -Dbsymbolic_functions=3Dtrue \
+"
+
+LDFLAGS:append:mipsarch =3D " -latomic"
+LDFLAGS:append:powerpc =3D " -latomic"
+LDFLAGS:append:powerpc64 =3D " -latomic"
+LDFLAGS:append:riscv32 =3D " -latomic"
+
+FILES:${PN} +=3D "${datadir}/gjs-1.0/lsan"
+
+PACKAGES =3D+ "${PN}-valgrind"
+FILES:${PN}-valgrind =3D "${datadir}/gjs-1.0/valgrind"
+RDEPENDS:${PN}-valgrind +=3D "valgrind"
+
+# Valgrind not yet available on rv32/rv64
+RDEPENDS:${PN}-valgrind:remove:riscv32 =3D "valgrind"
+RDEPENDS:${PN}-valgrind:remove:riscv64 =3D "valgrind"
+
+# The GIMarshallingTests/Regress/Utility/WarnLib typelibs that the 1.84 =
recipe
+# listed in MULTILIB_SCRIPTS are no longer produced by the build system.
+
+UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+\.\d*[02468]\.\d+)$"
--=20
2.55.0


