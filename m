Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922E6CE8E96
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 16:44:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1206.1729788265049306610
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 09:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BBCC339
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 09:44:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 982423F71E
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 09:44:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] tk: set AUTOTOOLS_SCRIPT_PATH instead of having to mess with S/../
Date: Thu, 24 Oct 2024 17:44:19 +0100
Message-Id: <20241024164419.288686-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 16:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113176

We want to run the configure script in ${S}/unix, so instead of setting
S to BP/unix and then having to use ../ to reach up a level constantly
(including some deep changes to DEBUG_PREFIX_MAP and PSEUDO_IGNORE_PATHS)
we can set S to the top of the source tree as usual and tell autotools
where the configure script is.

This both makes the recipe clearer, and enables tk-src to be generated
correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/tcltk/tk/fix-xft.diff    |  4 +--
 meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb   | 34 ++++++++++---------
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff b/meta-oe/rec=
ipes-devtools/tcltk/tk/fix-xft.diff
index fdf3c66535..c1e2f7344e 100644
--- a/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff
+++ b/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff
@@ -1,7 +1,7 @@
 Upstream-Status: Pending
=20
---- /tmp/configure.in	2010-05-19 13:29:03.000000000 +0200
-+++ unix/configure.in	2010-05-19 13:42:05.000000000 +0200
+--- a/unix/configure.in	2010-05-19 13:29:03.000000000 +0200
++++ b/unix/configure.in	2010-05-19 13:42:05.000000000 +0200
 @@ -526,13 +526,9 @@
  	found_xft=3D"yes"
  	dnl make sure package configurator (xft-config or pkg-config
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb b/meta-oe/recipe=
s-devtools/tcltk/tk_8.6.15.bb
index 8d055c9d11..1438a05625 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
@@ -4,23 +4,23 @@ SECTION =3D "devel/tcltk"
=20
 # http://www.tcl.tk/software/tcltk/license.html
 LICENSE =3D "TCL"
-LIC_FILES_CHKSUM =3D "file://${S}/../license.terms;md5=3Dc88f99decec11af=
a967ad33d314f87fe \
-    file://${S}/../compat/license.terms;md5=3Dc88f99decec11afa967ad33d31=
4f87fe \
-    file://${S}/../doc/license.terms;md5=3Dc88f99decec11afa967ad33d314f8=
7fe \
-    file://${S}/../library/license.terms;md5=3Dc88f99decec11afa967ad33d3=
14f87fe \
-    file://${S}/../macosx/license.terms;md5=3Dc88f99decec11afa967ad33d31=
4f87fe \
-    file://${S}/../tests/license.terms;md5=3Dc88f99decec11afa967ad33d314=
f87fe \
-    file://${S}/../unix/license.terms;md5=3Dc88f99decec11afa967ad33d314f=
87fe \
-    file://${S}/../win/license.terms;md5=3Dc88f99decec11afa967ad33d314f8=
7fe \
-    file://${S}/../xlib/license.terms;md5=3Dc88f99decec11afa967ad33d314f=
87fe \
+LIC_FILES_CHKSUM =3D "file://license.terms;md5=3Dc88f99decec11afa967ad33=
d314f87fe \
+    file://compat/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
+    file://doc/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
+    file://library/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe =
\
+    file://macosx/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
+    file://tests/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
+    file://unix/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
+    file://win/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
+    file://xlib/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
 "
=20
 DEPENDS =3D "tcl virtual/libx11 libxt"
=20
 SRC_URI =3D "\
     ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
-    file://confsearch.diff;striplevel=3D2 \
-    file://tkprivate.diff;striplevel=3D2 \
+    file://confsearch.diff \
+    file://tkprivate.diff \
     file://fix-xft.diff \
 "
=20
@@ -29,17 +29,17 @@ SRC_URI[sha256sum] =3D "550969f35379f952b3020f3ab7b9d=
d5bfd11c1ef7c9b7c6a75f5c49aca
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/tcl/files/Tcl/"
 UPSTREAM_CHECK_REGEX =3D "Tcl/(?P<pver>\d+(\.\d+)+)/"
=20
-S =3D "${WORKDIR}/${BPN}${PV}/unix"
-
-DEBUG_PREFIX_MAP +=3D "-fdebug-prefix-map=3D${S}/../=3D${TARGET_DBGSRC_D=
IR}/.."
-
-PSEUDO_IGNORE_PATHS .=3D ",${WORKDIR}/${BPN}${PV}"
+S =3D "${WORKDIR}/${BPN}${PV}"
=20
 # Short version format: "8.6"
 VER =3D "${@os.path.splitext(d.getVar('PV'))[0]}"
=20
 LDFLAGS +=3D "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
+
 inherit autotools features_check pkgconfig
+
+AUTOTOOLS_SCRIPT_PATH =3D "${S}/unix"
+
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
@@ -49,7 +49,9 @@ EXTRA_OECONF =3D "\
     --with-tcl=3D${STAGING_BINDIR}/crossscripts \
     --libdir=3D${libdir} \
 "
+
 export TK_LIBRARY=3D'${libdir}/tk${VER}'
+
 do_install:append() {
     ln -sf libtk${VER}.so ${D}${libdir}/libtk${VER}.so.0
     oe_libinstall -so libtk${VER} ${D}${libdir}
--=20
2.34.1


