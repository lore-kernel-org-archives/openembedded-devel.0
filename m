Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D93C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 11:05:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9671.1639393522512471630
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31D1CD6E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:22 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0AF53F793
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 03:05:21 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/12] gtk+: remove obsolete support for renamed libtool
Date: Mon, 13 Dec 2021 11:05:09 +0000
Message-Id: <20211213110511.3274555-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213110511.3274555-1-ross.burton@arm.com>
References: <20211213110511.3274555-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 11:05:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94323

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gtk+/gtk+/hardcoded_libtool.patch         | 36 -------------------
 meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb    |  1 -
 2 files changed, 37 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/hardcoded_libtool.pat=
ch

diff --git a/meta-oe/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch b/me=
ta-oe/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch
deleted file mode 100644
index 9eb7f6bf5c..0000000000
--- a/meta-oe/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Updated to apply to gtk+-2.24.15
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-Index: gtk+-2.24.31/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gtk+-2.24.31.orig/configure.ac
-+++ gtk+-2.24.31/configure.ac
-@@ -415,7 +415,7 @@ AC_MSG_CHECKING([Whether to write depend
- case $enable_explicit_deps in
-   auto)
-     export SED
--    deplibs_check_method=3D`(./libtool --config; echo 'eval echo \"$dep=
libs_check_method\"') | sh`
-+    deplibs_check_method=3D`(./$host_alias-libtool --config; echo 'eval=
 echo \"$deplibs_check_method\"') | sh`
-     if test "x$deplibs_check_method" '!=3D' xpass_all || test "x$enable=
_static" =3D xyes ; then
-       enable_explicit_deps=3Dyes =20
-     else
-@@ -772,7 +772,7 @@ else
-     dnl Now we check to see if our libtool supports shared lib deps
-     dnl (in a rather ugly way even)
-     if $dynworks; then
--        module_libtool_config=3D"${CONFIG_SHELL-/bin/sh} ./libtool --co=
nfig"
-+        module_libtool_config=3D"${CONFIG_SHELL-/bin/sh} $host_alias-li=
btool --config"
-         module_deplibs_check=3D`$module_libtool_config | \
-             grep '^[[a-z_]]*check[[a-z_]]*_method=3D[['\''"]]' | \
-             sed 's/.*[['\''"]]\(.*\)[['\''"]]$/\1/'`
-@@ -1579,7 +1579,7 @@ fi
- # We are using gmodule-no-export now, but I'm leaving the stripping
- # code in place for now, since pango and atk still require gmodule.
- export SED
--export_dynamic=3D`(./libtool --config; echo eval echo \\$export_dynamic=
_flag_spec) | sh`
-+export_dynamic=3D`($host_alias-libtool --config; echo eval echo \\$expo=
rt_dynamic_flag_spec) | sh`
- if test -n "$export_dynamic"; then
-   GDK_DEP_LIBS=3D`echo $GDK_DEP_LIBS | sed -e "s/$export_dynamic//"`
-   GTK_DEP_LIBS=3D`echo $GTK_DEP_LIBS | sed -e "s/$export_dynamic//"`
diff --git a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb b/meta-oe/recipes=
-gnome/gtk+/gtk+_2.24.33.bb
index ccd82b91f2..082967e04c 100644
--- a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd00=
2f49e7bb854063f7e7 \
                     file://tests/testgtk.c;endline=3D27;md5=3D262db5db5f=
776f9863e56df31423e24c"
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}=
.tar.xz \
            file://xsettings.patch \
-           file://hardcoded_libtool.patch \
            file://toggle-font.diff;striplevel=3D0 \
            file://doc-fixes.patch \
            file://strict-prototypes.patch \
--=20
2.25.1


